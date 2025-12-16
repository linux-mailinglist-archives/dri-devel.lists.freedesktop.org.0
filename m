Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D2CC15A3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 08:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761610E70F;
	Tue, 16 Dec 2025 07:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vAER+UoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E3B10E716
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQECItDfQ42VrpNuTVDtlMHAJjw2BD9e9ho6r6gZzn2jsXKoZSOFHTeYnQLLP5bXGz7VVKxERkh61wTA7DdMJ2Iq1xP1ILUaKR7sF+Bh7blyTRNn9Gkv0Xc9x38V6aACYZF4bJcDodcs8X8vFHwRiJT878ImRLeFdvpY0ZC0a+deZL6Ae//IV9Hm+qNcK16O4GhWM/KvAWP6K4L43Dz1QsCfAguuHcNsFUP6p9QOGMk8KG8we7YuwskcUivK1P5jPMTMLP/oMCeDejWkgHWBr17row+oxIwLFHUg+650sEzdvufzlIqbVVPXI009VK+u8cDTzmEVvOZr3H55XcCsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90M75u6oku4AloNUp6lEuxd/WfE7QzJ6r1x7NvSB61s=;
 b=rvo78D57jwR317rvF2/OjyW58wy8WjxkPzeUOnJsQQhqbI8r/Qy7fN/75SYCiMQYndgeWJp48YLpjbZoejlukCU0yS2IvxVTNoUREZRG/t/bXUTsiRodVErmBo8RZ4zAV+TTSUSerVMUZ3/Wqv+aM08Vo0gAwuZNOGNyGivUhxhaPfkbVDjPDDxpDWG4kwD5ddDOcfmKvX4hkXZ2gHykO8WRN9w2rn149QiABUTUhNqUqQpceqYqcs6cJRPOcevzvD+Z1J4KaSGtxj8xAQ1stOouo9gtB7lsI243vRVJvzu6miuwF+rIgOPHo0cXsiJ0i9nzAqWwHT1RsCCOEW42MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90M75u6oku4AloNUp6lEuxd/WfE7QzJ6r1x7NvSB61s=;
 b=vAER+UoJERWohqtCkEd++qU9nYGXEk0znNxkHwHC7Bozr9F+dJipCVww9iK/J4iqoyQ4RT9cT7PkTIGmR8VJwAU2FZkix1h6vNUUcXrTib/763bFFUAX2T7XoimO4ImSIUalFF+X+hU3uCtO736lk990JkuYau0EjYDXYKJocX0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11304.jpnprd01.prod.outlook.com (2603:1096:400:3d7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 07:46:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 07:46:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>
Subject: RE: [PATCH v11 7/7] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH v11 7/7] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHcPgnE34ZeLVoKlU6e5c+/R2uKArUkQ/Ng
Date: Tue, 16 Dec 2025 07:46:56 +0000
Message-ID: <TY3PR01MB113463F6D74FDB1EF8AA67CD186AAA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251015192611.241920-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251015192611.241920-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11304:EE_
x-ms-office365-filtering-correlation-id: 291820a7-520c-4e96-0482-08de3c77498f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?50vtXdWBxH8INEtQltGnePkq8qayGHWipTAWf6WYIpNMuFc93Umm5W+cajZA?=
 =?us-ascii?Q?YSw5xBA4TEIFE2sF0PJft5qGsv+H2W8u8kH9ZxOAn+z2b2SuCpCXpmkEhCHH?=
 =?us-ascii?Q?LtTSyD8YuVK4OI3khkm+SXrDB5xcSmnowaa99XmtmLdAZr6iL06VPFQvfns8?=
 =?us-ascii?Q?ig3zZ1dNyfDY4uUFUNq7Ex1aIWdP+5+oLVjO0msNFqDYzkKGeQdOO9I0NUpa?=
 =?us-ascii?Q?3iyYG3dnWmgU/bkAf+NzbxnK3gpEApzzH79GaeNpLjW8lCIjd+2Rxc/Ill/G?=
 =?us-ascii?Q?MEvcZ50FZuW3jJdj2mML2PSQ/nEfDjTQQF+u300K17hBrXJ7T0ia+HrUM5KY?=
 =?us-ascii?Q?cmHymAVFxUT9u2k+4bIta/HKW7TW5IPmkxrUAbIC726DhxRuHwB9xKWle/GN?=
 =?us-ascii?Q?6vUPpbrS5qJOgTFvBHuprIM9EQfZR/aNOL/Lqoe9sdoQvYrdrkUKvN0sbtVQ?=
 =?us-ascii?Q?fV0jgm70sNXYVzKjnRlsBksDOvVIkiiW/VmYte2bC0eaAx+Ik7baX07LB9+j?=
 =?us-ascii?Q?lkBtvpaTLkWoVQOZRcg0wfaH2/aE9UfHZ7NzNKuwEV/5HDc3+7Cw77ZO3v87?=
 =?us-ascii?Q?+ZDM+CzIqQ1B4v6LWuMxr1zYtUL/QaCZ/fBdZl8PvSrddG18aJwaJnf+GrEb?=
 =?us-ascii?Q?2aZAF1HI9jIqFtkXwfy4ybmKzZ5Y+OZqbFGSCF23oOxGz6hJxpBw4YZTgAQi?=
 =?us-ascii?Q?QTCzP3I9mW3Q/UF/Mta2jNY7nhzODrouxLfNMd+XIHHgtSYdF946LGkxnDGz?=
 =?us-ascii?Q?E8AB+0snocrxzkrEzjeIaBWIhi6W1D/GRXLGEKY2xr6lLBA35naawZ0HlFJ9?=
 =?us-ascii?Q?FIRd9s1L4YTNzgbhFfxQS3tseZHdiwU5xfwBOB7+rFvkjtdF4xYuCS71hmsN?=
 =?us-ascii?Q?RxfJxCbUoRxE616U4Efg9yHC7mvV86mMNms2akkM4erfpVCIl+M69TwX6diq?=
 =?us-ascii?Q?hw31cHc2FzWSefMpFZpIiZoKcY2wjTjHnjLYpV49p6fk80fHK7v5X2iQa0bt?=
 =?us-ascii?Q?iSTJ5xaZYl6RteSR+nx83fUtswA2//ffaBmIWJHhCThSAJuy/FL5PBgyFgPN?=
 =?us-ascii?Q?GD85J2lqWwzqfndp5jJmpqoIthynRBrI6dNE6SUJST42wZN6bm4YrQZB0UPo?=
 =?us-ascii?Q?imkQa2cHACpW3RwhcCxnpHNLoISNipM8ITrLddI8byFIuxIfXrcUaUvl3oJS?=
 =?us-ascii?Q?/eyYNmP4yXC+rAP5WIQAnfrK83buw5PQB72I8PDBJNthbYseGLNs285UOSHC?=
 =?us-ascii?Q?o7UaMo0+oLNgiHd8Gd0ybHkufJheychqJBg/JaFX1iR06rov1BtNJa1Q2mEC?=
 =?us-ascii?Q?sj+dWw/S0saKUjYciXTHvxdJxq903pAQ7zi3qbyLfd/fPoWTo3W+kycsFQaK?=
 =?us-ascii?Q?r0gIhI4PkuPsRvNkzrRfrT94zhN2InP9r51vNQQcBkGg/Dx7nrih/acevObE?=
 =?us-ascii?Q?mxBIZBfOpD9r+7v2FrzJxmXS1W1Zpaf7YKW2/v+9EaghMhV0qAqK2loZqXmq?=
 =?us-ascii?Q?HOkWFB/13LFzm7ULhh5XTJu+Kp5oYlZaMx5VRUBEqnyTQlP3BaeaP5b0Qg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PtKuFlWW9Qwu0DHBfK3ZdXPozS+FXErrVdN490Qj7IGAdu8AXL58wY18LGsl?=
 =?us-ascii?Q?p3NJ7h9s7xZGv0WJYr1zpWP41tpsovlyrOgtOFEquMFxhWa1+6lLX0IxViVV?=
 =?us-ascii?Q?6dIf7lddj9AyZQMha3k4hT7Y1x4scrSFkLgOrqG8OzpeWtywzn2BJgVC75uN?=
 =?us-ascii?Q?51vyy3Tzb29IWQ1gZ/O3nNxYL8uNBuaezqc5doiaWP63kG8XUEqVJv7h1kCt?=
 =?us-ascii?Q?DWVL8aTyZbyoIOi6+lufEmIQFWv0iHs/TYYKW7VFZloHzMKnedcmL066Ji3N?=
 =?us-ascii?Q?XO9tirhNYHKTY/pXCS6f47lCGSuqVTDxOlpGrATDHsleJx11A6pjI0A87LCT?=
 =?us-ascii?Q?l9eaREri+y4qItzMnkzh8Ailk8FrSdmtH4ZjiwnqaTJurDN8j7LaTyVsPuAU?=
 =?us-ascii?Q?cjrAN6C9P80HV05S/HWXna0rc1CvLpbw3vVYOUmIB2kgP9urXmX7sPVzgR1d?=
 =?us-ascii?Q?YMDEYkPUHP9Jw702hUivrhq17knDaxEYtSQyMzlEpvmYOmABHAG6XB6EWYuc?=
 =?us-ascii?Q?T+ZXiks4UavBKZErKsaLfM/PZOICatDEl0baQi+SjSdFrd2ASpDnkZY4QGMa?=
 =?us-ascii?Q?Pf6qIWNRw+5Up/bpxD7sGtSGs5f1rDMwfiTlAdY7+q1yA8MXJyvphAm3Raak?=
 =?us-ascii?Q?51FOFEmsAmPpWWfTkGdzw8uWemkE7goK1IFFCCDMy63gOMwBYNQC5AkbxS2+?=
 =?us-ascii?Q?kdi7b5WJ5ocCUuqKm5PWKZ2s1lvG5Lqdbgx6q5a8mwMnVDqNI6M+dfPZrhS+?=
 =?us-ascii?Q?FLdhYapS1iKPB5rSryrB8FVQDufxFnZ4Tx5NzJu+cxBmxNcAxb2XbKan67Q9?=
 =?us-ascii?Q?GXRB83cnSExN8YZbo0ftFtn/qeiZ35CX2pATR+NpCDVCsXKcYAGcjA/sqSbH?=
 =?us-ascii?Q?39ULy6t3a4Lj77F6iIUcsvvFdNjHAEwMxzi70nvRK+MsEGH2et5ZZqin1/Ye?=
 =?us-ascii?Q?W/380CwE71uAztiX14mfqVqe8SkfeVPdwXUEupdhTfFmAhYVooq/tnoJ0NwA?=
 =?us-ascii?Q?4wR5m9d/GvL1SWwwikZyMc2tGTt0/gVdr3yGVUUQLWdkRLEzfwxzSaorV31m?=
 =?us-ascii?Q?kfbdj2WKkh8pr1tql1XzgWm0lINfFWvL34HXJl6dlWzXBwWWcLvL85FH9VrC?=
 =?us-ascii?Q?czrd5+s50o2IN+D6YZRbc+o2L8v/BvZpS+tEamvncLK6MjZygPob2hIO78Qm?=
 =?us-ascii?Q?0kz+BzbcwS2pHCy1De+cJo6BfDchzIR427kg8FfFLC1dbolpexoF7ahFF8O1?=
 =?us-ascii?Q?BmwoUPRwqOEGrSXP5098L5RBHQ4jwajpqrmOn25VhlEORoh738CsDfZWwTud?=
 =?us-ascii?Q?LwMGjEUQuXNNbka6Ovs0bOcfvJtX+tnF9YY9BKEPau7SRcPXwsDTY7qyRNG5?=
 =?us-ascii?Q?2n+RQc1iuoJ6w4e6HPNEGK/0kHUOh0tOnEwH80EcMgurDLHpo9Q/8SeTvIe7?=
 =?us-ascii?Q?TtRI9W1I4RUvHBHZXOsp+Az+DEILlnS5ulPlR01CFwt3Wn81lmU1yzZrWsGv?=
 =?us-ascii?Q?BwriyeYD2I+pmeXuS6nOVSEX9GivOP/uzfaQdWhKb71ZlL6F+p0iWQsNBB9K?=
 =?us-ascii?Q?Rbr7Lt+FD5GGdhnwByUutNIwfksqVDP+UVBuLY0ITFPhoEaFq+g1TCtpF42p?=
 =?us-ascii?Q?9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291820a7-520c-4e96-0482-08de3c77498f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 07:46:56.6002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zE23eBwgCkE5/4aLJtXCCsOmnXJR9tyHG5ZuZDlC8qCgleLtV3HU0o55pQ2DZG3sN4Q4+rnorVgFe5JiekpXKjcWTli6k6GFDEXyiWFFz78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11304
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


> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 15 October 2025 20:26
> Subject: [PATCH v11 7/7] drm: renesas: rz-du: mipi_dsi: Add support for R=
Z/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the RZ/G2=
L family, the RZ/V2H(P)
> requires dedicated D-PHY PLL programming, different clock configuration, =
and additional timing
> parameter handling.
> The driver introduces lookup tables and helpers for D-PHY timings (TCLK*,=
 THS*, TLPX, and ULPS exit)
> as specified in the RZ/V2H(P) hardware manual. ULPS exit timing depends o=
n the LPCLK rate and is now
> handled explicitly.
>=20
> The implementation also adds support for 16 bpp RGB format, updates the c=
lock setup path to use the
> RZ/V2H PLL divider limits, and provides new .dphy_init, .dphy_conf_clks, =
and .dphy_startup_late_init
> callbacks to match the RZ/V2H sequence.
>=20
> With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in c=
ompliance with its hardware
> specification while retaining support for existing RZ/G2L platforms.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> v10->v11:
> - Dropped Kconfig change to select CLK_RZV2H
>=20
> v9->v10:
> - Dropped Kconfig change to select CLK_RZV2H
>=20
> v8->v9:
> - Updated Kconfig to select CLK_RZV2H
> - Updated to use renesas.h
> - Added reviewed-by tag from Tomi
>=20
> v7->v8:
> - Updated commit message
> - Simplified check in rzv2h_mipi_dsi_dphy_init() for PLL parameters
> - Renamed start_index member to base_value in struct rzv2h_mipi_dsi_timin=
gs
> - Added comments in the code for DSI arrays and their usage
> - Added comments in the code for sleeps
>=20
> v6->v7:
> - Used the new apis for calculating the PLLDSI
>   parameters in the DSI driver.
>=20
> v5->v6:
> - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
>   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> - Replaced 10000000UL with 10 * MEGA
> - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> - Replaced `i -=3D 1;` with `i--;`
> - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
>   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
>=20
> v4->v5:
> - No changes
>=20
> v3->v4
> - In rzv2h_dphy_find_ulpsexit() made the array static const.
>=20
> v2->v3:
> - Simplifed V2H DSI timings array to save space
> - Switched to use fsleep() instead of udelay()
>=20
> v1->v2:
> - Dropped unused macros
> - Added missing LPCLK flag to rzv2h_info
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 448 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
>  2 files changed, 482 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index bb03b49b1e85..5edd45424562 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -7,6 +7,7 @@
>=20
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> @@ -32,6 +33,8 @@
>=20
>  #include "rzg2l_mipi_dsi_regs.h"
>=20
> +MODULE_IMPORT_NS("RZV2H_CPG");
> +
>  #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external me=
mory. */
>=20
>  #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
> @@ -46,6 +49,11 @@ struct rzg2l_mipi_dsi_hw_info {
>  			      u64 *hsfreq_millihz);
>  	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>  					    unsigned long mode_freq);
> +	struct {
> +		const struct rzv2h_pll_limits **limits;
> +		const u8 *table;
> +		const u8 table_size;
> +	} cpg_plldsi;
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
>  	unsigned long min_dclk;
> @@ -53,6 +61,11 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u8 features;
>  };
>=20
> +struct rzv2h_dsi_mode_calc {
> +	unsigned long mode_freq_khz;
> +	struct rzv2h_pll_pars dsi_parameters;
> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
> @@ -75,11 +88,22 @@ struct rzg2l_mipi_dsi {
>  	unsigned int lanes;
>  	unsigned long mode_flags;
>=20
> +	struct rzv2h_dsi_mode_calc mode_calc;
> +
>  	/* DCS buffer pointers when using external memory. */
>  	dma_addr_t dcs_buf_phys;
>  	u8 *dcs_buf_virt;
>  };
>=20
> +static const struct rzv2h_pll_limits rzv2h_plldsi_div_limits =3D {
> +	.fout =3D { .min =3D 80 * MEGA, .max =3D 1500 * MEGA },
> +	.fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA },
> +	.m =3D { .min =3D 64, .max =3D 1023 },
> +	.p =3D { .min =3D 1, .max =3D 4 },
> +	.s =3D { .min =3D 0, .max =3D 5 },
> +	.k =3D { .min =3D -32768, .max =3D 32767 },
> +};
> +
>  static inline struct rzg2l_mipi_dsi *
>  bridge_to_rzg2l_mipi_dsi(struct drm_bridge *bridge)  { @@ -194,6 +218,23=
7 @@ static const struct
> rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] =3D {
>  	},
>  };
>=20
> +/**
> + * struct rzv2h_mipi_dsi_timings - Timing parameter table structure
> + *
> + * @hsfreq: Pointer to frequency threshold array
> + * @len: Number of entries in the hsfreq array
> + * @base_value: Base register value offset for this timing parameter
> + *
> + * Each timing parameter (TCLK*, THS*, etc.) has its own table with
> + * frequency thresholds and corresponding base register values.
> + */
> +struct rzv2h_mipi_dsi_timings {
> +	const u8 *hsfreq;
> +	u8 len;
> +	u8 base_value;
> +};
> +
> +/*
> + * enum rzv2h_dsi_timing_idx - MIPI DSI timing parameter indices
> + *
> + * These enums correspond to different MIPI DSI PHY timing parameters.
> + */
> +enum rzv2h_dsi_timing_idx {
> +	TCLKPRPRCTL,
> +	TCLKZEROCTL,
> +	TCLKPOSTCTL,
> +	TCLKTRAILCTL,
> +	THSPRPRCTL,
> +	THSZEROCTL,
> +	THSTRAILCTL,
> +	TLPXCTL,
> +	THSEXITCTL,
> +};
> +
> +/*
> + * RZ/V2H(P) Frequency threshold lookup tables for D-PHY timing
> +parameters
> + *
> + * - Each array contains frequency thresholds (in units of 10 Mbps),
> + *   taken directly from the table 9.5-4 hardware manual.
> + * - These thresholds define the frequency ranges for which timing
> + *   register values must be programmed.
> + * - The actual register value is calculated in
> + *   rzv2h_dphy_find_timings_val():
> + *
> + *       register_value =3D timings->base_value + table_index
> + *
> + * Example (TCLKPRPRCTL, from HW manual):
> + *   0-150 Mbps   -> index 0 -> register_value =3D base + 0 =3D 0 + 0 =
=3D 0
> + *   151-260 Mbps -> index 1 -> register_value =3D base + 1 =3D 0 + 1 =
=3D 1
> + *   261-370 Mbps -> index 2 -> register_value =3D base + 2 =3D 0 + 2 =
=3D 2
> + *
> + * Each of the following arrays corresponds to a specific timing
> + * parameter (TCLKPRPRCTL, TCLKZEROCTL, TCLKPOSTCTL, etc.).
> + */
> +static const u8 tclkprprctl[] =3D {
> +	15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150, };
> +
> +static const u8 tclkzeroctl[] =3D {
> +	9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
> +	41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
> +	75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
> +	107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
> +	134, 137, 139, 141, 143, 146, 148, 150, };
> +
> +static const u8 tclkpostctl[] =3D {
> +	8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150, };
> +
> +static const u8 tclktrailctl[] =3D {
> +	14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150, };
> +
> +static const u8 thsprprctl[] =3D {
> +	11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150, };
> +
> +static const u8 thszeroctl[] =3D {
> +	18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
> +	95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150, };
> +
> +static const u8 thstrailctl[] =3D {
> +	10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150, };
> +
> +static const u8 tlpxctl[] =3D {
> +	13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146,	150,
> +};
> +
> +static const u8 thsexitctl[] =3D {
> +	15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
> +	95, 103, 111, 119, 127, 135, 143, 150, };
> +
> +/*
> + * rzv2h_dsi_timings_tables - main timing parameter lookup table
> + * Maps timing parameter enum to its frequency table, array length and
> + * base register offset value.
> + */
> +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] =
=3D {
> +	[TCLKPRPRCTL] =3D {
> +		.hsfreq =3D tclkprprctl,
> +		.len =3D ARRAY_SIZE(tclkprprctl),
> +		.base_value =3D 0,
> +	},
> +	[TCLKZEROCTL] =3D {
> +		.hsfreq =3D tclkzeroctl,
> +		.len =3D ARRAY_SIZE(tclkzeroctl),
> +		.base_value =3D 2,
> +	},
> +	[TCLKPOSTCTL] =3D {
> +		.hsfreq =3D tclkpostctl,
> +		.len =3D ARRAY_SIZE(tclkpostctl),
> +		.base_value =3D 6,
> +	},
> +	[TCLKTRAILCTL] =3D {
> +		.hsfreq =3D tclktrailctl,
> +		.len =3D ARRAY_SIZE(tclktrailctl),
> +		.base_value =3D 1,
> +	},
> +	[THSPRPRCTL] =3D {
> +		.hsfreq =3D thsprprctl,
> +		.len =3D ARRAY_SIZE(thsprprctl),
> +		.base_value =3D 0,
> +	},
> +	[THSZEROCTL] =3D {
> +		.hsfreq =3D thszeroctl,
> +		.len =3D ARRAY_SIZE(thszeroctl),
> +		.base_value =3D 0,
> +	},
> +	[THSTRAILCTL] =3D {
> +		.hsfreq =3D thstrailctl,
> +		.len =3D ARRAY_SIZE(thstrailctl),
> +		.base_value =3D 3,
> +	},
> +	[TLPXCTL] =3D {
> +		.hsfreq =3D tlpxctl,
> +		.len =3D ARRAY_SIZE(tlpxctl),
> +		.base_value =3D 0,
> +	},
> +	[THSEXITCTL] =3D {
> +		.hsfreq =3D thsexitctl,
> +		.len =3D ARRAY_SIZE(thsexitctl),
> +		.base_value =3D 1,
> +	},
> +};
> +
> +/**
> + * rzv2h_dphy_find_ulpsexit - Find ULP Exit timing value based on
> +frequency
> + * The function maps frequency ranges to ULP exit timing values.
> + * Thresholds in the local hsfreq[] are expressed in Hz already.
> + *
> + * @freq: Input frequency in Hz
> + *
> + * Return: ULP exit timing value
> + */
> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq) {
> +	/* Frequency thresholds in Hz for ULP exit timing selection */
> +	static const unsigned long hsfreq[] =3D {
> +		1953125UL,
> +		3906250UL,
> +		7812500UL,
> +		15625000UL,
> +	};
> +	/* Corresponding ULP exit timing values for each frequency range */
> +	static const u16 ulpsexit[] =3D {49, 98, 195, 391};
> +	unsigned int i;
> +
> +	/* Find the appropriate frequency range */
> +	for (i =3D 0; i < ARRAY_SIZE(hsfreq); i++) {
> +		if (freq <=3D hsfreq[i])
> +			break;
> +	}
> +
> +	 /* If frequency exceeds all thresholds, use the highest range */
> +	if (i =3D=3D ARRAY_SIZE(hsfreq))
> +		i--;
> +
> +	return ulpsexit[i];
> +}
> +
> +/**
> + * rzv2h_dphy_find_timings_val - Find timing parameter value from
> +lookup tables
> + * @freq: Input frequency in Hz
> + * @index: Index to select timing parameter table (see enum
> +rzv2h_dsi_timing_idx)
> + *
> + * Selects the timing table for the requested parameter, finds the
> + * frequency range entry and returns the register value to program:
> + *
> + *   register_value =3D timings->base_value + table_index
> + *
> + * Note: frequency table entries are stored as small integers (units of =
10):
> + *       threshold_in_hz =3D (unsigned long)table_entry * 10 * MEGA
> + *
> + * Return: timing register value to be programmed into hardware  */
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index) {
> +	const struct rzv2h_mipi_dsi_timings *timings;
> +	u16 i;
> +
> +	/* Get the timing table structure for the requested parameter */
> +	timings =3D &rzv2h_dsi_timings_tables[index];
> +
> +	/*
> +	 * Search through frequency table to find appropriate range
> +	 * timings->hsfreq[i] contains frequency values from HW manual
> +	 * Convert to Hz by multiplying by 10 * MEGA.
> +	 */
> +	for (i =3D 0; i < timings->len; i++) {
> +		unsigned long hsfreq =3D timings->hsfreq[i] * 10 * MEGA;
> +
> +		if (freq <=3D hsfreq)
> +			break;
> +	}
> +
> +	/* If frequency exceeds table range, use the last entry */
> +	if (i =3D=3D timings->len)
> +		i--;
> +
> +	/*
> +	 * Calculate final register value:
> +	 * - timings->base_value: base value for this timing parameter
> +	 * - i: index into frequency table (0-based)
> +	 * Combined they give the exact register value to program
> +	 */
> +	return timings->base_value + i;
> +};
> +
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg=
, u32 data)  {
>  	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg); @@ -318,6=
 +573,169 @@ static int
> rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>  	return 0;
>  }
>=20
> +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi=
,
> +					      unsigned long mode_freq)
> +{
> +	u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> +	struct rzv2h_pll_div_pars cpg_dsi_parameters;
> +	struct rzv2h_pll_pars dsi_parameters;
> +	bool parameters_found;
> +	unsigned int bpp;
> +
> +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	mode_freq_hz =3D mul_u32_u32(mode_freq, KILO);
> +	mode_freq_millihz =3D mode_freq_hz * MILLI;
> +	parameters_found =3D
> +		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
> +					&cpg_dsi_parameters,
> +					dsi->info->cpg_plldsi.table,
> +					dsi->info->cpg_plldsi.table_size,
> +					mode_freq_millihz);
> +	if (!parameters_found)
> +		return MODE_CLOCK_RANGE;
> +
> +	hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.freq_mi=
llihz * bpp,
> +					       dsi->lanes);
> +	parameters_found =3D rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
> +					      &dsi_parameters, hsfreq_millihz);
> +	if (!parameters_found)
> +		return MODE_CLOCK_RANGE;
> +
> +	if (abs(dsi_parameters.error_millihz) >=3D 500)
> +		return MODE_CLOCK_RANGE;
> +
> +	memcpy(&dsi->mode_calc.dsi_parameters, &dsi_parameters, sizeof(dsi_para=
meters));
> +	dsi->mode_calc.mode_freq_khz =3D mode_freq;
> +
> +	return MODE_OK;
> +}
> +
> +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned lon=
g mode_freq,
> +				u64 *hsfreq_millihz)
> +{
> +	struct rzv2h_pll_pars *dsi_parameters =3D &dsi->mode_calc.dsi_parameter=
s;
> +	unsigned long status;
> +
> +	if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> +		status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> +		if (status !=3D MODE_OK) {
> +			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
> +				mode_freq);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	*hsfreq_millihz =3D dsi_parameters->freq_millihz;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> +				    u64 hsfreq_millihz)
> +{
> +	struct rzv2h_pll_pars *dsi_parameters =3D &dsi->mode_calc.dsi_parameter=
s;
> +	unsigned long lpclk_rate =3D clk_get_rate(dsi->lpclk);
> +	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
> +	struct rzg2l_mipi_dsi_timings dphy_timings;
> +	u16 ulpsexit;
> +	u64 hsfreq;
> +
> +	hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> +
> +	if (dsi_parameters->freq_millihz !=3D hsfreq_millihz &&
> +	    !rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits, dsi_parameters,
> +				hsfreq_millihz)) {
> +		dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfre=
q);
> +		return -EINVAL;
> +	}
> +
> +	dphy_timings.tclk_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL);
> +	dphy_timings.tclk_post =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL);
> +	dphy_timings.tclk_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL);
> +	dphy_timings.tclk_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL);
> +	dphy_timings.ths_exit =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL);
> +	dphy_timings.ths_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL);
> +	dphy_timings.ths_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL);
> +	dphy_timings.ths_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL);
> +	dphy_timings.tlpx =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL);
> +	ulpsexit =3D rzv2h_dphy_find_ulpsexit(lpclk_rate);
> +
> +	phytclksetr =3D FIELD_PREP(PHYTCLKSETR_TCLKTRAILCTL, dphy_timings.tclk_=
trail) |
> +		      FIELD_PREP(PHYTCLKSETR_TCLKPOSTCTL, dphy_timings.tclk_post) |
> +		      FIELD_PREP(PHYTCLKSETR_TCLKZEROCTL, dphy_timings.tclk_zero) |
> +		      FIELD_PREP(PHYTCLKSETR_TCLKPRPRCTL, dphy_timings.tclk_prepare);
> +	phythssetr =3D FIELD_PREP(PHYTHSSETR_THSEXITCTL, dphy_timings.ths_exit)=
 |
