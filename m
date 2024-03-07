Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EB875ADB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F8A10F24D;
	Thu,  7 Mar 2024 23:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Yd8Dbsks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D4A10F1FD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:06:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dc0d11d1b7so13051035ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709852819; x=1710457619;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYEZNIcMNd/BeaNkmjBMYO1g1hMPvuNRl+gv7+BprBg=;
 b=Yd8DbsksHAQ9nhWVIH03Wt2WKQghSvL9xYaKqi7Ep+wjuTsI2Ptka1wsCgb92zyLkz
 X1Tb+MKXQxN5DxnJEx2TwdLAdWTaoTCsi3j4Cn14LO327qBPTNU4qlwOif8zgkDK9qUG
 Q/gyUz5/03FEAqHA5nors00owQSRzl0DbkB7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709852819; x=1710457619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYEZNIcMNd/BeaNkmjBMYO1g1hMPvuNRl+gv7+BprBg=;
 b=M7edkBddwHF0mhi6RgR1EZINfSgXdve8PvlM92F4+exvhg5/NZZL9fzVnaTbE0czFS
 XqiwHrGHLQKNHS0HetaK6AXLWPwAOCFdxLZrG78nt8eLw2Jgf+Rk40HwKwqEco2jtT/h
 CandJpmkd3try5PQ5BbsUUuqWxMbglbqqWt1g4B8YxT/fDCDciJTgtQpjitUfluvpoyl
 8AxWHEV8PmWywgO6GciL1vtD67R+LSMrGVBw/SQ2cITr/dZXKOROVhlB9sQE31DyLIbo
 WMfOnGqgK+1xYEn33ar8rb+9PXIkhg/LCuTGjh+rFKAdVhStYyxbo0DI/renXE4Mvsdo
 IXpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGl2yIQquXBCB6cGROBFvvQl4v4ecvAFhjU9EwznSW+tmOFURrvUsOruyLGG6NQCnjuPs0jOrWxvJJeHtheHLB8pvsIHRJh4HcFpliY/2n
X-Gm-Message-State: AOJu0YxmcFsqNmYOBQ4IYg1P6IR+GT5jJLS2EdHgV7easjtulVFbdQmZ
 Wmh1vfNeaWhTuR7W0CZb0zGLabwHH795xkZOLuhL5lUgokyIkL8lI1XmPinaSg==
X-Google-Smtp-Source: AGHT+IH4JN/Y0kdeG70rMVv9p/9iS1bg9i0S07bplO9mD21xLH7uN7ZRgi0aG8PNT/zsDNvLmvr2xQ==
X-Received: by 2002:a17:902:c146:b0:1dc:b874:583f with SMTP id
 6-20020a170902c14600b001dcb874583fmr8850154plj.38.1709852819245; 
 Thu, 07 Mar 2024 15:06:59 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bf8f:10d4:f877:bee3])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b001db63cfe07dsm15196654plc.283.2024.03.07.15.06.58
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
Subject: [PATCH v6 2/5] drm/edid: Add a function to match EDID with identity
Date: Thu,  7 Mar 2024 14:57:42 -0800
Message-ID: <20240307230653.1807557-3-hsinyi@chromium.org>
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

Create a type drm_edid_ident as the identity of an EDID. Currently it
contains panel id and monitor name.

Create a function that can match a given EDID and an identity:
1. Reject if the panel id doesn't match.
2. If name is not null in identity, try to match it in the detailed timing
   blocks. Note that some panel vendors put the monitor name after
   EDID_DETAIL_MONITOR_STRING.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v5->v6: finalize the trailing white space and/or NUL decision:
Allow only white space before \n.
---
 drivers/gpu/drm/drm_edid.c | 65 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  9 ++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 284255a0315e..58fe35058181 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -100,6 +100,11 @@ struct detailed_mode_closure {
 	int modes;
 };
 
+struct drm_edid_match_closure {
+	const struct drm_edid_ident *ident;
+	bool matched;
+};
+
 #define LEVEL_DMT	0
 #define LEVEL_GTF	1
 #define LEVEL_GTF2	2
@@ -5408,6 +5413,66 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 		    connector->audio_latency[0], connector->audio_latency[1]);
 }
 
+static void
+match_identity(const struct detailed_timing *timing, void *data)
+{
+	struct drm_edid_match_closure *closure = data;
+	unsigned int i;
+	const char *name = closure->ident->name;
+	unsigned int name_len = strlen(name);
+	const char *desc = timing->data.other_data.data.str.str;
+	unsigned int desc_len = ARRAY_SIZE(timing->data.other_data.data.str.str);
+
+	if (name_len > desc_len ||
+	    !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME) ||
+	      is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRING)))
+		return;
+
+	if (strncmp(name, desc, name_len))
+		return;
+
+	for (i = name_len; i < desc_len; i++) {
+		if (desc[i] == '\n')
+			break;
+		/* Allow white space before EDID string terminator. */
+		if (!isspace(desc[i]))
+			return;
+	}
+
+	closure->matched = true;
+}
+
+/**
+ * drm_edid_match - match drm_edid with given identity
+ * @drm_edid: EDID
+ * @ident: the EDID identity to match with
+ *
+ * Check if the EDID matches with the given identity.
+ *
+ * Return: True if the given identity matched with EDID, false otherwise.
+ */
+bool drm_edid_match(const struct drm_edid *drm_edid,
+		    const struct drm_edid_ident *ident)
+{
+	if (!drm_edid || drm_edid_get_panel_id(drm_edid) != ident->panel_id)
+		return false;
+
+	/* Match with name only if it's not NULL. */
+	if (ident->name) {
+		struct drm_edid_match_closure closure = {
+			.ident = ident,
+			.matched = false,
+		};
+
+		drm_for_each_detailed_block(drm_edid, match_identity, &closure);
+
+		return closure.matched;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_edid_match);
+
 static void
 monitor_name(const struct detailed_timing *timing, void *data)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 8b233865b085..5e3fc8c83a31 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -367,6 +367,13 @@ struct edid {
 	u8 checksum;
 } __attribute__((packed));
 
+/* EDID matching */
+struct drm_edid_ident {
+	/* ID encoded by drm_edid_encode_panel_id() */
+	u32 panel_id;
+	const char *name;
+};
+
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
 /* Short Audio Descriptor */
@@ -567,6 +574,8 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
 const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
 u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
+bool drm_edid_match(const struct drm_edid *drm_edid,
+		    const struct drm_edid_ident *ident);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.44.0.278.ge034bb2e1d-goog

