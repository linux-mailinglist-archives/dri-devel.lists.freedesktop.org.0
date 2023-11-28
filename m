Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E597FC0E1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1975B10E5A5;
	Tue, 28 Nov 2023 17:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9F710E2FD;
 Tue, 28 Nov 2023 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UYZx21RTX++vPQDosUmIIj9JboXZ0cIUP1giN/Xt2YM=; b=czxC3tjU4oRKTojiavvHvgvgQ0
 kNQcE+wiYFr4o7zoNParYCfB9KKSlqnZxIiGtt1SJmW7ptdXS6eLHR/zWIn4GHa6m0D/XX66W7VHJ
 ml+tgFo0ims45dniBSH1FN7fadpy2cK6txqyAQ4Eotwn4RlH9uc/zhHRnhzNJEqYIosSPSJ8tyPsl
 Bir8rRY8XMz+W2YIRNGwxfsURqHBbaGzqfpYb1SkHTPKBmNBJmRnhOJeINup0raYXUdeG+v1UNAps
 9bpvHHQtQYt8AI9pKWHZryI8wFVm4BamnOh7UNAoGRdiLtSN8B6fcx2TsrqDjY8GZNQZojCaYDC7H
 toRh+9lA==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82K9-0087Bf-09; Tue, 28 Nov 2023 18:56:41 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 8/9] drm/amd/display: add DPP and MPC color caps to DTN log
Date: Tue, 28 Nov 2023 16:52:56 -0100
Message-ID: <20231128175623.121356-9-mwen@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128175623.121356-1-mwen@igalia.com>
References: <20231128175623.121356-1-mwen@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add color caps information for DPP and MPC block to show HW color caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 23 +++++++++++++++++++
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 23 +++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index f7d9bcdbc6c6..d3cab6fb270b 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -346,6 +346,24 @@ static void dcn10_log_color_state(struct dc *dc,
 		DTN_INFO("\n");
 	}
 	DTN_INFO("\n");
+	DTN_INFO("DPP Color Caps: input_lut_shared:%d  icsc:%d"
+		 "  dgam_ram:%d  dgam_rom: srgb:%d,bt2020:%d,gamma2_2:%d,pq:%d,hlg:%d"
+		 "  post_csc:%d  gamcor:%d  dgam_rom_for_yuv:%d  3d_lut:%d"
+		 "  blnd_lut:%d  oscs:%d\n\n",
+		 dc->caps.color.dpp.input_lut_shared,
+		 dc->caps.color.dpp.icsc,
+		 dc->caps.color.dpp.dgam_ram,
+		 dc->caps.color.dpp.dgam_rom_caps.srgb,
+		 dc->caps.color.dpp.dgam_rom_caps.bt2020,
+		 dc->caps.color.dpp.dgam_rom_caps.gamma2_2,
+		 dc->caps.color.dpp.dgam_rom_caps.pq,
+		 dc->caps.color.dpp.dgam_rom_caps.hlg,
+		 dc->caps.color.dpp.post_csc,
+		 dc->caps.color.dpp.gamma_corr,
+		 dc->caps.color.dpp.dgam_rom_for_yuv,
+		 dc->caps.color.dpp.hw_3d_lut,
+		 dc->caps.color.dpp.ogam_ram,
+		 dc->caps.color.dpp.ocsc);
 
 	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE\n");
 	for (i = 0; i < pool->pipe_count; i++) {
@@ -359,6 +377,11 @@ static void dcn10_log_color_state(struct dc *dc,
 				s.idle);
 	}
 	DTN_INFO("\n");
+	DTN_INFO("MPC Color Caps: gamut_remap:%d, 3dlut:%d, ogam_ram:%d, ocsc:%d\n\n",
+		 dc->caps.color.mpc.gamut_remap,
+		 dc->caps.color.mpc.num_3dluts,
+		 dc->caps.color.mpc.ogam_ram,
+		 dc->caps.color.mpc.ocsc);
 }
 
 void dcn10_log_hw_state(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index 1e07f0a6be1f..3b38af592101 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -140,6 +140,24 @@ void dcn30_log_color_state(struct dc *dc,
 		DTN_INFO("\n");
 	}
 	DTN_INFO("\n");
+	DTN_INFO("DPP Color Caps: input_lut_shared:%d  icsc:%d"
+		 "  dgam_ram:%d  dgam_rom: srgb:%d,bt2020:%d,gamma2_2:%d,pq:%d,hlg:%d"
+		 "  post_csc:%d  gamcor:%d  dgam_rom_for_yuv:%d  3d_lut:%d"
+		 "  blnd_lut:%d  oscs:%d\n\n",
+		 dc->caps.color.dpp.input_lut_shared,
+		 dc->caps.color.dpp.icsc,
+		 dc->caps.color.dpp.dgam_ram,
+		 dc->caps.color.dpp.dgam_rom_caps.srgb,
+		 dc->caps.color.dpp.dgam_rom_caps.bt2020,
+		 dc->caps.color.dpp.dgam_rom_caps.gamma2_2,
+		 dc->caps.color.dpp.dgam_rom_caps.pq,
+		 dc->caps.color.dpp.dgam_rom_caps.hlg,
+		 dc->caps.color.dpp.post_csc,
+		 dc->caps.color.dpp.gamma_corr,
+		 dc->caps.color.dpp.dgam_rom_for_yuv,
+		 dc->caps.color.dpp.hw_3d_lut,
+		 dc->caps.color.dpp.ogam_ram,
+		 dc->caps.color.dpp.ocsc);
 
 	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE"
 		 "  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT"
@@ -193,6 +211,11 @@ void dcn30_log_color_state(struct dc *dc,
 
 	}
 	DTN_INFO("\n");
+	DTN_INFO("MPC Color Caps: gamut_remap:%d, 3dlut:%d, ogam_ram:%d, ocsc:%d\n\n",
+		 dc->caps.color.mpc.gamut_remap,
+		 dc->caps.color.mpc.num_3dluts,
+		 dc->caps.color.mpc.ogam_ram,
+		 dc->caps.color.mpc.ocsc);
 }
 
 bool dcn30_set_blend_lut(
-- 
2.42.0

