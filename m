Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A0877064
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043D710FE81;
	Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nttxEpv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BD610FE81
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:31:38 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d33986dbc0so30811211fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980296; x=1710585096; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n2dgZRE3P9NOEAlgbf/KlOXvvwjZtbyPVzKly5b3fGk=;
 b=nttxEpv2nCxA3lJpNhi764yi8mnqXutHlGSuPi/eECkYcP5ewogpXXHDFjHvd0h+4i
 C3xIrQ8T9ntWl/dyyLQ/YQ5NqZz9Qcs/g+fLY1Iy5ZS559ntAaHB1lX/s9KPQMPRMP2t
 5s0pNGQwrLilGjF+nOldALipv3dcfi7iRza3joUhmTt4SmucgwVUWHdqjKF+Gks2wOtL
 qjb4bhbW2zQPuwCybGu36M8gVG1BJncTMWmYmOOT8MXSXiigEi5KtUkqk3pKyYS2b9va
 L6jUFJ7/LbvNtTwclc+Ycdxeb6aiSlnJy0+TB4YJZuskccg5p6WXKl4QLgeQ6Z42FtPN
 pbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980296; x=1710585096;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2dgZRE3P9NOEAlgbf/KlOXvvwjZtbyPVzKly5b3fGk=;
 b=G29tQ1j7lhjR17NxXRy+SQOLi6IAXZZADN0234+2P2MKfmkVUukjotasDVtoLv+d1H
 n2smRiTGYpx/BG9+GTzV2kjfCI8JSN/Gl6Ol0ExFLkICxX/I/ETuCUKte90O1TaWhYrn
 2aC+uMuErpxe0A7KLHua3pOLS0Dxa3vF+9GP0QkEI7mN3nEf6AyvCls1pYz+e7dlYzIS
 9sE64MHFPrHm6eSWviO6pWcz1ZyznwtIiPVCBJ1zAsPxOayZ+Y4FFIv6u88TnbcvrMCc
 ltgMrnZqlGQ3o4ZRRkEBqNA0KhJNIbSUcbiXs5bztKDSmsKfk8m7sO+HC/xIZnpAnMlO
 P7+g==
X-Gm-Message-State: AOJu0YzY1lXt5OyANLrUu0USTWrprnoJaFA4Jfy+LXIK8YTHiuutjNLx
 ZC3nQgbQW47nqfww5HWJoy1kO2hLOPOyXRUiOHC1s1nSLbM0CHojpnxJKj7YvlQ=
X-Google-Smtp-Source: AGHT+IEWta587d42WaCMYz46CSqPTHmEYD0eNxzIJJaMFlLh0oXM0SDdOGUY4Uh4KVlxx8+DOKsBNg==
X-Received: by 2002:a2e:b609:0:b0:2d3:25d1:f33 with SMTP id
 r9-20020a2eb609000000b002d325d10f33mr887304ljn.15.1709980296358; 
 Sat, 09 Mar 2024 02:31:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 02:31:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:28 +0200
Subject: [PATCH RFC v2 1/5] drm/connector: hdmi: fix Infoframes generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-1-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
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
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dyCSthHHzXNg2FtPHnjXI29ZKEgPZ2Wv/z/Xo615dDI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+obq9bLzqLR2wPVZL8XtPe83J2Xlj+X83NNpbvWxSbez
 htFLBc6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRDxzs/71DpZ73B+huV++p
 E+W3yNPIvsEtfJHh/sP0cz/yC7LL5h9LNnjmU7DsRk3c21kccYy96ge6N56+vu6u66tp+e17b8U
 m9h+/e7hFvcitR/jM56A/Una9h8/zGF1x7NVbscY63CTp5CHWhpjsuz98P8e827LEVc+yT6hZ5w
 XPnUxN1/OuptKPV1ze4xcU3rX5inmrBb/qCoMQyxVTNbrjbl/7OTXrqG/zhVLTW/tfP44wcqyxP
 673r3CyxsTZr5/tfz45w2q+banGTq/y4NWce1q470rnxn7j8djGsGOZW97p3bVbmR30vzwJOGAe
 6a6y3qhVr+qptVFr0PTH7xncHrbxyz0+IXF52x1Bo8r1AA==
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

Gate only HDMI Vendor Infoframe generation on the
info->has_hdmi_infoframe. All other infoframes were defined in earlier
HDMI specs and should be generated by default.

Fixes: 000000000000 ("drm/connector: hdmi: Add Infoframes generation")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 46d9fd2ea8fa..691efce9661a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -1025,9 +1025,6 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	ret = hdmi_generate_avi_infoframe(connector, state);
 	if (ret)
 		return ret;
@@ -1045,9 +1042,11 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
-	if (ret)
-		return ret;
+	if (info->has_hdmi_infoframe) {
+		ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1208,9 +1207,6 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	ret = UPDATE_INFOFRAME(connector, old_state, new_state, avi);
@@ -1233,9 +1229,11 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (ret)
 		goto out;
 
-	ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
-	if (ret)
-		goto out;
+	if (info->has_hdmi_infoframe) {
+		ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
+		if (ret)
+			goto out;
+	}
 
 out:
 	mutex_unlock(&connector->hdmi.infoframes.lock);
@@ -1269,9 +1267,6 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	memcpy(&infoframe.data, frame, sizeof(infoframe.data));
 	infoframe.set = true;
 

-- 
2.39.2

