Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3937CA3EB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AA010E166;
	Mon, 16 Oct 2023 09:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84A10E166
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4GsT4zQI00dYebp7VTXgRi7LXJvrAlBr3us1OV5jQVcLOddwUs/x/LdZUpNgLIx+cJ3cUwCORj6pT0TtmF6mPHHXdx2CaVZk68zfq6lbvS8nYstkxSZS0B67/RGz2M1uVt1KeBEzq0Rsx4Km5QGN73PtxIvQhMfGMQ11E1cuzKh6/u7/W+NFM/w7gbDg5f8oMt8fz6y4xMjFbZizujrVCG2uXvhhg5o9vz6UEo18Wy2p3PqV7GNL2WUcOGQu5WuzhWGe4cUhQbnFMkDF6J+ADMbPXaYvtXf4ilQJ2SXMTOG8Df8bFjl2h7NEl145jn2TWjz/hrHTAJYOF0kJfZXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AiuZH2mjaW9K6W4Dw2KWhj3VcRLiA54LrPCJBy6skU=;
 b=YWZu3PpXE6xhvBVob0dR5HJOsJsPq+NnrRX2/24IqT6g/zo4yyce+/ws4MgIpkRcZovK8Njft6hUS0B/E1IYJbIJ5apDERruWFsCu8Rj7OCF/89lztyKKujlePgadvwlShnAFg+KxkkDHy4kosFgxcEawUoOlcMexHAPHA9L5rosWJiYHoVzdiem5j+kLM5f8g8hrXK49tImNCsdjwZYt6immoarhNs/t4Oh06PNc7xSni8o2Feo11T20jkAFwjjgUVlHa/EyKhILOtOfQIzD9LitGZpcANRR9FJGufz+iKRQugVAW9Nm/bfO7+40nnk0/6bPu9BVD8C4sTu4wbCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AiuZH2mjaW9K6W4Dw2KWhj3VcRLiA54LrPCJBy6skU=;
 b=iQGYzjNeUGM6MQHcHLNCfDuZRaK5SHw+lVSbHIAIacNsahGRmc6L+fSLEByxTUOgslCKMvjTfMY9tQcRCNJjMI2OMzTHPQrM53TUe38QekqhdKwp2TjMAaExCDwxxnnbnlkT4vRwkrUmy2h5U19Uerxza6lAFj3V8CxBmH7vxYM=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 09:19:30 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 09:19:30 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists .infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v10 1/7] drm: bridge: Cadence: Creat mhdp helper
 driver
Thread-Topic: [EXT] Re: [PATCH v10 1/7] drm: bridge: Cadence: Creat mhdp
 helper driver
Thread-Index: AQHZ/YCho5kXVsQF4U27TlHQArLRzLBHUtUAgAA6AfCABI5JAIAACm4Q
Date: Mon, 16 Oct 2023 09:19:29 +0000
Message-ID: <PAXPR04MB944895A03597446073AC0431F4D7A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1697162990.git.Sandor.yu@nxp.com>
 <8621221.DvuYhMxLoT@steina-w>
 <PAXPR04MB9448AC9D8090E1F5F7E39C0EF4D7A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <3258050.aeNJFYEL58@steina-w>
