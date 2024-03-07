Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A89875AD5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958110F1FD;
	Thu,  7 Mar 2024 23:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S7PaJ6y4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0793010F1FD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:06:58 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1dd68d4cff1so474435ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709852818; x=1710457618;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wkLCh/y3IjSBIuB7VpYySGCB+kkdSKNkvE8IPrhfDCM=;
 b=S7PaJ6y43M1S5gIju/BlHrp4/djkWrtLNx6aHXfzK7XQWDQjZTOixB2Qxnm/LzcWmH
 J8aueoq91MXkYWX897AJqLXql5q0R+gCTUXKZneiV+NJrjVeXVfBhlrCyOOG3uz+tmoT
 QPnbSO7AeFPjz4jUBBP8BjoZR6LyXkWbB0pzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709852818; x=1710457618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkLCh/y3IjSBIuB7VpYySGCB+kkdSKNkvE8IPrhfDCM=;
 b=G9jLkeXn4Zq2gWGYnOueXPgf81gNu3KSxso2lNgyGyI2jpCjpRJ4aLQ1CQofwTj4Gh
 MBoWMvpRr3mGtCp5EBSGBqTkq6g32h7Fwhq7ik16P3D2PS3iopqBLVOITiK3eYGOhegx
 UvGOcnVzRq23q2//fUcjGAsJ8k+QX/KGdj7U+2ieoQU7IvnjWBA400C1H99PKE5h4BWi
 mTfaDjnFlPrKEHl+RGPK0WQpt5mz3+OTn88wdh7k2ogdzfeY9pDuO9eFjVOCLR6OrOUE
 3ggPO5sPx77NnRaRDZGWs9fmwyymLxuAlpb4yyPD7gsFDJvbqbMTYyvXCvRC8F7KtKGC
 ojbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+IaB7wsa+c6Xh2BlZJjnx8kq/D+SL3WBrSdTW+MTPeHTFcjpiulrDEEJIUdOYYuxzKtAuPv+1VoR/SNwCvDP7dgZcNekR27tp2gOwOiF
X-Gm-Message-State: AOJu0YyvYsk56OmQXwCqEXBEnvfcOXdiOQlkYuEo0eB3Qr9YBHcthPAa
 cQ/G7kdrw6I7cU9taxxbTF7CfH0iR+UnwQq59MRvCdvCBWUoGfmsi3H+KP2DiQ==
X-Google-Smtp-Source: AGHT+IF2gvDVIYxcgS8kfWnjSoptKcy1MM6/6fHNuxZ8umM7rh3jijEYYGJernNayoi6EgPjGatHJw==
X-Received: by 2002:a17:902:cf0f:b0:1dc:f157:51ba with SMTP id
 i15-20020a170902cf0f00b001dcf15751bamr11928254plg.35.1709852818332; 
 Thu, 07 Mar 2024 15:06:58 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bf8f:10d4:f877:bee3])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b001db63cfe07dsm15196654plc.283.2024.03.07.15.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:06:58 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] drm_edid: Add a function to get EDID base block
Date: Thu,  7 Mar 2024 14:57:41 -0800
Message-ID: <20240307230653.1807557-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240307230653.1807557-1-hsinyi@chromium.org>
References: <20240307230653.1807557-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It's found that some panels have variants that they share the same panel id
although their EDID and names are different. Besides panel id, now we need
more information from the EDID base block to distinguish these panel
variants.

Add drm_edid_read_base_block() to return the EDID base block, which is
wrapped in struct drm_edid.

Caller can further use it to get panel id or check if the block contains
certain strings, such as panel name.

Merge drm_edid_get_panel_id() and edid_extract_panel_id() into one
function.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
v5->v6: 
1. squash v5 2/6 into this patch.
2. check edid size.
---
 drivers/gpu/drm/drm_edid.c        | 71 ++++++++++++++++++-------------
 drivers/gpu/drm/panel/panel-edp.c |  8 +++-
 include/drm/drm_edid.h            |  3 +-
 3 files changed, 50 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1ad94473e400..284255a0315e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2743,8 +2743,27 @@ const struct drm_edid *drm_edid_read(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_edid_read);
 
