Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A3B385EE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF410E851;
	Wed, 27 Aug 2025 15:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gNTsOlgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A54510E84B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 15:13:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 618244197C;
 Wed, 27 Aug 2025 15:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84BFC4CEF0;
 Wed, 27 Aug 2025 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756307585;
 bh=k6TwiI8He8GNSiGlGO+CMw9G5rhFmltlagnJGvSCcUw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gNTsOlglXMeUUV2UbTVaB1a6wDp6C6CaEHdsOCguHmKF8UUQfNfMrD0aAGuoyfHvR
 MFBCtujgsPC3K1NIhpP+yrBAVPB5gQ+fzIbEfME//eg2ypaVh9Lqa4J8Q36M7HC6pF
 i12ub26z7b6bZ3lnDKyctcSDnwQwbWAaNwVVWHeh1Dvw4Z8SYpg4SpARYPS+fgMwm1
 CeKYjpbTiudQtKYcR2FNwkRE7o6HL6iBRipg4ZNtkpAX42JoFODmdVi94/RZC9qWIG
 yWFyw03Z4IC/zQ5i1gIosgBEc6wwRsDaL141gwjDNmjly35EaEIkRkzLOxSllocanG
 TGGwmO1qwTtJg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Aug 2025 17:12:39 +0200
Subject: [PATCH v3 08/14] drm/tidss: dispc: Switch REG_FLD_MOD to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-drm-tidss-field-api-v3-8-7689b664cc63@kernel.org>
References: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
In-Reply-To: <20250827-drm-tidss-field-api-v3-0-7689b664cc63@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3642; i=mripard@kernel.org;
 h=from:subject:message-id; bh=k6TwiI8He8GNSiGlGO+CMw9G5rhFmltlagnJGvSCcUw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnrFdL+Hg13kVz5NLBM7kBwc2/WwgnCVXeu6yerSxQ5i
 uWyJ0V3TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIk8C2KslXC6WBDLoFWiGhpc
 xmdltnR6iXyWs76KklnRw7nLqwru7+dquvWiLdjN/H9IdPPpjRGMDaeZNGMnLnk3RbY8IueGU9Z
 RG27fgFucpXJXvjwpsdx76c2Xx4V3+p/e+ZvjmjjDdZ7THQA=
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

The REG_FLD_MOD function takes the start and end bits as parameter and
will generate a mask out of them.

This makes it difficult to share the masks between callers, since we now
need two arguments and to keep them consistent.

Let's change REG_FLD_MOD to take the mask as an argument instead, and
let the caller create the mask. Eventually, this mask will be moved to a
define.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 48985f0bbbacacf76293f24414470664c74c40ec..82b038285acc245f86573a6a854da37248c92407 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -595,16 +595,16 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
  */
 
 #define REG_GET(dispc, idx, mask)					\
 	((u32)FIELD_GET((mask), dispc_read((dispc), (idx))))
 
-#define REG_FLD_MOD(dispc, idx, val, start, end)			\
+#define REG_FLD_MOD(dispc, idx, val, mask)				\
 	({								\
 		struct dispc_device *_dispc = (dispc);			\
 		u32 _idx = (idx);					\
 		u32 _reg = dispc_read(_dispc, _idx);			\
-		FIELD_MODIFY(GENMASK((start), (end)), &_reg, (val));	\
+		FIELD_MODIFY((mask), &_reg, (val));			\
 		dispc_write(_dispc, _idx, _reg);			\
 	})
 
 #define VID_REG_GET(dispc, hw_plane, idx, start, end)			\
 	((u32)FIELD_GET(GENMASK((start), (end)),			\
@@ -2316,13 +2316,13 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
 	unsigned int hw_plane;
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
 	/* MFLAG_CTRL = ENABLED */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, 1, 0);
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, GENMASK(1, 0));
 	/* MFLAG_START = MFLAGNORMALSTARTMODE */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, GENMASK(6, 6));
 
 	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2367,17 +2367,17 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
 	u32 cba_lo_pri = 1;
 	u32 cba_hi_pri = 0;
 
 	dev_dbg(dispc->dev, "%s()\n", __func__);
 
-	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_lo_pri, 2, 0);
-	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_hi_pri, 5, 3);
+	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_lo_pri, GENMASK(2, 0));
+	REG_FLD_MOD(dispc, DSS_CBA_CFG, cba_hi_pri, GENMASK(5, 3));
 
 	/* MFLAG_CTRL = ENABLED */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, 1, 0);
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 2, GENMASK(1, 0));
 	/* MFLAG_START = MFLAGNORMALSTARTMODE */
-	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
+	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, GENMASK(6, 6));
 
 	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
 		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
 		u32 thr_low, thr_high;
 		u32 mflag_low, mflag_high;
@@ -2901,11 +2901,11 @@ static int dispc_softreset(struct dispc_device *dispc)
 		dispc_softreset_k2g(dispc);
 		return 0;
 	}
 
 	/* Soft reset */
-	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);
+	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, GENMASK(1, 1));
 	/* Wait for reset to complete */
 	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
 				 val, val & 1, 100, 5000);
 	if (ret) {
 		dev_err(dispc->dev, "failed to reset dispc\n");

-- 
2.50.1