> +		     FIELD_PREP(PHYTHSSETR_THSTRAILCTL, dphy_timings.ths_trail) |
> +		     FIELD_PREP(PHYTHSSETR_THSZEROCTL, dphy_timings.ths_zero) |
> +		     FIELD_PREP(PHYTHSSETR_THSPRPRCTL, dphy_timings.ths_prepare);
> +	phytlpxsetr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~PHYTLPXSET=
R_TLPXCTL;
> +	phytlpxsetr |=3D FIELD_PREP(PHYTLPXSETR_TLPXCTL, dphy_timings.tlpx);
> +	phycr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
> +	phycr |=3D FIELD_PREP(PHYCR_ULPSEXIT, ulpsexit);
> +
> +	/* Setting all D-PHY Timings Registers */
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
> +				 FIELD_PREP(PLLCLKSET0R_PLL_S, dsi_parameters->s) |
> +				 FIELD_PREP(PLLCLKSET0R_PLL_P, dsi_parameters->p) |
> +				 FIELD_PREP(PLLCLKSET0R_PLL_M, dsi_parameters->m));
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
> +				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
> +
> +	/*
> +	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
> +	 * (C) After write to D-PHY registers we need to wait for more than 1 x=
 tp
> +	 *
> +	 * tp =3D 1 / (PLLREFCLK / PLLCLKSET0R.PLL_P)
> +	 * PLLREFCLK =3D 24MHz
> +	 * PLLCLKSET0R.PLL_P =3D {1, 2, 3, 4}
> +	 *
> +	 * To handle all the cases lets use PLLCLKSET0R.PLL_P =3D 4
> +	 * tp =3D 1 / (24MHz / 4) =3D 1 / 6MHz =3D 166.67ns
> +	 */
> +	ndelay(200);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
> +	/*
> +	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
> +	 * (D) After write to PLLENR.PLLEN we need to wait for more than 3000 x=
 tp
> +	 *
> +	 * 3000 x tp =3D 3000 x 0.16667 ns =3D 500.01 microseconds
> +	 */
> +	usleep_range(510, 520);
> +
> +	return 0;
> +}
> +
> +static void rzv2h_mipi_dsi_dphy_startup_late_init(struct rzg2l_mipi_dsi
> +*dsi) {
> +	/*
> +	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
> +	 * (E) After write to TXSETR we need to wait for more than 200 microsec=
onds
> +	 * and then write to PHYRSTR
> +	 */
> +	usleep_range(210, 220);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN); }
> +
> +static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi) {
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0); }
> +
>  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)  { @@ -430,6 +848,9 @@ static=
 void
> rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
>  	case 18:
>  		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
>  		break;
> +	case 16:
> +		vich1ppsetr =3D VICH1PPSETR_DT_RGB16;
> +		break;
>  	}
>=20
>  	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) && @@ -1056,6 +1=
477,32 @@ static void
> rzg2l_mipi_dsi_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
> +
> +static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] =3D {
> +	&rzv2h_cpg_pll_dsi_limits,
> +};
> +
> +static const u8 rzv2h_cpg_div_table[] =3D {
> +	2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, };
> +
> +static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info =3D {
> +	.dphy_init =3D rzv2h_mipi_dsi_dphy_init,
> +	.dphy_startup_late_init =3D rzv2h_mipi_dsi_dphy_startup_late_init,
> +	.dphy_exit =3D rzv2h_mipi_dsi_dphy_exit,
> +	.dphy_mode_clk_check =3D rzv2h_dphy_mode_clk_check,
> +	.dphy_conf_clks =3D rzv2h_dphy_conf_clks,
> +	.cpg_plldsi.limits =3D rzv2h_plldsi_limits,
> +	.cpg_plldsi.table =3D rzv2h_cpg_div_table,
> +	.cpg_plldsi.table_size =3D ARRAY_SIZE(rzv2h_cpg_div_table),
> +	.phy_reg_offset =3D 0x10000,
> +	.link_reg_offset =3D 0,
> +	.min_dclk =3D 5440,
> +	.max_dclk =3D 187500,
> +	.features =3D RZ_MIPI_DSI_FEATURE_16BPP, };
> +
>  static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
>  	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
>  	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit, @@ -1066,6 +1513,7 @@ static c=
onst struct
> rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {  };
>=20
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-mipi-dsi", .data =3D
> +&rzv2h_mipi_dsi_info, },
>  	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi_dsi_i=
nfo, },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index d8082a87d874..2bef20566648 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -40,6 +40,39 @@
>  #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>=20
> +/* RZ/V2H DPHY Registers */
> +#define PLLENR				0x000
> +#define PLLENR_PLLEN			BIT(0)
> +
> +#define PHYRSTR				0x004
> +#define PHYRSTR_PHYMRSTN		BIT(0)
> +
> +#define PLLCLKSET0R			0x010
> +#define PLLCLKSET0R_PLL_S		GENMASK(2, 0)
> +#define PLLCLKSET0R_PLL_P		GENMASK(13, 8)
> +#define PLLCLKSET0R_PLL_M		GENMASK(25, 16)
> +
> +#define PLLCLKSET1R			0x014
> +#define PLLCLKSET1R_PLL_K		GENMASK(15, 0)
> +
> +#define PHYTCLKSETR			0x020
> +#define PHYTCLKSETR_TCLKTRAILCTL        GENMASK(7, 0)
> +#define PHYTCLKSETR_TCLKPOSTCTL         GENMASK(15, 8)
> +#define PHYTCLKSETR_TCLKZEROCTL         GENMASK(23, 16)
> +#define PHYTCLKSETR_TCLKPRPRCTL         GENMASK(31, 24)
> +
> +#define PHYTHSSETR			0x024
> +#define PHYTHSSETR_THSEXITCTL           GENMASK(7, 0)
> +#define PHYTHSSETR_THSTRAILCTL          GENMASK(15, 8)
> +#define PHYTHSSETR_THSZEROCTL           GENMASK(23, 16)
> +#define PHYTHSSETR_THSPRPRCTL           GENMASK(31, 24)
> +
> +#define PHYTLPXSETR			0x028
> +#define PHYTLPXSETR_TLPXCTL             GENMASK(7, 0)
> +
> +#define PHYCR				0x030
> +#define PHYCR_ULPSEXIT                  GENMASK(9, 0)
> +
>  /* --------------------------------------------------------*/
>=20
>  /* Link Status Register */
> @@ -130,6 +163,7 @@
>=20
>  /* Video-Input Channel 1 Pixel Packet Set Register */
>  #define VICH1PPSETR			0x420
> +#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
>  #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
>  #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
>  #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> --
> 2.43.0

Applied to drm-misc-next.

Thanks,
Biju

