Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25B875B55
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2289010F611;
	Thu,  7 Mar 2024 23:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OZWwpG0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ED110F5FA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:07 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512bde3d197so1487960e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855825; x=1710460625; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YrWVSqhIZg5i9GRohJrsO0PLTsaI98ZgAO0O1ROuapU=;
 b=OZWwpG0bt1JhWu840TprV7pyiFH58WiRvwz19a03MnDVQkbhZTFRwQSbBgOI69RAP6
 1i3AF13lKT3mymuxVpyWkTDp3C979S/8WjpiTmWuBFYLT6XuGuxmE4TWSGo2I7DZTMJb
 yOA/LzV8xzh6VcbTops3WEk6BU+llojE3cikcyJHx0b5VeH+ODYWdl4a6PcWGRuX68T2
 s32Qhac9P8jClo2ziZmAIQ9kSGnkoNxIwXSv7CEMayCtWWN4VoFeFTb3Dlpmj0Uj9WAg
 xufv97IKYKNAhsxm+EmRpgeO4zR2fdzwAhH0/HbsQEnCV4JALxRv0NV6kzWEn0Rxfvnm
 3qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855825; x=1710460625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YrWVSqhIZg5i9GRohJrsO0PLTsaI98ZgAO0O1ROuapU=;
 b=iMIhlfEmBEN/HVtFLjSBbZH0UjV7Ai+VXc+LlfozO0C7Igsy8n+ncU3hYe0OW/lrwg
 IBom5oRVw8l0D61oCN4Ka6FWO4fGCWG/WRGkG7ys3BMCDSxxD6Ft6G+FbjuUiz9iDzuI
 NI/p7GbSG8zvbowg8yX7nJnBVAj8zHaMDhvlwbnQR8VB2Fhzm29iaCUj5DuaVAorF7b6
 uNuSm85oq+nMYzPePbmACqeGnNAaOcvPQzDooETMKzI7jJo2fo9KXHG0CVH7K/wNqaOJ
 ZD2RRb9nqEyfAjLrTPo2ZqOq5mXRRYYxWqF913mS6aod8bte7ERZI8D9Rja5eSISBT/c
 KVXQ==
X-Gm-Message-State: AOJu0YynbfmFSUNtWsQFhWfYUFeWr0CqU+VBf+fOgSc/wN/Pu8PXYPMt
 gZxOtTp/RrOEitV+MMHe+EmFyU7tmTZCMoEFZtvAAeI57mapnTSmpOP3ef9HdqQ=
X-Google-Smtp-Source: AGHT+IGuA3HpzTHNMT/KEhcYh1+21MTcVQqktl2nFqKCMu6Crq3nALckLhb8llyF03hWv2ZWQZuwwQ==
X-Received: by 2002:a19:5f5d:0:b0:513:202b:9001 with SMTP id
 a29-20020a195f5d000000b00513202b9001mr2415854lfj.6.1709855825593; 
 Thu, 07 Mar 2024 15:57:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:01 +0200
Subject: [PATCH RFC 2/6] drm/connector: hdmi: fix Infoframes generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-2-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0xTy7u4ldl8TibzkLZodtG0AmzrH8EDBIk+OF9QReyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROOz11Yb17TBIupmYO+n6/3qc16U9eNuJjU
 v4r2QckfeOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1YZLCACtlXPIfPPPrGFH+Nz6Yjy0fxuNUleNqH5GonV4FFU/dYWXJRxcS/bVgNct+zcEbgumRv8
 vczi52rS1IMlex9j9k8OdBEvaHhuF8LurhDtgMtGS6C8f0G1CrXOoQyCKLOH8rY6LTe+U2hZmtx
 5DMbvRfXvZTxVMnt4igberndjzbs8fbLcNzWr+1DA/pZhnLoDOjw82O39bL3Xt6S5+EHcMz23uV
 AEWZ3i7NJvubGENtn8kAWZb3gkpWSjTiyzcR0n+rdD46gKCWATosfrv0Jzla7dXnqC3lsg2V3WU
 49VrOdL7kXp08E2zPFTkScLuhyCIPfeXMezHaGI2QRapFENz
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

