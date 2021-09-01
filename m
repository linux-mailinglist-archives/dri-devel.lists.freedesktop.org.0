Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B503FE3A2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A5F6E29D;
	Wed,  1 Sep 2021 20:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDEB6E2C0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id bg1so356630plb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFnoIbGurLHygQYzR/1vkknC/vUF1WONmleiQRHkl10=;
 b=d5lm75+RLct6X/Jl04wCP559lXGWD7QrbiXaXZsBpu0T/HPKljNQr18x6eRHAPB/Uv
 A6MK+U8iAPjyDVn9LejUQEv7cJDRahTvyejMAVtMF5Rf1AiBO8Rih3QARced7J00qOhd
 gvUqgtvGrIcE//kMcXNfoL+wYIvMqL3MBTWUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFnoIbGurLHygQYzR/1vkknC/vUF1WONmleiQRHkl10=;
 b=dvMA8pr9vxgK7NitUihaNdv1zHpWLG5eJwRklbD2GBQb9hIulrvqbvXP/u8oa7jelw
 xUJsGGQKj1KUGxRbZSx/2xdeQe8Noh/WRwdzZn+SRbXXI4VK+BGA3s+PY7QOuelhgOEK
 YqwUK2G4ZaiFJxVKrZBWSoOIZSRqO7x6brINRbc6jzXmU1C8aacj08t/OvaHLil1ayA3
 aRszdmRuJQcst7bAMzXPbpHIw+8syusZmJNj8THEWT7vJnXmdZJLgDaD8iAl2uQ1N1H/
 1egGg/KP01f0sGGoLJHQrP62g8WH3gjC+iDl/MYP93kEX9CF/Ajsw3xUyCo/Bj0A/2rs
 OwmQ==
X-Gm-Message-State: AOAM532xUhxbbJ0obSyqty6ttUL7dC28zLvIePaGpHaDdNECwqhHpbuB
 /2Tk92z3NPGnhaivf9Osyh2S4g==
X-Google-Smtp-Source: ABdhPJz9dXAu9z9CahmGdhaS7l63HuYWmgsF9bVQKFGNROPgTEDy5l0aF6odYgaVO9CJl819YB0BNQ==
X-Received: by 2002:a17:90b:128a:: with SMTP id
 fw10mr1225651pjb.212.1630527631467; 
 Wed, 01 Sep 2021 13:20:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/16] drm/edid: Allow the querying/working with the panel
 ID from the EDID
Date: Wed,  1 Sep 2021 13:19:21 -0700
Message-Id: <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
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

We'd like to use this panel ID in panel-simple to identify which panel
is hooked up and from that information figure out power sequence
timings. Let's expose this information from the EDID code and also
allow it to be accessed early, before a connector has been created.

To make matching in the panel-simple code easier, we'll return the
panel ID as a 32-bit value. We'll provide some functions for
converting this value back and forth to something more human readable.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Decode hex product ID w/ same endianness as everyone else.

 drivers/gpu/drm/drm_edid.c | 59 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 47 ++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a22c38482a90..ac128bc3478a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2086,6 +2086,65 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+/**
+ * drm_get_panel_id - Get a panel's ID through DDC
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
+ *         See the functions encode_edid_id() and decode_edid_id() for some
+ *         details on the structure of this ID.
+ */
+u32 drm_get_panel_id(struct i2c_adapter *adapter)
+{
+	struct edid *edid;
+	u32 val;
+
+	edid = drm_do_get_edid_blk0(drm_do_probe_ddc_edid, adapter, NULL, NULL);
+
+	/*
+	 * There are no manufacturer IDs of 0, so if there is a problem reading
+	 * the EDID then we'll just return 0.
+	 */
+	if (IS_ERR_OR_NULL(edid))
+		return 0;
+
+	/*
+	 * In theory we could try to de-obfuscate this like edid_get_quirks()
+	 * does, but it's easier to just deal with a 32-bit number.
+	 *
+	 * NOTE that we deal with endianness differently for the top half
+	 * of this ID than for the bottom half. The bottom half (the product
+	 * id) gets decoded as little endian by the EDID_PRODUCT_ID because
+	 * that's how everyone seems to interpret it. The top half (the mfg_id)
+	 * gets stored as big endian because that makes encode_edid_id() and
+	 * decode_edid_id() easier to write (it's easier to extract the ASCII).
+	 * It doesn't really matter, though, as long as the number here is
+	 * unique.
+	 */
+	val = (u32)edid->mfg_id[0] << 24   |
+	      (u32)edid->mfg_id[1] << 16   |
+	      (u32)EDID_PRODUCT_ID(edid);
+
+	kfree(edid);
+
+	return val;
+}
+EXPORT_SYMBOL(drm_get_panel_id);
+
 /**
  * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
  * @connector: connector we're probing
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index deccfd39e6db..73da40d0b5d1 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -508,6 +508,52 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
 }
 
+/**
+ * encode_edid_id - Encode an ID for matching against drm_get_panel_id()
+ * @vend_chr_0: First character of the vendor string.
+ * @vend_chr_2: Second character of the vendor string.
+ * @vend_chr_3: Third character of the vendor string.
+ * @product_id: The 16-bit product ID.
+ *
+ * This is a macro so that it can be calculated at compile time and used
+ * as an initializer.
+ *
+ * For instance:
+ *   encode_edid_id('B', 'O', 'E', 0x2d08) => 0x09e52d08
+ *
+ * Return: a 32-bit ID per panel.
+ */
+#define encode_edid_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id) \
+	((((u32)(vend_chr_0) - '@') & 0x1f) << 26 | \
+	 (((u32)(vend_chr_1) - '@') & 0x1f) << 21 | \
+	 (((u32)(vend_chr_2) - '@') & 0x1f) << 16 | \
+	 ((product_id) & 0xffff))
+
+/**
+ * decode_edid_id - Decode a panel ID from encode_edid_id()
+ * @panel_id: The panel ID to decode.
+ * @vend: A 4-byte buffer to store the 3-letter vendor string plus a '\0'
+ *	  termination
+ * @product_id: The product ID will be returned here.
+ *
+ * For instance, after:
+ *   decode_edid_id(0x09e52d08, vend, &product_id)
+ * These will be true:
+ *   vend[0] = 'B'
+ *   vend[1] = 'O'
+ *   vend[2] = 'E'
+ *   vend[3] = '\0'
+ *   product_id = 0x2d08
+ */
+static inline void decode_edid_id(u32 panel_id, char vend[4], u16 *product_id)
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
@@ -515,6 +561,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
+u32 drm_get_panel_id(struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.33.0.259.gc128427fd7-goog

