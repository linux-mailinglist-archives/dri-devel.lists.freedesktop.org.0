Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBDAA05E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 10:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A9010E090;
	Tue, 29 Apr 2025 08:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RSIFGIbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D018110E090
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 08:36:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D52D1FCEA;
 Tue, 29 Apr 2025 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745915786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=esHd36pt+N8ryAwFfhcdTZSNZRbzqDw4YcR4AKfDyms=;
 b=RSIFGIbC2isNSHaUIMssleEx8oUn09KMV74iBNdBsc8Ljyi1ulehg9lrYgKkCmjHP6D0/z
 g7BLt+v0UzpAWlxicIeqyh/PqNl3wmLl/xxNWIeEHkzdqD0NsGpceudUUCcacVA8lj9KEW
 rwlod4zKqpfJBmBXPKdm15CB4tSalEVJphYA0DXymWcGpu2LXSfUCs7GjWTd2CMIpCQmB8
 qq/DignU2f64SMAKvITf7d+vFikwc+YQZYJByZTH1XXvtvdR7TKHNMeCkpWmhhnqC6a8wh
 1Zal3lmsikZmwip0ZMT9wvaEbCUw1R88g99FLQvhqJM3Pe6HF1ta+caYvVTOCg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 29 Apr 2025 10:36:23 +0200
Subject: [PATCH v2] drm: writeback: Fix drm_writeback_connector_cleanup
 signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIaPEGgC/42OzRLCIAyEX6XD2ahQtT8n38PpATDVjAIVaK3T6
 buLdrx7y2az+2ViAT1hYHU2MY8DBXI2CbHKmL5Ke0Ggc9JMbMV+uxMlnL2BlkZ4eoqopL6BvqO
 0fQeS86Jqc1UdKs5SvvOYDr/dpybpK4Xo/OuLGvhn+0/rwIED7nQh8vJQqiI/KufinexaO8Oae
 QF5fPTp97jQmJIBIfmGYp19ug0FvfkNYHGMKTq/AaPsiGz+AAAA
X-Change-ID: 20250428-drm-fix-writeback-cleanup-a1179f3b9691
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2728;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CD3pCW7rSNJV61xpSf6mpjklctqkwJQ6xLMNue4gAHE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoEI+Iu98lXztO/neTQJlRQ7TY60V6ITeCKFa8E
 7DJOQS56nuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaBCPiAAKCRAgrS7GWxAs
 4jQjD/0eA941lwlgFehTz8o4ybkma1QDp/av7/CQAd2Hda/PSMxhsceoLfnWhyLJeZ2I+BLzeAf
 dnAHDWVKnnKgrkusrb0uJ/hLv0s/XbJ9ZgyDw4aRVEB3k9Z6zXkfx5OUveudoUwxFVyOUiWZpmP
 9/9P0SFJYY2/jFmJBoBXnQGJD2N+xuV52xGYtonC2l3sqvlpbwFA3sS0UhZmeYAK82sLO9r+yTj
 wTIotW/retw+k8vj4SQDcaZVIHtG+rHAQnBR22xaiuzdAZDDEi9ICObZhMkfDy0yzXsQvS/BO2z
 KIB/3KA5dt7GNk7anZG1qJeNgXiUTY98LQ596pROQHaUNUOztz83UYmFPgmsqNHT+SemhPyYwEp
 hPBsKFLqibJbOUhBM52zfyXzv4aEpJP9F2NkFzldZQ4W8InvwpzExd56YRQJF0P6sLIj8yoDE9w
 hJPUu9quXd5qLD2gFaUbCpmDEqGI2GBwTCcH+6D6EdDSBinZJFUZqzl0R5iJyLnJchsoRLGAtV0
 P8AcY8VAMixsz8IVz3Fye9VFNAHsFDd0PJwsHPzUj+GlapiTPajDULgUYxVA1dCCoswf7cnIbhu
 9MYilHyRRoashN/VS04Ns7cH1SQtYf/tub+FEcejq+0hsNIkatkfGlsxNQ2AOiBAO143r1lktRu
 0NHixcRxSbiSxhQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeffeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhhedtjeekhfdtteeftefgieffveeluedvueejleevfeevgedvjeevheehffehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvu
 ggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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
Changes in v2:
- Forgot to update the documentation
- Link to v1: https://lore.kernel.org/r/20250428-drm-fix-writeback-cleanup-v1-1-e4c723868b73@bootlin.com
---
 drivers/gpu/drm/drm_writeback.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index edbeab88ff2b..d983ee85cf13 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -343,17 +343,18 @@ EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
  * @dev: DRM device
- * @wb_connector: Pointer to the writeback connector to clean up
+ * @data: Pointer to the writeback connector to clean up
  *
  * This will decrement the reference counter of blobs and destroy properties. It
  * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
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
base-commit: a22e0051f9eb2281b181218d97f77cebc299310d
change-id: 20250428-drm-fix-writeback-cleanup-a1179f3b9691

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

