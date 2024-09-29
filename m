Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF809892AB
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 04:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E1610E070;
	Sun, 29 Sep 2024 02:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Bs35aPWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D9910E070
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 02:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ41dO5SR3sSG6zwR0fvHWpIb4n+tEsGXeqLZwpwsZ+dbLWzebdp4pkwgHrosBo4Ffj1qCTgFBzu4klf+CVgROUaqTORx6e/+8YECnum2vnkzJ/UelNqjvvxTdQN3JjFAjJm0oz+OhhK1htRe9EpkZqmr4D24HrM6Yhp0Zh0EY117U9NnECnFs2lytPnsxjNWdz0s1q6Nn1xO11BQMXIM07jFJvpg9TgwDdcWaFuHYF+V1DUuAts4d5I/zO65XhZJ6jlt9w9vhX3ycqB1x6tqfGA9OY6FcmIj8NyYm+Oi00Td5Nng8Y64BJeNLSTD2SObbGdsvqANwhdqNoUBuQnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81dSFQxyseY9m3EyMy2R0zyKl18wczpqv7e0pQ8GqMk=;
 b=rQ8s+6epuj6Nnyal3/Un+Yt3tr7qGGsadWEPn+Xk5Hxh6OAkksBsma3DM+3/FDHydaL7jEy0bXLq+MXoYDYj4Ie7DWTPhq7RvzdDY1xnEKZFBbA5vZBTZPPGUvdzr1+4MdHYotZxXtNhqzP50PiQVrb3RGEyhCXOVP5jq7z5RXxsMSKSDkoonoNvt8GLBwN5P/tw3P+abkcLZ/6Y5Qz2X0PE2HMxnMPZt99qdQa4kgT2vufLSmoUc2bE5ma7XxSLSptSYc+8az0OW5EIKs/ZglmJYZEdiAM+PPtTaH2xDaccyiH5tDrX2hqqzOiLUnS0jL0REdTuEnodSlkuOU3Utw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81dSFQxyseY9m3EyMy2R0zyKl18wczpqv7e0pQ8GqMk=;
 b=Bs35aPWyvEZrZPXZanJ2urHOt2gDstGQy2z4d1CfG2Zw3Y6dofwKf7kMO/4aGKvyzuAvAigl+VxUcrhfCUM73gP8YmcSiOLH0duwzZYoKFjj0GBq8RLcKKCJQjcXf+0eleMYzIZ4r17VdK421NEKfaa4jmDzN9G/HzmxbBLalMnWPMwXa6kGuenFu0BPxBi+owjRcgDtjtj2yfb853VI1aLh6HB18+wjFg4iF2gOLzZ/eptl/J8Qs7hYHF5lkRylbZnS3lUNztoE5c2Lihx4aobL2TYKMovDRPNXIbIUFQ0S3TYbRFdrLt1rxNeD73zFruEj7tWkOUCqAnoTTarZow==
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 02:34:23 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd%3]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 02:34:21 +0000
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
Thread-Index: AQHbEhgX4nb7DTccpU+2s+EENZKazA==
Date: Sun, 29 Sep 2024 02:34:21 +0000
Message-ID: <DB9PR04MB9452A0E23FD29D7A8DB17DECF4752@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <8bdf573bfd7e3feb45d7ccb53765a978a685ce2d.1727159906.git.Sandor.yu@nxp.com>
 <20240924-mottled-psychedelic-lorikeet-ef8f4c@houat>
 <2mug3ii2vi735sk7nwwu2rcj63d3mlgazlhg4sydcxb6uf5nsc@qi5ut5pmajsv>
