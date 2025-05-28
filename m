Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D556EAC62A8
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E4710E1AD;
	Wed, 28 May 2025 07:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qhZHR/ga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBDA10E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6Tku+fcOSY0mFTL3uBA+zXqgXOFVqRJCvNGZ/CPLblXbd57JjIyAo0H6VKGzyTecc6J6XrfcPh0ktLlrrx22pK4GTljHx6MT/47/RBX+wO+oVuTUuU9pGvZjJbU3qaYT6pPxMeEU/D0Do0SYuT2/XeIz9wFKye8GtppTq0WwBXsJ41xLZ/H46liFbtxtxI2Zs8h0wdH2IFko6LTiFRDiDg0qQeeBy47Ny+BWRo5XwpbhLV6/XpLNLzuYMaxjLQe5gEk6TBet4T+l8gjqrjt8O894p9ErlAEo3sS+WfbVbDUFU3AocHctB25iOXy0msa9xmyKvMZHHT7vnCKG+T8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhG2Ob6eC+Dx+4cv/p45uo3q4wSFSFd9TTZbSQXFsxE=;
 b=uRS/hMNs8kawZRi2AZU72GaPXmx9GrCxK4o4P07vyPjKujSI8sPElY0zmbn0+adMkYXdeLzsVKf9cS9sRILidpwfb1w9Kdl8xznVonEK2crMKE5UxwR4jISRowCZQgL3RIqeW6Hzvzu+RJXiT3YOIb4bJGVkexmwzTYOoS5jQhv/m61Sbb/z8zYWKcewpTKe9TjcxYCK9/rCME8Z4AgrpymGHT5XgXQYHsq+8ydvJf9f9781lrXESRPt+jQFpZ/qI/y0WigMSzv3nHlXKPI0ZLKNUTD149tsW9s5QAA8MFyTSeU/lHT0GB04SJFBo/nneUPqlsNCTZ0tCWQE72MeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhG2Ob6eC+Dx+4cv/p45uo3q4wSFSFd9TTZbSQXFsxE=;
 b=qhZHR/ga+YdP3m5RH4ejLluQ4gJDSncA9mvYSQ3CQ10TxJe9WS5PmkqBEfErtB3Q0Ld4mqWOc5dlWSWfat514pvUeNs1aIyc76sRcrUvYvBAWLW6KsdNqUiPbkfWux4yBEtb9KiLz3/Aq+S3mGUdWx4jS3zHQy7tFX87KILV9UM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9797.jpnprd01.prod.outlook.com (2603:1096:400:20b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 07:10:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:10:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
 <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Adam Ford <aford173@gmail.com>, Douglas
 Anderson <dianders@chromium.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] drm/bridge: adv7511: Move
 adv711_dsi_config_timing_gen() into adv7511_mode_set()
Thread-Topic: [PATCH v2 1/2] drm/bridge: adv7511: Move
 adv711_dsi_config_timing_gen() into adv7511_mode_set()
Thread-Index: AQHbz57q8IUGfTgXi0qWA9wNK9hFFLPnn2ew
Date: Wed, 28 May 2025 07:10:38 +0000
Message-ID: <TY3PR01MB11346F65C7600EE0799F1698C8667A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
 <20250528070452.901183-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250528070452.901183-2-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9797:EE_
