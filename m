Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A875A760
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784D610E56D;
	Thu, 20 Jul 2023 07:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777BC10E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjW1Gnn6/bQSemsX5gitmzAQWSwAtRAVqNFbPVLMDJHFt28se56bPYwl5+yYlc6O+cX9RbYMTIavGuU8+nwA1bj/CcGAw+luMviDm6QzZyOphpL4UXqALCwan31un0xESWrlISbvIm4LMtyIOUg++gN+lGXPVuJQCpsGmit0/bLule27xPP8BFXitJvzR5SYnoHh6GjSDmTh8WglkAPV9hsjkF1IHTJePqQdY/Wr430lsWSPRzShOCZgWj562BTY1IBIruR0tf45rBVcNSG1TKM80hpQQA82evBL4b4UhSM4HxHrVDY3bvgH7DN1iSTzKYvKehpoGCLlFcYD9Drk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhSkJQntSWcBdOAGaZsa21wewZ+p1zIS6OBZzYYOB0A=;
 b=bUUAemaBCdaxkzhYm56TdUWeeGzDvbMjfgMKwfVv6ZKTF6WkBGTAmlOXjAwM0W7du3AGaJECHNbBuzVHPFnGqHrJE7m7pas09313dkHxNhpkTPH/4veiJy8ZQeHo3WVAFHgT4VLkV2zD9qA4pgA+XNxXrlHfELvwPk3++CdfkFf+jD7SwMqZbvfk0yCIDESAafTabFhpCRGQU4/7t7VDmMgboIpmr0n/+PH3Fiw/CSW9kF3lkoM3qU7VhQ5ZPf0ZSMc2sO/Mm/pfqE0r2dt+0lPMnktZRSdSEpkHGObFTAeoqXFvQoBKVy4+sk5Fnh1+gLZrmApLsQnjfrF+J9kCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhSkJQntSWcBdOAGaZsa21wewZ+p1zIS6OBZzYYOB0A=;
 b=cQFz6qxh7B5iAUnVqqnDB45tEjRV5R0NbAQyyruQmH6C2b5z07KlyQOOUMD77g1mOPI3ZImvcA5otRYsqjCQl6fZw7nnIn0/g2AHnp6i6AsFUmDnlQOMHOpR4jXF74iue/oKTZi5nEFH/X221eZFLXNdaE1iO3D5OZjG+Qf6IGc=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:10:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:26 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane
 byte clock cycles for HSA and HBP
