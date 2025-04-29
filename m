Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500AAA3C2B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF3F10E46F;
	Tue, 29 Apr 2025 23:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fpH6TzHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A3810E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32D6667;
 Wed, 30 Apr 2025 01:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969351;
 bh=SJuUTyRYOsmV+4BOdS6vSBVWQOZghh/+2abrSbuis9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fpH6TzHqOPzkAiNa+zVZZG+JYlwBsF+yxOUjYFQu8XW9wPkLiwANjXNrywroK1pFK
 UmpqXrShDR/TeT8sIWzFqttRgiwDWCVEv2ZS4cKzzYp3B0k6hpcWvmitofZ5yS1Uld
 ricxvnUBmexITkUGDrpHyo80xsaknDBfLmGcCe4Y=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 4/9] media: renesas: vsp1: Fix media bus code setup on RWPF
 source pad
Date: Wed, 30 Apr 2025 02:28:59 +0300
Message-ID: <20250429232904.26413-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RWPF source pad media bus code can only be different from the sink
pad code when enabling color space conversion, which can only convert
between RGB and YUV. If the sink pad code is HSV, no conversion is
possible. Fix the pad set format handler to reflect this hardware
limitation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9d38203e73d0..1b4bac7b7cfa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -76,11 +76,20 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == RWPF_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *sink_format =
+			v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
+
 		/*
 		 * The RWPF performs format conversion but can't scale, only the
-		 * format code can be changed on the source pad.
+		 * format code can be changed on the source pad when converting
+		 * between RGB and YUV.
 		 */
-		format->code = fmt->format.code;
+		if (sink_format->code != MEDIA_BUS_FMT_AHSV8888_1X32 &&
+		    fmt->format.code != MEDIA_BUS_FMT_AHSV8888_1X32)
+			format->code = fmt->format.code;
+		else
+			format->code = sink_format->code;
+
 		fmt->format = *format;
 		goto done;
 	}
-- 
Regards,

Laurent Pinchart

