Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB369BC28
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED5510E565;
	Sat, 18 Feb 2023 21:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0415110E095;
 Sat, 18 Feb 2023 21:15:57 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 pw17-20020a17090b279100b00236a0d55d3aso1883714pjb.3; 
 Sat, 18 Feb 2023 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYIkCiW1P3MTuGNaXnYInZXOL6oL98BTswmIrYI3+hc=;
 b=eQ/2i4WtARuumdk6wu3UFqAW69ZW8h3tfauASKVW6UiPkF3AV+YCLi3IsnRxxMwg0g
 CUIDHLV4BZqXknqttTtk+bXdQ6ljF08ejS9/UaWYQhGdaghr+KWH/71gNpnwDfzQ/UH5
 nBW8tWukaXtSxhoyOsYUBlBageDHZMcz+vUTvBGG9/D5e4fM1azL9Vg9cP2p+UYvndt2
 AHl5A36OpTJ8bpk7MfIg49zDicp0C2GaVHxplb2BU6oIc7LsUP5oMXTq3g1kIWHJce+H
 XGKorRr6oiJXunUlrDyMsUxILj9/VBJnJZI1d9zF9ycS3uV11lNRCp0g7026hwsHpCwE
 JhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RYIkCiW1P3MTuGNaXnYInZXOL6oL98BTswmIrYI3+hc=;
 b=yg+TMVgHhhQO3PTc4InGV+z4D1CmyogmUFgCAT/EonatiXizGBsqQ4uyvtNNSOOMtQ
 fLVgjo+nysKJcrIlzg8sOvBHWEpkBun+SNZRhWbR2MVQP0/v1Ii+qJEto/a9CNGD1x6x
 ohx+soMIji4ZIfEmwpcst1QjKOlIuFhTuGHQBLpYaGeYzC0hekKDSpfI5V4zXsX6pnHk
 X/aAT5SOhKpt++6dqmiBdWKqipnuHVyW6O0i9Qy5uFDNd4XpU3bLOAFSm7LISuOljHXh
 m3Twz9NSehoSPwRw+u1/IScXRZX+VNT6rVCjmyqET2dN97Hmy/t1pfTV5UrdEW3DWx1B
 Me/w==
X-Gm-Message-State: AO0yUKVdEO9Pmxi4zHJy0G7MNqSNyNYP//yG6DhG4fG+DW9pB+Rcn2rr
 Wp4mYxNfcrxhZ1iHoE6kCjbqm2hYWeo=
X-Google-Smtp-Source: AK7set+6yJ/VIDgvzJ07sbwRoyqtX5Z4gVUluKE0+5jQloSvZWFq8eCN7xusPVn+H7cDq6VHJfZzWQ==
X-Received: by 2002:a17:902:8504:b0:199:30a6:376c with SMTP id
 bj4-20020a170902850400b0019930a6376cmr3106041plb.68.1676754956327; 
 Sat, 18 Feb 2023 13:15:56 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902eecc00b0019a96871e09sm5072653plb.211.2023.02.18.13.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:15:55 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Date: Sat, 18 Feb 2023 13:15:49 -0800
Message-Id: <20230218211608.1630586-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
wait (as opposed to a "housekeeping" wait to know when to cleanup after
some work has completed).  Usermode components of GPU driver stacks
often poll() on fence fd's to know when it is safe to do things like
free or reuse a buffer, but they can also poll() on a fence fd when
waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
lets the kernel differentiate these two cases.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sync_file.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index fb6ca1032885..c30b2085ee0a 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
 {
 	struct sync_file *sync_file = file->private_data;
 
+	/*
+	 * The POLLPRI/EPOLLPRI flag can be used to signal that
+	 * userspace wants the fence to signal ASAP, express this
+	 * as an immediate deadline.
+	 */
+	if (poll_requested_events(wait) & EPOLLPRI)
+		dma_fence_set_deadline(sync_file->fence, ktime_get());
+
 	poll_wait(file, &sync_file->wq, wait);
 
 	if (list_empty(&sync_file->cb.node) &&
-- 
2.39.1

