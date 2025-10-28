Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E0C16A67
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638F210E125;
	Tue, 28 Oct 2025 19:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="nBmXUtMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E392B10E125
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRiQE+scPMtDBqy91OQrz5EqNufZN6bAfjOJjA7UiT/90XOnYLkoqxGTjCCj5EjqKh86AnWAcgOVbozHVMZf4J3mQwbF4x4fp19jH0EeLFj/4qtPSZbr/knWI3KnZFeGN1xbPvw/oo/7uujbwLKsCeHcHD2ZQZXeTY0h4JpHZ3xwdjPAqk1+E94vXSTGDbUAKkCqh63B8z9rEGM4MSEsdJd4SNNb+sX3WZPtTckyBAOSIVlKuh+0elCzxiAes2dKgUixMTaJIGjWU3XxwXl2I6mitnl+0A0W9EYJk3QzOs91IJUDsrokjXbuUCaLJ+HML/MxDe6KWV3Phju53AtbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNUh+pknizo515pfzACfeo/NNWN44hcXKKHullE/dH0=;
 b=AFaNIa4Qjc17NgrS9+u549u7tHbwwfnPvNdRqTqlNzZOXtKyYu7JfZ5izvm/cI88sYnrs45lnMski+dcRTyQC+3mTLKAALEyMW/OwLWhsy087K7qlxSHi+F5uddvSjw3IvWHr1QnincgCKZxzpQ8ZX6cDkhByI4gQNZNi/TYYj5SUkUQ/My5lLvecxQl1yXQlqV6mSq6X7PI4dE2Sco01rEScHloAozEKPR6pF6g5gXe62o2dGLWfQZd8VLLltl0dSqhyJTT5J/cduLKcT7CpRrGSlJgl6eTX5EJlrdoqsEzOzlZnvSVeldfKiGjD9A2xgmGKakkK/CB7WJD4ks5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNUh+pknizo515pfzACfeo/NNWN44hcXKKHullE/dH0=;
 b=nBmXUtMQP5sGlFk2PwOx1VcquKEjzY9cezT6JYTKYJoAtvJh+3FpeWpJOa73NisNNUgPQ8xKLs8ACXXnLE0R3au/e1Xwtoz5GPF+M+/FOOtjYsgGdQvCRefNbMz67h5ehP2vIr7fWGqEdNWt81P5d22AUReTASsYI+N2H8JUZjA=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS7PR01MB12082.jpnprd01.prod.outlook.com (2603:1096:604:265::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 19:43:23 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 19:43:23 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcQ6/1iluAkL2rhkmyfDQl5Q3u3rTQDy2AgAej4YCAABg9AIAADeEQgAAbYwCAAAaeEA==
Date: Tue, 28 Oct 2025 19:43:23 +0000
Message-ID: <OS3PR01MB83193390A5D983E66DAB62528AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
 <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
 <OS3PR01MB83198C16302EAAB7D2A163DC8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346376337E4C12C677446C986FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346376337E4C12C677446C986FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS7PR01MB12082:EE_
x-ms-office365-filtering-correlation-id: 31ec3b3e-5cfb-44b5-50e2-08de165a4180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WIZOFtjXV73+GvDYohadq89VIJY5c2/KAZmwJM52o5aMSbjhMOTr7sf0Wttg?=
 =?us-ascii?Q?FWtDz27gKrisqWsdTpgLAKxQt0jU5gNahmUOxDmAL8oNGKpMjdotMMzP6GXG?=
 =?us-ascii?Q?59cQYmhsU4zoP9D5ziG2ycOwuaNM6QlIug3BRCIhKvm++ycH1hujgKeJL4LJ?=
 =?us-ascii?Q?nYjodhb1bDZpkUe4nVwBk1xEqPWy29lWM84tLUplmZrdV7DZjmuSRJBeBQIs?=
 =?us-ascii?Q?TthibC9nkiiGclbf/b41/8Z+aRMhEytSuHbtFb/vP04KYKXLVhe/W51eNZfU?=
 =?us-ascii?Q?41rd/Rldj4UEKYewVbxdqcNXk1raBTh6q7Y610GT2mXkF853NQG6z0WixyaH?=
 =?us-ascii?Q?8brr4Nm3rgxXYwQyZUop4LhyfjmtLIOwQe/q+rIGXF8TlllcpQCviiWKixSu?=
 =?us-ascii?Q?mOzvLoexejxckfhogFSPySd/5ZsY2lOvTHCMHJTwsjJ2kjJ+bvYLelfxYVc8?=
 =?us-ascii?Q?aMScG75fNuZzQOUi7NXPNSAywZlNpqz3VuRvzykFarWU1Jhnjz3LuFE+n6Bs?=
 =?us-ascii?Q?XLjmjn7jVFqWMZ1L5fSURb3xRXgQPqi8OIMxykcUPLsIKwCZwBjaUq07tQq/?=
 =?us-ascii?Q?ZjUB/n3O7acl8egLmL00p3T8h5iyysZs/kR80gzSrnzO3JFhi60DEbpWVmib?=
 =?us-ascii?Q?sn5iqflmK7zBIUE+dMVEkemYJyjy0pxl/OgAz9DyNrTGHD5NrGrOsFPNwNoJ?=
 =?us-ascii?Q?JRk0hckYu3Bf0HAsNivYsgsNIjtrke2mRwy1K0HodopBPSwna3Qr0scP5DoV?=
 =?us-ascii?Q?UkKUBXy9te4ifwWoUPyaI4r0yBqg1a7usaSl6NafG1TyLMArNwIhHm307kYN?=
 =?us-ascii?Q?99BwllTXpEgnYzDRqcFEVtoqJ5vIZHfVtP0nJu+OPob8K+aXfgJ8/XZgz83R?=
 =?us-ascii?Q?fyHc3+TnnNNRSeW/RT8Gu5ni8PnMvZ/v0peU01DGfpyxPnXAtGILGpQ6b05o?=
 =?us-ascii?Q?b8BtvQwFzlXTT8OaogUJXJsuh6SDc6d94yj7uC/2RLoibFwmgIWjUW/+w74Q?=
 =?us-ascii?Q?hV5q1Y9B0Ejv5yQ1QhIDeVg3JsmwwKfMcteg4ETyDV4X3k8OVudJetfRYHV4?=
 =?us-ascii?Q?rV60eYvvcVsn321n2dxwYDCylsaKjDhw1fMT0UtHi8QeA9iQB41VN+l6LSe0?=
 =?us-ascii?Q?IP3r+n3jJ7C2BFGQZafFj184M1L97jGkvO50bLIrUJZ+Lltw9E3D+QIz1qBT?=
 =?us-ascii?Q?rkU66djESMa5txVL+wq7fc1lqAL4h2OwirXcMPZiwUheDZOgoP0NA0BuuCK5?=
 =?us-ascii?Q?kbeVrLnC/Hm1afqTTJyNA0VLYdqZvCfMrVPp5ibWFD0tt7gnkP1z1Gf23VEl?=
 =?us-ascii?Q?FsT7Df1baXX3FrrNOmw2Gl8X4tiZ5GXo9NYPccHUQxXt3PEFl5x/e/lTPWjc?=
 =?us-ascii?Q?ACbEkYGZMrKwA17NvIzphfQj+3ixMVVLb1eczaKZdEt6I3wP/XRGaHGNaeJW?=
 =?us-ascii?Q?Bx3S/jjanYBXqnFliGPgtg8nC9omGCvBEwIWMrpKXdMUu2t7MEhAIrfrVMCX?=
 =?us-ascii?Q?0sgKm+Xi5FAouAc2ozpuLBz0eYyFgm+vIMxi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mpgRJxgpS+cSt88P0A7EWpR7Rti/TeX5PzrpjI2M46gzHRNXqXGN0W7wPgnV?=
 =?us-ascii?Q?gcIw2vPBOL3s4Begy5Pz1ht89eEK3j9k/Hcq75WTYvPaAbx7GN5yCCcHyooD?=
 =?us-ascii?Q?5gID5UHnQ21wU6oVd7PYpcIhGHhMrBYnFzo0jOlz0QoNXZHsF6Ma52+tid5m?=
 =?us-ascii?Q?0YpJSdoHw0wA8VMcuJ4o+A0NzsQhnEO8dLfVazs6DGzJcc66DTtc+0xvwdkJ?=
 =?us-ascii?Q?HWmWTyZvKmrE/DiNZXR4uvEsyZRlXcpYI4ItK4BmronDnQnB2tooXdo/0Yf7?=
 =?us-ascii?Q?GpjagOw78ln+qX5Vk7fL/O2TpJ8YsHG0zW4X45iFWMP7f4DGDUo0FdC1oTUj?=
 =?us-ascii?Q?Q4UUSgjAEOpO79FFr/85WXgD0JKiK9Wl+vWMydimsdFLaXCSyDIJkUMGx8Qp?=
 =?us-ascii?Q?n+uFta5mDRWr4OagPnMynRouGMiE97EYEgELwmJSpbG4xDcO5cKllZ9qPa3b?=
 =?us-ascii?Q?DAu7tpjZ5KS8a8cSgUVJSSjkyJthWEZ/ldtuwCcEtNrKovAX7bu8YkpSFG28?=
 =?us-ascii?Q?ExlZTbZv7atBWOKl6MyoYpOq6DKL/4SQQs5ZZiYKw3tJVMpVnwyr60ziEZ87?=
 =?us-ascii?Q?Cs2/EnpFGj5ZTdEhwSnyzveeBegZ2InnJpfDKeZOIqt25+GLhw9Fgl1OYw+N?=
 =?us-ascii?Q?MTtHmakSS5+OS23X7W2KNMcWAbFhrslTVUylclOKkFBpv9XJ33j9++UNPIwm?=
 =?us-ascii?Q?BJ9pq2QgQTldDVGRWPEnGML1tq5T4LmkDQInQDXsrKjD6znO6v38S1WP4Hv4?=
 =?us-ascii?Q?lkKJCjcM0kbnszH6B/g3cqpTE0aJBBokDINyu6nYSaiIUcZqaAxZGc5wIcDT?=
 =?us-ascii?Q?WIgzuxTzl1G/QT5I7hpzinhaqIsTmZwTUqXgwTSm0qQI2++lrj8qQa5lZVgq?=
 =?us-ascii?Q?DAe8NoidDycS0TL38i115BGjrhdlW8NK01Xh3U96iOiSpT+W3ocWjq7Parj8?=
 =?us-ascii?Q?vBu8y6s8XRyLxPSssaq/3NrucWqY8wQAv+j8SJjd+FEtoqJhxsZHUrGtq9m5?=
 =?us-ascii?Q?EVYGcwk5jKz1xHFZzzVev6/fqo4NI193PEKVqv6JHaMroHIFkEFtBcF2VznB?=
 =?us-ascii?Q?CQ++ohQXCbvp8Ksyz4tQezOQKQk6iAFSWCb3ClKaMChtuB2lckUJFd9BUjqW?=
 =?us-ascii?Q?irx+30oeXePMGvj0wgQjCUiZFvaKi7hu2B9pwtyNxvIxdOgB8DY86r2LJSkf?=
 =?us-ascii?Q?oRkibulkCn3BRTogbAIANqd58tqSZXjeGbryuirdTBpRU96xWULIW25iDIpT?=
 =?us-ascii?Q?DNyZp6WU5/cvrRjlLqdkg6ZvLvp95oJQ1gh0Ox/eOslNtOxDRzbM5nedQzFd?=
 =?us-ascii?Q?u/DILWDGObof6IE7vZo4u91ppLYdCE5w3xvf3F4H+n2jH6NWG8CCdJpJf12R?=
 =?us-ascii?Q?dW9QkMAl6EphvzOmii5BxNP0BI8ivf8gIrxsl1BdVQw152Lmld+fDALOXtEo?=
 =?us-ascii?Q?HQ9yFglm9VMtb4XmfmLd19KOwSYqKKTWXbQzKAQTj25Wxf/fGs0W8ujVdJCb?=
 =?us-ascii?Q?ojA4pakKLU90HVPm5xssLpFnMwqg+E8VER0baLGeSjTgA+EK3ofcLR97/XRJ?=
 =?us-ascii?Q?Uvp+4LukgCp9c5hLMeikkvNMbOWzMGO9aQnut1DG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ec3b3e-5cfb-44b5-50e2-08de165a4180
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 19:43:23.4868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGSKSQ25qOG79jdzcskhuDIwXCw/IZZG9wGlbHLymDnwV6FGWrlHNxOV0YiTntB7ZfnAoSYYZ7cy5MuoFn4NPO1H3uAJx7EQynyawVhVbSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12082
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

Hi Biju,

On Tue, Oct 28, 2025 3:07 PM, Biju Das wrote:

> > However, current defaults today in the driver are illegal for DPI,=20
> > even though they clearly work in real life on all the RZ/G2UL boards.
> > 	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
> > 	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> > 	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
> >=20
> > Side note, that code comment "Use clk src 1 for DSI " is wrong ...it sh=
ould say "DPI"
>
> Why?=20
>
> This is correct as per hardware manual page 283 and [1] and [2]

For "DPI", both RZ/G2L and RZ/G2UL have the same table and same restriction=
s.

Valid values for register bits for DIVDSIA_SET =3D  1,2,3
Valid values for register bits for DIVDSIB_SET =3D 0

Remember, this is for DPI (not MIPI-DSI)

You were the one that pointed this out to me.

The driver needs to default to DPI mode (PLL5_TARGET_DPI ) because for RZ/G=
2UL, no one is going to call the new API to change it.

> > 	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> > 	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */

So the current defaults of DIV_B =3D 2 is no good.
DIV_B must always be '0'


I just changed the code to this,

	/* Default settings for DPI */
	priv->mux_dsi_div_params.clksrc =3D 1;
	priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
	priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
	dsi_div_ab =3D (priv->mux_dsi_div_params.dsi_div_b + 1) <<
		     priv->mux_dsi_div_params.dsi_div_a;

And on a RZ/G2UL (DPI) EVK, resolutions between 640x48 to 1920x1080 all wor=
k.

Do you agree? Or am I missing something?


Chris
