Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F1B15B10
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269F610E43C;
	Wed, 30 Jul 2025 08:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="phBgpn/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBEB10E439
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 729A344039;
 Wed, 30 Jul 2025 08:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFDFC4CEF9;
 Wed, 30 Jul 2025 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865869;
 bh=Or3Q43rgPLCeQ0Em2GhlqejtpCoF84H9jnqNFSiNMEc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=phBgpn/BCdnYoHpMO+DqzAc+pNJqDTH72SxkLIJefiB35FOMK7m71aHN41OzXln5Y
 GvHJNlyLUgipFeIMbH6LPHfD+q9uZ8G/+TijJsvx0yZjOcuiN9TyNV7vZIsswRFJRT
 mL1NNbZbH3ntxJf2rAhSkegBLKqSZ2AK6Oji1Jc613uJqGnRaIWN59w/mm5r5ph8fZ
 i+KomUjCTeQFZw0DZAjBcD34QxB3M1cJ1GZgnZVU7mY5hR7jLFXZzc5KSIMwcigVku
 hcSL0z8rMvzy7EfbEuYuySmXgTxc8CDD+rllHyKHXtLPMPRQOzEst7XsTt1scT22pw
 Aay5340Uc7y2g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:13 +0200
Subject: [PATCH 13/14] drm/tidss: dispc: Switch OVR_REG_FLD_MOD to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-13-a71ae8dd2782@kernel.org>
References: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
In-Reply-To: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3314; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Or3Q43rgPLCeQ0Em2GhlqejtpCoF84H9jnqNFSiNMEc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd91J/KOXq/kqce8ywxd363e8FdY8m/rLwZVDNzhDP8
 /9Wtm1Vx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiITBFjnbb14bniF5KYjVfv
 1p4izBqbJWty+9OLLa72E3d1TDt+ZeJU/pQ/lw50y1268FaB+4mHBmNDs8LbVSnmEql664rYZEO
 lBY+dXfuzzsGAVXpDXbH6ba5M5rCX7PsZN7dd0J9/O0Ld/x0A
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
index ba843248749d98f08a2393bc54f92f26bba4223d..088a454271d45aef4ae264c78c627c24d0ef0347 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -649,14 +649,14 @@ static void VP_REG_FLD_MOD(struct dispc_device *dispc, u32 vp, u32 idx, u32 val,
 	dispc_vp_write(dispc, vp, idx,
 		       FLD_MOD(dispc_vp_read(dispc, vp, idx), val, mask));
 }
 
 static void OVR_REG_FLD_MOD(struct dispc_device *dispc, u32 ovr, u32 idx,
-			    u32 val, u32 start, u32 end)
+			    u32 val, u32 mask)
 {
 	dispc_ovr_write(dispc, ovr, idx,
-			FLD_MOD(dispc_ovr_read(dispc, ovr, idx), val, GENMASK(start, end)));
+			FLD_MOD(dispc_ovr_read(dispc, ovr, idx), val, mask));
 }
 
 static dispc_irq_t dispc_vp_irq_from_raw(u32 stat, u32 hw_videoport)
 {
 	dispc_irq_t vp_stat = 0;
@@ -1484,29 +1484,29 @@ static void dispc_am65x_ovr_set_plane(struct dispc_device *dispc,
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
@@ -1537,11 +1537,11 @@ void dispc_ovr_enable_layer(struct dispc_device *dispc,
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