In-Reply-To: <3258050.aeNJFYEL58@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB9048:EE_
x-ms-office365-filtering-correlation-id: 0d20301f-a9b6-4955-026b-08dbce290078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ulR+88flesNlkWIZ8q1w4Uoiaay8GlwUaY0KzjDcK2CBv+COvlDCTbh+3rd6624+hlU7AMmpItzzYzSL4tXmjrKiqtNdNZt8OK2Uubov6RnpjcKBSj9lHgKgwduNO4Iyos2pveiwYWSk3qsStehEdmw4LiA+75cXhrbieFoWz+9G84WwiCnqlN6nFcNroqzgI57+T9p8N+F+79msG1HEOb/pwvZRfgZ42Y+g3rnXjHUF9l67WuJrwG31glCkdchaaZwGmTuqBpaBr5B/uwUmPSte1yJ22muMogo/qA65EMtSRpdZqVhqRHrz5FKxU/gOfkA3SzN7TOZjVuxpzK7ABg92tilKEQvtP+2e8pEOviMWiZhpariw4Y21ieNqVwlof9jx8AP9pTyMJNDdM323H0b728gmuSCqmJjFVJaWdf3udFz+fj44XDq2hOH3ZolMZSuL791UMIzvcrOoMKD3dOacBFIEvwjyh7FsT3bK26LNsJ2eI7yg4B6ptWLVvw8JmsavT1vY7AkOzVSsUl01trEoHgiul7EcVBhjpUS9g8IgOVeFKMsyML9s2FTZ8SKwVEgpPzYpZMUoUD7MH1UIjxtLQz3iO8V55oF3uFwXYkF6dIOS8Ug3fS4IB335wXOn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(966005)(71200400001)(45080400002)(76116006)(110136005)(66946007)(66556008)(54906003)(64756008)(66446008)(66476007)(26005)(66574015)(6506007)(7696005)(9686003)(316002)(4326008)(8676002)(8936002)(52536014)(30864003)(7416002)(2906002)(5660300002)(44832011)(41300700001)(33656002)(38070700005)(122000001)(86362001)(921005)(83380400001)(38100700002)(55016003)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pJ98lM6kA3H5fOGM0zoalXrB6czyhw5TJxHpono1UsUh4WMGs+ui6O8r6F?=
 =?iso-8859-1?Q?ecNGNNOc52r0s/S3sQbVUFPNvB+4TDm/E6yRC4yccTxq2tcZbgYY0YW7Tp?=
 =?iso-8859-1?Q?irF4u0IUFNjTOlNPvVMHMhmKb8tehF9My7WfUgaMTHkOZwjl+Ck+73qA7q?=
 =?iso-8859-1?Q?8A+fZwF63rsVodeU6naA5xiO/k4HoyejTb2kfhf++FkUAjspqZ1nC6Kwoz?=
 =?iso-8859-1?Q?H2BBs/JxlGLXhQT2/H7+XZkvhK7yLLuAoEdCTBNkmIXpvQHqB5CNOrCV/r?=
 =?iso-8859-1?Q?Rtaf6x8iLPeq3V3pSsozLJoOl7Q4DzkUiUO3opjI2B+D7mbUdCOTklQRFd?=
 =?iso-8859-1?Q?cEdhD4PinRi/tcZVLDe3nsV6xXvP2pDIn4U75YUYGStiQTgAC9GuPyzzgU?=
 =?iso-8859-1?Q?/cNes9mD+SoxeN/1JnrANkPXld0wX67BJ1ZbzpyE6dpfSFjXtyf1jkE3u4?=
 =?iso-8859-1?Q?4/BY9luaiyuX00ml4r9Yo3MnlrMeTIfHEYPSngiVaMfh446ac47wRLr7qz?=
 =?iso-8859-1?Q?XBQUhEbXaWGSamliOdho08qSc4uUM0bAe36UEbxl/VDlbM5pdvPWYCWC4Y?=
 =?iso-8859-1?Q?r52qIY1SVHyLmJctSOBm8dIBCPr7BhvVhCUmspI7AHOx0FqTK4FBsaKo+h?=
 =?iso-8859-1?Q?cvT0Fj2Zb6V/9mJfX43xvv8HHIAT33gg72I2DNbV1ExlK83OBHVTSbawYK?=
 =?iso-8859-1?Q?XWRxF3AApNmpwC4wqmWHDS/hnMH7nlXro5WOo7FFpRcL4cyFFscEJylTvu?=
 =?iso-8859-1?Q?MsyOdaeOJOh7aHDib2n47tGE/XRGRfyOdzYJsd1E4AvMqiKRcJyhbQyAxY?=
 =?iso-8859-1?Q?UrX5R6U1dt69dEK4e/dIypqch88GpGu98RARRoP0KfqDQlVpaqgV9r8Odv?=
 =?iso-8859-1?Q?dnhdocjIavvbD8CgCJmyhahxqMK8ezFWitj1XGfPbQNwrB0glr2eFMZmih?=
 =?iso-8859-1?Q?HoC2yr4YcoN/uB8EwRBWs6x0+dN6wYOavMomSk3kSukIUOww9Q62S8BLxG?=
 =?iso-8859-1?Q?VsCwVqTUzG9fJ783aMN3RNOT2Q8X+XD9DyxXZFYbpAiCp6lokI8IPIuiZ8?=
 =?iso-8859-1?Q?RcuWB8Y99CGOxTNftpmuB3odkzMa9v/fsXkxivdQoyRGmYD0u3o3yflbyl?=
 =?iso-8859-1?Q?LJLTwyjOdWKtxKEqLzBtlyGZpnP+xtrOw0bDT1fzrVxkA4eyHoR5IFreHR?=
 =?iso-8859-1?Q?GoCCAtsRq250F0MCqphqeYhQt7fbv7FfXsFyU9bkCCwB/YOn3UFFSnZMBK?=
 =?iso-8859-1?Q?yShYo6tFd3DBX21sEIVdWeOELPpxjXgeRXToBlg1ND8vdHT9IS7M/WKlmK?=
 =?iso-8859-1?Q?VITooVTSKUpDqZSvBLYSpkjVe9az2kg9KPQvaTcGROma88nkM2JMQe4Bv1?=
 =?iso-8859-1?Q?+QsVYHnIl78t3KDkLQmEwY7CeFEECoamsRJat5zKVomfkomLI2BUf1/6ZP?=
 =?iso-8859-1?Q?aXFY0jMPbBjwmBBUJElk8f7YlbGm4Fw5CRqiG1Xp79n7xuYNghztAEGEz3?=
 =?iso-8859-1?Q?wNfOZSWpMlSVJUcPM4jTNVUWZ+FFRygcxWC7fXIcc7EyWxhtrn9P04yCig?=
 =?iso-8859-1?Q?TANMn0b/+tBzRHtCoo2erbGwnVCwcSxl2LfIJrbFTfi4WNEboJ5TMRBP6s?=
 =?iso-8859-1?Q?Zr1pMEwNMOEnk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d20301f-a9b6-4955-026b-08dbce290078
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:19:29.9812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxxDgkQIo1Llkg4oOuY75kNRjHbTdTCOjcIbAvT3O434ZK6glR1qV9B8szAEmhMxWSIMu2JV6hT+jvDSwmzj3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048
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
Cc: Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

