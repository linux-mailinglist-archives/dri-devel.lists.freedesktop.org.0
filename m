Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A438ADFD
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460D6F44C;
	Thu, 20 May 2021 12:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280016E0D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:19:51 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98AA3E0C;
 Thu, 20 May 2021 14:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621513189;
 bh=c6c8pFCUKOqmE1pr+wiJO/rINBKnTgBD4+MlaECeauU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HEOL3fCU3AepT+2uLJm5WMYpQKrwt6Xc0mG0pj8v+fhq+jqTMXVBkZ1hNc58p1d8U
 RtCtQtzDWzH0HJTEnL1RMRMJl0369yn2tA+CKjhor75UvBKlKnTzmioAmegWAR0oZ+
 Jl4M6QNBNfEIWbNzrquRdPQzbyCcx2/lfphteilM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm: xlnx: zynqmp_dpsub: Expose plane ordering to
 userspace
Date: Thu, 20 May 2021 15:19:42 +0300
Message-Id: <20210520121942.26686-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210520121942.26686-1-laurent.pinchart@ideasonboard.com>
References: <20210520121942.26686-1-laurent.pinchart@ideasonboard.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@xilinx.com>, Rohit Visavalia <RVISAVAL@xilinx.com>,
 Quanyang Wang <quanyang.wang@windriver.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the DPSUB has a fixed plane order, it still makes sense to expose
it to userspace to avoid hardcoding assumptions. Do so by adding an
immutable zpos property to planes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index d87af7cb3340..e377974f8198 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1252,6 +1252,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 		drm_plane_helper_add(&layer->plane,
 				     &zynqmp_disp_plane_helper_funcs);
 
+		drm_plane_create_zpos_immutable_property(&layer->plane, i);
 		if (zynqmp_disp_layer_is_gfx(layer))
 			drm_plane_create_alpha_property(&layer->plane);
 	}
-- 
Regards,

Laurent Pinchart

