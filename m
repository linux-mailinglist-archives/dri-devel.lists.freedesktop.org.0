Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97B0A56AEB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0F810EBB6;
	Fri,  7 Mar 2025 14:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PCLTywck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF25810EBB6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:54:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79FB044302;
 Fri,  7 Mar 2025 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741359296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlcuG6fkQ3ZcASdAzmH1VfD3piEH+PQQoeDSUro/5UA=;
 b=PCLTywckrPS0OT6tatuRLWqNXfierryuyBVfYUiyO6zX6nO8LzcBnFF2kCDkB6JAJdobsb
 riqgDOUp5qDwX8jh6M2BkReFlEGHLUT5BHzdlOdAAmNtS16Y7QDWGxDq4BId2bRjAMRUkQ
 uCQbcQiUWonS05FNK6n/+rWZisJaOJ3AnB6UdZGcYs6e6xkL/4VA5UtRceO/sGqmW9Ur9A
 VxYOFIeF8sSImTzbOA1C0IrHcDPAZxTnVvrfBVb6ctd848hWPKTG/sUJO78WeLfCUx7wXA
 ntTORNPukCgpSAQsz+imgo98lKUxaAzsKdqHesT0aEKIj+Yg+i3VXnzkL4wuLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 07 Mar 2025 15:54:49 +0100
Subject: [PATCH 3/3] drm/panel: simple: add Tianma P0700WXF1MBAA panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-tianma-p0700wxf1mbaa-v1-3-1c31039a3790@bootlin.com>
References: <20250307-tianma-p0700wxf1mbaa-v1-0-1c31039a3790@bootlin.com>
In-Reply-To: <20250307-tianma-p0700wxf1mbaa-v1-0-1c31039a3790@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdprhgtphhtt
 hhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Add the Tianma P0700WXF1MBAA 7" 1280x800 LVDS RGB TFT LCD panel.

Reuse the timings of the TM070JDHG34-00 as they are identical, even though
they are described differently by the datasheet as noted in the
comment. Power up/down timing are slightly different, so add a new struct
panel_desc for that.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9ca88ae83224e306734386dc4ce2d7ef5f6c84f2..4c260abea55200ba8d5dcd8b848e2848d3faeccb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4335,10 +4335,10 @@ static const struct panel_desc tianma_tm070jvhg33 = {
 };
 
 /*
- * The datasheet computes total blanking as back porch + front porch, not
- * including sync pulse width. This is for both H and V. To make the total
- * blanking and period correct, subtract the pulse width from the front
- * porch.
+ * The TM070JDHG34-00 datasheet computes total blanking as back porch +
+ * front porch, not including sync pulse width. This is for both H and
+ * V. To make the total blanking and period correct, subtract the pulse
+ * width from the front porch.
  *
  * This works well for the Min and Typ values, but for Max values the sync
  * pulse width is higher than back porch + front porch, so work around that
@@ -4347,6 +4347,10 @@ static const struct panel_desc tianma_tm070jvhg33 = {
  *
  * Exact datasheet values are added as a comment where they differ from the
  * ones implemented for the above reason.
+ *
+ * The P0700WXF1MBAA datasheet is even less detailed, only listing period
+ * and total blanking time, however the resulting values are the same as
+ * the TM070JDHG34-00.
  */
 static const struct display_timing tianma_tm070jdhg34_00_timing = {
 	.pixelclock = { 68400000, 71900000, 78100000 },
@@ -4379,6 +4383,24 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct panel_desc tianma_p0700wxf1mbaa = {
+	.timings = &tianma_tm070jdhg34_00_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 150, /* 149.76 */
+		.height = 94, /* 93.60 */
+	},
+	.delay = {
+		.prepare = 18,		/* Tr + Tp1 */
+		.enable = 152,		/* Tp2 + Tp5 */
+		.disable = 152,		/* Tp6 + Tp4 */
+		.unprepare = 120,	/* Tp3 */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing tianma_tm070rvhg71_timing = {
 	.pixelclock = { 27700000, 29200000, 39600000 },
 	.hactive = { 800, 800, 800 },
@@ -5155,6 +5177,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "tfc,s9700rtwv43tr-01b",
 		.data = &tfc_s9700rtwv43tr_01b,
+	}, {
+		.compatible = "tianma,p0700wxf1mbaa",
+		.data = &tianma_p0700wxf1mbaa,
 	}, {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,

-- 
2.48.1

