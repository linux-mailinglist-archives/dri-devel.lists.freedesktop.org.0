Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564182A7915
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70B06E9FF;
	Thu,  5 Nov 2020 08:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FBA6E247
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:55 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 2so23666968ljj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqzEltuN5moc9KsPy66tWe+lPEJWveWVX7/N9Iczqdg=;
 b=o4UnBK9ibQLU6a5PeuY3NJhfuI78mBN5N5b3ypqcs9Iq8a69jE87KBp/h5euFrzrMO
 8TTvjki2JeoiExtYHNfLOjrOm1PFy9hEdPGL7sigDc0KRXaG6wwWy3Vpc0m15WWY7dnR
 H5psVV7PaxohhErmm/PRDRxLixxoobSj515fy+X7zhQ6OT7UZ3dR3BWOtg88EiA4CZ4i
 pENxKZNq5rIL5mZ5rBUoEEpWJFovi04W2bd6nzt14hTAjKkH881oey9Nkhgrhnz6SYWc
 N3BqWVM8SyTodXb5pIFXyPRHSx72OJhpfc8UEaS1gBj8vAlW+E3skWiuk75+MdI+vMJ8
 Yfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqzEltuN5moc9KsPy66tWe+lPEJWveWVX7/N9Iczqdg=;
 b=K0MmbNCXEIJg0HfrbXDR7KCV+LEUCSZaJ9vidaQBD4pqVJWA9TM/eYrm28rMwn2/Bs
 8HfM4au9sI/StNrZ8Xw2IUalUDUTOCmBi/vQzd/5vNNXYhttHZH/mgIuprffiYjVlrjb
 WNyj5C4kqhNM9poglkOVS3Vyckix7vX4IW06bqRV1IZm6IQKaHMBPx3vm5BUNcvf0b6N
 wRSxaNHq4hsQIoVbUUuNDNfh71bVag+oEBCeQSGNRy8F+oHco4TzzUuehHoXKvrtE8cB
 sIH6JCmlNf/N8INwjcB6e2kxU9+ywxHSpeup/Ubtsx0zLcdVkDIjSRQFQ6fnEuZWiFMz
 Zsvg==
X-Gm-Message-State: AOAM533XpQYcMTtHXAlhXP/4+o6ttxH0eyjjP5HvP/8yDpuBzT8Of2+1
 XwFhoe0breTelilteLPL4F0=
X-Google-Smtp-Source: ABdhPJyeX5Yfln+dusfWz3xKWppTsZIg6ArEcqN8glIFOwU51Lb09IzPCh9OsQa4/GpcEkLlbHZ3RA==
X-Received: by 2002:a05:651c:291:: with SMTP id
 b17mr10424595ljo.34.1604508594027; 
 Wed, 04 Nov 2020 08:49:54 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:53 -0800 (PST)
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
Subject: [PATCH v7 20/47] ARM: tegra: Correct EMC registers size in Tegra20
 device-tree
Date: Wed,  4 Nov 2020 19:48:56 +0300
Message-Id: <20201104164923.21238-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
