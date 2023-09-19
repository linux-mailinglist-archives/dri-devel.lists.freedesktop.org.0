Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BEA7A571F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 03:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03410E389;
	Tue, 19 Sep 2023 01:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC19F10E389
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 01:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/sqXSAPgr/qdmZclLrUPTpOJ9d6Nn/aXl0eoNXeqF0KRqDuRReJkqEJXWkXBymHFPdxl/Ay1If23Jth3Bn6Mt0mI4kGcQUaqx9PkLB3rCTzAo4jF+mmv3KdGt5xEASk1FVDN/JkUfQe7lGJkjME7nCCgTQWOx+22kz2IzHtr6qb7ikbN1XZ4IHPqivyWZ5ME7eCWFA0zWC1Alr3da8vIuBoUfVGYX44YhG1gB6dNvq4nJ4adA03vzx42PFq+hlHUWOyCCuR9bPwHvuqcjprCPM0mLRBRFTrUclbuvWva1AgJCgws6fAL7kAOXxXQZh5pEHP4BHrJfJIAXYVbloAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCDteOujEd/d9k0XooeS/VLA1fV7VyE8cWwaWhwIr1s=;
 b=b0jOmW6pDeDtS+lW20cGyIUjNDUiSPjhDovpQr0irHO+Li52X05nuGlVwgmyq9kBdE9FZCTBmRyzE9fGpT8cdpG2hgQwLV+DuE23Gsph7YZ0sE8qCEvo+yRVa5awDSteANdFvVN2WRPw3uTj/wUSyBKNp9i6vmY5ytT9cBHpTe3lzGzCe2EfC9VSQMPsszNfV1/rW/dZ8ibummfM6DRnfMf3m+UhvM5tP8vY5Ej7AaIAPVgu43W3Uq49KI+KjsUHPSEPf5Zyj14f7knwVQ3cCbj5wz+2A9ZgHJHvs5izSb5ShXj+3/k6xdAkmTsgvkz9Egfpyz6AyFGpHFuAgtBUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCDteOujEd/d9k0XooeS/VLA1fV7VyE8cWwaWhwIr1s=;
 b=omlcAY8Q/RO5kkAZ2zUp+VgiTcR7W77cq53Nub9M2/2dKcPLEw7V2tR+bno+dfCoAiHF0cmAwwpXhq/ND2DoZ0FNBGKBxejHCN3Znwp6EE0T0dXX47uwDjlTBqNzxmaumzAmbFrsqkOpGC/MRKyZmk4KTRRKy247f3DMPxh54TA=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 01:45:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:45:45 +0000
