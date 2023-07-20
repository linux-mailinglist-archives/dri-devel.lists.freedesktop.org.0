Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F875A761
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEE310E56E;
	Thu, 20 Jul 2023 07:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B6510E56F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbCJ9kWD2576lAbJvOqOc96c7JpFbErWnoQg1deS8kRDIi6Ios6M8b3lmOy1NmsZXLRxqrYbH6zBlBvcI9nP8YsiTlan957NQMDdyOyhaI81d5qhSOt8FDPTHm7IYqsbLSCuwHArGNzG27scNkZ+y+hJq88QlL/bBr8eTOqLA7vSyWpzXbEfx6Duu/eHp7+Xn3JEEr1vFn4zYlQMhkGeqaBwgBpuEa/zyIA9kRJRcixnnc6wVztW64RTQxPz6PE7uA6/iqbWtSoEjBHKyNVUgAhm8QN1jrTIl4DnbJZ6cBfTOjIwRAhkLJNfxTNQZr/nf796gqu5nYf6kWdEt7Shlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro5EOp6mEkZd6S0WaGYqv9gtqvuAyxqa35OiIznoIJM=;
 b=aRyBzTpAqz60XTbrMF6FH2g01fRPjL5bwbZ7U7Rr2yrJvJjC4YEDH+N5pxgr8n64Uf6BNxEvSrDVGKw8/GwN5pyGMox4ptZfZxzlbIzCqQGfDO+a0RPOCb6oESxTXlUuGzTGS1cz+qd6FbK5K2LA/A+hWlkc8G7rrjKlmqCNCe6NDg2ghTeSRG8lwqmqfHhCVQeS2AgiUSEkviXpyDJe7Z3NjlbT8EVCw8XpjsbVfVrCpCRP+22e3zMylOPqLEmwdbNPYzFwIxNo/E2cjj5mKuCXku7DwT2MZyv/cJ69bVXxQWsyB8NJPZmaUasRw6qlEzjryUdUFnm+XmJ95DSi0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro5EOp6mEkZd6S0WaGYqv9gtqvuAyxqa35OiIznoIJM=;
 b=gP5Pv9/8giUgjPKf9juczSRwGAZ9QONFVE7ZUSydo0yCkNKoZITS04244VquGNNS1k5AXjV6WI4RClLEUGG69yZUDLTm2pZOiaj/bKRTvdnfYD9TwvFYLj/7HjmhDS1c3TTwuyCCHHDv8rtI/SmyOukdFo4HgJjO04Z7w7OEyA8=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:10:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:32 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and
 LPRX timeout check
