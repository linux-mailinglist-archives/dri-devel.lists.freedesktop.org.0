Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD347EA638
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 23:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B0D10E228;
	Mon, 13 Nov 2023 22:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7378 seconds by postgrey-1.36 at gabe;
 Mon, 13 Nov 2023 22:58:10 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F049710E228
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 22:58:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ADKt4JJ014039;
 Mon, 13 Nov 2023 14:55:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1699908904;
 bh=j+n4JjUuu7SDvwZ82+lpls2l3JBtzYdBv37CtP3ObUA=;
 h=From:To:CC:Subject:Date;
 b=mNXWqSzREkkFWxja8MlUMK+Ynm2NNRzV5NnKslMYLJV3Gp7Pf8RcUFO06lt/gQW9i
 ADjtTMHPK8kafPTUsdza26TmUYTDfCDErspKKnacYh+T2BIKeVcoZm9r9b6qRhcdwT
 uzgPsQj4MXu5NGME4jrW3IpSosCzBtIofSnNZPdw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ADKt4Pd117171
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Nov 2023 14:55:04 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Nov 2023 14:55:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Nov 2023 14:55:04 -0600
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ADKt20b030247; 
 Mon, 13 Nov 2023 14:55:02 -0600
From: Andrew Davis <afd@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm: omapdrm: Improve check for contiguous buffers
Date: Mon, 13 Nov 2023 14:55:01 -0600
Message-ID: <20231113205501.616927-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Davis <afd@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While a scatter-gather table having only 1 entry does imply it is
contiguous, it is a logic error to assume the inverse. Tables can have
more than 1 entry and still be contiguous. Use a proper check here.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v2:
 - Double check that these multi-segment SGTs are handled correctly elsewhere in the driver
 - Rebase on v6.7-rc1

Changes from v1:
 - Sent correct version of patch :)

 drivers/gpu/drm/omapdrm/omap_gem.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index c48fa531ca321..3421e8389222a 100644
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
@@ -1385,7 +1391,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 	union omap_gem_size gsize;
 
 	/* Without a DMM only physically contiguous buffers can be supported. */
-	if (sgt->orig_nents != 1 && !priv->has_dmm)
+	if (!omap_gem_sgt_is_contiguous(sgt, size) && !priv->has_dmm)
 		return ERR_PTR(-EINVAL);
 
 	gsize.bytes = PAGE_ALIGN(size);
@@ -1399,7 +1405,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 
 	omap_obj->sgt = sgt;
 
-	if (sgt->orig_nents == 1) {
+	if (omap_gem_sgt_is_contiguous(sgt, size)) {
 		omap_obj->dma_addr = sg_dma_address(sgt->sgl);
 	} else {
 		/* Create pages list from sgt */
-- 
2.39.2

