Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38161A6AAC2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1A210E662;
	Thu, 20 Mar 2025 16:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gWpS68Sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F4C10E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:43 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94CC8198A;
 Thu, 20 Mar 2025 16:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486338;
 bh=terDw8VLDSycV/I6fcyF4BbvPpfjEASKJADXJuIxv/I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gWpS68SdlnTAhThXUWyhBC1sOU9As+/9lFtpxjZCMcM/AnAJ8huFBtufPe/HVRFwe
 SgY3JfLAGbpRsuwhQ/s9Qas2CjG1V5JzMHaQ1VButDPmpCdD4luARWBQBFn2Kh9zLA
 spx6TTXgMB2EMIXMCm0UZxZJu4DCAc556/E0glL0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 18:00:05 +0200
Subject: [PATCH 10/18] drm/bridge: cdns-dsi: Fix event mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-10-725277c5f43b@ideasonboard.com>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
In-Reply-To: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2987;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=terDw8VLDSycV/I6fcyF4BbvPpfjEASKJADXJuIxv/I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuZkHnzR/F8F8Ug9BlIx5Si+wdF0XuGnWHqi
 ACEvI5opwGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7mQAKCRD6PaqMvJYe
 9SYjEACnDKiS2EnDtKeTX1MpGReOU17c1E1CUXdq6S5Gz5f03HJFnSJ0aw22XXMtd4SFXDeiPXY
 pmIKbXTXzfUX0s9JM4LEHCfqZuwjBVHUngjNB2fH1U0XV6NfKUkMyY7VnyJoEliEAy6qFvjRaxZ
 URK7A6EJmtmCsnjxB2TXX9ysx/LY09kq6BtS7GY9NbtS2GZRmPNuzHwdMDv34MKaa8diXU20iGo
 nnOSx2wsqqbYc6nfKPwZEqB4foDpykIkvFDwKv3Ol7KruA3X91xJIscm9rM+Yj8ePNhwJnAeiIj
 rbrqxHEUkKJcOTknJxVSwgooaw0pLR2zcX984zvVssCgPlwlnObaTO7YAZ87VH7QNisrWH+89zI
 6zgTV/YxFFPRGdhMiEW5pFrKyObARUTAz65fcum9gdNl8UMXs3dTWQSLA7VfXlBM7OMx9IKnD7u
 M6Dt8Qv5uJBaBSpIe4682gZzTmmPjDwqAfSmj3Gz6rpqiBDB/dZS/46wVad9Wk/IfE4Kqfr/gIS
 NBjrdn3p9MIRmezk/KOM3hcUClJg7LfK6y9ItUeNqCSdm4s7uNJw6jaoDlPowPpTNDwqd5iKZS7
 XdgPmEPG3aYxcGRMdABr7CUIrvpPVrZe6Cm6+KZzoaIc+JqS+iSO/xtfntxEc0dpnqvjY8oUTmS
 20k4+VK354F8RcA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The timings calculation gets it wrong for DSI event mode, resulting in
too large hbp value. Fix the issue by taking into account the
pulse/event mode difference.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 33 ++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 62811631341b..9797e6faa29d 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -417,7 +417,8 @@
 #define DSI_OUTPUT_PORT			0
 #define DSI_INPUT_PORT(inputid)		(1 + (inputid))
 
-#define DSI_HBP_FRAME_OVERHEAD		12
+#define DSI_HBP_FRAME_PULSE_OVERHEAD	12
+#define DSI_HBP_FRAME_EVENT_OVERHEAD	16
 #define DSI_HSA_FRAME_OVERHEAD		14
 #define DSI_HFP_FRAME_OVERHEAD		6
 #define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
@@ -503,12 +504,18 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 
 	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
 
-	dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + (sync_pulse ? 0 : dpi_hsa),
-					 bpp, DSI_HBP_FRAME_OVERHEAD);
+	if (sync_pulse) {
+		dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp, bpp,
+						 DSI_HBP_FRAME_PULSE_OVERHEAD);
 
-	if (sync_pulse)
-		dsi_cfg->hsa =
-			dpi_to_dsi_timing(dpi_hsa, bpp, DSI_HSA_FRAME_OVERHEAD);
+		dsi_cfg->hsa = dpi_to_dsi_timing(dpi_hsa, bpp,
+						 DSI_HSA_FRAME_OVERHEAD);
+	} else {
+		dsi_cfg->hbp = dpi_to_dsi_timing(dpi_hbp + dpi_hsa, bpp,
+						 DSI_HBP_FRAME_EVENT_OVERHEAD);
+
+		dsi_cfg->hsa = 0;
+	}
 
 	dsi_cfg->hact = dpi_to_dsi_timing(dpi_hact, bpp, 0);
 
@@ -532,9 +539,12 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	unsigned int dsi_hfp_ext;
 	unsigned int lanes = output->dev->lanes;
 
-	dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
 		dsi_htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	} else {
+		dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
+	}
 
 	dsi_htotal += dsi_cfg->hact;
 	dsi_htotal += dsi_cfg->hfp + DSI_HFP_FRAME_OVERHEAD;
@@ -607,9 +617,12 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 		return -EINVAL;
 	}
 
-	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
 		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
+	} else {
+		dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
+	}
 
 	/*
 	 * Make sure DPI(HFP) > DSI(HSS+HSA+HSE+HBP) to guarantee that the FIFO

-- 
2.43.0

