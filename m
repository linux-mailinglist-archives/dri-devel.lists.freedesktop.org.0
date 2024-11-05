Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD89BCEA0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D179110E18A;
	Tue,  5 Nov 2024 14:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="As0wlRWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2082.outbound.protection.outlook.com [40.107.103.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B722110E18A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnUQPsUCpR4FIgfvznY8JlsvmAiTmvgWQl6cJuszVcvKJJAEXuNARKCBcTVhUegm4LTtOXTdJUt3mZXABdEBdfUU0L2OppKM1TIUOSqE+wECOITqTqYnmoSqe53dcrw1eR+8JQvNQyPcmSwEsnNz2QgGcE7t5j/KkNfyny8ZSzP6VdpBDZeJonOQWrtgnJhlROZ5JK0BKdSV8FdHqsZycjVSuc8YyvKhIvYUHi/AUtI5BOkol7A/kgFTthemR3234FLdf5e6ZY1Iyhp4ksCrK/8gct1ZpQLff+TrT1tuW1iQ+2lLi7XyG2HOXnUAGZDA5i4kF8ma4TVHiRZAc7sCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu64rgFcbwoRvZYf4l5Tevz/ZNVXjCwHyQt+vscu+94=;
 b=ri220aFIVkji8OH5l5pQ1qIb0HqRdF6vNmFUHWk3QPJTmeryMyGCKk3/l3PXFtFopMZZaxQn3IVhtyaFS8nwTBRJ0RCRidaHPiH+jrHPOrtrB8RkG4k+CyATP/svSrN3/vwQFxRcSjRMCp8IhqEOqD4jeMGrOgSicKhFAuhqlofcpKy1pCwewi831K+unD92Z2HI5t3sG1b+lFuFXgdOfr0Ezv4eC+9cAk2wJ1Gl9XpTqqFcG+wgsDXMNQ85Tgg8VjP7t9Q6OhLZgE1Wph44jTKvR0Q66kRbJdgH1K99MjDF58o7i/2ZoTR3aRgOBY0RLNiQHpnYcSAf8mre+UsScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu64rgFcbwoRvZYf4l5Tevz/ZNVXjCwHyQt+vscu+94=;
 b=As0wlRWFc9d6LMrNXvDrNmlIZzSDakgcpdbODvLRnOnS4y4NmaIzAqq6DxYpSH3RgqBYaRhJsNQ1TfXMlDvzAoaW3qYM6pu5OgERH+Dr8nHGRLr+LpDfb4ONTWRLCnDUeXjqgABgVrumG10wqJBYzGVTLHC4lDtP+Q8hDLVsLWlJR7KzUfQ607W+vo7OgwdKny1n0RlEkiM9aunDMZDtnMoHFjNrRJg9gnnL1saX1PKz4FRmGpEQzijcfe2n/NM0UyWNNxQXW/yrcsJ/wMDm6NHcw8e8QCoxnJnVdrsuV3qHfibJ9Qhh1CaigZXIXFQmnZqvk12IXjQJc9bO6totfQ==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10801.eurprd04.prod.outlook.com (2603:10a6:150:21b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 14:05:45 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 14:05:45 +0000
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
Subject: Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Thread-Topic: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Thread-Index: AQHbL4vOd8FPnpc88E+qRnXDwMyUMA==
Date: Tue, 5 Nov 2024 14:05:45 +0000
Message-ID: <PAXPR04MB9448DD60509C9A9882EE21EEF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
 <22f3pkf63uphnx3opld6ibkhptbtxqoguqgu6iswb6w4hzkxxd@pwbdwjdodcnc>
In-Reply-To: <22f3pkf63uphnx3opld6ibkhptbtxqoguqgu6iswb6w4hzkxxd@pwbdwjdodcnc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|GVXPR04MB10801:EE_
x-ms-office365-filtering-correlation-id: e30b7c90-c695-4060-5c66-08dcfda2f173
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dC2pc2vGVwCWv+xs5YU8vd99tlP3UeeV0j8530+dSRNU5dy5K9JQj/sHnfvM?=
 =?us-ascii?Q?r+jilVeEIqHvoE+2vkqzVKQYJ7As1HAuCM9omR4bLGFIgCm0ip5yMjICtDJe?=
 =?us-ascii?Q?Rawi3rITrEA3id5N7QiHfXzT6mXXHyldTmrzC0fScDrPob6ZI1oK6o9WZIO7?=
 =?us-ascii?Q?DeOOOBJfMze2jwprh5//5kZa96xKf6eHzfN58KAx8cVTsE5vzXyX8ZlbuGBn?=
 =?us-ascii?Q?PSuHagh3j9yy7cau6QyGz0rG816r8PWHX+v+DfvRCVR37yKf+pLz2qIwwI19?=
 =?us-ascii?Q?Kd+M19HhadSS9ZV33RD222UICwnPGPc7kNfFhg3JSlndJn5/kFQ06jf2t8PA?=
 =?us-ascii?Q?r2m+9svqDg3KEyK+RkKPCb8qIM0OZM91htYcm+xifp3qmsJw4HrxzUtYEHNT?=
 =?us-ascii?Q?1rKddmLYa0q08K+b3LuVya+rJRxGHguWSf6HfkZXFgMkZhv4oxh4dDxKqxOK?=
 =?us-ascii?Q?Fs0gUHe/OYqNIL6PuZSmsk7Uj585JGedu+aB+SHZTAXqSO5oxwAsmxTkOm2w?=
 =?us-ascii?Q?RiDNGOlWuUdhcJOi3/5hWNx+GYtZ2nbnA6ntgDo4wRIWS81OikgdSCdXY9Bf?=
 =?us-ascii?Q?rZCRRER/+P476LGEdjRZ0UrJIkeCUR9KSc1PbuJU2HRNIKvCxlMw8A1ssj0S?=
 =?us-ascii?Q?wtY6kzpTiKn5MryedGZxCr4IkBU92VeynoWkgELtaWCujKrXNJKMjhwBfRdq?=
 =?us-ascii?Q?OcElolr6XRpnm/GsZNoh1FfEH9KkPXpNgCWqrnQxMrgAQvuXfIPIql/aQ6nS?=
 =?us-ascii?Q?yb7jJQX8AUBFOLJ91WTlDvIv7wYdB/FYap/HjgbCfHLI4SXmvVI8VmvFCZO0?=
 =?us-ascii?Q?iR94RjTfObDeVyTVTeMlTD/69QlRvOqcp0G4FJc2XHKHAF5TvYmsIovoNoDw?=
 =?us-ascii?Q?dd/FGQYEx5nXDADE2kGNL0U0G5WzVXNCLkzZyrS42UVeIQKmEfATf2a6yERs?=
 =?us-ascii?Q?uT5+dJBj4B7wfoSfSI+Su1V/LutvUyK+3ntzYw73wSeL6whHtinLmcJ3NQCc?=
 =?us-ascii?Q?HboKRUKfzUXNXFqybXURTtiu0Aqd9EcWyyaGv1lUB8jONTfH0pKnYV9T/J6o?=
 =?us-ascii?Q?iWV95ibHXeWzM5CaL5cHykx2C6wEw3BegLqL5gD1NLT7nTKxdpSW4+buOd8X?=
 =?us-ascii?Q?9cETGtSjHzWzr1Ej+G8zJJJBv0/OQaJaO9CPQebivwKReDCVlCMboC340xkF?=
 =?us-ascii?Q?WVNApwlGlXiNnHdQNXVZkLVGXZPPSiuTgkQPs8paSx15LEJgRjMWs69Vjabt?=
 =?us-ascii?Q?PW7NJ6LHEYLRb3/Z3AsqE4C8DXEOvXYoMeiY+rKFfJdkYNR3PiojS1WSAW24?=
 =?us-ascii?Q?l5xM9YoN+Bb6JX8w3a2dldRXh+vGZcBuPEw6GRnaxIdsmpZHr9Bh+AFjzx/t?=
 =?us-ascii?Q?3Iy23+A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?leaFiQjlwAzeS40oMZvnYVj40WYWKm6cV2kJ2m+s+/zpjkB/Y7e+5ObYoLGT?=
 =?us-ascii?Q?0IaTLY3GSIUFEY86zmSf85HigndH6ZN6cVyyemYTSsBIt2LyKB4DrA9FW2uy?=
 =?us-ascii?Q?UNL4v+EStKj5DHMNZTRnO34vilktS9X9jol6omjaCBgb/BbFS0H+yp0lRtsC?=
 =?us-ascii?Q?bCRfaprqOAy9DZ8zSEI9R0913Yb8oo5zHmIRBjmATSD09ikZsKN3i8T2JSZX?=
 =?us-ascii?Q?+UXDMcDPujx9gy6ZgRLo1hXeVB27oXDhcoGV5kk5G/kGCNMTRz+ZwqxzHeDx?=
 =?us-ascii?Q?Q7uRhFEKeKh27yRzGVJkx1gZJypz0YJhCezKaDxsZv1e6eqUUSTPIeLqir8Z?=
 =?us-ascii?Q?BIUguGidM3gxoK5yuYXXzlLUsrCrCE83q31n8a1P5ZvyMIas2vXL4jQBTbaB?=
 =?us-ascii?Q?tEk1ejKUwBnO9jwYKKb549AWC1TF498+CZvSYwLUITj0SVIFkM+oiPifXXLl?=
 =?us-ascii?Q?1kf3SayKUo80y9EbbPwIen6KNhuGinKdo35i6gU03PnJYh58r274SgMzeBvf?=
 =?us-ascii?Q?9HeWwBRfVTOecHvz/gSKYIRcTR547Nt29sjbW9j4r4+SvcYRKt3C9Dq2M7kE?=
 =?us-ascii?Q?7x7esbO+nFkz2s20RrWAt/fbFf3HRZ5d0+5mSUov8r9YNZhv/7LdcVdlbydo?=
 =?us-ascii?Q?Oa1kQPDXJciYs0DNj7YTk4vMVW9DFC+6MOKBqXt2xaZVsFSfci3BbJAw+Myz?=
 =?us-ascii?Q?viL+ydUOMZlv6BFmR2UnKD+qkWHybNbnX/zI5O40V70izlgxnVbjmWu5JLjd?=
 =?us-ascii?Q?2fnjt+zREp5zVLGzUY++EEmflf7rcddQ/540OxLeW5aGugHvtOMx+PlVjqT/?=
 =?us-ascii?Q?fyW/XZVUpD+qLNx9N9kyjRFvI8af6JEAwF2Kqgbj4H3BZ0vJFhugbdbNshDf?=
 =?us-ascii?Q?cyGzAA/xxdOdQ1HkkfG4NBAcQYpTEG+HDdZtXiU3SQLHV70gjJjpPoMZLz7r?=
 =?us-ascii?Q?1Gmzbw1Tu9Vhn4+CchTZg7s83ptRJE/+Zv1J0lFd9PPVfFa0w1ZXXHD2KMk/?=
 =?us-ascii?Q?eb6LPM0L5LYJ/iX7ysEgcc7ACjmlGDXdxDYmaG6O8b3SxRpfpNaZIje+nspL?=
 =?us-ascii?Q?bIKEf8gEB5+dMZfe9FmTNrlWSnrR5X2MLEYBFy5BpCbpTb11LyUFXWxtRTL5?=
 =?us-ascii?Q?IHN4GihKrPzOcrcaufxiRO3kQKHvXQK+yxJX/qne6Hl81YoWbNTvHCTD/n8j?=
 =?us-ascii?Q?oOn/0kgzOixvyBIaH7GW0mSpjuy1ApKchw/EUjToDw9S9fBaV2Xl6tWbKr9f?=
 =?us-ascii?Q?WsGrLvoDgAyuQi2R1f4F8zx4YAa6wDR8I4vf3qNALuuKRLGyD5FJRaZr9cka?=
 =?us-ascii?Q?4tfLpvGBWC6sDkMQZn1nb4jm8OL6mWVB19JbQGJNRL/sMfkrQYNWzFNJ75Pb?=
 =?us-ascii?Q?ZPLD84K8yxNmq5dXZl262FomX0Vs1or8rp4Cu15inodvSA7Kc0AXS3OEehBZ?=
 =?us-ascii?Q?L8dr5vzcUuyKBndM3s0DzVX/tCf8VCC1jhyCv6g0EIAzrnfcGc8B8+0jwWQs?=
 =?us-ascii?Q?1BpDVzeXkRt98Bl0183SwVDq6x08IIJe7XUhSgsos8x4oCv9L+useqswOX1/?=
 =?us-ascii?Q?nRJJpZu9WvjzVntJTL4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30b7c90-c695-4060-5c66-08dcfda2f173
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 14:05:45.7073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfxVU52v8N7VYoIBsOTsACkTuW0CxPTwKfchYsyl91xa5TN3bVQhu4fbSoHlR2JUpNdEf6wljYedCVvb/c6Obw==
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

> On Tue, Oct 29, 2024 at 02:02:11PM +0800, Sandor Yu wrote:
> > Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v17->v18:
> > - remove lane-mapping and replace it with data-lanes
> > - remove r-b tag as property changed.
> >
> > v16->v17:
> > - Add lane-mapping property
> >
> > v9->v16:
> >  *No change
> >
> >  .../display/bridge/cdns,mhdp8501.yaml         | 112
> ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > new file mode 100644
> > index 0000000000000..e4b900ecf1ac9
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > +++ aml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fcdns%2Cmhdp8501.yaml%
> 23&dat
> >
> +a=3D05%7C02%7CSandor.yu%40nxp.com%7Cda19a2cbbf2148c7f6f208dcf9e6
> 050f%7C
> >
> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63866001353856588
> 4%7CUnkno
> >
> +wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1
> haWwi
> >
> +LCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DWZvYuredQsK8abMP4bFoWGF
> a2DXUgzD0k5D
> > +MNnMdc3M%3D&reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C02%7CSandor.
> yu%40n
> >
> +xp.com%7Cda19a2cbbf2148c7f6f208dcf9e6050f%7C686ea1d3bc2b4c6fa92
> cd99c5
> >
> +c301635%7C0%7C0%7C638660013538587632%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoi
> >
> +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> %7C%7C%
> >
> +7C&sdata=3DOVinvIp2pzVTtMo%2FA6jsMaypCUch31CA0PhINPOx%2FrU%3D&
> reserved=3D
> > +0
> > +
> > +title: Cadence MHDP8501 DP/HDMI bridge
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandor.yu@nxp.com>
> > +
> > +description:
> > +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-mhdp8501
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: MHDP8501 DP/HDMI APB clock.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description:
> > +      phandle to the DP/HDMI PHY
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Hotplug cable plugin.
> > +      - description: Hotplug cable plugout.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: plug_in
> > +      - const: plug_out
> > +
> > +  data-lanes:
> > +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> > +    minItems: 4
> > +    maxItems: 4
> > +    description: Lane reordering for HDMI or DisplayPort interface.
>=20
> So, HDMI or DP port? I don't think the format is actually the same, so it=
 is
> either-or.
>=20
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Input port from display controller output.
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Output port to DisplayPort or HDMI connector.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +  - interrupt-names
> > +  - phys
> > +  - data-lanes
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    mhdp: display-bridge@32c00000 {
> > +        compatible =3D "fsl,imx8mq-mhdp8501";
> > +        reg =3D <0x32c00000 0x100000>;
> > +        interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names =3D "plug_in", "plug_out";
> > +        clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> > +        phys =3D <&mdhp_phy>;
> > +        data-lanes =3D <1 2 3 4>;
>=20
> 0 1 2 3

OK.

B.R
Sandor

>=20
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +
> > +                mhdp_in: endpoint {
> > +                    remote-endpoint =3D <&dcss_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +
> > +                mhdp_out: endpoint {
> > +                    remote-endpoint =3D <&dp_connector>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
