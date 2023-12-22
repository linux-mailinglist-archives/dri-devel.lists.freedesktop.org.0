Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFF81CDC5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5AF10E850;
	Fri, 22 Dec 2023 17:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5CC10E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336755f1688so1824484f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266945; x=1703871745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AvJnFMeaIBZd6lDR2+1UVvuB0inJkI3zLE1woR+vGw=;
 b=QTYzJsYfvx/wwA1quQJdOvjAU5Ji95wsEzSP5FN5XG+HWrWTrH5/n1zCRySrc7CX1M
 PfNYWSBoob6EV0CzOowyiZRhZKIxvNP9xhNA8jyDHsWuuX62/gSs9Mljf9KBQmG3KZK+
 ZBiZ9wCz+aTxByCfU3LbZLdPx+TIhLYOBDlR5AQ6WyQdWhfXBd+jGGZcwRsMI6oyLQ3X
 ENCQ3hJVdxSbg/L7H+zbrkteXQFKl3mR/0fnFOj7goxBvhaMuzJ1BkIqzS+1029pOh9O
 oXs9aKRWTFi52t4WtCwJk/gnXNNG74s5yxhRXkemX0+xzby1RAIqrr6yTAPYpN5SrWA3
 XOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266945; x=1703871745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AvJnFMeaIBZd6lDR2+1UVvuB0inJkI3zLE1woR+vGw=;
 b=UbquC3ePou1KFh7M3Myhtr9DjdsvgvvKgE0ix6LINYYVkUPJ8LCW4A3NRk1INXShRN
 6X9W6Lv2Qybp/mp9RHxvuhw4NTL+zy+OaPuKt2sAZDmtZfrEjWs0Yl46+DhRFtx2L/cT
 NY0UtFrNmvAU373tkFi8IKmKMGVq0QYRUkzpwhS6T0npv+f+nqUwysYb5YQ99vzltaYv
 XstRTWRBd4cKBmtRQbmywsAG9aSJlx9HawvHAMDZqOJN+ZKqFv5TmLyi1YirSmZUf/eV
 GKKuFipiHYqjPtgFKli1+oTFe7Ccpg3DzKC5ngI1FuvpHgYVmBQwZJQ6MZRORcNGAQ3k
 gIBw==
X-Gm-Message-State: AOJu0YwxoECzToHHmUUGKZOU2wb8TNvHgjHpJUgM2W1Za4UVJ/ECfex2
 avGrQj9qMKtwUqH9H0vtzw==
X-Google-Smtp-Source: AGHT+IHILFPGV8bXVLgso5JM9ZKyQoow6IG9KXyZ1hSIhSMLEgPOaAW0iXyaQSbizVOd8/5R10rStQ==
X-Received: by 2002:adf:f749:0:b0:336:8af1:5127 with SMTP id
 z9-20020adff749000000b003368af15127mr1196473wrp.97.1703266945283; 
 Fri, 22 Dec 2023 09:42:25 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:25 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 04/29] drm/rockchip: inno_hdmi: Remove useless mode_fixup
Date: Fri, 22 Dec 2023 18:41:55 +0100
Message-ID: <20231222174220.55249-5-knaerzche@gmail.com>
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

The mode_fixup implementation doesn't do anything, so we can simply
remove it.

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

 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 345253e033c5..0b1740b38c7b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -517,13 +517,6 @@ static void inno_hdmi_encoder_disable(struct drm_encoder *encoder)
 	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }
 
-static bool inno_hdmi_encoder_mode_fixup(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode,
-					 struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static int
 inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -540,7 +533,6 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.enable     = inno_hdmi_encoder_enable,
 	.disable    = inno_hdmi_encoder_disable,
-	.mode_fixup = inno_hdmi_encoder_mode_fixup,
 	.mode_set   = inno_hdmi_encoder_mode_set,
 	.atomic_check = inno_hdmi_encoder_atomic_check,
 };
-- 
2.43.0

