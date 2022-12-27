Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C185C656E7D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 21:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0358910E10F;
	Tue, 27 Dec 2022 20:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9F010E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wfd5XWBruXey7sIyvnWTP1rheikoyebYDX9aJlnZZlY=; b=TLdoKOS3p5ccswTi6eCAUjkLMh
 0kL7y/iLScoIcCJXuAPEeEbSUl/1G15It6/EAnHSZb1a03RHygUHzogpT5HgY6zuDDHOf2L/R/XIH
 9U2b10WnsJgv//F0GdECRwsA3YI72puFI3h7QHK6RONAoiXD4Tn1Cn3rFlNr6ibhECP2LHRZgSIb8
 xrXzkpVqgu0iCE8BkIw36ftw3Mj6gCj/m661xep1dSKOaWeFtwIO57QQdh8UgemX0YIuYLIF65FrY
 T+wZO8+xPxopxV5UP0TWZ81nZOYaaXkuZ5X4GO4ix1IEAIACerqZUm7sL27KE02uTJTUHXFRtE0wT
 Gu06CDjQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pAG7x-00BLNy-PL; Tue, 27 Dec 2022 21:00:46 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/v3d: replace open-coded implementation of
 drm_gem_object_lookup
Date: Tue, 27 Dec 2022 17:00:11 -0300
Message-Id: <20221227200010.191351-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As v3d_submit_tfu_ioctl() performs the same steps as drm_gem_object_lookup(),
replace the open-code implementation in v3d with its DRM core equivalent.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 6e152ef26358..5da1806f3969 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -861,7 +861,6 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 
 	job->args = *args;
 
-	spin_lock(&file_priv->table_lock);
 	for (job->base.bo_count = 0;
 	     job->base.bo_count < ARRAY_SIZE(args->bo_handles);
 	     job->base.bo_count++) {
@@ -870,20 +869,16 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		if (!args->bo_handles[job->base.bo_count])
 			break;
 
-		bo = idr_find(&file_priv->object_idr,
-			      args->bo_handles[job->base.bo_count]);
+		bo = drm_gem_object_lookup(file_priv, args->bo_handles[job->base.bo_count]);
 		if (!bo) {
 			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
 				  job->base.bo_count,
 				  args->bo_handles[job->base.bo_count]);
 			ret = -ENOENT;
-			spin_unlock(&file_priv->table_lock);
 			goto fail;
 		}
-		drm_gem_object_get(bo);
 		job->base.bo[job->base.bo_count] = bo;
 	}
-	spin_unlock(&file_priv->table_lock);
 
 	ret = v3d_lock_bo_reservations(&job->base, &acquire_ctx);
 	if (ret)
-- 
2.38.1

