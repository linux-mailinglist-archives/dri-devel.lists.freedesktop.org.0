Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B509A3738
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8D510E8AE;
	Fri, 18 Oct 2024 07:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rJ32Q61i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9EF10E8B1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCuZboEsNQy4t1tHmjhR0T/xeEcyr02MqRSoNy7zgbg7ezcWYCU3NjPD1F0IglZWDoTobEvtqLSMf4CCcD9dX6spODVEvj3u1j9sWBf+0P4GUn1eW4suU+R2lRgOVC63qtx9dM+g8qAA+H6NMuayAPaqUy4gbjvA9IGnBrXs5nljCi/P/vvYHa+7BKEY4pajvTtHVKWiF/IwYh9zuiIOyTtLeGt+R4QlfnIGebn2QyLWRzMEFVyi/kf6y4HU4nkjzpXjSBfHEosCI2A/os+nJZwrftz/zJCNBRKZhUnvUatn1aCqXyyRS+YqjbGu3Pv/GhHVi9UQqGuzboAb5hEINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy0p3FVlgi+rtFyhz9fF6yNIvsjlQFf4AIYPz/WLV7M=;
 b=pbOE6YjGQ7anX+QSLiQhHSOnC9MGbTpsgBZh08b0H9w1Dhao8isf0+SbRPELZ2e9PwEfbZU3PIvpp70zhw3FBF3qAP5sO/3QhQnXRrC7ML8HzmOolpMy4RJ5V3Nc2JG4C+ErSwycRYpJeOtvkKhVOJEvp/HJRO/GbI/ZEBjqZEwFoXaQjUAu2xC0WVZwGI4QJVeP+5AKOqfqFbF8uZNaQMM+rexOMGVvYeP0a9kL48TfuWURerWR9HV4ibsfQJOGiIc1ylzpL/Z8kKRyuNWjoizC9Ng58YskqzoTC23BbVcVIs9kWR5kpeIji3z1CCOArkkQVjsUaBWK0HeJvcJxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy0p3FVlgi+rtFyhz9fF6yNIvsjlQFf4AIYPz/WLV7M=;
 b=rJ32Q61i7YCPIR+EgbPgJU8A/lVui1ybSD+nlcro0+Wq4G+GW0RqHAqUn9aaV0IMgVnc7vZjsKbP5QzbthMLlm/Ua/vuopdDNVZ7nEmwd2varLQ5QlroaNl1kL1kqQED1HOl3YVmfO2iBgGrmxMT+QbIjOP9DzWlbjolZhCoVbQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS0PR01MB5906.jpnprd01.prod.outlook.com (2603:1096:604:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 07:34:19 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 07:34:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "marex@denx.de" <marex@denx.de>,
 "stefan@agner.ch" <stefan@agner.ch>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Thread-Topic: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Thread-Index: AQHbISv3sPpwi6VcD0S7zRnbRJ8jF7KMHKyA
Date: Fri, 18 Oct 2024 07:34:19 +0000
Message-ID: <TYCPR01MB113325E42E2E31FB953B1CDF586402@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
In-Reply-To: <20241018064813.2750016-6-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS0PR01MB5906:EE_
x-ms-office365-filtering-correlation-id: fd16628c-142a-4854-5a18-08dcef47474a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7d4Ef5iav6DEDfNckpJ3xn4YRLwMMrmuvh762x3d0Ux1IUAttK38IqmoFWs2?=
 =?us-ascii?Q?gkb9xL8IDHiam+YSy7biifngrE3zGNuv9rAXVk0G80FmH4kVfAo+zuG75Dn0?=
 =?us-ascii?Q?J0OAYR8uCKa/ZQnGj+qArhBG/54XhXmXsm1RLAs2B/qohk04TiITdLfCXmLI?=
 =?us-ascii?Q?Ue7DMzKu6BQOpsDL/W/6lhGt6vR7T1iIjgjml5Ra7k/kMSmjkY8Ifi2GCVJQ?=
 =?us-ascii?Q?TPmKeKUu+D5fcucoy4HnYkZhRhQhw3oPb8H6d5JctvysnyEHeL/gBWblnGe3?=
 =?us-ascii?Q?56uo/RLr5oF+x2Z3y2b1csOlW0TlSMgPXSLHnx8LRMVL91Iv0T59vtzaytF1?=
 =?us-ascii?Q?FFbzfWn7zbr6Fy3sw/TTTBws6bXFFVDToYuMaNxjfsGqAh48gZJ9cz0QFAVu?=
 =?us-ascii?Q?8j3h0eHCdHXi8/HN5sfeKOXRVZzYLlbuPUhHJAg3lKtWMoQx/YlA8ytnZ7j9?=
 =?us-ascii?Q?eIoQwHyJumYMn8c/Wg76S9l4kBjxa1jwrZ71XSt2qd9mPX5LFs6hyTlJi6MF?=
 =?us-ascii?Q?THSUmYelfI5TIJrlDiX3SHDcZ3kATARtM+KSGj9Q2aL0rZvU/mSR3KBgjKU/?=
 =?us-ascii?Q?pTkEljEBL1r+vJT2+SohN0eQ7vvyX0KVGYfpHK76OobsSEOpZQc83iV7DQeh?=
 =?us-ascii?Q?ueeo/842K3tsIbti/H7POXTa6xy4pAOrZ51fTt43ghnU/NsXlJ8Mj+tg+kRS?=
 =?us-ascii?Q?8sHQANSauDQo+1g5BjoUMGS0pZXdwTlYoNADxgn2FVnPSNxyvkJjgg1oneFJ?=
 =?us-ascii?Q?a7js1g+mE/gnNoAuBvo1l8MZVHm41uutpk/Uz/3/pAQHhB4obRofOzSqBEtt?=
 =?us-ascii?Q?y8wimKEJb2gyoMTJnTzVacJKBO34lSGvByZoU+0CwYpLErjPEtJDalBeVC25?=
 =?us-ascii?Q?LDe/J8nXG5woL3jap8HU3CfC6xBC1e3UbZHuuN4khBA8wBr2/1fJPXlHoEXt?=
 =?us-ascii?Q?Yr475Bcz/nFXihSzztbxqx+1zN2n5nVHzBOkuS5aXGViv4aqMd6G1jq3nVkV?=
 =?us-ascii?Q?5iWsDb5cz8KiqmRAAP3q6fvE0twSmH2TuuNBU+GSNsHXNF4/tme41GEsFMt/?=
 =?us-ascii?Q?61ktR+w2+jkbEZSXmmJBgWq5j1evtK6YWMXL9aPSdIlEE4HqwGd7XAJaXkIL?=
 =?us-ascii?Q?SxqvI0Sbovl40CC6A8OP2GJEVZ6TgNvOx+odgffNsDo1I5q3RGpgm7shm0t9?=
 =?us-ascii?Q?zFyRKYITvftzhZ5vB3u4LXzd1JSXjPuPnIddrrDfQhcv/U2cxGC78E/aNunf?=
 =?us-ascii?Q?IN5M/gSIhnP6pw/C9z90MvOsRE0u6n8H8DF1kclZB34XXtAueWN2k0XkjySg?=
 =?us-ascii?Q?mjJ1rvxn4ZLoWJ2uHQWn1YRte8ShE+jTodk4UrtyvXVy/V08mCbsKLpSsk+O?=
 =?us-ascii?Q?TtHeJoQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3xBsfl0XsHbLBgjXKUwVBpFod28TyP3GQjDiVd2+NObJUR5QIwgIPehny25X?=
 =?us-ascii?Q?D1h0f/TL1aIB3w01jqNpQXj0opI686T9M38LgqTm2+nfpfGL33F3FYwnJBdd?=
 =?us-ascii?Q?ElgpiNeC6CCm45zWsMRNRB5PvM/uN7g2GCAu+/rHBmaHUDs8tdMz6qyqYk+T?=
 =?us-ascii?Q?8mLdUaX1Gio5ZHhj5vSepuMhrydd/GlyWNg2TjlbSrRk/daM3iKFly3j/wRN?=
 =?us-ascii?Q?8JKj40vXt8ep6Hu0XjXgJTn46Yw4AY2RdAnHepOpgfPfQ3LdoQCLp0F/w/Dg?=
 =?us-ascii?Q?MiPjX7XtKjnhW38c8AdJ/JnzWRkVWfSo4JESIxsviXHOb5kdl8ZP9cvn6/ut?=
 =?us-ascii?Q?5qgn+cQDPdpoQrBE+qOPvaIhPewdQh636yHNfCw7aqPUZLZwo3OW5hTvN+Q0?=
 =?us-ascii?Q?pcxJnWimx+h2nNlVBIRuVux3AHvgmXbeL/QNMTk3CkMyAPwgKiNvZkE27TAe?=
 =?us-ascii?Q?ceq8RYz1wB4rpqf4Yx9rJNWlPzSti0CaBZrQAGDvXw118M5p4MOA0dcln4gL?=
 =?us-ascii?Q?18VfrJrRES6glVNcUwm+ZwtAHz3S5VoSFh6ARE0euFyQnEcOHsjhNNYvqF/D?=
 =?us-ascii?Q?/qVQrW+wmc8QSLF0BqJhZo+0gpEJQsFCI0SYRiuJ1cpfnoLtS5vnyFUlI9Ep?=
 =?us-ascii?Q?afgHv7NDGte4meNhEghFOeTGnA40yNmTgBNB9Dz65PIRWrxyVjPcSoxF49kp?=
 =?us-ascii?Q?ZyY/SJDyUfF9ubw5jXg7kvjtXxzet6kAZTlpQ417RE05VnE8LfVGz4BwZSDf?=
 =?us-ascii?Q?BPPMKecJuZE3ipPhNUk4cpP6ovoOVM3wVbWaeu5d7lQmUAlVX/8B6cuhvoVa?=
 =?us-ascii?Q?LVZLnk0NvZN+yq5IJBR7HDqbOjZPpMzTZQsNd3y8UgT72K8RnC29vnIrU5cA?=
 =?us-ascii?Q?RcBXamFHhgz3NZtDmvBsEwokUhYm8XS9B55h2tmLLgDx/c79CYamKW1Aexjm?=
 =?us-ascii?Q?Bsc+HZLc82PT+0doELkHFhi1GGeUZZkge+jcfxK7A9njA2lzjSgI+iSuhpTg?=
 =?us-ascii?Q?UB6Nl+V4snAO4JCxs0B5URDuKOM14KtA0puA3FPgsBIDfKJc2Y+PBIo29F6V?=
 =?us-ascii?Q?WZ5mrXdRtxP+Fq9lzWc8sVEZITLgk6wxHquwTeFevvCQ6/HCtLwbqTHDII8Y?=
 =?us-ascii?Q?Jdb74RrjevU+e2ss2iiadpRFPxEApifiEPe/yrwvM5ZSiQ+9lhcXsuEXSmYr?=
 =?us-ascii?Q?H97gv/4UmBpQyT4F51LifTyeKn7fr/AnggLN/jTiC4jOnd/GQS2eLml3uufi?=
 =?us-ascii?Q?Zn8Q/nhTgCR+4X1eseJnso+5gP34fdQw4LCVtSWi1ZfnmNIcdTbW9o4iAR2W?=
 =?us-ascii?Q?c9luLETJvvk1FXBH128YETgtWo6kV19LFJ9VMnu9rL4CcOHnl8VZIMX+Mbzm?=
 =?us-ascii?Q?+48wnPVI/Grp/SLYdpF1PnAAi0Rd4vFxYfQAanFfEoTjX19OtmM8bgK7gf3Q?=
 =?us-ascii?Q?e/jvw3meoIn/11RSqL5h0LNPAilms7K3zYBHA5C65sSWKM64M57vhJgdyHrA?=
 =?us-ascii?Q?qSGMAowguw/3xK3N62lDeODLmvMIqEDH0DpDGr63n/LLxFjlMGnFiD7RN+BC?=
 =?us-ascii?Q?JJ+7hFhCeUyuZq54Wfuuo/HPj8nPmmMxB/hzt7ItA54DoV8cAP4E/oRgGEpy?=
 =?us-ascii?Q?6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd16628c-142a-4854-5a18-08dcef47474a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 07:34:19.7440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mb+dqfmqUGW/LeY+jTLkGYOW6d1ygZd9OJpI4qPjBVtGXaZbNdqv7bcVE23z2E7vf3ciDgEmnSEcthEG6ceNynx5ck9kV4vuDTuoP999CcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5906
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

Hi Liu Ying,

Thanks for the patch.

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On =
Behalf Of Liu Ying
> Sent: Friday, October 18, 2024 7:48 AM
> Subject: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
>=20
> Initialize a connector by calling drm_bridge_connector_init() for each en=
coder so that down stream
> bridge drivers don't need to create connectors any more.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfi=
g index
> 264e74f45554..06c95e556380 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX_LCDIF
>  	depends on DRM && OF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index 58ccad9c425d..d4521da6675e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -16,7 +16,9 @@
>=20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_client_setup.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -56,6 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private=
 *lcdif)
>  		struct device_node *remote;
>  		struct of_endpoint of_ep;
>  		struct drm_encoder *encoder;
> +		struct drm_connector *connector;
>=20
>  		remote =3D of_graph_get_remote_port_parent(ep);
>  		if (!of_device_is_available(remote)) { @@ -97,13 +100,25 @@ static int
> lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  			return ret;
>  		}
>=20
> -		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret =3D drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		connector =3D drm_bridge_connector_init(lcdif->drm, encoder);
> +		if (IS_ERR(connector)) {
> +			ret =3D PTR_ERR(connector);
> +			dev_err(dev, "Failed to initialize bridge connector: %d\n",
> +				ret);
> +			of_node_put(ep);
> +			return ret;

Maybe same error path style like above??
		of_node_put(ep);
		return dev_err_probe(dev, PTR_ERR(connector),"Failed to initialize bridge=
 connector");

Cheers,
Biju

> +		}
> +
> +		drm_connector_attach_encoder(connector, encoder);
>  	}
>=20
>  	return 0;
> --
> 2.34.1
>=20