Thread-Topic: [PATCH v2 7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX
 and LPRX timeout check
Thread-Index: Adm62UWNCyqQxjzgdUmjJHPwqEPmsA==
Date: Thu, 20 Jul 2023 07:10:32 +0000
Message-ID: <20230720071430.259892-8-victor.liu@nxp.com>
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
x-ms-office365-filtering-correlation-id: 69888b05-0bd7-4453-d394-08db88f0680e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LKldNpDWd3hmOB/Bpr6a/6F+3FGySCfQn0aNbYMoMxq7aYZ+Rht1uBeeIySt+V2g6bK4KY7nvLgBwcPbgnA5f9PsECC4un7UtJAS7k/v8xep9ERrzTBpd1OiGeicnFolVXyUY0EPdOIwN7r5OISl6Hs3OTqTbgHw64yzdf9cEGU8DlFrMg91u6E4/XdkNcXNezZJ4HbbDxeA1bMXgRBBWjReMAP2KPB6eq3IwpES3bRjOiW+dGS6C31IoEU8KVDzzBhK1H4aiZLJnlPLjuGWXe53KZ3twYzSS6l62ZyI33n0kojVGjPBNzh60uU3a1l17XYFCsDRsJkAAuNCJmTS4aS1kSV6Yw8mXJB2yradc5fLPKfMHgzSr3h/jgP5J7+X8dFpNrA+cC1mpD0j8h4NrJGU8GyI9R4hOuF4Xu/9+3p/8hckFxiRCxCb8M/p1u5TNKpEerJAmcpIRvKCUbMsFdhS+0pHv2nN+Z6G1BMyPsZLHbazmOsmwPN1hulffMe9a/TYZenm3BvTijtTae23+DPeMtOsdOlnD7rPPZy7Tq6XP0ECzbqI+xq0y3sIALxDzz0XweBB4rMwshXZzMXP95JX4+/Svur4nK8dB6CZ+oQMrYW3z/SzoJkgcaZrFvPI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(478600001)(1076003)(26005)(6486002)(52116002)(2906002)(6512007)(71200400001)(4326008)(5660300002)(66556008)(316002)(66946007)(66476007)(83380400001)(66446008)(54906003)(110136005)(64756008)(38350700002)(36756003)(38100700002)(7416002)(8936002)(8676002)(86362001)(186003)(2616005)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?R+gKqyyMBFptvoZofgvNiPp3Z0pBsgkrmLlzPqaRLdxtn7K7j8zGT9Eola?=
 =?iso-8859-1?Q?wKCCxcgf0O1DYFpT7ivr++f0fN5LKSiDQa+rykZz6zxMrZIQhN4mNefL/X?=
 =?iso-8859-1?Q?lgF1m2ThxOnrKqPj/FuxsQc23Fmn3wpAfISldqhulFiusNuk/iKCnCHd8Y?=
 =?iso-8859-1?Q?dmU5fX94wdhSPa/9XEpYDpAS6+F5moJ0eFNdLYngLkWHaGwtCN0CpmdJ4p?=
 =?iso-8859-1?Q?roZH96BBEtz0NkUgW0574veT8hiWYLXfxI0PQDoFFxz+o7Yr2t3oA8JnxA?=
 =?iso-8859-1?Q?liaj6hv8E10Vdf0pCxOg/YEtUf6GleUU4zW5sM17pSQv4aGSgS58GnRzzJ?=
 =?iso-8859-1?Q?xdKEjYyUMRL5uy7ptRNHysSjr4ZKWlMjvGV0Wg2MrL9aiZR3ydczp6SI9Q?=
 =?iso-8859-1?Q?Sd04F+d+Okj1SrTfF5j+VRN3W9ZT5GoUoEzYbomN64SEhtV+8a6fRHMV1+?=
 =?iso-8859-1?Q?qOgC7qtZoqzjglOZ9CtPIsXC/FcWLorRJfkLeRYr9rmBY2Z/LvrIVNGZSn?=
 =?iso-8859-1?Q?d0E/5QzAaqObKLlYLWaCHHbsY1ofI6ucBN0krlgmy2rm9mrQstQGi+yQwj?=
 =?iso-8859-1?Q?OGCTz5dkhNoOOImsDamipxOHqATxWFBHNT4xH9Nr98d8nO8Hz5PR+EE+vw?=
 =?iso-8859-1?Q?YFcP5uk2GeWskoYGuK8z404AvFPtDxvFK2GF68c9N5ErRHInk9+9ph+bep?=
 =?iso-8859-1?Q?vTt024mhpGsegu5KfZ6G9XriMEk9R0lkKtRY8LwaKMdbeROdbrORGZuE9z?=
 =?iso-8859-1?Q?zYV8GrSxaQlpzlXKqUhLE2KTXlPm1JlY0H33IRdJe+SI5kWd1pqhT4jfuA?=
 =?iso-8859-1?Q?7R2aqn4kKG7aSKbjM7ZPpayu4s7UR5dmfdy1W+54Z2TE2atDzJOZ1lpw4I?=
 =?iso-8859-1?Q?XRYgF9ZhSwZN2WiL51VI9X/NIbxkZTVcHQYAf7BZwng1eks4X37Z41K+D8?=
 =?iso-8859-1?Q?hnBDqlh7i74/NWXQO3mqxwvLZCPHih4f6z4wNbyZvoxKkc+O5ChiT7gNvs?=
 =?iso-8859-1?Q?8+wr+SrEqHL0WqzuvQwuFXbOhpWJ7WfhwkbDjwe6+pF7qYAcR7+3u6nOBP?=
 =?iso-8859-1?Q?bi4GVHXMRAq05iHPOUzWP+5p2NZjCvEndAnroy95S6+5Bwo2TeRLFdGRT1?=
 =?iso-8859-1?Q?aqJ/wwBk5LWA0PlxMENN1ugrKNmbxPPF8Un1DGQoMsvOuSa3au5dGLdH0S?=
 =?iso-8859-1?Q?C8bS1tzv0XE6bsRthmTck4EPu+7C5/+DXDY4x6T41wifse11o9VlZdrp0L?=
 =?iso-8859-1?Q?eEvNZgJ+uQn7JZWT0vlWpGOgc6SfzKooT8Fkn1vtNS9KrSux2aPldAj2fw?=
 =?iso-8859-1?Q?4a3NHuW9VqOxRK+nSkHSK8NhufT+iL8V9jwdZG9p9jg8/F26Jf2XQGdEEJ?=
 =?iso-8859-1?Q?UFhp+AewDJlflX5ZUgGnx57R5GwsIU6EpWRxFG+i+mxL3pA5eV1WpXXf+J?=
 =?iso-8859-1?Q?6wfTgT0YFlUeMg81Su9p/ahC7Ckg4YCepArYA1KOrpz2NfeRgZbTN+MM82?=
 =?iso-8859-1?Q?LYMFlccvszliYtkvqATog/0UWehcvoi2Wpmtkgtd2/zHMpKX2jxAHHsY1i?=
 =?iso-8859-1?Q?btJkFy0pMB4vOHD4tFKn+Y5fOSDBlr2nXXiQGpjAQlTqC4uyGleO3ViZun?=
 =?iso-8859-1?Q?hNZU4h3Nn7ER0nEd30S/bcuj37+G/8ghLz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69888b05-0bd7-4453-d394-08db88f0680e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:32.1952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XUixrAXBC+LPWrgLCvV6MFuqbsLdl3WfEDdnZ2lRWIAs6kJbodURnp6wiF1XEWL2sLKanjt2MSd/Uu8z1lsppg==
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

According to Synopsys DW MIPI DSI host databook, HSTX and LPRX timeout
contention detections are measured in TO_CLK_DIVISION cycles.  However,
the current driver programs magic values to TO_CLK_DIVISION, HSTX_TO_CNT
and LPRX_TO_CNT register fields, which makes timeout error event wrongly
happen for some video modes, at least for the typical 1920x1080p@60 video
mode read from a HDMI monitor driven by ADV7535 DSI to HDMI bridge.
While at it, the current driver doesn't enable interrupt to handle or
complain about the error status, so true error just happens silently
except for display distortions by visual check.

Disable the timeout check by setting those timeout register fields to
zero for now until someone comes along with better computations for the
timeout values.  Although the databook doesn't mention what happens when
they are set to zero, it turns out the false error doesn't happen for
the 1920x1080p@60 video mode at least.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index 536306ccea5a..0fcadf99e783 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -684,7 +684,7 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 	 * timeout clock division should be computed with the
 	 * high speed transmission counter timeout and byte lane...
 	 */
-	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
+	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(0) |
 		  TX_ESC_CLK_DIVISION(esc_clk_division));
 }
=20
@@ -747,7 +747,7 @@ static void dw_mipi_dsi_command_mode_config(struct dw_m=
ipi_dsi *dsi)
 	 * compute high speed transmission counter timeout according
 	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
 	 */
-	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
+	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(0) | LPRX_TO_CNT(0));
 	/*
 	 * TODO dw drv improvements
 	 * the Bus-Turn-Around Timeout Counter should be computed
--=20
2.37.1

