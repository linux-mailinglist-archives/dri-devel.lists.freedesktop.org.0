Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FA7EE7E0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B41610E6B9;
	Thu, 16 Nov 2023 19:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56E10E6B6;
 Thu, 16 Nov 2023 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uc6mKqfpmdF2oGWjHT21oleIk7qbbWS4FapoV9c6eaM=; b=PwblwnFz4j5BsxvDRDU/luZ6GX
 trSfzvHUB3V01B0+aHw+8MdgoTQsmt7KWJYLlNXSoZ2qeV27wFXdmIocyG9e2176HHICIwOQqVHCV
 3zU8W2tMKbUULiwGS97k9zoCRcDUcE753nSv4xhYXf8O7760lZwHpYqenwZrqp7otrO5Es2byFgvY
 mYG0h3VZjZyIUpEXyBWSKylSB2HjDW4MJxB5wTON5kwCF+yLa7rYWLWhJEM6UFhPFmoXZH6ezKlUs
 HkRPuilvp+wSH/RIZf6DeOBLl/0Z0hrYVelTqOhoKV6HWXxYWjHXvfeahYVmjt8jiqhQoXNEJBtny
 sVNiKItw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVw-0048Yy-J5; Thu, 16 Nov 2023 20:59:00 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 20/32] drm/amd/display: reject atomic commit if setting
 both plane and CRTC degamma
Date: Thu, 16 Nov 2023 18:58:00 -0100
Message-Id: <20231116195812.906115-21-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DC only has pre-blending degamma caps (plane/DPP) that is currently in
use for CRTC/post-blending degamma, so that we don't have HW caps to
perform plane and CRTC degamma at the same time. Reject atomic updates
when serspace sets both plane and CRTC degamma properties.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 13117516f2a4..8fc715fa426c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -944,9 +944,20 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
 	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
-	if (ret != -EINVAL)
+	if (ret == -ENOMEM)
 		return ret;
 
+	/* We only have one degamma block available (pre-blending) for the
+	 * whole color correction pipeline, so that we can't actually perform
+	 * plane and CRTC degamma at the same time. Explicitly reject atomic
+	 * updates when userspace sets both plane and CRTC degamma properties.
+	 */
+	if (has_crtc_cm_degamma && ret != -EINVAL){
+		drm_dbg_kms(crtc->base.crtc->dev,
+			    "doesn't support plane and CRTC degamma at the same time\n");
+			return -EINVAL;
+	}
+
 	/* If we are here, it means we don't have plane degamma settings, check
 	 * if we have CRTC degamma waiting for mapping to pre-blending degamma
 	 * block
-- 
2.40.1

