Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001D870B03
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F28112520;
	Mon,  4 Mar 2024 19:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Yrlxn8cQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105C811251F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:52:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e6277f72d8so836319b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709581939; x=1710186739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oeg1ks8Z5TiI329gqNMDbm7TYAS4q9yMPCP31gjx14E=;
 b=Yrlxn8cQa2nhWBiV2pyitXGh5xy7BwJx2PtGOp/Z2ApGLxl6vNc27pPSHLPXqYqD75
 Lnawr2Cx+XJ4FVlSJKfGvVOQogUi+rTf44ldY7hNh0MplIKwoJMozO+08XQ36tL1uB1a
 pdhCnppjT1rScDfSD+kVv5tqweaLSPUkJasB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709581939; x=1710186739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oeg1ks8Z5TiI329gqNMDbm7TYAS4q9yMPCP31gjx14E=;
 b=MYqIieKfjXVKUQFJ7AngdOEfRqCkuRNyFrQBvuokECqzsKuEU3LhbPEelPMKHr4RO5
 jzwAAnXyTU9GHhP///NyiZFaiX6xYNBmE/JsyediMLVqI/hwaUq41f+Z1n0kHgxl4o9V
 kamVMCBfvKXt5wak948FJPPwluyBv2skBSlFnluhCnlDGpWGaHx9cGbT+mSKYEbSiFUv
 Gh7LN9bSkKa43tqcswNjDmfqpuruwG4ZAFZDsHUwIuUwKRpY9L2gxV/1wUFLL8bl+8fa
 ZG/xPraOyJto9oP9VHEcE6uI2j98lWvjq5oYGagsUZohKV1t4t8g08qwdh6lX3FMpTp8
 kIEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEm+GK/rctrytdVRyIH1ubEkVw6mDJ6O73NmiRLLUHOoC4EhAtUMbTAfwbRPeAyNpKFoAxZxugDquD4xdDPArS2yPt8KNeuJiXUMdTrrDZ
X-Gm-Message-State: AOJu0YxkgAoJxIBqGWKU4cJhFW9TmtKYpVf6EU1CVjchc7VjrJDQeyD9
 4MZL/CxOzUS1khD9Nyl/TgMnvB0ulgnxXpi3pgw9IKUPDnfJM1lk43oo5HuDUw==
X-Google-Smtp-Source: AGHT+IHLmXC5K65w/XvN1QDNXYVbf7LPTiLwzZQXv2LlpjmfZV2obLbzbD8eHFHeFT4rlwCqsjH5GQ==
X-Received: by 2002:a05:6a20:3d01:b0:1a1:14f2:4b70 with SMTP id
 y1-20020a056a203d0100b001a114f24b70mr9419789pzi.22.1709581939567; 
 Mon, 04 Mar 2024 11:52:19 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bcf3:25da:25cd:199])
 by smtp.gmail.com with ESMTPSA id
 r27-20020aa7845b000000b006e04d2be954sm7600820pfn.187.2024.03.04.11.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:52:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
Date: Mon,  4 Mar 2024 11:44:57 -0800
Message-ID: <20240304195214.14563-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
In-Reply-To: <20240304195214.14563-1-hsinyi@chromium.org>
References: <20240304195214.14563-1-hsinyi@chromium.org>
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

Add a function to check if the EDID base block contains a given string.

One of the use cases is fetching panel from a list of panel names, since
some panel vendors put the monitor name after EDID_DETAIL_MONITOR_STRING
instead of EDID_DETAIL_MONITOR_NAME.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: move string matching to drm_edid
---
 drivers/gpu/drm/drm_edid.c | 49 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13454bc64ca2..fcdc2bd143dd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2789,6 +2789,55 @@ u32 drm_edid_get_panel_id(struct edid_base_block *base_block)
 }
 EXPORT_SYMBOL(drm_edid_get_panel_id);
 
+/**
+ * drm_edid_has_monitor_string - Check if a EDID base block has certain string.
+ * @base_block: EDID base block to check.
+ * @str: pointer to a character array to hold the string to be checked.
+ *
+ * Check if the detailed timings section of a EDID base block has the given
+ * string.
+ *
+ * Return: True if the EDID base block contains the string, false otherwise.
+ */
+bool drm_edid_has_monitor_string(struct edid_base_block *base_block, const char *str)
+{
+	unsigned int i, j, k, buflen = strlen(str);
+
+	for (i = 0; i < EDID_DETAILED_TIMINGS; i++) {
+		struct detailed_timing *timing = &base_block->edid.detailed_timings[i];
+		unsigned int size = ARRAY_SIZE(timing->data.other_data.data.str.str);
+
+		if (buflen > size || timing->pixel_clock != 0 ||
+		    timing->data.other_data.pad1 != 0 ||
+		    (timing->data.other_data.type != EDID_DETAIL_MONITOR_NAME &&
+		     timing->data.other_data.type != EDID_DETAIL_MONITOR_STRING))
+			continue;
+
+		for (j = 0; j < buflen; j++) {
+			char c = timing->data.other_data.data.str.str[j];
+
+			if (c != str[j] ||  c == '\n')
+				break;
+		}
+
+		if (j == buflen) {
+			/* Allow trailing white spaces. */
+			for (k = j; k < size; k++) {
+				char c = timing->data.other_data.data.str.str[k];
+
+				if (c == '\n')
+					return true;
+				else if (c != ' ')
+					break;
+			}
+			if (k == size)
+				return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * drm_edid_get_base_block - Get a panel's EDID base block
  * @adapter: I2C adapter to use for DDC
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 2455d6ab2221..248ddb0a6b5d 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -416,6 +416,7 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
 struct edid_base_block *drm_edid_get_base_block(struct i2c_adapter *adapter);
 u32 drm_edid_get_panel_id(struct edid_base_block *base_block);
+bool drm_edid_has_monitor_string(struct edid_base_block *base_block, const char *str);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
-- 
2.44.0.rc1.240.g4c46232300-goog

