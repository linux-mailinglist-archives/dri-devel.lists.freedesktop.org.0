Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B52B3B17
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFA389F3B;
	Mon, 16 Nov 2020 01:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79736E9EC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:28 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h23so17824206ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4xxkreIJbgC8EFiVFdpV6nY5vDKa+iyrBL3x6vFvF8=;
 b=YlwiH2JRr5bSFW9JIO9QC6RKVFPTv6JbO869PCUOaBUfr16W5w/2JdAXZ9YViqKl8P
 638BJI9/6Pb5VHfiFgZkbEbGBt5e1NNfF28VsAReYz1l6DASxEeJSSxu1u1+jXV1Hsqa
 vaZEFahiG+5Sxm0EukE47xHPHb8C0S0lI7zw9yXHuJ4BwWBbmY8ShngrxU+PT+zwPANJ
 hSq16e9XcbLNO2/QvJ/CqOVPXhBqMPOuQqPQiJNIctWqu2Ox5JY/aBrZ2sccHv1o27oL
 ijkQSnznpFX5pHgVbQmkYOsC52E4M/1+SBQpRafUQr/F4k0RH27CinqIGV/K+GPtyu5A
 yh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4xxkreIJbgC8EFiVFdpV6nY5vDKa+iyrBL3x6vFvF8=;
 b=lSDlFkjZ+bz7X7UHbMBEkAvsyrfFw2T/J7VOp1D4aGwf1hmxXQ1yO7wyPQGTHa7i8i
 d9vhFrPMWCyMjvVSHitvGfgGxZNrF8h5TXg2hRZ+39bVJ7VHI7VHM48I3X4fl/Rhqla3
 6xQCZHbPeLv0KchVPjM8a/C878m6v2cYxGHjeP/Sq54EAfDu3aPy8IokcfgCQ+zWovw3
 bzGseyE6gK3bh61/YTGlECI3tyx/5WYRlrjSl2S4CALjV/y2i9Jjl613BWBRCLDWJm5y
 t0AomRIVYD6ZfaBsB8dizyFJhMN7zV3NvtktkhS0Aj+bId01E6V1rCW2P7FWOsF7zovP
 jFOA==
X-Gm-Message-State: AOAM533qH3H0GqGaiQWG1RjK9y8Ug+TWaqci3MEuWXDHwZo3pB5JwnsW
 Xfthnoxeftw3C8MxFIX7pWk=
X-Google-Smtp-Source: ABdhPJwT1yXAc8mfECjj/fFM0wDUTIIL+HT+QyBtPbqYsgwqFnnTJaDqcl0g8suvWTJZKWM5Reublg==
X-Received: by 2002:a2e:9842:: with SMTP id e2mr4653278ljj.373.1605476007267; 
 Sun, 15 Nov 2020 13:33:27 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v9 10/17] ARM: tegra: Correct EMC registers size in Tegra20
 device-tree
Date: Mon, 16 Nov 2020 00:29:15 +0300
Message-Id: <20201115212922.4390-11-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115212922.4390-1-digetx@gmail.com>
References: <20201115212922.4390-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the size of Tegra20 EMC registers, which should be twice bigger.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 72a4211a618f..9347f7789245 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -634,7 +634,7 @@ mc: memory-controller@7000f000 {
 
 	memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
-		reg = <0x7000f400 0x200>;
+		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
