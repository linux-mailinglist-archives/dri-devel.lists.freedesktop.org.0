Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB91234016
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9724F6E9F3;
	Fri, 31 Jul 2020 07:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E3B6E915
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1596120517; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUVHf7pjz79eBEh+tIPCA/D+2iQEziFi0FluLsYiEGI=;
 b=AgDmNK7pSkDHnwXR8XpeuDJHMGJSudAOPqXg2CXYQx/zOnMu1XCLRuqBRO9PZO3jo80Kih
 KZSCOkmALkQLuBC1pFH3zKTFICr2HVJrQX9OolHS7tGGdxhuRfWK+59l/8IUfr74UaSBCb
 jpqzVu9Bh6Tvw9HW4KoDNqFaulo+F2Y=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] drm/ingenic: ipu: Only enable clock when needed
Date: Thu, 30 Jul 2020 16:48:30 +0200
Message-Id: <20200730144830.10479-4-paul@crapouillou.net>
In-Reply-To: <20200730144830.10479-1-paul@crapouillou.net>
References: <20200730144830.10479-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of keeping the IPU clock enabled constantly, enable and disable
it on demand, when the IPU plane is used. That way, we won't use any
extra power when the IPU is not used.

v2: Explain the reason of this patch

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 7dd2a6ae4994..fc8c6e970ee3 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -49,6 +49,7 @@ struct ingenic_ipu {
 	struct regmap *map;
 	struct clk *clk;
 	const struct soc_info *soc_info;
+	bool clk_enabled;
 
 	unsigned int num_w, num_h, denom_w, denom_h;
 
@@ -288,12 +289,23 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	const struct drm_format_info *finfo;
 	u32 ctrl, stride = 0, coef_index = 0, format = 0;
 	bool needs_modeset, upscaling_w, upscaling_h;
+	int err;
 
 	if (!state || !state->fb)
 		return;
 
 	finfo = drm_format_info(state->fb->format->format);
 
+	if (!ipu->clk_enabled) {
+		err = clk_enable(ipu->clk);
+		if (err) {
+			dev_err(ipu->dev, "Unable to enable clock: %d\n", err);
+			return;
+		}
+
+		ipu->clk_enabled = true;
+	}
+
 	/* Reset all the registers if needed */
 	needs_modeset = drm_atomic_crtc_needs_modeset(state->crtc->state);
 	if (needs_modeset) {
@@ -578,6 +590,11 @@ static void ingenic_ipu_plane_atomic_disable(struct drm_plane *plane,
 	regmap_clear_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_CHIP_EN);
 
 	ingenic_drm_plane_disable(ipu->master, plane);
+
+	if (ipu->clk_enabled) {
+		clk_disable(ipu->clk);
+		ipu->clk_enabled = false;
+	}
 }
 
 static const struct drm_plane_helper_funcs ingenic_ipu_plane_helper_funcs = {
@@ -761,9 +778,9 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 	drm_object_attach_property(&plane->base, ipu->sharpness_prop,
 				   ipu->sharpness);
 
-	err = clk_prepare_enable(ipu->clk);
+	err = clk_prepare(ipu->clk);
 	if (err) {
-		dev_err(dev, "Unable to enable clock\n");
+		dev_err(dev, "Unable to prepare clock\n");
 		return err;
 	}
 
@@ -775,7 +792,7 @@ static void ingenic_ipu_unbind(struct device *dev,
 {
 	struct ingenic_ipu *ipu = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(ipu->clk);
+	clk_unprepare(ipu->clk);
 }
 
 static const struct component_ops ingenic_ipu_ops = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
