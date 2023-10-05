Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA167BA7AD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB1C10E464;
	Thu,  5 Oct 2023 17:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3609B10E43E;
 Thu,  5 Oct 2023 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L923nKY8szqOvQR0AEtsVRudRcyIwU/ZI25VbAN5gCc=; b=T2lV6n1dw55SxGa9Hee3vu1mjX
 E/I59VZz6TZWn7EqN1n8QcHelPh60cz8uI+2l/77L7GaMoZx+BnI8nSHVCsdjy9iR8xHfAvS8onbS
 /hFAjZ/qzjRV+stJSQpyvXwW6QfXSB86w7E6aXmMI7ETgOEDOsz3I+JcoMCeFtYNTDceC/u9smXJt
 7hWb0CtY6EIH32PwbRSz0Py1IU8yf+JgyKSEvhUiEJsRmVXTCIGQipRYhHZ/z8b+85FcEBFw55UTE
 47/9nMlGfZlbx8xQupQedAEEuyD+LfLei0VLEbXQmKYtfgD2bKABBOL048dq5YoMry+ppWZAbudD8
 1YqfiY0g==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRxa-00CFJN-6k; Thu, 05 Oct 2023 19:16:26 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 26/32] drm/amd/display: handle empty LUTs in __set_input_tf
Date: Thu,  5 Oct 2023 16:15:21 -0100
Message-Id: <20231005171527.203657-27-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005171527.203657-1-mwen@igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Unlike degamma, blend gamma doesn't support hardcoded curve
(predefined/ROM), but we can use AMD color module to fill blend gamma
parameters when we have non-linear plane gamma TF without plane gamma
LUT. The regular degamma path doesn't hit this.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 9c38291c42a2..25e9aa147e00 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -577,17 +577,21 @@ static int __set_input_tf(struct dc_transfer_func *func,
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
-- 
2.40.1

