Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FEC75C30C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 11:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4A510E63D;
	Fri, 21 Jul 2023 09:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2939E10E63D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 09:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KInPFhvR99mj+41BEW/urRa6Wmx35rwYb2pi40nqX64m+nYLEmwIZtxGrXI2YQ6sTDVN8D7c4ydfmQ3l9LPiPvki4z1HRXeHsFGrHVXMjBRQ7phBjgYbDqroLj2DnAEpBFwbrLQ/RZXNdoabTRQUpUIhJ3pNsqaMQERekMVAtFzu7VSEQnXOIYezJMD/reICtPar7tTf5CEw4OzLDAv7UdpJIjgZthCgFZwmCRzDfbxs8qXVqYzw4uO0bdC+N4l49upj52ZHCWfd/FIJvg0R+q4ChaxwZlzl0qLy4w/wTiGbkcnQW4F8VWAp9EPKqFyr803OvASniHNYRoO2AWV98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u82CGcEKOLENHGQR12gi3yhE30P65VMkTWUyQlisuH4=;
 b=WkvtufiC0al3j0wy0tk10s4062VAa3s/0dRbFYaGv2YKSfVTiCxRF/tN6iqYXbRz14MYwSka4SCxkJ2r1rR0VPQkY4pLVDGz0g1Bbfq1qabxlZO7Rjqborn6NiZbmBPCNGSezoLQYbfbq2Ih5Mw6ElP2M4NS+dk+G1ye0CpLq8AMCMpAazXeFyNadfKYa8Ypf7hn9/J8jV80ADpgI+mE4w/Ltwdqc5Sqb/8+mPBPUdPmlr2VpiIWSxPgft2ECOc9qwlKd1z3+QwmyvQ1g6u4BUjy/veBM8GwmZY8MB9rKS9dcKJYHM0exfu+TYG3i4qaMv5ARApjGs1GknRKLLn4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u82CGcEKOLENHGQR12gi3yhE30P65VMkTWUyQlisuH4=;
 b=cpBuwZRu7UBr0JSc3J2yYm4c07e6ACvM7pzw5vXBuTmin4TpFhOJFEntkubNVF6WxYQII+s6uT7j+6r41OQd1RZob+V44PNZnSOAPPdevEHB4Qk4njNJaZVWzDRfpHqUxuibHZjQ/FyPLrpLUp1fQm3MsQTX9YDSfXLl6zNFNAE=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9913.eurprd04.prod.outlook.com (2603:10a6:10:4c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 09:29:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Fri, 21 Jul 2023
 09:29:03 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] backlight: gpio_backlight: Drop output GPIO direction
 check for initial power state
Thread-Topic: [PATCH v4] backlight: gpio_backlight: Drop output GPIO direction
 check for initial power state
