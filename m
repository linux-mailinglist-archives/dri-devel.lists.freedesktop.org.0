Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC0A32945
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19F210E8E4;
	Wed, 12 Feb 2025 14:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qwXrG7ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA81110E8E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:56:55 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A661A198B;
 Wed, 12 Feb 2025 15:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739372134;
 bh=CRfYdoayFbIp4SyGxcS3wIpdPP0eZRvOi5wwLjCOvoY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qwXrG7uiJBZxam5s89XlqQmlnbU8NQUxHri5R+3c9ofN5nBOYD2PzwV03xO/7w8tA
 8PsRXxOggaRi2cTOFTK7c6auQjSahUpZC+sXzMnz6LAv0jTZxPFFPd0cfwmZXOG9H9
 18caTxfuz2/gWyh901DTkP4tXJuKdF1aJP4mprJA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:11 +0200
Subject: [PATCH v3 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-7-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=CRfYdoayFbIp4SyGxcS3wIpdPP0eZRvOi5wwLjCOvoY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLaq+b90zO1HRXn8B2y8d733NS7mUJvL0COyx
 U1Uf6sENn+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qgAKCRD6PaqMvJYe
 9S1WD/93TM2J0i0Ao4HnmOCzbUagRtCb3RKRhvZ5DYtZ4oIj5ma0tSlqNNHQYaodWj8P24l8hCm
 cyvalkwyBpBm6xiIkBoN7mg2bCg8pL5R2og+JjiAzyABJ9HqiU3xbEFg6lP3lrXUxjg/FMmMElR
 Mw3f2MHGEaMNyLdrn6UnRgmpjLcBqeboXhi7rUP+NW4y/6FrhFfulGCkBqUi5m4I35FJWrz4C+E
 AzybIypjcyNOz9UDK3nmF3VIDK2JGxZkMWiMbaBebcUiRL7/GKSPI1fsAz93/x3djpOLxXkEVBB
 y0TbBjkVB6ZebvKqZMiSkTcu3E2HjwvOamg7g8BSWNVSXo0P2mITZReckmYWbEIQP8M51ytaXAC
 eALAAueYbYcED/5M/6Hz7DTvPbH0HO3q190dviTtrrE0gEvZusFVzIwlwZc0HtDmah9QmOxPdfS
 qULWIE7FiMK8eA9C3fUyA9GW4QaDqN2pmA8nm4bmg/591x0mSB0N3WRNOqJ/DbDL9bQZQMe1GOR
 OA6GeWSU+QHxg3KoljtdpyAaNYUxJKifNCIvHKaE86wke6xwIinzjyXM/pl2vOay8F9BnZD+Wx1
 MYCEHgz08G2sOGrNBOCwQTSOqgEbUEgYLZcYhYTGH3rREK/bZTq9/o7Upp1usfSxqa0U2M+1Ts7
 5eqtc+9e3RLmtxw==
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
index 80d1e499a18d..3d4ade571f0f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1116,16 +1116,18 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
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

