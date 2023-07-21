Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070C75C24A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E4C10E198;
	Fri, 21 Jul 2023 08:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CB310E198
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhh3ykt4Gfy25yA2m/JaHhG0nmDB9xkQWES98EowDxnSM02sZqNQCr6WdyL5O6kEg6n8+xtSPMlBaSOVPWyEFgbpbc4tIte/HPdBhZd++gwbLNcjinJ37N51S4kpqMdxe3ua3pOhKZ8Pbc0v8z9c3HYR1NbnFb2N2tag7JpdHUuzCNX+fsPXYPkdEXXgnRXc6tBdK4ZwZFtDKy8mvX1MN/qdCwRFGEZ/t20tx8Rzgtq11eHbeCHNhhk3TJG5a/atGbfiZu0RWCyfrJLJc+UMY2BrfNMB5vbvKcYc+1aAlpqsQfZRsQ77EfG5ma35gddiRvZyaJgXXEVtNZfG1aY48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brNKtdgr5/RDVTk3kxKzAONwKOFSrLcxc1cvYN3wT7M=;
 b=YyZcqSFfsi8f6zubh1ou0KVFwlNLWy+aR9NjZ/p55qYDLNo0v47xXAFzgm9XCQQVo0ltJ4dVpvaFOmi1uSnp9mqQqoGRXap/acYava9BGvNzelfd00K9WkUbBb7AXTxtHZo40AXWrNoPK5JuBLB2acBnR+hX/9LWYWQMqKhpV/YjPkaO4OJ2R1+vInOd/R0/ryHMwlyjxUEi9thYop5lVkKqLBBeGVb+fp2kTC1ejF/g59rkTp4dkUrMG0cHUvXdDlbTQPFgST1Di9P3ndYssqf1eI+j08wZB/Zeea5DfyvSeR82S61jCpascQW7p3D1CKCYRkW9eVu6uq47RS+Nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brNKtdgr5/RDVTk3kxKzAONwKOFSrLcxc1cvYN3wT7M=;
 b=EhpbrAUb+VZZ2nhhadtVrEo0+tTItDGgeFGANCXfpBns1e4VZDFdJflEtYnPKkOpMDM5eJN48BHBm8nupzsN9gcurB7Ncrkceu2Iu10RuMBsbVTA/pcboOz+o83KjKbQMTCTyLbX2iWN/cPl6dCh+bWFSyV6uV/aRt3MAs3CUqw=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8684.eurprd04.prod.outlook.com (2603:10a6:20b:43f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 08:58:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Fri, 21 Jul 2023
 08:58:46 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Topic: [PATCH v3] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Index: Adm7sY7YALfa08QfDUG/0iqESGxZGA==
Date: Fri, 21 Jul 2023 08:58:46 +0000
Message-ID: <20230721090332.1528569-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8684:EE_
x-ms-office365-filtering-correlation-id: e4cb94b7-a601-404b-d2be-08db89c8b15a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wfd27YR7EDUkP3KJR3eTNzXOAJddIPOgCTSrhcsJ7RpiraAp/HwCP6RnAhFgS8DwWQqFzZwjQpMWlmBw92mVFD871tjvgIeMVov5SekQ85kymMPrI2iS1QZnPsY7UU4TZFxQ39gpDwciFKzWYR7xiqyajo4Yz9Gp1cBuArxLEqEUZkxZIOG/Vyx/ryxLSvohlqmfFiHa9Dc8lnnnGm+fWrwjh8iHumdOCBYLQoB6j2ctWFpYFH42V9xCUY295PUqrzv38VMmgphVfiJXoWftEtTAXdKCDnTClf+Php4Qy7EbgD8pcb/TNeMVezmNRIyE+o9X+t705PYz+OCGUh7a0uCD+A9Ffo+M7wtROgm32/KVC3KLflmAb+k8ebTJeeTif4tVbGMfGbXP2Q0oJw4X17nalewqp03/Bk3RnrJ7qxVTFDlbAQ+9gxfWeKh0/vJNGpnvmVONTJgGYtnjYgem2+Fk8e8CMMYvddo1/A6+e6oDdKEUJiSapt1yd0vXS7OkxnYfC4Tr5t2W2bQfRFfNgkokHrsy7zWGtedpuHEw+jQGVw126c0RDvcRTUZ4U4YzMb0EGM5KVWdxsuKE90hfOcbqwgB/7AjKUzNLgVbcN7q5Z2HJ2kBPL5bzwPS4MZDl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(6506007)(1076003)(186003)(26005)(7416002)(8936002)(8676002)(5660300002)(41300700001)(86362001)(2906002)(36756003)(110136005)(478600001)(4326008)(54906003)(316002)(66446008)(66476007)(66556008)(64756008)(66946007)(38350700002)(38100700002)(71200400001)(52116002)(6486002)(6512007)(83380400001)(2616005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zZZq2XhEqnN37IEGt7BAOD3uaX+0u1ftcoChmiFAUYlaky6dGMuxbtJlEr?=
 =?iso-8859-1?Q?oZ+ztG5x/456xcUTwUNkvKjr3KWG6kaPlY2uojwTespyUtENtX3ltI3nhc?=
 =?iso-8859-1?Q?vR/ka25mr1EKmD0BXDXjCnzwcg5bx2jX6j8Un3aXG/nSDYMB+R1v0RRgCY?=
 =?iso-8859-1?Q?VYq8ajKEmfT2soSidmNiBpGikH/W4/A3/6Vbe/U/+fADfjBzmnoGFy+CNF?=
 =?iso-8859-1?Q?Xmu70CkHSh7hMwEgcPXb4nh/TjxCIFi8VaBmiyPUNF8QNWa1Sf7GFqGq21?=
 =?iso-8859-1?Q?jYhbN931UPUFXSWrdAUD9lLR4ivUKZNiHK1XrPZUFHx3OOMZUIE/FhqU2k?=
 =?iso-8859-1?Q?kjm2eP/QTPeJjmFQe2cm53eahMAALG03WFeUMcFZL5Cncomk9c1j4/8tjJ?=
 =?iso-8859-1?Q?BVDNKTFTxjJ7ykJEFQZAicdsxWdRNaUxANSZNjJfXVFXNZhYFIpSPKm7dq?=
 =?iso-8859-1?Q?rkROv0A+X6C59R6OH5pUmBvB1FYvx3Ggd19kqsnHQdJGkYaJbDYbwH2X55?=
 =?iso-8859-1?Q?uGxDF+w1KmXSb03RRS7CBXHybAQceNJOyDVgM7RQFzXZb0nUrFLNLDBp1u?=
 =?iso-8859-1?Q?CiFXixMc9SsR8EMp7Fbx560ZPhpIbd+JD2NgrEpFmaFQxu37NX699+lGaF?=
 =?iso-8859-1?Q?jOYXtHZ3oAQ7hq34+O7yp5jt1whQp8EDHbsItL6vavv0/0bSKpFTVLcP6x?=
 =?iso-8859-1?Q?dH6ayIJaXK6dw1cs5OkM6Q0GHjiYcz3woDvaV6BGBBn8ZbMSbPDglSYCbF?=
 =?iso-8859-1?Q?N8z0JqKAXOt5HHoqnOK1gb8uxPHXOpP0haTZIjArIP8QdGipH7d5gvjVh+?=
 =?iso-8859-1?Q?+93CGEZlGv/LNHheW1WA3xCGWOIWf6vmUbdI/K9l+6cgM/9PollwzT8mJw?=
 =?iso-8859-1?Q?62zVM7xE0+9ZohVdBR1nkuCmAyjW2wiQ8joAQS1u/Rd9lbbGHDeWCUBurQ?=
 =?iso-8859-1?Q?B2gGNsEHlDX9zoCNe+1CG0E78qzccShpgVZOxvW5xk36W2cTpz59t0vgTv?=
 =?iso-8859-1?Q?6V45OBc08zk4j6OniHK/ICOHAFUZTnCBAZhtJGG3ZbYUDUY212Ng9YWcO5?=
 =?iso-8859-1?Q?Ld+kkiJYc2r6YnfCMf3JpEF7dflsa36Ck6QzfpHGWASEPtWeTxm+vGOsIO?=
 =?iso-8859-1?Q?jfKGt3ignfGZMKdXqdRd6RnfTEhxrnCQtjQDX+RJqjwM3PuaC8PWjmigOL?=
 =?iso-8859-1?Q?jcpuKQ1Y0tYvenBvHxKLXDRI/lxFgrCTpwrXx1UnpGakY7WhZTDB1z8TeB?=
 =?iso-8859-1?Q?lnkNnXX1P2FaXmx10rofSWU2RnjgONwsLnwa6LVNwNBlbESZXXJISMtCsm?=
 =?iso-8859-1?Q?1Po9UGMXaIusVG52PP49Hw3RKG/EmeibRNvMKr61UgiW6HvA4DiH9dyY7Q?=
 =?iso-8859-1?Q?Intl2FTt3WbRuaVUhQ7x5ZrL1HYSyhiI0Ijdw2I+fTC2X/5knQHVS85mO5?=
 =?iso-8859-1?Q?YfhKpBdj3rjNRXWNJo7bHVvGNpvJ1RTBURhzd389Yw4GqeLK8hruX1M04r?=
 =?iso-8859-1?Q?dUMV2jPaaXjvEvt33hjuTIO/KEYoAC/kpUrferDuVzUlON/Ihd4I68y1V+?=
 =?iso-8859-1?Q?aW6zZ4OKcw4aSr5b1h79hMqGoSTWmYVyX4QZhgAjajYr9dmpG/ZwazIvM3?=
 =?iso-8859-1?Q?GDEqfb+N3BJ7NXw0sEWMAz4KrJng8C66pH?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cb94b7-a601-404b-d2be-08db89c8b15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 08:58:46.5013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /O1Hft2yG93Glg7qgoBFIdKrhBibK/kA+4EHwPa6fm6+bYHVddlyIymw8k7mz9x71Rycs61D5w3IkKFjVwJuSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684
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

Fixes: 706dc68102bc ("backlight: gpio: Explicitly set the direction of the =
GPIO")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Add Fixes tag. (Daniel)

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