-static u32 edid_extract_panel_id(const struct edid *edid)
+/**
+ * drm_edid_get_panel_id - Get a panel's ID from EDID
+ * @drm_edid: EDID that contains panel ID.
+ *
+ * This function uses the first block of the EDID of a panel and (assuming
+ * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
+ * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
+ * supposed to be different for each different modem of panel.
+ *
+ * Return: A 32-bit ID that should be different for each make/model of panel.
+ *         See the functions drm_edid_encode_panel_id() and
+ *         drm_edid_decode_panel_id() for some details on the structure of this
+ *         ID. Return 0 if the EDID size is less than a base block.
+ */
+u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid)
 {
+	const struct edid *edid = drm_edid->edid;
+
+	if (drm_edid->size < EDID_LENGTH)
+		return 0;
+
 	/*
 	 * We represent the ID as a 32-bit number so it can easily be compared
 	 * with "==".
@@ -2762,60 +2781,54 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 	       (u32)edid->mfg_id[1] << 16   |
 	       (u32)EDID_PRODUCT_ID(edid);
 }
+EXPORT_SYMBOL(drm_edid_get_panel_id);
 
 /**
- * drm_edid_get_panel_id - Get a panel's ID through DDC
+ * drm_edid_read_base_block - Get a panel's EDID base block
  * @adapter: I2C adapter to use for DDC
  *
- * This function reads the first block of the EDID of a panel and (assuming
- * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
- * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
- * supposed to be different for each different modem of panel.
+ * This function returns the drm_edid containing the first block of the EDID of
+ * a panel.
  *
  * This function is intended to be used during early probing on devices where
  * more than one panel might be present. Because of its intended use it must
- * assume that the EDID of the panel is correct, at least as far as the ID
- * is concerned (in other words, we don't process any overrides here).
+ * assume that the EDID of the panel is correct, at least as far as the base
+ * block is concerned (in other words, we don't process any overrides here).
+ *
+ * Caller should call drm_edid_free() after use.
  *
  * NOTE: it's expected that this function and drm_do_get_edid() will both
  * be read the EDID, but there is no caching between them. Since we're only
  * reading the first block, hopefully this extra overhead won't be too big.
  *
- * Return: A 32-bit ID that should be different for each make/model of panel.
- *         See the functions drm_edid_encode_panel_id() and
- *         drm_edid_decode_panel_id() for some details on the structure of this
- *         ID.
+ * WARNING: Only use this function when the connector is unknown. For example,
+ * during the early probe of panel. The EDID read from the function is temporary
+ * and should be replaced by the full EDID returned from other drm_edid_read.
+ *
+ * Return: Pointer to allocated EDID base block, or NULL on any failure.
  */
-
-u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
+const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter)
 {
 	enum edid_block_status status;
 	void *base_block;
-	u32 panel_id = 0;
-
-	/*
-	 * There are no manufacturer IDs of 0, so if there is a problem reading
-	 * the EDID then we'll just return 0.
-	 */
 
 	base_block = kzalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!base_block)
-		return 0;
+		return NULL;
 
 	status = edid_block_read(base_block, 0, drm_do_probe_ddc_edid, adapter);
 
 	edid_block_status_print(status, base_block, 0);
 
-	if (edid_block_status_valid(status, edid_block_tag(base_block)))
-		panel_id = edid_extract_panel_id(base_block);
-	else
+	if (!edid_block_status_valid(status, edid_block_tag(base_block))) {
 		edid_block_dump(KERN_NOTICE, base_block, 0);
+		kfree(base_block);
+		return NULL;
+	}
 
-	kfree(base_block);
-
-	return panel_id;
+	return _drm_edid_alloc(base_block, EDID_LENGTH);
 }
-EXPORT_SYMBOL(drm_edid_get_panel_id);
+EXPORT_SYMBOL(drm_edid_read_base_block);
 
 /**
  * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
@@ -2868,7 +2881,7 @@ EXPORT_SYMBOL(drm_edid_duplicate);
  */
 static u32 edid_get_quirks(const struct drm_edid *drm_edid)
 {
-	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
+	u32 panel_id = drm_edid_get_panel_id(drm_edid);
 	const struct edid_quirk *quirk;
 	int i;
 
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3fb5fcd326a4..fe51680feb61 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -766,6 +766,7 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
 	struct panel_desc *desc;
+	const struct drm_edid *base_block;
 	u32 panel_id;
 	char vend[4];
 	u16 product_id;
@@ -795,8 +796,11 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		goto exit;
 	}
 
-	panel_id = drm_edid_get_panel_id(panel->ddc);
-	if (!panel_id) {
+	base_block = drm_edid_read_base_block(panel->ddc);
+	if (base_block) {
+		panel_id = drm_edid_get_panel_id(base_block);
+		drm_edid_free(base_block);
+	} else {
 		dev_err(dev, "Couldn't identify panel via EDID\n");
 		ret = -EIO;
 		goto exit;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 70ae6c290bdc..8b233865b085 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -565,7 +565,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
-u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
+const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
+u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.44.0.278.ge034bb2e1d-goog

