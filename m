Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48F23402B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B206EA07;
	Fri, 31 Jul 2020 07:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8036E914
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1596120516; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdoE1nkLDPbTG7FoC1IHhp8tIhNRgkzWtzI0H+/zMgQ=;
 b=KC3TWDmn1K7+LRoLXGczHqEpdLlgf0dZ/d9rTADan7xOdnYeqYhPcBLLYFkzwyFBVin8aE
 tMLvBhYZX7m4SZAiBwfjsI4MbjqTwhhApqK21WmODvvyX5AlDKwtm4Hj/nziIaccY8OKNq
 XLlRe5/RYoIehupCk5crTM7mg5VesCo=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/3] drm/ingenic: ipu: Only restart manually on older SoCs
Date: Thu, 30 Jul 2020 16:48:28 +0200
Message-Id: <20200730144830.10479-2-paul@crapouillou.net>
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

On older SoCs, it is necessary to restart manually the IPU when a frame
is done processing. Doing so on newer SoCs (JZ4760/70) kinds of work
too, until the input or output resolutions or the framerate are too
high.

Make it work properly on newer SoCs by letting the LCD controller
trigger the IPU frame restart signal.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 7a0a8bd865d3..7eae56fa92ea 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -35,6 +35,7 @@ struct soc_info {
 	const u32 *formats;
 	size_t num_formats;
 	bool has_bicubic;
+	bool manual_restart;
 
 	void (*set_coefs)(struct ingenic_ipu *ipu, unsigned int reg,
 			  unsigned int sharpness, bool downscale,
@@ -645,7 +646,8 @@ static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
 	unsigned int dummy;
 
 	/* dummy read allows CPU to reconfigure IPU */
-	regmap_read(ipu->map, JZ_REG_IPU_STATUS, &dummy);
+	if (ipu->soc_info->manual_restart)
+		regmap_read(ipu->map, JZ_REG_IPU_STATUS, &dummy);
 
 	/* ACK interrupt */
 	regmap_write(ipu->map, JZ_REG_IPU_STATUS, 0);
@@ -656,7 +658,8 @@ static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
 	regmap_write(ipu->map, JZ_REG_IPU_V_ADDR, ipu->addr_v);
 
 	/* Run IPU for the new frame */
-	regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RUN);
+	if (ipu->soc_info->manual_restart)
+		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RUN);
 
 	drm_crtc_handle_vblank(crtc);
 
@@ -806,6 +809,7 @@ static const struct soc_info jz4725b_soc_info = {
 	.formats	= jz4725b_ipu_formats,
 	.num_formats	= ARRAY_SIZE(jz4725b_ipu_formats),
 	.has_bicubic	= false,
+	.manual_restart	= true,
 	.set_coefs	= jz4725b_set_coefs,
 };
 
@@ -831,6 +835,7 @@ static const struct soc_info jz4760_soc_info = {
 	.formats	= jz4760_ipu_formats,
 	.num_formats	= ARRAY_SIZE(jz4760_ipu_formats),
 	.has_bicubic	= true,
+	.manual_restart	= false,
 	.set_coefs	= jz4760_set_coefs,
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
