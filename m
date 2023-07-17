Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816BD755C1D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA2F10E1E3;
	Mon, 17 Jul 2023 06:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FCD10E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:53:22 +0000 (UTC)
Received: from workpc.. (109-252-154-2.dynamic.spd-mgts.ru [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A750B6606FC8;
 Mon, 17 Jul 2023 07:53:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689576801;
 bh=Qg+dZVqpBhB0tdjxJjayctf5oTh5j/Q35LZHB4aWX3g=;
 h=From:To:Cc:Subject:Date:From;
 b=iZCsocr3wv7hB+yJWmF5hTomJIme07DhhvIYvcWqMPVFNTRfCvx+YawXBboyyFpFl
 kV0xjtcCRFxBVRJ8XxGlq8Hiku6EAqGbr9Lke5lvFDLJu6HqIQkZvUfoGS5Fn3Mtt4
 XK3kjvcWufScXyyxCNdoN/CVhwj8S177fpdX8BcCOEbUObGnXzz2jGOM3s7jPc+Sis
 CuuTwV4hUItmkcoFy+R5eVmp0KSao32sNs4nObbZNh8ZYO87AxOz/vB+lkl3aQ44bs
 o48Lk9r83tPm9gwer4C91W/rvFdz6KDngH8OFlWdrKHBZ2t6hPMqRg+9l76o9HfQI6
 +RI+c4gAN6NkQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v1] drm/panfrost: Sync IRQ by job's timeout handler
Date: Mon, 17 Jul 2023 09:52:54 +0300
Message-ID: <20230717065254.1061033-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panfrost IRQ handler may stuck for a long time, for example this happens
when there is a bad HDMI connection and HDMI handler takes a long time to
finish processing, holding Panfrost. Make Panfrost's job timeout handler
to sync IRQ before checking fence signal status in order to prevent
spurious job timeouts due to a slow IRQ processing.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..a356163da22d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -713,6 +713,8 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	struct panfrost_device *pfdev = job->pfdev;
 	int js = panfrost_job_get_slot(job);
 
+	synchronize_irq(pfdev->js->irq);
+
 	/*
 	 * If the GPU managed to complete this jobs fence, the timeout is
 	 * spurious. Bail out.
-- 
2.41.0

