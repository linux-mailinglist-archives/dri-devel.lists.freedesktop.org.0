Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBD58979D2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 22:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B2F112ED6;
	Wed,  3 Apr 2024 20:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="c87JxW5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB6112ED1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W6xVXJKt2gE4qNuqUuOkal+tgGYPKKrXT9d5sDIi9AM=; b=c87JxW5ymE4DxMrvSn0gYY175/
 2nHcLFAx2HziOGfR3zprmM4FAkSjVFbmvmqTwh4tp06smQIFeoAgjpSZszHzWqHDUdMtGuWU2ot82
 pSsidq32UlCJiOHsjAiCcoj0XADc1x2YnDowPmTr/uZx+PE6jRZr549l8Ire19Ac0HECsdNw6oiAW
 nLqQI9rCfcWAbreMMN5B6moWz85p80EnOt584bdBXhA7bKMl5EvFARq6JSdB1t5+sC4DjtzQ6FK3b
 qXSkd7w1RiEuHpe4RFLsFJg1r1nGUpJ2pIE7UDAG05ctxUvv4GTLPeA17DavoP5fRTjOYgZbiFrsw
 BwKQ+hAQ==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rs7Kt-00124v-UG; Wed, 03 Apr 2024 22:35:56 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 1/5] drm/v3d: Don't increment `enabled_ns` twice
Date: Wed,  3 Apr 2024 17:24:50 -0300
Message-ID: <20240403203517.731876-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403203517.731876-1-mcanal@igalia.com>
References: <20240403203517.731876-1-mcanal@igalia.com>
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

The commit 509433d8146c ("drm/v3d: Expose the total GPU usage stats on sysfs")
introduced the calculation of global GPU stats. For the regards, it used
the already existing infrastructure provided by commit 09a93cc4f7d1 ("drm/v3d:
Implement show_fdinfo() callback for GPU usage stats"). While adding
global GPU stats calculation ability, the author forgot to delete the
existing one.

Currently, the value of `enabled_ns` is incremented twice by the end of
the job, when it should be added just once. Therefore, delete the
leftovers from commit 509433d8146c ("drm/v3d: Expose the total GPU usage
stats on sysfs").

Fixes: 509433d8146c ("drm/v3d: Expose the total GPU usage stats on sysfs")
Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 2e04f6cb661e..ce6b2fb341d1 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -105,7 +105,6 @@ v3d_irq(int irq, void *arg)
 		struct v3d_file_priv *file = v3d->bin_job->base.file->driver_priv;
 		u64 runtime = local_clock() - file->start_ns[V3D_BIN];
 
-		file->enabled_ns[V3D_BIN] += local_clock() - file->start_ns[V3D_BIN];
 		file->jobs_sent[V3D_BIN]++;
 		v3d->queue[V3D_BIN].jobs_sent++;
 
@@ -126,7 +125,6 @@ v3d_irq(int irq, void *arg)
 		struct v3d_file_priv *file = v3d->render_job->base.file->driver_priv;
 		u64 runtime = local_clock() - file->start_ns[V3D_RENDER];
 
-		file->enabled_ns[V3D_RENDER] += local_clock() - file->start_ns[V3D_RENDER];
 		file->jobs_sent[V3D_RENDER]++;
 		v3d->queue[V3D_RENDER].jobs_sent++;
 
@@ -147,7 +145,6 @@ v3d_irq(int irq, void *arg)
 		struct v3d_file_priv *file = v3d->csd_job->base.file->driver_priv;
 		u64 runtime = local_clock() - file->start_ns[V3D_CSD];
 
-		file->enabled_ns[V3D_CSD] += local_clock() - file->start_ns[V3D_CSD];
 		file->jobs_sent[V3D_CSD]++;
 		v3d->queue[V3D_CSD].jobs_sent++;
 
@@ -195,7 +192,6 @@ v3d_hub_irq(int irq, void *arg)
 		struct v3d_file_priv *file = v3d->tfu_job->base.file->driver_priv;
 		u64 runtime = local_clock() - file->start_ns[V3D_TFU];
 
-		file->enabled_ns[V3D_TFU] += local_clock() - file->start_ns[V3D_TFU];
 		file->jobs_sent[V3D_TFU]++;
 		v3d->queue[V3D_TFU].jobs_sent++;
 
-- 
2.44.0

