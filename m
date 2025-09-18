Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F4B2DE95
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8980B10E74C;
	Wed, 20 Aug 2025 14:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pwJiw6Pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF05F10E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:02:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6E254676A;
 Wed, 20 Aug 2025 14:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A880C116B1;
 Wed, 20 Aug 2025 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698556;
 bh=s2llZ0k+yYexhA4HqHlu5vUMb5GbEApSzgjjYzPkoHQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pwJiw6Pns/UXg1TBsc42AYgtcJ9Xatj5vqaukipq2fqO75PKrRH2ikEiN78ORKusW
 2W2JPSB5n6CJthc6EHUyOyHo+/pdz1rNSkKTpcBeAMpjzaQj/a4t4tLwNXcBB2WrMj
 bba4BWlffUtJyVACmYvQ8aof/BqBG3yuyoxNEYJbAo/1Cnx/JEgADjpLmpC/oNpcR/
 UNMH4tuGTL/8WnSKQQcCx1SbkAe8w+w79ztydDSF9yQZj2bILb2w+uv68Ww8lgAOI9
 nxsGjREHrWRhCKGI9LDYJkX26149AEkZ9zgksuzvS6DG4Kxc1wuzaUq2Ndv2yuFzjH
 Zynj19z7bg37Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Aug 2025 16:01:53 +0200
Subject: [PATCH v2 13/14] drm/tidss: dispc: Switch OVR_REG_FLD_MOD to using
 a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-tidss-field-api-v2-13-43cab671c648@kernel.org>
References: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
In-Reply-To: <20250820-drm-tidss-field-api-v2-0-43cab671c648@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457; i=mripard@kernel.org;
 h=from:subject:message-id; bh=s2llZ0k+yYexhA4HqHlu5vUMb5GbEApSzgjjYzPkoHQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlLr4bksKTnPg05JSo4OcL9vmPOkWMM51VmBV8V/+ryn
 vPmxZNhHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiBi8Ya3i5Hm75E71ZpZQv
 6MfWYF8tSYboTz4sgTsC7JXP3Fh99XF78Bke2WIVn33NnAlaDb9zGOsMfB70LFis27fTd+melXm
 WJ1/x6tfaF+seyT7H++zh3fbg6t0C95gZHZzKhFT/TnxfxAoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The OVR_REG_FLD_MOD function takes the start and end bits as parameter
and will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change OVR_REG_FLD_MOD to take the mask as an argument instead,
and let the caller create the mask. Eventually, this mask will be moved
to a define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c5cad1ddcccfbf1d0b6fb53773bb3aff428ef493..99d3a84a5b40e1e791300199d6b3da9a12d11f80 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -645,17 +645,17 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 		u32 _reg = dispc_vp_read(_dispc, _vp, _idx);		\
 		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_vp_write(_dispc, _vp, _idx, _reg);		\
 	})
 
-#define OVR_REG_FLD_MOD(dispc, ovr, idx, val, start, end)		\
+#define OVR_REG_FLD_MOD(dispc, ovr, idx, val, mask)			\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _ovr = (ovr);					\
 		u32 _idx = (idx);					\
 		u32 _reg = dispc_ovr_read(_dispc, _ovr, _idx);		\
-		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_ovr_write(_dispc, _ovr, _idx, _reg);		\
 	})
 
 static dispc_irq_t dispc_vp_irq_from_raw(u32 stat, u32 hw_videoport)
 {
@@ -1483,29 +1483,29 @@ static void dispc_am65x_ovr_set_plane(struct dispc_device *dispc,
 				      u32 x, u32 y, u32 layer)
 {
 	u32 hw_id = dispc->feat->vid_info[hw_plane].hw_id;
 
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			hw_id, 4, 1);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			x, 17, 6);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			y, 30, 19);
+			hw_id, GENMASK(4, 1));
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer), x,
+			GENMASK(17, 6));
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer), y,
+			GENMASK(30, 19));
 }
 
 static void dispc_j721e_ovr_set_plane(struct dispc_device *dispc,
 				      u32 hw_plane, u32 hw_videoport,
 				      u32 x, u32 y, u32 layer)
 {
 	u32 hw_id = dispc->feat->vid_info[hw_plane].hw_id;
 
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			hw_id, 4, 1);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer),
-			x, 13, 0);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer),
-			y, 29, 16);
+			hw_id, GENMASK(4, 1));
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer), x,
+			GENMASK(13, 0));
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer), y,
+			GENMASK(29, 16));
 }
 
 void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
 			 u32 hw_videoport, u32 x, u32 y, u32 layer)
 {
@@ -1536,11 +1536,11 @@ void dispc_ovr_enable_layer(struct dispc_device *dispc,
 {
 	if (dispc->feat->subrev == DISPC_K2G)
 		return;
 
 	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
-			!!enable, 0, 0);
+			!!enable, GENMASK(0, 0));
 }
 
 /* CSC */
 enum csc_ctm {
 	CSC_RR, CSC_RG, CSC_RB,

-- 
2.50.1

