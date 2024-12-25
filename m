Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2C9FC405
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 08:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD6410E349;
	Wed, 25 Dec 2024 07:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jXGg8faO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF89E10E349
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fW6sygxI8gqTCSBroSzfjTrdxesHlGEYbGZcMGzDttjhyhZ2vV8S1qllnScbokXEyf/NmdtP+HYps/lCgyVRD+/m99vQY6uf8J74woKa0sLvvNr8+ayJDPlKsZQ85msXxohbRZCJnD7ZKuIDjfIpME5Q6390LMae3d8P7en+hkfAqfZ2GCzNC2nv7BEvGEYVGEmYecMfbmRU3JOfKsjkzuk8p2K8vbykfWrBP/ZoD3Xw9JWR4+JE+i+EHsO8zqw7RD2TTf4swtdC7PjeQLljzydryFTXhnlz2vOc+1FbGIHe4RS09eQGC8rqLqbUF1NurnEE24zKrHsVMoJ0aYKLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gwi5kllOWuBRcvlh6K6xzgPKTQbQ5jZz+lkJQy/lyPA=;
 b=PoaIWiRSatN1qxrUQ0IPTeTOozOgX7IUimODTOe4CXFY8tnPx3jEjGZfTbeqBRSl8jgmGM623cGLOb2IzGa/DhcGQa5opf2h8YWl0HIHNgOxmXI21pbV4uU3iNRqzeU9WRw7X0ajDR8vEN+UExcM59MGv/zT26oOT4s0Rjg5TySq4O3iCCI6yEjUa70mLR+BRPdpKvZMGTqIURtwFdrjQnsMrHG9d/EC0eyreWDEIF9zffkuYrDdmVDMyR64ZjP1HaC5O9FjatJeESEeAw4C8DHadqDeh+kU6RNgeDNR2umDPPkOwQc+fstZq5K3qcWSwW8ArAFvz1frFROXQmCGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gwi5kllOWuBRcvlh6K6xzgPKTQbQ5jZz+lkJQy/lyPA=;
 b=jXGg8faOTaynW15yBArCeWa4Ge2HRmTw5S0wHO/hZ5Xb+StNTWxlcsI9yBexP/0AaSB5ytokbxSNVGsuU6CLIpBy693zP8TZ4MsFyFeseNVZBMtodFyfvdpnjOGnNjvJ8hdAbQWmcKQ27uqHBGGJD/Id0RUXLlwYGEDiPUb+dojSAdBnzSqCwGW2Fnx2wncrBEECTmDH+PmXgDjPI1la5J2vpiuRaBnkf1AG++efQirtAEB71A1yZphEDRbplnHVAuDoTBaHOYfMYktCl3uv6vnajU4GRPHwTHuaDZ5SPALVpaKS6MATzivRoFd0MUbDdN35T9V84BSZW6mYwuI11Q==
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Wed, 25 Dec
 2024 07:56:15 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd%7]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 07:56:15 +0000
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
Subject: RE: [EXT] Re: [PATCH v20 1/9] soc: cadence: Create helper functions
 for Cadence MHDP
Thread-Topic: [EXT] Re: [PATCH v20 1/9] soc: cadence: Create helper functions
 for Cadence MHDP
Thread-Index: AQHbUFBcyNT35zfkfE+RGUhtMgL3+LLqRvgAgAjcHTA=
Date: Wed, 25 Dec 2024 07:56:15 +0000
Message-ID: <DB9PR04MB9452836ADDB545CA3B5B0FC7F40C2@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <7fd5d54e2594aadd66598888ddf512f3d6d30e5d.1734340233.git.Sandor.yu@nxp.com>
 <rew4x4qxemig7rq4kossrn7cybihrgsizh43wnllgv2daf75gm@ziqsakm7gm56>
