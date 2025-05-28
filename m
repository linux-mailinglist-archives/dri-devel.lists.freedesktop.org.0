Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD6AC62AE
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A710E1E8;
	Wed, 28 May 2025 07:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N86TvBXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5967310E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHehM+2F2ggy9635LsiS9O70fVSmEsV+tuu6wKQYm5tkY0kpEE1R5C5JIwu5JB6BMXxqNBzT9aQaA6EgQTSIiqjt3Bpm3nShj9mAaKE2n1co7IVChaV4yImp2NuwHJslNSKR4djk4MJwhA5amRHA8U7zT194uqn9M9Fg+6tXe/SG2QnYBtyCicmEhj3lUdwRiSJaFLQE9PjXjBAwiIpOCsV3xvCCbAR/6+MgnyjPRmuVETiGDXcbQQMs+3ECUjDpqmmrOVpA9XlsZDmEv5GRcfsobeDLNDOcg0RG+zPLlbPbCx70wfnWv1Vq/6Mosb5KN4Y6mrdZEdOKvqk+Hfn9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+N5EEfYaol32dJnTXEiFdEq3Lv9niEE6N1H0z7+Mjk=;
 b=eJP5b535yG+RelDzweYW+xv72aDiML+Z+K710rUpomppTV48PJZIEd7pgXkKddHNrFhBNLPuiuUisj1ety0sBRNkOYhLn1aR+a31g+aXpGm117bx+maUiF5FtdxeXFgk1Ti4IJC7EJv2hTOE02pJQTu0lMez+ewXpntYu0EIgysAd9ct66vUCV9hxrNjmfU0YhzAX71qpVrJKMj4lkwl9PVe3usU1LF/i/UEZdUFj28FOcIIDuXAJYYj4P+1cwDhSWMHDFVwegd/wk5a0VCG5R/8Rakc1NjqOkPes6cltcGT6BcfGUEcVXffI4i46xExQHuuo+XAwmZcQw7Vzk52Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+N5EEfYaol32dJnTXEiFdEq3Lv9niEE6N1H0z7+Mjk=;
 b=N86TvBXCfCiq7opuAwexF9Ms8tcjFYyV5QaT9+56jxB+EFhgsigI8nKqdAacXb0V8kQdf6uQ0RFUm3nxMoNXm8+nf9dkID94jTF9v2doRUlnMQKXbVuo81ldMSIykwQMUze55UBhNUOuediG6aar3wcbbWB670AbZ+L6lwY50rU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9797.jpnprd01.prod.outlook.com (2603:1096:400:20b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 07:11:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:11:16 +0000
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
 Anderson <dianders@chromium.org>, Jesse Van Gavere <jesseevg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] drm/bridge: adv7511: Rename
 adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
Thread-Topic: [PATCH v2 2/2] drm/bridge: adv7511: Rename
 adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
Thread-Index: AQHbz57wikqM/+FvrUu1263IPzoOFLPnn/9w
Date: Wed, 28 May 2025 07:11:16 +0000
Message-ID: <TY3PR01MB113468B616E8D99B7E5E776C98667A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
 <20250528070452.901183-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250528070452.901183-3-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9797:EE_
