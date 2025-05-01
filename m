Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF428AA5B8D
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8910E1D7;
	Thu,  1 May 2025 07:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SscIg1E/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C51810E1D7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 07:48:15 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so253010f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746085693; x=1746690493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AJWiwWvxqq8d8lvRpGDBO58dLDaqXemoi28sZ0Dk2XU=;
 b=SscIg1E/a7TY8yCS6bORRHCTXVumRJVDXoFYB2HVNuKroIX4iq9JRqS4KB5odeSJKz
 PBEp8dVkQrRN88rQ2qhngQeX8FHhl95nnDjKNOUhYj9C7Uli6oMsD/oYZczLGxsWzLvj
 p8aopaEZOKO77B4jYEtxRCiJYdk5iuKKhWcXLDIVDDLFa6j1Tv7CV+XYunW34SAMK+1S
 FZJe3h3nFkKUQB4QsB1+aXv/A8iMh1zFMVoJuoLDIPP8XCR2PZvhok15Igdo3s5k8QkH
 SjIgmQjvNwdWXSK5/mplpeHe6FEzkFJBdK+bUHyybqYXcMbw3zPJciFG48vTfY9dbT3j
 UIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746085693; x=1746690493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJWiwWvxqq8d8lvRpGDBO58dLDaqXemoi28sZ0Dk2XU=;
 b=r3zqkl68QdePHnRf8d7WpLMANSkhgkrAea3OInob5xa//0+mu2hSUHjqlMOEB/xG3B
 KuzvXbRNd5n/2aJUsLOgA88SiTOTxefNG84/0kB4xJOWR+Od+Z91owJh6ERsZqVibEYR
 L354SQxcPdLbzN3PSAvTui1JlHcsLCbVMw570sOtdNytZA47j+x5Nf6GcOU5vqkihgAh
 xODnaEUqZ2QbZS0tBpGDZErZlOIVHxiwlMGsGs73LxIjmZcZecxp/YIcV2W+HEKMqgs/
 uTPVghvwVjpWtHroRmXAnJinx/59oR3G1KRxGI79A7cK7GhqpmgCC/yckOHX5ciRi87c
 +CSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcEBbvvhLtrcY36SYOOoLTgiSdn2yZX+NgZADV//8IiqtcKte1kAH567FlgLKp3FPHxPyhKqZZg/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGaVAwLe4pHWm3JJRFFIXXGOsLHjjsuEG7Dxw5aRgE5st8yFoA
 8kMpUjbuMBJh6TuYGR6zKl9JoicCdq71IINTlSDo0H1qIsO3pOdl
X-Gm-Gg: ASbGncvZr3A4/LRj4gIUWcoznBagOuqk8AzJzyR5Tj+72GIibSY4yV69OEHfayBA/KL
 Mj5vwuKhoKa5mzwAwfhkvalNVY8pGBDSCViWV7tNcr7EPROJCfoPLM9o6PCvInVz398OvZFR53b
 SVv52kjQIo/CgDLO3t4tdV5mgGx0wg4cEzwk/asg0gaB2IPxJ8Ax2PIgd4WWiPx/VTBh4I6cQIL
 2/tupL3bdKOGYScbmd5X6kQrcaMXG1hLMbi+0bpkL17I61dOhMgK6E9+RYRtBpoFj4oVbKfg0qs
 qoSiO212gKTqZM8CoAR3r8CEPg7pWwjKuORePY4pZEe+QUWv4ddgWMFCPLTLsMuv1aJZGaYV8zS
 7OGGVEK5O
X-Google-Smtp-Source: AGHT+IFonP9yjdjJlEqRjKEzvecQ1TsMwjxuqrSVVBU38WOngG09cHfKoUQKO+cVhPag+ri7nI+zGQ==
X-Received: by 2002:a5d:5f8d:0:b0:391:47d8:de3d with SMTP id
 ffacd0b85a97d-3a093035627mr1350025f8f.16.1746085693264; 
 Thu, 01 May 2025 00:48:13 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a095a8ed95sm114535f8f.94.2025.05.01.00.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 00:48:13 -0700 (PDT)
From: max.oss.09@gmail.com
To: max.krummenacher@toradex.com,
	Jayesh Choudhary <j-choudhary@ti.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
Date: Thu,  1 May 2025 09:48:02 +0200
Message-ID: <20250501074805.3069311-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
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

From: Max Krummenacher <max.krummenacher@toradex.com>

The bridge driver currently disables handling the hot plug input and
relies on a always connected eDP panel with fixed delays when the
panel is ready.

If one uses the bridge for a regular display port monitor this
assumption is no longer true.
If used with a display port monitor change to keep the hot plug
detection functionality enabled and change to have the bridge working
during runtime suspend to be able to detect the connection state.

Note that if HPD_DISABLE is set the HPD bit always returns connected
independent of the actual state of the hot plug pin. Thus
currently bridge->detect() always returns connected.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 01d456b955ab..c7496bf142d1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
 	 * If HPD somehow makes sense on some future panel we'll have to
 	 * change this to be conditional on someone specifying that HPD should
 	 * be used.
+	 * Only disable HDP if used for eDP.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
+				   HPD_DISABLE, HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort &&
+	    pdata->comms_enabled)
+		return 0;
+
 	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
 	if (ret) {
 		DRM_ERROR("failed to enable supplies %d\n", ret);
@@ -386,6 +392,9 @@ static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		return 0;
+
 	if (pdata->refclk)
 		ti_sn65dsi86_disable_comms(pdata);
 
-- 
2.42.0