In-Reply-To: <rew4x4qxemig7rq4kossrn7cybihrgsizh43wnllgv2daf75gm@ziqsakm7gm56>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|VI1PR04MB10026:EE_
x-ms-office365-filtering-correlation-id: d09f68fb-93b3-4671-3efa-08dd24b99bb0
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uJOcRtMgeLEDkZGP2xoZuOmX8CHst6F851oN2eimF6NjlhmPAg8q40nuORi5?=
 =?us-ascii?Q?0h55zGvVp9gufKDn5zKmqOekDALwK/GLX1qYgasB61OVOjALPaDpPRwpt1zF?=
 =?us-ascii?Q?LkkTbTpJfLu0Rny6C+BNqLwZJ9a5BiY/CtrW9pkP7+rWVo4yE3bN8ZkRgx7K?=
 =?us-ascii?Q?MLMc6rG3DBxk6DwOYkFu/zcdQPWIH/KFjMCPNHPDdFyoLFPu8zqakJE4HWyL?=
 =?us-ascii?Q?VJQ0AP8Zwogs3SOYgRhrIeHxqtcI0Rpnme0LvLhIVlepz881gP3Zq9NsGzmj?=
 =?us-ascii?Q?zSI0afbI10V46QbeSzELgxfrMynnvbC0pfAkuFW1qnPzd7+O832C5RMYYHhk?=
 =?us-ascii?Q?FcoiAxRmz3v1lb0/c1uzEbfWbOxjVfJtycZc7bW3uf68oGn4Dw6grabvKxmC?=
 =?us-ascii?Q?uJIlfB0Dw3NWfFowh91ZMRXX9n+S4/h81XiHuEIJtbnoiiGtKa5pdJlGM4yk?=
 =?us-ascii?Q?HJhz3+mqNa8acULnGaGZotw+dE/YV6xI0DvJ760ky4LesP4ZNxh5H91AhuLp?=
 =?us-ascii?Q?HyeAEPVq1vXEm7jRkYnVq7Mntl3Hjff0JpcqZA3Ve8XmbivhziL0NBY4kk4Z?=
 =?us-ascii?Q?3nWPYNrKJg8W3oxqQyRgznfAeDbEmdjdlhcW3EjUYjaFI8MbDKpqGrYxwu3/?=
 =?us-ascii?Q?f26WmuhNic4tCcVReM6LYsyGAvfdNxsSJOIQ3TZylSLJ3tti21pv4E0DVKG6?=
 =?us-ascii?Q?bKzUsC0LrW1oznX0xN9mvcHeWDICSY2GKQrvvdicC5CEcx3QR5p3KBI9Kmj+?=
 =?us-ascii?Q?GEhZX80WGeqR+9D5ZLkm4Lqv7cqJrG/DFSogZNxeR+zC7hXF/+wrzpiD4i8R?=
 =?us-ascii?Q?YaaoBYiMsEI3DtBlxlo9T6gKKoohdLeRRBjxTAsssAUFwtOHvCN471KE8DRV?=
 =?us-ascii?Q?wEedIe43/Of7yTsQvTto9jhH73AwUyU9/gRuXF4dtApBSyMOM8Y+pxiGtha2?=
 =?us-ascii?Q?Ym+e/oxIs6Sr+cXsgZjdJyjbFYZwIirhRDwPV3XkoGledTLSZsqpyiYyZZX2?=
 =?us-ascii?Q?rcmMxdRASKehb4vBWIRBY2/a2MLp+eDoLh7/aUVTukOEDqGkWfMTT/Al3eT1?=
 =?us-ascii?Q?WhbZWxsQjWhAokip0Ow6BQm5HolxazcjFeVHw/CoQFSL49CoWoYHMseJskfo?=
 =?us-ascii?Q?EVpyDuScIuS1XgjgIB1ox/zXGciRYTQbe24VR8ZEpQAqe2UuCfXTNTF2eSGx?=
 =?us-ascii?Q?copk0o5tDFLwwWc/ZVq1qp2dOcrDnEbcHZ5QsY/LzQbmrgyEzulbfKeaRFib?=
 =?us-ascii?Q?78xszI2hxwOURKrE0H/wS/ogw+3CayqXl6xwVmCuQDNbRF44RhbYQ/9uSmZ1?=
 =?us-ascii?Q?pzHApgjfiNhq1woyXFulxvv4noELlF+JkUoLM4v9qx98e/EpO9fSKSbNWpaI?=
 =?us-ascii?Q?BQFIUlqYTZ5qJaxsLuR9ndpim2pYlCGITmjtgOun+Nzx1lXGqdq9qbb6AOAm?=
 =?us-ascii?Q?VN2SFBqBig8EEFnUtYjNGF0ec4bxPhtK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?swKzbbD1tyg5DAdWiw/zaoz7hafUq8ZJvfI+3mqXT4LwmiN+RxbHTv8ZnocT?=
 =?us-ascii?Q?bFdhDoIdhTapMzL5o67jgMpLCWQ3Xs9pD4U6ea5Hj8GtdxaT/z4KcoKGrYOR?=
 =?us-ascii?Q?ye6V/LJYBKaY3yHFoila+a00ZKdKnvxBugkRt08Mwn/z1r7N96EooHP3x/vv?=
 =?us-ascii?Q?pz0w03UR0QVbPTTvApJF9ZoKqxYIue+LP8t88vDEsz3PhdQEMG0Rj52MCOq/?=
 =?us-ascii?Q?Fbd3A5r5e0hUro43nITWBSN31Rx0LdP1KYrhg6BjXGPEKmhF4ORl4ZEch831?=
 =?us-ascii?Q?CjWbn5FKZjrpyHFb0oRqfI8xs7IcWzLIsB5DUazRcDCh3v+uBojZbA6R7bJr?=
 =?us-ascii?Q?JW5eZrtPBY6nF3sB44NyVV93uRayzQO/BkxVmTQmNUSaX5o96M/V4JDXOxzx?=
 =?us-ascii?Q?5WdSixnf7JR7k/fc8mz3Bz9hoDyxv7XGaII3De1Qxdp1mDrCL9VKdpIk+mAb?=
 =?us-ascii?Q?aQr3sLdWP+DvuxVJBY9q0mYH8B+EBCNmEXq2yKZSo670EXFlFDk0L1oN6lZB?=
 =?us-ascii?Q?GkVJ7tr6m8Vtl/67/S4YJKSdPb9rGKdz3pfc4wC2JVqfiGkSnWRjI9+K6O7F?=
 =?us-ascii?Q?AYS6IB1rAmJ/6mgfYzmCWBTzU4vt2QUeXWUPGB45DdRd2NmvNmS+ptZYQyDL?=
 =?us-ascii?Q?ShMtTtp/Pf/fX+2XLvmP/Kmn1Jeoj5b5ns5izqNHZVzTNOOg3eejkaQKTHuL?=
 =?us-ascii?Q?q864HHMlVz45wp5Q1oo7u7CG17/pyIm25X5OE3E/0VDVq9pvzhlV92zY3pB5?=
 =?us-ascii?Q?ZmQ5K0DMiiTy+BEh35Xlf3LrHlrfU4g6Nm1xZcd4nD6bKMvOl/pMl5ICHJ++?=
 =?us-ascii?Q?vHbXuxPD0v6swDcMMdJ9PILPUPUWzqHkEHjP0OVpMK/uAIZAJEotAErJWHNV?=
 =?us-ascii?Q?1UDMW2xTnjG9pi/qAlbBjy1iIYFPUjGL2xlByIUCN0TMN/blHSEQQ1fHfu94?=
 =?us-ascii?Q?5WmLr31eWPtYKlUDIQm0fr4sCZbk0X9iM0VphlVGQTPsyJP/twxRMN8SvD5n?=
 =?us-ascii?Q?/it+w4G+xEJsP4Tu4XDwTd0+mD+Ie6CK/S+FA9zc1+/BmUdJpcUWC04gtvSl?=
 =?us-ascii?Q?+B+QtyhkZDva9vAW8NSbNV8gI9z1Jd/T4l5Urnjx+82LMZt/Mvo2euivsLke?=
 =?us-ascii?Q?M5N+I9IKK87tt9hIOhns80idJc0LiPF9SRFXCeMjnGMF5snbE5AviSMCpaHw?=
 =?us-ascii?Q?N9YXuStXF4QWqPHndvDXsj5FhYoKHY9f7k2hrcxxJprtyMnYEPKJtprON++R?=
 =?us-ascii?Q?G9M8hNmntmUyf5qTxPVYOuO3lnvq/CxN91E+/8rGDMP8dDKyZAlxTQw5/Lx9?=
 =?us-ascii?Q?f9EpDLOFKh5ZsahPG+4Idk+/bUEAWJPZj6gz/Tl4kDqPTzoTNSy4d7alBZRV?=
 =?us-ascii?Q?lQn2Y9hksBbij2DUR310cGxE2Ygky4ttiVWljWrywj/Eyzr5fT7D1HQzagdg?=
 =?us-ascii?Q?z80YGL9mta5JnSRVdyivc9Q0wN+VoKUFmUOWvBfzH1k4dVO+c9/1oy2iVMh7?=
 =?us-ascii?Q?zDRGyHpkHBJC3uq1DGfIszFdl6LxvyrysCklTTd2+snV/f1GrHa9l/1u7L9E?=
 =?us-ascii?Q?rVQMvfxbKtbzT4ZBDMg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09f68fb-93b3-4671-3efa-08dd24b99bb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 07:56:15.5965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: luarXyW3wkS6cdbd7ljTDXPb+yUiRDDg0TIisvkwqilMcjDjhi0w+SZ4Jejt4V3D+8VozV/ToI7bCRVsW7qwoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026
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
> On Tue, Dec 17, 2024 at 02:51:43PM +0800, Sandor Yu wrote:
> > Cadence MHDP IP includes a firmware. Driver and firmware communicate
> > through a mailbox. The basic mailbox access functions in this patch
> > are derived from the DRM bridge MHDP8546 driver.
> > New mailbox access functions have been created based on different
> > mailbox return values and security types, making them reusable across
> > different MHDP driver versions and SOCs.
> >
> > These helper fucntions will be reused in both the DRM bridge driver
> > MDHP8501 and the i.MX8MQ HDPTX PHY driver.
> >
> > Six mailbox access helper functions are introduced.
> > Three for non-secure mailbox access:
> >  - cdns_mhdp_mailbox_send()
> >  - cdns_mhdp_mailbox_send_recv()
> >  - cdns_mhdp_mailbox_send_recv_multi()
> > The other three for secure mailbox access:
> >  - cdns_mhdp_secure_mailbox_send()
> >  - cdns_mhdp_secure_mailbox_send_recv()
> >  - cdns_mhdp_secure_mailbox_send_recv_multi()
> >
> > All MHDP commands that need to be passed through the mailbox should be
> > rewritten using these new helper functions.
> >
> > The register read/write and DP DPCD read/write command functions are
> > also included in this new helper driver.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v19->v20:
> > - new patch in v20.
> >   The patch split from Patch #1 in v19 and move to a new folder
> > drivers/soc/cadence
>=20
> It makes it harder to review, but granted that we have already past that,=
 I
> think it's fine.
>=20
> >
> > diff --git a/drivers/soc/cadence/Kconfig b/drivers/soc/cadence/Kconfig
> > new file mode 100644 index 0000000000000..b668790660fa5
> > --- /dev/null
> > +++ b/drivers/soc/cadence/Kconfig
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config CDNS_MHDP_HELPER
> > +     tristate "Cadence MHDP Helper driver"
>=20
> This symbol isn't supposed to be selected by the user. Please leave just
> tristate without the menu entry text (the help text is fine, please keep =
it).
>=20
> LGTM otherwise.

OK, thanks, I will remove the menu entry text.

B.R
Sandor

>=20
> > +     help
> > +       Enable Cadence MHDP helpers for mailbox, HDMI and DP.
> > +       This driver provides a foundational layer of mailbox
> communication for
> > +       various Cadence MHDP IP implementations, such as HDMI and
> DisplayPort.
> > +
>=20
> --
> With best wishes
> Dmitry
