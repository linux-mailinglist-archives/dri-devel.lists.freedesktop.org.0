Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8346EAEDC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667C010EE5A;
	Fri, 21 Apr 2023 16:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B315810EE5A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:12:44 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54f8f459b34so21717297b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682093563; x=1684685563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQvRknvrozsjgOo+aHdUqHX5mEjM0UqwOQuOkiFPD1Q=;
 b=aY7hOgXg/OVMQhJpR+WdPXoXmESxOXa/4Z2E/3GbrCFz/DnAzBTOkLQvfUTDbakEKz
 B+fEz9sGY+bXYgokkV9JKIHIN1UX8lWCps3ls6u7xpOuI7x6gR4KZ0dDWtGd0r+PNKs3
 95eRD42ZB/Jd21qkUJZGCIvz3+lpllh9EkBag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682093563; x=1684685563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQvRknvrozsjgOo+aHdUqHX5mEjM0UqwOQuOkiFPD1Q=;
 b=Af/MokmIIpE/PkWmwXvvZ/kfA5bTIM+M+hiRgZ2CqzmQwRLrIAYckVAUS8d3MZ/qUh
 VU+bw8lUoXiqnkxUDA/jE7rol1eWV74n03oM3r8m8SxDrTn6QBFqULYsmAUAgT0awwbi
 haChBNCmi6F/J88sh4GEnnY+ItT5h1LHzLVmqwA89rMBgGhjPcz4NW0baDUs99q8JBCQ
 CTDau8iFEDzoYaN6jC8sH2BRWZC1QfC1FR4IGMaYkOyi9ICGqQTuqvEtlVIg/PiKZDu0
 N8tEe9e4TKfmpWLG3kg2kbDh1Lef3GLhxAve+5CMAVz4ZukAgu+c8PZGOaKAV86TuIV3
 vHmg==
X-Gm-Message-State: AAQBX9dZFkO1Q0hqVlf2VlTRvCQO3rFODD7ccQc77G2j0J+POOwmC/Ql
 ZSViZtW9JOOkllzUBE9A44wwZeOJC9FgTvizhss=
X-Google-Smtp-Source: AKy350aEtduOjMIU3HUgeK4N5JZgtHBrAAVw0qeEDNNp/Pmvtp0bSXFirsCwHwiI8ng/WkSUfnqtnA==
X-Received: by 2002:a81:6245:0:b0:54c:2500:defa with SMTP id
 w66-20020a816245000000b0054c2500defamr2367114ywb.10.1682093563605; 
 Fri, 21 Apr 2023 09:12:43 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 f67-20020a816a46000000b00552a648fd7bsm1020460ywc.83.2023.04.21.09.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:12:43 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/2] DRM: Create new Content Protection connector property
Date: Fri, 21 Apr 2023 12:12:36 -0400
Message-ID: <20230421161237.357342-2-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230421161237.357342-1-markyacoub@google.com>
References: <20230421161237.357342-1-markyacoub@google.com>
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
Cc: dmitry.baryshkov@linaro.org, Mark Yacoub <markyacoub@chromium.org>,
 seanpaul@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

[Why]
To enable Protected Content, some drivers require a key to be injected
from user space to enable HDCP on the connector.

[How]
Create new "Content Protection Property" of type "Blob"

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 9 +++++++++
 include/drm/drm_connector.h       | 6 ++++++
 include/drm/drm_mode_config.h     | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd5..e20bc57cdb05c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -749,6 +749,11 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->content_protection = val;
 	} else if (property == config->hdcp_content_type_property) {
 		state->hdcp_content_type = val;
+	} else if (property == config->content_protection_key_property) {
+		ret = drm_atomic_replace_property_blob_from_id(
+			dev, &state->content_protection_key, val, -1, -1,
+			&replaced);
+		return ret;
 	} else if (property == connector->colorspace_property) {
 		state->colorspace = val;
 	} else if (property == config->writeback_fb_id_property) {
@@ -843,6 +848,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->content_protection;
 	} else if (property == config->hdcp_content_type_property) {
 		*val = state->hdcp_content_type;
+	} else if (property == config->content_protection_key_property) {
+		*val = state->content_protection_key ?
+			       state->content_protection_key->base.id :
+			       0;
 	} else if (property == config->writeback_fb_id_property) {
 		/* Writeback framebuffer is one-shot, write and forget */
 		*val = 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7b5048516185c..2fbe51272bfeb 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -896,6 +896,12 @@ struct drm_connector_state {
 	 */
 	unsigned int content_protection;
 
+	/**
+	 * @content_protection_key: DRM blob property for holding the Content
+	 * Protection Key injected from user space.
+	 */
+	struct drm_property_blob *content_protection_key;
+
 	/**
 	 * @colorspace: State variable for Connector property to request
 	 * colorspace change on Sink. This is most commonly used to switch
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22e..615d1e5f57562 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -887,6 +887,12 @@ struct drm_mode_config {
 	 */
 	struct drm_property *hdcp_content_type_property;
 
+	/**
+	 * @content_protection_key_property: DRM blob property that receives the 
+	 * content protection key from user space to be injected into the kernel.
+	 */
+	struct drm_property *content_protection_key_property;
+
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
 
-- 
2.40.0.634.g4ca3ef3211-goog

