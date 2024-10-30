Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693319B5BBE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 07:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AB810E200;
	Wed, 30 Oct 2024 06:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ju4jhjPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E1710E085
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 06:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdvLOWdQSY31MhQDODa2mnTJy+CveNopWX3S0lvFGwLIfVn6eSUk3rwwnCAi06RDzD+oO9tTT8H6CJ4xuNPsvWE6HAOv8FZ0BENvFVgS40XmIYNKXpIr30GQJFEcJjZDaM6tPYLBxw3/b9cnqTo1ejeagBDhks9N067mEVEcorqxTWnldYv/AqxIwBfUT/Ci+hW2/QvOZPU7GpopvMNiY60v6GSIgdyOyX/Lqc71a3nPNji9oyDsYB64VLsy4pJCs3eBxSR4YYr81T188iBwxL9n80ny19R1CgyofXrpDyFeGVpGeZBP7+oxuSQ7ZDPfqcDRYJRVcZzleA41/gyd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWRWV31rUEHBSxplWxP8YIA/nU0Syh12BBe88X4saH4=;
 b=MrwZNb1s/E6mt0wL7jGhr1DTCDwxazXzteF2/EnvKFojV1AAT8nxYsnhS8g4kMDuwvVLxJf53EOW5gfWIzin4OLn8JyfESrm9wxmQ59zfE6Fdsu6GGsTpwbl3POL/UteHYq7dg9k9ugpwCYyJIbGZBgrHY+48A1im3NwYj8hsgwy8/8e7H0wlCneM4ZaK68b4xONwIJ9bSYSPMz7NqMcMwfw8wRQndw6lDt1IbExgGqOD5qkn9j05nxLpqnQMeVKboJY+92KTSsVm+aHZRwbyS/hRghfNcg79ai+5gMC62tAfDqMHj13Iu39XZ/mGCo5aHRczLnoK9jFaQHZTLcLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWRWV31rUEHBSxplWxP8YIA/nU0Syh12BBe88X4saH4=;
 b=ju4jhjPbQ2MSlyxvYoa9cxMsS1cbPO3MF6QTiVrFoCYaxO324Q2VxmXGqfvF/gwyICgrrseNnKynZZoTBavYmk2669DXlbkum2CKeun78O8x1ftXZICNuMZrukp+AIIq8JGXp3b6js3sISAn71kqSS8XDZF6FaeEec0iPFrecos4bfJoA1nU5R6ZnHyL5wR2wsmLDsBGEXgvolhToVWSSWsU+K8eDSy6lw04wIJs/5NubTHE8XXcgX8c41esvVCmtHvgjKVS5l/1/v7KN6hytnzWP91W/Qpkfz0DLjxvMA1rVsc04mD1wqZY7faasPLbEDOWocS6y7u0qdV483oZfg==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB9858.eurprd04.prod.outlook.com (2603:10a6:800:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 06:33:30 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 06:33:30 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Martin Kepplinger-Novakovic <martink@posteo.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
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
 <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v16 0/8] Initial support Cadence
 MHDP8501(HDMI/DP) for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v16 0/8] Initial support Cadence
 MHDP8501(HDMI/DP) for i.MX8MQ
Thread-Index: AQHazHqxRxzIDDTrDE+6s0iXa6XM7LKeGD8AgAF4IzA=
Date: Wed, 30 Oct 2024 06:33:30 +0000
Message-ID: <PAXPR04MB9448C598AEB4F9356D33DC3AF4542@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
 <3b247041c89791c80a69b16f3f3b80c3b8bbeefd.camel@posteo.de>
