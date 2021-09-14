Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5F40B8FA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFC66E7E5;
	Tue, 14 Sep 2021 20:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C346E7DD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:22:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id j1so514548pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=he4RVxjiUt6qq+hS9ItoNwGMz2RFKuSd1gOrK3CVNh8=;
 b=IsqQaYyfJQPRsY3AKcRBJejqTVNe9j6ckiBjbhDHPbns0gUnQpEEeztYEfkyRziDZq
 CvCMSfGhx3vNdeNQ4kr08iGhHpvNLkwEBerfWDNvPR6KcTJQ9/eoceUvzVFa7kBEcQ8G
 7hciJmxJL5gQkw5exglqU+l5tDjm720KSWctw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=he4RVxjiUt6qq+hS9ItoNwGMz2RFKuSd1gOrK3CVNh8=;
 b=RWlVC6zDBX7OP9VLvfktyF1M3nw4SjwnRiruP1p8jJg5+UpfJvHNiieL61PUN9t8Vd
 AE2SQJyywN6AEkQ2w4qAdMT355IN7qRLuU0lzI88l+5xvbgUNOyR0l1dhW+bNiSIaPBa
 JVycxvBiUKNOwh8TKrHV5SDwSBJVj/u9Pn0nOo7DaE2lkkVkLL2HRrolrTd0Oj42UNxi
 8CTDN4foHqhrKzJjMF+3CDKthgA8gC7N8R1gb53LLQq25KGKYXboMaDFnEO6jOhD1ST+
 5/v2azpfoHr42rOVXt/FhTpRgbDIuwGrjUNFJWa+MLkcW7tojore3O+9gAfEJhXiRX9/
 X5Yg==
X-Gm-Message-State: AOAM532sG5FvHgsgjRvS41xNYaUUsEUV7oYEU3SFaK12kpaRg5soybj8
 t2QbvuMUaLNACQMUjaBCsKIAHg==
X-Google-Smtp-Source: ABdhPJzWtieatXqRATkfS0SA0H5YiZYedNxBG6RoJo5RVfPn17sw7GyGtbkv02F/9kF5Wel//DDiag==
X-Received: by 2002:a17:90b:4acc:: with SMTP id
 mh12mr4128773pjb.122.1631650942466; 
 Tue, 14 Sep 2021 13:22:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
 by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:22:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/15] drm/edid: Allow querying/working with the panel ID
 from the EDID
Date: Tue, 14 Sep 2021 13:21:50 -0700
Message-Id: <20210914132020.v5.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
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

EDIDs have 32-bits worth of data which is intended to be used to
uniquely identify the make/model of a panel. This has historically
been used only internally in the EDID processing code to identify
quirks with panels.

We'd like to use this panel ID in panel drivers to identify which
panel is hooked up and from that information figure out power sequence
timings. Let's expose this information from the EDID code and also
allow it to be accessed early, before a connector has been created.

To make matching in the panel drivers code easier, we'll return the
panel ID as a 32-bit value. We'll provide some functions for
converting this value back and forth to something more human readable.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---

Changes in v5:
- Prettier encode panel ID function (thanks Andrzej!)

Changes in v4:
- Don't refer to "panel-simple" in commit message.
- decode_edid_id() => drm_edid_decode_panel_id()
- drm_do_get_edid_blk0() => drm_do_get_edid_base_block()
- drm_get_panel_id() => drm_edid_get_panel_id()
- encode_edid_id() => drm_edid_encode_panel_id()
- split panel id extraction out to its own function.

Changes in v3:
- Decode hex product ID w/ same endianness as everyone else.

 drivers/gpu/drm/drm_edid.c | 67 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 45 +++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 520fe1391769..f84e0dd264f4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2087,6 +2087,73 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+static u32 edid_extract_panel_id(const struct edid *edid)