>
> Hi Sandor,
>
> Am Montag, 16. Oktober 2023, 05:05:54 CEST schrieb Sandor Yu:
> > Hi Alexander,
> >
> > Thanks your comments,
> >
> > > Hi Sandor,
> > >
> > > thanks for the updated series.
> > >
> > > Am Freitag, 13. Oktober 2023, 05:24:20 CEST schrieb Sandor Yu:
> > > > MHDP8546 mailbox access functions will be share to other mhdp
> > > > driver and Cadence HDP-TX HDMI/DP PHY drivers.
> > > > Create a new mhdp helper driver and move all those functions into.
> > > >
> > > > cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
> > > > because it use the DPTX command ID DPTX_WRITE_REGISTER.
> > > >
> > > > New cdns_mhdp_reg_write() is created with the general command ID
> > > > GENERAL_REGISTER_WRITE.
> > > >
> > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > ---
> > > >
> > > > v9->v10:
> > > >  *use mhdp helper driver to replace macro functions,  move maibox
> > > >
> > > > access function and mhdp hdmi/dp common API  functions into the
> > > > driver.
> > > >
> > > >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4
> > > >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> > > >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 306
> ++++++++++++++
> > > >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 383
> +++---------------
> > > >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
> > > >  include/drm/bridge/cdns-mhdp-helper.h         |  96 +++++
> > > >  6 files changed, 473 insertions(+), 361 deletions(-)  create mode
> > > >
> > > > 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > > >
> > > >  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> > > > ec35215a20034..0b7b4626a7af0
> > > > 100644
> > > > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > > @@ -20,6 +20,9 @@ config DRM_CDNS_DSI_J721E
> > > >
> > > >         the routing of the DSS DPI signal to the Cadence DSI.
> > > >
> > > >  endif
> > > >
> > > > +config CDNS_MHDP_HELPER
> > > > +     tristate
> > > > +
> > > >
> > > >  config DRM_CDNS_MHDP8546
> > > >
> > > >       tristate "Cadence DPI/DP bridge"
> > > >       select DRM_DISPLAY_DP_HELPER
> > > >
> > > > @@ -27,6 +30,7 @@ config DRM_CDNS_MHDP8546
> > > >
> > > >       select DRM_DISPLAY_HELPER
> > > >       select DRM_KMS_HELPER
> > > >       select DRM_PANEL_BRIDGE
> > > >
> > > > +     select CDNS_MHDP_HELPER
> > > >
> > > >       depends on OF
> > > >       help
> > > >
> > > >         Support Cadence DPI to DP bridge. This is an internal diff
> > > >
> > > > --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > > > b/drivers/gpu/drm/bridge/cadence/Makefile index
> > > > c95fd5b81d137..087dc074820d7 100644
> > > > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > > > @@ -2,6 +2,7 @@
> > > >
> > > >  obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-dsi.o  cdns-dsi-y :=3D
> > > >
> > > > cdns-dsi-core.o
> > > >
> > > >  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D cdns-dsi-j721e.o
> > > >
> > > > +obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
> > > >
> > > >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> > >
> > > cdns-mhdp8546-y
> > >
> > > > :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> > > > :
> > > >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > > >
> > > > cdns-mhdp8546-j721e.o diff --git
> > > > a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > > > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c new file mode
> > > > 100644 index 0000000000000..2e3eee40494f0
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > > > @@ -0,0 +1,306 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > > > + *
> > > > + */
> > > > +#include <drm/bridge/cdns-mhdp-helper.h> #include
> > > > +<linux/dev_printk.h> #include <linux/module.h>
> > > > +
> > > > +/* Mailbox helper functions */
> > > > +int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base) {
> > > > +     int ret, empty;
> > > > +
> > > > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
> > > > +
> > > > +     ret =3D readx_poll_timeout(readl, base->regs +
> > >
> > > CDNS_MAILBOX_EMPTY,
> > >
> > > > +                              empty, !empty,
> MAILBOX_RETRY_US,
> > > > +                              MAILBOX_TIMEOUT_US);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff; }
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_read);
> > >
> > > No need to export this. You can make this function actually static.
> >
> > OK, I will change it to static in the next version.
> >
> > > > +
> > > > +int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val) {
> > > > +     int ret, full;
> > > > +
> > > > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
> > > > +
> > > > +     ret =3D readx_poll_timeout(readl, base->regs +
> CDNS_MAILBOX_FULL,
> > > > +                              full, !full, MAILBOX_RETRY_US,
> > > > +                              MAILBOX_TIMEOUT_US);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     writel(val, base->regs + CDNS_MAILBOX_TX_DATA);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_write);
> > >
> > > No need to export that one as well. You can make this function
> > > actually static as these two functions are only called from the helpe=
r itself.
> >
> > mhdp8546 driver need this function.
>
> True, cdns_mhdp_set_firmware_active() needs this. But this call seems a b=
it
> fishy. Couldn't this be written as follow?
>
> ---8<--
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> b/drivers/ gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 0582a5e42763f..c0364d05406cd 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -78,22 +78,16 @@ static void cdns_mhdp_bridge_hpd_disable(struct
> drm_bridge
> *bridge)
>  static
>  int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool
> enable)  {
> -       u8 msg[5];
> +       u8 msg[1];
>         int ret, i;
>
> -       msg[0] =3D GENERAL_MAIN_CONTROL;
> -       msg[1] =3D MB_MODULE_ID_GENERAL;
> -       msg[2] =3D 0;
> -       msg[3] =3D 1;
> -       msg[4] =3D enable ? FW_ACTIVE : FW_STANDBY;
> +       msg[0] =3D enable ? FW_ACTIVE : FW_STANDBY;
>
>         mutex_lock(&mhdp->mbox_mutex);
>
> -       for (i =3D 0; i < sizeof(msg); i++) {
> -               ret =3D cdns_mhdp_mailbox_write(&mhdp->base, msg[i]);
> -               if (ret)
> -                       goto out;
> -       }
> +       ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> +                                    GENERAL_MAIN_CONTROL,
> +                                    sizeof(msg), msg);
>
>         /* read the firmware state */
>         ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, msg,
> sizeof(msg));
> ---8<--
>
> AFAICS cdns_mhdp_mailbox_send() is only a sequence of writes, writing 4
> byte header and 1 byte data in this case.
>

