Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F72874108
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4352F113503;
	Wed,  6 Mar 2024 20:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RdniBarA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6138D1134FF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:59 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6e55731af5cso104247b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709755439; x=1710360239;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRJUYRt2oq67C0/LdzkUEFZ3CsguCNeMnqbNn5e2Vjw=;
 b=RdniBarAqYT70LyI/66/2uPw59cOpKaJg7+qIlM0pTUP5ui4WOH6At9491wjXFZB21
 2A2J+a+qYslHsAjRuDOp0Vwnv1cenAN9vFhigVlroggBLpQv/lnMcCFRrNW0/gn67wlX
 2SsOSoVK8W+QVMYMAtvIsYCl9jeVG2qd7Xy+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755439; x=1710360239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRJUYRt2oq67C0/LdzkUEFZ3CsguCNeMnqbNn5e2Vjw=;
 b=N/pjx9uz2z3Bksggs4y46iNkLIiOeF+BUdc3Ytc1gn/euC7gVpGPyQK0FFxdL+wRiV
 MSSFlP9rbxIuiTvOthYcHvwtmBsXml2QcK64DI1osGPNOpsw8ywSywq7RvhjhFqz7Akt
 excBi9vdKjIimMgG1B7srXKVzCqyVLtTdZs8S0naTdE87jdMv7FZuC+/FBLAyW3Iahr7
 cpjnsLzeFV55WHkfI5poGt1DS5BqWVy1Jom+8as2Xn17Eiu9qUzrNfn0fKJdL8BgcCp8
 1V7AHBACKRsxmDYgaLoEA38KIa/rWKQCJdB/SBG/lPctLOZSnuVb5Wi9NGtvzRiApiNG
 L5jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBG/aDr5S0VfYFWO2wxtazDLVM2Y4Ik5HnFlAXZMLxNjWwd4m+84bckFsvbbdfejcjjlZ/gHuGdzByxJl68G35JcaXJszowIEavOXaz+cq
X-Gm-Message-State: AOJu0YwwyOYHWdePlU0TLV4XjKzJUyhMGks/nFOym5UB+Hu0U40rGsg1
 MeFUiLmwI6dgrNdZmX6eCjq7/cVzWvNVHbl13/8FH66nf9sS/da7P8dJyuzUiw==
X-Google-Smtp-Source: AGHT+IEXmTS6PLw1/iaxz3ACFLOd7WH1/YNx8U/VqwNBQW526mexbfJ/D5D3qnZ8ATCE2qu9PJRPeg==
X-Received: by 2002:a05:6a00:2da3:b0:6e6:451c:a519 with SMTP id
 fb35-20020a056a002da300b006e6451ca519mr6034543pfb.5.1709755438763; 
 Wed, 06 Mar 2024 12:03:58 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:a215:f6c0:3224:5460])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa79803000000b006e5667793d4sm11124241pfl.66.2024.03.06.12.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:03:58 -0800 (PST)
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
Subject: [PATCH v5 3/6] drm/edid: Add a function to match EDID with identity
Date: Wed,  6 Mar 2024 11:55:53 -0800
Message-ID: <20240306200353.1436198-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306200353.1436198-1-hsinyi@chromium.org>
References: <20240306200353.1436198-1-hsinyi@chromium.org>
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
v4->v5: use strncmp, change function/variable names.
---
 drivers/gpu/drm/drm_edid.c | 65 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  8 +++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index febe374fa969..29ef35ebee32 100644
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
@@ -5405,6 +5410,66 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
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
+	/* Allow trailing white spaces and \0. */
+	for (i = name_len; i < desc_len; i++) {
+		if (desc[i] == '\n')
+			break;
+		if (!isspace(desc[i]) && !desc[i])
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
index 8b233865b085..28f05a7b2f7b 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -367,6 +367,12 @@ struct edid {
 	u8 checksum;
 } __attribute__((packed));
 
+/* EDID matching */
+struct drm_edid_ident {
+	u32 panel_id;
+	const char *name;
+};
+
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
 /* Short Audio Descriptor */
@@ -567,6 +573,8 @@ struct edid *drm_get_edid(struct drm_connector *connector,
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

