Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409807ADFE9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3F10E2F1;
	Mon, 25 Sep 2023 19:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACE910E2E7;
 Mon, 25 Sep 2023 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fdill45LtzRLhcByloKed2r+d5Blcq2BbyxQ3l5hml8=; b=FM4vf7lQvHLCtp9K1fteNdrQQP
 a9Pw66yVjiu/7rG3KEez0Tt6MbPk0ZQB4/GbxaJVd4/4tFKv7d3J+J9Fw5drlZpnt2y4zURbgOwBZ
 bm53y1fB2x6ielTp9aiSCkeuie2P63xU+Fdsxd5nujF5DeePFDoJXwNTHSm3eUMWxBwyMvEnlfooA
 O8vBaACEhfmjf1aEeIWJqw4WZonUikdr5/6NOFNyFJ5Tg/xSNF91Rieec+9mocm9swiqWlMtlozWk
 efmIq8RF/MtKJb+Ke/vUiKDnuYgkBh7Jnidd97c2VbL6fglcNZxByv+XphO9PSflx39VInP4v5Djo
 T2TZ3evw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkrat-008GsG-QP; Mon, 25 Sep 2023 21:50:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 16/32] drm/amd/display: set sdr_ref_white_level to 80 for
 out_transfer_func
Date: Mon, 25 Sep 2023 18:49:16 -0100
Message-Id: <20230925194932.1329483-17-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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

Otherwise this is just initialized to 0. This needs to actually have a
value so that compute_curve can work for PQ EOTF.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0fe2f76193ee..9d09a62645b9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -72,6 +72,7 @@
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
+#define SDR_WHITE_LEVEL_INIT_VALUE 80
 
 /**
  * amdgpu_dm_init_color_mod - Initialize the color module.
@@ -523,6 +524,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 		 */
 		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
 		out_tf->tf = tf;
+		out_tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 
 		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
 	} else {
-- 
2.40.1

