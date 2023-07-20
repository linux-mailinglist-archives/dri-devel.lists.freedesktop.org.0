Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E675A75B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8E310E565;
	Thu, 20 Jul 2023 07:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F7D10E565
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un8STEzpv7JxITnM54a5vIvcNe+NVRn8zsYzhb/e9sH0TZhLyW31wSHsdRCeFk58KUxx0LCg1afCNhD9jVBhtPYPhb+Q+z03xigamDSO9oeJrNW1i9iFZqQMhJnXKcetgNpK+31I40+Ox6GNj3oGsjA2zILvbanilX0CU9H/J0/A2CrG8t4+Jvg9Q1+NhI5O6Qc/ixGoxkNnPOfKV+6vjpfdP13MEP/Ro9NihahHhF8iRY9GVyxqEMyqbm6hirvElImqW8WKd6jZb8cGJFmtK+yA9khXgvnOj+aOb1iDTx5rM+MvI2ZnDSjo/vXEE4gYMnjhCQ+a//pXCFjU7I8iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9q4GKRXA++y43AmVaL36Uoy7t2H7ScDYcW3i/rdTq8=;
 b=JmQtcY1HccAO6v/z17UKx/14CJLy0hq6gARVJcxQJsd828x25FiZb6EIZ8yStD0PupBospIY4F0lmNRkf2qkYqmtEOssz0uMlKbI2hhJ+7lrmz2P49RCzFhsHVHw3fsQx5TNyFygtkYHwQ+O73U/JI8ZrvV+bDIDAleIqPmsB/bn9oRMGJdoYlF2bXZH9EtM+1atysBPPcpjLy6YPDyOThWpeqNzz3HxPt3gpCfgFdF51RMWxocXfEOydlvC3FjJyBLqPXoNKB40/x1iXOH2b1NV/jzbRa7Tp758wGe5gY6cg3M/LzGgQwJXCjszBH/gRTWJeH8YufmGxO31TwXSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9q4GKRXA++y43AmVaL36Uoy7t2H7ScDYcW3i/rdTq8=;
 b=iTWyiX2llWH6Yw7RqgUBHSFVgsbyQir+R7BOJPTFv3IoY+XbwUfTl0eInTD1avr29LnuTfaP8mrsttVRoReSi13oQ7Tdts/vizWWeuWA2by3CDJsMvhYyKL5u8gMlm3MrZhN97CGzNRSBcfnX/a2XY5xk7RL17PSSExZHNSc8Rw=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8307.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:09:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:09:54 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/9] drm/bridge: synopsys: dw-mipi-dsi: Add
 dw_mipi_dsi_get_bridge() helper
Thread-Topic: [PATCH v2 1/9] drm/bridge: synopsys: dw-mipi-dsi: Add
 dw_mipi_dsi_get_bridge() helper
