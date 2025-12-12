Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A12CB8CF9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 13:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30AB10E183;
	Fri, 12 Dec 2025 12:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="VUfu42TI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11021128.outbound.protection.outlook.com [52.101.62.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE9510E183
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHGSjro3osblpQCDjJtBcrft+u+fC22KLJS5NSb6O1wVJGCDvEW7dcrz0iyWKjfqXvx5f2q8DXW6CopHT59wsG5KPReQaNC11sx+00/X59A2c/IaMbKzcZBmeVYmneS4cj04g6i5nKnqCxhuW7AV/SCU3NXRonr9hGTeS98XDTfTMejdRjG8xil+6mlYxEDeEZd7QwPLj7O6m9dXMEL7J+jEbNoPM6sr1DWfI5jcqDArKiSpWSeHoeyFMH188VEle7GDiB2xw2znRf83XgDSdbtoJfnsCMe2CWflaG59cwwJN1udcDIdre4OMy6NBJ9ZBrfwLm6/IGE6ISQ9DBcV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJLGEbNuQq9T1u/tTvPKaW/OAn0jBC75o3FjJEbjl3A=;
 b=LMztrtYpGvmQdtit2/bP+0h4B3+xYshW8iORTXpn0Yz/7Up/phOhcIhkiQ9K57Ayk9btqTE81uCoXKNFv9R/zn5X5D5dlJ/CLJ9mHjKqb2cN1u5vJJLvwPCv6DjyIxJxdL5hg33Hkaid37/kiH6qgUuWAOWFPHIw1RJ/kQ0NzCYSPWrPHvbJgNhb8jciBvNx7dcSEI8cDdvW+NNure4E+IMWKx72drx9chzkgYB1xuS9P/jRrNwXeSW+b4mgSIbOJJCLnVJTBO6qiXekuA7IWJbUTQeIHMZUZeaow7r779qXoiYVNy6QDLnwcQN3oF0Ir6TKyQil9v3lJYrOGV8e4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJLGEbNuQq9T1u/tTvPKaW/OAn0jBC75o3FjJEbjl3A=;
 b=VUfu42TIlld4P6+Y27EBeRqouDD8sZC+7Jq05Dby/sbomsnmursf5ld4E7X69mMbBnT7+qPET8dhkzO0RcJyrTp1X5ulur+RRBve3xyj77RGzch1JapfiyXCFFN2XmJRgLyttvuWDCIkfEoD9S3TblaV0nNpGjgnGdAMG11orJ4=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by LV2PR04MB9833.namprd04.prod.outlook.com (2603:10b6:408:34f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Fri, 12 Dec
 2025 12:39:35 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 12:39:35 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pin-yen Lin
 <treapking@chromium.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Thread-Topic: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Thread-Index: AQHcXrjt6airW14k7Eq2XOw6vcl4hLURgpQAgAXoBbCAApSLAIAECqYw
Date: Fri, 12 Dec 2025 12:39:35 +0000
Message-ID: <BY5PR04MB6739715B26DCF794FBD34993C7AEA@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
 <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
 <7wp25rctnwydxa3zfpbmddgygyxmg5eg5crv4yuo45k6ovvww2@bnvcw3yorqw2>
In-Reply-To: <7wp25rctnwydxa3zfpbmddgygyxmg5eg5crv4yuo45k6ovvww2@bnvcw3yorqw2>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|LV2PR04MB9833:EE_
x-ms-office365-filtering-correlation-id: b0d88c35-885a-418e-7a7e-08de397b81f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QALQjdpdqJ9h8VX/u7or9Mvv5SssPP5XRfKtxHG7Gsfn4DiHcYIcwFdAQrBA?=
 =?us-ascii?Q?x1ePZoCCo+vmK32dooY2hmNFgArrPpx8hQzr50FC2/Mc4S4xM77vCcauscVv?=
 =?us-ascii?Q?0wfuxLZohj8g7JgwdlbnPAYskEAasKbcMiTjbyo+RvcchLrstuBC6+Kh5DaF?=
 =?us-ascii?Q?jzRyuBKUpkmu+zOrRSeA8QxhsEHMRzCjFMo+cyTMzyix4P1fPGx2Dy6CCZSO?=
 =?us-ascii?Q?kxKEYOu3aSQd2aJgSSSfQudmg7TrxnpInT26vESRCg/bp9KxuQrpS0uPErP9?=
 =?us-ascii?Q?zSKZ1FLVmm4WdywW69gF5OBRLA+df5r1YNFwqtN7PAbpuOJdd7Edcmyru9zs?=
 =?us-ascii?Q?EagKFzuK+lPWrio4eFD6zwWZ58MMe8Fsd8bOqSu9MTv558Y1o4T1vv0WquEI?=
 =?us-ascii?Q?u9xPRIidbWhjtrtaON7llGaFc+pOdSEVF74ZKMRWI79E/JYnVGv0lYuq8HGE?=
 =?us-ascii?Q?dtvSgrn7LrO5M6ceianpyy2BX/GqYLPvJFzM8l/EAbYfWL5lnKjLFtbz/lZW?=
 =?us-ascii?Q?KE2Qw4M0fL5YD3hDIJBrIW0gDumNOIOrLKE9bUV2i80PNs/iC5rPiiMxIgrM?=
 =?us-ascii?Q?+50JgT/Dcounvd96Lg3N4uhOKEoHaFrlg+vfrmP1bmbnvC6c8WIj6MmprQHq?=
 =?us-ascii?Q?7bF3EwMniy5zlzyuRuckejGQWlBKX4pnjX9qYQKXE9MqOHTZnYPls9PNl62x?=
 =?us-ascii?Q?09QWDmU5TLEe4An2pmghfzplfwplXPLpRf2aR8ecGZlnvIlXI6qnoh1CMBr2?=
 =?us-ascii?Q?FtmUPbchePGSlYWLDNJP2ipxT4GK1zYcs6SgNj//YBh4HsGcI9L6kdkS/KjM?=
 =?us-ascii?Q?GMnMoGTzmA4zv9XSZMasCHJEhDSsfWiPJgRMt79h9ntacfqAtVFPRhprh3RX?=
 =?us-ascii?Q?QsNitGuNKkE3By/481tV/SwQAEv/xXjWbz2ShYE+PugooUULRGVxfpj7UmFi?=
 =?us-ascii?Q?zFFcDuNKkV8MSoEZw8yg6Np9WBwoap9a2bY2gCKHoFdix9jmOXyB+71HDQBV?=
 =?us-ascii?Q?4jLnG5Zi/bVvD9dFWB69JZLTB4ia0MQWrwNVRxt+gVGD8WlPBwE7GqqqJ828?=
 =?us-ascii?Q?yxelFTM3jT+f0RrEMUXfTCb9uUHfGOiZDXxtOyZCpgulrrmRJ9gXaYqNXt0R?=
 =?us-ascii?Q?CVrU/EGPZn5CI5e2pjdp7bNvgrMmCloT1Z10gfK203eWs79kKg/p8M+THCs5?=
 =?us-ascii?Q?zfA6luZjrYLo9JVJnwoPAsBERLvYYj3luKdoJkaaFFPLf22gvto+3fe986oR?=
 =?us-ascii?Q?V2C4v6/y3O1wTMA2RltFrAOP09HD0G9OO8KquI6LSuY4n0nsbllpL3k460Yk?=
 =?us-ascii?Q?XmSBuvdsfkv+Riv9nhxhZ0Px3loVCFL/bx1Wk4bnnGGCM2gMP2/ZB6iQh5g/?=
 =?us-ascii?Q?Yrkq9EhG+EPlZogPn4ePbxzgz3aX94fTl2GcV38V8ZEjtBQsj0MYBTrwEOsz?=
 =?us-ascii?Q?tL6ZIwtNpPMCwdTkW2beukOsyo+XZMpu8PYrlYmX5lfULM2ZenbnXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ckc94TiQg9VFHlDtzNMmcM3WFzy4JXdzyd1E+OOVdPDYoUUM2/1bTtQjZ931?=
 =?us-ascii?Q?S9l4eKSig2GUc13TnCoxNjfTSbIKHxTy+NtWkIhJ3sf7v95bbbKWeg+3e3tH?=
 =?us-ascii?Q?zwSWWocPru3f/7Vf5FDSc942tDVZLs9nFGIYyBC+AiKs4+WPdyzd2O2ndZO/?=
 =?us-ascii?Q?EgL6JYyyl2ce8NUwpim7gK37yMvYTAZgqQofkyJ++xj0c9OI4cr6MrMy95Cy?=
 =?us-ascii?Q?8Yj1i49zcUzdh4HSI8mbk7o6FFS/6D9KRy/6HpCji/n2IuRhR9gyaRpXw/Js?=
 =?us-ascii?Q?tXnQTpbeanZgVvkGaNvz0KCV5fIELHkZ1BGDrI2uypz6Kc0TyTWOtKanaqS9?=
 =?us-ascii?Q?lZ7domQFzDqUpVaG1fB11QhZMaWlDQPE8dyCfpPLKCmEGvsUiGwN+SJAU2Bw?=
 =?us-ascii?Q?oB3O42xBL8AOoQQXfM/kSSONYYhyQOgdglgnOKf8CtwzKCkoHlcfoMOLgNv8?=
 =?us-ascii?Q?zLsAFMsCthiRYwLuTHVeTb76aufUSKJ1F/IxlboOBm8wblNgXghHqXkT++7M?=
 =?us-ascii?Q?o+3URLzYWPiUT6yrTN1kYUQZyWg0Of2cvK4ZTyygLksYUXErREOb5C9OsrDs?=
 =?us-ascii?Q?sHOl6TtHYFVjDUk66jPJ/QeDUfPc1PmZLNBM8zjJhcY7KLY5VvSq5cl737k+?=
 =?us-ascii?Q?c1Rx5obWkp8ov5cj6hEkl9jIG25cJupa5sbTgu2GwNziMaq68eONklBcHhK3?=
 =?us-ascii?Q?nkXRbFL6mfvAIToK8vroWSYGdOug/E7r87XE8hjQHdYEBZphsaMxuurwshRL?=
 =?us-ascii?Q?FJCgBVmyGhurqbQh12jECbAjG5AlxOJrBG4YVafYKN+ESIxWAmVuX9O0rOIu?=
 =?us-ascii?Q?0qoXeD3eAxUq5Mzxbml0IKJdDsrBbdl6SlSz5n8FxUij7gtb+CVJvpCwVlie?=
 =?us-ascii?Q?bShgjU0EKo+y12eoIQdI9i78EY+23IeZx+eJXhhrmVOU22xfkleTe1VtUsIG?=
 =?us-ascii?Q?OM+Xq/fdmAkWXK2QNFssC3hdJr3L7QK4NRnkoARojSqHeT1igZVj6OtvaaUM?=
 =?us-ascii?Q?yEFOXOcl2zlpkB5C3VOo2vkz6rfVgshSPGalyKU/16EuxcNL3wUNtAdrVxi7?=
 =?us-ascii?Q?TCWfl61Aht/QALBIO1HjvEfxBZbvv3ByQ07mf0SfZoO5ytq2T2rSXXfs2w/l?=
 =?us-ascii?Q?SLvkOnOC+ns6RG8ETnvPUFbjZP4G6+PHks49r339lz2sGMEHzqXagX6yFM2e?=
 =?us-ascii?Q?KY9SVZWlkKa+jN7vBl1NeKErCb6jn8Yiq3OmXt+2yG+oPmjD+UjbwCIQwRyG?=
 =?us-ascii?Q?LYctJDnbLgjic3qLuFHH2YVKOvyjB9nJ3Ik3Kl6qVST6h9t7jadw0lqamkvF?=
 =?us-ascii?Q?yxBEBC9niSxY3ycEZBFwkE08jG1+lq445bSZlRaZmw98FAE1TIMUUPZeKtKZ?=
 =?us-ascii?Q?yKAjYD8I8oSEVesfWYgY7bQ0mFTBei2CAVcZTDhNeBdu8pcdDw+7Pufb4jHD?=
 =?us-ascii?Q?8kP27KyzKri548BabSwtVG4sNWFRtbRHNNPWaNyLJK6vFC1lVfeiz35V0Ui0?=
 =?us-ascii?Q?E6Vp2Q6NVtDJhdZPWBrVIB7oY4+wfFsGgXNdlfI8b3Y+VglGXRMlWUdqQPtE?=
 =?us-ascii?Q?y26TkkPzAL35V+BASa4sBxzW/+ukij5g2+cSFu5T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d88c35-885a-418e-7a7e-08de397b81f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 12:39:35.7094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pH6GAGeZxbWzdN6K2LpSRlcBGeeFBxIBiHkaR0ZS0F5HmMXZRlKS+yua+Zkid98T/IYC8jXVbDaadzRbcir8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR04MB9833
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

>> Hi Dmitry, I found there is another patch "Register USB Type-C mode swit=
ches" which provided by Pin-yen Lin <treapking@chromium.org>, but I didn't =
find it in the v6.18, is it obsolete?.

>It has been posted 2 years ago, it has not been reposted since that time, =
it targets a very specific ChromeOS usecase. I can't call it obsolete, but =
it wasn't merged.

OK, thanks!
Xin

>> https://patchew.org/linux/20221124102056.393220-1-treapking@chromium.o
>> rg/20221124102056.393220-6-treapking@chromium.org/
=20

>>=20
>> Thanks,
>> Xin

