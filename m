Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FC4ADF31
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601210E7D4;
	Tue,  8 Feb 2022 17:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AD910E7D4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:15 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0281B4004C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340754;
 bh=VHcPmkTeJVNyntx2kBlzhzsUutabuRvxOsRCpNXtu84=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eE06Fj4wsqL95Vd+feFDIykqxaN7KL2zmkLVutUvtJFuC1G/3vQiFAMOY7AuREyle
 22aMTq1RepW7dXoFMxxhYYs/rA0M424g/3puGRengNeLOvqP15OZY80NoB4a9zvvbs
 e6e8Pe/NkcuSFdigFayGrq9hFt5ui/pHH8qz1bNcbaAuP0nb/asGXMSxQpVFmoysq7
 L5vbblG1Czn5LC0/PxM13Zo/nTd0w/aP43vGIib0Baz07kVIkyoy4z4o/LFYIQe9fG
 5ZYLd7fxCIg9PiQ2P5equNqHeqe56eps8JguIYE3SovCg6XvfQIL9Dh4kSQewXJbVo
 iQx2deKWRg0zg==
Received: by mail-ed1-f71.google.com with SMTP id
 30-20020a508e5e000000b0040f6642e814so4061293edx.19
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHcPmkTeJVNyntx2kBlzhzsUutabuRvxOsRCpNXtu84=;
 b=aXYV0KQlMoPvI8jiqPSnIShvEARppvA1pObAPUgd/t9UMoVdlavM60A+xxoNh08MfP
 RJOfkSBS8ZFAf+bvYodRqxFgBTGTB4R1Ha2fB0197Bz7Gb8LdvGTBouc0zRfbdZNpr2m
 uUFAF7TxpAW1U6vZZW1xSnUEuDll7/1COqEz+SZ2dTTEpI2G4WSp2+g/bRObDcL/sJPn
 wulconTLwhm+CTCZfDM2r99ccUlxGUP3W4gvvL5OEmy/M+U5oLB0/BZRgOvlyc3BfdOF
 waHqjtRGZg7lV0vhbBS9a6Z32njhXBUABxYoT+7lh3MNNAo2KWWhgHVFvMJt51Kf324k
 Fqzg==
X-Gm-Message-State: AOAM530ovLCpjewmYu8zpWbfzZvzhWzunimaB3Dddj9z8UPs/3qADMVZ
 oaQ2oL8/0xpRjmpzb5BvE9fY/m8cGDYZW6vx5BHgU20Aq5QOY/Z7ctAY19gOFdQhhHpTaef6WPg
 wF94ElAI3xrtYdB3T2reT4ThxYT21RA1wW1vroIU7FEd3bg==
X-Received: by 2002:aa7:dd88:: with SMTP id g8mr5421159edv.437.1644340753084; 
 Tue, 08 Feb 2022 09:19:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu+cFFUCenp9+7nbzSzHf1p2aHa5gSlHKLF75wAskvl768sx1e6yjGcesa9sVQ2V3f6PILbQ==
X-Received: by 2002:aa7:dd88:: with SMTP id g8mr5421132edv.437.1644340752936; 
 Tue, 08 Feb 2022 09:19:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 02/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5420
Date: Tue,  8 Feb 2022 18:18:15 +0100
Message-Id: <20220208171823.226211-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add required VDD supplies to HDMI block on SMDK5420.  Without them, the
HDMI driver won't probe.  Because of lack of schematics, use same
supplies as on Arndale Octa and Odroid XU3 boards (voltage matches).

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 2978b5775a6d..4d7b6d9008a7 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -124,6 +124,9 @@ &hdmi {
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
+	vdd-supply = <&ldo6_reg>;
+	vdd_osc-supply = <&ldo7_reg>;
+	vdd_pll-supply = <&ldo6_reg>;
 };
 
 &hsi2c_4 {
-- 
2.32.0

