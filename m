Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BE9C97356
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4B10E3D5;
	Mon,  1 Dec 2025 12:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CsXOgA2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65F410E3D0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:19:38 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46112111D;
 Mon,  1 Dec 2025 13:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764591437;
 bh=LLJhV2LallcFwhanB+wQUXczMwB4XxYcFq1ZLrudUL0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CsXOgA2raTdsvWlup3/ee5iQ16wuTeakJkuNA/jwl0eVMU2y6Nt+AJneWnbqbAKWt
 AxwuwTMfPCZlLQ4wcrY47Az//cfC2CY2bRbMByEcDWM2aTnMDJw2FLz0MorogcwmKD
 YwcobUahqA+jG9yeBy8weTRQsk7ndZ+YLuHynigU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:53 +0200
Subject: [PATCH v7 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-11-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LLJhV2LallcFwhanB+wQUXczMwB4XxYcFq1ZLrudUL0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfGpcJhmLMDEtAiwjThXFIIRtc0D3p6Kkl7w
 xP2ZtTeGvyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxgAKCRD6PaqMvJYe
 9TeKD/oDij8hUrmBh4F7ueRaILMPEfgc3qUyCfuC/UPiH6K40Q5s4kvQZ2kVJvRl8f8ag8YP+dO
 CXKJUbE5Bq5Voxo4djH1UyLaqWHpOytzli8dxjqm6e4/ZPM7EAMxmUYhfOvK9FusFOIzwP94xFP
 3wISzq8iba8pIgDB/au/bKBAN22saytp1fNpjTT/0oIaEgrWaz70fej7uHacnwpre5cqYu0D+cg
 lFFeDk6bUsT1p6UgfihalcsiO4ACIs4sjjmOcGqoMmEvNwExaxhVbCCko/p2laTgHgPI0eHu4px
 VWy4I4XEEbPKFqaW6254wrO07dGbQhTSZhCO7Z263QjpjdkAZpkMcjhFOcDiamWh+2B7sZi8WQw
 JFRMdcfAgZZig+8XC4MPQl/QFQa9pA3ux51NLOaRhOPImCm7OVzHuL/x+l+iPOoQGBhjH1nIHsN
 H5x7hJ3wrU4O4038VG7WFfPwR/onCeEZeIHiVBaN003TfqGLnG3zXbMMNiV6yQbca2+5i0tnpyi
 2LMBfzETxIkP/SwDyjrv/06qkAkckfeMFpxhv+ySD0R+9n4LXEKfwmFqkDA6tShqTbeSQIFdUtZ
 5Ggi02R9hv+B0kv8NEfwsoNZxR338HXEAog/UDN3SButD1P+PtWOjbg25fxZ2gSm87bfR3ZLpCW
 gv3vqkOpx59+NZQ==
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

Add support for XVUY2101010 format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b7cc7a7581ad..f548f375750e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XVUY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

