Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65437A9EAD0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 10:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDB310E3A7;
	Mon, 28 Apr 2025 08:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JKdkFimD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB6F10E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 08:32:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF034432FF;
 Mon, 28 Apr 2025 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745829128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qc4XQ8+2pTnqhK3Ek13XA1rEgbWt1yxdWNiOR8qYlC8=;
 b=JKdkFimDvh1IXkTI7bHL+X5N0TFU70CvzuyP7VzoICzIWXTU1QWLMwA27rwHTKyW4RXZln
 aZBdNi4/tIkWySiD9fI4DKCYk3x4fdXrBBgxyygNhe2LlVQ0MF3w99WSPrBnKOlWcCzd0h
 3Rjx6a0bUU7H6cxvFOqIDU93hWcUmpCEO6/Bne2BCbllWUJj3pdlyfxrtVqkQE/fjz8+fb
 0ToPQflb6NOc5qpOps2c0/5jfH2f8dE0VGENFsJx5C70TDZ3cBiCx1yR/Fngs7Ios7fiPZ
 +oDpJ3pwHARqtwi0le7ow0+B5aac26s0NR22XUmcAxwuo7ELbrRn5gWGYawB1Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 28 Apr 2025 10:32:07 +0200
Subject: [PATCH] drm: writeback: Fix drm_writeback_connector_cleanup signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-drm-fix-writeback-cleanup-v1-1-e4c723868b73@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAY9D2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ZSiXN20zArd8qLMktSkxORs3eSc1MS80gLdRENDc8s04yRLM0t
 DJaD+gqJUoEKw2dGxtbUAVawnAWsAAAA=
X-Change-ID: 20250428-drm-fix-writeback-cleanup-a1179f3b9691
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XaoKvzX2DeCVnCWRL6OK5qy4mw7MD8OvjOev2TR3R2k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoDz0HlJdE5uq8Cv4zrM+9yyw2lQyZRLv/vAclK
 zUsNoQVW5iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaA89BwAKCRAgrS7GWxAs
 4ivzEACclEox4KveQ00j00AwKybPrX9cOrZiQrR3nxODzCbx9pJSG4BzzbmsoosLdjE4AHFTtM/
 nHtGOlTTxyeLLsOWNoRRxS6rQxPoGUwnWG4yTXFLA7/gJQuuoAal0QxCOwMby9yzBAVIQIu+kv5
 NE/HKzFf+wMMlWgeZHlboZBuyYByIVBuN0OgA5zSgdSiwrcAYpBkBrT3MCIDSg8YdzoPQC3aUYE
 sv7fm82N9r3EbKqr3GtF0IC18QbpBi9cYNrPyU0WYh8FszQ+b6FzwhV+TT3YwYVasjbh1eblJ5z
 Rtz2atLDjYnuEBO4CACJRIPJ5LfCsPIUgaV7yYNFBvSKldrfYTsv829WiFHDrsoUzCWp4lwYVm/
 YJ1U2v36LCDM4nNm8EzAfjED8DeBUXsNnDdhGn5DL9bBTiElaWXpC9pFtCoJyLuPvtTQkGbMqrm
 NsU2pf5MFy9vSEjZvI7f1ENGeRRjFykT3bo8OQyMGkj+YMjvEcno2YCTq38JX8u9W7XUWFAPnlX
 NMYcN4ObjALKyehliTTDC0cGfPwEGXaC4P8v9SRKv/J7k+ooFRrmyYhq7hceTrj4s6mBUdnBPa8
 +COFgo7TGSZSvR0GretGp0XNNsyd3LJ+TJYQ+S8YGBlXPoVDjX9tL7N+IXX7gt/vbftNrtXe05s
 8WLbaEdeA9Ca7LA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuteejgeegffdvgeektedukeejveekheehudeltdegjefhuddvueelheelffeggfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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

The drm_writeback_connector_cleanup have the signature:

     static void drm_writeback_connector_cleanup(
		struct drm_device *dev,
		struct drm_writeback_connector *wb_connector)

But it is stored and used as a drmres_release_t

    typedef void (*drmres_release_t)(struct drm_device *dev, void *res);

While the current code is valid and does not produce any warning, the
CFI runtime check (CONFIG_CFI_CLANG) can fail because the function
signature is not the same as drmres_release_t.

In order to fix this, change the function signature to match what is
expected by drmres_release_t.

Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")

Suggested-by: Mark Yacoub <markyacoub@google.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index edbeab88ff2b..2f5c40616d9d 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -350,10 +350,11 @@ EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
  * clean up the attached encoder and the drm_connector.
  */
 static void drm_writeback_connector_cleanup(struct drm_device *dev,
-					    struct drm_writeback_connector *wb_connector)
+					    void *data)
 {
 	unsigned long flags;
 	struct drm_writeback_job *pos, *n;
+	struct drm_writeback_connector *wb_connector = data;
 
 	delete_writeback_properties(dev);
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
@@ -405,7 +406,7 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drmm_add_action_or_reset(dev, (void *)drm_writeback_connector_cleanup,
+	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
 				       wb_connector);
 	if (ret)
 		return ret;

---
base-commit: b848cd418aebdb313364b4843f41fae82281a823
change-id: 20250428-drm-fix-writeback-cleanup-a1179f3b9691

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