+{
+	/*
+	 * In theory we could try to de-obfuscate this like edid_get_quirks()
+	 * does, but it's easier to just deal with a 32-bit number since then
+	 * it can be compared with "==".
+	 *
+	 * NOTE that we deal with endianness differently for the top half
+	 * of this ID than for the bottom half. The bottom half (the product
+	 * id) gets decoded as little endian by the EDID_PRODUCT_ID because
+	 * that's how everyone seems to interpret it. The top half (the mfg_id)
+	 * gets stored as big endian because that makes
+	 * drm_edid_encode_panel_id() and drm_edid_decode_panel_id() easier
+	 * to write (it's easier to extract the ASCII). It doesn't really
+	 * matter, though, as long as the number here is unique.
+	 */
+	return (u32)edid->mfg_id[0] << 24   |
+	       (u32)edid->mfg_id[1] << 16   |
+	       (u32)EDID_PRODUCT_ID(edid);
+}
+
+/**
+ * drm_edid_get_panel_id - Get a panel's ID through DDC
+ * @adapter: I2C adapter to use for DDC
+ *
+ * This function reads the first block of the EDID of a panel and (assuming
+ * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
+ * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
+ * supposed to be different for each different modem of panel.
+ *
+ * This function is intended to be used during early probing on devices where
+ * more than one panel might be present. Because of its intended use it must
+ * assume that the EDID of the panel is correct, at least as far as the ID
+ * is concerned (in other words, we don't process any overrides here).
+ *
+ * NOTE: it's expected that this function and drm_do_get_edid() will both
+ * be read the EDID, but there is no caching between them. Since we're only
+ * reading the first block, hopefully this extra overhead won't be too big.
+ *
+ * Return: A 32-bit ID that should be different for each make/model of panel.
+ *         See the functions drm_edid_encode_panel_id() and
+ *         drm_edid_decode_panel_id() for some details on the structure of this
+ *         ID.
+ */
+
+u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
+{
+	struct edid *edid;
+	u32 panel_id;
+
+	edid = drm_do_get_edid_base_block(drm_do_probe_ddc_edid, adapter,
+					  NULL, NULL);
+
+	/*
+	 * There are no manufacturer IDs of 0, so if there is a problem reading
+	 * the EDID then we'll just return 0.
+	 */
+	if (IS_ERR_OR_NULL(edid))
+		return 0;
+
+	panel_id = edid_extract_panel_id(edid);
+	kfree(edid);
+
+	return panel_id;
+}
+EXPORT_SYMBOL(drm_edid_get_panel_id);
+
 /**
  * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
  * @connector: connector we're probing
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index deccfd39e6db..ccc80cb7f86a 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -508,6 +508,50 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
 }
 
+/**
+ * drm_edid_encode_panel_id - Encode an ID for matching against drm_edid_get_panel_id()
+ * @vend: 3-character vendor string
+ * @product_id: The 16-bit product ID.
+ *
+ * This is a macro so that it can be calculated at compile time and used
+ * as an initializer.
+ *
+ * For instance:
+ *   drm_edid_encode_panel_id("BOE", 0x2d08) => 0x09e52d08
+ *
+ * Return: a 32-bit ID per panel.
+ */
+#define drm_edid_encode_panel_id(vend, product_id) \
+	((((u32)((vend)[0]) - '@') & 0x1f) << 26 | \
+	 (((u32)((vend)[1]) - '@') & 0x1f) << 21 | \
+	 (((u32)((vend)[2]) - '@') & 0x1f) << 16 | \
+	 ((product_id) & 0xffff))
+
+/**
+ * drm_edid_decode_panel_id - Decode a panel ID from drm_edid_encode_panel_id()
+ * @panel_id: The panel ID to decode.
+ * @vend: A 4-byte buffer to store the 3-letter vendor string plus a '\0'
+ *	  termination
+ * @product_id: The product ID will be returned here.
+ *
+ * For instance, after:
+ *   drm_edid_decode_panel_id(0x09e52d08, vend, &product_id)
+ * These will be true:
+ *   vend[0] = 'B'
+ *   vend[1] = 'O'
+ *   vend[2] = 'E'
+ *   vend[3] = '\0'
+ *   product_id = 0x2d08
+ */
+static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *product_id)
+{
+	*product_id = (u16)(panel_id & 0xffff);
+	vend[0] = '@' + ((panel_id >> 26) & 0x1f);
+	vend[1] = '@' + ((panel_id >> 21) & 0x1f);
+	vend[2] = '@' + ((panel_id >> 16) & 0x1f);
+	vend[3] = '\0';
+}
+
 bool drm_probe_ddc(struct i2c_adapter *adapter);
 struct edid *drm_do_get_edid(struct drm_connector *connector,
 	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
@@ -515,6 +559,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
+u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.33.0.309.g3052b89438-goog

