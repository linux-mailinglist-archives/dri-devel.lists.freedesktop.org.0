Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B41188725
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D836E580;
	Tue, 17 Mar 2020 14:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2114.outbound.protection.outlook.com [40.107.20.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BEF89F43
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 12:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESHqWtOC3v9sz0JPkxqO79IZBKaoNM51srksC0wJGcsxZjkPiGYNLWQOxzNmnEj3U8IYC8jEGaeXwV8+1Qc4RigZ0XhE/3vqCg4iH192snDdyLuG6kg3v1dqBjam4NAdxjaN7GxNRNIYFc7Bv27+gfsnSpZw7M3gDFFhBGrnPz2qMyd53F7utzdEcYWZ6O+3dV21ap4I0zpUo9HAVytF47E8fRbA4Spco3nrYa3CqM6cN7a68G8f1W3Ygi5T5nM9gmA3GtIZu1vVzCvDcoD5vTmg2s7fClXFtsdZt5dnecd4nQ5WnO+Wqms5FSDuRkOOmjnviHOTN2ECbYhExA9Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1kzIb4eTW5m19cXA3bGGxxlI19Ra1xshRUwlCjvXDI=;
 b=UXrQUOvRbZeXEw4JUIHXIPd5AfDQhTJbznX6sSq43KvLbVWwZbCC54aXH46nA2Eq8sG+2q4GCiSMyAUk1RLzCsFE4uRk6dHB8HgVrsPHHLdaNKVn0UwEcphB5UVxvGNR6GIwGJpWRzn31HCCupA14HSliflNcPQCEED63v+xl0dJ3iaNfsnHfRAXimNaG3abnC8+l91diDgB7PFtzNDQHpf3Tg+YM27MbyBnXsewQptiTkUQlSuOYWl46+4MH9AZ3yTnXGOvIdS7pot5PtUDb53gDtgsmHTVOorem3arAFZWgP43OZxSSe2j3345vDyToCG7KLtaKLNFTywNrx/aQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1kzIb4eTW5m19cXA3bGGxxlI19Ra1xshRUwlCjvXDI=;
 b=IPrQWPEh1VoNYW1WO4BEA4b8yJysWW4tcL6hPJy+tvk0w7u9u+T7GbKaFqSroB5bjduhN/zfrnW8DNEidg82S42mh69wp+X9e0o+ERSQNZi1pmtDz6309NhXL/pfB1LnppoYUfxu99iseCIJl1GRkT+q6oZEilcwcsQ8zCmGMTk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4462.eurprd05.prod.outlook.com (10.171.182.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Tue, 17 Mar 2020 12:32:40 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 12:32:40 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [RFC PATCH 0/7] Rework PWM_POLARITY_* flags
Date: Tue, 17 Mar 2020 14:32:24 +0200
Message-Id: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::22) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (82.193.109.226) by
 PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.16 via Frontend Transport; Tue, 17 Mar 2020 12:32:39 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.193.109.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92f24b8f-5335-4211-67f5-08d7ca6f484d
X-MS-TrafficTypeDiagnostic: VI1PR05MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB44628731F18F14F7CEA38AA8F9F60@VI1PR05MB4462.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(199004)(66946007)(6666004)(66476007)(66556008)(5660300002)(7406005)(36756003)(7416002)(7336002)(1076003)(4326008)(7366002)(26005)(6496006)(44832011)(52116002)(54906003)(81166006)(81156014)(2906002)(8676002)(55236004)(316002)(186003)(8936002)(956004)(478600001)(2616005)(6486002)(86362001)(16526019);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB4462;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajbru8RbLQmgjKwD+95r2KCid79cKzjDo03netdLt+HAWjyngf9jw0cT51IHD8agmsUDBreJ48OzhG/PgghyhnuDmqqo0bg7m17hlhuUw9lDdeUlgdoL2nwzxrsTai0nDxktojNfKmImYoa8l1gGtJPkCt7BTyNIPqRMjFYsvGuljdurMwIVSVB0/z3c5DGSrIG0+/Wh0JyZghswX077mjVbbza7x3w/N+Zs+8y64d4lKxJhYgwBhehNxonij18bq6EdzWxNEpI3dupulYhX9PXr6zd8b/DhM0a3c8B7KSv1PUb5UThx0V708z6YmC4Z/FB4D90C7/KrtW7ZNem61ZRCVvtS0/lA22b/HHkPsD/0qeNNOTUtTwofLO+g96hiY+h17UPa/Sjis0uL+DDVe4qI1b/LGKhB8vDBtCGad8NVe4ZUlsZBOROxpes+fb4v
X-MS-Exchange-AntiSpam-MessageData: EGpmD3tLLdvnd4GrcyLclYhQyBBCFMZozHtqfPv08FPrjYoImY0rCyhXl9vJrzDuzQVqeLBY3PUx1gp6qYRGhtjlE181vtIV6NbaS9AaSM1ABLzDumIqvbvN7buNZzplJQk8/gANax6tTTT7LWlO5Q==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f24b8f-5335-4211-67f5-08d7ca6f484d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 12:32:40.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz/FEFsAObuiUoMoYiFwvs6Kups5z5Shlju/DdLCfKiNEjs2mBSiP8Jdf+YqLwOq8INbIuD82e6zXBWoCcfGWfkknYHoK8UuJGXlnD7L0ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4462
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Soeren Moch <smoch@web.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Hugh Cole-Baker <sigmaris@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, greybus-dev@lists.linaro.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 linux-fbdev@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Nick Xie <nick@khadas.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Ray Jui <rjui@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Paul Barker <pbarker@konsulko.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>,
 Milo Kim <milo.kim@ti.com>, Tony Lindgren <tony@atomide.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 devel@driverdev.osuosl.org, Marc Zyngier <maz@kernel.org>,
 Markus Reichl <m.reichl@fivetechno.de>, Ingo Molnar <mingo@redhat.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Lechner <david@lechnology.com>, Johan Hovold <johan@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 =?UTF-8?q?Andrius=20=C5=A0tikonas?= <andrius@stikonas.eu>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


PWM_POLARITY_* flags were defined in include/linux/pwm.h as a enum and
in include/dt-bindings/pwm/pwm.h as macros.

This patchset fixes duplication and introduces using PWM_POLARITY_NORMAL
flag instead of '0' constant in DT files.


Oleksandr Suvorov (7):
  pwm: rename the PWM_POLARITY_INVERSED enum
  dt-bindings: pwm: document the PWM polarity flag
  dt-bindings: pwm: add normal PWM polarity flag
  dt-bindings: pwm: add description of PWM polarity
  pwm: replace polarity enum with macros
  arm64: dts: pwm: replace polarity constant with macro
  arm: dts: pwm: replace polarity constant with macro

 Documentation/devicetree/bindings/pwm/pwm.txt |  1 +
 arch/arm/boot/dts/am335x-cm-t335.dts          |  2 +-
 arch/arm/boot/dts/am335x-evm.dts              |  2 +-
 arch/arm/boot/dts/am3517-evm.dts              |  2 +-
 arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi |  2 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  6 ++--
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    |  8 ++---
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  6 ++--
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts   |  2 +-
 arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts   |  2 +-
 arch/arm/boot/dts/at91sam9n12ek.dts           |  2 +-
 arch/arm/boot/dts/at91sam9x5dm.dtsi           |  2 +-
 .../boot/dts/berlin2cd-google-chromecast.dts  |  4 +--
 arch/arm/boot/dts/da850-evm.dts               |  2 +-
 arch/arm/boot/dts/da850-lego-ev3.dts          |  4 +--
 arch/arm/boot/dts/exynos4412-midas.dtsi       |  2 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts     |  2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  2 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  2 +-
 .../boot/dts/exynos5422-odroidxu3-common.dtsi |  2 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  2 +-
 .../boot/dts/exynos54xx-odroidxu-leds.dtsi    |  4 +--
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  2 +-
 arch/arm/boot/dts/imx53-tx53-x13x.dts         |  5 ++--
 arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts     |  2 +-
 arch/arm/boot/dts/imx6q-display5.dtsi         |  2 +-
 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts  |  2 +-
 arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts  |  2 +-
 arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi       |  4 +--
 arch/arm/boot/dts/imx7-colibri.dtsi           |  4 ++-
 arch/arm/boot/dts/imx7d-nitrogen7.dts         |  3 +-
 arch/arm/boot/dts/imx7d-pico.dtsi             |  3 +-
 arch/arm/boot/dts/imx7d-sdb.dts               |  3 +-
 arch/arm/boot/dts/imx7ulp-evk.dts             |  3 +-
 arch/arm/boot/dts/iwg20d-q7-common.dtsi       |  2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |  2 +-
 arch/arm/boot/dts/meson8b-ec100.dts           |  4 +--
 arch/arm/boot/dts/meson8b-mxq.dts             |  4 +--
 arch/arm/boot/dts/meson8b-odroidc1.dts        |  4 +--
 .../boot/dts/motorola-mapphone-common.dtsi    |  3 +-
 arch/arm/boot/dts/omap3-gta04.dtsi            |  2 +-
 arch/arm/boot/dts/omap3-n900.dts              |  2 +-
 arch/arm/boot/dts/rk3288-veyron-edp.dtsi      |  2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi          |  2 +-
 arch/arm/boot/dts/rv1108-evb.dts              |  2 +-
 arch/arm/boot/dts/s3c6410-mini6410.dts        |  2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi          |  2 +-
 arch/arm/boot/dts/s5pv210-smdkv210.dts        |  2 +-
 arch/arm/boot/dts/sun5i-gr8-evb.dts           |  2 +-
 arch/arm/boot/dts/vf-colibri.dtsi             |  4 ++-
 .../dts/allwinner/sun50i-a64-pinebook.dts     |  2 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |  2 +-
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  3 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  1 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  1 +
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  5 ++--
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 +-
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  5 ++--
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  4 +--
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  4 +--
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts |  7 +++--
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  3 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  1 +
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  3 +-
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  3 +-
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  3 +-
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  3 +-
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  3 +-
 .../meson-gxl-s905x-hwacom-amazetv.dts        |  3 +-
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  2 +-
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  3 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  3 +-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  5 ++--
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |  3 +-
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  4 ++-
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  7 +++--
 .../dts/exynos/exynos5433-tm2-common.dtsi     |  3 +-
 arch/arm64/boot/dts/rockchip/px30-evb.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  1 +
 .../arm64/boot/dts/rockchip/rk3308-roc-cc.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts   |  4 +--
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +-
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  2 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  4 +--
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  6 ++--
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi |  2 +-
 .../boot/dts/rockchip/rk3399-nanopc-t4.dts    |  2 +-
 .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |  2 +-
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |  2 +-
 .../rockchip/rk3399-sapphire-excavator.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  1 +
 drivers/pwm/core.c                            |  6 ++--
 drivers/pwm/pwm-atmel-hlcdc.c                 |  2 +-
 drivers/pwm/pwm-atmel-tcb.c                   | 24 +++++++--------
 drivers/pwm/pwm-atmel.c                       |  2 +-
 drivers/pwm/pwm-bcm-iproc.c                   |  2 +-
 drivers/pwm/pwm-bcm-kona.c                    |  4 +--
 drivers/pwm/pwm-bcm2835.c                     |  2 +-
 drivers/pwm/pwm-berlin.c                      |  2 +-
 drivers/pwm/pwm-ep93xx.c                      |  4 +--
 drivers/pwm/pwm-fsl-ftm.c                     |  2 +-
 drivers/pwm/pwm-hibvt.c                       |  4 +--
 drivers/pwm/pwm-imx-tpm.c                     |  2 +-
 drivers/pwm/pwm-imx27.c                       |  4 +--
 drivers/pwm/pwm-jz4740.c                      |  2 +-
 drivers/pwm/pwm-lpc18xx-sct.c                 |  2 +-
 drivers/pwm/pwm-meson.c                       |  6 ++--
 drivers/pwm/pwm-omap-dmtimer.c                |  6 ++--
 drivers/pwm/pwm-renesas-tpu.c                 | 10 +++----
 drivers/pwm/pwm-rockchip.c                    |  4 +--
 drivers/pwm/pwm-samsung.c                     |  2 +-
 drivers/pwm/pwm-sifive.c                      |  4 +--
 drivers/pwm/pwm-stm32.c                       |  2 +-
 drivers/pwm/pwm-sun4i.c                       |  2 +-
 drivers/pwm/pwm-tiecap.c                      |  4 +--
 drivers/pwm/pwm-tiehrpwm.c                    |  8 ++---
 drivers/pwm/pwm-vt8500.c                      |  4 +--
 drivers/pwm/pwm-zx.c                          |  4 +--
 drivers/pwm/sysfs.c                           |  6 ++--
 drivers/staging/greybus/pwm.c                 |  2 +-
 drivers/video/backlight/lp8788_bl.c           |  2 +-
 include/dt-bindings/pwm/pwm.h                 | 10 +++++++
 include/linux/mfd/lp8788.h                    |  2 +-
 include/linux/pwm.h                           | 29 +++++--------------
 include/trace/events/pwm.h                    |  2 +-
 130 files changed, 239 insertions(+), 205 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
