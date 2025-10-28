Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22DC15BB4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7B310E600;
	Tue, 28 Oct 2025 16:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="kKTcNNpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC3110E600
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDu2pOvL++EIFAwmhENaeyOfD9tYQ53bgj5IYQCrGlYXP3shANmM5u7WbKrAe8dHdVGM8iXtFcW1psRNQhIU4MOmo1uKhFHSlX0bRoHfmk/7YwECe3nqauntx70S17DaxikNJaieRwiX5+99maOfN4ZD49Oufn4jJkv7Op/4KO2N1E1YUOD+2bl1Y9bZNLS6ijfk1mrT2oQSrCAivn48FUE+UFQq1LNLsuwdjAeLgCZPvpE53ZCk7W2hOH1GahF0Hw3oP9h7d0Z5iXMmf9+SnDI+m0OE4UNRKVcFvVCzSRxrSTEGuMu75Ok3UI1irIyDC2Ctnct3YzKTl3JEtv8aKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gelfl7/OFPiISTymFBhugEuM3KrrTV6Rsf2OorJi0Q4=;
 b=k09mpXznUYTcdJH/cmkDnNvuxCs74Jda91J21qL8ayg3gQwxprH0Esz49flTMcCMNZGVsy2ieBx61XTORq++eAF1ZThxDQiO+hRH0I3bq+wn9ao8w1RlxNQA7u2IH6D/rm8PeWT0xTkQVpyBKgIM6qKimRJhzN612y5BDYZgRAbKCTefIpaIaKPO0QvbLVC3OEOlQQ/W9cdO/nw2xMytsyjOoLOMnGGIcruj8ZUzSb0QvRGOan1ztw9gRKw9YsKnC2zqPamdWZiSfTWuyFZLI+Y4Vp53wb6IitUy8P8u2yYPC/To1Xskw+aR/+tMGyrWz9srr+Bn2z44QE9v6SnDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gelfl7/OFPiISTymFBhugEuM3KrrTV6Rsf2OorJi0Q4=;
 b=kKTcNNpzwPYnJJgStD3jn/Slf2N9D/6cTJw9/c3bjkyIWCXODY4TgL0d9+kjRUdflv6UCa+9VCllGEwYjksdEXGqUFT/UZVmG7RqVff+e07L7zsDA8HOzFXLOLhc24v4HrEEH+LdjoP2ptsUCQtSY6ewDiALlahZT4AYb0cYYIY=
