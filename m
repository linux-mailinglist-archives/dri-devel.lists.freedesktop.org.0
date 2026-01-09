Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAED0B19B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C0710E8FC;
	Fri,  9 Jan 2026 16:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hxKKtnsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E791F10E8FC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:03:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dp7yq8CV9fJuBblHgVO11lKyhWf2UqxRNo9jqxmeWNHKQHCJJwE6cM+NXvIW779tRscK/z2GM+8A8k2+Usc7PBKqc1TPdd9uKkwuW0tOWkQ8zDvI5by0Vc5cOFHZnQykbOLcy2ashc2MCdCwmqL9bLeENenKTfaFt9ZRhiJaKhbo1md0ty9AHORg7ktc0wZ/9/SjC3jhDlSsVpyqxeA/NPqYnmVzXowIvP0PV6uoHhzwwWwlI7xBQTHOxM5BluAeyI6fk7gNNXF6vhBfPEjk1azhiefCWX58PDNTRdlJeyzBdMeyr5NyqnqT0vqoX2jz6D5nnN4GPNKquyII3Y1d7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WL5UVr8vLR31vLzySQfeHmItpa0iq4L4upWXiL9djU=;
 b=Rl4OjaL49BIbx5noRf/wkkkadPmvfzclaiHvkwVjL8n+QcN99JJ1GS/I/VxF66MmnBc2oAVFEmhNB5b9IqO8IU3hTnd76ALcipM5wC0deQfCWOFIa1lK2ATSieIVsxwyCsQj7GFdKHJiR1bP75uXxyaZClQBAu0NBZdTtzd2iQ6q5D77GSFzIZQDB13y+D57Ytz6OZhIqk/p07YWboJUo8TojTwXZidmFoX/IcFwYJaSXbgJu8weL0UTvv0s8y5DcTVj5FYN9bkF1H36ZE+si1VBJJEwSsGK0CqgsVhOfv2Z+EiNRFbtZM3N9lvwVfjyajxGgzLtzY7kHlUXyCnZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WL5UVr8vLR31vLzySQfeHmItpa0iq4L4upWXiL9djU=;
 b=hxKKtnspAnj/VDmQE8gymoDXyHu9Maf1DIkRNiqBJoPull7v8c60dLPhI4UmwuHqouf68uRw54bIefu485yu09ddOfKLuWLMpWf1ZwZ0Cnkxy14lq0sVGhpk7osTZnKBR7AWEH05e98dyuQqfEZaVzfns9Z8SbZa0iSHZ2P2yL8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB7188.jpnprd01.prod.outlook.com (2603:1096:400:ef::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.2; Fri, 9 Jan
 2026 16:03:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 16:03:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Brandt
 <Chris.Brandt@renesas.com>
Subject: RE: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
Thread-Topic: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
Thread-Index: AQHcgH7+LfMjCpngTEmutarkKkFyQ7VIbNOAgAAJDQCAABf9AIAAOKJggAErDACAAA5bAIAAAQMAgAAAT8A=
Date: Fri, 9 Jan 2026 16:03:29 +0000
Message-ID: <TY3PR01MB1134663A44CD9ECB52EFDB9378682A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
 <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
 <20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
 <TY3PR01MB11346AA75CAA2496A06BCEC438685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260108125134.6ce05fd214a217a37de9ed4b@hugovil.com>
 <TY3PR01MB113467DBEE7A2A0B3A93050788685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260109100436.f499618affc1fecd11c25097@hugovil.com>
 <TY3PR01MB11346170A13E303D80369DE128682A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260109105936.111c6ce42243eedafa7ad02c@hugovil.com>
In-Reply-To: <20260109105936.111c6ce42243eedafa7ad02c@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB7188:EE_
x-ms-office365-filtering-correlation-id: 758f0ba3-14c7-4d5f-fd1c-08de4f98a156
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uGFQJmd39PpEp03VcgwNGCzlksC2ylR66bteimnZZ6VT7hDOLWyXB2a+AQ7u?=
 =?us-ascii?Q?886NjCzseSDqH/7C9y3Wyt3ZvhgaD0QbR+b7RTgxoVqiHq7izuSYxMxUq51K?=
 =?us-ascii?Q?hoCf8r2I/sdFRTIepslbU2+cRU7V774SLW5u2yY4krrurpWyMsIfoa+LnkWm?=
 =?us-ascii?Q?ZGlFF6kB7jmJ05edEcNShHETgWDl5SY6URNiRcsXixY9fG1OcoDQvykNogiJ?=
 =?us-ascii?Q?OMn6BG9mMrl2kpSfX9fARLR0p7spi+fCZ4BL/IvYWmZ+u3ojavM1CCSladSL?=
 =?us-ascii?Q?h0iwxp6la4DQBOpJaF2fEPEC8E/JUY1NSLa6erUe7tabvYd5qvO1oQ7yZyJw?=
 =?us-ascii?Q?+ZuUHuuUdFQzVGAigJJRxVThcfWa2D/eO+FBBZstJ4JczGBbvNI5tw3AsmSI?=
 =?us-ascii?Q?XShWdcpbk8qdKWlZfmiWj0Dr6jWIEcRy/tY8QA2C1nAhX5EgGtD5laLfnoGd?=
 =?us-ascii?Q?2XEeZzSgUD6n18CIwWSE3VzHhpvTghT3VFoooyyPzTHMKh4vcFV/l8Fia7g/?=
 =?us-ascii?Q?NkmIDvyfLcfTOW5DC/y0KqQ1kqtBSBMgC3YV4UhI4MUTY8IQtM4Krnom9V1c?=
 =?us-ascii?Q?FTX3v+2HewIe596Blmi1MFZbtLOiqXSEw+L51gm2yEbu8Z0RB5dVaUXyIxcH?=
 =?us-ascii?Q?VpO1A0wJFulk/JhSEdOfko3BGs60SK3yVr1TgKWBuxF56t70s9vQN34Pjv8Y?=
 =?us-ascii?Q?+GHaI85jujHbCXwsFBhg2IEJJUShOm0RzUnOZ5tZnMfREEUuCTIyAKyCrL+j?=
 =?us-ascii?Q?BCETDgiXX1lL1Am/Ncg2oyNex3qsFWqluOUsMvuEWKnzhEBDIsu4Y3YbZryL?=
 =?us-ascii?Q?Vdmi3g3eeQR4rpOo3Nh8KZ/nR84+C7DmnW763k6ty6lRxtJnIqK26k9Ygpnc?=
 =?us-ascii?Q?WyB7/r9M4MK1gcDnGxggxb9FZt0UyPBj1qLTWl+jxXxOmvoRChBqZFi/z9QV?=
 =?us-ascii?Q?gDxF6+aZiMeOVV/uIRmE/XSqeNj24VhZS0M3WjPL+J/o87YHmo/slsSXoqUe?=
 =?us-ascii?Q?2xoA1PlJ/3XdJYr5KVZVMXChzN6/DRRTSDXL07EHJMNJ1JOh0zV7rVXNhBPU?=
 =?us-ascii?Q?pajm+6vDcYE5ZHPtrKLj+GzMLuTIDYPQljZgWhN+kLzNu2LZsxxJl6FEMa4d?=
 =?us-ascii?Q?FXCi1L9ZzR62uPRzlgNJ6vsKHbY4h10Wy8I56kTnwkaFbI7KHtXSp1hKC3nT?=
 =?us-ascii?Q?9KFcheg28rg7DS3brm5lAo0/0+OfIctkZuBbSKITpzX+w0O/LL7srsmz9CIz?=
 =?us-ascii?Q?Gl6I3YPgbuIcsuR3J92sjk/Ms5juoIDRxQmQuow1b5G5ursktY1O/WSAprhd?=
 =?us-ascii?Q?2AqeSMJibfPBt3VR9jUuNuQX5fd+yAB5kLmpuToXVnFPZIziKNrLvJnwyPSE?=
 =?us-ascii?Q?66rv5fntjweRfrYngHyo0y3Isik8FOJ9D3rEg8xLysOsgzPEcOzyokjCUMM7?=
 =?us-ascii?Q?1xg0txqxx2CRzBKpK6jGO4K3bhqC2mbJKkVLjwwmvIBsGtKIcTrJwY8j74++?=
 =?us-ascii?Q?lCWEoNpgjj8S79uNV57q9iwZqprwkXYw255l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nnl+YO/QdB6ysV1sRbSZuu+5IoepDXYn0bd917OqLtqNdxDRU3Bvp5yX7tZM?=
 =?us-ascii?Q?m7zH9+KR54iSVsHmPVYNre32a7Ie8g8qgkhdHIh2wFy29DdzdaD7PTbgKiMX?=
 =?us-ascii?Q?ptsgwJBKwVVf8Y/jeUCUfdOo0waNhsqePvNorf3tgywQcS6iBvkCc91HsOcs?=
 =?us-ascii?Q?JRnrdQw40iyUuto72fhaJVCvZWiBypj2eT7R7k8VA12sIgCJBVvVUt8uca/s?=
 =?us-ascii?Q?fWg4BM9nIGx7wCGgdTPB7Okrv8OQt5J1jlq7Y98d2gcbooe/o1fLCosPGe5T?=
 =?us-ascii?Q?vFzDBWw7ZgZxA70KWeMdldJfdPoUXsVky87VmYPqfoXH5MrlL7edtcly7gsp?=
 =?us-ascii?Q?DB0MfG0C313ehFsApRdv/fymZT7DE6EOUgCh/SXZHSxtiCjFORZvRgt5O91i?=
 =?us-ascii?Q?0KXZvsA/uqJ2J8qJy2xgsE1NqVCQLpRjVq86VSWSe3833BeNcmsxJbjbFloI?=
 =?us-ascii?Q?YFRZakljxI5qEsMTNY54qFC5w65JHhGeSGGzS7qh9Xx7eni0oYGKHGGQG/eW?=
 =?us-ascii?Q?xpiJORzE+Uz4pZU9X2770QzVAgsUZ4auL3vbYgQmyleAM+CI/WXGU0JlWaT5?=
 =?us-ascii?Q?N+106AnzW+RFeU/w+RRlT32vrCYaXkowv0lBFLrxzzowJ5xXPdhr0egwBwUM?=
 =?us-ascii?Q?bil1xV7kkNe9wnf0anPxa42DcfGdymCOaAUgQnRVILcC2QaUnLaPeEYE5M8f?=
 =?us-ascii?Q?G7wCjqn7iLB6HJenrzDiF6P+gdEpHZiB2sPXtRD/liiveqzSLLtPdnjrc/Z9?=
 =?us-ascii?Q?4rw01+cbqxRJHaBX9oaoVMn7tCmNu2u1kFmZDP9xQOMHVMl8yyW/EFYt8ryg?=
 =?us-ascii?Q?jDEFDcbo6ahsovWnTgiJNH8ztzU8yX+mp+8Og6tiA5CvJDdeG4J8ywzEl+wn?=
 =?us-ascii?Q?vRSdzcHdUlqBpnvWnpb5EbHxpqyn3m6cSKFTjpwZ5+j9BLLKgQ0oMj9N9VY+?=
 =?us-ascii?Q?cAy80G/XFEIMik/fTc/kJkG6FFvJyuWnIQwsTdpkNFXAI7s6vnjrxwGfBBrV?=
 =?us-ascii?Q?CyWtPkxh4pjGOw1Mkxjuh5zqRrDBW27Qa+dcDe+dOkEI7xk4QNHFeBL7N2I+?=
 =?us-ascii?Q?A+vHuUbsiyWQZu7Dk44lLDn18gmonJSrJJA36Ya86AwkxylJl0UlwRsAGKn9?=
 =?us-ascii?Q?UUlIOFeKXVw5pbU6yphuWAg96zTdreXk0yrKCRhf7SNglnaHvtkmZO2O3mJJ?=
 =?us-ascii?Q?WQ6wfvKIsD4RqXbXV/qdgnZ728yb//MY8AP8UUiMtc8i2xxEr5sTF6AV+5uM?=
 =?us-ascii?Q?hY0pZzIWTg6eRjOdg9Qrn+UkTRCZ0lHGf5pOl/SgIlvKOma0982m3Kt4Qsoz?=
 =?us-ascii?Q?0913sdTlshkY3rXzYWLoijTXpx+9ebVaqWa+4El/b+ITFYlJ/BmP0O1ifT/B?=
 =?us-ascii?Q?he8aFTfIJbtZkczIrDo2MJmFKODbHNLg45zC6VmqbBwCflYl0XI0omJdJw7n?=
 =?us-ascii?Q?Cw1alQin28rS2JPDgG6/osy0NQHivTnTgXvYXrURicbdVu9vMN9nkC0Zhbmc?=
 =?us-ascii?Q?zOMfdvgH9V5iVdFcbuvhZZ7NNz4wo1MXBFgMj/TrgCwuB+sTRJarbVWGZcel?=
 =?us-ascii?Q?gs51yKrf93g699SHfSmhNsic2lGsoxgcXVjo5n5pMVlfWsWBfbl0BtMBftdJ?=
 =?us-ascii?Q?HGmucVsYQGqQZUmNfMt/o9gsQouFjn2OMKUXP+nFj30xyTGfDxGvGgA/s8yC?=
 =?us-ascii?Q?U2QWY0vTlOOaHIymX3iXHArkS11boDpUaNNwUQ2djzSfnRlFqWuy76pWpYS0?=
 =?us-ascii?Q?KppYZSoNvA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758f0ba3-14c7-4d5f-fd1c-08de4f98a156
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 16:03:29.3414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8od8CGTiXX5UwWD6cC7+IeVIMuqlWRTirc2rdiJI/AzmkdZu472jkLCOjTR0wMMjjyIsPmzHJUzgY8nwMB0Cmkj1tCTKSBzQWeyfJ/XGfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7188
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

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 09 January 2026 16:00
> Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
>=20
> Hi Biju,
>=20
> On Fri, 9 Jan 2026 15:57:17 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Hi Hugo,
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > Of Hugo Villeneuve
> > > Sent: 09 January 2026 15:05
> > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > reboot
> > >
> > > Hi Biju,
> > >
> > > On Thu, 8 Jan 2026 21:21:00 +0000
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > >
> > > > Hi Hugo,
> > > >
> > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > Sent: 08 January 2026 17:52
> > > > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on
> > > > > reboot
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > On Thu, 8 Jan 2026 16:44:37 +0000 Biju Das
> > > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > >
> > > > > > Hi Hugo Villeneuve,
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > > > Sent: 08 January 2026 15:53
> > > > > > > Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic
> > > > > > > on reboot
> > > > > > >
> > > > > > > Hi Claudiu,
> > > > > > >
> > > > > > > On Thu, 8 Jan 2026 11:12:54 +0200 Claudiu Beznea
> > > > > > > <claudiu.beznea@tuxon.dev> wrote:
> > > > > > >
> > > > > > > > Hi, Hugo,
> > > > > > > >
> > > > > > > > On 1/7/26 23:48, Hugo Villeneuve wrote:
> > > > > > > > > Hi,
> > > > > > > > > when issuing a reboot command, I encounter the following =
kernel panic:
> > > > > > > > >
> > > > > > > > > [   36.183478] SError Interrupt on CPU1, code 0x00000000b=
e000011 -- SError
> > > > > > > > > [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow=
 Tainted: G   M
> > > > > 6.19.0-
> > > > > > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > > > > > [   36.183504] Tainted: [M]=3DMACHINE_CHECK
> > > > > > > > > [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> > > > > > > > > [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO=
 -DIT -SSBS BTYPE=3D--)
> > > > > > > > > [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x=
458
> > > > > > > > > [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x4=
58
> > > > > > > > > [   36.183547] sp : ffff8000813db860
> > > > > > > > > [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c=
0 x27: ffff000009dd7450
> > > > > > > > > [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd745=
0 x24: ffff800080e1f7a8
> > > > > > > > > [   36.183573] x23: ffff000009dd7400 x22: 000000000000000=
0 x21: ffff000009dd7430
> > > > > > > > > [   36.183582] x20: ffff8000813db8e8 x19: 000000000205002=
8 x18: 00000000ffffffff
> > > > > > > > > [   36.183592] x17: 0000000000000000 x16: 000000000000000=
0 x15: ffff8000813db220
> > > > > > > > > [   36.183602] x14: 0000000000000000 x13: ffff800081255bc=
0 x12: 00000000000009a2
> > > > > > > > > [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d=
0 x9 : ffff800081255bc0
> > > > > > > > > [   36.183621] x8 : ffff800081399000 x7 : ffff00000a04260=
0 x6 : 0000000000000000
> > > > > > > > > [   36.183631] x5 : 0000000000000805 x4 : 000000000200000=
0 x3 : 0000000000000028
> > > > > > > > > [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b4=
0 x0 : ffff800081780000
> > > > > > > > > [   36.183652] Kernel panic - not syncing: Asynchronous S=
Error Interrupt
> > > > > > > > > [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow=
 Tainted: G   M
> > > > > 6.19.0-
> > > > > > > rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > > > > > > > [   36.183665] Tainted: [M]=3DMACHINE_CHECK
> > > > > > > > > [   36.183668] Hardware name: devboard1 (DT)
> > > > > > > > > [   36.183672] Call trace:
> > > > > > > > > [   36.183675]  show_stack+0x18/0x24 (C)
> > > > > > > > > [   36.183692]  dump_stack_lvl+0x34/0x8c
> > > > > > > > > [   36.183702]  dump_stack+0x18/0x24
> > > > > > > > > [   36.183708]  vpanic+0x314/0x35c
> > > > > > > > > [   36.183716]  nmi_panic+0x0/0x64
> > > > > > > > > [   36.183722]  add_taint+0x0/0xbc
> > > > > > > > > [   36.183728]  arm64_serror_panic+0x70/0x80
> > > > > > > > > [   36.183735]  do_serror+0x28/0x68
> > > > > > > > > [   36.183742]  el1h_64_error_handler+0x34/0x50
> > > > > > > > > [   36.183751]  el1h_64_error+0x6c/0x70
> > > > > > > > > [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 =
(P)
> > > > > > > > > [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> > > > > > > > > [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0=
xc4
> > > > > > > > > [   36.183792]  ili9881c_unprepare+0x38/0x88
> > > > > > > > > [   36.183802]  drm_panel_unprepare+0xbc/0x108
> > > > > > > > > [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x6=
0
> > > > > > > > > [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/=
0x4c
> > > > > > > > > [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8=
/0x100
> > > > > > > > > [   36.183845]  drm_atomic_helper_commit_modeset_disables=
+0x2fc/0x5f8
> > > > > > > > > [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x=
7c
> > > > > > > > > [   36.183865]  commit_tail+0xa4/0x18c
> > > > > > > > > [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> > > > > > > > > [   36.183884]  drm_atomic_commit+0x8c/0xcc
> > > > > > > > > [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> > > > > > > > > [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> > > > > > > > > [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> > > > > > > > > [   36.183920]  platform_shutdown+0x24/0x34
> > > > > > > > > [   36.183931]  device_shutdown+0x128/0x284
> > > > > > > > > [   36.183938]  kernel_restart+0x44/0xa4
> > > > > > > > > [   36.183950]  __do_sys_reboot+0x178/0x270
> > > > > > > > > [   36.183959]  __arm64_sys_reboot+0x24/0x30
> > > > > > > > > [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> > > > > > > > > [   36.183979]  do_el0_svc+0x40/0xc0
> > > > > > > > > [   36.183988]  el0_svc+0x3c/0x164
> > > > > > > > > [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> > > > > > > > > [   36.184002]  el0t_64_sync+0x198/0x19c
> > > > > > > > > [   36.184020] Kernel Offset: disabled
> > > > > > > > > [   36.184022] CPU features: 0x200000,00020001,4000c501,0=
400720b
> > > > > > > > > [   36.184028] Memory Limit: none
> > > > > > > > > [   36.495305] ---[ end Kernel panic - not syncing: Async=
hronous SError Interrupt ]---
> > > > > > > > >
> > > > > > > > > The problem is present since linux-6.18-rc1, but not in
> > > > > > > > > linux-6.17. I also confirm the bug is
> > > > > > > present in linux-6.19-rc4.
> > > > > > > > >
> > > > > > > > > The bug seems to be happening in rzg2l_mipi_dsi_host_tran=
sfer().
> > > > > > > > >
> > > > > > > > > After bisecting, here is the first bad commit:
> > > > > > > > >
> > > > > > > > >      commit 56de5e305d4b ("clk: renesas: r9a07g044: Add
> > > > > > > > > MSTOP for
> > > > > > > > > RZ/G2L")
> > > > > > > > >
> > > > > > > > > Reverting this change makes the bug disappear.
> > > > > > > > >
> > > > > > > > > My limited understanding seems to indicate that the
> > > > > > > > > MIPI/DSI host may no longer be available/on when the
> > > > > > > > > panel tries to send MIPI/DSI commands in
> > > > > > > > > ili9881c_unprepare(), maybe because the MIPI/DSI clock
> > > > > > > > > has been
> > > > > stopped...
> > > > > > > > >
> > > > > > > > > The exact same board with two other panels (jd9365da and =
st7703) doesn't have the bug.
> > > > > > > >
> > > > > > > > Could you please provide the output of command:
> > > > > > > >
> > > > > > > > cat /sys/kernel/debug/mstop
> > > > > > > >
> > > > > > > > for both cases?
> > > > > > >
> > > > > > > Here it is for the panel which has the bug:
> > > > > > >
> > > > > > > ----------------------------------
> > > > > > >                            MSTOP
> > > > > > >                      clk   -------------------------
> > > > > > > clk_name             cnt   cnt   off   val    shared
> > > > > > > --------             ----- ----- ----- ------ ------
> > > > > > > gic                  1     1     0xb80 0x0
> > > > > > > ia55_clk             2     2     0xb70 0x0    ia55_pclk ia55_=
clk
> > > > > > > ia55_pclk            1     2     0xb70 0x0    ia55_pclk ia55_=
clk
> > > > > > > dmac_aclk            2     1     0xb80 0x0
> > > > > > > dmac_pclk            1     1     0xb80 0x0
> > > > > > > ostm0_pclk           0     0     0xb7c 0x10
> > > > > > > ostm1_pclk           1     1     0xb7c 0x0
> > > > > > > ostm2_pclk           1     1     0xb7c 0x0
> > > > > > > mtu_x_mck            0     0     0xb64 0x4
> > > > > > > gpt_pclk             1     1     0xb64 0x0
> > > > > > > poeg_a_clkp          0     0     0xb64 0x20
> > > > > > > poeg_b_clkp          0     0     0xb64 0x40
> > > > > > > poeg_c_clkp          0     0     0xb64 0x80
> > > > > > > poeg_d_clkp          0     0     0xb64 0x100
> > > > > > > wdt0_pclk            1     2     0xb7c 0x0    wdt0_pclk wdt0_=
clk
> > > > > > > wdt0_clk             1     2     0xb7c 0x0    wdt0_pclk wdt0_=
clk
> > > > > > > wdt1_pclk            0     0     0xb7c 0x8    wdt1_pclk wdt1_=
clk
> > > > > > > wdt1_clk             0     0     0xb7c 0x8    wdt1_pclk wdt1_=
clk
> > > > > > > spi_clk2             0     0     0xb64 0x2    spi_clk2 spi_cl=
k
> > > > > > > spi_clk              0     0     0xb64 0x2    spi_clk2 spi_cl=
k
> > > > > > > sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk sdh=
i0_imclk2 sdhi0_clk_hs
> sdhi0_aclk
> > > > > > > sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk sdh=
i0_imclk2 sdhi0_clk_hs
> sdhi0_aclk
> > > > > > > sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk sdh=
i0_imclk2 sdhi0_clk_hs
> sdhi0_aclk
> > > > > > > sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk sdh=
i0_imclk2 sdhi0_clk_hs
> sdhi0_aclk
> > > > > > > sdhi1_imclk          0     0     0xb6c 0x2    sdhi1_imclk sdh=
i1_imclk2 sdhi1_clk_hs
> sdhi1_aclk
> > > > > > > sdhi1_imclk2         0     0     0xb6c 0x2    sdhi1_imclk sdh=
i1_imclk2 sdhi1_clk_hs
> sdhi1_aclk
> > > > > > > sdhi1_clk_hs         0     0     0xb6c 0x2    sdhi1_imclk sdh=
i1_imclk2 sdhi1_clk_hs
> sdhi1_aclk
> > > > > > > sdhi1_aclk           0     0     0xb6c 0x2    sdhi1_imclk sdh=
i1_imclk2 sdhi1_clk_hs
> sdhi1_aclk
> > > > > > > gpu_clk              1     1     0xb80 0x0
> > > > > > > cru_sysclk           0     0     0xb78 0x8    cru_sysclk cru_=
vclk cru_pclk cru_aclk
> > > > > > > cru_vclk             0     0     0xb78 0x8    cru_sysclk cru_=
vclk cru_pclk cru_aclk
> > > > > > > cru_pclk             0     0     0xb78 0x8    cru_sysclk cru_=
vclk cru_pclk cru_aclk
> > > > > > > cru_aclk             0     0     0xb78 0x8    cru_sysclk cru_=
vclk cru_pclk cru_aclk
> > > > > > > dsi_pll_clk          1     6     0xb78 0x0    dsi_pll_clk dsi=
_sys_clk dsi_aclk dsi_pclk
> > > dsi_vclk
> > > > > > > dsi_lpclk
> > > > > > > dsi_sys_clk          1     6     0xb78 0x0    dsi_pll_clk dsi=
_sys_clk dsi_aclk dsi_pclk
> > > dsi_vclk
> > > > > > > dsi_lpclk
> > > > > > > dsi_aclk             1     6     0xb78 0x0    dsi_pll_clk dsi=
_sys_clk dsi_aclk dsi_pclk
> > > dsi_vclk
> > > > > > > dsi_lpclk
> > > > > > > dsi_pclk             1     6     0xb78 0x0    dsi_pll_clk dsi=
_sys_clk dsi_aclk dsi_pclk
> > > dsi_vclk
> > > > > > > dsi_lpclk
> > > > > > > dsi_vclk             1     6     0xb78 0x0    dsi_pll_clk dsi=
_sys_clk dsi_aclk dsi_pclk
> > > dsi_vclk
> > > > > > > dsi_lpclk
> > > > > > > dsi_lpclk            1     6     0xb78 0x0    dsi_pll_clk dsi=
_sys_clk dsi_aclk dsi_pclk
> > > dsi_vclk
> > > > > > > dsi_lpclk
> > > > > > > lcdc_a               3     1     0xb78 0x0    lcdc_a lcdc_p
> > > > > > > lcdc_p               3     1     0xb78 0x0    lcdc_a lcdc_p
> > > > > > > lcdc_clk_d           3     1     0xb78 0x0
> > > > > > > ssi0_pclk            0     0     0xb64 0x400  ssi0_pclk ssi0_=
sfr
> > > > > > > ssi0_sfr             0     0     0xb64 0x400  ssi0_pclk ssi0_=
sfr
> > > > > > > ssi1_pclk            0     0     0xb64 0x800  ssi1_pclk ssi1_=
sfr
> > > > > > > ssi1_sfr             0     0     0xb64 0x800  ssi1_pclk ssi1_=
sfr
> > > > > > > ssi2_pclk            0     0     0xb64 0x1000 ssi2_pclk ssi2_=
sfr
> > > > > > > ssi2_sfr             0     0     0xb64 0x1000 ssi2_pclk ssi2_=
sfr
> > > > > > > ssi3_pclk            0     0     0xb64 0x2000 ssi3_pclk ssi3_=
sfr
> > > > > > > ssi3_sfr             0     0     0xb64 0x2000 ssi3_pclk ssi3_=
sfr
> > > > > > > usb0_host            3     1     0xb6c 0x0
> > > > > > > usb1_host            0     0     0xb6c 0x80
> > > > > > > usb0_func            1     1     0xb6c 0x0
> > > > > > > usb_pclk             5     1     0xb6c 0x0
> > > > > > > eth0_axi             0     0     0xb6c 0x4    eth0_axi eth0_c=
hi
> > > > > > > eth0_chi             0     0     0xb6c 0x4    eth0_axi eth0_c=
hi
> > > > > > > eth1_axi             0     0     0xb6c 0x8    eth1_axi eth1_c=
hi
> > > > > > > eth1_chi             0     0     0xb6c 0x8    eth1_axi eth1_c=
hi
> > > > > > > i2c0                 0     0     0xb68 0x400
> > > > > > > i2c1                 0     0     0xb68 0x800
> > > > > > > i2c2                 0     0     0xb68 0x1000
> > > > > > > i2c3                 0     0     0xb68 0x2000
> > > > > > > scif0                2     1     0xb68 0x0
> > > > > > > scif1                0     0     0xb68 0x4
> > > > > > > scif2                0     0     0xb68 0x8
> > > > > > > scif3                0     0     0xb68 0x10
> > > > > > > scif4                0     0     0xb68 0x20
> > > > > > > sci0                 0     0     0xb68 0x80
> > > > > > > sci1                 0     0     0xb68 0x100
> > > > > > > rspi0                0     0     0xb64 0x4000
> > > > > > > rspi1                0     0     0xb64 0x8000
> > > > > > > rspi2                0     0     0xb68 0x1
> > > > > > > canfd                0     0     0xb68 0x200
> > > > > > > gpio                 1     1     0xb70 0x0
> > > > > > > adc_adclk            0     0     0xb68 0x4000 adc_adclk adc_p=
clk
> > > > > > > adc_pclk             0     0     0xb68 0x4000 adc_adclk adc_p=
clk
> > > > > > > tsu_pclk             1     1     0xb68 0x0
> > > > > > > ----------------------------------
> > > > > > >
> > > > > > > I do not have acces to the other panels for the moment to run=
 the same command.
> > > > > > >
> > > > > > >
> > > > > > > > Also, could you please check if the following diff solves y=
our problem:
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > index 5edd45424562..62957632a96f 100644
> > > > > > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > > > > > @@ -1282,6 +1282,10 @@ static ssize_t
> > > > > > > > rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> > > > > > > >                  value |=3D SQCH0DSC0AR_FMT_SHORT;
> > > > > > > >          }
> > > > > > > >
> > > > > > > > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > > > > > > > +       if (ret)
> > > > > > > > +               return ret;
> > > > > > > > +
> > > > > > > >          rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR,
> > > > > > > > value);
> > > > > > > >
> > > > > > > >          /*
> > > > > > > > @@ -1322,6 +1326,8 @@ static ssize_t
> > > > > > > > rzg2l_mipi_dsi_host_transfer(struct
> > > > > > > > mipi_dsi_host *host,
> > > > > > > >                          ret =3D packet.payload_length;
> > > > > > > >          }
> > > > > > > >
> > > > > > > > +       pm_runtime_put(dsi->dev);
> > > > > > > > +
> > > > > > > >          return ret;
> > > > > > > >   }
> > > > > > >
> > > > > > > I confirm that it fixes the bug, altought I assume this is
> > > > > > > just for testing and is not the
> > > > > "proper"
> > > > > > > fix.
> > > > > >
> > > > > > Pre-MSTOP case during reboot, without clk it is accessing
> > > > > > registers)(mstop off always) it won't crash. But looks like
> > > > > > you may have ignored timeout error from
> > > > > [1].
> > > > >
> > > > > In case of a timeout error, it is not really ignored as the
> > > > > proper error code -ETIMEDOUT will be returned by
> > > > > rzg2l_mipi_dsi_host_transfer() (see log below). The hardware
> > > > > manual doesn't seem to properly explain how to deal with a
> > > > > timeout (or I could not find it). Do you have
> > > any suggestion on how to improve this?
> > > > >
> > > > > >
> > > > > > Post MSTOP case, if you access registers with mstop on, it will=
 lead to crash.
> > > > > >
> > > > > > and the patch fixes crash.
> > > > > >
> > > > > > Basically, you are accessing link register after video is stopp=
ed with this panel.
> > > > > > Looks like it is a fix for me.
> > > > >
> > > > > Ok, like I said I am not an expert on this, but I was just
> > > > > assuming that there was a better way to ensure that the mipi/dsi
> > > > > interface was still active until the panel unprepare() function
> > > > > could do its work. I was looking at some other drivers mipi/dsi
> > > > > host_transfer() functions and did not see a similar
> > > > > pm_runtime_resume_and_get() scheme, hence my confusion.
> > > > >
> > > > > > Better check if there is any timeout error[1] with this patch.
> > > > > > if not, It is proper fix.
> > > > >
> > > > > The patch does fixes the kernel panic, but doesn't allow the
> > > > > panel to be properly unprepared, as I just noticed the timeout me=
ssage:
> > > > >
> > > > >     [   39.321153] ili9881c-dsi 10850000.dsi.0: sending DCS SET_D=
ISPLAY_OFF failed: -110
> > > > >
> > > > > In my case, for a reboot, this is not a problem, but it may be a
> > > > > problem for systems where it can be suspended (I assume)?
> > > > >
> > > > > Thank you for your help with this.
> > > >
> > > > Can you please try implement .atomic_post_disable() symmetrical to
> rzg2l_mipi_dsi_atomic_pre_enable?
> > > >
> > > > Ie, move just rzg2l_mipi_dsi_stop(dsi) from
> > > > rzg2l_mipi_dsi_atomic_disable() to
> > > > rzg2l_mipi_dsi_atomic_post_disable()
> > > >
> > > > and check  you can send DCS SET_DISPLAY_OFF successfully.
> > >
> > > I reverted the previous fix (pm_runtime_resume_and_get), and
> > > implemented .atomic_post_disable as you suggested, and this works gre=
at: the bug is  no longer
> present and I do not see timeout errors:
> > >
> > > [  537.727556] systemd-shutdown[1]: Syncing filesystems and block dev=
ices.
> > > [  537.734544] systemd-shutdown[1]: Rebooting.
> > > [  538.520174] rzg2l-mipi-dsi 10850000.dsi:
> > > rzg2l_mipi_dsi_atomic_disable(): entry [  538.547848] ili9881c-dsi 10=
850000.dsi.0:
> ili9881c_unprepare(): entry [  538.564524] rzg2l-mipi-dsi 10850000.dsi:
> > > rzg2l_mipi_dsi_atomic_post_disable(): entry [  538.574016] reboot:
> > > Restarting system
> >
> > Great!
>=20
> Will you send a patch for this?

Please feel free to send the patch, as you have the hardware to test it.

I will add my Tb tag after testing your patch on my bridge setup.

Cheers,
Biju
