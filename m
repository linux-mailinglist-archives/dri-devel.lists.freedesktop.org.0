Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15E86A4C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168D10E556;
	Wed, 28 Feb 2024 01:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lYXtO1Ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3F10E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:11:39 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1d7232dcb3eso35753015ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 17:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709082699; x=1709687499;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXmDMoR5fxDfWHfx9hk2z/Xni/CCYvEBdkiUT3ERlc4=;
 b=lYXtO1OkN8vca18LmPia6UWhHxjt3Ewq6q15IHs7DKw5jqPOFuQxo7X76eoQRKS5/5
 2Iyp9W/54rjMavPrp7Pr/EGICLl49LJjX7VyDmyGG4eDUQVJtVVXekd1ZufaRWg1nqga
 qmHdW+jFvmu5BhCoJ7K6GurLF/TVEc9F1fRGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709082699; x=1709687499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXmDMoR5fxDfWHfx9hk2z/Xni/CCYvEBdkiUT3ERlc4=;
 b=ISNccW53jx3JKQodBAkfZOEyTCau3e8KhtOc6EY11SVQGwGZh9mpPI6vsDarrnXHQj
 Yy2mGoVGKux47UZoWsDv6crFKL99BGmNkW9W+BO5WlczIfDD8QNVkL/XRFmrpxyNmIId
 M5+iclSfZ93k9Sxm9zW+Bl102tvzrOINII8qMCBOCWFnpFSIYOhtrOrpjJzvMkGazw8x
 EwHrUMZTHXvsa9NvBZSKzzChtc02fKte3UKY564l4dfmXryFzul+3qYjUZB1zoAL/1Tk
 wCq6Ak4dKj+QLTsG+hc4/uzE5OoCBeaXr9x1l+ht+whmLeZbkRR/0tWX6Jt+7nmeYSds
 Za3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEMSP1df6aB192XaZjNChEgs7I0NBOLt0YF/bHdx2iwzJYtXm9nAjSUEInIW0nLooa5LWizQkkMcQHqdxhOVBGkGuvuoWJGdhgDcnvPDvM
X-Gm-Message-State: AOJu0YyQHxeeE9eXF4hytoOcvZ5oN3SFpkEl6OVZD6SbboG7iOY/GOO0
 nal6hmKJV+wRIOaPKaXbF5nrTXG1qLUJw/PDPTCdm1uv4VWFkGfhRnxCfsTp1A==
X-Google-Smtp-Source: AGHT+IFZU274TcXtjwUJ4KumuJnFvswQ8pqcET9/pvdjkcdY+FVA+6GXBMXUpT3bKpLlEHZ2fby6QQ==
X-Received: by 2002:a17:902:8303:b0:1dc:5e8a:93b with SMTP id
 bd3-20020a170902830300b001dc5e8a093bmr9108581plb.8.1709082698923; 
 Tue, 27 Feb 2024 17:11:38 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:87d1:e95d:b670:4783])
 by smtp.gmail.com with ESMTPSA id
 kl14-20020a170903074e00b001db4b3769f6sm2131529plb.280.2024.02.27.17.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 17:11:38 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm_edid: Support getting EDID through ddc without
 connector
Date: Tue, 27 Feb 2024 17:05:58 -0800
Message-ID: <20240228011133.1238439-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
In-Reply-To: <20240228011133.1238439-1-hsinyi@chromium.org>
References: <20240228011133.1238439-1-hsinyi@chromium.org>
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

Some panels are interested in the EDID during early probe when connector
is still unknown.

Add a function drm_get_edid_no_connector() to get edid without connector.
No functional change for existing usage.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1->v2:
add a function to return the entire edid without updating connector.
---
 drivers/gpu/drm/drm_edid.c | 45 ++++++++++++++++++++++++++++----------
 include/drm/drm_edid.h     |  1 +
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1ad94473e400..15b97c8ed993 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2364,7 +2364,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	struct edid *edid, *new;
 	size_t alloc_size = EDID_LENGTH;
 
-	override = drm_edid_override_get(connector);
+	override = connector ? drm_edid_override_get(connector) : false;
 	if (override) {
 		alloc_size = override->size;
 		edid = kmemdup(override->edid, alloc_size, GFP_KERNEL);
@@ -2385,18 +2385,20 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	if (status == EDID_BLOCK_READ_FAIL)
 		goto fail;
 
-	/* FIXME: Clarify what a corrupt EDID actually means. */
-	if (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION)
-		connector->edid_corrupt = false;
-	else
-		connector->edid_corrupt = true;
+	if (connector) {
+		/* FIXME: Clarify what a corrupt EDID actually means. */
+		if (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION)
+			connector->edid_corrupt = false;
+		else
+			connector->edid_corrupt = true;
 
-	if (!edid_block_status_valid(status, edid_block_tag(edid))) {
-		if (status == EDID_BLOCK_ZERO)
-			connector->null_edid_counter++;
+		if (!edid_block_status_valid(status, edid_block_tag(edid))) {
+			if (status == EDID_BLOCK_ZERO)
+				connector->null_edid_counter++;
 
-		connector_bad_edid(connector, edid, 1);
-		goto fail;
+			connector_bad_edid(connector, edid, 1);
+			goto fail;
+		}
 	}
 
 	if (!edid_extension_block_count(edid))
@@ -2444,7 +2446,8 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	}
 
 	if (invalid_blocks) {
-		connector_bad_edid(connector, edid, num_blocks);
+		if (connector)
+			connector_bad_edid(connector, edid, num_blocks);
 
 		edid = edid_filter_invalid_blocks(edid, &alloc_size);
 	}
@@ -2637,6 +2640,24 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+/**
+ * drm_get_edid_no_connector - get EDID data without updating connector status
+ * @adapter: I2C adapter to use for DDC
+ *
+ * Similar to drm_edid_read_ddc(), but not checking any connector status. Use
+ * this function to get EDID when connector is still unknown.
+ *
+ * Return: Pointer to valid EDID or NULL if we couldn't find any.
+ */
+struct edid *drm_get_edid_no_connector(struct i2c_adapter *adapter)
+{
+	if (!drm_probe_ddc(adapter))
+		return NULL;
+
+	return _drm_do_get_edid(NULL, drm_do_probe_ddc_edid, adapter, NULL);
+}
+EXPORT_SYMBOL(drm_get_edid_no_connector);
+
 /**
  * drm_edid_read_custom - Read EDID data using given EDID block read function
  * @connector: Connector to use
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 70ae6c290bdc..80c9e32ff80e 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -565,6 +565,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
+struct edid *drm_get_edid_no_connector(struct i2c_adapter *adapter);
 u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
-- 
2.44.0.rc1.240.g4c46232300-goog