Received: from TYCPR01MB8327.jpnprd01.prod.outlook.com (2603:1096:400:15c::5)
 by TYRPR01MB12664.jpnprd01.prod.outlook.com (2603:1096:405:1b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 16:17:59 +0000
Received: from TYCPR01MB8327.jpnprd01.prod.outlook.com
 ([fe80::483a:c2dc:6c8a:420a]) by TYCPR01MB8327.jpnprd01.prod.outlook.com
 ([fe80::483a:c2dc:6c8a:420a%5]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 16:17:51 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
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
Thread-Index: AQHcQ6/1iluAkL2rhkmyfDQl5Q3u3rTQDy2AgAej4YA=
Date: Tue, 28 Oct 2025 16:17:51 +0000
Message-ID: <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
In-Reply-To: <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8327:EE_|TYRPR01MB12664:EE_
x-ms-office365-filtering-correlation-id: b8de1f36-517b-4eed-2b76-08de163d8b20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9g5OCUw/FQdzZGsUDmUuyUs8Ru0izqxLIC4tl0aeoq6P4gMqJ/d5Ow4bcxDg?=
 =?us-ascii?Q?Xks8zVdUDgfR+E/QYUNXA6r/QuqMTBy+z6dEMtai1QnmaJWrexxM39ONjvry?=
 =?us-ascii?Q?jnlBSu9YezvlFlLuDYMrAMv9ld6a6yV5fTU6pw/YpeGuY5gpew4ivAhFUlDO?=
 =?us-ascii?Q?2fBCcVNNvPItCgU+FDCb/lsqNcqt1Ddh0BP1MHDMc67nOopXoCEAC0yT3Bg8?=
 =?us-ascii?Q?7O5q46Wv8JHeRr+HVG1CEiym8Y5NdF7TFP9HP1arovTKVAN48ek3SyvWHNvt?=
 =?us-ascii?Q?CDGhdrpEe02vu3+hq+OItRl4g+K6fCtVv6LUxksGBbmT8WmwS/BkY1Vb/65/?=
 =?us-ascii?Q?TnQWKIdJoCrCLXkbdeKctgWWcgNQu5COUk/lQXbMVVnw7WCQEwAAAP7m7+od?=
 =?us-ascii?Q?yhLYldntb8HvGBTJVXmkozyoGlMUQF2D7rrUOEe1u33uz48ejRwmRYMH2zni?=
 =?us-ascii?Q?zswx0teR9JQJttEz/WKdIQeVfgdDlpnb8Xmb2vcFlflNYgxejdejRnHdQehI?=
 =?us-ascii?Q?imAmjvDIBycarJwkdTuXLVizg5lYKOnzieZguxlwLmY0CCnKo4xWFHLG4qvo?=
 =?us-ascii?Q?X03hSIA5gvy9buVii+ksGshwbvSTQTb0D6W0iEShjah7SHApr/nWVnHUQcNt?=
 =?us-ascii?Q?kheEzl/jCZhm6NKxas4jv3/MaHX9IyGW4ZGscEtEUB3X9l/B8DJbNGvbqV8r?=
 =?us-ascii?Q?LzaKrLHu+DqPe7JZhyDxrtpdwY0830TQnCSNVKEd+WQL8Asp3+DCYu6wocMe?=
 =?us-ascii?Q?T7cHPSElWzfTNaHPtiOTFB/hCBdfsZysVgUfZqlIMm3kP/zoksfaO6MYmvmQ?=
 =?us-ascii?Q?/QIhGeVuzH0/WbD0oTU6AKBONBvdmSHMGb3uiufcN87k0CPspy4XJY5Y0ON0?=
 =?us-ascii?Q?Aq0CP2MWi3Z0dDHTTbJlcq2VKFAUidNyUBTy9mwGaqStniLbelz8HMEiUJwq?=
 =?us-ascii?Q?wCt6e5SOopbxV/i5gCV5ZahSDlaScUeBelyIlRMtXnOdO+uydCQ2NAh/ylV0?=
 =?us-ascii?Q?Rc3JIuxvbV8/mvNB1kRrjD06BjMTuNr7d1Yjuguod5kYneJ84xzlk5z6N6vd?=
 =?us-ascii?Q?Y73c4BdXvXGTLtDieMjOmJ9jQIvrjhfZGa0wcLjoTkUOuCj9lFiDhn/odMdw?=
 =?us-ascii?Q?NVsKFsLoas4rFaBCY1s9WoLHS/YVZqyquiKvoMdnfPMbdZa6gu+5BA7XdnWd?=
 =?us-ascii?Q?2OrKxpanzOqiNMnSILWzuJjJU3ndjCGHg8gYmieS4xwWfqwsnDp8EjNzL9Mv?=
 =?us-ascii?Q?xLuJRl7LKgc4Gv/QJpQqo4QVTEEM9flzDCvJgI2n0x2DKJ44m/C6qpH6bbUH?=
 =?us-ascii?Q?KSzK8sli+YY12umLUuECuHo1HvkljG7C+vXpApkfhPEaG7Mk1u/KdqKDSnk3?=
 =?us-ascii?Q?O9kQ4RQw8wz8twwLUSx3x7vCYMgkSFDmJkgk1xpjPsB4EQeq7Fh3uB00B5Z0?=
 =?us-ascii?Q?BP/OKKKzrCritE47eDMzs0qZu8N61NX3U6GdhLvHUuCgMjg0dzVeORV+FHJt?=
 =?us-ascii?Q?M5VuYJWri9nOcwGft5CugZyWnUgZ0wXBBM6t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8327.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D91UkD1hp338JQbJ1mXGe2QlzF9OUXnjHiww5W+CmI6M2V7Gb5uyBdlk+up1?=
 =?us-ascii?Q?12V55h9lvTHGQbB82CW/vUZww49rUqg5PBxBftBp9X5YNRGZGs73W/33vTLo?=
 =?us-ascii?Q?RvKxgY2yS9C/cVUQhWrrv7PqJG/GO6YzK2zO33LDy6Sb97QyffaAoTRgUbtV?=
 =?us-ascii?Q?gF0B9kWwd88fzuDis9RcOywspyoiCJsRz/wcffWwPaV7ErW0Z2IMiY7mAPof?=
 =?us-ascii?Q?I+e+NmTB4GPS4lp3M+w5eoo7Xyk59K12vXtugGzAjK55ajq6Wnsh/tBiUIWG?=
 =?us-ascii?Q?0yybgPkcDfEfQYgBwRips2RmJYlGNVh7lQul5Nl2L2vAW1mReOki4GbUlBWM?=
 =?us-ascii?Q?gqAsMOWYwgBa5DkDS+Fz78eYTG6kCKYTfXsucdiqWd2xZiIA+k5JhvKCXd8D?=
 =?us-ascii?Q?EZqIY3yvHTddiQIp8a7uaFt0MnvTQFZ0ZoIuCxTiHcC0Bw0ZwRNvwFXfIlEz?=
 =?us-ascii?Q?BQQxOgZCSTPXffcV8yoR5aSb09Sv/xxzpSGvfW1BRin4IoissCSM43lfwNRN?=
 =?us-ascii?Q?57D3byl/AHAs87N/S3uto5loZISqSZXneEzKub2SSQI0AHDxOW8AE4l6zrb/?=
 =?us-ascii?Q?zDXYZoBZW4EJEgUMcDi4+kIZq10b9n8mbTf6tk2DRkQvEr4EpgTxDb4iXiVC?=
 =?us-ascii?Q?pHCTFo1te4QjjiLftSGESC3ooJG1h4QsGQvu5zg6BIwhf+IS4L3RVzk+WGTf?=
 =?us-ascii?Q?dBw2+KEmyZpb3O3I8JZg6z22QYEVhAAZH3OtQAy7Hc5qLGzb3iAvecbSe1aa?=
 =?us-ascii?Q?dimScqs7gjnlSRzT9YSnt2nlLukCiwRqbZOWaFqYmnIqC3zRgY7+E8lXUDtt?=
 =?us-ascii?Q?D/NQkrTiaQ3IAkxaN5nv9llTY9C21/UOC1qZNJryTEY7zce6uKOgDbU47/XR?=
 =?us-ascii?Q?hu04FxXJXuz1bU7KGG/CuhOmXJ0nnfS3QGh6zote4L3ihSLYA7RnpuY30wDO?=
 =?us-ascii?Q?xyVUg7egQ9t0stXChTHxCTJsLQJh7kifNMhDtBA5rre6TZGQsx3FAtnJrcs3?=
 =?us-ascii?Q?4HUqB0wkR3B54epwMUtwp+s0k6oQFK+2/aiQFEhPJRdsU6WohdAk1p67L9GX?=
 =?us-ascii?Q?0VS2g6mKVN9gVMdUtfeWBIXpyb3raZXSCxHD1njrqbiaEqYOYQztCl7qsuhZ?=
 =?us-ascii?Q?jsTkD5TkEtBCB45r/SRFT9RF6HrE9G98Yobr95a/jqNUNHhTwl6rkD3a3B0F?=
 =?us-ascii?Q?daGvigyxxsPpZOrhbRfXcmOo8IRkfQUNBG0Js7ZS11MFbxkIQkKjTcDj3fNu?=
 =?us-ascii?Q?yvHw24V6up7rxWxA8Qgo5vDQ+rOFdUm8fXtIRNy4pZCkVekWSVMyKR0MBzye?=
 =?us-ascii?Q?C8t9W2xfPfz7OaZg77P3QUYxU7+knH1Xk09fcl7pPFOybYSqZsxXW4xWLzdl?=
 =?us-ascii?Q?lYo1Zntxfj5RpUbAkWo42KCJ23d+EUauiNzXBwQyd4amITJvNstHtS/4yY1H?=
 =?us-ascii?Q?KhDLemBVnHvmdxm3+fhm8FEoqj0XXIP3ALn+M5/vVFDLvcl3rARdaRo6lN2C?=
 =?us-ascii?Q?XSVNCUlZWh4paU10cuK73/r4xKKogt1tm+jPutTpJAcV3wymL81b2tlbfEoR?=
 =?us-ascii?Q?b/6BLJ5h3IXjaYDcPWJIt/QohpZ4o58dftUl/Jil?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8327.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8de1f36-517b-4eed-2b76-08de163d8b20
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 16:17:51.5639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fz2JQk47tx0uik9lN0w8BJ3JI14p6qnE23LLZ2wS0y3gE/GyvJrFswzYk9jaJdThUWEkNcjcrrATOhoLldZAOZzjBKRN3EprbrfB/K05xIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12664
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

Hi Hugo,

Thank you again for the review.
:)


On Thu, Oct 23, 2025 2:32 PM, Hugo Villeneuve wrote:
> > +			if ((b + 1) << a =3D=3D dsi_div_ab) {
> > +				priv->mux_dsi_div_params.dsi_div_a =3D a;
> > +				priv->mux_dsi_div_params.dsi_div_b =3D b;
> > +
> > +				goto calc_pll_clk;
> > +			}
> > +		}
> > +	}
>
> If we arrive at this point, it seems that these values:
>     priv->mux_dsi_div_params.dsi_div_a
>     priv->mux_dsi_div_params.dsi_div_b
>
> were not initialised by the previous loop. Is this expected? If yes, mayb=
e a comment would help?

