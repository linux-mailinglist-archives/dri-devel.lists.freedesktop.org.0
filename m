Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850AF8D28E8
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467910ED24;
	Tue, 28 May 2024 23:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B2iTNKsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E73110ED24
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:52:58 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ad8230bb9so110062e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716940376; x=1717545176; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WJH0eGHL0S44S4VAoT3//wXsK4IwPG7MFQf/QTWKdP4=;
 b=B2iTNKsU18tZErdEp+eYDcZLA2bURuK4dgzF5EMEZsubDSlRn7dpv6pgz3DirClDGy
 EplrqVvsPZPlfk+TEiSAJDkz2COGiogTNSzKYOgZZqNb2X1CRdusjmKFVCm658iGIN4G
 dz7oA3AVQatNyV1Pky7FQY7UCBdptF3+el2LiT+aWWx3AKXsqLb5QlLOu9qHFjCZrfIg
 5fHRlAF8CHfRE5L8Wc0/zNF07ymxesxAgnyxH6f3RWnB5LW5W70CcXMhRtvWjNgfUQpo
 uy+7lxQTriBJBrgk08Cfd4NLFJ5udtZ14+xpIhNa+4hZWlS3b0afM9wbSLCiXvGu3Lxe
 s14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716940376; x=1717545176;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJH0eGHL0S44S4VAoT3//wXsK4IwPG7MFQf/QTWKdP4=;
 b=P+6Uugcia2DWOyAnv4eRuxOI+wWAI8C34C4dgl76rPpGhsxtGrgOKqndzTH5OuOXw+
 ydNAQGVLfgIp0V/aIPPiHws9G5NU7raNIMWECB8ePVU2A8aJtB4PAlSNo5f0Zee1CcYd
 tZVUFlgfh+9WtHA/0SRnWZESDBe4W91qFN3lUUSCu2xJL/RDCpObAi5l9HGW5uyB/aLs
 wz0Q5d32FlFaRrR2lqMYMZ9fXAvek+k9zOGABc2kSR8mb7Qj+9mFeT6y9vpkgcpeEoxm
 PMwmWYHUmzSHAmwPWyeLbxU/bCk6JhMGaGkaJH7ebxlAPGI2ySfGMQNPOIFcoTZZV2l7
 MCgA==
X-Gm-Message-State: AOJu0YwWFD9lS88QS1R5EhCHIwUPo/fcxZOMCILAZ9972VZy+MCKc+Yb
 7l4kEanjFnDbws/B0SMXorB9/PS4fScGfaG/7hAEWcRkt/4XlQaV919zfeJ6440=
X-Google-Smtp-Source: AGHT+IHKPEDMtbU382IuloM5br0imQsgdv1mUmjp0FxW7R0T2RAJksTe4h35WKggq6BRr5HC5ryHeg==
X-Received: by 2002:ac2:5489:0:b0:51c:cd8d:2865 with SMTP id
 2adb3069b0e04-529668ca0abmr8397547e87.44.1716940376642; 
 Tue, 28 May 2024 16:52:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066bd0bsm1099869e87.165.2024.05.28.16.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 16:52:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 02:52:54 +0300
Subject: [PATCH v2 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oHBezVlQg7OYkDqf0mCnlNvzfcQLRXocxgcJNJ+SMzs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVm5Wy8KAXUnyPDPNQ38w7x0XiXWHodROHzcC5
 9Ghz+NDQeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZuVgAKCRCLPIo+Aiko
 1TloB/wL83KX7asFeXg/rcu5X98SE7+vTXoSGNjnqPj9VPGeoqq2Wmbe3dxmO4pvkxjhsEmOaVW
 ZfJNPkXEA/DANbAF1dzzJbzXfug9X60iVc2OCrmClho7C9a2aglx/GXCBGlELGH4KKl3FjjCIpj
 dVkv4MkqLVb9/Si9crgvaWZ9ipUAC1LsxTFaIhseiVRobKAztT9/SEBPr+mBw1TfA84uID3ZCBl
 bUsueVYZuVYTxpLuRf8+5FeTW1vzu5iliu84xQ5oIfcDowqljKp4sbZqhotbCPeXTpFeYj7lQqN
 wIuZLM0kmmY8X7hVpoVQwtq5lEkHkb4/gZ5xOGwimTfExxk1
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

Add a fat warning against adding new panel compatibles to the panel-edp
driver. All new users of the eDP panels are supposed to use the generic
"edp-panel" compatible device on the AUX bus. The remaining compatibles
are either used by the existing DT or were used previously and are
retained for backwards compatibility.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6db277efcbb7..95b25ec67168 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match[] = {
 	{
 		/* Must be first */
 		.compatible = "edp-panel",
-	}, {
+	},
+	/*
+	 * Do not add panels to the list below unless they cannot be handled by
+	 * the generic edp-panel compatible.
+	 *
+	 * The only two valid reasons are:
+	 * - because of the panel issues (e.g. broken EDID or broken
+	 *   identification),
+	 * - because the platform which uses the panel didn't wire up the AUX
+	 *   bus properly.
+	 *
+	 * In all other cases the platform should use the aux-bus and declare
+	 * the panel using the 'edp-panel' compatible as a device on the AUX
+	 * bus. The lack of the aux-bus support is not a valid case. Platforms
+	 * are urged to be converted to declaring panels in a proper way.
+	 */
+	{
 		.compatible = "auo,b101ean01",
 		.data = &auo_b101ean01,
 	}, {

-- 
2.39.2

