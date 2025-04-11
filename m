Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD6A8661C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 21:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F210EC70;
	Fri, 11 Apr 2025 19:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nm6ZdkhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26A210EC73
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 19:19:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E2EB43B18;
 Fri, 11 Apr 2025 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744399195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FpIFKde5rlZy4GHFKcP0PF6eOPGVETg6wT9P7uZbyM=;
 b=nm6ZdkhNsiVjKIS8H70MeMSooaKI4+mGcC3KbUBcYmn7yYFTZav1NqctaWeS3WSK3mOmmq
 9eU/TGBc9fmMMRG5TbkoggRmFF8AaTfDTxtCKtnUesOJPPkWzYXvVU/++dVyyFgxcrlqhV
 v/bXzGe1yIjJ2qLmsXMvLYyEqKqtPdAdCku8fTwXCc/gOdZtNV6u6qJ2AUTzmpL4F9gwlr
 BuxMID72AXobUoZM4jQujDkY6IvCNFAnLoO3o+dq7h/YJ+WSjOK9m32gFZaBBtELbaAipv
 +LuhGROB2Q/htKGeIn4GwzM9Tt+YeQTyF1VMRhOZonH+21XF4Jokw+21LVVf9g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 11 Apr 2025 21:19:45 +0200
Subject: [PATCH v3 2/3] drm/panel: simple: Tianma TM070JDHG34-00: add
 delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-tianma-p0700wxf1mbaa-v3-2-acbefe9ea669@bootlin.com>
References: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
In-Reply-To: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehtiihimhhmvghrm
 hgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehsrghmsehrrghvnhgsohhrghdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
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

Add power on/off delays for the Tianma TM070JDHG34-00.

Fixes: bf6daaa281f7 ("drm/panel: simple: Add Tianma TM070JDHG34-00 panel support")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v3:
- add Fixes: and Cc:
- remove regulator delay
---
 drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index df718c4a86cb7dc0cd126e807d33306e5a21d8a0..fd7ee5d1ca280be306620def30d3b423106b4304 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4452,6 +4452,12 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
 		.width = 150, /* 149.76 */
 		.height = 94, /* 93.60 */
 	},
+	.delay = {
+		.prepare = 15,		/* Tp1 */
+		.enable = 150,		/* Tp2 */
+		.disable = 150,		/* Tp4 */
+		.unprepare = 120,	/* Tp3 */
+	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };

-- 
2.49.0