x-ms-office365-filtering-correlation-id: 3107fca5-a4d1-436a-8662-08dd9db6d69e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bk1ZPDSt20XsZM6aX1pBgzDeFVyQGqUVoI8H49Y9U0HZuNTQnauLrCGYEuAD?=
 =?us-ascii?Q?4bKoz/26sz2j1wUaxJeBuUgQEDVw8y9lg8ZVXB3rJwoN4dCFmHpfz3dwI9g2?=
 =?us-ascii?Q?HOrIiogB80mG0L+m03Dxk70WfM80nJ62ghT2xaTvaD3XZNpM2MJCYrwzVedW?=
 =?us-ascii?Q?wjhkevl/Mpt0Ekyi0fqgXmandmT2RT+bhgqVjjthhuDEjBztbFa/ZU8C86Cx?=
 =?us-ascii?Q?eVrEk7lm3S+BblFYNxwVL+Hj04Csp1l+NR+rhIl1dJwkoy5gz8v4wWDxjLvG?=
 =?us-ascii?Q?nMbigYn/+ZMRSELtl9+kMSBrFUKb61SKoSI9l7Ipv1R2BxCcCQA4Y7omo5bs?=
 =?us-ascii?Q?c8Nrw3nZc9QkuIdsZZIgCp750q3u3xk/7qPDQ6Gcq4SdQaDJyFkZ/mRQkAAU?=
 =?us-ascii?Q?f9ZkBi5dvxh2L9pVbB0PPhsLrCLlFs5Bu1rCek2uJopWa+vf8tNLygA6N/UL?=
 =?us-ascii?Q?Jy0ivFYHON4qLYoOYrFDNIkeqa5e80ifhvIsBge0wdCPLPhz099iIMSMSUAh?=
 =?us-ascii?Q?Nrqw8RKlCICEhLY/M1ZplWWC7MaZlOzvLOlEkOi4sSsth94gtnohVTTC42ST?=
 =?us-ascii?Q?HPUzN0ruh4qGGWkHBI8Z32py6HKwcZ4V4K1K0vJEEd9nOmG3EFtOPQKb5X6K?=
 =?us-ascii?Q?WOiI0d8gGydYxvnfJrdB9tVnQiVDR48CR5JAUwFaFuDbfgXYFG+WKrrYVO5v?=
 =?us-ascii?Q?q+hFCdKHaTAzUffmXB9TK8jrYwpTOMXcpdEujsFnb5ab7dUTymGT1Tcq+iE4?=
 =?us-ascii?Q?VQqwp1NMdUvM7BxU+DfYRVG0iPdjjGvuDUga1OmY1DGrVHRQvmaOJ2iXYG1T?=
 =?us-ascii?Q?jbLSbFRlS93vB1unTlv1LbYtD8DvX7Xb/oaWo+pUEu7PcQxligcWja+90Ikt?=
 =?us-ascii?Q?i+7k0EpHi0JQnyaZaAg9cmGxEvhPDJQmmn2NZau7IUdF9ypYDVcgklmumOfp?=
 =?us-ascii?Q?qMI0jJP5bU3kj5vt5vn23CQiKYro+QLHda5ce640/GIdC79ePDnHE3V5kftV?=
 =?us-ascii?Q?qtuzZ9BUq94X9kumD0GDDNYsYo04uj6rRp514FvOwHcmY2QgswQuI8nZgzfJ?=
 =?us-ascii?Q?cFS7LoX57kpmeZRAS2Lh7uLXW0cEiuKzKTDBRnJNuLFlxZSNwHD0clo6P2t/?=
 =?us-ascii?Q?EKEZjh26noKMwbiKM2r3B25a+ImkDXKa0ZIYVj6mGp9V1YuEhnQGcgq2NJDc?=
 =?us-ascii?Q?0wdJ9pJlAST5F89jAZuy9UXMfzUKwXCZKNkLuF5DyQkK4B7bY9orE2aMI2Z9?=
 =?us-ascii?Q?PEOl40dVlPyQJ2uBHfRJ1vylyrRMNSBEv75zYZDO3KZSYwOmrzIPEflIKm86?=
 =?us-ascii?Q?I/WRUm7PnWHazVdba87EHl+UwnJHLEDqeSsMIh7W8Ic6zf0WNfnvSe51Eh8v?=
 =?us-ascii?Q?mFfG0FuEpR4jb8A2zKw1ebaWAQf04As+XQbtmOrdJX/TQ+PGNKV8AaB8OQnk?=
 =?us-ascii?Q?iia4ccgOjDYDO1Ctmrm81w4jvVLIogQ1J1gghWXJplv3q67jP3Ukag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wtS/l/G6cquN7N5N5YfzIM6Zw8gv4xjEJUi5impvBU14a6YRrMYKzMAphErC?=
 =?us-ascii?Q?N04mC/bmPg+/o+u/EdhTk9Uh4OVtz36qJjC0G0IqWZ8NMmCPHur+LWBz4RbO?=
 =?us-ascii?Q?ssrJLza/ZR3RAfDGOM76uvoAZkHsSfQCqCFfdcXniZ7Y30x8N89AAHpJcJGn?=
 =?us-ascii?Q?jfx8szWfQ2w4JCOHGNdRqSaJyj5aHMr85ycPKBMEzP4GYMycUU9SvQOMjKb5?=
 =?us-ascii?Q?OI1pErlVD8XZNLXN1qj3+YLD7gWfnMskI0iRbV2jyVlpxODOADaLvHVSkUFt?=
 =?us-ascii?Q?06m4TOLnjvOa30HwaD+RICOqSPiDUzpjCKZZhTcU91IfZJiSk+jLp6I/MDfG?=
 =?us-ascii?Q?uAj2ophczwu94wtH5gRTTuYjtcKkCAffXRp3tZ+geWLpm10MSBq4Wuird4Ev?=
 =?us-ascii?Q?3nsx0AvUgufBTxHWBNRhuDF0+A/V0hy0a4QnRMGijBqvR2ZrZxed2++2BG+9?=
 =?us-ascii?Q?yEL+z5kDQkkeEg5IVulyriYOmbxXYRANI+qOiaZ6rV2zINF6WMvpkUdKlIZ1?=
 =?us-ascii?Q?/0d2hCE3HinfC0XDWzeWpgZibzTqwH9RQ1H2KkzB1ZREyD0bUL7MJVoWpnws?=
 =?us-ascii?Q?G1v3s0kX+67gg0a5NRnpOUa6GtSyEanspiUS5VJzrpvyI8mmIhp1DGGndK0v?=
 =?us-ascii?Q?e8h7zrLEnRJ5dA1emhCy/wPHbB5vXzmZmbYpPuNpgiyIdLpqN/RxIL+SjGUU?=
 =?us-ascii?Q?rGUSs4GD9Esdgc3NAxvXfD8pYZ2tqUfWAfYG2epr1rlzGsF1lGGzzbDrYb/5?=
 =?us-ascii?Q?OlFuENDmZuOCIJ654zi0f9hIZpa82tqH5gUN04GZuRXfa77NK/beaq15in6O?=
 =?us-ascii?Q?27Z3Zpjpg3NeWBrcjZ1++1gSccuhCO52unMrCgzJ5Dh+/WjSOuZmXVAHSWHl?=
 =?us-ascii?Q?bVAOMQd1OGjq/G27/SLH8GxGPdZqncYlVwzdHxiZdEzp+HVKqID9lVIfIBzH?=
 =?us-ascii?Q?sljIkDJFt1AV9UcU/8kWZJV1ZeQiZbZNBJWezNlLOYw3bfhFa4zqxbb6Kfoj?=
 =?us-ascii?Q?9L5edrkjWCGOwnvga0ZXVtRjs6CoTO0fF6M8BFFeIcfRwpdwzAvDl1GDMtHD?=
 =?us-ascii?Q?Z2Rti60KEJqrfwseQjJSGaXQskXQ2uc0mH0EhfYpbrhKRo+Oz99Ego1yhbTf?=
 =?us-ascii?Q?AyroYMrOOAzwWm+xL6rosfsJJgqQuU8kyt33rSRhV+bljYsKRnvVzF8Mw0TQ?=
 =?us-ascii?Q?v8q3c72diT/JkcPgmu723STaO/Kg1RCMLx3hYGlSTT6Dbs3XS2yJKcrrocYR?=
 =?us-ascii?Q?88S7rV4bkZcC5JE+ch6cmWJ85RSgfu2SmY2LR8tKFWZVjUuS4efqCQv2FJiS?=
 =?us-ascii?Q?I9ndZC1pp2RsyJXPJatGFn6pM0ODvVZhZDGYIcRYLsallnvljG9AHzATFWk9?=
 =?us-ascii?Q?zzy8aEPTy9WbE6Fvppz68E3wKE3QyqoL4oIr78zDaBOzbOzBKAP7vkvTXuEx?=
 =?us-ascii?Q?LXH9QMi2a8C70u9JstwS2NB6sIizHZH2MwycJalgbC/xcTvy4qKoYIX8kEZ0?=
 =?us-ascii?Q?bZLadteXVh0EtgoLLkMM/bnmb5uF0p3j8leQfHTSJASnve6ke3Phd5UpYldg?=
 =?us-ascii?Q?wh6o6YCVTg8mqIg4tsPr6i1u+8Q+8UK9Q+7UBMd5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3107fca5-a4d1-436a-8662-08dd9db6d69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 07:11:16.6666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYn/StKwACuubBhQeiEIDa/sOG9EUWEZLVA7WHPr2xdthdLYzvZ7LygZdZxxAx8mP7/u84inTopTGaWLjwgylPWpxibE29uYBjSL/XnFLpQ=
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

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 28 May 2025 08:05
> Subject: [PATCH v2 2/2] drm/bridge: adv7511: Rename adv7511_dsi_config_ti=
ming_gen() into
> adv7533_dsi_config_timing_gen()
>=20
> To preserve the drivers naming convention rename
> adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v1->v2:
>  - New patch
>=20
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 3 +--
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 6150d57ff9af..690ca3a5fcfd 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -415,6 +415,7 @@ int adv7511_cec_irq_process(struct adv7511 *adv7511, =
unsigned int irq1);
>=20
>  void adv7533_dsi_power_on(struct adv7511 *adv);  void adv7533_dsi_power_=
off(struct adv7511 *adv);
> +void adv7533_dsi_config_timing_gen(struct adv7511 *adv);
>  enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  					const struct drm_display_mode *mode);  int
> adv7533_patch_registers(struct adv7511 *adv); @@ -422,8 +423,6 @@ int
> adv7533_patch_cec_registers(struct adv7511 *adv);  int adv7533_attach_dsi=
(struct adv7511 *adv);  int
> adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
>=20
> -void adv7511_dsi_config_timing_gen(struct adv7511 *adv);
> -
>  #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
>  int adv7511_hdmi_audio_startup(struct drm_connector *connector,
>  			       struct drm_bridge *bridge);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index b58e9e2c6489..a687b3c3fd95 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -740,7 +740,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>=20
>  	/* Update horizontal/vertical porch params */
>  	if (adv7511->info->has_dsi && adv7511->use_timing_gen)
> -		adv7511_dsi_config_timing_gen(adv7511);
> +		adv7533_dsi_config_timing_gen(adv7511);
>=20
>  	/*
>  	 * TODO Test first order 4:2:2 to 4:4:4 up conversion method, which is =
diff --git
> a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv75=
11/adv7533.c
> index df8180e6d733..188c1093a66e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -24,7 +24,7 @@ static const struct reg_sequence adv7533_cec_fixed_regi=
sters[] =3D {
>  	{ 0x05, 0xc8 },
>  };
>=20
> -void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
> +void adv7533_dsi_config_timing_gen(struct adv7511 *adv)
>  {
>  	struct mipi_dsi_device *dsi =3D adv->dsi;
>  	struct drm_display_mode *mode =3D &adv->curr_mode;
> --
> 2.43.0

