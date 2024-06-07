Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F890049D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4210EC45;
	Fri,  7 Jun 2024 13:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cHzJEgqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAF810EC36
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:12 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso2387708e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766591; x=1718371391; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oXdquAR+phBlXTozHdm7dMyEIpvNqpWvTvyb01zEe0s=;
 b=cHzJEgqceHwx1nJ9Z/PlOSbHemlhrkulzAtaEYfxOHws4JXTc1C4KVnhJNEz69uXYZ
 +o17oJik7h3mXbWBMqT3b+cU6JFtf8OTOb37kvg1qnvjp1ruLjs2ITG+aGPWyKGmCRAx
 hWwscBNyIxUVKZVKheqNs1q2PdqpBRyd/HE9LspwGTr2Z+HTaghAcTeQHFBYdtWROcbz
 hrRqK80GsL8w7jFfEITofCZ1Xhqg2QYF8k4O79vRGiFV96fY5dqBhdN7DcT7TunVTe3M
 dqpCtyVoJgyEea2Pr4ahHP10nV4jQoqOdrK8SS9TuLesUb560Ro/y9mPc9r/2l3pTJTb
 50Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766591; x=1718371391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXdquAR+phBlXTozHdm7dMyEIpvNqpWvTvyb01zEe0s=;
 b=NRzfe1agc/JZQGZ6u6BeZmN9fxN1ShGTxaEebNmBD0L7bPmnNfAAYEKsPNPciI9QZH
 4hXpDC+uEME+SKic2i4RzF3ZonTR9AM15K8ZJW2Pc4ErgPXin7FS2ic41laqnbP3I+a8
 E7IRBof2NrrC66M/M8vCAvV0+g0t1Hj760WI1lpDNQiBEpsXj3JBS2vHRNWU7Jt/PA6S
 Y0xE6hhqdNYWce8nY9fDk385CgGSHys0n5M1H3st6SVRdpXfyZeA7TRi942JbSxy/EsZ
 E8O6Z3PQIVXcu5HftITGu7cP2w3pJT4+DnzNGTv66WxmERppnuBL/Z68r0Y1KEK2aotY
 if9w==
X-Gm-Message-State: AOJu0Yz8aHgfKUZco9c2i9vv4oOonm2I3vYNyxguwIER4BuJwa/Y14Jt
 0MBq5JKzGtJcSjEnzV0qQlAaSniGFAFKAzA9rPcNx6ZFInYj1X+I83vUtXfu73U=
X-Google-Smtp-Source: AGHT+IGLoVtK/GoET0h7mygknqinWMr3R2cDmz76SQfF6CeRRgYTYruB7fM0iGyXWid3KBk253QIDA==
X-Received: by 2002:a05:6512:1326:b0:52b:be6c:a5c0 with SMTP id
 2adb3069b0e04-52bbe6ca8f0mr1271589e87.27.1717766590808; 
 Fri, 07 Jun 2024 06:23:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:23:04 +0300
Subject: [PATCH v5 7/9] drm/msm/hdmi: get rid of hdmi_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-7-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XS0dF9Hp3iaKsKwda8RRLnnXLW+mcezSYG9g3tkKpC8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm2xF+lxxNOE0yXubq+gpv1Q48FKCb8JuMqj
 PLAvN+kr0CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtgAKCRCLPIo+Aiko
 1fb1B/wLsMbXWPpWLAgu0Wl6XJ89Jrvfv/uxEWmtjrYIAmL4H0k1F4fHHeSeQSqj7yq821G7vee
 oir/2Zobw+jAWsmxXQSsuPheKW+oWMAVK/CBM2ii1ohH+/0mA7f8prqkMRZQd4FLovmYcGwFfz8
 M+TuljED+sP6jew1R7tMDm8AGINIXW1YPSWzmLcxEzoN4CeHzGVjp1MyQqQZj1MblHhDTjtjWIJ
 JRvgUn5zYFQJuUFnqkigObXSbpWPekr6KtZd9yq9CZrEqWcXc8XIiAO5B9lidIcHzAFYlu+uI5i
 lo9d+eBQAMhuLcS0Q4xGUaImFER7jo4BrpGgoDCw7yv6cXnH
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

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 11 -----------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 2279e09fd2de..8c6c9dffffd6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 0ac034eaaf0f..b7fc1c5f1d1e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9eecc9960e75..9258d3100042 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -346,17 +346,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.2