x-ms-office365-filtering-correlation-id: 701ab844-d1e7-461f-760c-08dd9db6c001
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Fl980YbJs6RpFtP1xVHx7buITsRDeJzR2gE71o7JQ29fSey0mCdwB83kKMo0?=
 =?us-ascii?Q?eNmVyVO5HKe5gS7CIKTXCf7TQvGSGaoJDogztirDtwh2eQw+qNQV9A+EJdax?=
 =?us-ascii?Q?XPFcSt6Zs+U2VforhYim8wIMrIQa3SXc48mjzUgh3epD+4+8bPKkLqmAtyz/?=
 =?us-ascii?Q?CD/HCnSUF5zjYcABHIhR1mDjsUQUCxoa/kxm767SgbisASLci2IXqTYy9+PJ?=
 =?us-ascii?Q?xyNTNqFNSIZXUTGt9IVQzTfGDothW7zPMjFTzNonHOXj2KlyM4BEpZJ5mbEt?=
 =?us-ascii?Q?b5bbuQ8CDVCYbt2SJxnuP89Qupb8m0W9ERN5CZwxu1BO3Py2Szhx8w0B1fNQ?=
 =?us-ascii?Q?PgvJNCfiVTVsXYE6OkbdILynvd+Yc1cMDeITCaEcD26rDdFhP0CcdzUBE2Jv?=
 =?us-ascii?Q?21Wy9bEnlm5oj3E0EI7KJCXaEyb+zlxMBI6zJAEfNAH2xbCOKP72H7g6OqrD?=
 =?us-ascii?Q?Wd8RPf4M3hMQySRwSZgS7THkdEOsLf3KVod1teLrB58DdhFBmP/HgNPQLZTz?=
 =?us-ascii?Q?sm2pN7zyMCauiqNbSqFUsCcV3YlTzMYxPq3Q9w0RLO2JLVsN+mexJ2zcr1r3?=
 =?us-ascii?Q?RxVAF8KToGWH9HvBysD0E4NnXTTLfw7BPVa5CefCE19RpnDPaSJPTwhmJU8O?=
 =?us-ascii?Q?NPRH9DxTSgaIhzUuql83Y7tUBavw6rB8Vn4gE/fEghkMCh9dTFmErKqmAzer?=
 =?us-ascii?Q?mrmAb3QfyreX91qhxRaD0xyDIfjI9bwYf3JjOxcQxbMXrCivN3jGSs43cxwS?=
 =?us-ascii?Q?T4JkaLH7FZ2wuOxGa/yDndrQDClAgIvfuQHoBOH2rO5P4y8zXQOKbGhSrVrs?=
 =?us-ascii?Q?DEMKw4TS1lwF1YPAKP7LlbfmrbGZQYOBTSJe4UmV3FVvlhZph+smYqXK6UG+?=
 =?us-ascii?Q?aT9qPwEWa1rxRUZi7mEqMlSXMa6qZiROctLVO4d+/3qUKh4zZ50RcDAwtuY2?=
 =?us-ascii?Q?MQrMPX9YT2PgxLUjc0wti/EGvBN67JsmJxG3WgqDkCqEPd0+nSdrTDzpArdm?=
 =?us-ascii?Q?8n5D0tT+gnT9bHYWU8UwjV+rIPR19cewXCWFKQn+0bXe76D6ErVAfQ8ynSky?=
 =?us-ascii?Q?/XMdFiC4g2uHy7m1yErmEz1MdbHq++eMRs227p1yUZDz0oK7XHo130TzKtP5?=
 =?us-ascii?Q?AqYr1N4ml273vrATC++zUCbm44k3mH0QrIMw4EJH8J0wFtjswzpCNFeNtUfW?=
 =?us-ascii?Q?VB6ZKncaIM3M04NlDjandEpxgGwFeValx7DnJVt5GF30KmCq0vvFTefOudMv?=
 =?us-ascii?Q?5+/5OEaf54NFyzCxCdP905FSN93+dN6HwuR5Mmhde4CZUlWFQ4xXyJNTF5qG?=
 =?us-ascii?Q?KVc4B6NxP7omj2rb74VeDJBdfNJK5f2GoLVKJTm1Hw0P54eML93L62K/GWKc?=
 =?us-ascii?Q?G2R8PJSMpyDIK+79eZVMe07dRSAufGjXsy5tR4MwvmS64jETqJbk/9AKFyVJ?=
 =?us-ascii?Q?D1c8/EUiPFR1e7QcsQhsnBA5W0MGQB08LU8jCfxFNU26NkJgiPkUpxASfQEy?=
 =?us-ascii?Q?AoKYOpk0dW5ynCU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KsQRLxDnv9P4Uu2uaTQWsReY28VaX9rwQ68VEyOYIIJSQww5p8nuVJXHrcNy?=
 =?us-ascii?Q?B65s1Da7PWZQ5lOngEpiun9+7jBPNTnPUwvxVBdFpnGLy4lV9fX0jORt6l43?=
 =?us-ascii?Q?x5jnURH6EFn+Ufupm9vds130gEIDecAZzMJNa9hYKFi4y7y7/wDkLVvGrBHO?=
 =?us-ascii?Q?t4wSF4JEu21ncqY/4ysVlvK4DWOFX0LiMECbKw9SpXF3TMwPvEvYtCZzI7Oo?=
 =?us-ascii?Q?CGbaABuTCW7Fgcx0uRkgnA5jm3shsS1yiUOresTbecP4/oL5ZPXwP6tg6yoa?=
 =?us-ascii?Q?h7F/Mp8K8CWe1+BQLgqAZsVEyCiJ8PcIzOE0IMeYYNLw3uQieY+/p2zNuoTi?=
 =?us-ascii?Q?9lhQNdGmO01SpCh2QMdsV5m71Q5vusxBzgVBpLNV3xoLizxY2GHCZDQB/ike?=
 =?us-ascii?Q?ofqdng05Xu2hO/6hb8GSbZW0ztDv1+Yv4EBZ+oyS0jVvWbtfLZG2e3hEuRKf?=
 =?us-ascii?Q?Tx6y86nMmZoOl8aUgnijs5ksYqtPMbTHK3MezqB5Dk5yyEdg6dsW2G4tWd/S?=
 =?us-ascii?Q?dD74+fDdQ5oxwLnNCTkzjFQwyZOHhb2Of3RSBethiA4q9BBNLul4oGmp4/gr?=
 =?us-ascii?Q?+tVfgAwyMrTZns/BXGP7zSfh8fMkbwrotNs17zMsjSsVvXUtOCnUTAIYkVdA?=
 =?us-ascii?Q?yAPypimTGulJ7QR9qhmHgp/Dp32CYUQybY6C32P+VmQlSieTXeH4vffeZLIA?=
 =?us-ascii?Q?u8o9cnkiwqfMdtT89pHEK6AiWlFhRBMechh0KO2jcqVee1CIPbc1o34wYSBb?=
 =?us-ascii?Q?opryLLpPRwIlLQKhYkEZkik6t0ByXkgfMWuuTAy3xBNmKKK9HVchCxT79q3D?=
 =?us-ascii?Q?9lMZZgGYAtvInRFdTQjKpZ151j6iic+dJOdf+7y0F00C0ohfb0yLPazS0AXx?=
 =?us-ascii?Q?7EPQgNnQTTco9xDeEPN2B4yTucVWMLc3R8oZRnqs9Tl1rPUanvZ1cQ8C6z1Q?=
 =?us-ascii?Q?9r1C3F2i7n2SbyOnRDeui3JxzdEfUBaiOm2whrUeKgMsBz/vuBeqvWWN00y7?=
 =?us-ascii?Q?H/o+lL0In9TTQI0Zldy5XshyVCB4WduTc5tJYLbKsE8q+1QKBrXdUAHBpLQ2?=
 =?us-ascii?Q?/6mx8ervPmSvX0dTyZmgVdg3NdUDi4HtXz0Jin16zVWHBnmNgM/s1Cm64RYz?=
 =?us-ascii?Q?fkWjsvJPw5A1egRl4i6CeMkKg3Cp6gahUL/Qtwe8VBPuAKhFz4/nsvxHxde4?=
 =?us-ascii?Q?1ABuLZr6ZonUONwqTkyI0ZR2BuC3AhQ5IFa5bggEGRA1Vy/wKgxUsqleT4wB?=
 =?us-ascii?Q?S1dTJ7I6ifGVlsWSKkmVUUblhubWCxVG+HIYl2udY6IWgIa9ncXjm8Jvg+y9?=
 =?us-ascii?Q?behAdLbmV/O18OoxFsDaoGeoqXmyy9x3stWjuzf2Mr3VryaoUKXOJVJK+rpZ?=
 =?us-ascii?Q?WpfBvci28RIebEmNR+z1cUWXJU3Ru3e73k2odQbDCTvL+tHvzatoUAXvpl0S?=
 =?us-ascii?Q?K9PaNwoFWaEwLI/7A3JkpPo6dymcosalvM0vw485F1UAFdGD9hqwtsMPpt7M?=
 =?us-ascii?Q?3GWAFbEzAdwy/EQ21ckcfB+BgHEufVMmqrGLj0Qfss1744dgCfTlgoffakR4?=
 =?us-ascii?Q?x0GSpABMCYLTyTzgEG+SMH08zYk2CIYSIEl3OdFa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701ab844-d1e7-461f-760c-08dd9db6c001
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 07:10:38.6956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHdpt9XgdI3wL2/RGg0awnnnu/wQ7G+EBIW/rt/5hVKguCEZYtHFWD3Jk/HXry2v+/ZlqVc8KGjE4YKTENg9pvw72JYC+OL6xZlBzxeIScw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9797
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

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 28 May 2025 08:05
> Subject: [PATCH v2 1/2] drm/bridge: adv7511: Move adv711_dsi_config_timin=
g_gen() into
> adv7511_mode_set()
>=20
> adv7511_mode_set() currently updates only the sync registers of the ADV b=
ridge. At the end,
> drm_mode_copy() updates the current mode, but the horizontal and vertical=
 porch registers of the ADV
