Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE981CDC8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0912810E856;
	Fri, 22 Dec 2023 17:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438A510E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so12306465e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266953; x=1703871753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/FPPxJuSjh4vXrR5zkAljtm7LBwORW2untky7snjAo=;
 b=Rn2IhLJDr1zfhfLBYQJXoHLU3D3T5btU5wgl/XcNdeRMuvWIj99QspqtpXFtDS8cl6
 VvtIr/V7qjVcEs3aNjP7ZECHAAX9lRUjfnKpFWVIC6vGWeqxuxCkT5tmP/rGF7p1Wn3j
 5+SnHqyGIEqPkb8GXt5Gkef6mbvfUIM8qmG9jcVp3eNaOG2sjYaNKWQeUIXVZkNxsVud
 3J4oGEItUGw922WjSw98X0MndmayrqNdUJWneg+K0Ywc5LmT2ynlXvWvctEeMytMTb23
 E/xYaiVg3BvqETGdIR1DrdrNi4riSlbBmg2wr96JYsCPGtSnG7BNaGjGhkoy+ep8ZGWY
 92Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266953; x=1703871753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/FPPxJuSjh4vXrR5zkAljtm7LBwORW2untky7snjAo=;
 b=qEPL0cpWgcO05sk8pXaXuxKPr2Ct19D4KqWMLlFTkhICry3DgFZNTKGCKYO1QcQ3F3
 AHlbbttKq6M/w0xSPwhJbS9/BRmPhLzDhPi0dZb3VVtHdcfm4XxcYP44NLzfGmqvp5Eq
 zu3O+5Y6Z0xqu6z5VQ8fZr18ZkB0HbvaNDa1bEzD1nCYmRypknpF2gfkLqi03w2TJa5H
 T1W9dA76LkRJ8cut7BwwmcvBY48PyiBozwGFeqFizDlga7sykMnkpUO44tCA9I1I+YkC
 AryrmtUKfVR78XRseARhuprJMitbPYilBFyWvzdzfTMzjIu+SXTzc1hsiPSmw94Z3NGf
 EkcA==
X-Gm-Message-State: AOJu0Yx6InVQo4vP9qNoand0saNnRHiMyONL5pD9ejcvfh7xtnPzJOob
 Xf1uOwjv54uOqmDpPIY2VA==
X-Google-Smtp-Source: AGHT+IESVQNuwVKMm5k3RVva8Soc6Echl59mQa32aRicQaMoyZBUEGDXAro7m0A3Md1PmbcYnl/kjw==
X-Received: by 2002:a05:600c:3c9c:b0:40d:40ea:a0ea with SMTP id
 bg28-20020a05600c3c9c00b0040d40eaa0eamr911042wmb.130.1703266953617; 
 Fri, 22 Dec 2023 09:42:33 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:33 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 16/29] drm/rockchip: inno_hdmi: Remove unused drm device
 pointer
Date: Fri, 22 Dec 2023 18:42:07 +0100
Message-ID: <20231222174220.55249-17-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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

changes in v4:
 - none

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

