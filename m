Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BA930A6F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 16:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F98310E04F;
	Sun, 14 Jul 2024 14:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="foH/oXHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02C10E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rxHJzhhWWF19thBVT+Q9Fks8oCFjYNtn5pXV8bqdtfE=; b=foH/oXHwgygzJVnr2Vl9ikwDi9
 efkjzVrHo4o2AH6gNuVZk6JI7lIBZPzeXNDeAqxiP1aMC7AhMiD9l+9lh183X2Lotg4V7kNKcm8JZ
 r/pFPJaXxJkt96+VnTShVtsMJkxvz0IR+OTVzTaZlVnKYAl1l1EWBuLFdii8eEbyz9utf8u0uwiVG
 oF5Xu8sf0TFqtoKXMEPR15ODQfuPQrDX1m6+xvOHh38Lf7FtN9LWP7pzmN8eC+a/zeD5eq0u/f2g+
 vv4I/Y7mFs9c6B+np4zOyNLFPUm4SiabVMfD2Zx6143dwwXAjzNAcNaY+h3FVjaH7uP+yPULtEDeA
 dbJXRcFw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sT0bG-00F4qu-Hu; Sun, 14 Jul 2024 16:53:19 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 =?UTF-8?q?Alejandro=20Pi=C3=B1eiro?= <apinheiro@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/2] drm/v3d: Fix Indirect Dispatch configuration for V3D
 7.1.6 and later
Date: Sun, 14 Jul 2024 11:49:12 -0300
Message-ID: <20240714145243.1223131-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240714145243.1223131-1-mcanal@igalia.com>
References: <20240714145243.1223131-1-mcanal@igalia.com>
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

`args->cfg[4]` is configured in Indirect Dispatch using the number of
batches. Currently, for all V3D tech versions, `args->cfg[4]` equals the
number of batches subtracted by 1. But, for V3D 7.1.6 and later, we must not
subtract 1 from the number of batches.

Implement the fix by checking the V3D tech version and revision.

Fixes several `dEQP-VK.synchronization*` CTS tests related to Indirect Dispatch.

Fixes: 18b8413b25b7 ("drm/v3d: Create a CPU job extension for a indirect CSD job")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index d193072703f3..cafa3a298c11 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -353,7 +353,8 @@ v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
 	struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
 	struct v3d_bo *indirect = to_v3d_bo(indirect_csd->indirect);
 	struct drm_v3d_submit_csd *args = &indirect_csd->job->args;
-	u32 *wg_counts;
+	struct v3d_dev *v3d = job->base.v3d;
+	u32 num_batches, *wg_counts;
 
 	v3d_get_bo_vaddr(bo);
 	v3d_get_bo_vaddr(indirect);
@@ -366,8 +367,17 @@ v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
 	args->cfg[0] = wg_counts[0] << V3D_CSD_CFG012_WG_COUNT_SHIFT;
 	args->cfg[1] = wg_counts[1] << V3D_CSD_CFG012_WG_COUNT_SHIFT;
 	args->cfg[2] = wg_counts[2] << V3D_CSD_CFG012_WG_COUNT_SHIFT;
-	args->cfg[4] = DIV_ROUND_UP(indirect_csd->wg_size, 16) *
-		       (wg_counts[0] * wg_counts[1] * wg_counts[2]) - 1;
+
+	num_batches = DIV_ROUND_UP(indirect_csd->wg_size, 16) *
+		      (wg_counts[0] * wg_counts[1] * wg_counts[2]);
+
+	/* V3D 7.1.6 and later don't subtract 1 from the number of batches */
+	if (v3d->ver < 71 || (v3d->ver == 71 && v3d->rev < 6))
+		args->cfg[4] = num_batches - 1;
+	else
+		args->cfg[4] = num_batches;
+
+	WARN_ON(args->cfg[4] == ~0);
 
 	for (int i = 0; i < 3; i++) {
 		/* 0xffffffff indicates that the uniform rewrite is not needed */
-- 
2.45.2

