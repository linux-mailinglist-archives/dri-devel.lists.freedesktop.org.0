Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AB8669BC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 06:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964510EE79;
	Mon, 26 Feb 2024 05:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HV6G5JCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38610EE79
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 05:51:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg79lbhWrmuJ7h+eVk4II9VpuiyDYx1Y3Jii3mOxEmmqz03qKrMZ4l33/jZhq/VxUrpdpnuHNlrK4fr+4YsOgYwAub6YH5YQXbM7gRrKei5ZCF844WE5OKJQIvdcRC6Cm13XiFzvPriS8hUI5OFj+huIX4v7p/qfqQCXmeFrr4zBz1akOaJw57H3kD7wjqKipPZ4y4HfLtFA2mWJJ5h2gDA/Ils/2WyjUu8IYcRUduhQOa/Ri+JYjhcj1cRN4DyBnp5gPoSD0EQOrCWrhM8yFVVPan4VaKVGBYvf4iwAzAynIT36T5+h2ZSsM4ysco3H1MsX3YnC2fermBKwg/C6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS2mrtigfjBWYmqh9y4Jh4maflj/0cOdx9GUnqR2axM=;
 b=eQ413uhTw7yakVQH+pseFGjl/Sru0byPbE9WF3qXGyWMQ4woby3Lbfrl8Wh/lUV4+qaAGA/2wm1YotmnQp6mNfffns86wKXhZ/X2dzasgbIN4yiodq9Zp81NsGioELJQXPejTNZxbpvGG+U/SESfBACgLXdlTqpu+UbByF+Miohz+LSL6VALeJWi1930l6+tfZz9700skCAfTKlOHHCBWwGZ9yfgPCKTaPdwJND+a1Roz2vku02GLiTZU03n3xU0RuPvHxkpxmPe00e5lTWGoDaU7kAVQrDI4p1w9Xy7hcBUdFUUWWtfqaYdIbTfpTs9uK+UiPNcGEJBsAjhivqLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS2mrtigfjBWYmqh9y4Jh4maflj/0cOdx9GUnqR2axM=;
 b=HV6G5JCmhGOilopg6F41/GElfKN5QwE1kBGEAeWePe7YYBhH62A+mweAaUYHZnLcuwaQuDPOEECPT/HTHF0T5LsmqPrBFE7KcfkVq22BUlJllVrtRkW+h4BH1+JE2VTPleitM4SM8oXWQyKv4QCDCtCwK/3yHaeOxrG4RyAKFAI=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB7022.eurprd04.prod.outlook.com (2603:10a6:800:126::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 05:51:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6ab4:485b:3d5e:e0e6]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6ab4:485b:3d5e:e0e6%7]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 05:51:18 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] drm/lcdif: Do not disable clock on already suspended
 hardware
Thread-Topic: [PATCH] drm/lcdif: Do not disable clock on already suspended
 hardware
