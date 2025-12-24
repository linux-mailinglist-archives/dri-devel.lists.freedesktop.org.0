Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A672CDB8F4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEB010E340;
	Wed, 24 Dec 2025 07:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ig+O/Na6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C7210E340
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhacSSzDu/igQE1m0AApwmupUPOCJpImGQImMpj9pphH3fE/Ir97CJcaKhJl2cI23HY+dbWaOVgUv19Brvj3sB5LTrPNz5DBKKw+DxlqZ87+bSWj07yGmGVnOvjGxWXoTy0lNKs4dNElN1OpFUXPz2dJWmPmoACHDvQDDd7lg+owP/MIPwR/BGAVzHhCVLzDmZcn0Y+gTLbLMjvbN2f5P+E7TKOWTTbmhjPKxqeWl7m1z8VZRM5xkkTSuO3hRY3c0oWi/F492eNgKH6BUhMK4EAR7kSqXbMWNPB0YCBQwsY8/sbsLAQwZSFgqUOeJoUWU7KTfmw5HzKeswx0ttpiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HEz8BKTZS6EbtOqY3q9H1ZnWpX8tXi02eFT7BqXGB0=;
 b=u16y6qEU9lWaZkfZfBXiYN9Sh8ojZluMW3y5Utw61E05t8CamtbkVMK0Q55b/zrEOGFFPTPz7BExy5op8GLO+IQFCH9/wGjH8xCp+2btItsoYrPH4KiroEDPc5MbwMnptdnU37a/w6gMw+GxRSccbm2Ut4KfQnMVXgsUBZv0E5WANsLotzkzU1Akje3qftr5e3xylOHlL2MnaYFHkwJBqS+OcK+fT8LFKrh9yHaoZTl6J6cj8zYnIy9yqGxhRK3RgEy2X2f+QoY4BnXf9OeonfW7V1qthTGseoyflAjgnyqQhMqL661zf63cBLfAsWn16WEMwi3H9pG/pr9QF0c/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HEz8BKTZS6EbtOqY3q9H1ZnWpX8tXi02eFT7BqXGB0=;
 b=Ig+O/Na6cSOYgklfOfMHPILmVEgGhf0Py+CNtzogSs980OlhevgGeI4OTo7B5a76HeUcmUpM2bU8Qesz5nE2QkdReAPUTO7k4JpSH69HfwsT7mWmEpzEXT6WrKYokwZZgiVOq+rvIsYITnjzODL7uv/dIkPiPBmRPOL+o2xonGlDa5HwnwZlZggD9qav9ppbFlpcWB/SVYQk99ca/2jMy7n+DSVfQP+p2FWpDf1aleYvfAE1s5FV9PgG286BJe7fnQknOnfEs26O4pcAmxxW4VnSuI9CdDl0EZWtxEA5RjpW//sxKg7sTMPMk8FSWb436/4/UNCEjaq4EICu2DrsOQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9675.eurprd04.prod.outlook.com (2603:10a6:10:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 07:08:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 07:08:55 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, Marco Felsch <m.felsch@pengutronix.de>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Ying Liu <victor.liu@nxp.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Thread-Topic: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Thread-Index: AQHcY5A8dXIlV9t0O0mSTJhIGXzqrbUXTK+AgAuoswCABOvvgIABUc2AgAAD3YCAB0kTYA==
Date: Wed, 24 Dec 2025 07:08:55 +0000
Message-ID: <PAXPR04MB84599D676EC1E3879694579688B2A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
 <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
 <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
 <033450ab-f14d-4bf7-b7ee-aaffd014820d@lunn.ch>
