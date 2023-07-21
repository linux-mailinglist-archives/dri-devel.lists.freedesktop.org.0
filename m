Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529D75BFC0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 09:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753810E0F7;
	Fri, 21 Jul 2023 07:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4368510E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 07:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IstlTZQfyGK8MwPmCmcPJzFjVNgbHQDJXtEudeebA0pln76iMBqNt0ig4Gdp/z+XF7QcQY4Z/DTrnH9T5z1+AHnBDFyV9qAfzKURoRzNeFqNMBMM4ggZ6DZIidTRoLmY7YxeS+F5nTgyioem8Dy1N9KbZxaqMO1VJcPB3Mt72Ftn1ci8gFPStRPG3gPUu1NJZdOTnTc5sLFDtnHQC3ib62YR7M4tAD8K2qfwjez0GRuW+vh88VZgh+Tq2zmsrKRiA6bbOcZzS3QXXP9hEgQWKCigc1v3N3IO+rqyvDkzwJM/gLXB5GJzctx/6nu7FcvWSLH+GIUg8SNiKq3yKfJGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UNaZGNev4novCdYIm2ldQldfepvYxuod0+t8U6p2bE=;
 b=BQqLJdnBd+HKF1GtbwCkKC2K3zVYQ+KreuMbNiajhFAbHGc6XKnTCTHKmLOyTNYYIZqIEqYh3bF0PEd2Wdx+cLj7MlW1Ixa01zpSBvsxO3kkJ9S1utaUaCqYqmIyzyOsNrjIK6Dh4y7D+pzft884IxK1cAIWUGuJXJWFM/ZFP4mKT64C2A2g0gxccwcx6uVw56EmWh0xOQalz3AAhQUmf62e1/+XKxLngAnz9ZnaIbN1/60qGea0bQOBMaXDF8q+Cu+z6HgaxLzafhVvF730lXKDkOEznpLv34ENO73BPimLll8L5Ac80jbLArgrZ+tBHgPPjJitEbRqG2goofGmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UNaZGNev4novCdYIm2ldQldfepvYxuod0+t8U6p2bE=;
 b=apo0NwzxNovDhbNlVdYzA47r17qHIXZmkFhzaAeg45XQrpipf8oQ8o6ZKXUQEbwg4J1VnFqe2oyx+n66/wkfy/mCd6Nf8YZHL7zALRNqWmnEhRRawms6q0yxrQA9o85ym7BITyuw+4a5nRXZERT672vQt/Ym5tlkzVtdsm2ZjYw=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 07:31:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Fri, 21 Jul 2023
 07:31:37 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Topic: [PATCH v2] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Index: Adm7pWHkE3L5gGu8m0ilbj6s2t0e8g==
