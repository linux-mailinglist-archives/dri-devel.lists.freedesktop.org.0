Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3269EE28
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0C610E3A7;
	Wed, 22 Feb 2023 05:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106FE10E3A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 05:06:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FC824E1;
 Wed, 22 Feb 2023 06:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677042388;
 bh=ow3TeyVusyQxSdXC9/ygIEnzrguT8/0AX0K3z862/MM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dSWRDt8yJycQ+/DNNwcmrDYB2ahgr2n0Ni5Pqs4YUYb5LycLSdPYdLh5LWOXMv5cz
 2wO6Mmp1f7UNA9/BGrG0oQlFvSh2rhqiZjbSzs6lc8XnbtdiybPs1P1hEIo5Xd3iGE
 0Uw63NJOroBxU4JzFFr+1+qPQscPbm3y77KYCpcM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: rcar-du: Disable alpha blending for DU planes used
 with VSP
Date: Wed, 22 Feb 2023 07:06:23 +0200
Message-Id: <20230222050623.29080-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the input to a DU channel comes from a VSP, the DU doesn't perform
any blending operation. Select XRGB8888 instead of ARGB8888 to ensure
that the corresponding registers don't get written with invalid values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index fe90be51d64e..45c05d0ffc70 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -73,7 +73,7 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 			.src.y2 = mode->vdisplay << 16,
 			.zpos = 0,
 		},
-		.format = rcar_du_format_info(DRM_FORMAT_ARGB8888),
+		.format = rcar_du_format_info(DRM_FORMAT_XRGB8888),
 		.source = RCAR_DU_PLANE_VSPD1,
 		.colorkey = 0,
 	};
-- 
Regards,

Laurent Pinchart

