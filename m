Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAFAA3C2F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9FD10E473;
	Tue, 29 Apr 2025 23:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZjQ3OdBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E1C10E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A298C11AA;
 Wed, 30 Apr 2025 01:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969349;
 bh=pbWvq7wsylGkwn0s0PHaXTtzAFPqG/QKYLRTEF0OtXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZjQ3OdBTNZTnOILMUHm4DZeaifaIJdGewOvEEuiE1pWIB3F6XYv0AUKh3oFb6OI6E
 PUprbiVgD6pBz4w2f6kd4YR18RmJeKpd9JrmMyutWIbgxgK9m3tn6uuBmvuN3hewth
 FsVthc3fpFyDvMu6CUIv8Jp4M79rpLY2ywAApIGs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 3/9] media: renesas: vsp1: Fix HSV format enumeration
Date: Wed, 30 Apr 2025 02:28:58 +0300
Message-ID: <20250429232904.26413-4-laurent.pinchart+renesas@ideasonboard.com>
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

The HSV formats are not restricted to Gen2 platforms, but to VSP
instances that implement the HSI and HST modules. Make it conditional to
the VSP1_HAS_HSIT feature flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 16a78a00c6c9..f7b133536704 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -215,6 +215,9 @@ static const struct vsp1_format_info vsp1_video_gen2_formats[] = {
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 16, 0, 0 }, false, true, 2, 1, false },
+};
+
+static const struct vsp1_format_info vsp1_video_hsit_formats[] = {
 	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
 	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
@@ -255,6 +258,16 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 		}
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_hsit_formats[i];
+
+			if (info->fourcc == fourcc)
+				return info;
+		}
+	}
+
 	return NULL;
 }
 
@@ -285,6 +298,12 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 				return &vsp1_video_gen2_formats[index];
 		}
 
+		if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+			index -= ARRAY_SIZE(vsp1_video_gen2_formats);
+			if (index < ARRAY_SIZE(vsp1_video_hsit_formats))
+				return &vsp1_video_hsit_formats[index];
+		}
+
 		return NULL;
 	}
 
@@ -311,6 +330,19 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 		}
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_hsit_formats[i];
+
+			if (info->mbus == code) {
+				if (!index)
+					return info;
+				index--;
+			}
+		}
+	}
+
 	return NULL;
 }
 
-- 
Regards,

Laurent Pinchart