In-Reply-To: <033450ab-f14d-4bf7-b7ee-aaffd014820d@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB9675:EE_
x-ms-office365-filtering-correlation-id: 7b55940d-e488-4464-1237-08de42bb4d21
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?s7O6M0vdsSbeQFphW7oiR1m135SPtvk9puKlCBBosqeZyTafjyh0j/NcX3xX?=
 =?us-ascii?Q?NZ5jtN2i8dRCCTakExMxLqAdLRi+LAdUx4asDYnZWYC7525uoUyxXHECILgg?=
 =?us-ascii?Q?7cA5LuscJ8FitvjIrDnIg6DP8JirgUyVYAxn0vLsl0BKFevA5PbzUq/etizk?=
 =?us-ascii?Q?kh13nitZuipuh16/XwYUidHYJcSvjjHF3Go/ivh3Y/UMKeyaMworVEDMjKjT?=
 =?us-ascii?Q?ty0Abr4RdN+DAle8BGpC6+yQBfYyBysNA0iYLbxtjdgEb7zs57tScSZBP/jW?=
 =?us-ascii?Q?1wig5QO7wB6ZHlyg7PM88ecCwqhPaOrjVwd0ARHYtKYu1W1Ose7XseEIfedm?=
 =?us-ascii?Q?mbRtRc4yO9fZ+IsgrCYxOID6XAMaHVITBesC1MK6RRGCpkxoNJBfYqo0QSM/?=
 =?us-ascii?Q?vuiNNIx2jadrPxJwUkFdTcRwKw1Q2zn+f8IiyvgIX/jzv/y1EU2VSGVU5C3S?=
 =?us-ascii?Q?fR6JIhJFSyxuPiXg5Oo2cZAcjthVtgV4JuLvFTKb38STeLsBw9yrkdsg/V44?=
 =?us-ascii?Q?1taL7NwYWa2kuJDj21/isfgeAksKTpiourhIDqNtTWvqOT79jEVjML4nSrZO?=
 =?us-ascii?Q?2es8spkqVtYlqIPBbUh8P2VYbN+HmMYbAYcc7kfwRGM8KhwtWv8JUsMUYPeG?=
 =?us-ascii?Q?8PsbrTQBaFe4W7zpOaLjATPOLG9pRECyP/a8xDUWfXumCBYHcc5USmyswF0D?=
 =?us-ascii?Q?ibi25JEza6XjNdb0r45Mx2MmcRRZCgm+31sLQidaH+rXf6SGAPQaR64WnY4T?=
 =?us-ascii?Q?vPtrejd/8jdY6ByXfD+krBsu5edOX6AK0Sxo8o4FzAAfWP4eBHPaIleY/1Pc?=
 =?us-ascii?Q?yB4fEoMqyQFlNT312PxytD0Q1E0c2FnX7JAbASBHaAOr+BL18xfOp6uTnSuf?=
 =?us-ascii?Q?OD1pM4/P6v72IbzvgLlT/bIPxdY3EMGU/yGhL39q8S4g0OdGalrt0OGN9/uJ?=
 =?us-ascii?Q?maFxq6Yzb/vbO/tD7U/49OsFXxv02zwr5cuJX1OCyr+rkiBnMf9wrsc5DF60?=
 =?us-ascii?Q?CkQGoNmkcIPq+e2be8gWpohL0G+BXs8c9v4w0uLpECMoA3pnPzZ/GGZKTnfU?=
 =?us-ascii?Q?EOibMtQoPhXzOEb183GsXbUbRuI+ndH96cdqgegAJaWiKkVbBOkxJCscASf4?=
 =?us-ascii?Q?j+UN7P03whNqgksYK+v9D4lsSKviZ5JqDPeVteurmtFt/Fltu/s26SK5y+4J?=
 =?us-ascii?Q?8QuKS2JXKfdmILWymiGSKj5tzKHZY/R+hw3xx4APiZOyOleaXIzDPCg+o2VZ?=
 =?us-ascii?Q?OQ+hlO5LjWWzUkH5yLqFoDfv34c7vrRc2q2nPu29mrWIgu5kOtw2zoR4EOyE?=
 =?us-ascii?Q?iH64Z6BdyxivRhTurVd8Ps5rXNTg89IjiMC10k+7AMx5qJsnBnY5ozL2Mo3Q?=
 =?us-ascii?Q?K3yHCXN6H/6kD4CCIByv3AEWJpejFESFeZINOem9YwbWIaY2eHSeBXTx85QZ?=
 =?us-ascii?Q?eSA3P1tdlilX33leqE16qZwzfe7bDDHypHfDkKalfCtiQ9BJuCJxbTffMRts?=
 =?us-ascii?Q?1w8JkEh1n3wZvFFyXPPeInv6CaZJqhS8Pslu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2903pRCGpHjbJB1RjIN7iBIR+gYovXlDHTbd+R8ln++88HPihe8LvWqjGfdA?=
 =?us-ascii?Q?OOs9qltVbzzfm24UIfHrm7dwVmt9ia1dOF+H5Okvxf+CCtycwN7YLZWa8+9u?=
 =?us-ascii?Q?I7jjp//JhNiLQoMjOiyH1uEiUn9gcJmIjKiotRCOwdqgMZ+3qZQnc4nqMUC7?=
 =?us-ascii?Q?PW2buyXxEsYzm3/rFl6a9IaKqQc+sxAF8Gc7th854Lk3mlrBN585kS1ZYSRw?=
 =?us-ascii?Q?eVeD+1yzEBi6jl1S+HGIX2GIkbnRtZFflxoTno2gh+6VDzVISkHZ8epJyo8o?=
 =?us-ascii?Q?dB1fe2r6z9swm87duYRZkogKL/jRzfWZIAgwcMlz6NCAoPD0O73dMjtOWbtq?=
 =?us-ascii?Q?8gUf2/ZQN0F6vkoqJe3Ji3Ex3/4TUimBkipO+mpn1JrUnjQ2dwz6YUTxSlI6?=
 =?us-ascii?Q?WEqjnfEI3Mih9FONKZ5jhMFQSxgr1tEnh+vLSkRkQRSasc49DyittSwAjkHl?=
 =?us-ascii?Q?uihokkDNn6voMN2V6s9d41BNwjXTcJrUOQvDoozn4OYZCwpaNvUs5ktNLrdM?=
 =?us-ascii?Q?GMwOQJo4tvLPa2+tUmhqrINAgn1Uy+H7aWkArV/a1Fe9UUd1QlvGDP9AJkIa?=
 =?us-ascii?Q?iheaKtPUkhYIHer0E6NNp04/RXSLU/L333Xs6BO025TRmYLQdj9rB8HXykCD?=
 =?us-ascii?Q?i/ZthU4AEjEkB5pZ/3AsBhAjGcxmk9zYDUNIoxdhM9qDnE1/wEY8gjDDbzAk?=
 =?us-ascii?Q?RintIe5pleCB43TsF7NgukNf4M7usvNZZui+507MgDMN/Io1VxlSCKL3r9KQ?=
 =?us-ascii?Q?5pT/3M5cLZZltiwz8DQY/2vmj67hj+7hmafcyGnzS7ZWDXPXcrjzoYdsCiaO?=
 =?us-ascii?Q?fnhATwgYkqWZweW5cxWqKUI4kINI2U4peBr4sZfpFJ9jq1Kjh4DkjwmzQaVR?=
 =?us-ascii?Q?rORc4ZJod4+axfFqKc+FivRl0MB2o9YWNDyZNRozcdG2bhUEDe2T0q5nnW6H?=
 =?us-ascii?Q?88NJ/ozQAf65NiQFmSV/OkXj822Fx2x74cKJ39qsJzrbaqnQ8QZG8hzvB5gz?=
 =?us-ascii?Q?Rj96kkP876QKfbr/L8Jsm0M3B7b6qweVGRZaReidsAMyFtQkN92FuI2bUHAK?=
 =?us-ascii?Q?NSaAnTsFoOsxqAGuUzoinUzX6avGWeC2u8PGUAOdgHMDuqQ7ef7q0oongpzO?=
 =?us-ascii?Q?KpPrMBCkkcl9Or1jSFhFux6yj2vrae7K7Nz6+NESNuB1UEhPv6OUTciOux3X?=
 =?us-ascii?Q?C4ABSfQCf2f4XUTChfPudhi+nf1ryryBDqtRe+E2wVFFDKoQpcU3sk/RscsB?=
 =?us-ascii?Q?woWAiJJ2n+PTYMdt7BEN4AXwbZ3nLDj/IRi/0S1OhF9zjouFDT4amFe/hj5L?=
 =?us-ascii?Q?Gwu3tyRjvsoZsEc+iqrLY3wH225OkKOWi4RXY3zxtUtp4JtP7BxM40ymWit+?=
 =?us-ascii?Q?14/olanY+jkgbKsGlTPlsFJZZZ7NKg0E6YSm0Jvnx9ny9hrKJPAbBCR6if/f?=
 =?us-ascii?Q?IdvNbwWxY+4cY6bHcDYA2/8vdcQHg7iS+0iekZxlRu3c7kVjiVxCjTHVSIQV?=
 =?us-ascii?Q?nTSTpYBP9Y1MxhHcVZECR1BrEeKkPmgKNaXKgYy0zXqoqVsytoc4Ih1n5P2J?=
 =?us-ascii?Q?nkWFjlS2qQF9dvw/yPh5W+md8H+djrl3zS6weblkqAgbrJlPnbOrsura83Wv?=
 =?us-ascii?Q?eZDcnHxOGMAn86HVsCv/M1UrBpgO3h0TT9vey2XalehyuJCMWh3xPSHCefZ8?=
 =?us-ascii?Q?CBJUXYZZSCXHuJ2o1mQmHLt1dVvSmlOCNYOSh13m/SVXQ2ag?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b55940d-e488-4464-1237-08de42bb4d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 07:08:55.3374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/GE4OFUxo+nQ5dtDtpCkdio8y7yY9Nrla7IzNOUU69pYK4gZOjo5nRcMcAbKdurq2qWSQ6yB7L8oZo0fMI1rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
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

> Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl:
> Add PDFC subnode to schema and example
>=20
> > We discussed the ranges/reg usage internally as well with the
> > following
> > outcome:
> >
> > - Situation
> >
> >   With i.MX8M SoCs NXP introduced MIX domains. Each domain has
> a so
> >   called BLK-CTRL IP. There is no common register layout for the
> >   BLK-CTRL IPs. In addition to this, the register fields within one
> >   register may not related to the same IP. Please see my below
> example:
> >
> >   The DISP_MUX register configures the DPI output routed to physical
> >   SoC pads as well as the internal MIPI-DSI DPI behavior. This PDFC
> >   bridge binding is only interested in the first part, not the 2nd.
> >
> >   In other words, the BLK-CTRL IP can be seen as a bunch of loose
> >   register fields.
>=20
> Why do hardware engineers keep on insisting on doing this. And why
> don't software engineers when asked to review the proposed registers
> push back and say No?
>=20
> I know this is out of you hands, but it is something we should
> encourage software engineers at SoC vendors to do. Otherwise we will
> have to continually live with such a mess.

This is kind of system architecture. There are several mixes in the SoC,
each mix is a group of IPs(in-house designed or 3rd party). The blk-ctrl
module is to do various settings that could be done in each IP.

I agree that BLK-CTRL is not good for software usage, and we need to
discuss with architectures for future improvements.

Thanks,
Peng.

>=20
>      Andrew
