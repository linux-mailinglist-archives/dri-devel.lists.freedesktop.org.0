Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FF99DA37
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 01:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252010E4E2;
	Mon, 14 Oct 2024 23:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="k8FYe19t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6DE10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 23:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728949122; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Trc2Idtro993SdRiJRRsUWAruhN7ksIL40EcnC6SDLrSpXBqDVOeorjuq2bG1I7FDfKiaxdpHUsy535a5f3dDtd3NX4j6xhEn2pjj7iW52ahmk1fD6l5qRzH8yOxjYWfc/HLr+nzESWBKb6R6otmTh4iNsxgTQb6VJgFvEJUXh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728949122;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mCtIoUK67xJwWEiLaC1u8aGeTl4l8YjZQ3chLiNR3Jk=; 
 b=eoeQYuz+/MLbddeSpUJvWELHMBc8o/owJoyIElRyWZyP3q8fRGeq8vo9BRz15vqZcN/kWELrGR8dQQ6k1J7kaW/NocYiBAKHeYSNS5TZytnP2Y3qpfxb66LpP8zNj2nUbl+8efxm0rAfH2uCOrko5aYMvO+XSuRc7uOYNnqGRKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728949122; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mCtIoUK67xJwWEiLaC1u8aGeTl4l8YjZQ3chLiNR3Jk=;
 b=k8FYe19tXvTaMmdqF2Cm7Vc1qG3gHI1JOzT2F69SJlhaZZg2uR6JiB2Ag7YpqnIU
 n7m+2evjCR2d+IWsX65RZnZ2EYeoKmuC8m1P9abWRkREPGVgfxLDkKEv0T3MlAYabR+
 SNa62h98ReFoe2t26sELg9HFj1keh72dfL8mR9ng=
Received: by mx.zohomail.com with SMTPS id 1728949121244283.00947506086504;
 Mon, 14 Oct 2024 16:38:41 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 9/9] drm/panfrost: Explicitly clean up panfrost fence
Date: Tue, 15 Oct 2024 00:31:44 +0100
Message-ID: <20241014233758.994861-9-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014233758.994861-1-adrian.larumbe@collabora.com>
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doesn't make any functional difference because generic dma_fence is the
first panfrost_fence structure member, but I guess it doesn't hurt either.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5d83c6a148ec..fa219f719bdc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -85,9 +85,15 @@ static const char *panfrost_fence_get_timeline_name(struct dma_fence *fence)
 	}
 }
 
+static void panfrost_fence_release(struct dma_fence *fence)
+{
+	kfree(to_panfrost_fence(fence));
+}
+
 static const struct dma_fence_ops panfrost_fence_ops = {
 	.get_driver_name = panfrost_fence_get_driver_name,
 	.get_timeline_name = panfrost_fence_get_timeline_name,
+	.release = panfrost_fence_release,
 };
 
 static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, int js_num)
-- 
2.46.2

