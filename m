Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B46818D4B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C0710E505;
	Tue, 19 Dec 2023 17:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292E10E492
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c6ea99429so48500985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005282; x=1703610082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+s72CnTe6ZV2IMv3pM/65G6mJvxbtoIjfslzb5tL7Ro=;
 b=daQIVx8ROS2iGn5ALNBJ2xBrS88jlfsOrU+XyKoeFYI/m4daUW7m8YwmLCmKH5aHBX
 VfVRFYZ/dHcXw2pIgS/MJHsb4k1yqj+WG+Df3HZScBfg4C97h0WNtOE4tFgH4CMxuo+T
 UbW/dOd5+TLkZ2EhaTGfnMlckLH9WVRonVIPoBsxqPE2mkzuxQ3palxpeZneQxehS0OA
 dj6swexbh5Zvr2aLnBe5n4GMr9DWQA0A5oPcOiLqs49ceV5b33o6t/6JB3wqzMtIRasu
 GS0MpSCik2/k6WW9xBrC/OLlUBhFv6jzgbIUy7NIU/D4j4EBlPdXLMk/nZvTezahCGrB
 sWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005282; x=1703610082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+s72CnTe6ZV2IMv3pM/65G6mJvxbtoIjfslzb5tL7Ro=;
 b=Qft2CC/BkVQZWpKsW+lU5InIke9sM/EibPUVPzvzPdauzUkM40wey+orxbpCwbqfk/
 uXg6EpOp2mZkP/jIB6dokFy5PKgWG5kq0PQo0R3nZSOnQgueBaoVHRABR5A43PxOXfrM
 ZfIQp2eEta0RMYaxTbIhC7FBT8WDVEJ3WTAuc4ikOP1CBAjaParH2Yc6kfe+wI4fCtGx
 bmEoC76WRyno556aH5QRvI1WL01sydH6GyyhiJsjqBj5e1Vco35vT2aySNxh74preRgX
 B+eP9fDpidhvkPBM5h3S7EsuMCx0U75VPd9WJWC/7+8ZIaG8axrC892VCruvJ2q7u1oZ
 3URQ==
X-Gm-Message-State: AOJu0YzSAW8oiw6r9ELmKGjvT9Tw6myLLr7QPT4QakKz8pdpY6s96Ihp
 WPXZjCqeMxw1gnYE1O5ahQ==
X-Google-Smtp-Source: AGHT+IF42FDcOro97JAPmk/FhpAyFJfar6DWOBNmBzFRzZO3M20X58L49lSjppkjM2XFoVbHdGgTNw==
X-Received: by 2002:a05:600c:244:b0:40c:2b4c:623f with SMTP id
 4-20020a05600c024400b0040c2b4c623fmr6217351wmj.82.1703005281769; 
 Tue, 19 Dec 2023 09:01:21 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:21 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 16/29] drm/rockchip: inno_hdmi: Remove unused drm device
 pointer
Date: Tue, 19 Dec 2023 18:00:46 +0100
Message-ID: <20231219170100.188800-17-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <mripard@kernel.org>

The drm_dev field in the inno_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 49367ca24125..51c1a69dfcc0 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -44,7 +44,6 @@ struct inno_hdmi_i2c {
 
 struct inno_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 
 	int irq;
 	struct clk *pclk;
@@ -757,7 +756,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 
 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
-- 
2.43.0

