Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA56EC59FC1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815610E1AB;
	Thu, 13 Nov 2025 20:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Nw+bCFei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5410E201
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:37:39 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763066258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7IYL1pgjM3KN4/LrZAIitgGAICVxDY/o/Vd5ldE/rY=;
 b=Nw+bCFei5gtwCkmjhI1568AvJE36lyE7Ma5ND4beUS8rq3TCsZ8vVYJg4p+X+6A34JyE8D
 mcCa33NwIUP3Pm+aZGPB71KanfyzjtvXTkqpWkDgjoBHjqSHd3FzogdmKuafcCYHNpX4rY
 BsNicK/O220MIMu3kGQWWPbgVvh7edA=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/3] drm: zynqmp: Check property creation status
Date: Thu, 13 Nov 2025 15:37:12 -0500
Message-Id: <20251113203715.2768107-2-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Make sure to return an error in the event that we can't create our
properties.

Fixes: 650f12042b85 ("drm: xlnx: zynqmp_dpsub: Add global alpha support")
Fixes: 8c772f0b2b8e ("drm: xlnx: zynqmp_dpsub: Expose plane ordering to userspace")

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 2bee0a2275ed..c80a2d4034f3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -174,9 +174,15 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 
 		drm_plane_helper_add(plane, &zynqmp_dpsub_plane_helper_funcs);
 
-		drm_plane_create_zpos_immutable_property(plane, i);
-		if (i == ZYNQMP_DPSUB_LAYER_GFX)
-			drm_plane_create_alpha_property(plane);
+		ret = drm_plane_create_zpos_immutable_property(plane, i);
+		if (ret)
+			return ret;
+
+		if (i == ZYNQMP_DPSUB_LAYER_GFX) {
+			ret = drm_plane_create_alpha_property(plane);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.35.1.1320.gc452695387.dirty