In-Reply-To: <2mug3ii2vi735sk7nwwu2rcj63d3mlgazlhg4sydcxb6uf5nsc@qi5ut5pmajsv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|AM8PR04MB7812:EE_
x-ms-office365-filtering-correlation-id: a8823a02-b4a1-41c1-d41f-08dce02f39c0
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UU97DDDxiV523spcophuLA3ShY9HLBY5y+Zmd7vh20Id+GkBtIJfK2IJMPE/?=
 =?us-ascii?Q?AeaGt+rq9qJGc+7N6Av8hTTRyPlBAw1oMf7jZDCfgriMvpurbvffl51Mz8O5?=
 =?us-ascii?Q?IaW2g8WLFwhMQ+k69i2jncMHZl2cxjru3xflrFMl2jWbaSFG4q6MdWpHjmSh?=
 =?us-ascii?Q?Iwm2SIqSqoFusbGlJrBJRL6+cJuCauahEHUKOdzmokmIDxUR7QBbYtPR2oGU?=
 =?us-ascii?Q?mHflX+7NBQHeCRL195oIKR361aNrv/kDAhF+4SOglLOIcv+ThQlZj7E+Mujz?=
 =?us-ascii?Q?KH5y/0Iq6W+f6nbR55L5Mcq2xzWT1pL8sY9nIEofqRqKVaJOuJG6upLU7G/w?=
 =?us-ascii?Q?HwrmtNR3J/NgHuZYv12Qw+a9CI1WCVtzavVSDGOHPR3DvWtzOTQt4kr4YsAX?=
 =?us-ascii?Q?pWnH6wGYctlC/y+qU9ME7QEDnXadceRiCQt9lx6L9g+Dt7KYiScl2pz62iEv?=
 =?us-ascii?Q?uaOnm9banM6ztnJ4dwA/neIf2oKjLpGQnM9f6ji9csw6FvMy1dM9wyeL/0IA?=
 =?us-ascii?Q?gtAtaBG8mxJD1bwWOpcc3umfNC1Pmfqftsl7IALe639ZxYTvmTmVF4+oWfOJ?=
 =?us-ascii?Q?x4SodzPYyWnaAzFwPEedEI3CD4NsL3a0uWBExM/RM+Yt2robL7c1ar3rvDYE?=
 =?us-ascii?Q?K/vcgoVhwjmjKOsPAvkFUE7ysm0d2vNhXQWnbWqvs2SydF0fQJJjbY69hlmH?=
 =?us-ascii?Q?zU7tghcAEuu2qdmpj4+4vPefd6bVM62873NnV2bSrNecPxwpFJvAIw8Sxzk0?=
 =?us-ascii?Q?xt5AykvMx705pQtUHUVhBqY2WDWGMDntKcsYu7FalhetY3B5iT+OygLJF0zH?=
 =?us-ascii?Q?TMQpDMwjOj/PX3yvpoCLKWourf3qAEjblsrz373cRVeRgh+FswD8unpAl9mP?=
 =?us-ascii?Q?oRJRfRafun3Q/jwlepOwqySozHnsm9Ja2YAir3D64XxtwohotwM58MnyhJtv?=
 =?us-ascii?Q?W3AxK+lrv3mp9iIJVwaVK79TaU9GuWKmGOUOvEgs+AxOf7woBU5ly9i9CY0o?=
 =?us-ascii?Q?EqNYImKSRvzN1g5wkTB0lxOBr92azbXYXy4p18m4xR1be8PzEz/cMqfwIa0E?=
 =?us-ascii?Q?y23X2xQxRG3n1LY8gJ4gYnJBaIWs3+tokfCWXqJKNDVpkbIhuVy69GfxWhjH?=
 =?us-ascii?Q?tBJOcd+1lVYGjESNRZfXuv9qr7VQx/UQ3JqyrFCvxO6OeAF62BxENfxxRucV?=
 =?us-ascii?Q?n6e6wwBYLpXc+hDOoL8h5k6xJReHQqrsf7s2zVy6KPYqTRyDj8mvZkz0MgA6?=
 =?us-ascii?Q?wkHnHI+vxN8sJzoOhWnZTqcLG1yYJ619pqmpFWyZ4cm3BT5TLUYElEy3LZ3H?=
 =?us-ascii?Q?ItG6KRD8ZMIF7iGciME5W811Wz7X8wC+2tlAVWf72VGzzTxBjSSGazec+QD7?=
 =?us-ascii?Q?9DRprY3EZx8PyVOjULe2sNzt8kQOJhKvWXLThe4z7/+cF/XoDw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MLCBapPpuejGYJAfWoRGHgEj2fUx6PBTtYjxvuFq7pGpbbe7k2uhqGYmWHc2?=
 =?us-ascii?Q?sblWIyEtKnenJPRy+st1MBONcn1isiZqqZJ4D2sSv9qGxTHrxe1UGTGrBFz+?=
 =?us-ascii?Q?1DGMcrlS9dTaHrNKtlRDn2cjJzE4g1HCZR3nvcqmNcIQ4zHv+q+4XqdBWwBT?=
 =?us-ascii?Q?HFSFVyMolwo/QpwAVGRm2dP7+t4ecoqXGevNZVQX6g1G+ljiRt/HwE4UFuKY?=
 =?us-ascii?Q?MMNmMSAp3ehZS41HIBZFRlH+L2cfLalpXNxgVGL/e9uJgufypLosemmCsyrS?=
 =?us-ascii?Q?GaIG/LCyngn9OwN2BPyT9b5Dgl6ZVGfsjjqXf8LlWsiekVy4+PjQVAVwQAXI?=
 =?us-ascii?Q?fRBr57jS6hNkREtUX0+KjOi37calwv8Zwspy10ThRN3Kh+dydWtweVn2SQJv?=
 =?us-ascii?Q?9ChI+NUkzJ3BDLGNdO/lryTMDa31ID9XVduSYq++4cPvKjxYo9MXB6eSsg2H?=
 =?us-ascii?Q?aKN1I8qDHvypTCFWToDOzlURsv0cLQ/BVLWe0aqyuVXwkjPaZNSQ0ywtTyMf?=
 =?us-ascii?Q?1/N6rfYzWt3SxD+P38azRutH897HU8HPx5LDdTgr5f/hd/op9QRf8oBOuf00?=
 =?us-ascii?Q?S9JwQhdRdnT5rjSy3F7rXU+zU6ubWHS6ucmMTLFL4CBwWYV2j3RsS+8/JkrR?=
 =?us-ascii?Q?C0JGckUET34h9Tj8z5+mJTWfKvYDRI+CUE8b8W6byWKqtDgRWcF1XluyKjXJ?=
 =?us-ascii?Q?/rz17EDnJQQGCc9ckTra/WnMRCLqmq1mP0NQTIzpMi+7E2W3oUofJcqsDRo3?=
 =?us-ascii?Q?gYzxD2lIiGc9VWTN2Cb2fddstYaFLPlvPqan+jKfTg3bdy71uPVu19ZWlaI+?=
 =?us-ascii?Q?cAUnizsXiYA0MkaAr6F3KJENup8uX1r9XnlIdUml3fZY7fCh19OGy1HVTx7R?=
 =?us-ascii?Q?pAQ59Blv+wzeI9qq4CkLWbko0BdxMvo5CV0gNvKuRhETJ8/ZtYVKKFXQPkLl?=
 =?us-ascii?Q?nS3+wk6ThyQoa7qgqu149mJbREvi9KFeC4KurgT0wFVG3L8uZ/vqxaT32Lbm?=
 =?us-ascii?Q?mVL0FNgKCc++bLUCiynYZrDWHLEHdImOpOx/AY/2/lYPI8IYl4Df6j/C2qqT?=
 =?us-ascii?Q?sZxpVcgACFgUBdJSdz5yroll9XsvS8P+Hk2dfEfz4Bxfb2DIxaT1nRxTHNQv?=
 =?us-ascii?Q?mF3mDPKkoaHnIbDnXmJLCsJ/V8nsZRgr7kI8WNhuOovkzAseatMjrezeUd4M?=
 =?us-ascii?Q?Cw8IpNvp5poqfznfjJ2tCeOFxNc8SocEzQ8HTrT77iWnOrpuhGvYVD7/5DxU?=
 =?us-ascii?Q?g4nWFvHpTRsWqD4XpLnI5VBPrWjKRTa6effXcab1gxWKZtjYsUNHOKOt/85J?=
 =?us-ascii?Q?hU+HMZQTYa6s/tv7wqq4xwswopJTb7Y9vw1oJ5t7fYWhIRUT6OYRcv8KUNOG?=
 =?us-ascii?Q?GhF8A12oEIj6g+Bx+1JcrVt7aM24p2+i3foWAl5qTmcNnrVOw6coiU0ZvFXD?=
 =?us-ascii?Q?HiZKyED6F4sdwg8XmJU9hvglho1vvoQ5OWSUAPHscBEn2/ed4MSQ8vGDDMvf?=
 =?us-ascii?Q?hbRiRx/XP2qgC9dqAap/yCoO1czaif3RQWqLDUYpTw/aiylTUov11o3QlTM2?=
 =?us-ascii?Q?iBnz7jaaRFjQarA46Cc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8823a02-b4a1-41c1-d41f-08dce02f39c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2024 02:34:21.6207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJ8D8wF6JCQDyB5SUcRvEbNavh/xgo/6ahIc3bl5E1B8/gMy/TzZyuJCmm4sPENJoeH43geKom4x6MLQnOV9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812
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

