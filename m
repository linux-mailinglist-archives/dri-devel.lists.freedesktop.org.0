Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB289E36AB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1391110ECAC;
	Wed,  4 Dec 2024 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mc4oHyuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A12E10ECA6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:39 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E5821777;
 Wed,  4 Dec 2024 10:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304670;
 bh=U6QTUkIufzSv6Der1HCIiREWkOAz1oZ9ohmvRY4oz/M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Mc4oHyuPgD4K/IfPe6NHCgWC207drjwEG+JQiZQ9McZ3nEWjMqJLjo1TBTj7rgD16
 2ZrwRXv1N8H3fQR1Z+pow4KIrD9fhjyKvgW24zdc3Gc44ekUDmjBTfNTxJKgS4vn9R
 UGGvlWbIULykqed+aw6Cy9m1huQUTwiXYJf55//s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:06 +0200
Subject: [PATCH 06/10] drm: xlnx: zynqmp: Use drm helpers when calculating
 buffer sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-6-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFy79MMoDUVsXk8BQh85+BryRfdcRAV9crjs
 qgbEFlI6WKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcgAKCRD6PaqMvJYe
 9VxmD/9QtDmSP+T3o7qMEixYCKxToSlOiHuiSJ+dUhWFA/DdJKFo80oh5drUKrH2Cf/cQfe9B8H
 N0z5F7KqNPJf5D9+ss5NFjsfw7MNkD/948R6gWVrEWmHr0g2v1EyuStLGvgEt0+/aeTQD4zVFYJ
 V4T9GeBav7YbeUZHnntcZ9tbneDn21JBL5dYMISMLGGbzB+oNWvwuZ2VgGXFG3qc6Gvi8hhlved
 6iNyUa6/ScW6IAWjCW/YI9siTx/1lQ/uyn4NsPqskCKEPKEaznfenWfzlFyQ96JuGYLXtGQFpWU
 0ljJsUxv7mOvl7BJvj5+5eMFm2Unn7Ejsj2Clq4Z46HH0TQVirUGapDfaLHYBNkD4LsQs2OSdPu
 hLEK+JM1v0zIVG+BSfQoiWs9rbDJ94UN55qzLCXOIkbqSlzWYKDf9tNV+fhahh/rgqhCIdz8Ceh
 X71goBIlsNX0g35lNU/M5HwTl0V5T33HptWu8VYMYqDTMmJsPGt+kc2xzFx7vEA/CGv3itBKzX0
 Tmqxw4/bjtra6yC206bf2Re/eUKvZhWplJWxv2JBeApGqkMP9+87uuU2qpPABOPsFORcF8vVqKT
 8uVGNCIUK4kAzo4UB6wfyvNbIVnJs0WdgQBbVaw5EFSm8kUmGnk6Ca5Xshqyc6OAUmzV3EdhVDD
 dyd7mhFQk6sP7xA==
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