Actually, I think I want to print out a warning.

dev_warn(priv->dev, "Failed to calculate DIV_DSI A,B\n");

I could not find a monitor that would cause this, but it's possible.
So to be kind to the users, I will print out a message so if something does=
 not work, at least
they will have an idea what is wrong.


> > +calc_pll_clk:
> > +	/*
> > +	 * Below conditions must be set for PLL5 parameters:
> > +	 * - REFDIV must be between 1 and 2.
>
> I am assuming this means PLL5_POSTDIV_MIN and PLL5_POSTDIV_MAX? If these =
macros change, then that mean you would also need to change your comment, n=
ot very practical and error-prone. I would suggest to remove this comment a=
ltogether.

"REFDIV" is the term used in the hardware manual to reference the signal.

> > +	 * - POSTDIV1/2 must be between 1 and 7.
> > +	 * - INTIN must be between 20 and 320.
> > +	 * - FOUTVCO must be between 800MHz and 3000MHz.
>
> Same here.

While I doubt the hardware design will change, your point is valid that I'm=
 not giving the reader
any more info than they could get from the code.

Kind of like the classic source code comment:

    value =3D 5;   /* Set value to 5 */

I'll remove it.

> +	/* Set defaults since valid clock was not found */
> +	params->pl5_intin =3D PLL5_INTIN_DEF;
> +	params->pl5_fracin =3D PLL5_FRACIN_DEF;
> +	params->pl5_refdiv =3D PLL5_REFDIV_DEF;
> +	params->pl5_postdiv1 =3D PLL5_POSTDIV_DEF;
> +	params->pl5_postdiv2 =3D PLL5_POSTDIV_DEF;

I'm going to print out a warning here too.

dev_warn(priv->dev, "Failed to calculate exact PLL5 settings\n");


> > -	foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> > -						 params->pl5_postdiv1 * params->pl5_postdiv2);
> > +
> > +	/* If foutvco is above 1.5GHz, change parent and recalculate */
>
> Similar suggestion for hardcoded values in comments, maybe replace "above=
 1.5GHz" with "too high"...

This one I'm OK with because that's the design specification of the hardwar=
e IP that's used in all the devices.
If for some reason they re-design the hardware in future devices, something=
 going to have to change and
the driver will need to be updated. So we'll deal with it at that point.

Cheers

Chris
