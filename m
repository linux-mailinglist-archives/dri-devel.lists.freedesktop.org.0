Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D00A85030
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F2210EA7E;
	Thu, 10 Apr 2025 23:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LDhcuY0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F610EA7E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:43:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2422669;
 Fri, 11 Apr 2025 01:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744328469;
 bh=TpqUVnVvF12n5pRwFSqv74hT0Ga5lBUcCWULIJwqNhs=;
 h=From:To:Cc:Subject:Date:From;
 b=LDhcuY0U3y6O722mfl7TC/4cglUWDMNZAjx+WVXm4I2oG6koiro3iRxxMINlPDaaX
 2D+qeJwR3FVP7QdkdEwL/nMe4t/yAi29S2kAlJ8AaLvJiuExYO8nV6fQLkoNq9g60N
 cJH0Hmp/SoPdyozUt7TJrEEPJGsEzzYxBByTwrJw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm: rcar-du: Support plane color space properties
Date: Fri, 11 Apr 2025 02:42:38 +0300
Message-ID: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
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

Hello,

This small patch series builds on top of the R-Car VSP1 color space
support ("[PATCH 0/6] media: renesas: vsp1: Add colorspace support",
posted as [1]) to implement the KMS plane color space properties in the
R-Car DU driver.

The first two patches add support to specify plane color encoding and
color range in the vsp1-du API. Patch 1/3 starts with a small
refactoring, and patch 2/2 extends the in-kernel API with two new
parameters, and wire them up to the VSP pipeline. Patch 3/3 then creates
the color space properties in R-Car DU driver, and pass their values to
the VSP driver.

Given that only the last patch touches the DRM subsystem, while the 9
patches it depends on touch the V4L2 subsystem, I would like to merge
everything through V4L2. I don't expect conflicting changes to the
rcar-du driver to be merged for v6.16. Dave, Sima, could I get your ack
for this ?

[1] https://lore.kernel.org/r/20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com

Laurent Pinchart (3):
  media: renesas: vsp1: Name nested structure in vsp1_drm
  media: renesas: vsp1: Expose color space through the DRM API
  drm: rcar-du: Create plane color properties

 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 15 +++++++++++++
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 22 +++++++++++--------
 .../media/platform/renesas/vsp1/vsp1_drm.h    |  8 ++++---
 include/media/vsp1.h                          |  4 ++++
 4 files changed, 37 insertions(+), 12 deletions(-)


base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255
prerequisite-patch-id: 54ade6c92a08292f509ad0c42cc578e2b355e699
prerequisite-patch-id: c2f29968199990b573d655ca9ea9ac0883842a9c
prerequisite-patch-id: 96e1d3ee682a91153ecd32207a641274cdd88b7a
prerequisite-patch-id: 221744f7a7fc757b67c32a1eb2160fb46cd59111
prerequisite-patch-id: cf6b99de1ae04e635d14dd198b5bf918ef8f6213
prerequisite-patch-id: 439fe909a37bc235622e8feacc2fc01429dcb4bb
-- 
Regards,

Laurent Pinchart