> bridge still retain values from the old mode.
>=20
> Move adv7511_dsi_config_timing_gen() into adv7511_mode_set() to ensure th=
e horizontal and vertical
> porch registers are correctly updated.
>=20
> Fixes: ae01d3183d2763ed ("drm/bridge: adv7511: switch to the HDMI connect=
or helpers")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

The fix is tested with RZ/V2L SMARC EVK (ADV7535) and RZ/G2UL SMARC EVK(ADV=
7513)

So,

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v1->v2:
>  - Fixed Fixes tag.
>  - Moved adv711_dsi_config_timing_gen() into adv7511_mode_set()
>  - Updated commit body + commit msg + content
>=20
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 2 ++
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 ++++
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
>  3 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 90c9a3da2406..6150d57ff9af 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -422,6 +422,8 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);=
  int
> adv7533_attach_dsi(struct adv7511 *adv);  int adv7533_parse_dt(struct dev=
ice_node *np, struct adv7511
> *adv);
>=20
> +void adv7511_dsi_config_timing_gen(struct adv7511 *adv);
> +
>  #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
>  int adv7511_hdmi_audio_startup(struct drm_connector *connector,
>  			       struct drm_bridge *bridge);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 8b7548448615..b58e9e2c6489 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -738,6 +738,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511=
,
>=20
>  	drm_mode_copy(&adv7511->curr_mode, adj_mode);
>=20
> +	/* Update horizontal/vertical porch params */
> +	if (adv7511->info->has_dsi && adv7511->use_timing_gen)
> +		adv7511_dsi_config_timing_gen(adv7511);
> +
>  	/*
>  	 * TODO Test first order 4:2:2 to 4:4:4 up conversion method, which is
>  	 * supposed to give better results.
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index b12d422343fc..df8180e6d733 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -24,7 +24,7 @@ static const struct reg_sequence adv7533_cec_fixed_regi=
sters[] =3D {
>  	{ 0x05, 0xc8 },
>  };
>=20
> -static void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
> +void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
>  {
>  	struct mipi_dsi_device *dsi =3D adv->dsi;
>  	struct drm_display_mode *mode =3D &adv->curr_mode; @@ -67,9 +67,6 @@ vo=
id
> adv7533_dsi_power_on(struct adv7511 *adv)  {
>  	struct mipi_dsi_device *dsi =3D adv->dsi;
>=20
> -	if (adv->use_timing_gen)
> -		adv7511_dsi_config_timing_gen(adv);
> -
>  	/* set number of dsi lanes */
>  	regmap_write(adv->regmap_cec, 0x1c, dsi->lanes << 4);
>=20
> --
> 2.43.0

