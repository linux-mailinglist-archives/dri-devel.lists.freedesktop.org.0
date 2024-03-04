Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FDD870B04
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18239112522;
	Mon,  4 Mar 2024 19:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ITp8STN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2775311250F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:52:19 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e622b46f45so1062529b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709581938; x=1710186738;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HAdbgCmL1JUyU1z1fzxxTd742Zn0pWVogzMahWVRBAc=;
 b=ITp8STN65T6v5sSPuKn76nCCp8ZlekBwwXhWN6ABqmKu0rYGr7bGjtmg2UnYNfT28+
 eiGeurA+zqvFmF01s8ghDcpDEIk/1Q91+ctX9+Tr8hRazdBpTd06pB+Yb9HA0Pcb/rGq
 7zBL1lwYbYWnF3pw2elFwRRGREOQekNfTkR5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709581938; x=1710186738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HAdbgCmL1JUyU1z1fzxxTd742Zn0pWVogzMahWVRBAc=;
 b=dwTFNa1N6JYzqY9Lw0WfW5F3N4w4chYR5IefU/CUPabDe8nogpkTSN8tr+PpnDvYkQ
 i+iGbuGghoWAQEn2HdqTTTXfqV4nCdjuHZs070EKo7gsgesFR+vHAZtaVO8r8wOp2Bpl
 atBKZkxVAZCl4SRUpTya14TSGzyxBBqjjYr53maalXwT80lG27nCcSqUTlE5agMsUFX+
 yHkIw9OAlNDnXYZSVwVhf2SrWmJZOnHs3jEX6grsSbeXrJCSL9JlHa1GFWvY4pzkJZpq
 YxYRWZGhtdzRcliBDVU/zYXfwmAvfyxZELTvDuz1531ehzEXBmPf3YkUy9UAO+TDjmCv
 szxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+8NJY+q/IoBSIB5cnAs5LEB49qHArW+D0cbrt6oUzdSWAsniBIvFeCv3y3RfrpoqEkt0DNDyWqS/eTQYZdUFZ/NvX+lWiHdJshGc7qb/D
X-Gm-Message-State: AOJu0YxY6UPcaYijrocO5tYCffuuKyr17IVqCoWyRxgw3oECUMr84W3f
 V1JGtxQqJp1FS9nvAm21VcJh1KxNLxK7GrdpIllxeyqOHtFeAkgh3RzSFQ+yHg==
X-Google-Smtp-Source: AGHT+IEOm+QcTl+86EEesCT2u/ZrmLwlc+r86Qai/ywJyBFgaBRFx4FVe6nrbf26Cfl3UKz5fVXo+Q==
X-Received: by 2002:aa7:8714:0:b0:6e6:136b:cfc with SMTP id
 b20-20020aa78714000000b006e6136b0cfcmr3990091pfo.4.1709581938522; 
 Mon, 04 Mar 2024 11:52:18 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bcf3:25da:25cd:199])
 by smtp.gmail.com with ESMTPSA id
 r27-20020aa7845b000000b006e04d2be954sm7600820pfn.187.2024.03.04.11.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:52:18 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] drm_edid: Add a function to get EDID base block
Date: Mon,  4 Mar 2024 11:44:56 -0800
Message-ID: <20240304195214.14563-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
In-Reply-To: <20240304195214.14563-1-hsinyi@chromium.org>
References: <20240304195214.14563-1-hsinyi@chromium.org>
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

Add drm_edid_get_base_block() to return the EDID base block, which is
introduced as a new type edid_base_block with the same layout as edid.

Caller can further use it to get panel id or check if the block contains
certain strings, such as panel name.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: change back to return only the first block.
---
 drivers/gpu/drm/drm_edid.c        | 58 ++++++++++++++++++-------------
 drivers/gpu/drm/panel/panel-edp.c |  8 +++--
 include/drm/drm_edid.h            |  7 +++-
 3 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 923c4423151c..13454bc64ca2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2770,58 +2770,66 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 }
 
 /**
- * drm_edid_get_panel_id - Get a panel's ID through DDC
- * @adapter: I2C adapter to use for DDC
+ * drm_edid_get_panel_id - Get a panel's ID from EDID base block
+ * @base_block: EDID base block that contains panel ID.
  *
- * This function reads the first block of the EDID of a panel and (assuming
+ * This function uses the first block of the EDID of a panel and (assuming
  * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
  * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
  * supposed to be different for each different modem of panel.
  *
+ * Return: A 32-bit ID that should be different for each make/model of panel.
+ *         See the functions drm_edid_encode_panel_id() and
+ *         drm_edid_decode_panel_id() for some details on the structure of this
+ *         ID.
+ */
+u32 drm_edid_get_panel_id(struct edid_base_block *base_block)
+{
+	return edid_extract_panel_id(&base_block->edid);
+}
+EXPORT_SYMBOL(drm_edid_get_panel_id);
+
+/**
+ * drm_edid_get_base_block - Get a panel's EDID base block
+ * @adapter: I2C adapter to use for DDC
+ *
+ * This function returns the first block of the EDID of a panel.
+ *
  * This function is intended to be used during early probing on devices where
  * more than one panel might be present. Because of its intended use it must
- * assume that the EDID of the panel is correct, at least as far as the ID
- * is concerned (in other words, we don't process any overrides here).
+ * assume that the EDID of the panel is correct, at least as far as the base
+ * block is concerned (in other words, we don't process any overrides here).
  *
  * NOTE: it's expected that this function and drm_do_get_edid() will both
  * be read the EDID, but there is no caching between them. Since we're only
  * reading the first block, hopefully this extra overhead won't be too big.
  *
- * Return: A 32-bit ID that should be different for each make/model of panel.
- *         See the functions drm_edid_encode_panel_id() and
- *         drm_edid_decode_panel_id() for some details on the structure of this
- *         ID.
+ * Caller should free the base block after use.
+ *
+ * Return: Pointer to allocated EDID base block, or NULL if failed.
  */
-
-u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
+struct edid_base_block *drm_edid_get_base_block(struct i2c_adapter *adapter)
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
+	return base_block;
 }
-EXPORT_SYMBOL(drm_edid_get_panel_id);
+EXPORT_SYMBOL(drm_edid_get_base_block);
 
 /**
  * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 745f3e48f02a..fc2d648fd3ab 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -766,6 +766,7 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
 	struct panel_desc *desc;
+	struct edid_base_block *base_block;
 	u32 panel_id;
 	char vend[4];
 	u16 product_id;
@@ -795,8 +796,11 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		goto exit;
 	}
 
-	panel_id = drm_edid_get_panel_id(panel->ddc);
-	if (!panel_id) {
+	base_block = drm_edid_get_base_block(panel->ddc);
+	if (base_block) {
+		panel_id = drm_edid_get_panel_id(base_block);
+		kfree(base_block);
+	} else {
 		dev_err(dev, "Couldn't identify panel via EDID\n");
 		ret = -EIO;
 		goto exit;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 7923bc00dc7a..2455d6ab2221 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -312,6 +312,10 @@ struct edid {
 	u8 checksum;
 } __packed;
 
+struct edid_base_block {
+	struct edid edid;
+} __packed;
+
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
 /* Short Audio Descriptor */
@@ -410,7 +414,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
-u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
+struct edid_base_block *drm_edid_get_base_block(struct i2c_adapter *adapter);
+u32 drm_edid_get_panel_id(struct edid_base_block *base_block);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.44.0.rc1.240.g4c46232300-goog