From: Ying Liu <victor.liu@nxp.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Subject: RE: [PATCH] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Thread-Topic: [PATCH] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Thread-Index: AQHZ6kDy3sEuq/n38UORlSaHmuHxHbAhX96Q
Date: Tue, 19 Sep 2023 01:45:45 +0000
Message-ID: <AM7PR04MB70466D88048831E48EBBBD0898FAA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230918150043.403250-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918150043.403250-1-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB9PR04MB8265:EE_
x-ms-office365-filtering-correlation-id: 8bd2893f-9e0a-4997-28e7-08dbb8b22449
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d9SodA9h8fVgEzDl0SSIXaQiimVQzMvhsQBuaki4UY+MGZtyYopnVoTxbnrCQbAJSgLCn0teBF5P6l4oS5pCn8COMTxO1XzATPE2gI2EPQj+Inw0LqG6UGRcW0SFnoZnvG874qtfw4RQFdMlIJzql8Nbk4hbNZarHsob+shgVtXDSUH/r7WWGvaUHzX5d812MTyLEPySsSH/DxXIrRyAL3j/YP3HBtiDS3c+der+uVMzXS7Et6ZRCUrvA5RBNLr8UYth9sMJiv1pKUFZK4YoHUsfe2X75ZsiPAS3B0BAb7AHQiU58zegULBlFqzCMTf77AOTXfdjNdJKIE8UYMiEXLjrzMdM17q20ktJyI73bQ/vcfILkXy1qQ5w9zEhTJTeKbl9GdMdPH3CFVP7sRQlQYSEr/wp/qMLy+PGQ1qcykAcYfmX35Bvou4WjhJOnnraxQeMu87PdWKqzfR+yuRxOnJS+Hf579R3jiTrmxnVGlgdV8wn1TEHH8/xX/9g/HhoXP3ZUSJYrm6OtuM++zTn0nGkzLdUFSe2UWMfjR47ITVWooKlnEKR1ymCa5QlIqzXqpH6PpLLEstU50cVmWEsSeuSr3GF4RRH9SNlMl/p0u36LU5DVzudWwsdNjVg6cFD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(186009)(1800799009)(451199024)(38070700005)(33656002)(55016003)(38100700002)(122000001)(86362001)(71200400001)(53546011)(7696005)(478600001)(66556008)(52536014)(64756008)(8936002)(76116006)(66946007)(66476007)(54906003)(8676002)(66446008)(2906002)(4326008)(9686003)(83380400001)(6506007)(5660300002)(41300700001)(110136005)(7416002)(316002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pl/wtKNPmHKfTXoUSXxuoivww5IOLD/FQBk9XHK4wktvCRkHHddUKxq8lMMl?=
 =?us-ascii?Q?1fzZ/gyikXPMOFXuNscd3nfsyJsVCO39yarrmHUF7ZgY/K71ab52qqJ+H5CA?=
 =?us-ascii?Q?FuUXQgzumsQW7MMnMutjAab3S2hV29UVNrZ8eSVu7q1WV19tZq2VfxBBGQTz?=
 =?us-ascii?Q?jBJSFHZmIPUVu3Tz1XepfCgV4OQS1DlXNL2RSGUbBk1Fmx32JiSqFqYFUj7G?=
 =?us-ascii?Q?YJ2g2ECuXnzRPp55Ju8v3hcn3PSjZi0AMAzWH5+dm7yY+cZqkMdGlM929Y9p?=
 =?us-ascii?Q?uI2LX5YtduLvQjD48F6gg4wxBAWUukAzgLBSY2azXs68NF8ieGC+5vWNuOop?=
 =?us-ascii?Q?Ah+FloTAbPhPmj9IFMqNHkHCnAChuOkCIHZni/jU0EGBNgMWEubTtEV1reTo?=
 =?us-ascii?Q?m9eBug3JRbluvErndNkOrVXq+wkPB6NdnNZ6PwSp7/Uzs6QNkqcnc7bIuj/Y?=
 =?us-ascii?Q?k7rhGJbQnOwPJovraNHLEEUvGADfub1D+XxgQ/7uoAzjcZ+qQRyNUleHfW62?=
 =?us-ascii?Q?QtTc8axqWijtYr2/sw3pkENn4Q7I/kV/CghnWHlo8JpTeG5neiyxjTuQJ0lD?=
 =?us-ascii?Q?ezHeqZGMXEeXIBaVCncQhs8Wv9LWVGX4IYmpcaQmZALrdiQTIYQscsnRfxyV?=
 =?us-ascii?Q?fWjix3iLvVTi5/5M5b0o64+naFuBqDhUIrMEp900v2R1/WxO4we17iQP80aW?=
 =?us-ascii?Q?swhdRhg+Wa8OrbEB7WipvWvZkbce24i2pBvpYP5y/s6Oj6sWEUg+rWMaOJvO?=
 =?us-ascii?Q?aqk7zgIRc+Kr5+TXigAIqFZCD1cQ/hA/MkjmPq0ZlE/rKRxZX65ASSggxdsA?=
 =?us-ascii?Q?998tvHxO7jkPXipGoH5lfuJAwwdpuS6a4BQZXo1FVxzHI8ZvDTIaQuTuB916?=
 =?us-ascii?Q?Fy/4xlaq5OTZ+ENnAwE0yuSkymikjuw1lqNUE3uU3IOqARDWC7dvoSyOSBiO?=
 =?us-ascii?Q?5/a/ns+5P0D+pHAyVPitj2AR19NLr3ArWi0NflHdUAvrzNUiitWdccws3Ev2?=
 =?us-ascii?Q?3iXPcSrPMhiQUOBTksHepQ3cJliIOe59UnxsHJgzMDxY8IzGe/EGEurdNE74?=
 =?us-ascii?Q?vQjle8Hrfsfo77l2mIbQU+ZLRqtkIZZpcwSne+iwO/AGLz7JE0yGNm+Ges4H?=
 =?us-ascii?Q?i3Me2V+Z4i2YjuCBKI5ytpJ2+y/Tl734vXK0Ld4sPVLP7OPq0TYi4/Jr+Alp?=
 =?us-ascii?Q?0Fy4/LA8K6hGkqoJb7EL/+WTGfbjH3VrFsnxL8EsAQpsKHiwUruG5X5x28Kf?=
 =?us-ascii?Q?KR7sjRAfgg8LThBnJwUBl2O2Wr2CfyWbf6ePGXOx6n+nAAS5vbBY6+re5vkj?=
 =?us-ascii?Q?WV8AD4CokhAADIEttvmDWG8mzFG2L+rlIvos7Sv+D4UqJb+lDRSmMfkQFQte?=
 =?us-ascii?Q?djTR0BUSbjWASm1wfJeIUCCwFzDx+Td4DXaog+izdvVQybLbcpW/5DZaPhvD?=
 =?us-ascii?Q?fcMwWHlFOYeyTGm2rBJir1GZ0z+OUXIDNEmx0tGeW4Vzt8cTp+i0nnTSIwsQ?=
 =?us-ascii?Q?pGcaPFNlyQHbps5kP+LZVGp6V7MFckfMHllYfxTq3y0CJeSnIue0hphHRe0q?=
 =?us-ascii?Q?GBDYScQT2vnrDxZIld0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd2893f-9e0a-4997-28e7-08dbb8b22449
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 01:45:45.5401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGD8U5tanqi2WTooVL8xKuhYAPd4gUaEf/eUVpxhfBvDNuDI2dwcq4x83e+YU+IKOL4zHFaUBcqNcAoSO0fQXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thank you for the patch.

On Monday, September 18, 2023 11:01 PM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:
> When external bridges are attached with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> the panel bridge may also get the same flag, but in the .attach()
> callback for the panel bridge a device link is added only when this
> flag is not present; To make things worse, the .detach() callback
> tries to delete the device link unconditionally and without checking
> if it was created in the first place, crashing the kernel with a NULL
> pointer kernel panic upon calling panel_bridge_detach().
>=20
> Fix that by moving the device_link_add() call before checking if the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is present.
>=20
> Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm
> device and panel device")
> Signed-off-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/bridge/panel.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c
> b/drivers/gpu/drm/bridge/panel.c
> index e00d2e94c751..8c507dfd589e 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -67,14 +67,6 @@ static int panel_bridge_attach(struct drm_bridge
> *bridge,
>  	struct drm_device *drm_dev =3D bridge->dev;
>  	int ret;
>=20
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return 0;
> -
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	panel_bridge->link =3D device_link_add(drm_dev->dev, panel->dev,
>  					     DL_FLAG_STATELESS);
>  	if (!panel_bridge->link) {
> @@ -83,6 +75,14 @@ static int panel_bridge_attach(struct drm_bridge
> *bridge,
>  		return -EINVAL;
>  	}
>=20
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
> +	if (!bridge->encoder) {
> +		DRM_ERROR("Missing encoder\n");

Shouldn't the device link be deleted in case of error?

Regards,
Liu Ying

> +		return -ENODEV;
> +	}
> +
>  	drm_connector_helper_add(connector,
>  				 &panel_bridge_connector_helper_funcs);
>=20
> --
> 2.42.0

