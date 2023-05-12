Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D87008BA
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DB310E6AA;
	Fri, 12 May 2023 13:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417A010E69F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:12:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315712406so321519935e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897120; x=1686489120;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z2u4iA556Q3YLEzTDMSIWMB9153khMSJN9i27z6trtw=;
 b=UIqCieSWYin+oz7auJGatVSLrMXRlfI0zD77cvuETRm9Sek6lJ8Liof7+r3WSkCAeZ
 cmkN0Pknbc+9VD0MGtDqwD5ykfUdJ1+U2MTrceMwfZvj4X63vrUoBAkLTbsPS5QT2r+q
 Yf0DcpGJzqqVuWyl9Gsw7Jpzm+t8jzan5aZBkrdVLZUDZUH8kzchGM15V9DKz9nTHtTE
 wtTDqAZvbDrYjtXG0lGh6YA28042KBdSrCbQ60U0YpawPAwtjLmUkXJkW1wEHAdsrQH1
 7BAMPCbYSckLhcD7TlmXVCcdq3ePnLNK7w/k5/OCPQpcyFYMFiRro20FLqw4rE28r3jJ
 Fd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897120; x=1686489120;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2u4iA556Q3YLEzTDMSIWMB9153khMSJN9i27z6trtw=;
 b=QlKlMm+r9tMx2wvBT4rLmow2W5FfVyaJt0A4sLcsRD/qi7s/1IpdrRISrjnAuFu2KC
 QO5kks/5UETkKYDWm6pMjh8yne3uk8XTZ3s/wq1GFQCwDj/RGW/iPshmVcCxkEI1qDA0
 xt3/Z0DADFo5eQuqzIzbUEv+z4L/Xp6/3qXZZMpsE82cW9E0L0PmA8S8DYjROz5teWkT
 D9xWTHqqaaNdW40/A62+DJOvyg9zmkZW9vTAi2vhuXZRn9tomV/l4nMbcvyuKhHNHpQh
 TUqT7++6Hy5sVjo1OgVbU957a5g9J2nSM2Ta2yPsJCrwUq+PXHkSKLfqR/36pjkJqucs
 8JGw==
X-Gm-Message-State: AC+VfDzLBkAahBriWMZBkM4rK6pncm13CoWOw8Fah7deEyJWOe9dAd5W
 XobYJd46F7qoCYPk4X7WGt4gxg==
X-Google-Smtp-Source: ACHHUZ4Lpk6BMX1cUJbI+yBItJVI1j+yCCvXCZzw7+9gNnPJg3syKo8+U4tcTOu7JpVmH1Zi5RRfmA==
X-Received: by 2002:a7b:cb93:0:b0:3f4:2374:3511 with SMTP id
 m19-20020a7bcb93000000b003f423743511mr13961936wmi.10.1683897119822; 
 Fri, 12 May 2023 06:11:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:11:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:37 +0200
Subject: [PATCH v4 06/13] drm/meson: fix unbind path if HDMI fails to bind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-6-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wXntKS2MMfbFGVJHEKvTbL5c60ujsPIrzZFwFPZkQn0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsUe2Bl34Y1X3oYbjtzCiQcgLvemuSQ6t+LekDO
 xNWliTuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FAAKCRB33NvayMhJ0SyLEA
 CJbVHW7/fL6lQG5TdpE4H3PQA+IisR16XaLpnTihPM0NgB8lHdrDxpzS3OHp0RyypkLUzfWqjb45Ns
 iuTpf4zgdW9Diou+fZuBOgOdhrKKRF7F4MNzCU1C8HSPTv7ZxhMvOpHLps5eXd6GwCd/N9Y7QMWnRn
 sumQ/pV3R+yl3knCPdKvCbNjR2dHMEbfQq9MvPWo45MwXSXGnV0jXmX0ZbXiC08vLPBQDnKlse4VeS
 8+hDOW8c/NG7xOpnVLO51YWrQblNWBl7ZqeVVX85DKUFkQ9/L9G9BrAy9WP395oAe6AhBWzh8ilUIS
 Zz3amS2N9WWigj3k/1a+RXLzlizOuoRXTZT144Q/y3+caNLnzbwP3Uag41YtLmxGuw4wqc1n/qSBCl
 bE960wuDbE2VaqoTKiH/bLCqUCwC7ytpMOgRC2r6jlbduGQwmyZf+LUStJx9KHVt6XAqycBfjoilXU
 Lx3QgqtqVFEQOMWwhIypsE1/cY8Pg09299hheyNtQ225CaQGHIQN//dq3KDp/EBptUHa0FlKuWiaY3
 qD7iobfzR+Cm1nz1gz0Tlfm427bSmxQTySUahYcW0fztQgCCuFkbmC5dKJrpawjcnDDNYMqPaLjngt
 lIy0v4JZ+3OiiXMWgkoYdtDoVkXxxtF2ydKv6pYykjslmWkIIG2QMovNrcrQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the case the HDMI controller fails to bind, we try to unbind
all components before calling drm_dev_put() which makes drm_bridge_detach()
crash because unbinding the HDMI controller frees the bridge memory.

The solution is the unbind all components at the end like in the remove
path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bb72fda9106d..a30d61f1c817 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -316,32 +316,34 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto exit_afbcd;
 
 	if (has_components) {
-		ret = component_bind_all(drm->dev, drm);
+		ret = component_bind_all(dev, drm);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't bind all components\n");
+			/* Do not try to unbind */
+			has_components = false;
 			goto exit_afbcd;
 		}
 	}
 
 	ret = meson_encoder_hdmi_init(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto unbind_all;
+		goto exit_afbcd;
 
 	drm_mode_config_reset(drm);
 
@@ -359,15 +361,18 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
-unbind_all:
-	if (has_components)
-		component_unbind_all(drm->dev, drm);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
 free_drm:
 	drm_dev_put(drm);
 
+	meson_encoder_hdmi_remove(priv);
+	meson_encoder_cvbs_remove(priv);
+
+	if (has_components)
+		component_unbind_all(dev, drm);
+
 	return ret;
 }
 

-- 
2.34.1

