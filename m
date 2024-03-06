Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C9872BD9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBB2112DB9;
	Wed,  6 Mar 2024 00:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S0DNPZck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C476112DB5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:43:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1dba177c596so2322165ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709685832; x=1710290632;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1jdDSZHjVilOHoD9Mz88hwX3pgYSN/T59roGid0+2HE=;
 b=S0DNPZckMhS3ntWiFqb9CbCH/w6oWBCvTrysIYBle3X9TxDH9utv5Ixiz1jGtwuh1J
 8bn4mX3tJFkawKXOE35c/WzdUoIGlZsGzwWipFfOq7daoLmIDTCPSEYjukUQySKKGAKm
 XieTc6ROrkhwD8D2YbOTB8iauj1CeKlYpby9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685832; x=1710290632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jdDSZHjVilOHoD9Mz88hwX3pgYSN/T59roGid0+2HE=;
 b=dyzXU7Jw8RuF/Ug+fcE1iZBIQqKk/4PzD8alzZNiaMmbYoK3SiDtQYr9cL3kiQOQSf
 22aBimmJffIsESSepPVnR3zvf0bKAWvx2+GIS31W1j8Wy9SJfUX/e84ZD6CacHyIm3sX
 5wllJ3YybrB5zCrZPuz6VS0KzIDiTOMzK0eK506itSxfITxJI4NLdV2vPAzKnHOva7ea
 SnKOcia4Z1K4mKfsBlHJdxzij56bBNsayazmc82tUQI84WeKCmc1ZbR4MhDhLz1uF4Y/
 u4Cfoj0Pp9DpGkiRR6qQvHxo6Q4w5WGSeUxJvTXdkCiohNn93UGfPcd4/J8n830aRqB4
 QgUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7mBHifxQhcc+sQ7FyLVb9MSjmBGa8cCjyvD9kYMWjY2UVMMg4mlhgSDiF63iVjfWvWDMiX1+NHzFvS5Vg+Y9HGKXHgyXhDM+ZdPo4khDO
X-Gm-Message-State: AOJu0YwUvGs9QMmc/15xiaYB34ZdaQZEalDJwo57XlhSKMArr6hKDCGl
 NFWsZeh3DgufIGrfffg0O4RWEVRSivG/WBwznWMX9+iygJMpvyq3Vd/H5jdnNQ==
X-Google-Smtp-Source: AGHT+IHpeCSw6qFXG6z+qH6Amd+u9YxeuylmnfupBVB5t2dOKqVPQdY/9+/kxV/f5BbAsu5vN5zylA==
X-Received: by 2002:a17:902:e741:b0:1dc:b7d2:3f28 with SMTP id
 p1-20020a170902e74100b001dcb7d23f28mr5058993plf.32.1709685832378; 
 Tue, 05 Mar 2024 16:43:52 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:29bc:b3d:1ba8:cf52])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a631725000000b005dc48e56191sm8512885pgl.11.2024.03.05.16.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 16:43:52 -0800 (PST)
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
Subject: [PATCH v4 2/5] drm/edid: Add a function to match EDID with identity
Date: Tue,  5 Mar 2024 16:34:02 -0800
Message-ID: <20240306004347.974304-3-hsinyi@chromium.org>
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

Create a type drm_edid_ident as the identity of an EDID. Currently it
contains panel id and monitor name.

Create a function that can match a given EDID and an identity:
1. Reject if the panel id doesn't match.
2. If name is not null in identity, try to match it in the detailed timing
   blocks. Note that some panel vendors put the monitor name after
   EDID_DETAIL_MONITOR_STRING.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v3->v4:
1. add a type drm_edid_ident
2. match name -> match identity. Modify function to use edid iterators.
---
 drivers/gpu/drm/drm_edid.c | 76 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  8 ++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f9e09f327f81..5e7e69e0e345 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -102,6 +102,11 @@ struct detailed_mode_closure {
 	int modes;
 };
 
+struct drm_edid_ident_closure {
+	const struct drm_edid_ident *ident;
+	bool matched;
+};
+
 #define LEVEL_DMT	0
 #define LEVEL_GTF	1
 #define LEVEL_GTF2	2
@@ -5455,6 +5460,77 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 		    connector->audio_latency[0], connector->audio_latency[1]);
 }
 
+static void
+match_identity(const struct detailed_timing *timing, void *data)
+{
+	struct drm_edid_ident_closure *closure = data;
+	unsigned int i, j;
+	const char *str = closure->ident->name;
+	unsigned int buflen = strlen(str);
+	unsigned int size = ARRAY_SIZE(timing->data.other_data.data.str.str);
+
+	if (buflen > size ||
+	    !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME) ||
+	      is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRING)))
+		return;
+
+	for (i = 0; i < buflen; i++) {
+		char c = timing->data.other_data.data.str.str[i];
+
+		if (c != str[i] ||  c == '\n')
+			break;
+		}
+
+		if (i == buflen) {
+			/* Allow trailing white spaces. */
+			for (j = i; j < size; j++) {
+				char c = timing->data.other_data.data.str.str[j];
+
+				if (c == '\n') {
+					closure->matched = true;
+					return;
+				} else if (c != ' ') {
+					break;
+				}
+			}
+			if (j == size) {
+				closure->matched = true;
+				return;
+			}
+	}
+}
+
+/**
+ * drm_edid_match_identity - match drm_edid with given identity
+ * @drm_edid: EDID
+ * @ident: the EDID identity to match with
+ *
+ * Check if the EDID matches with the given identity.
+ *
+ * Return: True if the given identity matched with EDID, false otherwise.
+ */
+bool drm_edid_match_identity(const struct drm_edid *drm_edid,
+			     const struct drm_edid_ident *ident)
+{
+	if (!drm_edid || edid_extract_panel_id(drm_edid->edid) != ident->panel_id)
+		return false;
+
+	/* Match with name only if it's not NULL. */
+	if (ident->name) {
+		struct drm_edid_ident_closure closure = {
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
+EXPORT_SYMBOL(drm_edid_match_identity);
+
 static void
 monitor_name(const struct detailed_timing *timing, void *data)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 9686a7cee6a6..01825a8954b6 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -312,6 +312,12 @@ struct edid {
 	u8 checksum;
 } __packed;
 
+/* EDID matching */
+struct drm_edid_ident {
+	u32 panel_id;
+	const char *name;
+};
+
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
 /* Short Audio Descriptor */
@@ -412,6 +418,8 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
 const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
 u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
+bool drm_edid_match_identity(const struct drm_edid *drm_edid,
+			     const struct drm_edid_ident *ident);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.44.0.278.ge034bb2e1d-goog

