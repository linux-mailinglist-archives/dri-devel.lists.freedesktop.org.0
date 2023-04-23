Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2D6EC035
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B40D10E419;
	Sun, 23 Apr 2023 14:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0502A10E417;
 Sun, 23 Apr 2023 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cUSOYLuQjdiS9Ja6dEexWHo4C4Y5Ft7LRX3bN1lCnPA=; b=Hb2Dt82V6RFUBwoDi4OOl2AXD6
 W25R+uc2mmPiqDDZdhT/qjdm9B2ExG7lHDc6ZSDHhEriZSu1Hsdenn/F1dLW+OC9hKfOa3L5l2pRD
 EzRoTJFneYRBuQu7Ltjmch4nxIhf7CK45/fBxGFI6GZTcrxJdVfAu9hiTth+25f4hinBoq+ezULAL
 1LdBNRSzQtdELh+smst/0SliQMRLRYFhkmxtInCi8O0dj8vuhiI8VFXjszCZdBRxp7RolpA3g56UY
 9t8/UqwevdkKIyOWXG1A4Z8kyizgGLVLeB8gvORC8dxiI3jCdDDrU02Zntxg7V2zZL9pK20gzt2gM
 BdVYLpOA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTb-00ANVs-JK; Sun, 23 Apr 2023 16:14:03 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 37/40] drm/amd/display: handle empty LUTs in __set_input_tf
Date: Sun, 23 Apr 2023 13:10:49 -0100
Message-Id: <20230423141051.702990-38-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Unlike degamma, blend gamma doesn't support hardcoded curve
(predefined/ROM), but we can use AMD color module to fill blend gamma
parameters when we have non-linear plane gamma TF without plane gamma
LUT. The regular degamma path doesn't hit this.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index e17141fc8d12..baa7fea9ebae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -349,21 +349,26 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	struct dc_gamma *gamma = NULL;
 	bool res;
 
-	gamma = dc_create_gamma();
-	if (!gamma)
-		return -ENOMEM;
+	if (lut_size) {
+		gamma = dc_create_gamma();
+		if (!gamma)
+			return -ENOMEM;
 
-	gamma->type = GAMMA_CUSTOM;
-	gamma->num_entries = lut_size;
+		gamma->type = GAMMA_CUSTOM;
+		gamma->num_entries = lut_size;
 
-	__drm_lut_to_dc_gamma(lut, gamma, false);
+		__drm_lut_to_dc_gamma(lut, gamma, false);
+	}
 
-	res = mod_color_calculate_degamma_params(NULL, func, gamma, true);
-	dc_gamma_release(&gamma);
+	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
+
+	if (gamma)
+		dc_gamma_release(&gamma);
 
 	return res ? 0 : -ENOMEM;
 }
 
+
 #ifdef CONFIG_STEAM_DECK
 static enum dc_transfer_func_predefined drm_tf_to_dc_tf(enum drm_transfer_function drm_tf)
 {
-- 
2.39.2

