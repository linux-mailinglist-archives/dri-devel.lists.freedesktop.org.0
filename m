Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7073F9AE87A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 16:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127210E94A;
	Thu, 24 Oct 2024 14:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Jgkzt7rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056EA10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9Fpc6hpIBgBHPD7GFXSuMkEip97R1TOc4nLqZFqwdBNerxUgOfCQBmaP3t2n1eHCW3hsnRwT0jnSd/OuJQb7RWAJWn1JnQAv+NsvI95Z+LcJyCSiekwHw7eDle9LFe16ChggRzibzzmjypig3aLu/OUbH2tcGUBEuFMF7lVSULvxsUiuEoFMBL9clSyQhn5yG4sBYFn74zCYiRJ7L1iQyfuIgbrHugILgDPedc+iVpY5FzNbfkYF/Z0xOIN0GxumLFVOkPt3SMiFO1KAB4OsfljuPbwIhbnhdZhKQ9kM4sNdILURBJoJoUd57npxr5tWIXOBwwMLN00hZtMSx2WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuOC82yznwSVlpRaCxZc5NpYRcHS7b38sQYtMg9Jk2U=;
 b=R5O9clgfY369ul+1UMrBIjyQRADcOG1YN/Z9E9Kr7u03OU4NGwKe9DpE2IknIhKeN+KRyE1cn4weoxEmKD15zTBqN88Ofe87BtzppUEVtDNzcjiheVpFedpMEY261L4IcypzdMFcXXecI5tUjVtdj5z92qQJiqh+seAbGLvsp18mEtUwidaQiN1cH43cb2gbzBuY+Mqk62FsPzQMUHgU6fZLysaA/2spE3k+m8QwRnvieuFAm7b3e6HBIqAjYBL7QZkYG43QVbzrKM1u+nISelOqxvKI2rY2tMHXigP5Q6PiHt2wfAKrXLHp+if7fnLi/R1g4OzwEdKYdPyHOyangA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuOC82yznwSVlpRaCxZc5NpYRcHS7b38sQYtMg9Jk2U=;
 b=Jgkzt7rmb3BygPRzWA8sFTghqhEtfkyQjfOxBl8NH8LrnQJ8zIAo9f8TWCXTePaV8JcUVmuI7bImuQOaNESHVDeZNrhw/gxBjwzZ3U71SHq48RxDzBpX+9M8/t17GGWLjbWj0ytdP5iHgsK/mIDOBHpK/pzwIhdX3QFjYE7nBOzWyXEA3oQqT5uWaVkrRKwKeh0Z8H8zcRqZqpDwUug83XlHtG6J45QQ+Z1Z1WA+b3jFoZnxZUsQYkPOWkv2I5DxqKwsBSVA6sw7RfiY6/3+09LAcEW82Rcg8PuW5MKzB2thhOkEKjWQbilresR5DOSMYOB2JIh7l/ZXyRy0Xd4YsQ==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8149.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 14:25:01 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 14:25:01 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Oliver Brown
 <oliver.brown@nxp.com>, "alexander.stein@ew.tq-group.com"
 <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v17 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Topic: [PATCH v17 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Index: AQHbJiCCV28fXZo0AEWS4RUUOAfgDQ==
Date: Thu, 24 Oct 2024 14:25:01 +0000
Message-ID: <PAXPR04MB9448C42CB5AD837DEAE01182F44E2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <8bdf573bfd7e3feb45d7ccb53765a978a685ce2d.1727159906.git.Sandor.yu@nxp.com>
 <20240924-mottled-psychedelic-lorikeet-ef8f4c@houat>
 <DB9PR04MB945284B95FAE4FE127E6568FF4752@DB9PR04MB9452.eurprd04.prod.outlook.com>
 <wdelo4zco6v5qchdupfvbrqin4n7fyjyo6yaqbpfihdkkhceoi@ja4zxmhk5isq>
 <l27rc2lo4pt3mfwknjyy755li3q7vgqesoev25ulapwsenkkuj@w26ts47a2llz>
In-Reply-To: <l27rc2lo4pt3mfwknjyy755li3q7vgqesoev25ulapwsenkkuj@w26ts47a2llz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB8149:EE_
x-ms-office365-filtering-correlation-id: 67356af8-7b30-47cd-c796-08dcf437a534
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1NNAswaXGWjHsYpVPQRgj7PYJeJT1Guvt53NO7U81mrQpGUMkipeYUULoL6U?=
 =?us-ascii?Q?GnzMXt31O7DM67K1HHVtEmZJdFEs3e+v/Gg9/sJxTA7KbSfLyrZ/sJvvTytw?=
 =?us-ascii?Q?uv1aUOWf73aBotuwBeVJAGM29cgWf/6OkCdT36oW1EgeNc3CCh43LXTJgOwE?=
 =?us-ascii?Q?iD2e5YCUrUpME4RXhhzlPeE5nBphkY9t0j31AlSXFraqxs7apZ++Jd676CZZ?=
 =?us-ascii?Q?D8JNHHavW3++/MqKwewGYS4XHeV8aGpWJPx2dGIbCv4i6KTgcmuXzoDwE0b8?=
 =?us-ascii?Q?mUMsY22z3MExPqpTiy7IFETGEPB3sm4xRsBkwwXJo+nS28S/Z9t4RwLR9EQ+?=
 =?us-ascii?Q?E+MmZVK/9jsKS7OAEKsnr61Mzq66aLwtD3p4HD6jkfq1UFfOypjqDkCDvSR3?=
 =?us-ascii?Q?4fa2zQBYwyHz75Bn36quPCeVfb6IrYHT11apmbyUITn9L8m9Rxggf+3b6fmU?=
 =?us-ascii?Q?0nh8KW8NqBxzJFg7Ymo5vpOZmgdpYJxbhTAAgecoQYBDv8EikTz3XBlQerrR?=
 =?us-ascii?Q?BkxJd0PdGj94pfxIBmV/H5spNbrOKyBX7fsQUunCEkWt+Gx0cBPpSObzQfR2?=
 =?us-ascii?Q?1EcAkDzNDTGkAqEq6Wh7+CoLlpFg1LR6CCVlOr+sdX+Lp3cj2M1p05XReBkN?=
 =?us-ascii?Q?HTfYZW2hg9OB1UlaH51P8+gLMN9Q3vs9FhmY1VP0vSHemEY4OmFnne66GP7Y?=
 =?us-ascii?Q?pdgDO6rXDCC1rszW5xCy/LgldwnMr1LZo3v7PVHBqilMNqSOoA1WivADvPcf?=
 =?us-ascii?Q?jBpIQGEg2OWC+9x8OP/F//woXu9oH3Jg3TFo02BLRidgiVjnrrOwDCWpaR56?=
 =?us-ascii?Q?F0Km4IyW0j1WJzOw7jUX9XQnAYpwBolAtAXyq/zI0gBECMALotvvl2ye44PX?=
 =?us-ascii?Q?e/EPUqxLj3AO9bKhdOKZiQaTWxfG2oRZjr/HmatZ5lhYiEWsUVhEDjtnUToA?=
 =?us-ascii?Q?QxViLdPr+H3bPNYQ5EQh4Hy6nOJBoKdmJO9/iXuPsCUT0vXy3ODs8tDkkM3m?=
 =?us-ascii?Q?KeMu4frxxAkCBtQsfEOc70gmN/EnbYwVO/ib+cKQB1A+LlnKZfgQMvGMC0cO?=
 =?us-ascii?Q?fkGPtB9EuHZY0s4XLTx84h0UBgueTtB7P0Hw6v+xCZs7WLAp+A3pGVvds7EY?=
 =?us-ascii?Q?72v+bXIofgRZgejBC3S9vq/wWyVsxSXPIvYdQefWsqBi18H6FTfVLaFID3VW?=
 =?us-ascii?Q?GVeXzQodkvuqBYvS3BANl6UGxOsWdFWvH4o8P3o7FnYXrZSSTGwLtC1VDIFl?=
 =?us-ascii?Q?sAc5lKXY7+gj4/n+XXkktR7yVVLW9T9g5fEGmP2BzOD2EzoKjV+sEJlq0cf9?=
 =?us-ascii?Q?iX7rxtK/tgwECGO3rcFgFoYl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vbR/cUXf84Y6QPogvr8KjwgAXkiRxoClMhTto/vIEs3x3bhHdEKkALyTSxKw?=
 =?us-ascii?Q?wC6RTtjPL2aJKlPhWJIdbz0Yf0PkBN2rji8BAvQ/8wVUejX3rWkRP1UzXTdD?=
 =?us-ascii?Q?SY0/AnKxlJEiJY0yHAdDwhaVJc0r1e62cDB36D7NX+jHUvT605N6csCoeD2K?=
 =?us-ascii?Q?Nlb/R+0h8L7A+PtgYEn24NafVHqibSIbkzPNc5OyM6fMgwkoHCp56SlT3AwA?=
 =?us-ascii?Q?DbWT+qaMet11WiEraZYFl0LKbmgq+k3JaW/OBUgTJ+FthRPiG70SNG7FeVCj?=
 =?us-ascii?Q?srtU8YZyb65svqAtSHMM+aBvcQrsFMIRkx8RCrf8QZ8f7plrwzbpRsWmaZwf?=
 =?us-ascii?Q?5X59oHl8kfU790sHWpEmBW2/aPnQmKdm8QA5QR4YSY533bymTJVv0LSlNoBt?=
 =?us-ascii?Q?XleaMVzVmUB39mCgC+vVtn+7xYvNkBlCZ2P5EKQxKogXyg3IfL2zngWpmPaC?=
 =?us-ascii?Q?kWzu05eqKAPn7W8e7inOIExFy3KekRZibZI4E1SFeA+VHtFoSViogp4e17xJ?=
 =?us-ascii?Q?lgDIlAaymO34AZTJhbIMFWBjOPsT0fzzYAuacEOGMGdzVgcZxnRCKn/qzKvP?=
 =?us-ascii?Q?ybk3VfW4fdV9inNhAaKz+N/g0lX9scoIvGMo4y7YGnqiH7iAmu5/TavpImqP?=
 =?us-ascii?Q?XvICDJMfa98wB/WSSYxJWZcBOaL6mdg9BKN/ZMHeGqC8nnG0q8+GAAAjgkqc?=
 =?us-ascii?Q?Dw9T65itKTjAcsGNeOkJWujxIuamZHNVIfJl99RhX3paXAiRBHPi6Fh2HVsk?=
 =?us-ascii?Q?ot0iFZgTZdKnGdH1StdBCUXyGi6a3QC4nXU4dY17/kIJEr9tMABXFl34CTw6?=
 =?us-ascii?Q?6PWWdRBfkuBH1IzejyN+bOdccSn+PwZfYobx7pUOKBSWTy4Eoo/Neh0qziix?=
 =?us-ascii?Q?G9X/3yceUBPb0E2XoA4Jo+yYLFQIUx88B4IzhZFhKTuoehikfm6PmdUkAZkE?=
 =?us-ascii?Q?Mml+TVaSgUGSpEvx2Njm7leEuOO+RuRfjCQ1oChBnEOaYx2fTKT1nPauyOmk?=
 =?us-ascii?Q?mYs2hPIP8bJv6ZRC/Thnn71FkPm4vGfiUC3IBybovjkNWlI0qhCZU6/jlqv8?=
 =?us-ascii?Q?ppieTx4Y5ngYweRbi8LzYGDg1+GyQHq2YrVGSNOsBXehU0BFTY0dq6tcpT40?=
 =?us-ascii?Q?umaDxJuJQ4u7cZjWklyKtuL5GNKQifU2FQn9YVhOpntVLFU1QjcVoU23NTfd?=
 =?us-ascii?Q?nJbg58Fum0mTS4oExKC+2tcO8EGk+kaBgD943xwOWGfmNVyFxiLydOMYmHS3?=
 =?us-ascii?Q?TTBA/J3pndqPw5cmksrmkRnNtkZKtSD1McWKHjlNPckyCmQ+K/gobAP3hBg9?=
 =?us-ascii?Q?WgbWQOabUpRprJPMxrNGxZWg5cKpSGkVqHQLz2ebreg+PTV4z8t6i8P9i+bm?=
 =?us-ascii?Q?ZfAGsAcXkjFi7k/zSqDiNW2zchskmjrnVOFeCeAsjWvRlwDWN2aDxxG8EsbZ?=
 =?us-ascii?Q?d4ow2HGmRtvLUZxfD9qh2Yk4R4e5dKiNDoM9D2ZmPB5ON4KYE8hKeeh4Tc28?=
 =?us-ascii?Q?2jbxjcDZimQbZ3g+6yrwu191CjD9ZhBnvD4sJ+9DwAlPpuWADyMaGIRNklGl?=
 =?us-ascii?Q?bZK/VMysJT3/forTgWU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67356af8-7b30-47cd-c796-08dcf437a534
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 14:25:01.1533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /cZ06DdHYpGK2gQYCGl1GtnbY4SSJkkcnybMiUA2wZrGgPyaN82jPN9xsvV33Y86XUG400AUnyTZMjAsTyvI8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8149
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

>
> On Mon, Sep 30, 2024 at 10:18:06AM +0200, Maxime Ripard wrote:
> > On Sun, Sep 29, 2024 at 02:34:36AM GMT, Sandor Yu wrote:
> > > > > +static void cdns_hdmi_sink_config(struct cdns_mhdp8501_device
> > > > > +*mhdp) {
> > > > > +       struct drm_display_info *display =3D
> &mhdp->curr_conn->display_info;
> > > > > +       struct drm_connector_state *conn_state =3D
> > > > > +mhdp->curr_conn->state;
> > > >
> > > > That looks a bit hackish to me. We should probably provide a
> > > > helper to get the connector state the bridge is attached to.
> > >
> > > How about code change to followed, is it more clear?
> > > 370         struct drm_connector *connector =3D mhdp->curr_conn;
> > > 371         struct drm_connector_state *conn_state =3D
> connector->state;
> > > 372         struct drm_display_info *display =3D
> &connector->display_info;
> > > 373         struct drm_scdc *scdc =3D &display->hdmi.scdc;
> >
> > What I meant was that I wish bridges had a way to get their connector
> > pointer. It doesn't look like it's possible with drm_bridge_connector,
> > and we don't have access to drm_display_info anymore.
> >
> > I don't really see a good way to do this yet, so maybe that kind of
> > workaround is ok. Eventually, I guess we'll have the scrambler setup
> > in the HDMI connector helpers anyway.
> >
> > Dmitry, any idea?
>
> Unfortunately nothing significant, I didn't have time to look at the scra=
mbler
> yet. The platforms that I'm working with either do not support HDMI 2.0 o=
r
> require no additional setup there.
>
> Regarding the drm_connector_state, I had to go via the bridge->encoder, t=
hen
> drm_atomic_get_new_connector_for_encoder() and finally
> drm_atomic_get_new_connector_state(). I don't like the idea of storing th=
e
> connector in drm_bridge driver data, it seems like a bad idea to me.
>

Some DRM drivers save the connector and its state after calling bridge_atom=
ic_enable.
They then reference connector state in other parts of the driver.
Could there be any problems with this approach, assuming all subsequent use=
s happen after the bridge_atomic_enable call?

For the drm_connector_state in cdns_hdmi_sink_config function,
it could be removed and replace by tmds_char_rate, the parameter could be p=
assed from bridge_atomic_enable.

For scrambler setup,
I'm thinking of proposing this function as a new SCDC API.
If it's okay, I'll create a patch and send it out for review.
We can use this API to set scrambling and clock_ratio in both my current an=
d future drivers.
290 bool
291 drm_scdc_configure_hdmi_sink_tmds(struct drm_connector *connector,
292                                   unsigned long long tmds_char_rate,
293                                   bool scrambling_low_rates)
294 {
295         struct drm_display_info *info =3D &connector->display_info;
296         struct drm_scdc *scdc =3D &info->hdmi.scdc;
297         bool hdmi_scrambling =3D false;
298         bool hdmi_high_tmds_clock_ratio =3D false;
299
300         /* check HDMI sink type, HDMI2.0+ or not */
301         if (!info->is_hdmi || !scdc->supported)
302                 return false;
303
304         if (tmds_char_rate > HDMI_14_MAX_TMDS_CLK) {
305                 /*
306                  * TMDS Character Rate above 340MHz should
307                  * enable scrambling and TMDS_Bit_Clock_Ratio
308                  */
309                 hdmi_scrambling =3D true;
310                 hdmi_high_tmds_clock_ratio =3D true;
311         } else if (scrambling_low_rates && scdc->scrambling.low_rates) =
{
312                 /*
313                  * Enable scrambling when its capability be indicated
314                  * in the HF-VSDB LTE_340Mcsc_scramble bit
315                  */
316                 hdmi_scrambling =3D true;
317         }
318
319         /* Set TMDS bit clock ratio to 1/40 or 1/10, and enable/disable=
 scrambling */
320         return  drm_scdc_set_scrambling(connector, hdmi_scrambling) &&
321                 drm_scdc_set_high_tmds_clock_ratio(connector, hdmi_high=
_tmds_clock_ratio);
322
323 }
324 EXPORT_SYMBOL(drm_scdc_configure_hdmi_sink_tmds);

> >
> > > > > +static enum drm_mode_status
> > > > > +cdns_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> > > > > +                              const struct drm_display_mode
> *mode,
> > > > > +                              unsigned long long tmds_rate) {
> > > > > +       struct cdns_mhdp8501_device *mhdp =3D
> bridge->driver_private;
> > > > > +       union phy_configure_opts phy_cfg;
> > > > > +       int ret;
> > > > > +
> > > > > +       phy_cfg.hdmi.tmds_char_rate =3D tmds_rate;
> > > > > +
> > > > > +       ret =3D phy_validate(mhdp->phy, PHY_MODE_HDMI, 0,
> &phy_cfg);
> > > > > +       if (ret < 0)
> > > > > +               return MODE_CLOCK_RANGE;
> > > > > +
> > > > > +       return MODE_OK;
> > > > > +}
> > > > > +
> > > > > +static enum drm_mode_status
> > > > > +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> > > > > +                           const struct drm_display_info *info,
> > > > > +                           const struct drm_display_mode
> *mode) {
> > > > > +       unsigned long long tmds_rate;
> > > > > +
> > > > > +       /* We don't support double-clocked and Interlaced modes
> */
> > > > > +       if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> > > > > +           mode->flags & DRM_MODE_FLAG_INTERLACE)
> > > > > +               return MODE_BAD;
> > > > > +
> > > > > +       if (mode->hdisplay > 3840)
> > > > > +               return MODE_BAD_HVALUE;
> > > > > +
> > > > > +       if (mode->vdisplay > 2160)
> > > > > +               return MODE_BAD_VVALUE;
> > > > > +
> > > > > +       tmds_rate =3D mode->clock * 1000ULL;
> > > > > +       return cdns_hdmi_tmds_char_rate_valid(bridge, mode,
> > > > > + tmds_rate); }
> > > >
> > > > Didn't we agree on creating a mode_valid helper?
> > >
> > > In fact, now I'm no idea where should add the mode_valid helper funct=
ion.
> > >
> > > In struct drm_bridge_funcs, it had mode_valid() and
> hdmi_tmds_char_rate_valid().
> > >
> > > If create a new mode_valid helper function in struct
> > > drm_connector_hdmi_funcs, Is it appropriate to call another API
> > > function(tmds_char_rate_valid) at the same level within this API func=
tion?
> >
> > I'm not quite sure what you mean, but a reasonable approach to me
> > would be to turn drm_hdmi_state_helper.c hdmi_clock_valid into a
> > public function, and then call it from drm_bridge_connector mode_valid
> hook.
> >
> > It's a similar discussion to the previous one really: in order to
> > implement it properly, we need access to drm_display_info.
>
> I've sent a proposal, [1]. I don't think we should be using
> hdmi_clock_valid() directly (at least not before sorting out the EDID / h=
otplug
> handling in the HDMI Connector code) exactly because of the
> info->max_tmds_clock. If it gets stale, we might filter modes
> incorrectly. Also, I'm not sure if it should be left at 0 by default (or =
in
> drm_parse_hdmi_forum_scds()).
>
I ran into the same problem about info->max_tmds_clock when I tried to use =
hdmi_clock_valid to check mode_valid.
You create a function drm_hdmi_connector_mode_valid in patch[1] that does e=
xactly what I need.

Thanks,
Sandor

> [1]
> https://lore.ke/
> rnel.org%2Fdri-devel%2F20241018-hdmi-mode-valid-v1-0-6e49ae4801f7%40
> linaro.org%2F&data=3D05%7C02%7Csandor.yu%40nxp.com%7Cb6594cde65474
> 3f8f1fe08dcf04effb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638649469314303142%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C
> &sdata=3Dt3B356GQ5b7NYN1tspIuTmMLf3fQZCycbJ8UrSswnEk%3D&reserved
> =3D0
>
> --
> With best wishes
> Dmitry
