Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259D3D84B7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C876EB47;
	Wed, 28 Jul 2021 00:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167406EB42
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209442019"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209442019"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583449"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:25 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 09/14] drm/kmb : W/A for planar formats
Date: Tue, 27 Jul 2021 17:31:21 -0700
Message-Id: <20210728003126.1425028-9-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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

This is a work around for fully planar formats, where color corruption
was observed for formats like YU12, YU16 etc. Set the DMA Vstride and
Line width for U and V planes to the same as the Y plane and not the
actual pitch. For decoded video frames, continue to use the info from
metadata.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index dacec5c4266f..4523af949ea1 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -333,6 +333,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	struct disp_cfg *init_disp_cfg;
 	struct viv_vidmem_metadata *md = NULL;
 	struct drm_gem_object *gem_obj;
+	unsigned int cb_stride, cr_stride;
 
 	if (!plane || !new_plane_state || !old_plane_state)
 		return;
@@ -397,8 +398,10 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	val |= get_bits_per_pixel(fb->format);
 	/* Program Cb/Cr for planar formats */
 	if (num_planes > 1) {
-		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
-				fb->pitches[1]);
+		cb_stride = md ? fb->pitches[1] : width * fb->format->cpp[0];
+		kmb_write_lcd(kmb,
+			      LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
+			      cb_stride);
 		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
 			      (width * fb->format->cpp[0]));
 
@@ -419,9 +422,11 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 					addr[U_PLANE]);
 
 		if (num_planes == 3) {
+			cr_stride = md ? fb->pitches[2] :
+				    width * fb->format->cpp[0];
 			kmb_write_lcd(kmb,
 				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
-				      fb->pitches[2]);
+				      cr_stride);
 
 			kmb_write_lcd(kmb,
 				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
-- 
2.25.1

