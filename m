Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E175A5FF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 08:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0873E10E55A;
	Thu, 20 Jul 2023 06:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2067.outbound.protection.outlook.com [40.107.6.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C468E10E55A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvlDqWXBPZNfgrNgVZbt3ZSbpTk9BQoY5sc+w/nwftCmyo7HHhZGUA+SnZRQhHxj20FpzqusqeuNWrrys0u66ZdjpA0gI+Ii7wwVPQTyxl80+IppTQTA+aMZmBWPfLgB99ZcpN7571K8S1/GDPo7+wu6sLYcp5D/Zke7axdoqonNeV+0gJph+Ld+DjrEXc+UNkJWBurA7KydTOLuP0TnfCc4MfZIzdA3Jlk8qVGMFX4q/ISgY4s/9p9jz7cvxty8A0nxZKKwkxJeiV+NOY/HbnLVYZgpkbY08VN3poIQJ/qWbmk44j/u5X/JvgcraiznDDQE/3wDXhwlfNPPUrHF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHJPWdL78sSkoFuC/6QHVME2DCCrM0TbAMUbGDrwSPA=;
 b=aPQdqbNCBgP4oOH69CW4kjy+0gRTGXfmKckAY3fB5xH31WWllAzsZLHoK1vLMLT5JAvIQsbP99jBaNDaPFkOk7jDFYDAYOmuIDeoiFHsq1uvZ2GbRB+BK1XcY/k46HfL54gZ0aK3O+3oBUNsZV2eNqC77WHfTrd2L+UPDxlrQd1DlIsEiajxMGP0GCNoGf8jMahAvgQmon1jJ0aCYVSeSwJS09EVXY43LUDRq9WYnQLmd5T+EBNX4Xhzq9/WsGgCcq9IxCWPOn2BX5PbaO6i9C1Smbp7xNRb1yFMukfOavWz5tXN9TTzCJ2NAAxKauQ2WAscWqjTvzb1pe5bOlA5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHJPWdL78sSkoFuC/6QHVME2DCCrM0TbAMUbGDrwSPA=;
 b=HhUtO1VG/00jBrE2ZmlkV8cM0pKPyaOXkpzFwenZw9kaho3BjqVkLlIUxl48lw50gvoVB4XbMYe68B4RLglXyT/Qur9y+8e5cgFA541mTUrRL5FsBU9EGVJWXbLlsp60Ghi+0AeAokcM/HedqvcltwHCDJBqEQPOHgdsR07ITwM=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7923.eurprd04.prod.outlook.com (2603:10a6:20b:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 06:06:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 06:06:27 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] backlight: gpio_backlight: Drop output gpio direction check
 for initial power state
Thread-Topic: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Index: Adm60FHbZeccRsgE2UutMj3nHgFTFQ==
Date: Thu, 20 Jul 2023 06:06:27 +0000
Message-ID: <20230720061105.154821-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM8PR04MB7923:EE_
x-ms-office365-filtering-correlation-id: baa8725a-638e-4f07-15f1-08db88e7745d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nb0lXK+fGls430LWnWkfI5wr6kDq0JX5bFYRL9uIN4KFzOYZJ3TCFCjGLSpOq6c70kznkBtwV6pH4cbkk76rcicXsSEpi+CsXJ+Yp9tooVZFK8Rrs+2YHzy4Lo0iFE107lfAfNuI4SzsnpgXP3igwjG3lLX4nua+mdpzG5DkJD+eZJKBteKqZ48REVXdOxk/vHYJYVHMKDafUbgz9+xAlxfA8SuJ5hNLjV+wHmkYV3XH+emRZbfa4igtirXeGNFZn3BkwP3mocAHVFTrlS1S8Np0Mam77aNa5K0Z0Aen23gOK5Rrjwhx3pox7JSWNaqSC3G/RvgGbgcPC2Sy4Th95+IPBCx8GlhcTHnRB6N6BOxhkEh4TcEb/KkQOxqVmxWNJSFZG3Z2TIDTvAiOeel/Dt9b/7yqZhE0awmhNMPlFfBVNlVbnRYREswia4MINJIe67rYyQzZupdu/ti6jY3XfwmFYe6VNYOKfk2Ux8xWxSdrzHq5nK3K87zZMoOJ8J3lsqiR154rrNyyXyAgX6fkmbzqIThqa6RxXz0LoaujQGaT2EpcloHYVLs14Hh/PvG/Mg+FF0ef6XYfZux2us4R/DIxyK11ndnpWSwmvSskgZUDITsLp/DIFXqo8qQ/STB5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(186003)(2616005)(71200400001)(83380400001)(26005)(1076003)(6512007)(6506007)(2906002)(64756008)(41300700001)(66946007)(316002)(66556008)(66446008)(66476007)(4326008)(5660300002)(8676002)(8936002)(478600001)(6486002)(54906003)(52116002)(110136005)(38350700002)(122000001)(36756003)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?F+kezKhQvfjE7O7PoVgx2n/HvE+EKRU3/fOUojW7HSSmPBi3fyJn83zM92?=
 =?iso-8859-1?Q?l0+Il9BWRsgV+8zzBq0Q3HJaI+FMpxZZlVHKuf0xcFFwm09daPdJJN487J?=
 =?iso-8859-1?Q?IDnNTDAcGwCMXjGrNciA8FWDhwkeN/pudcxQGW4AECd7xHL/0eAENNbavi?=
 =?iso-8859-1?Q?HFX4rvvmhj/+q3rjbi9Q91jP9jJQeZdHa6CPe5j2O7jPshUo1VlsNHFH5g?=
 =?iso-8859-1?Q?AmDEoQiV7eT7IRj4kCZyICRQHNlY/bvZEw80myOc3c5fUxaiacT3bqdoRo?=
 =?iso-8859-1?Q?C+Yn5CSqmO98YPQRoQ8V9ZOLOq2XtbDpZ79CtUJ9ym52QGkmxZHjCEnkEA?=
 =?iso-8859-1?Q?rzArM1wVV+WcHe44SF9hZKqhcJyzpRETVOo5m60dbmnPRgXgDtcZRUDFXK?=
 =?iso-8859-1?Q?G3GMywdje7JZvJDEmx1MnNw6lYxTXCN9JNS7cVEALSMwAF6W/zEtvWMzwg?=
 =?iso-8859-1?Q?PM9AVUmhzWmffgPiTyVGQxINFR6Dlk6XpRMQqCaydWDq7Vsarw/lfxHysG?=
 =?iso-8859-1?Q?qV5ITwvKxCX+TnzUAhmcejMfcsp5byg5XbGxAd/xz9iuW0M0oNvnezjRoJ?=
 =?iso-8859-1?Q?bnlkgxqD3OCrPnaU9xdBUr/S1Sef8YCSe8Spkac9coyfEfF4/97TwCLClS?=
 =?iso-8859-1?Q?vCCH5SNQcfNSoDkGqQU31HPfU6miRD8cW3UGntInXtyO8+F4EyE9aICl42?=
 =?iso-8859-1?Q?lOfahJPbG9rnPqFT8Xih6SAZ2DUC+OoUoLsZ1lexNYkFEhA6PVfGEn1jw3?=
 =?iso-8859-1?Q?ay5CSS1+ddEtC/4sZRfvYHffFMgKrwM0FJRLvhtdgxCs/3lJJlU4Cy9aly?=
 =?iso-8859-1?Q?U02whpZpPo1XvaLgPxaHgsNoKXjgGVsf14gQayMkDlLgdMNFWP46YWufZp?=
 =?iso-8859-1?Q?rR0fZBc25+SPMAJWf2DvpdsL1UbTCnBhLHSK98hxE0rQGEW0ewqIAUU8tG?=
 =?iso-8859-1?Q?xmvGykq5BEpM2wCymsoQahBXjWEks82X8u81a43m03q+kKDkpJL6J0+nUV?=
 =?iso-8859-1?Q?C9NX0uhy+aqA5OWPsN3S6RTI8awq/WqjJ6Jnfr7f2QcFsJWZavjW8Fdowk?=
 =?iso-8859-1?Q?w3WPrted1xwpdgN7ArB3gGvzvU4txzPgHdhro79T6sKWPyvuy/hpWHNkXP?=
 =?iso-8859-1?Q?TnggMJmyM5+oi9sO/wdnoIgCU/D/xczPdUVR6DqGoX9FDttMPeoeaWTUlo?=
 =?iso-8859-1?Q?+j3TO0ijOvzrNSO5t+2b2FguvZNUu+q2LiQDrCV5Bb1RHWQrbSuOjx5aHy?=
 =?iso-8859-1?Q?pS3DtsjSbbsS55qAEdU06ROsZFcPyb11vOOw4Ml9yK1okvEOlshd7vUaSJ?=
 =?iso-8859-1?Q?2aNy2Dfcr24vCuVz9LbLrDz8LMbw2WDIRxL92GUkdrYXgz1VCFiF1gEjEL?=
 =?iso-8859-1?Q?FlQx0BQVNNkObm+SWo4jfiYB8R4gm9yq2Lxem4UHvrvRNOn2s+IpJ2CMhN?=
 =?iso-8859-1?Q?tSz8DWrILWZVyqE86w6qjHVbIIbMt8JJLB9zL83PbPDsAvkQ25GM1p89ax?=
 =?iso-8859-1?Q?9/VyI2POr/aoHThtJom0HFu1tLyixv1oiEwNOyq3wcsHUPSgiD6t02kVgc?=
 =?iso-8859-1?Q?jHr3Ti2sqJapkdSOz+B9u7w6Moy/ShlHSuk2ZWbCDNTahx0l8DpHoOfYbs?=
 =?iso-8859-1?Q?PtYnBDyqRjaaANmIZ+e30cjDLJ9Q4aDBZy?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa8725a-638e-4f07-15f1-08db88e7745d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 06:06:27.4071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThPnhan1QMttfz+cGMSJLzZyL0KUWxHxYHQNPabgS6BLIxQRA8MQ+e5Cn9X5HDNq/J9WoT4ebmdgZQJgk6bkXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7923
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
Cc: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "lee@kernel.org" <lee@kernel.org>, "deller@gmx.de" <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bootloader may leave gpio direction as input and gpio value as logical low.
It hints that initial backlight power state should be FB_BLANK_POWERDOWN
since the gpio value is literally logical low.  So, let's drop output gpio
direction check and only check gpio value to set the initial power state.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/video/backlight/gpio_backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backl=
ight/gpio_backlight.c
index d3bea42407f1..d28c30b2a35d 100644
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

