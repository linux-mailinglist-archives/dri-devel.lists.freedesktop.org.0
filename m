Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7C5A16A1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3310810E644;
	Thu, 25 Aug 2022 16:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4252E10E644
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 16:26:14 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27PGQABY033479;
 Thu, 25 Aug 2022 11:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1661444770;
 bh=8su/TFzGcYfole92yN6p35Ziqsmi+iO39SnkJsJK1pc=;
 h=From:To:CC:Subject:Date;
 b=P7Kz/CBJkXro1zY6cKflqyYLpf9JInFXS/TappoePSd+vpS4aECg4/QtnMW8qi/Ui
 ljFFKUN60dE8URxAdfGrkVUmD6t4Ycrwnwlcs5LNfcX1NUN+WVUqYc30nTNRw48hBs
 3whjd3rs61Wze3F8buC20IVETxfK6YiXHeJBrkxc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27PGQAF1019951
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Aug 2022 11:26:10 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 25
 Aug 2022 11:26:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 25 Aug 2022 11:26:09 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27PGQ9sW103315;
 Thu, 25 Aug 2022 11:26:09 -0500
From: Andrew Davis <afd@ti.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Tomi
 Valkeinen <tomba@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm: omapdrm: Improve check for contiguous buffers
Date: Thu, 25 Aug 2022 11:26:09 -0500
Message-ID: <20220825162609.14076-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Andrew Davis <afd@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While a scatter-gather table having only 1 entry does imply it is
contiguous, it is a logic error to assume the inverse. Tables can have
more than 1 entry and still be contiguous. Use a proper check here.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v1:
 - Sent correct version of patch :)

 drivers/gpu/drm/omapdrm/omap_gem.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index cf571796fd26e..c10f3d2dd61ce 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -48,7 +48,7 @@ struct omap_gem_object {
 	 *   OMAP_BO_MEM_DMA_API flag set)
 	 *
 	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
-	 *   if they are physically contiguous (when sgt->orig_nents == 1)
+	 *   if they are physically contiguous
 	 *
 	 * - buffers mapped through the TILER when pin_cnt is not zero, in which
 	 *   case the DMA address points to the TILER aperture
@@ -148,12 +148,18 @@ u64 omap_gem_mmap_offset(struct drm_gem_object *obj)
 	return drm_vma_node_offset_addr(&obj->vma_node);
 }
 
+static bool omap_gem_sgt_is_contiguous(struct sg_table *sgt, size_t size)
+{
+	return !(drm_prime_get_contiguous_size(sgt) < size);
+}
+
 static bool omap_gem_is_contiguous(struct omap_gem_object *omap_obj)
 {
 	if (omap_obj->flags & OMAP_BO_MEM_DMA_API)
 		return true;
 
-	if ((omap_obj->flags & OMAP_BO_MEM_DMABUF) && omap_obj->sgt->nents == 1)
+	if ((omap_obj->flags & OMAP_BO_MEM_DMABUF) &&
+	    omap_gem_sgt_is_contiguous(omap_obj->sgt, omap_obj->base.size))
 		return true;
 
 	return false;
@@ -1398,7 +1404,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 	union omap_gem_size gsize;
 
 	/* Without a DMM only physically contiguous buffers can be supported. */
-	if (sgt->orig_nents != 1 && !priv->has_dmm)
+	if (!omap_gem_sgt_is_contiguous(sgt, size) && !priv->has_dmm)
 		return ERR_PTR(-EINVAL);
 
 	gsize.bytes = PAGE_ALIGN(size);
@@ -1412,7 +1418,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 
 	omap_obj->sgt = sgt;
 
-	if (sgt->orig_nents == 1) {
+	if (omap_gem_sgt_is_contiguous(sgt, size)) {
 		omap_obj->dma_addr = sg_dma_address(sgt->sgl);
 	} else {
 		/* Create pages list from sgt */
-- 
2.36.1

