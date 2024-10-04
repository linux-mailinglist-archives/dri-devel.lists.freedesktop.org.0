Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E5990323
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 14:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8A210E2A4;
	Fri,  4 Oct 2024 12:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dBx7Rgpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880C510E2A4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HiIBNMD6TqVy+kHGZBrc2oBb5wvJoYl+UJqHMRj5e1w=; b=dBx7RgpziMT3VQ7Lg6AsBWPwv7
 dAtzJfsiE4uCZfk0FJ5XV7+Up/b6GzMLKSNszInb+y4df1zrenmU1gklW5I1nT38BDm0mi1xFuFE0
 bSKChhwl2qDIqv7+km51XX1Jqh0418neo0vfM+zGx6H+ui3hO7AdQV28hOounLNiSO16AEBsYR6G1
 oQWK9upXQpWHcLX2rLS4g0IdbJWnryI4sLUokcRh3UYykDakD5R50ZcPLVbnkQDvR6axxG8AShDi8
 H4E2YPzsBci/Edb7Spbn0uKYFSQ/z/KPFzExi+gQx9anbDoomDVS/Qc7WQMX0s2DxUk4eRNP51BP7
 LSpbPZ3w==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1swha2-004phG-3c; Fri, 04 Oct 2024 14:38:46 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Juan A . Suarez Romero" <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Christian Gmeiner <cgmeiner@igalia.com>
Subject: [PATCH 1/2] drm/vc4: Use `vc4_perfmon_find()`
Date: Fri,  4 Oct 2024 09:35:59 -0300
Message-ID: <20241004123817.890016-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
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

Similar to commit f2a4bcb25328 ("drm/v3d: Use v3d_perfmon_find()"),
replace the open-coded `vc4_perfmon_find()` with the real thing.

Cc: Christian Gmeiner <cgmeiner@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 4cd3643c3ba7..f2e56d0f6298 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -236,11 +236,7 @@ int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	mutex_lock(&vc4file->perfmon.lock);
-	perfmon = idr_find(&vc4file->perfmon.idr, req->id);
-	vc4_perfmon_get(perfmon);
-	mutex_unlock(&vc4file->perfmon.lock);
-
+	perfmon = vc4_perfmon_find(vc4file, req->id);
 	if (!perfmon)
 		return -EINVAL;
 
-- 
2.46.2

