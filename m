Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8341FB15B06
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7156310E434;
	Wed, 30 Jul 2025 08:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CAggZeWQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADD010E432
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2ED35C5451;
 Wed, 30 Jul 2025 08:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F25C4CEF8;
 Wed, 30 Jul 2025 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865849;
 bh=fsk1q+vbHOBdJ2fmmzNm81hQGwxIASDXY28bXs1Y6uU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CAggZeWQ3/LTmz0mqZSSau3DZMlBPU5t9p73DwEnDhUADqCswDKH8Z3+Lxpopf11o
 gPC7Xz9jhghVBQS05Iu9OCXASWV93rcet9MFyfXdEIZMkpP2Yw7zfBmFYTJ2N51hEu
 zf5yElaGkDa3B53aIpvTuWqci20UjVBAzNyydQ2zio87YE5MuHrdHuSRLW+yQH6sed
 8C5vcfpZnHw3YeTDxcgQFmB/oHtR8H3GQpR1MilHxxJdri+xqXs4mRKVcPl+JOVYYV
 qbkFeGBxOGjKy7gGC/nbJc5TbN3wvKei1QfxU/Fmv2timvLMeTcs1a4J0bbTdT3tl0
 UHnsOeOYogsdA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:06 +0200
Subject: [PATCH 06/14] drm/tidss: dispc: Switch FLD_MOD to using a mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-6-a71ae8dd2782@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fsk1q+vbHOBdJ2fmmzNm81hQGwxIASDXY28bXs1Y6uU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd95KWHZ+xKmJemGuareipfWYv7cOZv6SqyoYEzLPj8
 3+fcc+lYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkjiZjfWHj4rdqSpNCZGqO
 3v8qxzR5/p1bUVuaj26N6PbI6M489/76hzZvRnUnqSshv/Pn/vl6kLG+Qo718n1u8R9HIt9/VtT
 ROLTs6YZNkcv5pmQxvy2zOF7ewJLl6px4d+FNGYlorsD1utcB
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

The FLD_MOD function takes the start and end bits as parameter and will
generate a mask out of them, twice.

Let's pass the mask, so the caller can generate it once and we would use
it twice.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 30f281221a5de6b69cc3edd2bf643cf0f8bea63b..e4729a5b79ed5d554e05c020adb7e2d3e7a8f4d3 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -607,26 +607,25 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-static u32 FLD_MOD(u32 orig, u32 val, u32 start, u32 end)
+static u32 FLD_MOD(u32 orig, u32 val, u32 mask)
 {
-	return (orig & ~GENMASK(start, end)) | FIELD_PREP(GENMASK(start, end),
-							  val);
+	return (orig & ~mask) | FIELD_PREP(mask, val);
 }
 
 static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
 {
 	return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
 }
 
 static void REG_FLD_MOD(struct dispc_device *dispc, u32 idx, u32 val,
 			u32 start, u32 end)
 {
-	dispc_write(dispc, idx, FLD_MOD(dispc_read(dispc, idx), val,
-					start, end));
+	dispc_write(dispc, idx,
+		    FLD_MOD(dispc_read(dispc, idx), val, GENMASK(start, end)));
 }
 
 static u32 VID_REG_GET(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 		       u32 start, u32 end)
 {
@@ -636,12 +635,11 @@ static u32 VID_REG_GET(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 
 static void VID_REG_FLD_MOD(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 			    u32 val, u32 start, u32 end)
 {
 	dispc_vid_write(dispc, hw_plane, idx,
-			FLD_MOD(dispc_vid_read(dispc, hw_plane, idx),
-				val, start, end));
+			FLD_MOD(dispc_vid_read(dispc, hw_plane, idx), val, GENMASK(start, end)));
 }
 
 static u32 VP_REG_GET(struct dispc_device *dispc, u32 vp, u32 idx,
 		      u32 start, u32 end)
 {
@@ -649,20 +647,19 @@ static u32 VP_REG_GET(struct dispc_device *dispc, u32 vp, u32 idx,
 }
 
 static void VP_REG_FLD_MOD(struct dispc_device *dispc, u32 vp, u32 idx, u32 val,
 			   u32 start, u32 end)
 {
-	dispc_vp_write(dispc, vp, idx, FLD_MOD(dispc_vp_read(dispc, vp, idx),
-					       val, start, end));
+	dispc_vp_write(dispc, vp, idx,
+		       FLD_MOD(dispc_vp_read(dispc, vp, idx), val, GENMASK(start, end)));
 }
 
 static void OVR_REG_FLD_MOD(struct dispc_device *dispc, u32 ovr, u32 idx,
 			    u32 val, u32 start, u32 end)
 {
 	dispc_ovr_write(dispc, ovr, idx,
-			FLD_MOD(dispc_ovr_read(dispc, ovr, idx),
-				val, start, end));
+			FLD_MOD(dispc_ovr_read(dispc, ovr, idx), val, GENMASK(start, end)));
 }
 
 static dispc_irq_t dispc_vp_irq_from_raw(u32 stat, u32 hw_videoport)
 {
 	dispc_irq_t vp_stat = 0;
@@ -1155,11 +1152,12 @@ static void dispc_enable_am65x_oldi(struct dispc_device *dispc, u32 hw_videoport
 		dev_warn(dispc->dev, "%s: %d port width not supported\n",
 			 __func__, fmt->data_width);
 
 	oldi_cfg |= BIT(7); /* DEPOL */
 
-	oldi_cfg = FLD_MOD(oldi_cfg, fmt->am65x_oldi_mode_reg_val, 3, 1);
+	oldi_cfg = FLD_MOD(oldi_cfg, fmt->am65x_oldi_mode_reg_val,
+			   GENMASK(3, 1));
 
 	oldi_cfg |= BIT(12); /* SOFTRST */
 
 	oldi_cfg |= BIT(0); /* ENABLE */
 

-- 
2.50.1

