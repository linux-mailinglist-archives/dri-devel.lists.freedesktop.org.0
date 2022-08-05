Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC658A840
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 10:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD28AEC57;
	Fri,  5 Aug 2022 08:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069FDAE7DF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 08:44:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT+ABrQA0Mi/rP6pghCozw0dW6tQ6p8XycxhEtfVWgJZZD2uchZm0EREB+04dHyCI+PHENqqnVEwO0oOGsXNnbwGoblqswV4IIgcaRBKKJJQ79F34gDrdZ6UrQXqGOvRCKX58SS34azWCKHhwGflDFjdeE+L1KpINz8ai3/eRB3IHmiKaf+F78lnIdI4Lq4ZLGJ3v3w/vWrFF7sDe0hWsokA8ScR9OZYks6+3NyBTtV9rVhDlqrdYSupi1kf5Txb4h1bPBP+KBARRkKIlFc2QSzOKJkitNg4HTl4MCLVjkh491DzgjeF5XbIwI8B5CMr8/x3auTlBcDD6U10EEIHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7BbyELoEZJ661wgFkHSILIfLVJnAYUUvrgzlt4L2+M=;
 b=Pqma6OpUUej8qQU4K4W4pSjVksPvkbGRM/UelYc0GpLqHhf+TF3mRrCt7AN3JrYggM5vCQDH1Q7+p2Q+FueRkkrbChEMXyHEmLxok7xvq7lGxTkQRJ67Sbz0jaZdEN0FIPPVpSNUTjoa9sxaapmvrGmtdAa8POb6QZAWdm6p4fNMq0BLKJAeHV3DJNfIXXMHDu8yWbWPxdZOpHUTfEc66piXllVE2KlFXXt7bcgDLOp+crDfNZjURdp7Ntl1fqIiGL+U5P8QTIUu8kP+LWs/iN7tu8J2rl2m4ePvL9HlgN/J4xcpDGWtLTYWRfViKepaOvXhKEZcI7Dcbf041UiNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7BbyELoEZJ661wgFkHSILIfLVJnAYUUvrgzlt4L2+M=;
 b=isvY6c3RhkgBnDYhdQ0JAlL6HVyfmDgAKgZomai1Pgjnfvd0S+GhC2MR2W12XisJmEelbUoDVxqsk8ru+AMK1LSgxd7+48sJRs/QdAhgrBPGGb72Or8nyOHg6XZQQcqVU+fShievBTtqNYTPvBHAenoKRCxQnExg1lYJtE9UWUA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7094.jpnprd01.prod.outlook.com (2603:1096:604:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 08:44:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%5]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 08:44:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Adam Ford <aford173@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: RE: imx8mm lcdif->dsi->adv7535 no video, no errors
Thread-Topic: imx8mm lcdif->dsi->adv7535 no video, no errors
Thread-Index: AQHYpChafRNyOjpBj0WPdhAcG0oEYa2acueAgAA4agCAAASNgIAAKSYAgAAD44CAAAo3AIAAXp8AgABEnoCAABtjgIAAz2aAgABExgCAAE7agIAAFOqAgAFl6YCAAB9xgIAAFpcAgAAhg4CAAJrGAIAAjYvg
Date: Fri, 5 Aug 2022 08:44:23 +0000
Message-ID: <OS0PR01MB592206843B43BC93F4F699FC869E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
 <20220802080820.jyf3tfpgcj3pvbtp@pengutronix.de>
 <CAHCN7xL-7wGnEhY9+zDXYjigZfnfsnY_NsRf+enYt_BPsFxgnQ@mail.gmail.com>
 <CAHCN7xLpCbOY+Ma6gKJievw6aUZ5-Qs4S=zxjTgRu=Be7zvhoQ@mail.gmail.com>
 <CAHCN7xKzYcCPL0ddTENGw6xdCMNdYw-m5u4NSBHb96Vb_tByGg@mail.gmail.com>
 <20220803062024.vn7awasmifkp5xow@pengutronix.de>
 <CAHCN7xL3maPyX8eUiT6mKYei==6pkEvVTwX3vY+1uLTSNDGQ3Q@mail.gmail.com>
 <CAPY8ntBBz56Es=pK+KpqhyYLUET95DT_zE6gorOWx4WkCSxJAg@mail.gmail.com>
 <20220804093829.42kdelp7u4r743nv@pengutronix.de>
 <CAPY8ntBovVq1HVt_UneDF8OB9KBdEBv52o=4BCTmf9VpiODxVg@mail.gmail.com>
 <20220804125152.idyzetjqkjzgbbm2@pengutronix.de>
 <CAPY8ntAatYvbf5ehfsj4qcSDC=sODeN1Cj0vDjn6p0M=k320NA@mail.gmail.com>
 <CAHCN7x+DkJgGvMLnYBXscSMDmTCeaHeJKK6T9eLUm+rXSx=NQA@mail.gmail.com>
