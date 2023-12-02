Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F633801CBD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 13:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD7A10E1D9;
	Sat,  2 Dec 2023 12:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1690410E19A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 12:52:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so32769685e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 04:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701521520; x=1702126320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ7Vk4rlYI4wpR0DprPRhwDbWK92/MFMHHXtx/iHz6w=;
 b=CtJpAe/xKndXgvyqnJRGSg6WEnKJIxruwj3V68Ciy49x70/zUQaR9RoY3pbnWd6i/B
 TNNSqZ373MuW3IiNT+IFaJn6TNTkLc1JnJ3wuBm15zFdZXJxeeIs7vAf2PqBctKjRkIf
 phlKfeVY1vDyRzyLW6kK77A6CQ4T3VfFYHxdRf02wI+bRUTnQj+y/nfGl0koLZEwBosp
 2jXtF4aOco+8uAFMdRdI8DUk5uJPrWkBcA0T6JsAWUNhSacS+P2VCi9WRcuGTK4ynXCf
 LMkpSNnlxwk07aaKJ93BKIDKR5PFvadxi/m+o32trxA6HnWh7mHthevgDU9dlMBaIMMJ
 RJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701521520; x=1702126320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZ7Vk4rlYI4wpR0DprPRhwDbWK92/MFMHHXtx/iHz6w=;
 b=PtguBX06c1+K4xZv4AtBujRQiCYhdW9NhN7zzzIf9GBz12RjTxijulnoWGEWnasegr
 0kzPLjZqqrwzzHOLiVNKedNvMNC0biMKeJa7RiIRA3EuPhDQ7wUfRGDAzwFE4OioPWFX
 kU84S9d9FZCeg3EAeP10P776dbBLzyUDGz0LkCevIYhEwrgHu1zNI3gT8ip6t1hDCW5Y
 yP8dKZ08y9yxB00wG5wKyHD6T6vsdJj7Q1EkvNMKmPBCO3J2ICtX6yi4/z1Dj/9dER8n
 C57F6C/ou2G9SbxfgWrCxaWijaBihTLgsQuOhki8+8KkKaO0hfLCcfQwGT8a/0d/Sf3n
 cNlQ==
X-Gm-Message-State: AOJu0YwMQKKH7uiYjT9dLg1OxEzhdl+ymRhK0CfA9GIUynUCfWUHiInF
 8oaVIqy87wROaFR7ybIgUw==
X-Google-Smtp-Source: AGHT+IGHKK9cB3J1W0QWDzln8wREBYdZjVmE10rf8PD+2/UqMjmKdajLeMCstCvLsLWhy3jXHtShew==
X-Received: by 2002:a05:600c:3b85:b0:40b:5e21:dd1a with SMTP id
 n5-20020a05600c3b8500b0040b5e21dd1amr414964wms.72.1701521520134; 
 Sat, 02 Dec 2023 04:52:00 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:908e:b829:354b:f8ee])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906198500b009c5c5c2c5a4sm3018161ejd.219.2023.12.02.04.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:51:59 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/5] pmdomain: rockchip: Add missing powerdomains for RK3128
Date: Sat,  2 Dec 2023 13:51:40 +0100
Message-ID: <20231202125144.66052-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202125144.66052-1-knaerzche@gmail.com>
References: <20231202125144.66052-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For RK3128 the powerdomains PD_PERI, PD_SYS and PD_CRYPTO are currently
missing.
Add them.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c   | 13 ++++++++-----
 include/dt-bindings/power/rk3128-power.h |  3 +++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 9b76b62869d0..62ba4129f6bb 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -998,11 +998,14 @@ static const struct rockchip_domain_info rk3066_pm_domains[] = {
 };
 
 static const struct rockchip_domain_info rk3128_pm_domains[] = {
-	[RK3128_PD_CORE]	= DOMAIN_RK3288("core",  BIT(0), BIT(0), BIT(4), false),
-	[RK3128_PD_MSCH]	= DOMAIN_RK3288("msch",  0,      0,      BIT(6), true),
-	[RK3128_PD_VIO]		= DOMAIN_RK3288("vio",   BIT(3), BIT(3), BIT(2), false),
-	[RK3128_PD_VIDEO]	= DOMAIN_RK3288("video", BIT(2), BIT(2), BIT(1), false),
-	[RK3128_PD_GPU]		= DOMAIN_RK3288("gpu",   BIT(1), BIT(1), BIT(3), false),
+	[RK3128_PD_CORE]	= DOMAIN_RK3288("core",   BIT(0), BIT(0), BIT(4), false),
+	[RK3128_PD_MSCH]	= DOMAIN_RK3288("msch",   0,      0,      BIT(6), true),
+	[RK3128_PD_VIO]		= DOMAIN_RK3288("vio",    BIT(3), BIT(3), BIT(2), false),
+	[RK3128_PD_VIDEO]	= DOMAIN_RK3288("video",  BIT(2), BIT(2), BIT(1), false),
+	[RK3128_PD_GPU]		= DOMAIN_RK3288("gpu",    BIT(1), BIT(1), BIT(3), false),
+	[RK3128_PD_PERI]	= DOMAIN_RK3288("peri",   0,      0,      BIT(0), false),
+	[RK3128_PD_SYS]		= DOMAIN_RK3288("sys",    0,      0,      BIT(5), true),
+	[RK3128_PD_CRYPTO]	= DOMAIN_RK3288("crypto", 0,      0,      BIT(7), false),
 };
 
 static const struct rockchip_domain_info rk3188_pm_domains[] = {
diff --git a/include/dt-bindings/power/rk3128-power.h b/include/dt-bindings/power/rk3128-power.h
index c051dc3108db..68af6c68c272 100644
--- a/include/dt-bindings/power/rk3128-power.h
+++ b/include/dt-bindings/power/rk3128-power.h
@@ -10,5 +10,8 @@
 #define RK3128_PD_VIDEO		2
 #define RK3128_PD_GPU		3
 #define RK3128_PD_MSCH		4
+#define RK3128_PD_PERI		5
+#define RK3128_PD_SYS		6
+#define RK3128_PD_CRYPTO	7
 
 #endif
-- 
2.43.0

