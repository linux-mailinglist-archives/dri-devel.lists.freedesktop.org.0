Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E2C7731C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 04:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB1210E7F5;
	Fri, 21 Nov 2025 03:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="AZ1IB/xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFE810E7F5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 03:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr+ng5ttRRMESgkXGwAISa92FEu+fS+63QlGlDf7KgAUgsMNKA12opDyvaQLFR6jm8+wL8RQArJAbCep7JbcpONiY/ohiRyX24D/J5fSDyjc4fxFwcMObjlx8OHEs3OTaIVLGZZOGV71HXtZQMcYyb/VpzDvINaZXbnjeNCUN3UTBO5dbZIZYIP8/VPiWLz2R8xZhHY0yAe7sJNEKsuuS4xUCjus/UPo6nC3/4Om7mTtd6mjABMBnc+TymPZ94hIbeXsrFxXZk/PTNckORsT5vs83kSczG2G0jOFk6oh8+8hQ9WByFQ7T+BDLg2Xtk3Awc3HKgsUYyuXzU4xjkvPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh/m5wiy+EgJqoM7YkyK7hn2u4R0MzEvjPM02deVJ4c=;
 b=K7qXr6JZbF6TPfnlNceaZtd32kKLIb5bC0ypy85CacB1FdSjOGn0YjMo0OTx3Za1wTXoKS1a1ACqs8KEF2FNCv1JKYH7iST0m5um5QT0pHwKlDsnBH2l4lRLvj3eNjBXJoCd0qXcN1/iFMVO1imBsQ90sE6ulIsHHKxG/kGBS05Q0Oy6lMmcmBUldSIxHumkMdrt+/GqHm/lLImoqn2kyjxESOJTpMzS26QgwwtY4n968RAjrC8AvfbUW9S0xqjcCI4NZW7bXw0q4RpxDLnE+lqRlkWFdLVrcQjGdcc5NiP2DRmwXbOYlgd4nWEAvUfEBx2dBeig54Lm3cdEKKyBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh/m5wiy+EgJqoM7YkyK7hn2u4R0MzEvjPM02deVJ4c=;
 b=AZ1IB/xu0rOkpWoWgW55RCeqkouDQPA+8N5uMmq/rm0Mr3KPOYbVi4Y2SwOj894DF86wJtU26cYRP/JxC+H0XC9DtbikRmvVRMwRuXVZjEAmBB3APHCEPkmCo/lJDtJNleumRmLQm26/hqrdIrzL0uJCOMFWGhcF9r0WpeggSmA=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OSBPR01MB16290.jpnprd01.prod.outlook.com (2603:1096:604:3f7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 03:53:17 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:53:16 +0000
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
Subject: RE: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcWPwxRrBR+pEeF0OW1RdaNVw7mbT6p1GAgAG/NKA=
Date: Fri, 21 Nov 2025 03:53:16 +0000
Message-ID: <OS3PR01MB8319CFBD6CE82DBB2B6BEB928AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251119183135.85ac542b68c732b6ea9b7a4d@hugovil.com>
In-Reply-To: <20251119183135.85ac542b68c732b6ea9b7a4d@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OSBPR01MB16290:EE_
x-ms-office365-filtering-correlation-id: e856202e-9ebc-4d70-107c-08de28b18064
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PSnkGePekiq+kFZZqFJguTMUz5T1Dj95q0+T6IqSS+BfEpIgcGj+P5+wFTB/?=
 =?us-ascii?Q?F7rF0cuCOvifJ0DJaNDzirwVvwRcmEw44kPZIxL4erHEycZkv1x7fwXnHBg9?=
 =?us-ascii?Q?iDd62TcrZc3CeVwpra/hS9nfbFmV0Mu3yiGyVcoE/jokGPuV+54T0zrEtl3O?=
 =?us-ascii?Q?RZXnrBRNcSIldyhsd9PXOKV/X4E/rBss6oOGJcHYgbfYDtdwbqcPrQG3UBGd?=
 =?us-ascii?Q?hIMvRryscf1j2zxW4fvLa/dhYgdmOlI1HabfFBxE4C3n9EO0oEzxDuqAdi0O?=
 =?us-ascii?Q?xv+F+TK2CDyvr9BZZKRa3X2lUFAU7gdcrhSRgGOLdmu4XhoRNwypAG7BK74m?=
 =?us-ascii?Q?T3v5NOVTKABikc2vqdLYUrqZkpsbLADkx+mz097E8wrtZ9dyvi0axYjGYtUK?=
 =?us-ascii?Q?cWmP5GH1pW5d0M86PAGj7ueuswfSK05yVyWbN6/LS26hCpBuykWoqO8OP3ym?=
 =?us-ascii?Q?DE8cooQjrCD3WUjqdZfhFaVmv4G9h5PfsV9rCv2c2MH9+3ISb8orKgA07Iei?=
 =?us-ascii?Q?VaqUk6csVLTxnHf7M2xXIs2E90YMF3oC/ipBtm5vrrtRuFPzyvTwoeqgS0xV?=
 =?us-ascii?Q?Lcb0Vf3N3Wua9l6SlajfIY+cFPR54dFXdqOwK1Rj0l+TyUgCIATKOgciZRuT?=
 =?us-ascii?Q?7XXgAvKGq/MC1oTKImnKXzxFekOhKmYUhQs2V6l6m+xvnDiJuk3wZQm+NSPJ?=
 =?us-ascii?Q?Pf/yPWQMqL/4LdQqK8jzJlt81nehhaYVIMaBmufd2OpEQBHnA/KGyFUDIuqv?=
 =?us-ascii?Q?Aubp59y8hIbiXNhZrvqyUsXTd0ug8UKFo6otGmye6tPZpii9cfgKWGq0H179?=
 =?us-ascii?Q?cY72V01EI4BP7ZVsPvPDTsiYxcv93RQ5PDWnifMDkmKJKywCfJWe0IH2HI+6?=
 =?us-ascii?Q?7goPiCuofAhgiZt/l3sIiRp575BUg0vIL313u1cBGvYKgNbMfbjcPfJwO4VQ?=
 =?us-ascii?Q?6EwMRfQNGLMhl/Qdk2E1+BmMZWzsowWkby45hiP2U4pM5V+1xHTOxNcvCIS1?=
 =?us-ascii?Q?hYM3f+0mENyFLqIh7NmEE1I1Uqvps5nbwv0uqWTcN0/rQQLrFdYACCj2vv2Y?=
 =?us-ascii?Q?0zW8EljCoq8WRoPUmN0GiAhQ+QA3srfrhyf7M8SreqcvGYkrk1UJ8f9PL9ws?=
 =?us-ascii?Q?WWGrwiUAO7hUle8gesG+2TIBlwLYL1GbnDxytysTPeGKJ060ejZFO+phwh5R?=
 =?us-ascii?Q?PpOozPJkOwqTzZOIcNKouiwi+23+Jlj7gozt+0MPpEf0SrVujnYmNVnYUT91?=
 =?us-ascii?Q?KUbI0kNDNkyLk6IMUP+bLqOsBUGcVUDmpAJRx1tizaq4FSLJdG4DKoH/F934?=
 =?us-ascii?Q?zwNAQXGszGoPSZMUIufrfqLSaVARhZNeo0LUU1CBodUbuLIB+34Wc6I/rAPH?=
 =?us-ascii?Q?/M742wtW97/1OOYD1zD6ZIn7tSlXL9R7jqemYBuAcZbALiB3LTudd6Zb7xrl?=
 =?us-ascii?Q?g1H+7SfOxRNvXNAMo7nDoxOx/m9a3R7VVrhpNw0iypDDKzWsngTln/WViZMo?=
 =?us-ascii?Q?C/82ai0st8FG2T7ycIw5tEohEQPBC7DYceqr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6DW9Q4W+dtQuXPraU8vvIexZuyYWx7vcGr89Yh/lANKCM8Z4BnxmeahtpRkq?=
 =?us-ascii?Q?zcSeIS2OvKOf0tMdnHyiRn2zBsoXGmkSnp2KPtfv79bZB1aqRPyjZlLwmbnZ?=
 =?us-ascii?Q?OlYF30EhdwuzOoBkKc5x/LVY96dHtSpViIMo1Q1WPDuQSyZ/yxTKoWbqt/zO?=
 =?us-ascii?Q?ktOA3Zs+UTAAZqyl0juwP8nj8j0itur1KTGOn5HB3rCyC5IOxIaRWLUbyqYi?=
 =?us-ascii?Q?YKgAP/57K3uZIm+f50tP1+2Iwu83fI+yh5r5Whymm9XMYWDw/X044kMkh9oq?=
 =?us-ascii?Q?1PUtkJQHtyINq7xPCV6t6SEN99YcTiosbJozmE5/GTXzP278ovAXomVaTxIP?=
 =?us-ascii?Q?PEnet++HSS1Bg0uAp+/KSmgZVElsEjqTCKRI5XhxE3upiI//zJFVEzh7P44j?=
 =?us-ascii?Q?8k36Pj3CWlLW7U/SS7yfhtfpKep2VN/O6FRi+HEN+FfoE93bW0tJWsdjUt2o?=
 =?us-ascii?Q?2wTEtiDYWizXYXyro96yWrqgGNL636hJNpfDLpB12tAy3C+IoLv+2rH8Qbh+?=
 =?us-ascii?Q?LyuuylAuMorhSpp8jUjOs0DnMzVfRP0dq1yrvikmhNqyZKN09dVEN3ElJpOT?=
 =?us-ascii?Q?H9UFQc6R6ZUPH7K7cQgyFsSTEGQJePbY15YhFFRM6QXckByqHaIQWWX2s5iz?=
 =?us-ascii?Q?eAlKntJeyJM3Xj1GnU0eW29p+oufBMOCpT3de8gOP8Lsu41/i9N/m01otdP2?=
 =?us-ascii?Q?4wD+r4JoKajPnJgkvJbYkMgvqlVoGEKXuB3xfip6V7RRv09alN3wddTNAeUm?=
 =?us-ascii?Q?IUPU4SY0SD/vYQXPzo2luQndMJlQm3mDq7g697so2TtvQFp2FQRUHKnqD5ba?=
 =?us-ascii?Q?PaFCboj/wQiFnfBmiMQocANAxm/bTSKoK2r4TrHK8Ttfs3UL0tOlCQzJEE/K?=
 =?us-ascii?Q?zm4LUU6zPTKAUgw+OJ7FdUKIbljf447s2UDNMhzAZf674idKua74vHmCFASx?=
 =?us-ascii?Q?LzqfGnrcx7xe9S2a/g7VjYllW002pxCHlIGGyNpBorfNlCfFCWq5yRaRB09/?=
 =?us-ascii?Q?v7hV06u07F98nSzbQEE3xyz0qpKDZKEPis2qZYLNViLMqJIk4hJER//t1PRu?=
 =?us-ascii?Q?1Uc6DVyZmdMItyMI7Og1cKgWMTgU3t2VLeXQAVUpm0rz5mLEpgGkZObby4kw?=
 =?us-ascii?Q?lHx5WzJBHmbAtsvpSjMtA7xCJ4+gZH1YrJ8z2jmw/OJFF4+L4dlMKm2E2k2o?=
 =?us-ascii?Q?mM8RE6Gtyp9FS8j0Fpln07woUJjCWZ5U7agFplj6bLYgT1cn4YPfT6mQWL5C?=
 =?us-ascii?Q?PZTNMpdY7iXHo2GcQm5uQ87o948pWbhHiVEDBH2Fv4EwYwxH5yJfADECLq8E?=
 =?us-ascii?Q?iVvT70/neZVZDQvSoBSR03S6J6okkJVBqMQ9wOgfeSfxM+bf6mCv0JxSdL6u?=
 =?us-ascii?Q?XFUSdPLIVc6uimoL5MWOZ1OalWik+bVW81WDjcssW/kKgUxkFY6Y29le7ZwU?=
 =?us-ascii?Q?yuAFusef8DyXOPdhQZ69ktuTgp2I8E6fvOVwOEX17ETSTZqpzn1RvpEfMJh5?=
 =?us-ascii?Q?iCVIA+5IIh7f9qY0HZwM+vObg5YL28LTq5xm9Uix3A/OvqRD1/57TVs8QP9x?=
 =?us-ascii?Q?OYcJ9hWiaQveb8xkuIdQnILYW7kos7Z0CCP/xikp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e856202e-9ebc-4d70-107c-08de28b18064
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 03:53:16.0889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0NZOZ6h2xZQRDSNfuyNlgMsrTHR5mm4c5pjY2G5Lp8ZsTm6MAuu6aU7HpkBI1mB5cICBaiLHjvJWeVKn5CpeTHLzGIVzh8VOEazLkZysw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB16290
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

On Wed, Nov 19, 2025 6:32 PM, Hugo Villeneuve wrote:
> > +	unsigned int dsi_div_ab_calc;
>=20
> Change type to u8 like dsi_div_ab_desired.

OK.



> > +				if (rzg2l_cpg_div_ab(a, b) =3D=3D dsi_div_ab_calc) {
> > +					priv->mux_dsi_div_params.dsi_div_a =3D a;
> > +					priv->mux_dsi_div_params.dsi_div_b =3D b;
> > +					goto calc_pll_clk;
>=20
> At this point, you matched your a and b with dsi_div_ab_calc, which can b=
e different than dsi_div_ab_desired (even -> divided by 2). And
> when you calculate PLL5 clock (after calc_pll_clk), you use dsi_div_ab_de=
sired, not dsi_div_ab_calc. Is this ok?

Yes.

But, I just noticed that my ASCII diagram was wrong.
I was trying to save space to keep it under 100 characters, but in trying t=
o compress it, I ended up drawing it wrong.
So now I'll just put the comment outside the function to get more space.

Here's the new diagram.

/*
 * VCO-->[POSTDIV1,2]--FOUTPOSTDIV--------------->|
 *                          |                     |-->[1/(DSI DIV A * B)]--=
> MIPI_DSI_VCLK
 *                          |-->[1/2]--FOUT1PH0-->|
 *                          |
 *                          |------->[1/16]--------------------------------=
> hsclk (MIPI-PHY)
 */

The "dsi_div_ab_desired" is chosen mostly to make hsclk happy.
And, you can see it is always used to calculate the PLL regardless of odd/e=
ven.
But, only when you need to calculate the DIV_A,B, you might have that extra=
 1/2 divide in there.

Thanks for pointing this out.....which made me realize my diagram was wrong=
.

Chris