Thread-Index: Adm7tcocHnotirQkKUSANe2HiNXlhw==
Date: Fri, 21 Jul 2023 09:29:03 +0000
Message-ID: <20230721093342.1532531-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:3:17::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB9PR04MB9913:EE_
x-ms-office365-filtering-correlation-id: f140bde6-7aa0-4b07-033d-08db89ccec9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JVwrT/qzocuvjMTgznUVPKcWOq/I0mVGixVOaSTdqOJuhuRmXq4mMiT5yc/sexzkVrdCSp5aru6ib9ra3mili03PHQ5jLquyA3cTC98TL9MDMJcah74XFzbzESwWawZ/HztZ+t6mvgVnqo0iCK4eK0Krf8D9omLbH8NXKym0TwinfSR1jshcLf58TTrrM1roqN2hkeOlZLmd4aliwFSUDpdONz203pRieZrIQ6vMPwkEuRKNMTaQRQscM9pB83uZ9ridjQZRFyiEWLIR22xq78IhyS7aNh+1pILZNUrVOWl2cNU0t7MMPi6tknkYTluQjXuZEAdKNYD0h0LMcqdCdJ8NCmDiHhH2iEQiwoSM8QC2WVLgB5MYOIqQLtUaoEnRqWDCfl9Q6MsG+/xBtUeWtsF4BhpbOY4fC1xhvlKE/e5Vnba+uX48hnIUmOhY6ZDSa2a6U5b1+X2a12lx2d7fCNTbSnMHwZWAQXbcBhoOstxiIwuYxQP8kkgY+WnZEqws1I76FwyzP0HES9bHFOcYWdop7CqFzsMplaaFEujNEFwH+D6MsE/A5Rm92HRPKsGNvLgBFo5il9uLV4ubIjGwZ/VZ7uho1+OvIDFgOEEMg/ZLBeeRemhhh0CDKsDgtgQA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(71200400001)(54906003)(478600001)(6512007)(6486002)(52116002)(110136005)(186003)(2906002)(6506007)(4326008)(26005)(1076003)(7416002)(8936002)(64756008)(5660300002)(66446008)(8676002)(66946007)(66476007)(66556008)(122000001)(38350700002)(38100700002)(316002)(41300700001)(36756003)(83380400001)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ve0rljVe9ah7VMkBaUNXJ69I9CldkIjBWZGlI8XenYctkjEHkDqU1d0hnW?=
 =?iso-8859-1?Q?xitTUL58IKSJoj9+l6BntGaMTxU6l5e9Ti79eDAHV4GgoOcHFIxXn5YGgf?=
 =?iso-8859-1?Q?7Sk8/FF+55Iialoz5flA8EGKj+oBrY1D8vE3l0lbl/nHSRxzQq6eTTfY3o?=
 =?iso-8859-1?Q?QkcarP9ZKurQOWg5Kz+bY60FPU5wiNNBgZg4I65VS+ZGe1GGY3A4QwfPNn?=
 =?iso-8859-1?Q?iReweLPbclaMGR9hWgd24qf92Fdbo4Kw0Dwy61lAeLh5m3QK15hizRjsZG?=
 =?iso-8859-1?Q?plr81m+nZIz8A4jgi805J4+7Bum6AbVW8lzrPqNHoGFNx4oL1Vjo+8zxbB?=
 =?iso-8859-1?Q?t1A1qDCkrR25FYazh96MdCl0V+KhLhhCf72NPngJOPK81R7fmtezkG6cIO?=
 =?iso-8859-1?Q?QxxacWkncxZcAPqKcPaeuKxzM08EuSRvm91T2NE0rGHV/5XZBOhiBIV9kG?=
 =?iso-8859-1?Q?eZiBmum2hRMo9juB20MPCy5vLB1yEyamJUO6BYUg79H8Tb55d+CZMjcdYK?=
 =?iso-8859-1?Q?AannJPmn32PqK7f3i9chCfqHHHFYe3lpRM2RcNzoAxkZSGn3l7j2jn6U92?=
 =?iso-8859-1?Q?n/OnHye6MzQ2RdU6eJEDV2F1oKcMmYGcQ/GBXrHKg929IN2bI11zmNkDFa?=
 =?iso-8859-1?Q?ZRUbNPufJc1HWN4BxBXUbRakfFjHFUjQu9SmIwpAVlBTXTC6jbBv6/X3hN?=
 =?iso-8859-1?Q?GIJEUNzYzRfrq8RKb3puaKiTQafhyl7FV1kFZ2lg+TloXFonXJwadyrLOK?=
 =?iso-8859-1?Q?yX2Swp5UJFeohT0qXwklg6sqkh4I0smGDgLru2IY7SjueORIrgVdVAiqsj?=
 =?iso-8859-1?Q?/XJkNPGFmhgZtk3VfQq3Rhka316VU6sUMARXt6LBRLIWhJf+HLAC2O6u7d?=
 =?iso-8859-1?Q?tQ1flV9KPkKqopH+KefvL4TgnTq55q0eqPOUfITvAqqbY+Nu/i1ZzShrgE?=
 =?iso-8859-1?Q?XAn47J5NDdIDS8/1qiVInrMEoOD/YOxqqlFNZW4iJoZ9+sEnD+eoCbH+JX?=
 =?iso-8859-1?Q?zZnY+9NelA+9ac8KqCp2u9FGhR2tFx/n1mkZObP5QRGJr9MGOwGeNvS0RO?=
 =?iso-8859-1?Q?clYcVP3d1Q3Wt6KTj9EE0td5kAJfkknO9tkaIDA4JwhcZj7Ue/7r75GxLT?=
 =?iso-8859-1?Q?J5Nn4jmizafYQ3zRsC6p9+YpUw79moYfEexDiyPb6MMmBUtYtNg/6Qn48N?=
 =?iso-8859-1?Q?bDac57O3TtaUh7EggJdey5kyJQn+r1AbHgN4qz0zlYnGK/mfq/XszFlYgQ?=
 =?iso-8859-1?Q?qJBmR6d0/Dy9Wb2HCW+WRoPIy9ZRwIoWNlMJe7CwCObllKVfIxHDlwyeqY?=
 =?iso-8859-1?Q?wYl0nnS8GSo/L4gXAsnKORtpetmDUFRTD/nnkatqCZ3OZn0HjVvHy53qQz?=
 =?iso-8859-1?Q?YlvMgGA+06XlOlj0RhfckXah6Zc9/nuOcrvfVnY31EavIHwH0xy3mwVv5u?=
 =?iso-8859-1?Q?UwV7Y4P2yd9FMFVJiY8usuR5BGA7GNKQCcWY4DjwUxd4fqlaH2Kh+EYK2K?=
 =?iso-8859-1?Q?gIEZ6G5mfF7MrXrbFzsuYBhwL7cniEh2AkRKEfMQnp7jKSmXbuxYrSTmj8?=
 =?iso-8859-1?Q?pAoZ7xzlDO6VEbEaxbbqmyz8NtIQ79kAaPpwSi/9Puk4OnrPWih/D/26Fi?=
 =?iso-8859-1?Q?WLy2A5EV4/zWzCA3eIJRmCds1CfsCr7NGV?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f140bde6-7aa0-4b07-033d-08db89ccec9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 09:29:03.8931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rxlq5poUZSqFDaIec/zOaXvK0aC3/tPvRr4E2mgCQiXjXENfRbkcnTWyYWJOPbHrbSCrsiNdB5C41msK6atX0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9913
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

If GPIO pin is in input state but backlight is currently off due to
default pull downs, then initial power state is set to FB_BLANK_UNBLANK
in DT boot mode with phandle link and the backlight is effectively
turned on in gpio_backlight_probe(), which is undesirable according to
patch description of commit ec665b756e6f ("backlight: gpio-backlight:
Correct initial power state handling").

Quote:
---8<---
If in DT boot we have phandle link then leave the GPIO in a state which the
bootloader left it and let the user of the backlight to configure it furthe=
r.
---8<---

So, let's drop output GPIO direction check and only check GPIO value to set
the initial power state.

Fixes: 706dc68102bc ("backlight: gpio: Explicitly set the direction of the =
GPIO")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Capitalize words 'gpio' in patch description. (Andy)
* Capitalize word 'gpio' in patch title.
* Quote appropriately in patch description. (Andy)

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

