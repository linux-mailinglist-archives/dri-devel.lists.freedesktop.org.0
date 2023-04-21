Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA026EAF07
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6497D10EE7A;
	Fri, 21 Apr 2023 16:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12210EE69
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:27:57 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-b8f32969ab0so3213540276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682094476; x=1684686476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQvRknvrozsjgOo+aHdUqHX5mEjM0UqwOQuOkiFPD1Q=;
 b=JPm25DCMJnNaNKhW7hh/fij7HnfsUar5DduuEuxULReqGwM5ogEgarTjySO2KgOwOu
 DCb+J7VDL7+MKhkMVF1RS0S9bLjSsX8hPwukzDyFiSg3Li4LT48u+M8P22HmL1xc1sN3
 pbbLV4jG0gMqlJ7D7sGcAbnYxSTxofyD1BsXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094476; x=1684686476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQvRknvrozsjgOo+aHdUqHX5mEjM0UqwOQuOkiFPD1Q=;
 b=ikhtR9Xp5tRXdhTwXd/8J+9xaP7IFBWlboVtyavVrjx9vTFOp2m2RFDjIFd5HHX7/K
 W1OKRqHwXc6n/dEjyRhk0polQQrHXShfNu+xZTRtSvlMpP3ywMlPbfUspNL2Ll5o+RGT
 TaFrqSHXN9q1hk/7grVUHuq6qL+5S+VQLq48O4RhTOLkAByxGfq3kY9MdrBC40bXCj+9
 hcEsrDDKopRvKxXdcTDyFeGkcWXCRxZNTBvXtLzsFlTK1nCK3GB7C4hBkB/loLALtbQe
 WTP5m+RCcraGekrK1a9xgLanDLJCDL4tAoqeULys4lkKfEFyZRd7GmYxACe7xJq14TEP
 KhpA==
X-Gm-Message-State: AAQBX9eHok3+n+X66eRJlIpNDRE7Vq7W2drwjimsUwUM/rwHI56tYEIL
 g3u5XLFKzbiUOhNeyA9EKuxD4uHAIgUBgZRWtBQ=
X-Google-Smtp-Source: AKy350YWdHbjJWt/68J0CiZQY233okaVKUD2d51H6vWplrPeugjfJQTbpP0cfqyQsM2ezDODf2HRDQ==
X-Received: by 2002:a25:e785:0:b0:b8f:3293:8e6 with SMTP id
 e127-20020a25e785000000b00b8f329308e6mr2684306ybh.38.1682094476523; 
 Fri, 21 Apr 2023 09:27:56 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 m132-20020a25588a000000b00b7767ca747bsm1010963ybb.24.2023.04.21.09.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:27:56 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] DRM: Create new Content Protection connector property
Date: Fri, 21 Apr 2023 12:27:48 -0400
Message-ID: <20230421162749.360777-3-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230421162749.360777-1-markyacoub@google.com>
References: <20230421162749.360777-1-markyacoub@google.com>
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

