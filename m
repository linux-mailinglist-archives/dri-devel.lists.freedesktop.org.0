Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7099C2B6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFA710E253;
	Mon, 14 Oct 2024 08:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R+iMYEOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BC010E253
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:14:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAV5Q/SRPkvzD7HBOdvPkQRfF8GK7/Hfx+xMN64BBBbFOnFzontBKb9TM5uhS92W+JTFsj+B9rMSFD5Gepj0M8GdUbKdaFFDMYBFSy5fptpXRR+quW6QjooIRYaINkTKqWX3FZLpPfR9XIi93MxkOszLTaJI3Oi/c/lFtD4IPfjRwp5alu4FoS/x5PLm+KToKmTeUkB3BfZ6JLZaBRCgm+WXGVKU8kxeppPFv5iBzcdnooy4hkEfC1Udauf4q4yBqwS8FdNwBiFupSbvzEYM3HVze71ZaZ0ha3aOJdxM6nbSk87pngEh7iebH+KNt6E/yEM5aZd65lkYro1jzzS5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJkl9OXwACJk3s4EWfTYxwqzVaHnCHMScoyNdRgp5b4=;
 b=jlra8poR9hsFORuyUu/rgajeq04qvEqP5S7N8XFmoZ28gYEoOZVwuvKjAgvPm6HnBo1ck4YDWAO85dkQynvnW2eJUWfHYP3/Mkg20GGZm4fStJEC/GDNBmGZEhGEEykbdN1MTIg5BH57RwLAYZIe8+nlrBl/qhG1lR4UOOQXyNGqqbwjb7Wpuhj102u2b6dlc1kYrG3iD+fwns8UWvG6OsIFXT92WDOfN0DaL/HS9yL/FploQNNynsLVvgDoQ6CNssWi1OlhrDsVL4ZbGMASd7NZU3SLZJEURqC1WX1NHpm8JqE/dhTTZ0/lz0JbBvxy2Ygp8/cz3916YGpIny5EkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJkl9OXwACJk3s4EWfTYxwqzVaHnCHMScoyNdRgp5b4=;
 b=R+iMYEOaFjTcDCMsnr6JxY8vVaVpBk19ISFjoKoXeHxy6QUWWJeWXrhr1/z7LDV8O6rwH4wcOQ6/yiVniJS5oEYW/YGJKzRA9cuHlSWBFE/S7rK0RTJJ4kydcrkpiV/bjL7AgBbQR3SwbcQQ1tQtBOL/4ZqqXXLLHUGV6rb/SDc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12749.jpnprd01.prod.outlook.com (2603:1096:405:1e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:14:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:14:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
Subject: RE: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Topic: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Index: AQHbHHmjKrSxUtUM4UujDkcK4B2m5bKF102AgAACN4CAAA6FIA==
Date: Mon, 14 Oct 2024 08:14:00 +0000
Message-ID: <TY3PR01MB11346C710A5E7621314C5DADC86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <dtloyyghjep5rm34qjjinvhvrar5jzj3n24czvpdmnkfesntjq@t2uijuez7myj>
 <f47bc3f1-20d9-4f7e-acdd-85eabdb8d743@nxp.com>
In-Reply-To: <f47bc3f1-20d9-4f7e-acdd-85eabdb8d743@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12749:EE_
x-ms-office365-filtering-correlation-id: fcdeb1f2-8634-4fe6-e046-08dcec2828d3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0RVVlZYRGRIaTBQdncwc2sxekhIdEJCam53ems3UDA4ZVRMcm4rcFRmcXg3?=
 =?utf-8?B?R0ZLTWUvakQyQitaK2swQjhlT0VsMmVQREVyOUVUdFU0V0hyWXkwekx3di9Z?=
 =?utf-8?B?YURUOGQwcHc2SVJRYWYzbmE0cmV6ZWlacFpMT2dVVU1pWndHVGxPSXc5bTNw?=
 =?utf-8?B?ekZUM1d0eWNmQmlRWkRSUWsvVlJzZjBlZzJoL2hFWEIwLytvWEVPMzdVaDlQ?=
 =?utf-8?B?VXpJSHoxcUxkaWduWkxWajJKQkplUVBmdFIrQ0d6a21KMkFkVWovdmJaMlBa?=
 =?utf-8?B?UWc4UFUrSklMZVd4ZjdtaUN5OGEzcW5nbWlZS2IwQkNySWVEL2Zaa081T2xo?=
 =?utf-8?B?cjRpbmxzTnlMaDBoWkFqUWJDdDFJbTQyVW12MEdBM0R6NnhONXFWVVVrdHJH?=
 =?utf-8?B?Zkw3YzB2N3hjYk9MVjRRcDRjTmh2bzNFd1JRanVWcWk5cFNSRmhnQXlBWjg3?=
 =?utf-8?B?SUQ5OFI2Nm9Zano1cVlSWm9tQmM4akNOeU52eUE5QlY5eVV6TklLL2lFcENr?=
 =?utf-8?B?RUhyYkkvcEE5UDdqeldVVXlVY1I5TE5sVmg2ZlNPUmFNUGZFZStJOEI5Unlo?=
 =?utf-8?B?Z2M2SjJmVnBlOGhZbjBHb1lkUTJmZEQyYVRVWklmNkpZU3JRSmoyV1VzMmhO?=
 =?utf-8?B?NkxKWm1TV3BQaTducHNaOEE1Z1dhZEdVVndaekcwT1grbFliUGZwYzg2dk9S?=
 =?utf-8?B?dUtTKzdLNFl0NjRhK2hzNGoxUi9FeGkwYy9CS1NDUWFhM2d0dUdyZzA5N0tC?=
 =?utf-8?B?QTVRMXJIb013b0lPWU9xR0w4TFJ2VDFRa1FXcWpFMVd2SEFFaTI5cGRQUElT?=
 =?utf-8?B?NkpMR05pSTBEb0FZY215ZFc2K3p4aVkxQ1lnWmJ0ZnRUb3hOZmRPOGt6aXdv?=
 =?utf-8?B?LzhDOVVtREJmeGJhNDRSUnhxdUgrbkJFUVBNSjRmNlBGdHlMNVVJUzhnVUNk?=
 =?utf-8?B?cUY5OWM3Z0YyYWlXQ2JoN2VuQU1tV3Y1d3FabkFKalZKc0NHaHp2bVhWdFVa?=
 =?utf-8?B?WU53TUVFMWpxLzJyb0NIMHc2SE9aR3JXcFZhSXh4U2ZDZnNpa1lIU2llWit4?=
 =?utf-8?B?eTJJSUlZSkFHekhGa2IrUDNGTW9yZEp5UnIyWXk0cEFWYTJnWnZ5RjcwOURP?=
 =?utf-8?B?dms4NzVLUHBoNXBZL3JhbzFzZTM3Mlp5czFWem9lNE1vMmdzOGREVmZLMkFZ?=
 =?utf-8?B?OGhBTWluclg4Zi96VVd6bzlEVE55WWJvWEFPNDliRUdKQnRXWTBIZFBYeW90?=
 =?utf-8?B?Vm5WK1VBNUxWUzhQTmczRHdJT20rUFF0cXZmNEMvbmhKclU5VTg5ajQwYzF2?=
 =?utf-8?B?TFN1N2xlS2NNSzF1NklnNTY3ZFVISHN5TE1hR3NNK1R1d29kcDluZ1ZVTjQ2?=
 =?utf-8?B?MXU0eFMzV0JIdG9TRjlVNThEMjdnRWtEWnp4MUJiN0RxNDJ6WUJFQzhiMTlF?=
 =?utf-8?B?OUhlai81WnVCK0V3SE9TZldSUTVQbUZuSmpwcUFBb3RWZ3packlqcW51NEJD?=
 =?utf-8?B?aGFJZHF2QVhIR3VIK0RJT3gwOTM0RE9GMmt0ekNNTmJDbjdwRDlBenBzVWl6?=
 =?utf-8?B?QThnb0pkZ29raFRPSWVOMGluaWZMOGxlbURVdTR0SWgzQ3VRRFE5ZHZkL1Z3?=
 =?utf-8?B?YXY0ZGlTelVIeFhHM1M3c2lUb3dNemYvaDVPWThlQ2dHWEVEdFpCb3puTmUw?=
 =?utf-8?B?bXRjekNaM3F3a1lad2JyR1hXOENHelZMOE42ZG9qWEZNMytxaHlzb21DSDVM?=
 =?utf-8?B?UXRxbmtZaEs2enNSYURla1R0aDc5aDluTlJhSFhoTkVDMitEOUg0NGt4R0tw?=
 =?utf-8?B?Q21nbWxqdW51REZtUTJsQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDUvNllzVENGeW9Nam9tOGxhZmxzRFo5clNzYXBzSkMrbXRXUVdvcityUjFz?=
 =?utf-8?B?bFpzaTZSZDE3a0xrVEx0TzhMSExSdVlUQlpWcVZJa0o0ZVFMRlQrQWxHQWM1?=
 =?utf-8?B?bUtsZi9yem4vWVhKZ2FDandyQzdXc3c5NUNEYW5jWnhWd3E4NzF5OHJhTE5X?=
 =?utf-8?B?NWN5ZDBqUUtrYWhVUU5aVGgzd2xMNFdzMHZLVzg2ekZLWUlSNjlTcDFUU3BU?=
 =?utf-8?B?UG15R1hnZHNyQk96YU1xZGQ4M2JPNHNIMm1mUDFCak1HaUdacTFPQVIvemsr?=
 =?utf-8?B?YlRoZkt5QVA4MnRmbzdwWnFzcmFkS0pEdGN0Q2c0bnJQeDhGSXZkdWVOdmxJ?=
 =?utf-8?B?NVowVWxiMWVVdk9iaDR0Ry95aGF5VUFzTDZzZUo3MzE0bEFQbXRiSks3ekxl?=
 =?utf-8?B?OHR0WEtPUG9ieFZVVVdrRDkwS2VkQ1Vqb2o0elNLcm13TitGREhPdjUvU3RK?=
 =?utf-8?B?U21LYlRTVS93L0wzZmxUbHJCeXZHaU9vaTRCNzZEOU12ZHg2ZEFFdVJvZkNX?=
 =?utf-8?B?NjJvQTA4dStobFlIdHFQS1NleHBpSnY1RVlEVENiNzdyWkhrTVRZdE9abWt1?=
 =?utf-8?B?aFVCTEF2cWxic3JsZlBkclcyNWVFSWtpanlEaTBlUlFWVENWVXYrakV3QWJw?=
 =?utf-8?B?Q2lVeDZLNS9iRkNnNmY0NGhvMTc0WDlmR25QeDVuRzg3bERiTVRNMTNnbkRs?=
 =?utf-8?B?VU9CQ1pVa1lxdVJiQVJhWnVQYWNVK0JNWUlDK1JxL0Rwem9NSCt1RHdvZy9i?=
 =?utf-8?B?b0dPUnZtdk1SMzlLOVdROHU5aHdvaFZQR0pRTDdJdStkMWU3bmI0TEtZVCtR?=
 =?utf-8?B?UUpyaEFNMmdyVjNGZ1k3d2lXLy9XRm5PM3IyL2NSSUZ3aDc0TWZXT0owL3B5?=
 =?utf-8?B?a3gyMlpXdW1oQ09NM2diMFRNbUR5NWdMUjZ2Z2tzSDdQbFZGeEw4UlVpM3lH?=
 =?utf-8?B?d1l0RXV4VkJRNXFLbEtwb1FETVVpYXpnNEJlWFRwZHh6ZER1TU15MnVaQThB?=
 =?utf-8?B?dUdXWTNCZllwamZSOTBhNVhaM3NKdGI4TzRGN3g2Qk5IS0sxd045cjJKQXV1?=
 =?utf-8?B?R2xGeVVDMG0xTzBCeTNkY3oxOGhWYUNOcncveTNtTFBzdmpMRlUybkQyZWpW?=
 =?utf-8?B?Ym03eEU5U1RIQUFZMGNjVXZRSVZkNmdCOC9OdWlocmUvYzYrelV5NFFVUmls?=
 =?utf-8?B?TTFIZEgwWVQwVlhIVi9DQlBJWlh2SkMvdkkrOTNkT0tRZjJlb0kzUVJaTDdH?=
 =?utf-8?B?L1VNQkhpLytDVzFXSFk4WlMyd2RKeUk3SmkyTG5BaGNERTVaSGdRZjRRV0la?=
 =?utf-8?B?MlN5Z0xQU3J5OWxuRktQWk1LemNSUUlodXY3ZDVPWVhoS1RTZUMwTWhzTU5v?=
 =?utf-8?B?VEhPSHVFMmpjV2IrQWE4OER5MzVaWCtmdjJSeVFkaEtjTWg2MCtSa0VJOEV1?=
 =?utf-8?B?VngzUzFHSWVKWkk2SXNCTE5tSXBtNDlWSWdQRmg0ZmZucmJzNE9wMTJJSnpx?=
 =?utf-8?B?T2xESENscDZ4RmYzQVlPSGp6WVNpZjZuU3FqZFlNNkY1V0Z2N1JDSjJnNGZm?=
 =?utf-8?B?T01jMkwyNkI5SEw2a3N0SDZEVDJQZjJKMk9kOUZhTHhuMEs2bkpid3BDOHNX?=
 =?utf-8?B?bFBDS2U2TjdTWXF4UnJJMTJNaWFzVDNSK2xGdUNHUjhGMkxSOUhPSzBjdDVN?=
 =?utf-8?B?blhJUHltdDRFRFE2YUFyZUVlS3ZWaHJGZUg0SVU5OHVmcDBlbVQwMVp5L0sy?=
 =?utf-8?B?SVp4VUExaWF3Y25zYTN6UUlWcTQ0ZmxkT1VWY2U5TGFCRGNPZ0o1YzkxS2Ft?=
 =?utf-8?B?N0pHTVBpZkNkZXJaekt6VFFCbzVsZk9sVmZZL3Vra1dPY2xtbG9sYjU4Tmls?=
 =?utf-8?B?OWw2Qkh2Y0svZiswUDN6SUNoSUlSZzZDSzNlVmdoYXFFS0g0Tk05SFZsVHk5?=
 =?utf-8?B?aWJyQ0VJVHVlSWI0MjBUdmQ4RUx3N1h2UFpmellISG1BNU5HUlZLeTEyKzFX?=
 =?utf-8?B?Zk8xSE1TNVcxeHcrc29yem53YzRjMTB2MkNvbHdyR0NJamxUSkhLMzFBWWR0?=
 =?utf-8?B?VEV6Sk0rWEpSVWwvUUR2QlI5VElveVdCUk0zbGNpdTZEcnZ2akhDQjJRMEh1?=
 =?utf-8?Q?SYeocPvzFs6/5VFMNzKr6eP7J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdeb1f2-8634-4fe6-e046-08dcec2828d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 08:14:00.7205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmqZctYoP218gCutlshvD0CaTQwAPWHy5x+nvdap1PaGMW12fERpYgJ2ghnYlkEcwC/oII73vKKjH9gmbNpbG5Ez1SYcTW7czdpcP4DCSAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12749
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE0LCAy
MDI0IDg6MTggQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA2LzldIGRybS9icmlkZ2U6IEFk
ZCBJVEUgSVQ2MjYzIExWRFMgdG8gSERNSSBjb252ZXJ0ZXINCj4gDQo+IE9uIDEwLzE0LzIwMjQs
IERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+ID4gT24gU2F0LCBPY3QgMTIsIDIwMjQgYXQgMDM6
MzU6NDBQTSArMDgwMCwgTGl1IFlpbmcgd3JvdGU6DQo+ID4+IEFkZCBiYXNpYyBIRE1JIHZpZGVv
IG91dHB1dCBzdXBwb3J0LiBDdXJyZW50bHksIG9ubHkgUkdCODg4IG91dHB1dA0KPiA+PiBwaXhl
bCBmb3JtYXQgaXMgc3VwcG9ydGVkLiAgQXQgdGhlIExWRFMgaW5wdXQgc2lkZSwgdGhlIGRyaXZl
cg0KPiA+PiBzdXBwb3J0cyBzaW5nbGUgTFZEUyBsaW5rIGFuZCBkdWFsIExWRFMgbGlua3Mgd2l0
aCAiamVpZGEtMjQiIExWRFMNCj4gPj4gbWFwcGluZy4NCj4gPj4NCj4gPj4gUHJvZHVjdCBsaW5r
Og0KPiA+PiBodHRwczovL3d3dy5pdGUuY29tLnR3L2VuL3Byb2R1Y3QvY2F0ZTEvSVQ2MjYzDQo+
ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+
ID4+IC0tLQ0KPiA+PiB2MjoNCj4gPj4gKiBBZGQgQVZJIGluZm9yZnJhbWUgc3VwcG9ydC4gIChN
YXhpbWUpDQo+ID4+ICogQWRkIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQS4gIChCaWp1KQ0KPiA+
PiAqIFJlbmFtZSBpdDYyNjNfcmVzZXQoKSB0byBpdDYyNjNfaHdfcmVzZXQoKS4gIChCaWp1KQ0K
PiA+PiAqIENoZWNrIG51bWJlciBvZiBMVkRTIGxpbmsgZGF0YSBsYW5lcy4gIChCaWp1KQ0KPiA+
Pg0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAgfCAgIDggKw0KPiA+
PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgfCAgIDEgKw0KPiA+PiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2MjYzLmMgfCA5MTkNCj4gPj4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCA5MjggaW5zZXJ0aW9ucygr
KQ0KPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0
NjI2My5jDQo+ID4+DQo+ID4NCj4gPiBbLi4uXQ0KPiA+DQo+ID4+ICtzdGF0aWMgaW50IGl0NjI2
M19wYXJzZV9kdChzdHJ1Y3QgaXQ2MjYzICppdCkgew0KPiA+PiArCXN0cnVjdCBkZXZpY2UgKmRl
diA9IGl0LT5kZXY7DQo+ID4+ICsJc3RydWN0IGRldmljZV9ub2RlICpwb3J0MCwgKnBvcnQxOw0K
PiA+PiArCWludCByZXQ7DQo+ID4+ICsNCj4gPj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3U4
KGRldi0+b2Zfbm9kZSwgIml0ZSxsdmRzLWxpbmstbnVtLWRhdGEtbGFuZXMiLA0KPiA+PiArCQkJ
CSAgJml0LT5sdmRzX2xpbmtfbnVtX2RsYW5lcyk7DQo+ID4+ICsJaWYgKHJldCkgew0KPiA+PiAr
CQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgTFZEUyBsaW5rIG51bWJlciBvZiBkYXRhIGxh
bmVzOiAlZFxuIiwNCj4gPj4gKwkJCXJldCk7DQo+ID4+ICsJCXJldHVybiByZXQ7DQo+ID4+ICsJ
fQ0KPiA+PiArDQo+ID4+ICsJaXQtPm5leHRfYnJpZGdlID0gZGV2bV9kcm1fb2ZfZ2V0X2JyaWRn
ZShkZXYsIGRldi0+b2Zfbm9kZSwgMiwgMCk7DQo+ID4+ICsJaWYgKElTX0VSUihpdC0+bmV4dF9i
cmlkZ2UpKQ0KPiA+PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoaXQtPm5l
eHRfYnJpZGdlKSwNCj4gPj4gKwkJCQkgICAgICJmYWlsZWQgdG8gZ2V0IG5leHQgYnJpZGdlXG4i
KTsNCj4gPj4gKw0KPiA+PiArCXBvcnQwID0gb2ZfZ3JhcGhfZ2V0X3BvcnRfYnlfaWQoZGV2LT5v
Zl9ub2RlLCAwKTsNCj4gPj4gKwlwb3J0MSA9IG9mX2dyYXBoX2dldF9wb3J0X2J5X2lkKGRldi0+
b2Zfbm9kZSwgMSk7DQo+ID4+ICsJaWYgKHBvcnQwICYmIHBvcnQxKSB7DQo+ID4+ICsJCWlmIChv
Zl9wcm9wZXJ0eV9yZWFkX2Jvb2wocG9ydDAsICJkdWFsLWx2ZHMtZXZlbi1waXhlbHMiKSAmJg0K
PiA+PiArCQkgICAgb2ZfcHJvcGVydHlfcmVhZF9ib29sKHBvcnQxLCAiZHVhbC1sdmRzLW9kZC1w
aXhlbHMiKSkgew0KPiA+PiArCQkJaXQtPmx2ZHNfZHVhbF9saW5rID0gdHJ1ZTsNCj4gPj4gKwkJ
CWl0LT5sdmRzX2xpbmsxMl9zd2FwID0gdHJ1ZTsNCj4gPj4gKwkJfSBlbHNlIGlmIChvZl9wcm9w
ZXJ0eV9yZWFkX2Jvb2wocG9ydDAsICJkdWFsLWx2ZHMtb2RkLXBpeGVscyIpICYmDQo+ID4+ICsJ
CQkgICBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wocG9ydDEsICJkdWFsLWx2ZHMtZXZlbi1waXhlbHMi
KSkgew0KPiA+PiArCQkJaXQtPmx2ZHNfZHVhbF9saW5rID0gdHJ1ZTsNCj4gPj4gKwkJfQ0KPiA+
PiArDQo+ID4+ICsJCWlmICghaXQtPmx2ZHNfZHVhbF9saW5rKSB7DQo+ID4+ICsJCQlkZXZfZXJy
KGRldiwNCj4gPj4gKwkJCQkiZmFpbGVkIHRvIGdldCBMVkRTIGR1YWwgbGluayBwaXhlbCBvcmRl
clxuIik7DQo+ID4+ICsJCQlyZXQgPSAtRUlOVkFMOw0KPiA+PiArCQl9DQo+ID4NCj4gPiBQbGVh
c2UgdXNlIGRybV9vZl9sdmRzX2dldF9kdWFsX2xpbmtfcGl4ZWxfb3JkZXIoKSwgaXQgdmFsaWRh
dGVzIHRoYXQNCj4gPiB0aGUgRFQgZGVmaW5pdGlvbiBpcyBzb3VuZDogb25lIHBvcnQgZm9yIG9k
ZCBwaXhlbHMsIG9uZSBwb3J0IGZvciBldmVuDQo+ID4gcGl4ZWxzLg0KPiANCj4gSXQgY2Fubm90
IGJlIHVzZWQsIGJlY2F1c2UgaXQgZ2V0IHRoZSBwaXhlbCBvcmRlciBmb3IgdGhlIExWRFMgc291
cmNlIG5vdCBzaW5rLiBJVDYyNjMgaXMgdGhlIExWRFMNCj4gc2luay4NCj4gDQo+ICAqIGRybV9v
Zl9sdmRzX2dldF9kdWFsX2xpbmtfcGl4ZWxfb3JkZXIgLSBHZXQgTFZEUyBkdWFsLWxpbmsgcGl4
ZWwgb3JkZXINCj4gICogQHBvcnQxOiBGaXJzdCBEVCBwb3J0IG5vZGUgb2YgdGhlIER1YWwtbGlu
ayBMVkRTIHNvdXJjZQ0KPiAgKiBAcG9ydDI6IFNlY29uZCBEVCBwb3J0IG5vZGUgb2YgdGhlIER1
YWwtbGluayBMVkRTIHNvdXJjZQ0KDQoNCkNhbid0IHlvdSB1c2UgZHJtX29mX2x2ZHNfZ2V0X2R1
YWxfbGlua19waXhlbF9vcmRlcigpIGZyb20gaG9zdCBmb3IgdGhlIHNhbWUgdXNlIGNhc2UuIFNl
ZSBbMV0/DQoNClsxXQ0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3Jj
YXItZHUvcmNhcl9sdmRzLmM/aD1uZXh0LTIwMjQxMDExDQoNCmx2ZHNfYnJpZGdlMDogbHZkcy10
by1oZG1pLWJyaWRnZUA0YyB7DQoJCWNvbXBhdGlibGUgPSAiaXRlLGl0NjI2MyI7DQoJCXJlZyA9
IDwweDRjPjsNCgkJcG9ydHMgew0KCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQoJCQkjc2l6ZS1j
ZWxscyA9IDwwPjsNCg0KCQkJcG9ydEAwIHsNCgkJCQlyZWcgPSA8MD47DQoJCQkJZHVhbC1sdmRz
LW9kZC1waXhlbHM7DQoJCQkJbHZkczBfaW4wOiBlbmRwb2ludEAwIHsNCgkJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZsdmRzMF9vdXQ+Ow0KCQkJCX07DQoJCQl9Ow0KDQoJCQlwb3J0QDEgew0KCQkJ
CXJlZyA9IDwxPjsNCgkJCQlkdWFsLWx2ZHMtZXZlbi1waXhlbHM7DQoJCQkJbHZkczBfaW4xOiBl
bmRwb2ludEAxIHsNCgkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+Ow0KCQkJCX07
DQoJCQl9Ow0KDQoJCQlwb3J0QDIgew0KCQkJCXJlZyA9IDwyPjsNCgkJCQlpdDYyNjNfb3V0OiBl
bmRwb2ludEAyIHsNCgkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX3RvX2hkbWlfY29uX291
dD47DQoJCQkJfTsNCgkJCX07DQoJCX07DQoJfTsNCn07DQoNCkNoZWVycywNCkJpanUNCg0KDQo+
IA0KPiA+DQo+ID4+ICsJfSBlbHNlIGlmIChwb3J0MSkgew0KPiA+PiArCQlyZXQgPSAtRUlOVkFM
Ow0KPiA+PiArCQlkZXZfZXJyKGRldiwgInNpbmdsZSBpbnB1dCBMVkRTIHBvcnQxIGlzIG5vdCBz
dXBwb3J0ZWRcbiIpOw0KPiA+PiArCX0gZWxzZSBpZiAoIXBvcnQwKSB7DQo+ID4+ICsJCXJldCA9
IC1FSU5WQUw7DQo+ID4+ICsJCWRldl9lcnIoZGV2LCAibm8gaW5wdXQgTFZEUyBwb3J0XG4iKTsN
Cj4gPj4gKwl9DQo+ID4+ICsNCj4gPj4gKwlvZl9ub2RlX3B1dChwb3J0MCk7DQo+ID4+ICsJb2Zf
bm9kZV9wdXQocG9ydDEpOw0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIHJldDsNCj4gPj4gK30NCj4g
Pj4gKw0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiBMaXUgWWluZw0KDQo=