Thread-Index: AQHaSj2yVx/aZJ7J3kOoLRlw6i7S7bEcWM4A
Date: Mon, 26 Feb 2024 05:51:17 +0000
Message-ID: <AM7PR04MB7046963D28377F9EC6CF951B985A2@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20240118183924.144221-1-marex@denx.de>
In-Reply-To: <20240118183924.144221-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|VI1PR04MB7022:EE_
x-ms-office365-filtering-correlation-id: e356a710-9ebf-4a01-d8fc-08dc368ef39b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z69IruPL7/D8sjrNnw9pT+eTpVs4yJHgD0I4PfVZk0OJWpv7bJh+xzncQBQRWHATRx4BI7PfTgKqEA41JrjlMSqZUzYh/KbduZP4xvPddklPGxjC1jZKmb1BQXeT8L66/DstiDzL+RsXKRv1MuVVXadr0bq+ZkGwTvqMCKCUaPtSWEAr/G+QCXXHwrSC36hPzKO4vCCK6TI1tmjq3L82LINVEv1jpAaSVIokk/4a+x2o8Zp2H4EEIz3djDaTHzlX6xeDx23b84Zgpy3+y+JzCYAqgkowKyOCNfQFDZHesBkmG3nSpcdhaTilY0jabTe7C4GzdqAFBoKfARBes0zZqz9l6FeT2/DKcs1G04rb7gsX9VHKVOwa3tGVFxNtGzJ8YOgrpXAwYnNL9Mmyg8wbIcSGYtnZfMNHKiDHQWkFktMqvhu8PImuyiqQ08flDsER763bX8Gp+6w+BHIA4ZtrkMI0PealXOZJv60ElUwpN3cSmfud7SJ6nHMNtnPSMWJl7J0kUvH72VprhnGyh4bCUphfGTd0RZlYlj348QwE1aN7qNsXa39MGc1a/8fj3r3ZDca/ljHh9TgaZBatRG4wZJpSrz1otKBbKp4F5MALQOTMmUmgUIIIZI2SzIWQK8in8yP3Pf2C6RD5y2lJMWeJGlrO/PuLgGOQLOeSHWFAWVgg36GCNWY1vtiuamxIs2mspzMoYuQcl8ZAMNlA/6ExehPdyC8720lNGhXNYy/voVg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Im8f2TFThPqKDKgghcXQJ3DuZWIq9dsPogOVxe9x4ckrxmdQIZJKJ7YvI9g?=
 =?us-ascii?Q?81VAYY40wG5FHjvokb+xgmc6MJ32aHUIhqQrIPfWAGxkXhSKtGsi/xuxxWqL?=
 =?us-ascii?Q?wweGMlxAicHm7xcSwXE+AFXvkc7+vDbOh6w9vskyK9UOidKGgOPYrBBj8VwO?=
 =?us-ascii?Q?g2rf5qZKXfON0jySwxAk3t2xP72ovj2KLJZKVEH3gBxjQe/rzD2SRqbFQxIY?=
 =?us-ascii?Q?uAoiM+qIEKYjfLeGnvWXFvMamVG3LJPhlW6QuLXV1AqbgYCE8kwM6xG6RVHX?=
 =?us-ascii?Q?eHu/l6jHFKs93qiDrbSvqZcIjQV/kIFgSe46IrybTy8fM34tvc7AWNFhf5BX?=
 =?us-ascii?Q?7Hnwxvhx76PAQqIiO2cJI37aYPPpuDgRqZspYFSrKYQp6qN7WMpfkA8fKxA4?=
 =?us-ascii?Q?O4pzsWw4IYrlQaM8BQKwT7zJoTXm+dbDvEcg/HelmO1TLWUfHHUN2g29CeGo?=
 =?us-ascii?Q?Um73Y5V/X14vu1VH1rhk995ugrCx+vH3k/596rE6p2lUd7mfoRJz4NkOex9W?=
 =?us-ascii?Q?Wz5jdJulumOVX3qmklc8C7Ays2rZtM4AobmbAsM2VuTaMi+wMh66D1KywFzx?=
 =?us-ascii?Q?5XR3v0290rdaxHCiZ9uywGE4b96oaJAwwj2fKG9z7YDfXa78FXgRhT344YTA?=
 =?us-ascii?Q?7MqLzWtfHntQMlit0pucao6BWgA4UkC5yZDqzBX+aymDI/8QaLNqHfV2Fq1T?=
 =?us-ascii?Q?psoysHTRuq/9H0vuE9QeU60xc/G7+wCIGwUuEq7vhlrb9mDXnVHBVY8nfiiK?=
 =?us-ascii?Q?Ry9rfEM2AKlouVzdyTdafHH62idEyY9yq0F2/W1XpbOaGkHCcyo/GDjqWSvZ?=
 =?us-ascii?Q?C87ZbWGOldgwkMOmDb4g8cawqc04fAq+Rr2d4CoHDYO7HH0nUqDpq1wBl2lz?=
 =?us-ascii?Q?YqigJrLKNjEuddKBPnkgjgH4d1xrDwdLqIAmWs2gb+9Tnz5reMX67pYV+joO?=
 =?us-ascii?Q?ARnPAl1qToM83iyXvtG4TEyLHBxg+FJ6F9Mhc2bB6vrCOagLX2znXkNWXKrV?=
 =?us-ascii?Q?4RMgkCE8xodkzaNKQsRowuxcrmOqrggyUtRh7xsqBi+9j5p3OYfy1MdBLP+j?=
 =?us-ascii?Q?cxzeemx0CokOpzpQwZ+hE2elRHETlr8eN8U0+GR/dVSo7KhgWCtlZaC0z7X6?=
 =?us-ascii?Q?WbxBr090bZa+KxV4GtFgkK1vOK02+cmuJ6l9om6XPyFuqmZDoDu9PdX0DZYh?=
 =?us-ascii?Q?ScXQi3VcSgKpl+BYFltkjrH1Pw1HJdNf7g5NEbQPlgxPAl9ULGertnihyt57?=
 =?us-ascii?Q?ZkJGNSiAtCQX5HkX5+8ve/6yB7ltotz4i/qTMX2n5Y171UrSaeQ8RDPibUwm?=
 =?us-ascii?Q?+qn9meTs+5frw9wiw6y5I3UKYLKA+ZnYVyT/a9+88WLCotMwh8SQEKbo8Q39?=
 =?us-ascii?Q?6abUHWId+NOGhXe6/X8GzCISuUCN8QgId+ss8w3WifWZb8Br+MAZgmmp1WYZ?=
 =?us-ascii?Q?U53PI+/rCLnUDIRcxnLjSKDbomGO5aVsITSy5Pmhdk3qN18xWrmcYLH6nI+z?=
 =?us-ascii?Q?W0qFy8+j2WaLJanYlcLkHUXkZlmJxrXvQ0lddxuz4Z1NthpLP+xZWnI8TZig?=
 =?us-ascii?Q?igIfs/0bvB8wyITOlvo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e356a710-9ebf-4a01-d8fc-08dc368ef39b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 05:51:17.9722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8plAN1yoypWMUDpck31wIUPRYmcDRjkrUqPbED4ZAFUfCbv2CYxamMQ6ZpIzxkiA4IniwNKaWkx0mUu3LAxkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7022
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, January 19, 2024 2:39 AM, Marek Vasut <marex@denx.de> wrote:
> In case the LCDIF is enabled in DT but unused, the clock used by the

