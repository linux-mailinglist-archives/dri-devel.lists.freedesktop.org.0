Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19953872BD6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB7410E75A;
	Wed,  6 Mar 2024 00:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TX6rwnaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8325110E75A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:43:52 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3c1a2f7e302so3443817b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709685831; x=1710290631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwnVHHF+SAy7EA+lave/HwOmjTm+ySnhWai82DKOimc=;
 b=TX6rwnaMHkd/TeGRxIF7wwcHi5+Mr19mrlUu2yqmKbi6UagFBGJeB2Rw6VRwZlqzDQ
 8dSLhbCW95cnizj7HjbvnJA58P1fZ8aR/F75Y/YszhGsYU5bEFiNNfGYxjp09gWEF36U
 PCCuusYdUt2HFjudITvNZ708TOM8cKjXzJxOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685831; x=1710290631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwnVHHF+SAy7EA+lave/HwOmjTm+ySnhWai82DKOimc=;
 b=BpEWptiBlfAKnMy9ul4/XWQ3lQk+hhFFwbg0OFUhA/mwZyUjgs9VPyM7y/jOIndDFd
 kSfW4p2vzJ9mtngcsDI+NpzYXtBllQIGYEMtqsLrWXymfy7SnQqvJzbQJhN0oSo5KEEL
 8Ha/1dqzE5TKXctn0jAXJlx2wIqFtDi92K/ASmc7St3X/Q56ldVqg3QsJ4Wtb85P3/bZ
 y6w9un1hCt4YV0nIOe+tsoTGfkotBCOx35FLA159TCJyVNSoJrNX6c9vnhT95cbAoJiC
 07mtrqaio2ur7VSOnfz/5uT0A+/BZDKPsB2leiwCzngd1ZI0CU1vLdcDubzgjwJfFVdN
 GRdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEiEVA6+GOENyExtTLL+8PEDXfjF9dowQvc7B8yYme5bWkrWet8BzFtqisOlmfRVi6Bb4lfqPreGcjl3KVmv1ZXslH8t3OizK1tYxfkshx
X-Gm-Message-State: AOJu0YwZyDydByaXd/Vw+6ItZ1gZXym1hWLXeUGno34BciFA4XZ4JWIp
 qazhrzTJz7jMb5MxuPZmEcNEJ9zQw52l6D0jlV+GY2G0P3BNwu4yB7PMDkdAYQ==
X-Google-Smtp-Source: AGHT+IEohVRqWaXH8EBXFArEg9r3SrVjJiR1PWflATvQ2Oat0xAfK/zbvZ2qASv1MelHpAUDLJQEZg==
X-Received: by 2002:a05:6808:4286:b0:3c1:f46c:d796 with SMTP id
 dq6-20020a056808428600b003c1f46cd796mr3054966oib.34.1709685831519; 
 Tue, 05 Mar 2024 16:43:51 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:29bc:b3d:1ba8:cf52])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a631725000000b005dc48e56191sm8512885pgl.11.2024.03.05.16.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 16:43:51 -0800 (PST)
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
Subject: [PATCH v4 1/5] drm_edid: Add a function to get EDID base block
Date: Tue,  5 Mar 2024 16:34:01 -0800
Message-ID: <20240306004347.974304-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306004347.974304-1-hsinyi@chromium.org>
References: <20240306004347.974304-1-hsinyi@chromium.org>
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v3->v4: change drm_edid_read_base_block return type to drm_edid.
---
 drivers/gpu/drm/drm_edid.c        | 63 +++++++++++++++++++------------
 drivers/gpu/drm/panel/panel-edp.c |  8 +++-
 include/drm/drm_edid.h            |  3 +-
 3 files changed, 46 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 923c4423151c..f9e09f327f81 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2770,58 +2770,71 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 }
 
 /**
- * drm_edid_get_panel_id - Get a panel's ID through DDC
- * @adapter: I2C adapter to use for DDC
+ * drm_edid_get_panel_id - Get a panel's ID from EDID
+ * @drm_edid: EDID that contains panel ID.
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
+u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid)
+{
+	return edid_extract_panel_id(drm_edid->edid);
+}
+EXPORT_SYMBOL(drm_edid_get_panel_id);
+
+/**
+ * drm_edid_read_base_block - Get a panel's EDID base block
+ * @adapter: I2C adapter to use for DDC
+ *
+ * This function returns the drm_edid containing the first block of the EDID of
+ * a panel.
+ *
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
+	return drm_edid_alloc(base_block, EDID_LENGTH);
 }
-EXPORT_SYMBOL(drm_edid_get_panel_id);
+EXPORT_SYMBOL(drm_edid_read_base_block);
 
 /**
  * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 745f3e48f02a..d094cfc43da8 100644
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
index 7923bc00dc7a..9686a7cee6a6 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -410,7 +410,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
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

