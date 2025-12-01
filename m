Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52382C97371
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246B910E3BE;
	Mon,  1 Dec 2025 12:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RReApWLb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6346A10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:19:28 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F5091E4B;
 Mon,  1 Dec 2025 13:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764591433;
 bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RReApWLbTyxJWD22y2GmnUUpFn//mnW3Lw5XQQSPkJjXhX0MjW7ZyK22/dOoleXxF
 /WATlQdgyPgoCEq20Kb5oQ4OSfWmbADvMn4exDHF+bE6zwmN0EVcpkQnN1W67PaonJ
 aedXBZ5ifx7WIcAl9+M7i/JE91TxFcz90I6SJlBU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:49 +0200
Subject: [PATCH v7 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-7-1e1558adfefc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfEfZmq9rMMb7XREQXrBUQZGI0efqtoepCeJ
 wCkVIedINeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HxAAKCRD6PaqMvJYe
 9Rz0EAChHd8Sd7lzWnz6AUfj6G7wX/dX1y6uGTNSgk5bKcciyz28xtn2LLNv6cMM0C4XciEdSWt
 nxhFFaVmZy2wg4EbgpBb8J/3wbzfWr//zpxQ9w4sJAOvTlShR4tr/xmWvTSgUKoD4jKU94BQxhv
 c96Akpcqrf4LTs7+LX6OtZgs7N9pqlf62KSzjSewUQ6k+SwPO40sriWG8fz29Z/GnVvcPx0xkAA
 IJEou4DAvC7qzCi4EMGVf0OyQpiyVJk3gGfw/L049lyoDUySVH8fJNxBKP8D932yLkiAA2kLYGk
 WnJVkMTMWd1c8bJ4XyAAECgYCbcxf4KRBh49bBXvk0eCCvS6NFt0dmrL89hq6TCHcRxGbO2+opJ
 WNlGE+OsfdvnKguLfOECivp8uYu7m1GFh4pKHBmf4NFKAMWkSRTXX8EOktcVXyOn02P0HTxVn0p
 g9s/BRikDuwxpOS18YE8tKkWiX7h5jws+8+bFeG76+kntrdFHJcBbBWUbCqO7eHvvES9crqM87C
 OiE6CbPx2i2i+pYvSvsGBw61hiVOk8TEztAJJRZYUgbqHQfKP7HCXqTMZIRTlYLxmQtMqdbY35s
 IaVtqIOSwa6WaiHMBANYkAYkt1CZRATwLbrEykUPbrSBJ1agCI0s5XypX4Z4Mvab0lL3tr13LJ3
 LHUSeof9GKkEgoA==
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 80d1e499a18d..b9883ea2d03e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1116,16 +1116,19 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		return 0;
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
-		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct dma_async_tx_descriptor *desc;
 		dma_addr_t dma_addr;
+		unsigned int width;
+		unsigned int height;
+
+		width = drm_format_info_plane_width(info, state->crtc_w, i);
+		height = drm_format_info_plane_height(info, state->crtc_h, i);
 
 		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
-		dma->sgl.size = width * info->cpp[i];
+		dma->sgl.size = drm_format_info_min_pitch(info, i, width);
 		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
 		dma->xt.src_start = dma_addr;
 		dma->xt.frame_size = 1;

-- 
2.43.0