Thread-Index: Adm62S8M2gb4MN2eQEG+NSKpq9vOfA==
Date: Thu, 20 Jul 2023 07:09:54 +0000
Message-ID: <20230720071430.259892-2-victor.liu@nxp.com>
References: <20230720071430.259892-1-victor.liu@nxp.com>
In-Reply-To: <20230720071430.259892-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8307:EE_
x-ms-office365-filtering-correlation-id: 15184736-c12d-4b57-35c7-08db88f05199
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z1I7xY1xTkIvq2HgUDfxeuIxvRAskDEWv0djrH9I4Umz8/rgLSY2Cvkh41G5lSyOTYF+lTCJ0RFnLDhASDWyHDSE9r+QmkxVkcATI5M4Y0ShwyF7UY+rWJHaJYbmJ2vj6Ol+Qv7MhuMp2WScLGUiGqoOWGqzK3anck9lWmRS7A2extyGGXsmdhENWH1GVc78bLuFGroWPJLgZ+zx068qSVabPCXrV3Vxh6aHMVSqsFAA0o7nscH2IBwdTHx41bUvlp39aCpdTBGoyVH2LR153AyZeXBSivrThyExCPM9/4nUcR/AYdaizDLXRpKoBv/zJXeg04enG75TE2qMZmcpPopf3s5AhDAYIGU2CgYpXMr1OT2jD9LfioD+Do/bFTBfkQ7/sAiAw95frKNd5DSV9tTkQrih5Q1Zud/FIBixEu31vhmJhS9fo/NiomjLZZo+iG+mXOuXXSrYYWz/oXdm9qWqCuz3os+e54vmUGa+BOwzwkKI8LkRneeV3Y8c8W+3bhUmMAe0SjaF8t+UB7TxxCIM/WKp9ArFqjsu/13/UIov3v4nkSUlK11aR4Gjwx12RYS28PkwINES/A3tNcTV4kUDl3dNC8I5+jsgvGImQ5JDeOZwQDtT70UoqkOg2nkh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(86362001)(478600001)(1076003)(38100700002)(186003)(41300700001)(26005)(71200400001)(110136005)(54906003)(8936002)(8676002)(7416002)(316002)(2906002)(122000001)(4326008)(36756003)(6512007)(66556008)(64756008)(66946007)(6486002)(66476007)(66446008)(6506007)(2616005)(52116002)(38350700002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bTC29ulO2U7pe8naLby4aAS+42t0iQwYRGqsoAyRCte5mKdOwinOk5hoWk?=
 =?iso-8859-1?Q?sUPeTdiLhaJRpuou0DRGB2a+b0rp3HxZVgoTuCNZaOZMRX8vcmkUoHb82S?=
 =?iso-8859-1?Q?WunrLvE98NDFvCtOSiSa38MA3VuQjg53T0227BC20Oqxv4ixLi04gMBVX3?=
 =?iso-8859-1?Q?vA7SdH+KkJyaWSU8V0rwYg3dMYEDV1fVwDSfwhPl+61FLMH76loFF5EpGv?=
 =?iso-8859-1?Q?waN1wvsrHBLizHAGqNoVuHd47BZd5KN4dH15/md5z1J/88vOLyHcAN4KXx?=
 =?iso-8859-1?Q?TfR+PWYJwwrI5teKssnWj2RhbW/PitpMVrniARymbzdb29XbiE3Pumbxts?=
 =?iso-8859-1?Q?FaaD7ZmBu1RFSscCOh5xCsOBC5bfjQRvwaG70Fqn24OvqlEm1CbsStVTKc?=
 =?iso-8859-1?Q?O/7r7eTbr/m8xGS77WRyqkttz5x04rovFfcgBxCo7STeFHEYd9pu6jfSFo?=
 =?iso-8859-1?Q?4FqymlIbsr/f7eIckqmh6fkzB2lFd7sSEFZLQ5198MYT7iWJLv1NdRjEJ3?=
 =?iso-8859-1?Q?ZVBPDLfl4RwtCjrT6LKIxyiG8VraciFAs4I/WRMNs3un5XCBdHXLFtZ3nE?=
 =?iso-8859-1?Q?v38OlAE3BV1I41n3kS8/24vk+SSCz0DnOp2CNBCSG9axkDrLewxtrHJEhb?=
 =?iso-8859-1?Q?xFEAoRsiUZToQoj2vE/LezZVcywTWWZku+CHGpiiHt9QGd76I5LmRUFjG9?=
 =?iso-8859-1?Q?7suigcfVTK2oX12av/jOn1rtXEZn+CPExz1g9iW2pt2jF+tGGLf7YjqXmo?=
 =?iso-8859-1?Q?LCqirjVmR1XVE4M9+Jpay0vihV/6HknHbADbepeUsD0d233SypwJp8PhXF?=
 =?iso-8859-1?Q?MRerYdrHv43vT/TjhZue/cSRleh7E6H1ltZOC/tRLHv9dR3xee05AkXs/+?=
 =?iso-8859-1?Q?rSYrERTrBQKoPnVanc9KI5f/hQDe293CMEUNmMXq2g4bAz22Q8jviNKDpJ?=
 =?iso-8859-1?Q?o6xJniaRi3FDk75Lxd5AkLUeKasjY4vATH1TnumU365MaEvbPwpjFe542x?=
 =?iso-8859-1?Q?QvQI4WHxClH4znH3OEspbTBQPi3BDkyLmaUVuRSGLqx35vcSQ7l9D1IR6n?=
 =?iso-8859-1?Q?+P2JXluqSJhVWf8PO4A8Jnes4DFM6j6dh/N21Oe6qwW8FCLv19+u2vdSn/?=
 =?iso-8859-1?Q?Dn/25Rf9COSC/BhwnSW4eBC+V9SXh+QstakGKhQgmZ1Esc0OsyPuSY0eBc?=
 =?iso-8859-1?Q?WJL28TSavGDmX23KVUwUuXG6eJb7YYG76jQL3FVba2yg++Pd6K+1CgKZ5e?=
 =?iso-8859-1?Q?A9CDWdJ8+HbQ+zWkkkYbQHRE9ziBqL9oTCOESytbYPnb/zRFQR6UPzGKP0?=
 =?iso-8859-1?Q?9I2oC/2EN2OZbZwfcgNR3SB0Xh3VQ1g6w/KzNsTFVZd5N5RTDBlw4Cu3Cc?=
 =?iso-8859-1?Q?GYm1WUHIVjtEDAjNtzwenchPgRDXf/O5ew0DYxGmsIE8obdZt8BYhzdm2H?=
 =?iso-8859-1?Q?enr86/WHht/6hgZ5pE7kWK3tHbSrphr2FGS7f3ICRAY7+xVR/GM9kALAzJ?=
 =?iso-8859-1?Q?VQdB6lkzin/OpybIoc93IcpAxnllKZ6qDQgXqIqndDcjWzf850Y+HI6zop?=
 =?iso-8859-1?Q?99U3cHjMsk+hFhkkVkeKpMdQuSVnXwfr0B3TSnH95mcfw3IiEPDGsWzcVc?=
 =?iso-8859-1?Q?e01EnEWMqJnKAbQOMpKaUxYCchI0h2q/ej?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15184736-c12d-4b57-35c7-08db88f05199
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:09:54.5117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kka767aDne/c9yyIqhsTjMwt7K3yUFApSWU6RR02zRacBSelxYq42Q5oTkeNkYB6VNU7825qNiZpeRnqG7pHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8307
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dw_mipi_dsi_get_bridge() helper so that it can be used by vendor
drivers which implement vendor specific extensions to Synopsys DW MIPI DSI.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 ++++++
 include/drm/bridge/dw_mipi_dsi.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index b2efecf7d160..57eae0fdd970 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1207,6 +1207,12 @@ void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, =
struct dw_mipi_dsi *slave)
 }
 EXPORT_SYMBOL_GPL(dw_mipi_dsi_set_slave);
=20
+struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi)
+{
+	return &dsi->bridge;
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi_get_bridge);
+
 /*
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_=
dsi.h
index 5286a53a1875..f54621b17a69 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -11,6 +11,7 @@
=20
 #include <linux/types.h>
=20
+#include <drm/drm_bridge.h>
 #include <drm/drm_modes.h>
=20
 struct drm_display_mode;
@@ -68,5 +69,6 @@ void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
 int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder)=
;
 void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
 void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *sl=
ave);
+struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi);
=20
 #endif /* __DW_MIPI_DSI__ */
--=20
2.37.1

