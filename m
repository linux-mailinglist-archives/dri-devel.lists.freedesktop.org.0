Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0572987CB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331896E841;
	Mon, 26 Oct 2020 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4506E270
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:12 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v6so9390824lfa.13
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7uQYoSS+SwZKNve+DXt46n4S6SnUzemcLRL4Q3Aw4E=;
 b=DrSjShpsbPLiLJ37g+NjmBEJ3tWraX5OIaKpgKOFilWX9Lb6NUUaA9fG0b7RVZk6yI
 uYouwvAPszX8WSjT5cUP85vTPpvt+3bteYldfh4BNxypDCaCzaV24weL50SmMmcHc5ll
 8q78+eoo3CqEPEBJmsOMDbn7xcBcAyklsiy78vFFPMFLbHK5sViEHHQBbM85humEFxiD
 26tNvjMz/nIftPTi1dCsyLvidIZqugbJQWNwqPRCX5zLIDKGSDzfFpP0k5WVE+XZuMJW
 48U9wKJo/PfwA3dqkvJ4F60tajNJq1MaW9FpbBGyON6S19HBR90llLTBpeOWx0ACG25e
 xyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7uQYoSS+SwZKNve+DXt46n4S6SnUzemcLRL4Q3Aw4E=;
 b=lHx/XiOs3fInpJbHOVdhnfVPwv1Dxd47t0qxcwRSCLnpNgOIqmFYT/iW0bcrBe5ECY
 WJv6FL768fYI74L/5oK2wDIFccvLf1XmCDLe239zTq9ozuakfR0u7Hn+19ATQ2aDebFT
 6F+5sveKxEWGQyUTdf96QLQewpFW4T06i9j1R4j/k/93w8zNme6Oe0QjT/hCW6QK25o3
 AulAG6wYLC/eZB0KZBJf29ti7pHrIP8PkkfHlY8PxsRJ0YlV+T/ASSkgNbYoCXOzmhsl
 9GS/1e+BjlVVEo0haDtgV/2Q0hE3ToplYB/oVdgaX5MjxlR4xdaH0vcBRjkaYm25/+om
 ixGQ==
X-Gm-Message-State: AOAM532h7sVSW8/4+KVDv2yC3TmQhyV0m2df/1+QuJ0VbuxyJgG/pFdA
 KvADfMDzvSC+c9lLeGqmWFs=
X-Google-Smtp-Source: ABdhPJzJiCOjCLOQMQ9QluohaM2tJl9iJQnNOzR0iV7bi+VEwXEa8Esfh8YFYtw5t8p2Oeb3wHxmXw==
X-Received: by 2002:a19:8ac1:: with SMTP id m184mr3703988lfd.199.1603664291379; 
 Sun, 25 Oct 2020 15:18:11 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:10 -0700 (PDT)
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
Subject: [PATCH v6 20/52] ARM: tegra: Correct EMC registers size in Tegra20
 device-tree
Date: Mon, 26 Oct 2020 01:17:03 +0300
Message-Id: <20201025221735.3062-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra20 EMC registers size should be twice bigger. This patch fixes
the size.

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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
