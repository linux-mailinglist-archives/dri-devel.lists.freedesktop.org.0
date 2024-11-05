Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562F9BCE9F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE2210E5AF;
	Tue,  5 Nov 2024 14:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d+jBEwjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2069.outbound.protection.outlook.com [40.107.104.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B33410E5B1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSgSFOQ0xiriIe2tEL8lh8YEMwOE7QPJcSONKVdURYuPQoWhlyB5dm842yCx2Vnoo1vajY7iNkcdUuEkhEXMuztvu+6IvTB819CWwzXS9SH735J5DNaO5/DSEo2MzSJymLfKmluZbRQnx9LYNJV682fZwUr20kx+C3WRlDJRM9kvN+eAl9khARkyAoACN303kHeWFBX17cMlkGQymqrYjvCguJ1GiEcKywojuxTGqGimrQ28zp05m04fd0RFXcZv9uElN2iShYAJbDVLM4BcD5xD2jqABBKWKmag/HL+p9v6Mp5MLPZtX5Mc6n4bQsYKFRB4EnnXfF6sbBSXokj8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baJlWTgCiDVV5ZbTs059muQijImJEuKE5oS2n+Zyg3Y=;
 b=fqlY9O8bltziNNiAnvV2fYxAI3gsjsa/fq4KymNeKyK9h61Jv2AWZmNEJ69x420nyY7yxxVfi/sd3YC4MM3gha0RaYjHyjyUnUtoFufPnxDyxpux1fyamwWz9g4C+ySWcwADPfdzkQaDH5IjquK/zmbYbVZbV0kWjQupOTZ1gIhQQ++0IyaetwjzHPt8G88fiARcuXayw4ijACMx+3BoPL+GwmOg9gF0GjDVUexcnyQX8WEowLaO4/Lq0VYuu5koBRsMj028UnDT4fb3eeB5nOwa3DrA5l01OfCoxsri2KjmLP6iHwDBBXqARzlXqqbUpecrvOsmsNDZIYqWxpFzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baJlWTgCiDVV5ZbTs059muQijImJEuKE5oS2n+Zyg3Y=;
 b=d+jBEwjoVn4pZi4g7U3NjfSQDuNgPpFbafJ+LtsuiagjdRP6NQdzIxJ1VFg689hv3KJeW6P6m4je0g7FeR89DqG9rRmaCMumxgZK/8gXdRlq2zxU8EZ8tafuyqFgl7tNJFwnXdeos3nIj3S9TMEMW5/KRmZY0ior01HSUqgZT4SdgUWtPNtXty4WeUbI0TWgJNJz7wZvY6ivx+McVezRpeG24wT1HTQ9GtjGWveU1pVzHIfi93dKCX1ei2qi0b94/dwVx8zVzaZcY85to6j5PBbp8psjkTn8G8i/22T2PWIvzS7RgNokfI7g71r/JwxQ2SadRuysQXMnHIlhxtnHgA==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10801.eurprd04.prod.outlook.com (2603:10a6:150:21b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 14:05:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 14:05:42 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v18 1/8] drm: bridge: Cadence: Create MHDP helper driver
Thread-Topic: [PATCH v18 1/8] drm: bridge: Cadence: Create MHDP helper driver
Thread-Index: AQHbL4vMVlYXUnC5jE6bQv95zMKe6w==
Date: Tue, 5 Nov 2024 14:05:42 +0000
Message-ID: <PAXPR04MB9448D64AC3748909BE87A19FF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <9fe153c4f0b8616782fba1f7c8c2223c4f0c1d78.1730172244.git.Sandor.yu@nxp.com>
 <txezouzqnw6hzn7c6bmp3mgp6b3vjnsuf2txcbeotklekipl7w@m45grnhct2sj>
In-Reply-To: <txezouzqnw6hzn7c6bmp3mgp6b3vjnsuf2txcbeotklekipl7w@m45grnhct2sj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|GVXPR04MB10801:EE_
x-ms-office365-filtering-correlation-id: 1a2f7444-b802-4685-d766-08dcfda2ef53
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MFci/JjALuwPoIlH2eacJAi1q8MBoDNl0e6lO5LfI/0sTOcFK9ir1tWEzMgm?=
 =?us-ascii?Q?aqyIBUGHMcqPbfYecWi7htjCj+KyUgQKlQ4hxUqMYuzL5RBYqXYuvjnWxOLW?=
 =?us-ascii?Q?ZDHu85pQqW04i1lAG2mc3MdeiNb/uMxwqOoXSSWsyBr/IGKqEJYqRIO8bTJO?=
 =?us-ascii?Q?8HqPoBIV3iYx0Z1UwCpEauAfVxrOhlqJw8ESD46FsJnsEdxp880quqDqg0b4?=
 =?us-ascii?Q?af7EIaa60wz22X6pdbDnekIR4xSSiZCn0uqvNnZLNMf172qhui6QLjSeIjad?=
 =?us-ascii?Q?586LOfPoLbuIrzJPgc9N9NalmECTfazN/7MiCDnb96zmhFBchNs2KB+DlqEv?=
 =?us-ascii?Q?6JlYkbXTFVrt/WCGYetYNjnMBt4DEF5XP/6NlzKG3MBOBCYpGaGtw2PQB8Gk?=
 =?us-ascii?Q?p+Zc2MUieR9fKw6XEjZ/1TBkK0fzv0sME/vQXMkkVFFTA4CF32e6OCKsAPBX?=
 =?us-ascii?Q?lnybWP6o70AbKv6WdOxSYK3BTKj2HumuxIaRO/MeAyK8ESwBVcbZREAsAs11?=
 =?us-ascii?Q?fZrRnmM9o7fWGil4KGMI1zAOUaI4/m7pq10xVxlA2GPkVCe8J4wWmbflZywb?=
 =?us-ascii?Q?y7nxTMGrZtEA1UMUlMvc8Pn7ZMu/xpKmiC1/kMLijHTVE266YnA4JIHgpNzL?=
 =?us-ascii?Q?89vRy4fsmWCEB/vNGK68NBQLXs/pILJdezm6RIIEuLFO5TH4e3u4MpD+4gt1?=
 =?us-ascii?Q?2lp8036A2UpOZHmzLHpjjLKOD0XY7i3Lbe7rmQdYKRPMJfI1zjaNi656JGG4?=
 =?us-ascii?Q?JdZO1g1EAGUL5EHbO5/FD7eWTEk1UkClcPzA+SJ8ftfs9sJNutSeqk6fpHh8?=
 =?us-ascii?Q?mq+ouAwgoifbQ+SvBzAfcrSHhcSWFO2yEUiEzniIjNFSPTMvHGCrHO55RARe?=
 =?us-ascii?Q?7Vi/MIxcCEjYBmrdpDH3icCcZylnKAu50pIQco26o0vTbYeUmJiqPly7iOmm?=
 =?us-ascii?Q?xJaKjY9ZLiGJdy0D+jWg7jDHUKVypXpKCRSUKbO8P8eLudn0r50W4cGEtdAA?=
 =?us-ascii?Q?17Qu74XS/OPCkXb1r58tUhn9Z68hf7fT179beZxtG65Q0+woA8KYfAVGDxQk?=
 =?us-ascii?Q?JhcafMWCt1vy7c3fYxcBWkLnUUXRxiLPGAmuc+LCEsqxm/V7UikaDqzkTJr4?=
 =?us-ascii?Q?cxOP80z7qYDhhRkzy/CI3kyRXULTzTwKQ3ZzdfCgH7eqOfgjgs0k8c9reNVG?=
 =?us-ascii?Q?x/a5dVpUBvzpRf8G8FCCZff6kWDwvdpu+lF3uVf/vxweEsUE5Ar93qwpCasQ?=
 =?us-ascii?Q?l2XeFNK95RbCrkvj1nRrJJPMoMcvadVErEXEeUu8GB4w50zduYg39CTfEdv4?=
 =?us-ascii?Q?rFzZtS2Z9jyX3QZgUBhyPo14I8GUdftodcyCOlfSjsnn/Yy808+WrxHiTsFx?=
 =?us-ascii?Q?njqFIds=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HAifprhXvC8V18bWmD5Iew+aI+lMzh2+wjgk193Xh9qcjHGgYWtFEq7l6x2m?=
 =?us-ascii?Q?+tCW7TbasV/OdYR/Q7vpZHofajVjLu+XFnwB4uMfNLgDshrMShgeqXScW7PV?=
 =?us-ascii?Q?eMlHz5NYOnL8w2H0BmGs83tJTGOb+4rWLP5LESBpLpivTrG9VN1MFOtceLI8?=
 =?us-ascii?Q?rMEArh1m7EtRQ/n4jHv1iycDwM58D/L/CeGqBD8i6GMtgm1vMdaOjR49YNBp?=
 =?us-ascii?Q?sGjt2cH9itQmZrBe0MFzGB2UPG7UrOFjNslDU+7vfPUoRR8CgCuUQbl8M+5N?=
 =?us-ascii?Q?W1IA41Fhp5HmWfi/9w5xsEk/RkCvwn9+3W4aW3/D960A38G66C35mvGFEEsG?=
 =?us-ascii?Q?Hj0lB5yAgFkipZ6Y0BD1SiIQppOY/w6uIpnH8OQXGX6+OMmUWfq5cvLDqf8R?=
 =?us-ascii?Q?PR3WQD9y8XpKvhVnMzqPuVf7YnJDjcZj13ZnyL7MDv9hFlPbdWCUdSlIUTXd?=
 =?us-ascii?Q?S/rmddMKkBC8JKg450kpejjubpFLSsvVvMFbL7C4rbz0/c4vRcZ+atzjyTaq?=
 =?us-ascii?Q?qpEVfRTO7mHNAVXte5l2NuLJbvbLNCZMJIRVd6jcn1qU+mOKCgYgcRVEj3yK?=
 =?us-ascii?Q?wQzGL6x5S+Fe7uLL8fBv3isRVuTy/WOKF07xjixcX7ipaBTSeSVDFhRJmSkT?=
 =?us-ascii?Q?hU0fKnQFYpEgsXYBDB19Ru17ob3v3a0I1UnKLIqEdtv0Lw/5GOIO743aSwrE?=
 =?us-ascii?Q?B0AhjSHM+ou04yVtA7aomz08LSQzzbY4bTsY4fWxU0V9vuYDXAL/erEWqBmi?=
 =?us-ascii?Q?dIdBwByNGUZBJAU5XtLpFDS589j8lHlN/S97TuPH8d82rLx2Nh+5S5jd8UFo?=
 =?us-ascii?Q?5vwT+P2jNDFlG9ZJO4llILUXbJ17nNMx8fyhgkz6fIvBoYbeefLOaNXK6pd9?=
 =?us-ascii?Q?HuHrpxIX+UcM3OCjP+8OTm3/bjGFzBsXHOpvSFpIzU5lFV4WsceWeiO4eTW5?=
 =?us-ascii?Q?WB8n7aqTaL5JFiU3h4FVvt/xa6EdIOW031+2RqRe0vdf6GOV7GNSCPJdgWGH?=
 =?us-ascii?Q?4RLQz0DkiefL82v/GeFctm53B+jKapoGRi0BO8+guvwzWE7egyW9tCpMoOw5?=
 =?us-ascii?Q?UbU/izmIC+G5yYMiqxnq9AjNtopOBEqXnakY+ZN/A0c8p7VgtQ44R/oNi2GS?=
 =?us-ascii?Q?Xksa29AFIKEt3ethkgL5duXSlnz+UZgDRbCfoKqSOrX7YgdApqCjrq9/4qiG?=
 =?us-ascii?Q?ErQISVOf7D5RXbnAKaqhaiepbwjTZlh1hIRUYScobDipWbXQuIjMfVTNfUtZ?=
 =?us-ascii?Q?dOWQOJ8hz3l9f8CacYn4ZU6HVsJO0x76kd09FuXiuRvWKMTlN902twNVxFHI?=
 =?us-ascii?Q?u2xPJEXg0pkLkUxEQze1Ei4SELXs7pMPcZlzT8AG6RTcRTvI804SFydfwBWy?=
 =?us-ascii?Q?KTl4iiakCt8X9K1oTgqWWBJvemWPjYqPWYgKECJNtjsytn3wZe7V2bYp0tY0?=
 =?us-ascii?Q?IDiD5XTyhymUN0MJtcQ7Ho7HVvt4l5CvIGKTkmewJ3fKgHtuzIIN6irxK7z6?=
 =?us-ascii?Q?ooerk6QCtId12EAB2FSxehMVintZGWv4ru+c8INJLM6FydTcH7O6FON67yO1?=
 =?us-ascii?Q?dpXOAoX8sBt6682dIZI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2f7444-b802-4685-d766-08dcfda2ef53
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 14:05:42.1520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OfyFokwQ82RvoJLeCUOTrM2zcIwNH77QkUh+qOXGnyxRio6/hJtk37TFPXr08nArMrYSRoMWdqPA0Ckbx8+IRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10801
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

>=20
> On Tue, Oct 29, 2024 at 02:02:09PM +0800, Sandor Yu wrote:
> > Mailbox access functions in MHDP8546 will be share to other MHDP
> > driver and Cadence HDP-TX HDMI/DP PHY drivers.
> >
> > Create a new MHDP helper driver and move all mailbox access functions
> into.
> > According the mailbox access sequence and type of security.
> > Six mailbox access API functions are introduced.
> > Three APIs for non-secure mailbox access:
> >  - cdns_mhdp_mailbox_send()
> >  - cdns_mhdp_mailbox_send_recv()
> >  - cdns_mhdp_mailbox_send_recv_multi()
> > The other three APIs for secure mailbox access:
> >  - cdns_mhdp_secure_mailbox_send()
> >  - cdns_mhdp_secure_mailbox_send_recv()
> >  - cdns_mhdp_secure_mailbox_send_recv_multi()
> >
> > All MHDP commands that need to be passed through the mailbox have been
> > rewritten using those new API functions.
> >
> > The register read/write and DP DPCD read/write command functions are
> > also included in this new helper driver.
> >
> > Function cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
> > because it use the DPTX command ID DPTX_WRITE_REGISTER.
> > New cdns_mhdp_reg_write() is added with the general command ID
> > GENERAL_REGISTER_WRITE.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v17->v18:
> > - Create three ordinary mailbox access APIs
> >     cdns_mhdp_mailbox_send
> >     cdns_mhdp_mailbox_send_recv
> >     cdns_mhdp_mailbox_send_recv_multi
> > - Create three secure mailbox access APIs
> >     cdns_mhdp_secure_mailbox_send
> >     cdns_mhdp_secure_mailbox_send_recv
> >     cdns_mhdp_secure_mailbox_send_recv_multi
> > - MHDP8546 DP and HDCP commands that need access mailbox are
> rewrited
> >   with above 6 API functions.
> >
> > v16->v17:
> > - Replaces the local mutex mbox_mutex with a global mutex
> > mhdp_mailbox_mutex
> >
> > v12->v16:
> >  *No change.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 414
> +++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 487 +++---------------
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
> >  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 236 +--------
> >  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  18 +-
> >  include/drm/bridge/cdns-mhdp-helper.h         | 130 +++++
> >  8 files changed, 658 insertions(+), 679 deletions(-)  create mode
> > 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> >  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> >
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > b/drivers/gpu/drm/bridge/cadence/Kconfig
> > index cced81633ddcd..e0973339e9e33 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -21,6 +21,9 @@ config DRM_CDNS_DSI_J721E
> >         the routing of the DSS DPI signal to the Cadence DSI.
> >  endif
> >
> > +config CDNS_MHDP_HELPER
> > +     tristate
> > +
>=20
> I'm not sure if the placement for the helper is suitable. Especially if y=
ou want
> to reuse the helper by some other subsystem. As far as I don't like it, m=
aybe
> drivers/soc is a better option.

While PHY driver in drivers/phy/freescale also reuse the MHDP helper API,
most of the code reuse happens in drivers/gpu/drm/bridge/cadence.
I think it would be better to keep it in the current location because of th=
is.

>=20
> >  config DRM_CDNS_MHDP8546
> >       tristate "Cadence DPI/DP bridge"
> >       select DRM_DISPLAY_DP_HELPER
> > @@ -28,6 +31,7 @@ config DRM_CDNS_MHDP8546
> >       select DRM_DISPLAY_HELPER
> >       select DRM_KMS_HELPER
> >       select DRM_PANEL_BRIDGE
> > +     select CDNS_MHDP_HELPER
> >       depends on OF
> >       help
> >         Support Cadence DPI to DP bridge. This is an internal diff
> > --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > b/drivers/gpu/drm/bridge/cadence/Makefile
> > index c95fd5b81d137..087dc074820d7 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -2,6 +2,7 @@
> >  obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-dsi.o  cdns-dsi-y :=3D
> > cdns-dsi-core.o
> >  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D cdns-dsi-j721e.o
> > +obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
> >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> cdns-mhdp8546-y
> > :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > cdns-mhdp8546-j721e.o diff --git
> > a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > new file mode 100644
> > index 0000000000000..f39228a78c7cb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > @@ -0,0 +1,414 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/bridge/cdns-mhdp-helper.h> #include
> > +<linux/dev_printk.h> #include <linux/module.h>
> > +
> > +/* Protects mailbox communications with the firmware */ static
> > +DEFINE_MUTEX(mhdp_mailbox_mutex);
> > +
> > +/* Mailbox helper functions */
> > +static int mhdp_mailbox_read(void __iomem *regs) {
> > +     int ret, empty;
> > +
> > +     WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
> > +
> > +     ret =3D readx_poll_timeout(readl, regs + CDNS_MAILBOX_EMPTY,
> > +                              empty, !empty, MAILBOX_RETRY_US,
> > +                              MAILBOX_TIMEOUT_US);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return readl(regs + CDNS_MAILBOX_RX_DATA) & 0xff; }
> > +
> > +static int mhdp_mailbox_write(void __iomem *regs, u8 val) {
> > +     int ret, full;
> > +
> > +     WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
> > +
> > +     ret =3D readx_poll_timeout(readl, regs + CDNS_MAILBOX_FULL,
> > +                              full, !full, MAILBOX_RETRY_US,
> > +                              MAILBOX_TIMEOUT_US);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     writel(val, regs + CDNS_MAILBOX_TX_DATA);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mhdp_mailbox_recv_header(void __iomem *regs,
> > +                                 u8 module_id, u8 opcode,
> > +                                 u16 req_size) {
> > +     u32 mbox_size, i;
> > +     u8 header[4];
> > +     int ret;
> > +
> > +     /* read the header of the message */
> > +     for (i =3D 0; i < sizeof(header); i++) {
> > +             ret =3D mhdp_mailbox_read(regs);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             header[i] =3D ret;
> > +     }
> > +
> > +     mbox_size =3D get_unaligned_be16(header + 2);
> > +
> > +     if (opcode !=3D header[0] || module_id !=3D header[1] ||
> > +        (opcode !=3D HDCP_TRAN_IS_REC_ID_VALID && req_size !=3D
> > + mbox_size)) {
>=20
> Could you please explain the second clause?

This is a special case where the number of data received is not fixed.=20
It needs to be parsed from the previous data, but there is a maximum limit.
I will comment it.

>=20
> > +             /*
> > +              * If the message in mailbox is not what we want, we
> need to
> > +              * clear the mailbox by reading its contents.
> > +              */
> > +             for (i =3D 0; i < mbox_size; i++)
> > +                     if (mhdp_mailbox_read(regs) < 0)
> > +                             break;
> > +
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mhdp_mailbox_recv_data(void __iomem *regs,
> > +                               u8 *buff, u16 buff_size) {
> > +     u32 i;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < buff_size; i++) {
> > +             ret =3D mhdp_mailbox_read(regs);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             buff[i] =3D ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mhdp_mailbox_send(void __iomem *regs, u8 module_id,
> > +                          u8 opcode, u16 size, u8 *message) {
> > +     u8 header[4];
> > +     int ret, i;
> > +
> > +     header[0] =3D opcode;
> > +     header[1] =3D module_id;
> > +     put_unaligned_be16(size, header + 2);
> > +
> > +     for (i =3D 0; i < sizeof(header); i++) {
> > +             ret =3D mhdp_mailbox_write(regs, header[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     for (i =3D 0; i < size; i++) {
> > +             ret =3D mhdp_mailbox_write(regs, message[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>=20
> Please add kerneldocs for all new API. It's obvious for the simple ones, =
but not
> for the more complex functions.

OK, I will add them.

>=20
> > +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8
> module_id,
> > +                        u8 opcode, u16 size, u8 *message) {
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp_mailbox_mutex);
>=20
> guard(mutex)(&mhdp_mailbox_mutex);
>=20
> return mhdp_mailbox_send(...);
>=20
> Similar changes can be applied further on.

OK.

>=20
> > +
> > +     ret =3D mhdp_mailbox_send(base->regs, module_id, opcode, size,
> > + message);
> > +
> > +     mutex_unlock(&mhdp_mailbox_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
> > +
> > +int cdns_mhdp_mailbox_send_recv(struct cdns_mhdp_base *base,
> > +                             u8 module_id, u8 opcode,
> > +                             u16 msg_size, u8 *msg,
> > +                             u16 resp_size, u8 *resp) {
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp_mailbox_mutex);
> > +
> > +     ret =3D mhdp_mailbox_send(base->regs, module_id,
> > +                             opcode, msg_size, msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_header(base->regs, module_id,
> > +                                    opcode, resp_size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_data(base->regs, resp, resp_size);
> > +out:
> > +     mutex_unlock(&mhdp_mailbox_mutex);
> > +
> > +     if (ret)
> > +             dev_err(base->dev, "ModuleID=3D%d, CMD=3D%d
> failed: %d\n",
> > +                     module_id, opcode, ret);
>=20
> Using guard() would allow you to use precise messages, e.g. failed to sen=
d,
> failed to received header, failed to receive data.

Yes, more precise messages will be added.

>=20
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send_recv);
> > +
>=20
> Like what is _multi? Why do you need to fetch into two separate buffers?
> Can you fetch into one and then parse it accordingly? Please don't make t=
he
> API more complicated than necessary.
>=20
The majority of mailbox access commands can be implemented using the functi=
on cdns_mhdp_mailbox_send_recv()=20
because the length of the response data is fixed based on the response type=
.

However, there are three types of exceptions:

Read operations: DPTX's DPTX_READ_DPCD and HDMITX's HDMI_TX_READ have varia=
ble response data lengths that depend on the caller's requirements.

HDCPTX's HDCP_TRAN_IS_REC_ID_VALID: The response data length varies based o=
n the type of connected HDCP receivers.=20
Therefore, it's necessary to read a portion of the response data first, par=
se it, and then read the entire content.

MHDP8546 link training DPTX_ADJUST_LT: The opcode for sending the message d=
iffers from the opcode for receiving the response.=20

Considering these special cases,
two new functions, cdns_mhdp_mailbox_send_recv_multi() and cdns_mhdp_secure=
_mailbox_send_recv_multi(),=20
have been created to handle these specific scenarios.


> > +int cdns_mhdp_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
> > +                                   u8 module_id, u8 opcode,
> > +                                   u16 msg_size, u8 *msg,
> > +                                   u8 opcode_resp,
> > +                                   u16 resp1_size, u8 *resp1,
> > +                                   u16 resp2_size, u8 *resp2) {
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp_mailbox_mutex);
> > +
> > +     ret =3D mhdp_mailbox_send(base->regs, module_id,
> > +                             opcode, msg_size, msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_header(base->regs, module_id,
> opcode_resp,
> > +                                    resp1_size + resp2_size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_data(base->regs, resp1, resp1_size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_data(base->regs, resp2, resp2_size);
> > +out:
> > +     mutex_unlock(&mhdp_mailbox_mutex);
> > +
> > +     if (ret)
> > +             dev_err(base->dev, "ModuleID=3D%d, MSG_CMD=3D%d
> Resp_CMD=3D%d failed: %d\n",
> > +                     module_id, opcode, opcode_resp, ret);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send_recv_multi);
> > +
> > +/*
> > + * Secure mailbox access functions:
> > + * These functions handle secure mailbox communication, which differs
> > + * from non-secure mailbox access. They use the secure address.
> > + */
> > +int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_base *base, u8
> module_id,
> > +                               u8 opcode, u16 size, u8 *message) {
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp_mailbox_mutex);
> > +
> > +     ret =3D mhdp_mailbox_send(base->sapb_regs, module_id, opcode,
> > + size, message);
> > +
> > +     mutex_unlock(&mhdp_mailbox_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send);
> > +
> > +int cdns_mhdp_secure_mailbox_send_recv(struct cdns_mhdp_base
> *base,
> > +                                    u8 module_id, u8 opcode,
> > +                                    u16 msg_size, u8 *msg,
> > +                                    u16 resp_size, u8 *resp) {
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp_mailbox_mutex);
> > +
> > +     ret =3D mhdp_mailbox_send(base->sapb_regs, module_id,
> > +                             opcode, msg_size, msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_header(base->sapb_regs, module_id,
> > +                                    opcode, resp_size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_data(base->sapb_regs, resp, resp_size);
> > +out:
> > +     mutex_unlock(&mhdp_mailbox_mutex);
> > +
> > +     if (ret)
> > +             dev_err(base->dev, "ModuleID=3D%d, CMD=3D%d
> failed: %d\n",
> > +                     module_id, opcode, ret);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send_recv);
> > +
> > +int cdns_mhdp_secure_mailbox_send_recv_multi(struct cdns_mhdp_base
> *base,
> > +                                          u8 module_id, u8
> opcode,
> > +                                          u16 msg_size, u8
> *msg,
> > +                                          u8 opcode_resp,
> > +                                          u16 resp1_size, u8
> *resp1,
> > +                                          u16 resp2_size, u8
> *resp2)
> > +{
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp_mailbox_mutex);
> > +
> > +     ret =3D mhdp_mailbox_send(base->sapb_regs, module_id,
> > +                             opcode, msg_size, msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_header(base->sapb_regs, module_id,
> > +                                    opcode_resp,
> > +                                    resp1_size + resp2_size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D mhdp_mailbox_recv_data(base->sapb_regs, resp1,
> resp1_size);
> > +     if (ret)
> > +             goto out;
> > +
> > +     if (module_id =3D=3D MB_MODULE_ID_HDCP_TX &&
> > +         opcode =3D=3D HDCP_TRAN_IS_REC_ID_VALID)
>=20
> comment, please.

OK.

>=20
> > +             ret =3D mhdp_mailbox_recv_data(base->sapb_regs, resp2, 5
> * resp1[0]);
> > +     else
> > +             ret =3D mhdp_mailbox_recv_data(base->sapb_regs, resp2,
> > +resp2_size);
> > +out:
> > +     mutex_unlock(&mhdp_mailbox_mutex);
> > +
> > +     if (ret)
> > +             dev_err(base->dev, "ModuleID=3D%d, CMD=3D%d
> failed: %d\n",
> > +                     module_id, opcode, ret);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send_recv_multi);
> > +
> > +/* General read/write helper functions */ int
> > +cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32
> *value)
> > +{
> > +     u8 msg[4], resp[8];
> > +     int ret;
> > +
> > +     put_unaligned_be32(addr, msg);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send_recv(base,
> MB_MODULE_ID_GENERAL,
> > +
> GENERAL_REGISTER_READ,
> > +                                       sizeof(msg), msg,
> sizeof(resp), resp);
> > +     if (ret)
> > +             goto out;
> > +
> > +     /* Returned address value should be the same as requested */
> > +     if (memcmp(msg, resp, sizeof(msg))) {
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     *value =3D get_unaligned_be32(resp + 4);
> > +out:
> > +     if (ret) {
> > +             dev_err(base->dev, "Failed to read register\n");
> > +             *value =3D 0;
> > +     }
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
> > +
> > +int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32
> > +val) {
> > +     u8 msg[8];
> > +
> > +     put_unaligned_be32(addr, msg);
> > +     put_unaligned_be32(val, msg + 4);
> > +
> > +     return cdns_mhdp_mailbox_send(base,
> MB_MODULE_ID_GENERAL,
> > +                                  GENERAL_REGISTER_WRITE,
> > +                                  sizeof(msg), msg); }
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
> > +
> > +/* DPTX helper functions */
> > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> u32
> > +val) {
> > +     u8 msg[6];
> > +
> > +     put_unaligned_be16(addr, msg);
> > +     put_unaligned_be32(val, msg + 2);
> > +
> > +     return cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > +                                   DPTX_WRITE_REGISTER,
> sizeof(msg),
> > +msg); } EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
>=20
> Please don't add API without a user. If the function is required in the f=
ollowing
> patch, add it there.

OK, cdns_mhdp_dp_reg_write() will be removed.

B.R
Sandor

>=20
> > +
> > +int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
> > +                            u8 start_bit, u8 bits_no, u32 val) {
> > +     u8 field[8];
> > +
> > +     put_unaligned_be16(addr, field);
> > +     field[2] =3D start_bit;
> > +     field[3] =3D bits_no;
> > +     put_unaligned_be32(val, field + 4);
> > +
> > +     return cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > +                                   DPTX_WRITE_FIELD,
> sizeof(field),
> > +field); } EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
> > +
> > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > +                     u32 addr, u8 *data, u16 len) {
> > +     u8 msg[5], reg[5];
> > +
> > +     put_unaligned_be16(len, msg);
> > +     put_unaligned_be24(addr, msg + 2);
> > +
> > +     return cdns_mhdp_mailbox_send_recv_multi(base,
> > +
> MB_MODULE_ID_DP_TX,
> > +
> DPTX_READ_DPCD,
> > +                                              sizeof(msg), msg,
> > +
> DPTX_READ_DPCD,
> > +                                              sizeof(reg), reg,
> > +                                              len, data); }
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
> > +
> > +int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > +value) {
> > +     u8 msg[6], reg[5];
> > +     int ret;
> > +
> > +     put_unaligned_be16(1, msg);
> > +     put_unaligned_be24(addr, msg + 2);
> > +     msg[5] =3D value;
> > +
> > +     ret =3D cdns_mhdp_mailbox_send_recv(base,
> MB_MODULE_ID_DP_TX,
> > +                                       DPTX_WRITE_DPCD,
> > +                                       sizeof(msg), msg,
> sizeof(reg), reg);
> > +     if (ret) {
> > +             dev_err(base->dev, "dpcd write failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     if (addr !=3D get_unaligned_be24(reg + 2)) {
> > +             dev_err(base->dev, "Invalid response: expected address
> 0x%06x, got 0x%06x\n",
> > +                     addr, get_unaligned_be24(reg + 2));
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
> > +
> > +MODULE_DESCRIPTION("Cadence MHDP Helper driver");
> > +MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
> > +MODULE_LICENSE("GPL");
>=20
> --
> With best wishes
> Dmitry