Nit: s/clock/clocks/

> LCDIF are not enabled. Those clock may even have a use count of 0 in

Ditto.

> case there are no other users of those clock. This can happen e.g. in

Ditto.

> case the LCDIF drives HDMI bridge which has no panel plugged into the
> HDMI connector.
>=20
> Do not attempt to disable clock in the suspend callback and re-enable
> clock in the resume callback unless the LCDIF is enabled and was in
> use before the system entered suspend, otherwise the driver might end
> up trying to disable clock which are already disabled with use count

Ditto.

With the nitpicks addressed:
Reviewed-by: Liu Ying <victor.liu@nxp.com>

Regards,
Liu Ying

> 0, and would trigger a warning from clock core about this condition.
>=20
> Note that the lcdif_rpm_suspend() and lcdif_rpm_resume() functions
> internally perform the clock disable and enable operations and act
> as runtime PM hooks too.
>=20
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index ea10bf81582e9..0f895b8a99d62 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -343,6 +343,9 @@ static int __maybe_unused lcdif_suspend(struct
> device *dev)
>  	if (ret)
>  		return ret;
>=20
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
>  	return lcdif_rpm_suspend(dev);
>  }
>=20
> @@ -350,7 +353,8 @@ static int __maybe_unused lcdif_resume(struct
> device *dev)
>  {
>  	struct drm_device *drm =3D dev_get_drvdata(dev);
>=20
> -	lcdif_rpm_resume(dev);
> +	if (!pm_runtime_suspended(dev))
> +		lcdif_rpm_resume(dev);
>=20
>  	return drm_mode_config_helper_resume(drm);
>  }
> --
> 2.43.0

