Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E665ADF76
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8099810E57B;
	Tue,  6 Sep 2022 06:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8616D10E449
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 17:16:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so8124514wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
 b=dCaCHmkQglXigR5EbaN46Ul8WuySq57ZrfydsnXmgFhQPeC6ULMO4JaMId3ocEF5LI
 iCqBml4rXzVvqmnpJ5oevfe1N14hZxyCWRoHZz8C8w1p2Iv1xIqxPIkswywlGwlncnqt
 Ne4agLWxqSIN38EdnKZ+ofiqp0HgHWCUoT/DuuRUG63Lpw0y6z4BGDkITT+2yyIjNkn2
 hjlFa1mqwQEySz/MfLeeECS8U9YWa0xITXKogpW1ocqtixc57twI3oJdGNHy1RLCmJlU
 14xYBe8Yl57Ww2GOsSrgUeThd4gfUOn+h5H24O6yYctaKsIFP3tSBJo3hveCmZeijIuG
 G60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
 b=sTqYOG6NU8hzvH+p4oWKkOuBZUbfUfcV525d7PKwrLrEXPEq4JBHib5lzOR5ZqikXl
 SC6PtRinUQEf+XXxNNCEHKPwnf04uDGrMfK50Rdg5Wo1L37yB1GYJDyZkZoDEX1B+Cs1
 PVU+uSO4EZOYG5zvjtT/I8M5ER4dxHHy1ykPDN9tAsI3EOQhIY60YYpVKBVmQFZBeDHk
 na8XHrDtIF3MzAXiDhV5CD9ABwzngs7fOO4r5Dttd6CbfMXg5rSnNgh0Ec8MnbSzj3yk
 uymImsHzNyrlcAtGAuqr/CFMmI/nXSMb0ndNkCLTF/JbjiSTVSDTSUq0CN+relIBsTL6
 pWDg==
X-Gm-Message-State: ACgBeo27LzYnovqpi5X8YGEpS4tlQIfn+a24rYR6TM/5WbNXm0zmyKI4
 E4/oti/izMksXNno29MNFJg=
X-Google-Smtp-Source: AA6agR54ecwenjasPeGEFCVgQjyU7aJO+Mm8nCENH9ALVNOZ/I5Qzv047TlLm5g4Ws2SHr3qVjU4KA==
X-Received: by 2002:a05:600c:2e03:b0:3a5:3928:7958 with SMTP id
 o3-20020a05600c2e0300b003a539287958mr11203715wmf.77.1662398172928; 
 Mon, 05 Sep 2022 10:16:12 -0700 (PDT)
Received: from Clement-Blade14.home
 (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr.
 [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 10:16:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 5/5] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Mon,  5 Sep 2022 19:16:01 +0200
Message-Id: <20220905171601.79284-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable GPU OPP table for Beelink GS1.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 6249e9e02928..9ec49ac2f6fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.34.1