Date: Fri, 21 Jul 2023 07:31:37 +0000
Message-ID: <20230721073555.1377236-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB9PR04MB8314:EE_
x-ms-office365-filtering-correlation-id: 2e085f9b-d50d-4b48-3c54-08db89bc846c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +7tibUE2ixVyDDKbsvQJXaf7iGtraVMkAfl7qeVcNzMNGkupfHofn98EEBd7kDMqnh795bITKeyAKhYtRW6wQ8tYYy/CfKBMQguGn51/tI45AYSvQ81rMf3fOoKn/jHwY8zksv/cOvdtMoA4l2HsV91JAvIuedRb1zM9teeEr3DgL7hD0+p8o6Q9lr5BctIKzvtkK7m1AgoGc7JorrSnmb9/d3YroWSXDK3qT8N4x3TvixgfmOToaHeHec1WLLxZxINgADcsUHd78XAcuGrqKmUJSw45yatbNFN5rLPbKGe7uboKNxxwz1Vaendb6ERW9y8pyfGHqqMK8bfV8B/8Ggh8NYacJI3ZlfWhgtYYww+dpyCsAE4CmHTORZMkYDCYb1TMuH8hLFTXOXJItQyEAlFfPnmd41iTyYMUGYHXlF1mc+xBam5uTancC7k/+qRXnBN4BkMbOJ1ZhaB+BfOVKcUn9RuMO46uThsA8rkrWRWf59rijKLLRI6E2q8ZC0wtwSUhPeKbSqIrmC70sXcbzsxmDy5KIt6uSFFCXZ1KMMsjjLZM245ceNR460hnYESYV6r1PlKwcnZKRKEhQihlVe06bZHJIGj6WmsU/X6D7dga8f+JUhr0mQ53GLpnZdG4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(6512007)(71200400001)(64756008)(66446008)(66476007)(66556008)(4326008)(66946007)(52116002)(36756003)(6486002)(2906002)(110136005)(54906003)(316002)(478600001)(86362001)(1076003)(6506007)(83380400001)(2616005)(186003)(122000001)(38100700002)(38350700002)(5660300002)(8676002)(8936002)(41300700001)(7416002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NiWZE13aWilcX0kM2AbE2ejB7ZnwfX3G5lRc3a3p+L5IIQ7ZH/IT6xdFb4?=
 =?iso-8859-1?Q?0vcyO3zVMJgMJoMKMfVgSR3EviAH877mQC7YHlDfw3c1qVtaiqoCE7eEa3?=
 =?iso-8859-1?Q?5byIsP1mGdy/9BAsCygwgfaZm6+vOHvnWNi4a7pd8JB0C7dngH8jPdyKzl?=
 =?iso-8859-1?Q?jh3PtYCy2Q342SUZzK9F63wqg0tyQ3VBJ0II9Mss2+n11vgedMHiMzB/Pe?=
 =?iso-8859-1?Q?0zdKWVeRPzzPDpF0HrhqSAlON4WPM8YdrKn/yNf+kr5CBCQCSqC6TFbt7i?=
 =?iso-8859-1?Q?rsmrFMYeC7jKs/hFDVHM4f6rpU3hM7XEE3ci7I3726kBMYehN6fhSQ+vc+?=
 =?iso-8859-1?Q?DtD5+Ok1A0rZVdKUuPtb1Ovd6VVS2NzdTDvlUtBHJX1edhgW38LwfgkjNS?=
 =?iso-8859-1?Q?DKlkHNku7CXai31xCPWf74x83JQz6RxFSetVuAoflAVZ1qh4v66fO49A9t?=
 =?iso-8859-1?Q?DUNJgcNTCQ9TyjYBz5xZWlQVUacKbKpqLqo2YX0ensxARagmly4k0FSXMY?=
 =?iso-8859-1?Q?HIqI/e1EbHFoYU9GwogIlDP2dwdYE7whsYBi9CdhsWCd9M0yTCL8Z0pNqp?=
 =?iso-8859-1?Q?pEbMp+op+cab6386MIkqCzOlnhwfCjzk04sJqXUo1jKncKk/KBnP5YnV3F?=
 =?iso-8859-1?Q?frSPtNldelSm6diag4pv93xUQhgDO/gWyNeBOqwDqbRB/lZLTbNenvqWA9?=
 =?iso-8859-1?Q?itamjbWXiyTJsuGUthsiZZ4gvxOcy6YZaKnlZCAjyTZfkOcBuweJzg0ssn?=
 =?iso-8859-1?Q?xQN69YqjlmHk7X8fCQm26WmEZEjc4T/Zpl14J1GBGw6y2xat9zhD9FWsQr?=
 =?iso-8859-1?Q?Zmn34nEBaFf6j1zuiLJPi0Lwp0WmcnpbrC9jf22D7CIW/3S0gcxvMRMP2b?=
 =?iso-8859-1?Q?qOz51yHY3L0vsN6LgJDGC1019m039OOdOESCXBL72v+atGVJA+O++tIDJh?=
 =?iso-8859-1?Q?ZXUln17aW4finlS/bfOiKC1SPAZSVCaH7jMXZY0RLPbXh0o12gyHoXS+1H?=
 =?iso-8859-1?Q?mVkSBXui6n+vsRoTbT1fjXa1Iege8u0kiqQ5r80bkx0pBLpdiUFYy+1yKN?=
 =?iso-8859-1?Q?P4GaUpNaVJzA3qogfD15E8i54nmdBs0VyjdERmFl1ZR56OvdGbHtDsIy0V?=
 =?iso-8859-1?Q?BkbNljBuQBR7vDnmFe+e5ldmgB1+B2baKC9sU5uOz3V9doW4mUPMP8c8+f?=
 =?iso-8859-1?Q?sSrNFzPQewznRPFLAXVcHXY+Eq8Rk7hWTEAsn7PCFm4qMZ8gNZ1blc5xIn?=
 =?iso-8859-1?Q?d6Bo3Frsqj48WW5EMY8I4sxgH4unVLqfrjwWexaO1H/22xyUcDEoPY1OFi?=
 =?iso-8859-1?Q?P3jgfyMkhHX6iJ2N3dh40iZkEu5izjege1aYc+tClu/PGPXw+tGPsAzWSY?=
 =?iso-8859-1?Q?kbMBbWVHv32XwFF/CRGZMBne0TtAomte+/S5mzcAw2m/zKeumnVjnC5N67?=
 =?iso-8859-1?Q?IISbR5oEDeSvnPm0OmOVWUwtepMmYQ2N0/migLZ4JOlOqXTxDeDLSKYd8A?=
 =?iso-8859-1?Q?4cBzIzOfANBiMd6CJJmdK/K0nRYc6VtsXjR3t7IP9Xzz3nnnQ/0w6eZEdU?=
 =?iso-8859-1?Q?yI7xFgpaqXS8tA4UmNZQ7enLpgv8TOFOx4k0RsXHZ559aMYx8V+OozRxgT?=
 =?iso-8859-1?Q?Sayl8AkvtD7TwVDAXDgn1RjOjigdnv8inf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e085f9b-d50d-4b48-3c54-08db89bc846c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 07:31:37.0813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZy4KYHSMWqSHLFxcpyCzH7jAD9f68gPGQkMt9BCieqnR0+5/zo9ERsj4i5yWsnt64RyqvyktefiGtPzF5vLNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314
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
Cc: "andy@kernel.org" <andy@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If gpio pin is in input state but backlight is currently off due to
default pull downs, then initial power state is set to FB_BLANK_UNBLANK
in DT boot mode with phandle link and the backlight is effectively
turned on in gpio_backlight_probe(), which is undesirable according to
patch description of commit ec665b756e6f ("backlight: gpio-backlight:
Correct initial power state handling").

Quote:
---
If in DT boot we have phandle link then leave the GPIO in a state which the
bootloader left it and let the user of the backlight to configure it furthe=
r.
---

So, let's drop output gpio direction check and only check gpio value to set
the initial power state.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Improve patch description. (Daniel, Bartosz, Andy)

 drivers/video/backlight/gpio_backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backl=
ight/gpio_backlight.c
index 6f78d928f054..38c46936fdcd 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -87,8 +87,7 @@ static int gpio_backlight_probe(struct platform_device *p=
dev)
 		/* Not booted with device tree or no phandle link to the node */
 		bl->props.power =3D def_value ? FB_BLANK_UNBLANK
 					    : FB_BLANK_POWERDOWN;
-	else if (gpiod_get_direction(gbl->gpiod) =3D=3D 0 &&
-		 gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
+	else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
 		bl->props.power =3D FB_BLANK_POWERDOWN;
 	else
 		bl->props.power =3D FB_BLANK_UNBLANK;
--=20
2.37.1

