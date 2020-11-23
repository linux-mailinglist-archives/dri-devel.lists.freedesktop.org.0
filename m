Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC72BFDEC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBC089B61;
	Mon, 23 Nov 2020 01:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E875089B5F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:28 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id t6so5310374lfl.13
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4xxkreIJbgC8EFiVFdpV6nY5vDKa+iyrBL3x6vFvF8=;
 b=j5wtTWEksHtugVjQDOV918l/wpNPSChF6purMHsBn8LAeCu6ZVIAv+SaMnPF83CBOq
 neARTqolFKtUVM/vZrAFOZGX2MGc+6qL9/vaEuauG5I4ZkNQIi1TUkecubOeJYJmRr8x
 Dugrxd2zjESzX2HVknnUsPrPdGj2MjSqnEXB0QhBzyNnQtfGyFT/8vAx2H6Ppy/wjUPJ
 wzSHgl9LSGl8qRb0DHy3la817qASIj3Dp6M0IhxgzjdjY1q4dCypbDZg+2bPKWtAVmfg
 YtU0a5vZ2nSmUdF7H1gyIy+O/4ckxL/aftH8UqIBM3NXQHqXzAULgzpEBpkmj/IZVxVS
 kNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4xxkreIJbgC8EFiVFdpV6nY5vDKa+iyrBL3x6vFvF8=;
 b=fkhrVwoUyX1TjToxshmr/SZUuNNV3ubXmFiqabcvtwjL6F2lNLwrO8VQLEjetk/wYK
 BFHny9j3a6TPEI/um9qYYDe4jgqxZLhEexbzRB8n1ZNq3I6kQch4lbABkEPAR6EadqMg
 rR++cHjwd+BaGBw9XGG3SmlplGykhnfWcKE7DMbMHyKNHRLktGX6ryKFtSsqGXMtGj9D
 2HuIkHPpITQJ2H4PX0c1ndnKq+iS4BzxTz+vzKDNVmEU7SolfsULlAXL/leOqoez8GfJ
 ovSAdLDFoxo85UB6U3I/CDiiz38KPAA5GtcNOmWAPZwmSLtlIN2VWKojo77tcfv26Bal
 s2Cg==
X-Gm-Message-State: AOAM531iV7/6ye7VlrkEn/WTAyDSTbLYo6tZ90E7o7nFWd6J5YHwRpka
 DUlowuu7p6yfeM/m73Qv5HU=
X-Google-Smtp-Source: ABdhPJyFo4qSHkHAs9XJqnPtJw51GVAKpIxJ00HuVbUW+dPFnqlzeHjCgSXu56dW7MZHwFGjow3kbg==
X-Received: by 2002:ac2:4d89:: with SMTP id g9mr11864282lfe.341.1606091487351; 
 Sun, 22 Nov 2020 16:31:27 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:26 -0800 (PST)
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
Subject: [PATCH v10 12/19] ARM: tegra: Correct EMC registers size in Tegra20
 device-tree
Date: Mon, 23 Nov 2020 03:27:16 +0300
Message-Id: <20201123002723.28463-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
