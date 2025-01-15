Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C4A11CCC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19B210E57C;
	Wed, 15 Jan 2025 09:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qbWIXVxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220BC10E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:04:03 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D75193AE0;
 Wed, 15 Jan 2025 10:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931784;
 bh=U6QTUkIufzSv6Der1HCIiREWkOAz1oZ9ohmvRY4oz/M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qbWIXVxqfI0rSpLfg9LhT8n2wol33AGBrBsRxYM4+ALBmQgVNyxjMaAf580Ndg8dp
 Oko2E380nMyDNLAlquADJNZehoDCGzjzNDxs+ohVfVdKL0k+5sZWfBFxEFReVumauS
 vU0sQeTkb+FngsSxYmc0/K6+2nL2CmqRsya22jdY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:35 +0200
Subject: [PATCH v2 06/10] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-6-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=U6QTUkIufzSv6Der1HCIiREWkOAz1oZ9ohmvRY4oz/M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n61oQAc0u1Ou7DXiuRvHRa07pTwm8/OOF+5
 ybQ1ACqjZuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+gAKCRD6PaqMvJYe
 9fMND/9xLlGCe1UCk64c66UReZZHQ1XVpQKfwWM0n7zWqRfUyo5j/LjlwihD2hvvVU+rlrAQhh0
 M8LjxtXq/yrqj0mTPJEdIhW5LZkUns0q/KH3GNIlMM7FqB4pVoYP/d5vZ5VNyIA/8dgUUpHikbk
 YIYkBNCbhrH+5+Tr0au0qVe7qIeenLV3EvV4Zu8U+RtfdRF0IoNJ1U8INRVOgK2EHxCMknGW38r
 rSzqzPLwQhpfWkq46PuZpBg/4fR3RQ75P8W6KoicmbF9JViF++QFtEmCJzUuM8Wm56jGw6rKhK5
 NrCehVppd0+2Um7qQeDs2HDIpd/iOP8HvWXqH94LJEF2RsOEg94FV0vFPdHge8igbNUkmACDZhl
 HPo301jB0S/K/Erpep5jUi8RlfFEN1eiyTm7N/CXDU2XBc3v5d26/V3h2c8RU7uSN9VSo9YWJio
 gzVRWf4VQwj+FUdMEf6Fgr+wFy2tkE2Jig/R1GmrMfexS56Of6BGcNvmufP3qrfS4GS/7gakbma
 wO2C8m5zL/zZYJ5ZGco4Gcwd522nVT55NKrVzrWvlt7dZ2zhHq2kH9xjy6OEavBUi21iCg11Pl+
 LHjJ1y12orpkUWJtw41xa1Ozi/JG4gcYifRrP8Nz9+YXSA+1ZbismkBxDhsS36hDInxMlJaSHR7
 e+hS2PX152nftAg==
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

Use drm helpers, drm_format_info_plane_width(),
drm_format_info_plane_height() and drm_format_info_min_pitch() to
calculate sizes for the DMA.

This cleans up the code, but also makes it possible to support more
complex formats (like XV15, XV20).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9368acf56eaf..57221575cbd6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1154,16 +1154,18 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		return 0;
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
-		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct dma_async_tx_descriptor *desc;
+		unsigned int width, height;
 		dma_addr_t dma_addr;
 
+		width = drm_format_info_plane_width(info, state->crtc_w, i);
+		height = drm_format_info_plane_height(info, state->crtc_h, i);
+
 		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
-		dma->sgl.size = width * info->cpp[i];
+		dma->sgl.size = drm_format_info_min_pitch(info, i, width);
 		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
 		dma->xt.src_start = dma_addr;
 		dma->xt.frame_size = 1;

-- 
2.43.0