Yes, cdns_mhdp_mailbox_send() could be use to replace cdns_mhdp_mailbox_wri=
te() in the function.
OK, I will add the change into this patch in the next version, thanks.

B.R
Sandor

> Best regards,
> Alexander
>
> >
> > > > +
> > > > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > > > +                               u8 module_id, u8 opcode,
> > > > +                               u16 req_size) {
> > > > +     u32 mbox_size, i;
> > > > +     u8 header[4];
> > > > +     int ret;
> > > > +
> > > > +     /* read the header of the message */
> > > > +     for (i =3D 0; i < sizeof(header); i++) {
> > > > +             ret =3D cdns_mhdp_mailbox_read(base);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +
> > > > +             header[i] =3D ret;
> > > > +     }
> > > > +
> > > > +     mbox_size =3D get_unaligned_be16(header + 2);
> > > > +
> > > > +     if (opcode !=3D header[0] || module_id !=3D header[1] ||
> > > > +         req_size !=3D mbox_size) {
> > > > +             /*
> > > > +              * If the message in mailbox is not what we want, we
> > > > + need
> > >
> > > to
> > >
> > > > +              * clear the mailbox by reading its contents.
> > > > +              */
> > > > +             for (i =3D 0; i < mbox_size; i++)
> > > > +                     if (cdns_mhdp_mailbox_read(base) < 0)
> > > > +                             break;
> > > > +
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_header);
> > > > +
> > > > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > > > +                             u8 *buff, u16 buff_size) {
> > > > +     u32 i;
> > > > +     int ret;
> > > > +
> > > > +     for (i =3D 0; i < buff_size; i++) {
> > > > +             ret =3D cdns_mhdp_mailbox_read(base);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +
> > > > +             buff[i] =3D ret;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_data);
> > > > +
> > > > +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8
> > >
> > > module_id,
> > >
> > > > +                        u8 opcode, u16 size, u8 *message) {
> > > > +     u8 header[4];
> > > > +     int ret, i;
> > > > +
> > > > +     header[0] =3D opcode;
> > > > +     header[1] =3D module_id;
> > > > +     put_unaligned_be16(size, header + 2);
> > > > +
> > > > +     for (i =3D 0; i < sizeof(header); i++) {
> > > > +             ret =3D cdns_mhdp_mailbox_write(base, header[i]);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     for (i =3D 0; i < size; i++) {
> > > > +             ret =3D cdns_mhdp_mailbox_write(base, message[i]);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
> > > > +
> > > > +/* General helper functions */
> > > > +int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32
> > > > +*value) {
> > > > +     u8 msg[4], resp[8];
> > > > +     int ret;
> > > > +
> > > > +     put_unaligned_be32(addr, msg);
> > > > +
> > > > +     mutex_lock(base->mbox_mutex);
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send(base,
> MB_MODULE_ID_GENERAL,
> > > > +                                  GENERAL_REGISTER_READ,
> > > > +                                  sizeof(msg), msg);
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> > >
> > > MB_MODULE_ID_GENERAL,
> > >
> > > > +
> > >
> > > GENERAL_REGISTER_READ,
> > >
> > > > +                                         sizeof(resp));
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, resp, sizeof(resp))=
;
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     /* Returned address value should be the same as requested */
> > > > +     if (memcmp(msg, resp, sizeof(msg))) {
> > > > +             ret =3D -EINVAL;
> > > > +             goto out;
> > > > +     }
> > > > +
> > > > +     *value =3D get_unaligned_be32(resp + 4);
> > > > +
> > > > +out:
> > > > +     mutex_unlock(base->mbox_mutex);
> > > > +     if (ret) {
> > > > +             dev_err(base->dev, "Failed to read register\n");
> > > > +             *value =3D 0;
> > > > +     }
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
> > > > +
> > > > +int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr,
> > > > +u32
> > > > +val) {
> > > > +     u8 msg[8];
> > > > +     int ret;
> > > > +
> > > > +     put_unaligned_be32(addr, msg);
> > > > +     put_unaligned_be32(val, msg + 4);
> > > > +
> > > > +     mutex_lock(base->mbox_mutex);
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send(base,
> MB_MODULE_ID_GENERAL,
> > > > +
> GENERAL_REGISTER_WRITE,
> > > > +                                  sizeof(msg), msg);
> > > > +
> > > > +     mutex_unlock(base->mbox_mutex);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
> > > > +
> > > > +/* DPTX helper functions */
> > > > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> > >
> > > u32
> > >
> > > > +val) {
> > > > +     u8 msg[6];
> > > > +     int ret;
> > > > +
> > > > +     put_unaligned_be16(addr, msg);
> > > > +     put_unaligned_be32(val, msg + 2);
> > > > +
> > > > +     mutex_lock(base->mbox_mutex);
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > > +                                  DPTX_WRITE_REGISTER,
> > >
> > > sizeof(msg),
> > > msg);
> > >
> > > > +
> > > > +     mutex_unlock(base->mbox_mutex);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
> > > > +
> > > > +int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16
> addr,
> > > > +                            u8 start_bit, u8 bits_no, u32 val) {
> > > > +     u8 field[8];
> > > > +     int ret;
> > > > +
> > > > +     put_unaligned_be16(addr, field);
> > > > +     field[2] =3D start_bit;
> > > > +     field[3] =3D bits_no;
> > > > +     put_unaligned_be32(val, field + 4);
> > > > +
> > > > +     mutex_lock(base->mbox_mutex);
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > > +                                  DPTX_WRITE_FIELD,
> > >
> > > sizeof(field),
> > > field);
> > >
> > > > +
> > > > +     mutex_unlock(base->mbox_mutex);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
> > > > +
> > > > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > > > +                     u32 addr, u8 *data, u16 len) {
> > > > +     u8 msg[5], reg[5];
> > > > +     int ret;
> > > > +
> > > > +     put_unaligned_be16(len, msg);
> > > > +     put_unaligned_be24(addr, msg + 2);
> > > > +
> > > > +     mutex_lock(base->mbox_mutex);
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > > +                                  DPTX_READ_DPCD,
> sizeof(msg),
> > >
> > > msg);
> > >
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> > >
> > > MB_MODULE_ID_DP_TX,
> > >
> > > > +                                         DPTX_READ_DPCD,
> > > > +                                         sizeof(reg) + len);
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, data, len);
> > > > +
> > > > +out:
> > > > +     mutex_unlock(base->mbox_mutex);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
> > > > +
> > > > +int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr,
> > > > +u8
> > > > +value) {
> > > > +     u8 msg[6], reg[5];
> > > > +     int ret;
> > > > +
> > > > +     put_unaligned_be16(1, msg);
> > > > +     put_unaligned_be24(addr, msg + 2);
> > > > +     msg[5] =3D value;
> > > > +
> > > > +     mutex_lock(base->mbox_mutex);
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > > > +                                  DPTX_WRITE_DPCD,
> > >
> > > sizeof(msg),
> > > msg);
> > >
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> > >
> > > MB_MODULE_ID_DP_TX,
> > >
> > > > +
> DPTX_WRITE_DPCD,
> > >
> > > sizeof(reg));
> > >
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> > > > +     if (ret)
> > > > +             goto out;
> > > > +
> > > > +     if (addr !=3D get_unaligned_be24(reg + 2))
> > > > +             ret =3D -EINVAL;
> > > > +
> > > > +out:
> > > > +     mutex_unlock(base->mbox_mutex);
> > > > +
> > > > +     if (ret)
> > > > +             dev_err(base->dev, "dpcd write failed: %d\n", ret);
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
> > > > +
> > > > +MODULE_DESCRIPTION("Cadence MHDP Helper driver");
> > > > +MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
> > > > +MODULE_LICENSE("GPL");
> > > > [...]
> > > > diff --git a/include/drm/bridge/cdns-mhdp-helper.h
> > > > b/include/drm/bridge/cdns-mhdp-helper.h new file mode 100644 index
> > > > 0000000000000..b89db9e842266
> > > > --- /dev/null
> > > > +++ b/include/drm/bridge/cdns-mhdp-helper.h
> > > > @@ -0,0 +1,96 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > > > + */
> > > > +#ifndef __CDNS_MHDP_HELPER_H__
> > > > +#define __CDNS_MHDP_HELPER_H__
> > > > +
> > > > +#include <asm/unaligned.h>
> > > > +#include <linux/iopoll.h>
> > > > +
> > > > +/* mailbox regs offset */
> > > > +#define CDNS_MAILBOX_FULL                    0x00008
> > > > +#define CDNS_MAILBOX_EMPTY                   0x0000c
> > > > +#define CDNS_MAILBOX_TX_DATA                 0x00010
> > > > +#define CDNS_MAILBOX_RX_DATA                 0x00014
> > > > +
> > > > +#define MAILBOX_RETRY_US                     1000
> > > > +#define MAILBOX_TIMEOUT_US                   2000000
> > > > +
> > > > +/* Module ID Code */
> > > > +#define MB_MODULE_ID_DP_TX                   0x01
> > > > +#define MB_MODULE_ID_HDMI_TX                 0x03
> > > > +#define MB_MODULE_ID_HDCP_TX                 0x07
> > > > +#define MB_MODULE_ID_HDCP_RX                 0x08
> > > > +#define MB_MODULE_ID_HDCP_GENERAL            0x09
> > > > +#define MB_MODULE_ID_GENERAL                 0x0A
> > > > +
> > > > +/* General Commands */
> > > > +#define GENERAL_MAIN_CONTROL                 0x01
> > > > +#define GENERAL_TEST_ECHO                    0x02
> > > > +#define GENERAL_BUS_SETTINGS                 0x03
> > > > +#define GENERAL_TEST_ACCESS                  0x04
> > > > +#define GENERAL_REGISTER_WRITE                       0x05
> > > > +#define GENERAL_WRITE_FIELD                  0x06
> > > > +#define GENERAL_REGISTER_READ                        0x07
> > > > +#define GENERAL_GET_HPD_STATE                        0x11
> > > > +
> > > > +/* DPTX Commands */
> > > > +#define DPTX_SET_POWER_MNG                   0x00
> > > > +#define DPTX_SET_HOST_CAPABILITIES           0x01
> > > > +#define DPTX_GET_EDID                                0x02
> > > > +#define DPTX_READ_DPCD                               0x03
> > > > +#define DPTX_WRITE_DPCD                              0x04
> > > > +#define DPTX_ENABLE_EVENT                    0x05
> > > > +#define DPTX_WRITE_REGISTER                  0x06
> > > > +#define DPTX_READ_REGISTER                   0x07
> > > > +#define DPTX_WRITE_FIELD                     0x08
> > > > +#define DPTX_TRAINING_CONTROL                        0x09
> > > > +#define DPTX_READ_EVENT                              0x0a
> > > > +#define DPTX_READ_LINK_STAT                  0x0b
> > > > +#define DPTX_SET_VIDEO                               0x0c
> > > > +#define DPTX_SET_AUDIO                               0x0d
> > > > +#define DPTX_GET_LAST_AUX_STAUS                      0x0e
> > > > +#define DPTX_SET_LINK_BREAK_POINT            0x0f
> > > > +#define DPTX_FORCE_LANES                     0x10
> > > > +#define DPTX_HPD_STATE                               0x11
> > > > +#define DPTX_ADJUST_LT                               0x12
> > > > +
> > > > +/* HDMI TX Commands */
> > > > +#define HDMI_TX_READ                         0x00
> > > > +#define HDMI_TX_WRITE                                0x01
> > > > +#define HDMI_TX_UPDATE_READ                  0x02
> > > > +#define HDMI_TX_EDID                         0x03
> > > > +#define HDMI_TX_EVENTS                               0x04
> > > > +#define HDMI_TX_HPD_STATUS                   0x05
> > > > +
> > > > +struct cdns_mhdp_base {
> > > > +     struct device *dev;
> > > > +     void __iomem *regs;
> > > > +     /* protect mailbox communications with the firmware */
> > > > +     struct mutex *mbox_mutex;
> > > > +};
> > > > +
> > > > +/* Mailbox helper functions */
> > > > +int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base); int
> > > > +cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val);
> > >
> > > You can remove these two declarations.
> >
> > cdns_mhdp_mailbox_read will be removed. Thanks!
> >
> > B.R
> > Sandor
> >
> > > Best regards,
> > > Alexander
> > >
> > > Best regards,
> > >
> > > > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > > > +                               u8 module_id, u8 opcode, u16
> > >
> > > req_size);
> > >
> > > > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > > > +                             u8 *buff, u16 buff_size); int
> > > > +cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8
> module_id,
> > > > +                        u8 opcode, u16 size, u8 *message);
> > > > +
> > > > +/* General commands helper functions */ int
> > > > +cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32
> > > > +*value); int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32
> > > > +addr, u32 val);
> > > > +
> > > > +/* DPTX commands helper functions */ int
> > > > +cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> > >
> > > u32
> > >
> > > > +val); int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base,
> > > > +u16 addr, +
> > > >
> > > >       u8 start_bit, u8 bits_no, u32 val);
> > > >
> > > > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > > > +                     u32 addr, u8 *data, u16 len); int
> > > > +cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > > > +value);
> > > > +
> > > > +#endif /* __CDNS_MHDP_HELPER_H__ */
> > >
> > > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germ=
any
> > > Amtsgericht M=FCnchen, HRB 105018
> > > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schnei=
der
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -group.com%2F&data=3D05%7C01%7Csandor.yu%40nxp.com%7C2cd8764806d
> c476182da08dbce22347e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C638330418532038510%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%
> 7C%7C%7C&sdata=3D0d9o40bvznT6Ef1Ugg6m%2F6Ca8odJtl80js6X17rUWzA%3
> D&reserved=3D0
>

