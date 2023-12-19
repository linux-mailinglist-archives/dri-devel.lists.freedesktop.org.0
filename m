Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF75818D46
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08D010E4ED;
	Tue, 19 Dec 2023 17:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155E10E4D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so4918801f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005286; x=1703610086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8JOWn9GU9Nla83BWtTSRAknxxtN8+L8TovD6+V8Mi4=;
 b=kNWMAw/rU7G6dPaeNAmYfzMe8M69DmGlOo+RmrbsQIF+Swn9f1cKLqzp2VbnWol0nx
 bYPAJTV1nDUPb2ABhbIKXW4O8e+6E6I7+rUANyVVR1eg4WNnAvkb5RjRJWr0FUq8VV92
 pzS1/FydUY1yPeCAgkWzGMpRG40pMji8CTVFRzvLGjeb9W4qaIz3jG3Rgc+z85hJQ3hM
 e6AGabNy5GGvHIPvbuyM0FxXEGbsL2Dys7TeivK+RiW02kEMPMtGwldufrvTE8RTJzXJ
 bTnU1tWqRXacxghSYPWX2L+kQpUUvziGYG4sLmisZf5A9eUPaFAvonfr8O3bpW1aqNyo
 mgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005286; x=1703610086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8JOWn9GU9Nla83BWtTSRAknxxtN8+L8TovD6+V8Mi4=;
 b=Fn+MnwagxsBoHdryfpBD3qxINoS+r3L7J+sYsgUJT7DdZ1lm6mzTXzSDCLMN51ab3R
 vC1d7jOghC5MsBVgyTUz8ERv3tNusxntVfMOEpYKjOCwowe+A3Ue4XkO6efu8kRPZFWG
 3PGa2gfFtFaTwWWT1/CPEJd6oHuNkD1YnUtW1pvVIuFyTNzzDxPWjU5mFeR/MX8siLlM
 q0LTpKk9utL1dETvuKZg7YJ6clMi/hDcKGWoCGRy8/PqVFgTpa9ldarJLaMatwJgc2v9
 45UCK4nH5Yvn1Xt+f4EdN0dXHzy9D63aKb1YEnlIWyQLk5QDGO2dUolSahH5GJZtZm6L
 ptqA==
X-Gm-Message-State: AOJu0YwG6aFlFEA7CEy5S14U7MWEkKbOcqFw0vSwgfyOZWiXPwnAsuXN
 N4gjg7qLokBc/7/IQCdtbQ==
X-Google-Smtp-Source: AGHT+IFvESFKFDDj+P6Hp56SjNt5xISbZzFocZziXX7FumH32R2Au9gUTKsNb6b63EcE9fIlyJTiZg==
X-Received: by 2002:a05:600c:2492:b0:40c:5583:c6b7 with SMTP id
 18-20020a05600c249200b0040c5583c6b7mr6324639wms.109.1703005286360; 
 Tue, 19 Dec 2023 09:01:26 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:26 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 21/29] drm/rockchip: inno_hdmi: Don't power up the phy
 after resetting
Date: Tue, 19 Dec 2023 18:00:51 +0100
Message-ID: <20231219170100.188800-22-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

inno_hdmi_reset is only ever called when initializing the controller. At
this point it’s completely uneccessary to power up the PHY, since all
what has to work at this point is the DDC bus. The phy will be powered up
correctly when a mode is set in inno_hdmi_encoder_enable and disabled in
inno_hdmi_encoder_disable.
Set it to LOWER_PWR after resetting the controller.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v3:
 - new patch

 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e6d37772500c..9fea464b6234 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -202,7 +202,7 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
-	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
+	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }
 
 static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-- 
2.43.0