In-Reply-To: <CAHCN7x+DkJgGvMLnYBXscSMDmTCeaHeJKK6T9eLUm+rXSx=NQA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 032c887c-8831-40da-d315-08da76beb277
x-ms-traffictypediagnostic: OS3PR01MB7094:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HXBV+5HE58lssjGxeUeRG00Eky2St28zXAuQndcAlcvKFT5QY2jENdlhgg50E/Xbw4b8mCaGTvYiaQcNYA1FJf+PavFUtJ/GTfjcB0/OgmHaskSufZZapXkTKbrazwyYEkIn+xubanKnACgF2AoXZTHlhPtiLOoEWwrDdUu6eEPwXWAgITBsYLYZ4MAoyrmPaoW737hfcOkXV2W8945VXZz3h89VQ0RHVc/i2rhxmnxG/jcks7vhTnmLDXu7P3VyUDALw2G8nJ50cDUPuVk9pnS/UK5NKtBm/gaJPTBUgFNHzrN5c5BBUevPMZ1ddl0N9o4dL8m1OS6bnchRyj0PNvFsp45xdXlZlC+jfx3Ib3AdGJUAbBZuX5odKtNwkDqP1EBCmOcEaqLUEu9orD++xvqdHGf4bfmr3+Poe5i2pgjAnIqQrsCJV8fpTHX9w5l63OAtatoSeRtqnO6lLxoa+RqYl4zm48EeDzmKLNSQJXhYFA6rOs0VhBrUtHZGiEMkXx3DjygI/kveqsSqZ1vxppjNyxTybXuWZuEgix791hB3y/bE03J/dP6QyKDEdcgUkhWiYCKHwyUeYIkDIM0WFj08mP/AgvRxbDc11dbR5dzLyX/nZ4Xu6nA1qi/mpsjrqj22Bui3LYriP+ucHtnjjf5nLBA16JLW3cousYBZgqHUAvg5ZOT2zfNIo73tfbh20y2wGZhIhW+Exagkup/qU2pZhoMElLpmIvjOsWYNPDd2zuVaBZpUVL31fws2SHMvZhPYUmg9+qXAWW8cuB3l/PhyLHEKxT3N0EIT2fQShnBFzy5m6JBOAMhfBIhTkXCciYfIt2GqBuXURq9HnD1D8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(316002)(478600001)(8936002)(54906003)(110136005)(41300700001)(7416002)(2906002)(6506007)(7696005)(53546011)(26005)(186003)(5660300002)(9686003)(38070700005)(86362001)(33656002)(83380400001)(64756008)(52536014)(66476007)(4326008)(8676002)(66946007)(66446008)(76116006)(55016003)(38100700002)(71200400001)(122000001)(66556008)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JFTyGLR107G+PBfq+MIXKkLPaspKUOYHBM4JkdALG4eD4z1QjsLR8n2AkVzT?=
 =?us-ascii?Q?qcxLbcDgqJcBX69qi8wPq/Be0HacihFooz4fAeAQ+1Ut9eDCAzb8aWN9VYxE?=
 =?us-ascii?Q?QrU0ucM/uMSSBiobrEuTQZCVpWr0CDKXWuS7OKpK+PYY9hAlw1S0bZ/3SdlL?=
 =?us-ascii?Q?UH9WrKZOZNLDO2SRkMSAc39HHkpNJSFLgMmpDJmNUncpDNIYeJy+FjhEQdQ/?=
 =?us-ascii?Q?W0PSNKJ2HB8Cyox7neFGkyLzyvrQWXTgF3g40B/bU410fTIv21eAjY2lANmj?=
 =?us-ascii?Q?mAYyrBC++oxT5oLWDUPEKmZZDLt6LCliraow+Nk67yH4leiYqo11cZqYR58w?=
 =?us-ascii?Q?/9OkBZKQtBZD8jzMGWlWr8Z1QVeXAdBICYpd0gi5zlRMyc3uCs2fIwTSiS0l?=
 =?us-ascii?Q?Ix0x1/6+A04NNe8sF+9CPcc855Wxj5fqrdrEC4rMiKIIFFKhkFUy/P1qzFh3?=
 =?us-ascii?Q?xS09hXCIhkel5V+nh9soDaJ2E3KpVT9Qs4UZOw8P7XhArw40b7rF9/CidnNJ?=
 =?us-ascii?Q?TsqLhcfo/oAsykuum/7sxSwczUmhwG0uo2HEOEPgxphfvy0J2SKsUQ1m1FEp?=
 =?us-ascii?Q?YIkNlv8zGbfaUDS5GRiwfcSnrdxb91CEl+P3W/ebVWIIaIzaUN2y6NDyrFP4?=
 =?us-ascii?Q?wKMEVaSkvnvu7lJk1+Ez3zz7GHuO+geF4bEjs/sQ4BhIoXJdP8BPyrmgtXfE?=
 =?us-ascii?Q?GxfRPqr/8roZJu2d3Lw3XLopPw34ZGyyZZNRgiFn0SpOWfE0YP/HiZZD1bIU?=
 =?us-ascii?Q?4G/UcOKUrXTcngop1cogBtUloOiNAbFb9fI3hEkB44lLhvdNS2FV0F9UzXR+?=
 =?us-ascii?Q?NnggYYAPxGNXTMNWl+xtJxvG+Ij2vA0vgrBWkXsDawkMAgX/5E6r/vl3C+pi?=
 =?us-ascii?Q?sD985ThrTjaj8mYh0CivWVDAc3TIdxrYOfLTNmONFB0T0uP+Qqa0q5ZILGIw?=
 =?us-ascii?Q?v8Uic+s1t+vU0793z1hyrp+yyN7dtMuGP3LRTygP8zjSXkai1zBfoyLc9tpe?=
 =?us-ascii?Q?8kzb5BCteV8TqyMq4G8vUt8qm8dbE9Buvx1Ts2LPJYG62YMDiDZNjCqeYnLd?=
 =?us-ascii?Q?rcCGXLfkahtksqKzRrYOdVDY3Mb+rz2zj9S4X22iXt4quJ7M+Mv8uL6O9Df0?=
 =?us-ascii?Q?3kVOU8DCxST485aRhyEb2V+Ot6odwKJR/Bg1cIqU0yBsqoh98zcV8zFpHIG1?=
 =?us-ascii?Q?cjky7IeUbKm4T1zh8PCl4zOmokeg5W0EEZ7ouaR+JFAdV1vkHL/flsEmU4qk?=
 =?us-ascii?Q?lBLskwZCmhNN+sWMfw/Vblcm1BhA8rcoyHg8gdJhchjrTCT725dK44K4l92a?=
 =?us-ascii?Q?V+0voAQ/c6Re4iYeywlV/JwA/sln613EUH9baK6PuvRSyRCT8XDtHIwv8znP?=
 =?us-ascii?Q?72OfdjHFXXepDK1FXLSbwFTsP3xAy9mkA/gcmOnz1eoIK8zZuv50N7ciuFxW?=
 =?us-ascii?Q?2lKSe/NIubd62+rVh06wZUQlTEyUGinG3IF3NYibqgr56Mckycp7zAzaAp+T?=
 =?us-ascii?Q?ibLoGaAWxGufpux7kj1tvSUAesrMPyGEkDkbRiPKPjFHAZ5Ji6d9B0ZBqUdT?=
 =?us-ascii?Q?di1F4/NYOrjJKNAWFGtOBvDXB+oZ7W2XGM7vxNK7Ig2odqQVtqKFuM0KwyYk?=
 =?us-ascii?Q?LQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032c887c-8831-40da-d315-08da76beb277
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 08:44:23.5938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejMPy2zJhllNeEy1JSxcfxPyJhCN5XimZuLDx6wJODpKodHTNqProTD9s0Wa4G3W98+LIcve5fp7oulJS09qGJWFf5S0JBp6xVJqX/RmQp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7094
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "robert.chiras@nxp.com" <robert.chiras@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 "laurentiu.palcu@nxp.com" <laurentiu.palcu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam and all,

> Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
>=20
> On Thu, Aug 4, 2022 at 9:52 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > On Thu, 4 Aug 2022 at 13:51, Marco Felsch <m.felsch@pengutronix.de>
> wrote:
> > >
> > > Hi Dave,
> > >
> > > On 22-08-04, Dave Stevenson wrote:
> > > > Hi Marco
> > > >
> > > > On Thu, 4 Aug 2022 at 10:38, Marco Felsch
> <m.felsch@pengutronix.de> wrote:
> > > > >
> > > > > Hi Dave, Adam,
> > > > >
> > > > > On 22-08-03, Dave Stevenson wrote:
> > > > > > Hi Adam
> > > > > >
> > > > > > On Wed, 3 Aug 2022 at 12:03, Adam Ford <aford173@gmail.com>
> wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > Did managed to get access to the ADV7535 programming
> > > > > > > > guide? This is the black box here. Let me check if I can
> > > > > > > > provide you a link with our repo so you can test our
> current DSIM state if you want.
> > > > > > >
> > > > > > > I do have access to the programming guide, but it's under
> > > > > > > NDA, but I'll try to answer questions if I can.
> > > > > >
> > > > > > Not meaning to butt in, but I have datasheets for ADV7533 and
> > > > > > 7535 from previously looking at these chips.
> > > > >
> > > > > Thanks for stepping into :)
> > > > >
> > > > > > Mine fairly plainly states:
> > > > > > "The DSI receiver input supports DSI video mode operation
> > > > > > only, and specifically, only supports nonburst mode with sync
> pulses".
> > > > >
> > > > > I've read this also, and we are working in nonburst mode with
> > > > > sync pulses. I have no access to an MIPI-DSI analyzer therefore
> > > > > I can't verify it.
> > > > >
> > > > > > Non-burst mode meaning that the DSI pixel rate MUST be the
> > > > > > same as the HDMI pixel rate.
> > > > >
> > > > > On DSI side you don't have a pixel-clock instead there is bit-
> clock.
> > > >
> > > > You have an effective pixel clock, with a fixed conversion for the
> > > > configuration.
> > > >
> > > > DSI bit-clock * number of lanes / bits_per_pixel =3D pixel rate.
> > > > 891Mbit/s * 4 lanes / 24bpp =3D 148.5 Mpixels/s
> > >
> > > Okay, I just checked the bandwidth which must equal.
> > >
> > > > As noted elsewhere, the DSI is DDR, so the clock lane itself is
> > > > only running at 891 / 2 =3D 445.5MHz.
> > > >
> > > > > > Section 6.1.1 "DSI Input Modes" of
> > > > > > adv7533_hardware_user_s_guide is even more explicit about the
> > > > > > requirement of DSI timing matching
> > > > >
> > > > > Is it possible to share the key points of the requirements?
> > > >
> > > > "Specifically the ADV7533 supports the Non-Burst Mode with syncs.
> > > > This mode requires real time data generation as a pulse packet
> > > > received becomes a pulse generated. Therefore this mode requires a
> > > > continuous stream of data with correct video timing to avoid any
> > > > visual artifacts."
> > > >
> > > > LP mode is supported on data lanes. Clock lane must remain in HS
> mode.
> > > >
> > > > "... the goal is to accurately convey DPI-type timing over DSI.
> > > > This includes matching DPI pixel-transmission rates, and widths of
> > > > timing events."
> > >
> > > Thanks for sharing.
> > >
> > > > > > The NXP kernel switching down to an hs_clk of 445.5MHz would
> > > > > > therefore be correct for 720p operation.
> > > > >
> > > > > It should be absolute no difference if you work on 891MHz with 2
> > > > > lanes or on 445.5 MHz with 4 lanes. What must be ensured is that
> > > > > you need the minimum required bandwidth which is roughly:
> > > > > 1280*720*24*60 =3D 1.327 GBps.
> > > >
> > > > Has someone changed the number of lanes in use? I'd missed that if
> > > > so, but I'll agree that 891MHz over 2 lanes should work for
> 720p60.
> > >
> > > The ADV driver is changing it autom. but this logic is somehow odd
> > > and there was already a approach to stop the driver doing this.
> >
> > I'd missed that bit in the driver where it appears to drop to 3 lanes
> > for pixel clock < 80000 via a mipi_dsi_detach and _attach. Quirky, but
> > probably the only way it can be achieved in the current framework.
> >
> > > To sync up: we have two problems:
> > >   1) The 720P mode with static DSI host configuration isn't working
> > >      without hacks.
> > >   2) The DSI link frequency should changed as soon as required
> > >      automatically. So we can provide all modes.
> > >
> > > I would concentrate on problem 1 first before moving on to the 2nd.
> >
> > If you change your link frequency, it may be worth trying a lower
> > resolution again such as 720x480 @ 60fps on 2 lanes. (720480@60 on 4
> > lanes is again listed as mandatory for using the timing generator).
> >
> > > > I have just noted that 720p59.94 at 24bpp on 4 lanes is listed as
> > > > one of the modes that is mandatory to use the timing generator
> > > > (reg 0x27 bit 7 =3D 1). On 2 lanes it is not required.
> > > > I don't know why it's referencing the 1000/1001 pixel clock rates
> > > > and not the base one, as it's only a base clock change with the
> > > > same timing (74.176MHz clock instead of 74.25MHz).
> > >
> > > Interesting! I would like to know how the HDMI block gets fetched by
> > > the DSI block and how the timing-generator can influence this in
> > > good/bad way. So that we know what DSI settings (freq, lanes) are
> sufficient.
> > >
> > > > > > If you do program the manual DSI divider register to allow a
> > > > > > DSI pixel rate of 148.5MHz vs HDMI pixel rate of 74.25MHz,
> > > > > > you'd be relying on
> > > > >
> > > > > There is no such DSI pixel rate to be precise, we only have a
> > > > > DSI bit clock/rate.
> > > > >
> > > > > > the ADV753x having at least a half-line FIFO between DSI rx
> > > > > > and HDMI tx to compensate for the differing data rates. I see
> > > > > > no reference to such, and I'd be surprised if it was more than
> > > > > > a half dozen pixels to compensate for the jitter in the cases
> > > > > > where the internal timing generator is mandatory due to
> fractional bytes.
> > > > >
> > > > > This is interesting and would proofs our assumption that the
> > > > > device don't have a FIFO :)
> > > > >
> > > > > Our assumptions (we don't have the datasheet/programming
> manual):
> > > > >   - HDMI part is fetching 3 bytes per HDMI pixclk
> > > > >   - Ratio between dsi-clk and hdmi-pixelclk must be 3 so the DSI
> and
> > > > >     HDMI are in sync. So from bandwidth pov there are no
> differences
> > > > >     between:
> > > > >       - HDMI: 74.25 MHz * 24 Bit  =3D 1782.0 MBit/s
> > > > >       - DSI:    891 MHz * 2 lanes =3D 1782.0 MBit/s (dsi-clock:
> 445.5 )
> > > > >       - DSI:  445.5 MHz * 4 lanes =3D 1782.0 MBit/s (dsi-clock:
> > > > > 222.75)
> > > > >
> > > > >     But the ratio is different and therefore the faster clocking
> option
> > > > >     let something 'overflow'.
> > > >
> > > > I'll agree that all looks consistent.
> > > >
> > > > > Anyway, but all this means that Adam should configure the
> > > > > burst-clock-rate to 445.5 and set the lanes to 4. But this
> > > > > doesn't work either and now we are back on my initial statement
> > > > > -> the driver needs some attention.
> > > >
> > > > Things always need attention :-)
> > >
> > > ^^
> > >
> > > > I suspect that it's the use of the timing generator that is the
> issue.
> > > > The programming guide does recommend using it for all modes, so
> > > > that would be a sensible first step.
> > >
> > > But I tested it without the timing-generator too. Can you or Adam
> > > verify the timing-generator diable logic?
> >
> > Sorry, running without the use of the timing generator is the issue.
> > It is mandatory in some modes, but supported in all modes. Always
> > using it should therefore avoid not using it in one of the mandatory
> > modes (the list looks a little arbitrary).
> >
> > > > I will say that we had a number of issues getting this chip to do
> > > > anything, and it generally seemed happier on 2 or 3 lanes instead
> > > > of 4. Suffice to say that we abandoned trying to use it, despite
> > > > some assistance from ADI.
> > >
> > > Even more interessting, what is your alternative to this chip?
> >
> > BCM2711 which supported dual HDMI natively.
> > Our investigation of ADV7535 was when trying to build what became
> > Pi400 using BCM2710/BCM2837 (only has a single HDMI output). Whilst I
> > do have the prototype, the ADV was wired up weirdly with I2C so I
> > never really got it running with Linux.
>=20
> I think I have convinced myself that the DSIM is working good enough to
> match that of the NXP.
>=20
> I've gone through and made a list of the register differences between a
> working display using NXP's kernel and the non-working display.  I've
> identified a small handful of registers on both the CEC bank of
> registers and main set of registers.
>=20
> I noticed that the working NXP version doesn't rescale the number of
> lanes based on the clock rate, and it stays fixed at 4 lanes.

Does it mean theoretically rescale of lanes is not required??
At least 2 platforms can work with fixed 4 lanes@720p.

and looks like few platforms have display stability issue working with 4 la=
nes@720p,=20
so, as a workaround they changed to 3 lanes based on clock rate to make it =
work.

Can you please confirm, is my understanding correct?

Note:
 On Renesas RZ/G2L platform, 720p with 3 lanes will work, but it needs
 different pll parameters to generate the dot clock to work.
=20
Cheers,
Biju