Hi Dmitry,

Thanks for your comments,

>=20
> On Tue, Sep 24, 2024 at 12:16:27PM GMT, Maxime Ripard wrote:
> > On Tue, Sep 24, 2024 at 03:36:49PM GMT, Sandor Yu wrote:
> > > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device
> > > +*mhdp) {
> > > +   u8 status;
> > > +   int ret;
> > > +
> > > +   mutex_lock(&mhdp_mailbox_mutex);
> > > +
> > > +   ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > > +                                GENERAL_GET_HPD_STATE, 0,
> NULL);
> > > +   if (ret)
> > > +           goto err_get_hpd;
> > > +
> > > +   ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > > +                                       GENERAL_GET_HPD_STATE,
> > > +                                       sizeof(status));
> > > +   if (ret)
> > > +           goto err_get_hpd;
> > > +
> > > +   ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,
> sizeof(status));
> > > +   if (ret)
> > > +           goto err_get_hpd;
> > > +
> > > +   mutex_unlock(&mhdp_mailbox_mutex);
> >
> > That's better I guess, but it's still not a good API design. If you
> > can't have concurrent accesses, then cdns_mhdp_mailbox_send et al.
> > should take the mutex themselves.
>=20
> I think that a proper API might be:
>=20
> int cdns_mhdp_mailbox_send_recv(struct cdns_mhdp_device *mhdp,
>                         u8 module_id, u8 opcode,
>                         u16 size, const u8 *message,
>                         u16 buf_size, u8 *buf);
>=20
> Internally it should take the lock, exchange the data, then return.
>=20

Thank you for your great suggestion. It seems like this should be able to s=
olve the current problem.
I need to check each existing FW access functions one by one to see if they=
 can all work under this API function.

B.R
Sandor

> --
> With best wishes
> Dmitry
