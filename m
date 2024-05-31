Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A28D6A60
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD7610E33D;
	Fri, 31 May 2024 20:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oNQNQ4rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAC410E148
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:07:33 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ea9afcb22dso10675661fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186052; x=1717790852; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
 b=oNQNQ4rjlRrVYY/mgJhGMLDBYnNVq3v/oFpthb0GcV2HltWhYNA6we6wDmKLNOLTGy
 ageFBHvPwLXJWSxSVhQvDfSFsDOj+dSKwyMsiR69zZVcGgEYWmjYMw/q7OmqP/cAB8Gi
 8/nLfnAS+UJi4X0Xw+5jMwKTBjfgtYNDM4XZLDmwpqDqDoJRT7NDZ3BEN7jKRnBczxjF
 BWe9O0UGAnwAoWcOGvPcP5guBwgF8i982aZVCaowlM9cGG00B8Idk3s7Xq28KmENxls7
 3nrc/HzsXSd+PJWtrgumFeZYM3UP6UqACQEzp8lHHxF65av52ywLrcXJ/lDivZGnX1y0
 hLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186052; x=1717790852;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
 b=gPpQAkLHfZjZ5kve18Y1vlJdIVIOFViH1LrkTE0vqsPME1Mcu+j8sgdbber7xOxFUY
 aX05UtSwA+q7LGQ02kph+3X5lgvBzM1xzyWBTUS8YLvEj2FDmHdh6fZgCHFTsGzDulJb
 bkGFoMTEDrIc+zhMPzQC1lMRe50LrWF+vFEUOXWSg875boCHM/yQyJjmgJdXVz4wOiwu
 fRW9k6uR3NhC4ARCgNc8ySsuajTDvoKzI4FAwjIsA4dVmzonTMKw8EhgNgog2L++NCr2
 utBZIUN790CTW6xwsXhVw7HcWaFcXLkFC0loYGs+1RPHUEAz6rHoYF8bXSoxEzxHm95R
 n8lA==
X-Gm-Message-State: AOJu0YxFpgSXHPorE/HNvvh6urvGvl3GUrrisObeaubpXMP2wi+VoU3z
 iFkF9RQUvDbJhtPU4uSFuVSm+Y3wiY+LAqBEdfN9BoOtlsvBGVlf8EHyrZUJQHs=
X-Google-Smtp-Source: AGHT+IGNtOTguaZ9leRqag0CaFzD23hl8t7r4pTG52EkCyMJnsoMnRLC07C3OfPKTkhSCTVQomW3ww==
X-Received: by 2002:a2e:2d02:0:b0:2ea:830f:9a89 with SMTP id
 38308e7fff4ca-2ea951de46cmr22755071fa.38.1717186051788; 
 Fri, 31 May 2024 13:07:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:25 +0300
Subject: [PATCH v4 2/9] drm/bridge-connector: switch to using drmm allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-2-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qg+Km5t2/ArhCtvDRW1AVt6NXCcPflkwptIdi/Y9plc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4A+k/wFAlNad1mkNnD2hKb7PCQmsOnilAgQ
 ae2aBefN4SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1chPB/wOEOQQ16ukqgtPL72Fsk3cDKv9fUVqks4W09fqE/QlJIzv89myxSDCF961MXZQC7CKJxq
 gUi/e45v3m3rINjmtqDmQn0CKzsxnr6By6QKcT4YeqWzViOo7OVFUeH/9nHeetRsIo1d7mYJTcr
 szPFZpoDu5Nuu6YJE7ayUq7LK7anRBizmgkApSUxScpHluXZp4Gf11iXxLmZDc1pHLF6unzOSH8
 U8QpuYzZtbrBCS6vXMQnmQrFA5h6OaZcunljIXaBCUPYaDtc0egkwKMfsYUZCw2JWGs9RZm+GMC
 6Wcifh0/wjJtyBpu4viwKVRZRNQ4OGPgt1KN1DxXlAOrm7z8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Turn drm_bridge_connector to using drmm_kzalloc() and
drmm_connector_init() and drop the custom destroy function. The
drm_connector_unregister() and fwnode_handle_put() are already handled
by the drm_connector_cleanup() and so are safe to be dropped.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..e093fc8928dc 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -15,6 +15,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
@@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void drm_bridge_connector_destroy(struct drm_connector *connector)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	fwnode_handle_put(connector->fwnode);
-
-	kfree(bridge_connector);
-}
-
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_bridge_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
@@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	int connector_type;
 	int ret;
 
-	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drm_connector_init_with_ddc(drm, connector,
-					  &drm_bridge_connector_funcs,
-					  connector_type, ddc);
+	ret = drmm_connector_init(drm, connector,
+				  &drm_bridge_connector_funcs,
+				  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);

-- 
2.39.2

