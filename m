Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A569D9940
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA71F10E407;
	Tue, 26 Nov 2024 14:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UBLEtX6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C4A10E408
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 14:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr+Hh0hX/0WdjqxlIT7ANlzTuco3lt/JxgU6oFrss3QqD9hcJcidjuPRsJXB4X3/xX0SrVj/SJEIEFFvAuEkrLfKdOWW1kyhO6PENKk9St4xQ6XLipDXMsnpIYUJJhwFyJKJsvv+ksa7kMqlCA7L1aqqQ+7RrXhVeWNP/cA0NcDhmXVSUtpBOZnd3oU2mPPN3/aOUHHTqRw46sfQu0iufl12lpcXQgj5fPVwq4v1mB+zrYNt6nPlKrDIIrMzgrS71VzKpww+KYl6mZoY4rQm5y7pOvaxzth7pUvIoy8qWwdRexpwKm0ccyGmIJ+oALC0KFi/nifzEuBWn8I6433pZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUbI9HI2kHLv0eldmn3uQDytLLgHPfxkIkH2+VbDEGs=;
 b=UONdbov7InP7cazzI4opYwRL8JvTahHFOfIxvHeg/cGqCEiVpEUq4MEtyfT7Dc14h4zr84Ve/lYX+VpIlGLU+VQWNn9SfRDUFvIPgjEKbixgW3ASZiVGICmUgRyJezVbjFv0eSxkY4/cFdlp7+jcuOEdL6XEmKBO3N3I8hEUGSVYm1ajScpsXT34BI4VXVtNCvIdqbMCIddmaD8YAOELAIPL8GieZ+LVVId5Xy+7RSj+U/17NhlwLBewTvZON4xRytzV5QA3YOb3k6AaJZ8xV2wIlrXIcdjtLTi9CVokqVhLyUjTQJ0Zz/0Ph99o4Khr6FO9u29XdQD8psmS+2XmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUbI9HI2kHLv0eldmn3uQDytLLgHPfxkIkH2+VbDEGs=;
 b=UBLEtX6vxQqeb+JArNs/F/trBREewcwXFI6ON4Z6p+K8KWvRzndAjkgkyEAGgIYr/4FBBL4DzNWoEq21pzDpBdohI5BzTX06db/vohiXPRrRiwlsbKwzuW/I1Z8gSlwpQUcGxIeK5J+npaiNfoFV5XEo4HeLvNvAYfslm3+RP4KBI/rG6a+6hcbS62s81SYLb8XrUvGS3Ie2FZCir7KZzDU5r1n8kgYq2QMDi15Qx+PhdZCgXLq+tX9yEerYA0i6gIcFCA6SNY53m5r5CigFFbFLLDn/zWwzedw28USanh+Qt1ekNvIcruTX8KPtAAdEm0q7zxxmH9ZOvfPi5HTCpw==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8894.eurprd04.prod.outlook.com (2603:10a6:102:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 14:12:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:12:19 +0000
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
Subject: RE: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Thread-Index: AQHbL4vSjpxHitZMykWL4MsQcCKA6LKr1usAgB3IEmA=
Date: Tue, 26 Nov 2024 14:12:19 +0000
Message-ID: <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
In-Reply-To: <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|PAXPR04MB8894:EE_
x-ms-office365-filtering-correlation-id: 193f5814-7a47-42bc-f194-08dd0e2456a6
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TIysr0aQ9r5gbjYEmQzLWBnhCC2rZaBwMc8P21AEbwIA0fA7ZipRGSos1BFv?=
 =?us-ascii?Q?1N4B6IjZQ11dte1G22712mAjGP69r6hGvP1x2GdvglKkAH9T8RwYSvTgvUDa?=
 =?us-ascii?Q?Zed7gD7F6hWUHiO/4EOTFBV1hLCMtKPqAhWlxq8Qi+uBL8deyHj7XeQhwvQR?=
 =?us-ascii?Q?dJj3xiTL1crqbsOsmnSWcaGJjKKSAAUYQdtlfApc1fJOiRsK72grd/o79zeC?=
 =?us-ascii?Q?CvLOYZwtCbwRJ167uNljZyJW3OoMi3yXvPgwYXfpPo6qHYlCKgqHuAOstCN/?=
 =?us-ascii?Q?8bygsC6KEmoNw8wWwry1bfMnrJnOYRk+p2yK55/aHNP2QsM8bRUfptd7ZrVM?=
 =?us-ascii?Q?SwVA1bR6pjLXslVXfbZLcZ+rRFYBhc8d3mAKil9jxRGrj9p4V0o7e8lZkSxq?=
 =?us-ascii?Q?U5ShOIpTUH5eLq7ax7fvn+QhgAqKffOSh5szEURUrRawKg32CjaaEDntZ0HM?=
 =?us-ascii?Q?1LEq1ue2RNxhul117+o8r4KYAI5aDag83jHLMjCkZyqyzsT1/rpQDEaYkh7h?=
 =?us-ascii?Q?1UbMkkZpCCF/n1QwZWdbiwvJmYNO6Pr8ZYnIvpqqXZOtm3XwzpPU0O7dKOD9?=
 =?us-ascii?Q?SXxEk9Yq6bjRDT63S/b2vtY/1f63Xk4eB1nVGQJFybcORFugIum/j9h2RNE7?=
 =?us-ascii?Q?XcbMbfCm+657EXlbhOBLUnH1S6w4wYX0ASD6cCx2SSp6dz+3N3oo4kr/lH/f?=
 =?us-ascii?Q?u4rDtPgxZfdqOWiUCuWdpjJzt5+HAgBsg621BuAC/Gw+90UnB1akfIWegDFn?=
 =?us-ascii?Q?3s7JqKsAMEfJVvfyPv5ZFnQLn+pdd9HOhYlD4ucA+WtbyrEgE395dd6oDa0u?=
 =?us-ascii?Q?36HkvVh37V+dqV4Qe5phcyYgpSuPSGkFaYdpf7a+bNb9QTBY5s4pBtaNtnmD?=
 =?us-ascii?Q?L+lEAu8m8n/+qX2rU3f5j1hV3aM+3H0h9KlTegYpm+Y5tOY4vj7u9mSOdtOP?=
 =?us-ascii?Q?FtqkRl8DSe1rpg2XQ4sz6abv5F571B6rFWfdg15i2Iu3Nc2/IvFViZS9K5KG?=
 =?us-ascii?Q?UKyRnXj1OnKO3FIaU/D/zkL9xii6oATj8ifhq/IrCOuTbev92e0NlTJf5F1H?=
 =?us-ascii?Q?k4sFFIFPGawAOaxB50yE0AQssy4HPn1fP+hIZz4w3dXbKl0p0wt/KQoEMikP?=
 =?us-ascii?Q?lONot78+XR2nn4eDE18YS8ySpcKdn/DOcd7Lwo15RjPp2KHOwuqjimcO/KAD?=
 =?us-ascii?Q?tIs9FtpIRRwBl3sn2QhtDPmQdRKXylNI4Ssk1ZpHMippEM3DPPpozTA8keZz?=
 =?us-ascii?Q?Ku34xnrzzjH3V44OzF8sHYvP2b4UbmISLYRg+aKdVcGg7OXVWpSSw1f538c1?=
 =?us-ascii?Q?2gc/VZX16O4sb862jVEEn5GH+dS53iff+i5LRVoDdwWrlfTsnvjFEkABDves?=
 =?us-ascii?Q?o5ZDjQb2YI/oaKyuKCBvQANX6sxVDfKkQ4hJK7WLdwosT4Dkag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GSkCnK2xwPpNrmi4mIZbwgglTdFTBdy4PTMAnvc5n6Sb2wtSISoToPTc4eUs?=
 =?us-ascii?Q?Le9RMbWPgl0yvAX3P98Nstu4B8vUBx3gCnMwInBB/F9zc8t27mvFXpE6YkK4?=
 =?us-ascii?Q?dFH2PG+g2XU7L2DW0JDTXmkjvXbYE9gog2IFPEhLoqq67dUNt/kd97y6i3fN?=
 =?us-ascii?Q?B76gxeOqW9IJ7fSrhtfeYri9hu3WJWXo7M74jTAgTLaCx5ufGmSacXfy3XH5?=
 =?us-ascii?Q?OjnkiQtu8KowMukBGFeHAZMeVYXtlgoXGZiNEttuj0FgkOT1+yF2RRaC++qH?=
 =?us-ascii?Q?MAOU0jBURpRrrgPkqnKJiCCuFbo9XnOaj5bM9muoMLTP5Whz0EhXpNCHhqlE?=
 =?us-ascii?Q?3Rcb2GLMZDmXn4MX1x6x40UZwY6PDRi556zsyluLleCwpVgBnqgwfytcpDvi?=
 =?us-ascii?Q?T3xlcHwAQXePjMftXZhgEChsYvY/irWpI5SKp1/uCcT+xX/cFealvg9zP3lx?=
 =?us-ascii?Q?NLopx5gzZ9L+vftRg/hJNl7irTaEsHfX+PSYxARZ60tJ//of8Dmo3bpRUvOo?=
 =?us-ascii?Q?Rwj5U4My3xuUvsXhIA24q45RQacMopVehIRrHf0Xx/XW30x/39D44nL9KmY4?=
 =?us-ascii?Q?jnColjQ0bDUSHM1XdBd+ga7ScrTUFSp5nltgqe9u5XAcOGEZcmZCJLgvLTmt?=
 =?us-ascii?Q?9Dnmx6p0HbLiYqf2AUPBVWSZzR8HLw5MVJk0qfPXioktkOebIn5cVvhvC2pp?=
 =?us-ascii?Q?ifnJKt0N1RNhXbD9Qx8PbIy7L1TGsiw4NL7fsJz73GURjSI4Z8BU5m5iUf63?=
 =?us-ascii?Q?uyZiYfCxAQQ9baOmBm2I51NRJGc+H6MlbRn6on9RCROAkupEXkqfgJrKhYwG?=
 =?us-ascii?Q?vSmZgjzmu5UxwJevcvCxbnwzFd9Eo0ZnfYHPb9gwZrdcgkE0H2Cmy2Mi1tFN?=
 =?us-ascii?Q?mgvNZ8lCFVIR0XVvI+B2tHPFrIzk+Dw+nahxLb1DslhGidq4eCiib/ySK2/M?=
 =?us-ascii?Q?HZuAiqvJ1Z4HI/DxQcbgjJnJzmPdmN6Slen15Ea4NAIShmSLTUYspG5V/EnL?=
 =?us-ascii?Q?XmlvdMDa3awdjDOXAI97wI+dOfz0EKDbTl5/UFYm7v3kcb2zdHAfx2/uuGIk?=
 =?us-ascii?Q?AxfNPHnkgTUOULEmrVKgWlpywMwuytk6S3RbA95KZPLLrlpBDUnzXRNepfGe?=
 =?us-ascii?Q?O0NmFCTH/5zgF/CSAhkrPr8Ion5jd4ONqjoAgNms5+69wIrCEn35jXEn5W0T?=
 =?us-ascii?Q?AT4dbFIyUYx17EBDzK3XwhQLozcGUUNwyDebweM4jqpI/UJqHlYnaewMYT8V?=
 =?us-ascii?Q?BNB62A+49ysf4/mGMt1FszHYXwHPYEK29jDlTuCdvpWjkJq4/L67o9eMRSrW?=
 =?us-ascii?Q?IJ438OQ8aBvOJGGpThISx9ccH0ew0q4RMpQAteEJz2zI1K1UEsYzofSOxAP/?=
 =?us-ascii?Q?xj+1N0M6ahONug7IR3tt5fUZhn9z7KA1Qe01jSZJC9//4R1axUhre4OFfU1N?=
 =?us-ascii?Q?6aKD2tgS7onj07tJ9W8u43RvSyZkVlhfSw0DFcGAPM/rfJs89jjwrU7YAXKX?=
 =?us-ascii?Q?/hih+GsC3epM6Wi+7wgcb5eRtwFEQayrl+2aA7AfPqn611QemLcC2gCazbPx?=
 =?us-ascii?Q?x9d5cFMhD7oQYpZnhUM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193f5814-7a47-42bc-f194-08dd0e2456a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 14:12:19.1265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7KaCDg8mRQXRuIsqmSwmbKMFZCajxDJfY+jNmbJgOHNqVrvu3BX/3VkYQO/bJrUDbcNSFk+ZiS0+zX+Fxoha+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8894
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

=20
>=20
> On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > >
> > > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > > >
> > > > Cadence HDP-TX PHY could be put in either DP mode or HDMI mode
> > > > base on the configuration chosen.
> > > > DisplayPort or HDMI PHY mode is configured in the driver.
> > > >
> > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > v17->v18:
> > > > - fix build error as code rebase to latest kernel version.
> > > >
> > > >  drivers/phy/freescale/Kconfig                |   10 +
> > > >  drivers/phy/freescale/Makefile               |    1 +
> > > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > > ++++++++++++++++++
> > > >  3 files changed, 1348 insertions(+)  create mode 100644
> > > > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > >
> > > > diff --git a/drivers/phy/freescale/Kconfig
> > > > b/drivers/phy/freescale/Kconfig index dcd9acff6d01a..2b1210367b31c
> > > > 100644
> > > > --- a/drivers/phy/freescale/Kconfig
> > > > +++ b/drivers/phy/freescale/Kconfig
>=20
> [...]
>=20
> I'm sorry, my email client cut the email.
>=20
> > > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > > +                                union phy_configure_opts
> *opts) {
> > > > +     struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> > > > +
> > > > +     cdns_phy->dp.link_rate =3D opts->dp.link_rate;
> > > > +     cdns_phy->dp.lanes =3D opts->dp.lanes;
> > >
> > > Shouldn't this be conditional on set_rate / set_lanes ?
> >
> > PHY do not support reconfigure link rate and lane count.
>=20
> So, you don't support reconfiguring the rate / count, but you still copy =
the new
> rate and lanes into your driver data. That sounds strange.

The PHY will use link rate and lane count to configure its registers

>=20
> [...]
>=20
> >
> > >
> > > > +
> > > > +static int cdns_hdptx_phy_set_mode(struct phy *phy, enum phy_mode
> > > mode, int submode)
> > > > +{
> > > > +     struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> > > > +     int ret =3D 0;
> > > > +
> > > > +     if (mode =3D=3D PHY_MODE_DP) {
> > > > +             hdptx_dp_phy_ref_clock_type(cdns_phy);
> > > > +
> > > > +             /* PHY power up */
> > > > +             ret =3D hdptx_dp_phy_power_up(cdns_phy);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +
> > > > +             hdptx_dp_aux_cfg(cdns_phy);
> > >
> > > Why? Don't power up the PHY if you haven't been told to.
> >
> > Power on the PHY to enable DP AUX, which is necessary for reading EDID
> and training the link.
>=20
> Call phy_power_on() from the DP driver.

OK.

>=20
> >
> > >
> > > > +     } else if (mode !=3D PHY_MODE_HDMI) {
> > > > +             dev_err(&phy->dev, "Invalid PHY mode: %u\n", mode);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int cdns_hdptx_hdmi_configure(struct phy *phy,
> > > > +                                  union phy_configure_opts
> > > *opts)
> > > > +{
> > > > +     struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> > > > +     int ret;
> > > > +
> > > > +     cdns_phy->hdmi.tmds_char_rate =3D opts->hdmi.tmds_char_rate;
> > > > +
> > > > +     /* Check HDMI FW alive before HDMI PHY init */
> > > > +     ret =3D hdptx_phy_check_alive(cdns_phy);
> > > > +     if (!ret) {
> > > > +             dev_err(cdns_phy->dev, "NO HDMI FW running\n");
> > > > +             return -ENXIO;
> > > > +     }
> > > > +
> > > > +     /* Configure PHY */
> > > > +     if (hdptx_hdmi_phy_cfg(cdns_phy,
> > > > + cdns_phy->hdmi.tmds_char_rate)
> > > < 0) {
> > > > +             dev_err(cdns_phy->dev, "failed to set phy pclock\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     ret =3D hdptx_hdmi_phy_power_up(cdns_phy);
> > >
> > > it seems to be all over the place :-(
> >
> > The PHY has different power-up rules depending on whether it's in DP or
> HDMI mode.
> > In DP mode, it needs to power up first to enable DP AUX.
> > In HDMI mode, it can power up last.
>=20
> The main question is why are you powering the PHY from the configure path
> at all? There is a phy_power_on() API which should be used by your HDMI /
> DP driver instead of handling that in an automagic way.
>=20

OK, I will remove PHY power state change code in PHY driver.
Controller driver will call phy_power_on()/phy_power_off() to management th=
e PHY power states

Best regards
Sandor

> >
>=20
> --
> With best wishes
> Dmitry
