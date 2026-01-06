Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1483CF96C5
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0402110E4FF;
	Tue,  6 Jan 2026 16:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="QlTkB4ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232CA10E0BD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:43:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767717790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NkZs5zdh+IB8LwYC9eN3BRgGph4b858iwLQZ9mtjEw0=;
 b=QlTkB4ctl3Lk0JPk81oKR5iSzGxZW6KC9kuKtr3fVp0v+CQs0/y5iLS72FMldN2n3pHMdL
 nn69V2rcdReXOmRpOgbJgGFsHnF05pmgFzmCHd5iGVYjhZfeHFSu6vsIEK5eFEPzi1CBNi
 scXS28HikHVHZfRIKuC5Jwzfu43KmCE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 2/4] drm: zynqmp: Check property creation status
Date: Tue,  6 Jan 2026 11:42:45 -0500
Message-Id: <20260106164247.472544-3-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
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
Reviewed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 02f3a7d78cf8..816bea4ea986 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -175,9 +175,15 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 
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

