Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3A777D77
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B510E5B0;
	Thu, 10 Aug 2023 16:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CAA10E59C;
 Thu, 10 Aug 2023 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yihuxHBV+g9axyR/xTXUOWNxZvnA2KOoauyFvn8HnIA=; b=degDQUXNrS27ScPHvVWrEef+Ka
 8oWWI2o/Uc3YGBnnp4oHfbfiwXFHBWsOAxWg47+4xLg5HLnaIDz5S2ivaIuAwmRLMHeMgclnwVQPm
 l/AXvQhfRMOCZhvqvREYRH/Vl4FAYHWrJgYC6bhFys4Ud2p394CQXZ3KVnXU9wz1ODYUUoDeWdT5S
 F0EE00hnqiWo1wbOHIS2cSePvSFJvOAvEAWrCa/kd6PAIAk/0olJWtFzef5BthHj5cq0Dq84I+a1H
 EwAPg/PGGfrODAdBsFkUarJjU0SnGDMN3RB0+42ElSmZ3so7PFkeMS7VaDRdpeZvvH0y1uj6sj/8w
 Ic5mRptA==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU892-00GjYD-JE; Thu, 10 Aug 2023 18:04:16 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 27/34] drm/amd/display: handle empty LUTs in __set_input_tf
Date: Thu, 10 Aug 2023 15:03:07 -0100
Message-Id: <20230810160314.48225-28-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
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
index 58c4797f506e..2c96501d2fc0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -551,17 +551,21 @@ static int __set_input_tf(struct dc_transfer_func *func,
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

