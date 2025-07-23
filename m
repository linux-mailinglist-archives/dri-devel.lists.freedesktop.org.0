Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732DB0EA04
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 07:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E9310E101;
	Wed, 23 Jul 2025 05:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EIo+S+MP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0075D10E101
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 05:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx88MjHVW/ZZVRm8XUOgLrfAwAPRKlw6oFbup0PB01Rl+DWEhmnc4VkALtSscWeZJjtfNpUtZcTQJpNK2nyxdvDgCk7bTl5gtoFjreI+eBV+V9WPy+gfDPnXa80Pe8o6kx8UkPudtscUeiRLA8XLSMcwuQmexiGu5YfUEYNNHFpY5ehiOcfM1CQPNKqD2JPB+jOAWh9Lli5GqdQhFpvumOHdjQfB16gsPwIRHuIlhAxyM0SGnB1XTqHijFvNnM5Z79n3nfA343Ugpyg0a4/HY83upRzJNzWQ8va6hItcbD3ytMabsWnMqxuJqmpDNDS+3eXsNPerv9MT9I1bOhW6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvKUcmtTCknqOAuu/oHS2/6taaPTHgXm62g2vLcy2UI=;
 b=kFq3gNNvPr0JMs7A3BYOfmmMS9cLpsJPmxwNBzQ5spwSZJsm+/rIIG0ct/MvTCDqNkhbqw+V/4Jek6OorOjfyO+H2XLTaYbhtb9xO45He2+mv5e6NJSZ+SRmCtGd/pGeOz6JvNfy+NCzUkjkLsQXcc8REBNbWP7WGdN1XRwL+X+RqgpFkkt1llDAu0T45EG/0ACitItcZ5SY3cu15dOIcnKdwqVr6cqN5rij1FRpPWFZbpjrIUzI9ozjGJh+yPQ27od9c3K+1GnmdbP6loaQI4ufQc3tJ9E6Qf3VoOpdrbV1Pri/moXV3ANUd8y/IoLA1PkmvLgCMSIs/w3ahtEGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvKUcmtTCknqOAuu/oHS2/6taaPTHgXm62g2vLcy2UI=;
 b=EIo+S+MPDGJDZHOlWufkTOJUDvq1ZzUCpHM/yIhamP6eodFzlDy0unUWsXLo7DN3Skg8EzgYy3ZWGF2tVdzvjU4lI8Qq5stWryI2dCxrUPSgg2kv+4gK6UA5mK1c3rH/47NOYsMortiU+4NE6qkitAicKZ3WqiPiy9yWn2BIqQE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB12002.jpnprd01.prod.outlook.com (2603:1096:604:22d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 05:19:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 05:19:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>, "victor.liu@nxp.com"
 <victor.liu@nxp.com>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "lumag@kernel.org" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
Thread-Topic: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
Thread-Index: AQHb+0j82gVjHGc0O0C3m8cqDxBV/rQ/Kn1w
Date: Wed, 23 Jul 2025 05:19:10 +0000
Message-ID: <TY3PR01MB11346BB82F5A3EBA93493C125865FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250722204114.3340516-1-chenyuan0y@gmail.com>
In-Reply-To: <20250722204114.3340516-1-chenyuan0y@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB12002:EE_
x-ms-office365-filtering-correlation-id: 182a853b-9b52-45ed-92a5-08ddc9a87478
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9Crsgnyb9BVLvZsTywiTR8orwRWf7BIwpJxiaqwJMMU370ydCUQt/58TPe67?=
 =?us-ascii?Q?k7C+Wqi5hhS0e8OZScPHEKx6c8xOlH3YTjgnDBQcGQ8zMsa5QAN2VbmsnL7A?=
 =?us-ascii?Q?v+OqY9DdbzBKOjhAfFiC2Y11NXvWNmwlmHxRusYfeqcxiUHEgNe8VQB4j5+z?=
 =?us-ascii?Q?QDCjax7UUCRxZyhLAfNxcWNF1w+E5wfC/HGNlnHKti0KnSwiDEvFy4Pslj4o?=
 =?us-ascii?Q?bZkAXJWQe7tSsKie1hCgeQLy9NInxtU2IDTA6ugznrlS0klb/mKIF7LNGth5?=
 =?us-ascii?Q?7xQwnn9pC96NIhbkHlYgmR13jhlWCJ9cT+MVGMKO7w/rWvis0XEwqC74Q3xq?=
 =?us-ascii?Q?iJfHbzojzbvhk1WW65/eypRav/cgeMo679CLNg0dE+r/6J59MDtgfI9zElqc?=
 =?us-ascii?Q?KVZQYt9xd6L4722NP+JfDVCOe2PP3Jd9ODCbsaCyWgwgMJiNYiIB/MxMj1LF?=
 =?us-ascii?Q?4TsDnL2Tr0cXW69UPFpV/M02B4msvKw6jTCtSFLI8H8InnuVY0MgV9dt1P+f?=
 =?us-ascii?Q?jM6Lu4EqfePw9Ck8w6jNSMYw/424EphhulEB1zMh0LzGQ9XoQO0jq3cSMHNR?=
 =?us-ascii?Q?FfitbcsdzYu1YZ2/h9jHDxAG/x9OeVmK9ucwk4Og4qxMMpdYZbu10Q6hsi5i?=
 =?us-ascii?Q?ZB9eV99SOcbR2DHvTbFCJayisxI62QezGZFOkbm8W+9aUmYEw18dDmnkgnqT?=
 =?us-ascii?Q?pSYMoKETZgIuvTUHBgoSpP+2sR1jCPdfTO46gjL9ZFJHFQszlY0KEATE990n?=
 =?us-ascii?Q?pesBaYxFdNbOmnS3ukDD749RLPCedf7FCfzrSG8ekmgVQ4pn+AP9o2s4Vwv3?=
 =?us-ascii?Q?pPIiVHQPS9Re1b4LFgKYddHhJtvL3vXdJSKBT0yCoZ4/4LVpW/ffMECv3ZrW?=
 =?us-ascii?Q?wlr/aPlaL4xwaHVExvdRzudh2BcbOlh8ZTQHL5qVNM9GAKMcBEzvLUsOX3Tb?=
 =?us-ascii?Q?BH7wUNiIxmFFrMjM6Gkpz0lpzoOZWD6mbmMe/b189HgzpwoSfFGOEYG+QCzv?=
 =?us-ascii?Q?KCzmlXHGB07rEBRZAekMSDNzX/QsPsqiCGVt/88uS+GEEKSwvrrxwdoyju/c?=
 =?us-ascii?Q?eGRBCHAQvr32BC1HePlfD5NTTcrghE5OEkasTYACCDqnb1d/LEFoOKGSWVlT?=
 =?us-ascii?Q?ZDq6eaU/M98yjwCqU+uMUqsLzKqmIrmxGfI4fahZZxJxlHRO4Wwync3NgQaT?=
 =?us-ascii?Q?pbnG9BDBOaYh84O3HxMqhvV8LI58+wMAU7hKpCgvW6d/DM6xPEjZPjdsB/hT?=
 =?us-ascii?Q?28KHMfyMixXlGesltflp+MD2lmulgA5U1zgp4x2QA635jzF1HiJVK6ktP5qK?=
 =?us-ascii?Q?U6SyCLOsvCqX3uTUWxnuZrMZVxsFr2EWDzuIu6T7jaC/6DKwjbQ/qt8jH2KM?=
 =?us-ascii?Q?JV8RUa4XuLyzH4YjaDZbiM7aB65gT+2ztaCyppmexdXYc39yHYi2yQPIingm?=
 =?us-ascii?Q?TbX2mFGVHUsSAU9b8jmgP/vdkskivFRQep7tFZszUob8NZIWTUGAzV/wHO90?=
 =?us-ascii?Q?X1OtYuYV5ufcybw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?70Q8kYQ8j68IBy2Z6SIwDkk8QM0zditqlWWE/2oQ0F7eqI00Z/I5LmvkqCx+?=
 =?us-ascii?Q?CHbbAtJ7dzUnYn294yihOL1vaGxFed4sTKxOvxSlydxPv/9LiCBzQUM2OISY?=
 =?us-ascii?Q?0WQ2iUZXYXWnXaHlZAro+qkeKPv8Sq5LszZnKGG1AEYf3fS21SbkAdj1pshF?=
 =?us-ascii?Q?FZKJ/YPDdiiCJRN3tzlwbQMawhFUzxZsgV9tgheONDThD7reIVdyQBSzD//H?=
 =?us-ascii?Q?mgOYLbCwBRo6nro6+AiPp1eLVyvBt8/YU0/46YddkneRQ5/ViBAyX3framgb?=
 =?us-ascii?Q?oThzbRIk0M56FN3BAz0ttINuti0yw7zxcncbHpvyjQkPBdnR1LX1CK0NFzY0?=
 =?us-ascii?Q?7X/bVP8hLEYUkRFz8nZKiDGMNr5bq7/TWMIOQWAv6idU2cuLdWiK2PLMDV6n?=
 =?us-ascii?Q?9wx8IFudi0j1+9oxRgGKxasP3dbogLuNUeGmKdtp6rFpo2e3zcVB2SyUAZ2p?=
 =?us-ascii?Q?x7+oPs0FaebQ9785bgCrRUt4cVGBFv+/0kTmnKpgfnVdKhKZi08a410jUyvT?=
 =?us-ascii?Q?YnN8ExpaHJhP+mohLhZb+GDFziaSdM5obLKAiFDgJ1+oLNIStbIwV9HxAeBd?=
 =?us-ascii?Q?e99bMMuikJaZ99rnNNu1bbZkbKaJUOTMEIbbpLR6D6KrLWT9hkET+qY503JN?=
 =?us-ascii?Q?DkTBwbb/TQzlgRj3rIhaK77vzwm3oNjXwg/M7S5J7q9cke2e+8Ttd92WuKVS?=
 =?us-ascii?Q?rPAXtOgy2KSO73y1F+flBwpRe05y9lyKni0K7qo3/t6W9Vzs5/qp8Y7bjzbs?=
 =?us-ascii?Q?9t93lEmePZHFtxJIngbjqTgSc1G8nPPSP/VlulaPAW7Er7id8YkGHPTPyN76?=
 =?us-ascii?Q?e2LeaaCr8rDZFZeDSwUS3oF5pN74nSVdu4NKjK3OnMFlI6sc6xgZ68xUDW3v?=
 =?us-ascii?Q?mSmiZIVUYxpd5oVnxqmSuzIVUxmR71q44/6Yd7U/NbgzwHDHyB9IaH8bd6Hb?=
 =?us-ascii?Q?QFPDJmSrT3JJqM5oIV29yXhbT+T+tIJJSm/YQQi7dRzkVfSgSTEBA8dcwpy3?=
 =?us-ascii?Q?eHR4vJQon/vnBeF1EZ6NGIXn198c4CoJomzm5tzSnSPvJhWh8aOJaBCZEg6N?=
 =?us-ascii?Q?jW0KPhII9m84c1VsJylXl8DjI4XxAMv9T1li2G8i64mTZXOU7j2XpFOTngWs?=
 =?us-ascii?Q?Adnntk58+9Y7n+YKe8tpmNbpMrHaBkpB8vkSA1m/U2+meC0hiB3caQYWjruZ?=
 =?us-ascii?Q?0ua2IMQnY3zFa3cJJ4O+D7DV3MO2rOt2smfNNkWFShtQnF1ugmVm8cZ6r1jJ?=
 =?us-ascii?Q?8e3ix3r9Gh/LnU8wGLIYwtJOfIULbLaJXBa02v1O8mYEo6sB663CkkrVqVnW?=
 =?us-ascii?Q?tu19rGhd4x+1vCyDycPQBrL3Fa71RsP6LrMSecj5uU15soG5WqNhAhD9T3rg?=
 =?us-ascii?Q?qWK1Rf1Baq0MiPPGXb9SKL4k84i6njRYnb61uoGCA6Vtx0RIMQNxJ3LmxlY9?=
 =?us-ascii?Q?7JAZrwQJ+0WtmzjSL9NIGgAW5+v5pXXlTIyEFSZJ1hFblcTykESn637/Y6wu?=
 =?us-ascii?Q?Jf9N9UAoUjEm5pNSnrUHNdhTsB30KXzsEVfeJY36teXM7lpp3EjqTTywoPqF?=
 =?us-ascii?Q?rfX+zUxo1y5huo3cPjieJh0yWdYuwcvMYJaH5Olxl3b1R18EXHeWt4p+r+g0?=
 =?us-ascii?Q?4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182a853b-9b52-45ed-92a5-08ddc9a87478
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 05:19:10.1915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8vihcMP5YKYA6RlO6t0oTj7m7YtQm6mBirBTX5Q5FA21i8wO0Uf7MdvpxDotKfOGdnbTHkjg4N6KsyTt1q+9oM6YL7zJgvavSMoItbsRfBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB12002
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

Hi Chenyuan Yang,

Thanks for the patch.

> -----Original Message-----
> From: Chenyuan Yang <chenyuan0y@gmail.com>
> Sent: 22 July 2025 21:41
> Subject: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
>=20
> drm_atomic_get_new_connector_for_encoder and drm_atomic_get_new_connector=
_state could return Null.
> Thus, add the null pointer check for them with a similar format with it65=
05_bridge_atomic_enable in
> ITE IT6505.
>=20
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")

Normally Fixes should be above Sb tag.

> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index a3a63a977b0a..3a20b2088bf9 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct drm_=
bridge *bridge,
>  	struct drm_connector *connector;
>  	bool is_stable =3D false;
>  	struct drm_crtc *crtc;
> +	struct drm_connector_state *conn_state;

Please arrange it in reverse X-mas tree fashion.

>  	unsigned int val;
>  	bool pclk_high;
>  	int i, ret;
>=20
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);
> -	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	if (WARN_ON(!connector))

Why WARN_ON everywhere? Can we use dev_err instead?

Cheers,
Biju

> +		return;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc =3D conn_state->crtc;
>  	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
>  	mode =3D &crtc_state->adjusted_mode;
> +	if (WARN_ON(!mode))
> +		return;
>=20
>  	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
>=20
> --
> 2.34.1

