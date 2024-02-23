Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861F861FED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 23:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA6410E122;
	Fri, 23 Feb 2024 22:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QXtxsFbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A36610E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 22:40:04 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5e44a2e34eeso1212827a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708728003; x=1709332803;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2NLOgJvFk9/xpCgoWWX0mwY7XC1SqoEPJetQl38NRg=;
 b=QXtxsFbS8I7orshaeb8tDfMw0/KbGl9y4yDe+hA0Pi8pP4AeU4vrKpAQnXlcOE2vD9
 F7A1SphXFBdy6ywirtucKhZKjyqu0zVc8sAHTjuDbCAs1y30c4uiYHr+pCE0BbWHrYJL
 eLDzvwn0xrPIzkU5eQVRsdcsYJXtLz7aoMtI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708728003; x=1709332803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2NLOgJvFk9/xpCgoWWX0mwY7XC1SqoEPJetQl38NRg=;
 b=vXUFRfTHVCFO/Jxy0AKk3YBW/ngRYfllDA+J+d5Vqdc2OlBZR2+qiyIWHQjyNr3e82
 duPDyX/54+/iKtW2IcMIr5+TrA8HD6zs0/Ho/Vl+Cc6R8ZyRf1H1NoZvTTf6aXO/tQ2o
 RhTNKmDiciTz334KrvZ5tn8t0Wu2wW84rw7IVAawIFw27RJrnstVCCT0UUPgLSVxiw2k
 0fiA4c46WYJ0/TeCg0WfGe/+3QaS94C9GKzLwP5xvIje5+k26jfLDZDaH2C79iMAXGTk
 BvmZDWgVY1epAl91+Rv/MG584lYEtDYlLP6TprB0wP9SwhlGYgjP1Ool93+6Ohn2NkAb
 SJ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkJCKP3CvQWRtmza/gsXvypQqOpu+GXxCMahTQeeidr0Gu+aaYZx+NUWLfwIYapezcxfNZLLdcUYT/N8gGI85OdhtXlY4v4GSY08pKCzbI
X-Gm-Message-State: AOJu0YywNSYDAr6JCIn92kQPMHqHztzNphsvbC1arn4W/97Vy6QJEWAy
 pMGA68muCe9BhuyxmYE6jw4U1qof5xFqPO26Scv0ikMKKA82Mg8LLjc6MURBtg==
X-Google-Smtp-Source: AGHT+IEqAmzztLLv9pUMQIH60NYC+Jh68DPyMwr8SAMILCs8UUd15S395jHWIMuyyILxwr0lYYsk4g==
X-Received: by 2002:a17:90b:380d:b0:299:2da5:a843 with SMTP id
 mq13-20020a17090b380d00b002992da5a843mr1194908pjb.14.1708728003603; 
 Fri, 23 Feb 2024 14:40:03 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:8ff9:a089:c05c:9af])
 by smtp.gmail.com with ESMTPSA id
 cz4-20020a17090ad44400b002966a13f2e9sm2032873pjb.37.2024.02.23.14.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 14:40:03 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm_edid: Add a function to get EDID base block
Date: Fri, 23 Feb 2024 14:29:17 -0800
Message-ID: <20240223223958.3887423-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240223223958.3887423-1-hsinyi@chromium.org>
References: <20240223223958.3887423-1-hsinyi@chromium.org>
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
the hash of entire EDID base block to distinguish these panel variants.

Add drm_edid_get_base_block to returns the EDID base block, so caller can
further use it to get panel id and/or the hash.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++++--------------
 drivers/gpu/drm/panel/panel-edp.c |  8 +++--
 include/drm/drm_edid.h            |  3 +-
 3 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 923c4423151c..55598ca4a5d1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2770,58 +2770,63 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 }
 
 /**
- * drm_edid_get_panel_id - Get a panel's ID through DDC
- * @adapter: I2C adapter to use for DDC
+ * drm_edid_get_panel_id - Get a panel's ID from EDID base block
+ * @base_bock: EDID base block that contains panel ID.
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
+u32 drm_edid_get_panel_id(void *base_block)
+{
+	return edid_extract_panel_id(base_block);
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
  */
-
-u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
+void *drm_edid_get_base_block(struct i2c_adapter *adapter)
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
index bd71d239272a..f6ddbaa103b5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -763,6 +763,7 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
 	struct panel_desc *desc;
+	void *base_block;
 	u32 panel_id;
 	char vend[4];
 	u16 product_id;
@@ -792,8 +793,11 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
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
index 7923bc00dc7a..56b60f9204d3 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -410,7 +410,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
-u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
+void *drm_edid_get_base_block(struct i2c_adapter *adapter);
+u32 drm_edid_get_panel_id(void *base_block);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.44.0.rc0.258.g7320e95886-goog

