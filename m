Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60677CB05CF
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 16:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8966E10E1E1;
	Tue,  9 Dec 2025 15:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="itUy6Ned";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EDC10E1DC;
 Tue,  9 Dec 2025 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hnJsldj2SDPoinSUD+o5RqKKzNiVKlXUgCS0EsQIy/8=; b=itUy6NedwPMvZOXpTTWHiaHBLl
 +vzBWcFhgO/vcxLST8dAEU7Glc0n7fOngS0jWVJqIvmBYXQiDC2nIDPxDFr+KrsHTKlTB6FeZFV4Q
 oDKN6hd8gP9K0NXoTI5kHLFnyqs1Lztlebsw9OjmqisNyIOX73JEHqwJKVitk1oN6r/xT0V0nRQ/M
 jFqA8hJAIuMSOKOx1EM3exNDC1uwMdaWksivvmUY4DnBOIyw1NrQ1oY5tQDrKacYveT175eWqX84j
 6uPJUfH1am4dAu494pUKfI9yh1gWujI2eQB32qdYDX2nOBOYbzXDAtZM6MfkNwh00TAfMQvroq1cN
 U5f007XQ==;
Received: from [186.208.73.250] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSzMM-00AYiA-BW; Tue, 09 Dec 2025 16:10:38 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: expose plane blend LUT in HW with MCM
Date: Tue,  9 Dec 2025 12:09:06 -0300
Message-ID: <20251209151032.91738-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 39923050615cd ("drm/amd/display: Clear DPP 3DLUT Cap")
there is a flag in the mpc_color_caps that indicates the pre-blend usage
of MPC color caps. Do the same as commit a0c3e8bfbab6 ("drm/amd/display:
Use mpc.preblend flag to indicate preblend") and use the mpc.preblend
flag to expose plane blend LUT/TF properties on AMD display driver.

CC: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 56cb866ac6f8..b15f0cf86008 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1649,7 +1649,7 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
 					   MAX_COLOR_3DLUT_SIZE);
 	}
 
-	if (dpp_color_caps.ogam_ram) {
+	if (dpp_color_caps.ogam_ram || dm->dc->caps.color.mpc.preblend) {
 		drm_object_attach_property(&plane->base,
 					   mode_info.plane_blend_lut_property, 0);
 		drm_object_attach_property(&plane->base,
-- 
2.51.0