Thread-Topic: [PATCH v2 6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum
 lane byte clock cycles for HSA and HBP
Thread-Index: Adm62UHicPoHs/xOAUWcntvTIy5cWw==
Date: Thu, 20 Jul 2023 07:10:26 +0000
Message-ID: <20230720071430.259892-7-victor.liu@nxp.com>
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
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8415:EE_
x-ms-office365-filtering-correlation-id: a446ecaa-7d24-4f1e-6510-08db88f06468
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6+y8DSfmjnOhEJAMvH5/CQCYPIexSA12mz/Q5OzrMGWBixFboH9426KMcDcbW8ZxQRDH2dgwJvObp4ap2XOXsgR22gF9S4BW6gJrkN5gHpTQsaHe+8w58iZ4bs6XSGRzS5CnPBn2WPvL6yzXq7GAfOueM/QsNOVKbyj6fT/2NmsKyX2JK9BnqfMWr5BcPzzgqKF+W2h9TRkF7rRzQaHlzSKcDUlBiFKcJrYuPxRWA2qYpXCZti5M+qciq/Jn/cVyHpPW5ktcT+n3jClfymMYxboLNybcqhRAnuOb8bA198Eh6ljPNqsQKmBQkBPcQE06SoTHBQHwsdaKZoaCNLHpj3QwWVCYGGaCFOcbQvIfDhAL7nC+wNJ6c/Dd0nanjim6vTQE179es622pPZNTK2F/ww9Bx6Z5g91SorwIptKgkaECVZYqmH/LtC8axICXMJz9wgBTRC7R+sugbfSxDbMYoICV4l6U4MvcKEdBf5b+rj9oFE3AAejkzR1gw6fpILS7GaPN3Hx22TJDEri7jSyAYgby/WDmJ4QXf9IC4v2HC6WTVZOvodof2o+TxdZmiD6l96pPuiaM5sSBQrt80KEvVWB+0UDMWMrppETvFfSAmXoU2leY/058N2vYlz5QplM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(478600001)(1076003)(26005)(6486002)(52116002)(2906002)(6512007)(71200400001)(4326008)(5660300002)(66556008)(316002)(66946007)(66476007)(83380400001)(66446008)(54906003)(110136005)(64756008)(38350700002)(36756003)(38100700002)(7416002)(8936002)(8676002)(86362001)(186003)(2616005)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bI2uAWd/1sX9fPuhsQhyiOOZEBo3BtkX8kO8xWoyRWM9x9X795E48Hv9Mh?=
 =?iso-8859-1?Q?bTo6PMir0NPJCLJdbZwfK9lH6X+E2BI/AoLNgfRgyxjEDo9vfv7OjUaLvM?=
 =?iso-8859-1?Q?UIy/TrtINiH3K/P2p9oNKcoCPdaXFgRhdRXcAqfvTCgvFqHHS2hbas0agX?=
 =?iso-8859-1?Q?Q08bTvxKBvL/SYbM8DINIF/V1jvVu3Iy6bJgqwyBXO/6kxZnl72iGu9+sR?=
 =?iso-8859-1?Q?HL4JOmwVRzr7DI27fgTMYWI9mHX3RX0vjfi6D9wRN38TOUjo47d+8XGxSJ?=
 =?iso-8859-1?Q?jITth+SNy0Lrj43sRt1Hdi7wsLY+yTY5zIBw1r7iJiZtGOcrzGJFJRwKxG?=
 =?iso-8859-1?Q?gI6jl2gqnnojapC9ZlYpLLNZbXF6V7EpdjnimPcXQnwPZkk/K3oRnrh0nV?=
 =?iso-8859-1?Q?Suj1Xq4TvM9A8CFy/2mHWERknQY3P2YT31mYmMQtz0wpKSl+ykcPQmeXh/?=
 =?iso-8859-1?Q?kHO7OWd5ogDxTGvB13hKVbWVRwPH3ivnKLvDXjqG8N+6LC2sGy/wT1WVwN?=
 =?iso-8859-1?Q?wjJFd2rSvbFjP9Ds6jHhmXuh6USEMtiRoDZ0czAgOBmGSXPuFvDvK0ymax?=
 =?iso-8859-1?Q?RaYG8IY2BVk0+fJGtLOtSB5K0sGNV63xO/4TK/M0c4eiq9WONH7XC/9nYC?=
 =?iso-8859-1?Q?R91WMSGPFAF0OK06gwPdvQQsoA8YJagXhwdqBBS3hUgo5BLwl1U4L4+F5h?=
 =?iso-8859-1?Q?jm2uDj6Kr5iQHFzqRKbiW6AoG8JLRBOwu6J0CePtc8YMB027g7c692xeON?=
 =?iso-8859-1?Q?Xawc6PChY1s9UtvetUYJ5ZiLha9QiZn963Jg2h1sWtDxDnDTA9Slkr5pKA?=
 =?iso-8859-1?Q?5j5K5/ygst9tesMzeBnYbU/TPsl6slBxJnfJRublGMafb6QcPR+jJkL3FL?=
 =?iso-8859-1?Q?6bWiKezEvvDEo+6T/QPHElcf3IeO4oFsRbKBhkEM2pCnaesll145Lxd8/o?=
 =?iso-8859-1?Q?Q8E5uvNe6SjO9i3xu/LsB4MzciU1GhEn1HipBDEqvJJjMr2gIrOWRR85TL?=
 =?iso-8859-1?Q?nHZFLc1AFiTW61tVK4hTVKcQT2W81fLNp5W45guCHjN4pyW0e9Pe25Z0b5?=
 =?iso-8859-1?Q?67PRY7q2/KttGSIl0SWKgz9X4kPMIn7ZTgbilaEIw+zvhOSakbTp9fbZLU?=
 =?iso-8859-1?Q?bkTS2et9l9i8HzwT0OCxsuyolNCdvIFVFAQX3I50LxbjAU7uuz/swwztHu?=
 =?iso-8859-1?Q?X8MzdmeFByiB2w3d6K2PPhg6JCBMOZfw3OL8ki2RmdWTCsWUTf0TUUKXJN?=
 =?iso-8859-1?Q?/kxvpFbsiXAKytJUFoxtDeelaE14iq3Gf2Ti6brfhC7ZJNQx1fKXNHMNRd?=
 =?iso-8859-1?Q?FJ1YtLK7e44Yrk3M7tPYT4I1WFhFgLyEPJdlaNdMucy6PgUbKstGwN53l+?=
 =?iso-8859-1?Q?iDNKOnXPoDKUIWxbHp7JiIGQ1dsRrIHhsyA1O9guvzlKZef0E8qlCFgpHk?=
 =?iso-8859-1?Q?R/81+ScbDd+zFjqgsxRDEC6Vo6f2Q0B3xXGJEJG3n0eTWTt9JY/WU1E2hS?=
 =?iso-8859-1?Q?kxw+hyGlC8cWgz7eQ/1xVwpkL8Xx6GSgFLKRrx1RBz+roeuIZ7XiyyRMLV?=
 =?iso-8859-1?Q?UlL7hVW301JojU19wP95xlbpZ/GmltXZP5l99xHjGenvD0XwKC00ZwWmhd?=
 =?iso-8859-1?Q?CGAewIRMdM7cnnmMof9q0390jarWTldJDi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a446ecaa-7d24-4f1e-6510-08db88f06468
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:26.0564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA6gQbTrrmGXPKqPVyPpkJTeJmduevHkMcTpiSI2Q+tJO7yIexM7MaNTtSNRf9LEaNH9znO1Vgq6DGvX+DAQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
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

According to Synopsys support channel, each region of HSA, HBP and HFP must
have minimum number of 10 bytes where constant 4 bytes are for HSS or HSE
and 6 bytes are for blanking packet(header + CRC).  Hence, the below table
comes in.

+------------+----------+-------+
| data lanes | min lbcc | bytes |
+------------+----------+-------+
|     1      |    10    |  1*10 |
+------------+----------+-------+
|     2      |    5     |  2*5  |
+------------+----------+-------+
|     3      |    4     |  3*4  |
+------------+----------+-------+
|     4      |    3     |  4*3  |
+------------+----------+-------+

Implement the minimum lbcc numbers to make sure that the values programmed
into DSI_VID_HSA_TIME and DSI_VID_HBP_TIME registers meet the minimum
number requirement.  For DSI_VID_HLINE_TIME register, it seems that the
value programmed should be based on mode->htotal as-is, instead of sum up
HSA, HBP, HFP and HDISPLAY.

This helps the case where Raydium RM67191 DSI panel is connected, since
it's video timing for hsync length is only 2 pixels and without this patch
the programmed value for DSI_VID_HSA_TIME is only 2 with 4 data lanes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index 332388fd86da..536306ccea5a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -757,12 +757,19 @@ static void dw_mipi_dsi_command_mode_config(struct dw=
_mipi_dsi *dsi)
 	dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
 }
=20
+static const u32 minimum_lbccs[] =3D {10, 5, 4, 3};
+
+static inline u32 dw_mipi_dsi_get_minimum_lbcc(struct dw_mipi_dsi *dsi)
+{
+	return minimum_lbccs[dsi->lanes - 1];
+}
+
 /* Get lane byte clock cycles. */
 static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 					   const struct drm_display_mode *mode,
 					   u32 hcomponent)
 {
-	u32 frac, lbcc;
+	u32 frac, lbcc, minimum_lbcc;
 	int bpp;
=20
 	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
@@ -778,6 +785,11 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_m=
ipi_dsi *dsi,
 	if (frac)
 		lbcc++;
=20
+	minimum_lbcc =3D dw_mipi_dsi_get_minimum_lbcc(dsi);
+
+	if (lbcc < minimum_lbcc)
+		lbcc =3D minimum_lbcc;
+
 	return lbcc;
 }
=20
--=20
2.37.1

