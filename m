Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E59D70F4
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEF310E512;
	Sun, 24 Nov 2024 13:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wvyr8BYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D4710E511;
 Sun, 24 Nov 2024 13:42:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 740115C54E6;
 Sun, 24 Nov 2024 13:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7439FC4CED1;
 Sun, 24 Nov 2024 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455731;
 bh=+4w5UTki4/weg+oqtmnVVYBxReYspoHaUr2KMbuZlbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wvyr8BYaQnOxAYu65KKo7/Qo0C5/FT3UEI0+h129IH+VR4CICmegOPxr1hqE2h5FY
 KQ8Qfp3SWYY9glmz0dSK21lUCqNmyLwU6wzlH5Fb422l7qrdpu/rs6G6kNABQCA/UD
 k0WdAu+0o9X7gOWM1EJ1pTuh7Xi1bBF9gEMSwG7W+1nqX2U4kIbv1mVojBZBbkkmaT
 a08e9f6KwgTfccd2EX5YjxZJ/KJO9a3FIsCpXauDJWNdhLtT6wy/MApOUkYDV16Soh
 VH0yMQNaVpDU7MoypFR/XRSDbv24k2ILnu/C8ScrmvxPK+mbsdDZBlXGOIPURuYAgj
 Df2CGY1FZvPsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jose.souza@intel.com, niranjana.vishwanathapura@intel.com,
 ashutosh.dixit@intel.com, tejas.upadhyay@intel.com,
 shekhar.chauhan@intel.com, daniele.ceraolospurio@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 21/87] drm/xe/xe3: Add initial set of workarounds
Date: Sun, 24 Nov 2024 08:37:59 -0500
Message-ID: <20241124134102.3344326-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

[ Upstream commit 081cb8948cfe322076cd23f22f85ba68f73e2c4b ]

Implement the initial set of workarounds for Xe3 IPs.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241008204626.55802-2-matthew.s.atwood@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
 drivers/gpu/drm/xe/xe_wa.c               | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 4 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c38db2a746140..76353da9f5669 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -185,6 +185,7 @@
 
 #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
+#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
 
 #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
 #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4f0027d93efcb..6d85d9a12cffb 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -284,6 +284,9 @@
 #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
+#define UNSLCGCTL9454				XE_REG(0x9454)
+#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
+
 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
 #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
 #define   L3_CLKGATE_DIS			REG_BIT(16)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index e2d7ccc6f144b..8188cc259e751 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -251,6 +251,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 
+	/* Xe3_LPG */
+
+	{ XE_RTP_NAME("14021871409"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
+	},
+
+	/* Xe3_LPM */
+
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("16021865536"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("14021486841"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
@@ -567,6 +595,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
 
+	/* Xe3_LPG */
+
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
+
 	{}
 };
 
@@ -738,6 +773,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
 
+	/* Xe3_LPG */
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
+
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 24a5b7d7cdcc1..6ef04f8dbe279 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -29,6 +29,7 @@
 13011645652	GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.43.0

