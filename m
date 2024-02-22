Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29985F581
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BC910E8D5;
	Thu, 22 Feb 2024 10:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LlDk4/Sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2079.outbound.protection.outlook.com [40.107.113.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE4510E8D5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxII9VGzEW2CEjwFQ5v319F6GjunMT++JgpOPzMZKavQsX1/4iiYzjNSctZJ6ikc3iZBsKRqVzADePUpUcl1EUjxF81P5NCs0bpyIJwul8acR/Nnz4INiTqCY0jsOW05PjzPwfzcNyymdckxq3SqehLz43mSsLFPscX6VXWpSva473YDfakLCuIkKOOjnBRXk7Y2g/6Wv/gf6wKQsiDKR88qlZYPf+Hvc1YHiZPODnf2pGG4dUcoAGXi4F1A29H299BmirLBPzF/oKR46l8ip14mHpDjpC5xSV9ocRAnaGVizNtQ8T9QbtBUmm0fbm55AGyvx8+9wPb2/bpYEhSWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eGVI2CwMWTNEwz5S5JTGjN1fnodE/+fEAfCwvhuTpo=;
 b=nEyfOMuDlm24r9UHlZ36tv8vG5bz9xavWnJO/6qHUUXtlgs8kHZYrOTkiDeVOprW4mYs5wAKBxY+VHaBEtTwWZlgAX/hnG8xcCp1yKqG/N+9IVt5xG4aqfTLZcYRbenvN1MH3R1c7BAiKvCSkCBbjpacon++k5Nsdq/p2BD9f6uEIDOcPErvJ/xvIIg2FHtGpnwsiXn/REEhmCTLURfqCrLqS2oHy9g830EswDEeKIbSNYw/kaxvjjgVgtrlAYVUEsmk3ZUFdnyVNwZYGMcpOOVwhro/WIv7Wwg/UhXPSKmryrhmu6dqYsNjqr8jpt7ciDsGxrzTdBL6MLc+rzHWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eGVI2CwMWTNEwz5S5JTGjN1fnodE/+fEAfCwvhuTpo=;
 b=LlDk4/Sc0/B3fcvT8lurgeWd4DHYeLlXjvqdssh62CXPfZjXcBqJUWWcFeOTQPRMPenH0xANIO11qPPwoYqhLZHxoQiiSxSOBCphJU9/mpwwlkCsYCDeL/NE7mKpkKDp3Ebtx844UWH5iAQus/faoWolhNGe1KbzAuBoqJ/mh3U=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB5775.jpnprd01.prod.outlook.com
 (2603:1096:400:46::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 10:20:26 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 10:20:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Thread-Topic: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Thread-Index: AQHaZXVtHaNSTT51VEKDU1bQITgsD7EWJOCAgAABhxA=
Date: Thu, 22 Feb 2024 10:20:26 +0000
Message-ID: <TYCPR01MB11269988433756CFB1D8C91AB86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
 <dmtawf7kybdkhf3tjp5chuwn54szunlme7l3gtq7bn7sxntvge@ozgpn3lljhmg>
In-Reply-To: <dmtawf7kybdkhf3tjp5chuwn54szunlme7l3gtq7bn7sxntvge@ozgpn3lljhmg>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB5775:EE_
x-ms-office365-filtering-correlation-id: d75014b3-0b3d-4436-dfd8-08dc338fe2ff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bGCRjGJFi6Kztq2PaX3ZUKqqf5iwmF8nrNzeAmD8Ijk1gqYUVowd8yOAn9xnL3uXyRy3MO+/jWbQ9UdXJpddlIW6VDJaGUGhKziBbEkgxop4+8kaGmX8+paTZc3meZiQ1zq95R3Cx7aGF66vUfUWVWpogCqyVkcIuNcHxpUNJFMb4y3p1TTQTr5IMTZ4kcey3oHoygsGTyKFD2pdJ69vOahPUeEUi37/aTK8kK8cAo5Xjbp3XGXIChNI3ZOaBbKEo0CVhNCi6uT0aTl3hBa47TeSH9OIC4zu0WkaGBAGVCQBZWWMJK8b6cjvyRTMiE7jCcDwmEPcdRAwx+USlUznH/sSZl5GXP2Uta18OQgbqBrmHpNDbPVyOuQ51qK6mg9HWnTRFIQj/g2Mdhd9Xi1EiqpbdtJ31vX0Z1Fo2G0K/CyzhDO82p5xLIIG/gS6CP340TAykNZoOv/0VeDf10o6Qhau0diuwPp+xWIfFArQy6JFaLvFSvWd5Q5PrTyD57kLbukwQQmGgjYs3L7+lnvnv02gtj2NNDTh0D5nsUXHnVOL0VCb1sMwNGB1ljJAlSuitO8A/15E7XPnFKvMzlgqeeNxjBwf1u2uxHpsGYVXfHyI4ksxl166NYnQZIEg6TXz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nreBUdksexp6BGV5thC7+vkgnjxURVZeBb9OwQxquvVJW371CyKNgVbcLjWI?=
 =?us-ascii?Q?WtwmieUg7Q99oor91pEXxPv6eglAnS0Zj76ouEI2SKBnDlBOQDMdPZ3InRJI?=
 =?us-ascii?Q?yotPmYY053imqe23lFMZzQlsZaHkf/FCqIcVTJVRzAnwSrPCZa/Alc9fKdek?=
 =?us-ascii?Q?LPpP2zXfZe/dB/5N7br8dZ/fIHrn5xuFHvfeT+mpiqghLaIPVvVa8BlLitOW?=
 =?us-ascii?Q?BBvghrD7PA0DnC28dzlOjstnboXlbpdkqTiI/H2OhWOZaO+8RmeNe+cx5jw+?=
 =?us-ascii?Q?+//d72GNXwJGmaaFd7lTEKNo4AO3wckaznLvIGg9DvXmPM4IYLgSA1cR5XpY?=
 =?us-ascii?Q?GLSudDHyJkNwtUWfeqU8GXbVuhyq180gopuVzrhYpVE7fjoREPBozazvRKPA?=
 =?us-ascii?Q?AcGodnyeR59bZn2rJGihdiHZ/oaPNDTn0ZQJouVgVppYyj1AOKRn+l0f8bde?=
 =?us-ascii?Q?bPZphCyoiFa+f4+7tsRJ9QI6DFwDqINf0e1OZsj6ifb7xPZWJSOzMhVvLjMa?=
 =?us-ascii?Q?it5M21Tdxd8Ds2rcrhFkTvB4lc0gPEYtuqmccRShDQGzeHqN5u//srfH46xY?=
 =?us-ascii?Q?zCHS3kiOQ5nFvB74vT2cM1JVCkikbCrHRv5e5Nu9ybufjzV0rVzC88hDNSjt?=
 =?us-ascii?Q?IUnZfuk8EtAaHkUwGKDqrCuayJtqVWbIsJNbAsLh8edgyiFjVq00TtIY3938?=
 =?us-ascii?Q?JDIURQystYTuet7t4ESyT6dDsDNVmTNzVvvhBBR92FeTjniZBrjyIKkY85EN?=
 =?us-ascii?Q?ptSPWFV2H6sCyCQgpA3XlG7hIs31YLq2PN8vor+tjAA4w88gjA4x/RA2Dz9S?=
 =?us-ascii?Q?PA+zf+aId6VJrm2pj1UgmYQmZtGy0wmtRlnjgFhcX8LLdIIuMaMobLBa0UKX?=
 =?us-ascii?Q?BW4lPPjnYtnGwMzolavoAQufJUCPtoLIfGCmLszh/tTdBvUgWivfHW8k+0HD?=
 =?us-ascii?Q?zGIMpAzJZY9gM4r/VFWDTGE2jXhh/E1F5LDQIrQKJVRzhy5Uh76tOZ9Milde?=
 =?us-ascii?Q?Sc5efUNVAKxSY82BO4eZSEsVo8r2FumYIWwUxRd7BhG0b+tYrlz7L93I4DI3?=
 =?us-ascii?Q?7sgBG7EidiP2Cg1CoJ6xnt0bal/RdlPsOYVaY2+J4vQl9kRVghXEvC4tXnea?=
 =?us-ascii?Q?WE2TTsixYiMlW/fxDRivn4y72AbMjwaSCgcd6jxM3Z46B02ngGoYIqfWTdBO?=
 =?us-ascii?Q?drccfaThMHTq2wBbiPuFxRqblNr2x4MjLrt3cOnu0HYRLueqsCp+zGT2ALjY?=
 =?us-ascii?Q?qLzvsZyAStZMkToNCf/Bo3gFOTXmqMQWKWJKEgbUI8sMlVyarAZ8fiRBk8bI?=
 =?us-ascii?Q?aRIGPlfHKThDnEvbDSA88lQ7mhvSZbERoq8yhnueeZimJIwD/3Fc6SooS5hx?=
 =?us-ascii?Q?4mhrbQVE+rZNbD4tlGfm2RxTFotWQrb9wdzexUV0Ald2IIJ8MnGV1DcgELuj?=
 =?us-ascii?Q?w5cuhoAlV+jTMsCo58I9mPX3zumhUoyhYAvDG4+ITGxQs7d3Ie2YofBonWgI?=
 =?us-ascii?Q?ShWVeZeCDDPRcm2huuxldQM0TFPXsX+phN5JjDIExRnchVvY6FaUiTNXeaLw?=
 =?us-ascii?Q?Q1tTc5NTbZvTqpx7HYttUsGds8FnyRxk2eKg84KP2gkkBOUikl8A20vTonC2?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75014b3-0b3d-4436-dfd8-08dc338fe2ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 10:20:26.1347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zjf9bBq8iVbyXZ8q9v164cxfREaotVIwvGEDyhrNm5IBBQZoSut1Wwy8+sfthw1+QjL02AwBP2xKdX+JChvOzMzwdnz5gQsHw1Q9M7XKRhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5775
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

Hi Maxime Ripard,

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Thursday, February 22, 2024 10:14 AM
> Subject: Re: [PATCH] drm: renesas: rz-du: Fix redefinition errors related
> to rzg2l_du_vsp_*()
>=20
> Hi,
>=20
> Thanks for working on this
>=20
> On Thu, Feb 22, 2024 at 09:56:30AM +0000, Biju Das wrote:
> > Fix the redefinition errors for the below functions on x86 by
> > replacing
> > CONFIG_DRM_RCAR_VSP->IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1) and adding
> > EXPORT_SYMBOL_GPL for all:
> >  1) rzg2l_du_vsp_init()
> >  2) rzg2l_du_vsp_enable()
> >  3) rzg2l_du_vsp_disable()
> >  4) rzg2l_du_vsp_atomic_flush()
> >  5) rzg2l_du_vsp_get_drm_plane()
>=20
> This really should be two patches: you're fixing some symbols not being
> exported (because they need to be called by what other module?) and then
> fixing the redefinition error you're mentionning in the title.

OK, Will do.

Cheers,
Biju