In-Reply-To: <3b247041c89791c80a69b16f3f3b80c3b8bbeefd.camel@posteo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|VI1PR04MB9858:EE_
x-ms-office365-filtering-correlation-id: d2149b1a-dcb4-4444-0489-08dcf8acc54a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?TRFbwTKxNsA0UuarC4qmGhu6vdjKl+EFZdKlPc3LHpfG2Cq/JxwaDiL/wf?=
 =?iso-8859-1?Q?S800n8iTTFpg87AmZf+fnfOodV4cvrbnwo0Ffw1Aw2oOiodKkvmJwt/7Vw?=
 =?iso-8859-1?Q?pIOc768uXVAAa3gKbcw0Y3OGpETKuj+On792PW35S2RbtLLLSiI3bbTt23?=
 =?iso-8859-1?Q?g916fp1OIAjKTzR/6Idz6DqeEEgKdXsjXCcfX52y6WL/4SG0Tp2qlIMzLe?=
 =?iso-8859-1?Q?+aKUZvuGsZKOUtyXd4Ri1wes0r8isoN4/sK6v8mp+txv8naBBKsCeEnDcQ?=
 =?iso-8859-1?Q?R0ypkALVrHujBxqWYE7x7pKnPBV0ZOQhgQlzACMihls0AKHkAEWYYRS1zP?=
 =?iso-8859-1?Q?Se8Nna8u+IRFyBhiqWk+TsjvEAAWbA1nT0W4A6OH7vfZ8JGgP9K1A0qyyB?=
 =?iso-8859-1?Q?9JFE2O2RXQKJJR+vpBAFF1BKXmjJrsK/Msoik9pP+cbFt2t5KpZF3n69hR?=
 =?iso-8859-1?Q?YHNZZwbic9EbqjovsWH/AAjVfD8VBYv3sB5kz8/BCG3RUxT6+I6Wpj5v20?=
 =?iso-8859-1?Q?lDB4HHcEWfUQz9ty7DqTbHRWInbuvHhgK4Asp2uYpreE/o/Of8Qpp5BDFw?=
 =?iso-8859-1?Q?25rkgkDrPTjknol/eNuuCOJ4DxgIpkW2SHLuJIq3XFnv009n+hzt0UfotD?=
 =?iso-8859-1?Q?W3jv8bshHwTPb3fSX7QC/HEOS+cKu5f8k0Ensemg3o1KNtXT+fkwHANakY?=
 =?iso-8859-1?Q?Px9Sr/fS5Kr6UB1iEEJhN2kbZrSQ+iyVzJlvh/jfJ/0hGox79K0dWTK7dC?=
 =?iso-8859-1?Q?PSr0uPKFKtpVyo65e1ygZVooz7rLGmoZ0Oqhor87rGf2nxAvGg5d+Wk6fT?=
 =?iso-8859-1?Q?Yliy3jQarDn41mhjrrlX5u/L/V9asfE45L0dqhrTeSsUvTx3LMh/e4k72B?=
 =?iso-8859-1?Q?emp4xeuyUACmtSqcfMkENslD1xsWwzVhxroTMmBxr5RFOlGNYQDtC2be4k?=
 =?iso-8859-1?Q?jaDrl8g7pbVPVakLIMqj7lfcbIPCdrSYlNuH0NXMutZZEVV4dN7Tm9s4F0?=
 =?iso-8859-1?Q?u2zGcAE3EYSPCoXpPcNBG71K0oAjL4/3FmXUrngcwPIKvS+gvPEd/YyTxM?=
 =?iso-8859-1?Q?zT6OpWUvxhQ/KSVsBeiDZKY0jZ9MflQz+Ar6Ojk2L6H5rOkYfgPcQiESz3?=
 =?iso-8859-1?Q?T2JEnXv/qu4dkLTQPePFDcaWE3HV7u/ePLzwN/IIZ9WArZWRgK+0KZgt3b?=
 =?iso-8859-1?Q?rKziWyb0Za8Wwg7xU4cXBtWTN7XthT47glAozG1TObk4iYfQK2YE1dR52i?=
 =?iso-8859-1?Q?c9T8oHhQxACW0hoklgSrCxk3To5witrqDeuaFQMOMG7yfzldUmxIRVOIPR?=
 =?iso-8859-1?Q?aJqRwVXitji3T00O/5jzONV00rysPk2vjJuaZ75o2OBGaLaaScm3JGQaKb?=
 =?iso-8859-1?Q?QaOxX/u2Ij9+KAHwpNFd1zOwk7sHEPmRaQNqd1X8dLnUFtXKlpzxDjAVKb?=
 =?iso-8859-1?Q?xXxZywHGSjXceHE9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lhr724LzM+zx+WlpZDIXGadLf+IymZQuli9xd1WI8WiarG3bRChKWeJ+DQ?=
 =?iso-8859-1?Q?09dd/XWqQlSTZdCTwiqgUYJSsoQD/vxYAM/Mwjkw1Dn/M3VHp+O9WI4wYe?=
 =?iso-8859-1?Q?G1va/6aqwF8oOEUrq8zvBEMbZbYp9xNWToY7teh98fEJCqRLOTV/R+fQiC?=
 =?iso-8859-1?Q?/bmBA/Ph3ZZJQVM6keCWaHCHtDnYQoIDFkzfzTkePZAx7Y6qJJAOfSy9zi?=
 =?iso-8859-1?Q?4eu7+2viF1bWwjbkPPxVkQUg0XasAaEd0jIwkP2oWZBP741DhYdsiv5vsv?=
 =?iso-8859-1?Q?RHpqb0pE5kaOwONYHaBrHISG2LgyjKW5DNwZ6h4WO/+GTzlb4x8A3sd9OQ?=
 =?iso-8859-1?Q?XrXV6Oa9n7M5KzB/VSI0qlVOfqXhuEPuoyOTofGFRSI4dG6159uR9/SNit?=
 =?iso-8859-1?Q?bgk0Edql1a6WGwSu4dm6WhyWfNjH7IG/7Xao3bJbdvE+IWsn0q7IW4/9S9?=
 =?iso-8859-1?Q?/j4N/mYaXxtzFcjYJgkYz8xWz0VEidBEuEoeJgI4snblCvfO0VeLhhbWFK?=
 =?iso-8859-1?Q?H4Qgx7lPjdIthFxWqyVfrjLudbVXT6ex/i1YNSTdmIJrWS9JdszPuMxA3M?=
 =?iso-8859-1?Q?0rZnvAi4GgpCqo+CJu6aZc8cW5XjVKlrWRpB/mo0xkgXzv24W84IQZHZay?=
 =?iso-8859-1?Q?Uo6ePIqskVHzRb0XEcv8AGZ2IFBh4Aaupl2Yoa0z4YTNivZS8WIu2KGXrF?=
 =?iso-8859-1?Q?UCAqu5e+pt9Z2oPKmROj5RCanJGlIO/+8sCjomKSofB4hyXev7BihtsF4F?=
 =?iso-8859-1?Q?7Rp300Hy/UKYTIavxJ3I+70XzEv9+dpXgkanbm/xCoRz90EpE0HJv+mBH/?=
 =?iso-8859-1?Q?JawtFYZ0xO37vyf99agA8U2KE4nHL6IrxPJ2fqy/kib2uWzBx/4kABoTUu?=
 =?iso-8859-1?Q?CO6VETry1uO1LVtbwNrloiwycJGhSKExib4JEO1GITP1BUdRQuIg1BZgyL?=
 =?iso-8859-1?Q?3wKwuUh8TP2HGP5CZSGNko6KMCEo2GhjLcHFbLVmPsWBEwNrjiYM5o1HOF?=
 =?iso-8859-1?Q?9pJMKS/2I2DdVdgC1eHn84jLFlc42sT4hYe5ZPMxDtYDQPfUJxuCiXYE5w?=
 =?iso-8859-1?Q?4J1oz27GH0rzIlxnNmwYL87w6GKrr5iDYNN56F3Tk5bg4Uvdj7eGO/PYHO?=
 =?iso-8859-1?Q?Qkw7kXD7SqnRsx9g2l2/zXu+H4SkquksijXp5/47i12EElXcY20oIjiQgP?=
 =?iso-8859-1?Q?jPYIGTfUFOwgzGzaCU9xYIz7GEAqYIAUFW/wmpGtoL3mwi0W0H3BD/lLOp?=
 =?iso-8859-1?Q?Nccno95gB6vlPdIy+egy4716s5WjDn53YQV0L7tnKo8DYceie1Akb8m7op?=
 =?iso-8859-1?Q?l52KrSrazzloqvtna1GJOnjSa8FkjagMPtLnyNeN+YJ5IC/SYg31Mx7Qhp?=
 =?iso-8859-1?Q?8OljOA589TnLlErHGSo7zHoALAM4beUT9IjxqNvsMd0sPnPprDZOHRrddO?=
 =?iso-8859-1?Q?+uc4VWjSCSQkk+w22xco1BxatsqgOmjcfsp5yBlCgxs7xBrQmLxX62zrun?=
 =?iso-8859-1?Q?OHSF2jYjbwzrBJ0n/1cJiv5r3YZFMWyxk0fS2KUa2TlHf2cvHS1pmc8pvB?=
 =?iso-8859-1?Q?YoVtY2ECh9H0RLeVyC5O5fFlMnhvZGiartLze6f/atLXzB++nG+fq7vpFz?=
 =?iso-8859-1?Q?6Z3bRPHBd+R3A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2149b1a-dcb4-4444-0489-08dcf8acc54a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 06:33:30.7580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuaK//jnMPYxbT6FFkALppOCyLVmdrvjE5gQyae6NurwPtlAvVCP3I1hV3tsk9H6Pk+PB+mzn3iKEjNLKWoClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9858
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
> Am Dienstag, dem 02.07.2024 um 20:22 +0800 schrieb Sandor Yu:
> > This patchset sits on top
> > Dmitry's 'make use of the HDMI connector infrastructure' patchset
> > ([2]).
> >
> > The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> > driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
> >
> > The patch set compose of DRM bridge drivers and PHY driver.
> >
> > Both of them need by patch #1 and #2 to pass build.
> >
> > DRM bridges driver patches:
> >   #1: drm: bridge: Cadence: Creat mhdp helper driver
> >   #2: phy: Add HDMI configuration options
> >   #3: dt-bindings: display: bridge: Add Cadence MHDP8501
> >   #4: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> >
> > PHY driver patches:
> >   #1: drm: bridge: Cadence: Creat mhdp helper driver
> >   #2: phy: Add HDMI configuration options
> >   #5: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> >   #6: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for
> > i.MX8MQ
> >
> > i.MX8M/TQMa8Mx DT patches:
> >   #7: Add DT nodes for DCSS/HDMI pipeline
> >   #8: Enable HDMI for TQMa8Mx/MBa8Mx
> >
> > [2]
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> >
> hwork.freedesktop.org%2Fseries%2F130888%2F&data=3D05%7C02%7CSandor.
> yu%40
> >
> nxp.com%7C1de0bcd26e364c67de8908dcf7efc1de%7C686ea1d3bc2b4c6fa9
> 2cd99c5
> >
> c301635%7C0%7C0%7C638657856327615887%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIjoiM
> >
> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7
> C%7C%7C
> >
> &sdata=3D8cvug9CMLQNCPpOm8eFw3uaszeUN7hZijPSBP2IX17U%3D&reserve
> d=3D0
> >
> > v15->v16:
> > Patch #2:
> > - Remove pixel_clk_rate, bpc and color_space fields from struct
> >   phy_configure_opts_hdmi, they were replaced by
> >   unsigned long long tmds_char_rate.
> > - Remove r-b and a-c tags because this patch have important change.
> > Patch #4:
> > - Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
> > - Introduce the hdmi info frame helper functions,
> >   added hdmi_clear_infoframe(), hdmi_write_infoframe() and
> >   hdmi_tmds_char_rate_valid() according Dmitry's patch
> >   'make use of the HDMI connector infrastructure' patchset ([2]).
> > - mode_fixup() is replaced by atomic_check().
> > - Fix video mode 4Kp30 did not work on some displays that support
> >   LTE_340Mcsc_scramble.
> > - updated for tmds_char_rate added in patch #2.
> > Patch #6:
> > - updated for tmds_char_rate added in patch #2.
> >
> > v14->v15:
> > Patch #6 + #7:
> > -  Merged PHY driver into a single combo PHY driver Patch #7 + #8:
> > - Add DT patches for a running HDMI setup
> >
> > v13->v14:
> > Patch #4:
> > - Rebase to next-20240219, replace get_edid function by edid_read
> >   function as commits d807ad80d811b ("drm/bridge: add ->edid_read
> >   hook and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge:
> >   remove ->get_edid callback") had change the API.
> >
> > v12->v13:
> > Patch #4:
> > - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> > - Fix build warning
> > - Order bit bpc and color_space in descending shit.
> > Patch #7:
> > - Fix build warning
> >
> > v11->v12:
> > Patch #1:
> > - Move status initialize out of mbox_mutex.
> > - Reorder API functions in alphabetical.
> > - Add notes for malibox access functions.
> > - Add year 2024 to copyright.
> > Patch #4:
> > - Replace DRM_INFO with dev_info or dev_warn.
> > - Replace DRM_ERROR with dev_err.
> > - Return ret when cdns_mhdp_dpcd_read failed in function
> > cdns_dp_aux_transferi().
> > - Remove unused parmeter in function cdns_dp_get_msa_misc
> >   and use two separate variables for color space and bpc.
> > - Add year 2024 to copyright.
> > Patch #6:
> > - Return error code to replace -1 for function wait_for_ack().
> > - Set cdns_phy->power_up =3D false in phy_power_down function.
> > - Remove "RATE_8_1 =3D 810000", it is not used in driver.
> > - Add year 2024 to copyright.
> > Patch #7:
> > - Adjust clk disable order.
> > - Return error code to replace -1 for function wait_for_ack().
> > - Use bool for variable pclk_in.
> > - Add year 2024 to copyright.
> >
> > v10->v11:
> > - rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver, use
> > cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write() same
> as
> > the other mailbox access functions.
> > - use static for cdns_mhdp_mailbox_write() and
> > cdns_mhdp_mailbox_read()
> > and remove them from EXPORT_SYMBOL_GPL().
> > - remove MODULE_ALIAS() from mhdp8501 driver.
> >
> > v9->v10:
> > - Create mhdp helper driver to replace macro functions, move all mhdp
> > mailbox access functions and common functions into the helper driver.
> > Patch #1:drm: bridge: Cadence: Creat mhdp helper driver it is totaly
> > different with v9.
> >
> > v8->v9:
> > - Remove compatible string "cdns,mhdp8501" that had removed
> >   from dt-bindings file in v8.
> > - Add Dmitry's R-b tag to patch #2
> > - Add Krzysztof's R-b tag to patch #3
> >
> > v7->v8:
> > MHDP8501 HDMI/DP:
> > - Correct DT node name to "display-bridge".
> > - Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.
> >
> > HDMI/DP PHY:
> > - Introduced functions `wait_for_ack` and `wait_for_ack_clear` to
> > handle
> >   waiting with acknowledgment bits set and cleared respectively.
> > - Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.
> >
> > v6->v7:
> > MHDP8501 HDMI/DP:
> > - Combine HDMI and DP driver into one mhdp8501 driver.
> >   Use the connector type to load the corresponding functions.
> > - Remove connector init functions.
> > - Add <linux/hdmi.h> in phy_hdmi.h to reuse 'enum hdmi_colorspace'.
> >
> > HDMI/DP PHY:
> > - Lowercase hex values
> > - Fix parameters indent issue on some functions
> > - Replace 'udelay' with 'usleep_range'
> >
> > v5->v6:
> > HDMI/DP bridge driver
> > - 8501 is the part number of Cadence MHDP on i.MX8MQ.
> >   Use MHDP8501 to name hdmi/dp drivers and files.
> > - Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
> > - Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
> > - Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
> > - Fix HDMI scrambling is not enable issue when driver working in
> > 4Kp60
> >   mode.
> > - Add HDMI/DP PHY API mailbox protect.
> >
> > HDMI/DP PHY driver:
> > - Rename DP and HDMI PHY files and move to folder phy/freescale/
> > - Remove properties num_lanes and link_rate from DP PHY driver.
> > - Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-
> > phy.yaml
> > - Update compatible string to "fsl,imx8mq-dp-phy".
> > - Update compatible string to "fsl,imx8mq-hdmi-phy".
> >
> > v4->v5:
> > - Drop "clk" suffix in clock name.
> > - Add output port property in the example of hdmi/dp.
> >
> > v3->v4:
> > dt-bindings:
> > - Correct dt-bindings coding style and address review comments.
> > - Add apb_clk description.
> > - Add output port for HDMI/DP connector
> > PHY:
> > - Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
> > - Remove unused registers define from HDMI and DP PHY drivers.
> > - More description in phy_hdmi.h.
> > - Add apb_clk to HDMI and DP phy driver.
> > HDMI/DP:
> > - Use get_unaligned_le32() to replace hardcode type conversion
> >   in HDMI AVI infoframe data fill function.
> > - Add mailbox mutex lock in HDMI/DP driver for phy functions
> >   to reslove race conditions between HDMI/DP and PHY drivers.
> > - Add apb_clk to both HDMI and DP driver.
> > - Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
> > - Remove bpc 12 and 16 optional that not supported.
> >
> > v2->v3:
> > Address comments for dt-bindings files.
> > - Correct dts-bindings file names
> >   Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
> >   Rename phy-cadence-hdptx-hdmi.yaml to
> cdns,mhdp-imx8mq-hdmi.yaml
> > - Drop redundant words and descriptions.
> > - Correct hdmi/dp node name.
> >
> > v2 is a completely different version compared to v1.
> > Previous v1 can be available here [1].
> >
> > v1->v2:
> > - Reuse Cadence mailbox access functions from mhdp8546 instead of
> >   rockchip DP.
> > - Mailbox access functions be convert to marco functions
> >   that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
> > - Plain bridge instead of component driver.
> > - Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
> > - Audio driver are removed from the patch set, it will be add in
> > another
> >   patch set later.
> >
> > [1]
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> >
> hwork.kernel.org%2Fproject%2Flinux-rockchip%2Fcover%2Fcover.159098288
> 1
> > .git.Sandor.yu%40nxp.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%
> 7C1de0b
> >
> cd26e364c67de8908dcf7efc1de%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C0
> > %7C638657856327659846%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLCJQ
> >
> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DjY
> pCSiHd
> > TJTBTxeb76u5Rm4O6MCi9SLIadz92ZONLmk%3D&reserved=3D0
> >
> > Alexander Stein (2):
> >   arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
> >   arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI support
> >
> > Sandor Yu (6):
> >   drm: bridge: Cadence: Create mhdp helper driver
> >   phy: Add HDMI configuration options
> >   dt-bindings: display: bridge: Add Cadence MHDP8501
> >   drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> >   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> >   phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
> >
> >  .../display/bridge/cdns,mhdp8501.yaml         |=A0 104 ++
> >  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |=A0=A0 51 +
> >  .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |=A0=A0 20 +
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |=A0=A0 68 +
> >  arch/arm64/boot/dts/freescale/mba8mx.dtsi     |=A0=A0 11 +
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |=A0=A0 20 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |=A0=A0=A0 3 +
> >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |=A0 304 ++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   |=A0 330 ++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   |=A0 367 +++++
> >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |=A0 700 +++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |=A0 595 ++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |=A0 403 +----
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |=A0=A0 44 +-
> >  drivers/phy/freescale/Kconfig                 |=A0=A0 10 +
> >  drivers/phy/freescale/Makefile                |=A0=A0=A0 1 +
> >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1340
> > +++++++++++++++++
> >  include/drm/bridge/cdns-mhdp-helper.h         |=A0=A0 97 ++
> >  include/linux/phy/phy-hdmi.h                  |=A0=A0 20 +
> >  include/linux/phy/phy.h                       |=A0=A0=A0 7 +-
> >  20 files changed, 4120 insertions(+), 375 deletions(-)  create mode
> > 100644
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> >  create mode 100644
> Documentation/devicetree/bindings/phy/fsl,imx8mq-
> > dp-hdmi-phy.yaml
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-
> > core.c
> >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-
> > core.h
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-
> > hdmi.c
> >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> >  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> >  create mode 100644 include/linux/phy/phy-hdmi.h
> >
>=20
> I ran this on top of a v6.11 kernel on imx8mq (type-c dp) and got -22 at =
the
> link-training command.
>=20
> I'll try to test v18 later and can post my tree, but wanted to drop this =
here in
> case any bell rings already and so that you are aware that I want to test=
 this.
>=20
> thanks for keeping so patient with this,
>=20
Here is the firmware version register dump in my board, Please check it in =
your board.
If the version is different.
You might need to update the firmware.

root@imx8mqevk:~# /unit_tests/memtool -32 0x32c0001c 4
Reading 0x4 count starting at address 0x32C0001C
0x32C0001C:  000000CF 00000087 000000D3 00000050

B.R
Sandor

>                               martin

