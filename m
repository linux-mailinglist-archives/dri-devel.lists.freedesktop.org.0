Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419EBAF8441
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 01:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEB910E91A;
	Thu,  3 Jul 2025 23:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gqmaSlT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9810E91A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 23:30:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC9A6433D1;
 Thu,  3 Jul 2025 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751585448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tt2N6G+At1qhUgwy4yABNWj0FBwZam0bZ476OEZxgn4=;
 b=gqmaSlT648m32aJZHmRZiIlMw17YRd/ab1WZiUkOlWM2Fbx141xgrPqrbKgfduLMuedSKt
 b6O7l01E6WInSldYVRA7qVhJUXUE4jkD3cXbVZMJIuKUTHbhENXnDDgxTzYAwS78O1aNdw
 ZBYAenhvsbB+moitvIH61X1s7C7N/NAevks6HDSLW+YPlJtsCNjp3xvXORxFplaOlE0U9X
 2L0OqVxQnrtzpUNZTzRTPsj6s0Czdxoyq+G24HnKd2r2ECNptwhVSD5YlGwjw+l8SiQ19z
 NVXa1tH04EWBexm9plh6g6kT1/yEdrVdLxmSlpRWbtbn9750RpqgTk8puisevg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 04 Jul 2025 01:30:18 +0200
Subject: [PATCH v2] drm/bridge: tc358767: fix uninitialized variable regression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIkSZ2gC/52NTQqDMBCFryJZd0p+NEpXvUdxEZNRB9SUiUiLe
 PdGj9Dl997jfbtIyIRJPIpdMG6UKC4Z9K0QfnTLgEAhs9BSV7KWBgLP0DGF3Lhpih56+sDqTdX
 UtgbGgTGdJ1AZi043Vrneinz3ZszTS/VqM4+U1sjfy7ypM/1DsilQ0PRalz5Ia3z57GJcJ1ruP
 s6iPY7jB/R1LR7iAAAA
X-Change-ID: 20250703-drm-bridge-alloc-fix-tc358767-regression-536ea2861af6
To: "Colin King (gmail)" <colin.i.king@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeuleetffeutdfhvedvjeffuddtteejtdfhffdvhedvleevteekjeejgfejgfehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphephedurddujeelrddutdefrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeehuddrudejledruddtfedrheehpdhhvghloheplgduledvrdduieekrddurdduleeingdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
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

Commit a59a27176914 ("drm/bridge: tc358767: convert to
devm_drm_bridge_alloc() API") split tc_probe_bridge_endpoint() in two
functions, thus duplicating the loop over the endpoints in each of those
functions. However it missed duplicating the of_graph_parse_endpoint() call
which initializes the struct of_endpoint, resulting in an uninitialized
read.

Fixes: a59a27176914 ("drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API")
Cc: stable@vger.kernel.org
Reported-by: Colin King (gmail) <colin.i.king@gmail.com>
Closes: https://lore.kernel.org/all/056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com/
Reviewed-by: Colin Ian King <colin.i.king@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
- Link to v1: https://lore.kernel.org/r/20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com
---

Changes in v2:
- fix 'Closes:' tag URL
- add 'Cc: stable@vger.kernel.org'
---
 drivers/gpu/drm/bridge/tc358767.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 61559467e2d22b4b1b4223c97766ca3bf58908fd..562fea47b3ecf360e64a414e95ab5d645e610e9e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2422,6 +2422,7 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc, enum tc_mode mode)
 	struct device_node *node = NULL;
 
 	for_each_endpoint_of_node(dev->of_node, node) {
+		of_graph_parse_endpoint(node, &endpoint);
 		if (endpoint.port == 2) {
 			of_property_read_u8_array(node, "toshiba,pre-emphasis",
 						  tc->pre_emphasis,

---
base-commit: b4cd18f485687a2061ee7a0ce6833851fc4438da
change-id: 20250703-drm-bridge-alloc-fix-tc358767-regression-536ea2861af6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

