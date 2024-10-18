Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715569A35FC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 08:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEB310E8A1;
	Fri, 18 Oct 2024 06:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FMMphAzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2089.outbound.protection.outlook.com [40.107.104.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624D710E8A1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 06:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1cKfcrXmWW2Dc/IJGnQpoYG2xbDxhAMQJOCLBzIxwcpDXg2L2hvAkFORPfeoyBAhW3NWuz55bTTjjhOnLYH9L1IBXFQs3Hj3lRfhjyiSN/Q6fINCdRR2iv4skfuMnj7QGfm7lKDxvPtWZwDbj0ge6dXeLI0szct5Hfc/utYfciW7FwN2lreaHbLo5qKC78TEbeMQToEx5OTHKJBCbBfkXfTzjlTcJTQvqW4VPPDXySmP7CiyB28zkDoYi1TVM9jdqXuOasvuz9gIvI3YHIx431zib89qbewgUkyg9g4pzwFnl0+dVzf6p3MOEWYzv54ourNNBdeESL85xLdAhyo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkig8Rz3Nj5INvfmz2K5a2hDp0CUsdprbyGqeST/rWk=;
 b=hqPgGTjciWm7mQyX9NwwLHeFf690bUnLWsKMSobSBFeUaqJqC0bOarVuXnwV3I0fbrAbNhwdREJKsW+BMwhJsE3cg7C72aHlKGdDiTVPBy0M9OlAQJwikny7yC0HMGkVIRHWZf4HXhMmqXsiKqk6tLeyo0ZAvBWIRc0DsAtF0RyAA2DzEds6H00gWhdPhFDgvO5hnFdfhJ7hE07Zs4SNPHXXxKD2I8tYLtw05+G8udIYJ/0moEPxF33nBpMZolJC5lHKnC4JbusdUSdGtiUTR3Z5rv8fzPSNu05O49Mxn+fO/s+1yJSOBuvIlIJutvPxeNV3G8Lymi+ckJkyF6Sp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkig8Rz3Nj5INvfmz2K5a2hDp0CUsdprbyGqeST/rWk=;
 b=FMMphAzPu4Y4LS4BaKdS3aw3c3dq1tzmK4sTv+uu8wCb5hURRf2PnBuk3wZS/Tvxy08FZGq6lcV2zNW+XJ4X7szKmD8RjPUSK3pmMaqWJjEku4WNndRA/h+zO7/2b4uw2ITjMdDa6IJCavJUHkshCrD/LCrCQVyo0pKc77eF8h/SlcuUcWHL3vMKhO8tAqcJ6CxLbiwgoQX+T0qhR9YIp4sQlcQxticAFKJzksFGUKRVmyIgcLPlqMxiWH/TJmxx8FD3YDyryJOz3Rmbb0RnP0sx7SHGquoZufG7XTyFAT+ELFIsK2AhrQbV7KsH4Dz777XvRWLPNwIy/s8+DzKSIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9787.eurprd04.prod.outlook.com (2603:10a6:800:1d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 06:48:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 06:48:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, marex@denx.de, stefan@agner.ch,
 dmitry.baryshkov@linaro.org
Subject: [PATCH 4/5] drm/bridge: imx8mp-hdmi-tx: Set output_port to 1
Date: Fri, 18 Oct 2024 14:48:12 +0800
Message-Id: <20241018064813.2750016-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018064813.2750016-1-victor.liu@nxp.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfaa45d-453b-4296-16bd-08dcef40dea6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7jjWwhyPIO5KUWb1EEU2sQn4mdbnSXJtF4Vmt3WkspumG77fm+RmYZkZbbuZ?=
 =?us-ascii?Q?7Ro72BX9WrVzLGu+iCCV9YGrmhyleI9CK6HEn+MGqC1nimUQYZbLBjmDGN3l?=
 =?us-ascii?Q?dTKQWWavgsUWK0jF/2XRxjmzl0sgytRk3VLJ/9q+2WkhQrDrVI0VYPZ0F9ev?=
 =?us-ascii?Q?U4qAxPniunXTcqudJFMKlY5ytMA1MCyrIESHeinj/ukMRoFX/TbyEV2ps6/d?=
 =?us-ascii?Q?ZMJTp5NCCdf3cr6c1mdfW+W61HFkGwVcIqfaa2CS3IEd79lkmYh/043lRhy4?=
 =?us-ascii?Q?i8VdJmQ0r2tNyyrOiD04cxT0bO5Mm43kPpbXtNHmRMtE2N+intyfFa9VRd8G?=
 =?us-ascii?Q?hjz3qhFMr2qcXB0K1VR0wGTtdxsC3DPTeijpgqSwORmsgPiS3UHVrhiyrLfA?=
 =?us-ascii?Q?sv6mgY0JfCgi31RXI5HD+SCwlKjlVfTjLqPKXHGlxd7OVeq3kVLi4XgK9/zd?=
 =?us-ascii?Q?pcMtclAjBSNLCcQcTkgRlJ/Aq+BJ0gHVto++9Dw5K92z/GpEqARe2YtWaPfZ?=
 =?us-ascii?Q?O+B4Cvbha1HHB6aB0b2ksMJWNTDNSMSWt/risTRljthMddHvlbrIokZeCnb0?=
 =?us-ascii?Q?nEPV17ADjR91FJ9RCqj8ZIYiDyyZMbf9wjNTfFtM8psWmXXVGbFBtoeV8GAV?=
 =?us-ascii?Q?gCy9Vzh6pd4sMZOpRvfdZumF5dVTOByC6SZBtA/7GZhXdtgqO+ldmWiX6QBu?=
 =?us-ascii?Q?kVYV5BleA6v6Ej6+7dZIMuOyrN8goeevcmT09YQBZm+OkwboJKtxMreRQjYl?=
 =?us-ascii?Q?wm1NMD/H6WLe7ga8ynWAlsuh9T1JricGZbSxFtSLypiziUZDD89WjmM0jfeD?=
 =?us-ascii?Q?nlFPaGH+Kn4+VB5QfG7DGydLKwBRh5rHFXZbx2fqH6jvKAefswh2ScswGJym?=
 =?us-ascii?Q?hpuC+K1J4VrPTRyrZgruRTH1I8Saftr7AAJXf8pBBzLy6fSLtWKg0UfS/G00?=
 =?us-ascii?Q?oIbSm0v2mtHKVH1bPEIsGULoAJMHVUEJcCGEtAsF+tTRqQxNYw5pK3KJZiTb?=
 =?us-ascii?Q?pKaynsT8Gy80lNJ6aNI/HwS3WRZbau7cCYhV5w4f08mODzAnXkq0x7yl+1Y1?=
 =?us-ascii?Q?RqHULG8/unD41ZIYPV9dWD/U/Xxb9WuAGBxlgvoNB++fRHexN/ijUKsXb5Gg?=
 =?us-ascii?Q?Yiev3tNYJsbJFR3S/McZJD13ajAc824EGwl3l+9vwTWBEdWBZ+ZykFf+SCFI?=
 =?us-ascii?Q?3hTlarO8ekg+LiEI8sv2pU0pMBcUFrhl8mNOr2+UHDCwXiirbtGjRoSSnYSx?=
 =?us-ascii?Q?Zcy7zsD82ut6mxs55ZneMYdjHx+WbQqhdU+fOjEWYvxYDlqCL0D532vscBwf?=
 =?us-ascii?Q?D0D8HkB23WRjm3KKGH9Y1SlxizdFJaLc/WSrnpcULJAlS6ZTRMTrscx63iVk?=
 =?us-ascii?Q?Dpz8txg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+SjrrMSKpdf9ChZr88VQQhVINedeZ+IktaENGGfsMXuaklv5Wu/Eyst2HUKx?=
 =?us-ascii?Q?8wTkLdDp0qE1KhCCXDUcekvNf1+8tREabIG7w47ZahOGHl05IwLTUIBkEV45?=
 =?us-ascii?Q?PrLstz7iExUOYbf1yBGnF0JMnRkgnUweyoY1Mje8GbVBTzQld+yqtHGvJjeB?=
 =?us-ascii?Q?fRbYn4Biuj0EPb0dNEnsGKSEz/qfTejYszSvUij8WrehPL9m0IRNCzklckM7?=
 =?us-ascii?Q?Big4028kFIBpkqe2Z0uQrCDf2OYW+zCFOmDkARxweLhJEA6Hhxw8PTOjBGJq?=
 =?us-ascii?Q?X8d/LzMAjH68nTG5qYs//75+ZxcIwo7VdbWy1/LonrAPCIvnjhyqmZUHt5v6?=
 =?us-ascii?Q?Rv6gvxgKIHHD7+Z+Ytp+kQWr2jqEhlJnOlmb0zCC218Y80mbXbZ7E7dnww0x?=
 =?us-ascii?Q?NwuXwqL1zuSdcUiy2ZChdv86GPvaaobtabWtX+rDIZZRy7V0Fps37uGR8QWC?=
 =?us-ascii?Q?qUsy39DXZyW02i5fh0EYJmoklztnSxFtn12gOSdKaNj2PEQevYJqdxWnFRa/?=
 =?us-ascii?Q?5YB/FMnvjNZMWKVmCdBNiH6gpi5tU7g8AT/pKlzvBrXmi77ZamyWuhxFynmj?=
 =?us-ascii?Q?WV43CCx3u32v4bfO9ZN3xt7s5IQE31DON/6e13YQn3HRnzjXwwU/E9UWek0e?=
 =?us-ascii?Q?DMLYQwHQOXhpofyqLkeLSlmpbj8X2IzvS5EQVcjFWhr7ewGwSoKyWoK7mz9t?=
 =?us-ascii?Q?RG/MNbxK1McF50vvOUh/ILfBUPvaVOFqXuPByIYZX69ah14HLJpjKKmwIr4d?=
 =?us-ascii?Q?DZe7p0I1Rlegycjp6kU3o5aLlMmfW7RCEgf8B2J0orm+/2Z2Q6bwS4xha8tJ?=
 =?us-ascii?Q?ta9zNQfFnbR9tIgzyX+poxDdIGzr4fXOIURT6JlnyP/NtutYX3Gwe3gbRa9Q?=
 =?us-ascii?Q?+nvbhWIFWNCVKfKFq6QmavB/axF+EkYC1INobDy5IBY516y+6UAC9TPennHj?=
 =?us-ascii?Q?jg7w5Vcw31nzmx6A9+zEiD4JOXPUCAr+ZZoVSXk6hKQuICWJiEMFdl2+AABI?=
 =?us-ascii?Q?5PxZ+x7bnoJZT91uIYqZ9UJEDVYNAAXp6n7EXftVwAIsKYxVj8XonTkCffVJ?=
 =?us-ascii?Q?LBO83svkBOdeD+6O8pzGZTWiosZdw2yk/US/4H9aFdODF8lBvqL4Qc1Ca8+X?=
 =?us-ascii?Q?Yxd3TrG3YGgReaphrDImz5ctrF7u8Hmlur102d8eryKAG/aYW+84X8TilXN9?=
 =?us-ascii?Q?uJfO+88N4kgIbKdImr+pgYeIYWOiGe+okXnJLbX/eLY6yd9BdefVXodX/FG1?=
 =?us-ascii?Q?h8dKUw/p5pLtXd0pVSKcCyjZClfK3Q853kwDTalZj/BGLjenxoP+zb0qA7vF?=
 =?us-ascii?Q?XU3eP8xCm0iXafOCiyCVy0TWKGh5uTegbNc1+ixuRjwxVlYY2/THiFJgTU1/?=
 =?us-ascii?Q?4Crd+j4kgmWoBFmhcFT10dxQBydYQXu5+rz7Pd0W67kc5IUpe5E1UOU9b/1Z?=
 =?us-ascii?Q?k8PH5zr6FGJDvzV3n6xDQbD5uxmOOn0wsQfZSdxXlKXRD6IGul7Hr/e1dilB?=
 =?us-ascii?Q?rhWlHHAqtos3j2kYIxpOidSq81WWPJof3CQqAC5YuLmOScc6YntdqgKSA/Vg?=
 =?us-ascii?Q?ZRQ8OvShddgyCtFINIA0UC02nrNv6CkI9ynso1fF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfaa45d-453b-4296-16bd-08dcef40dea6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:48:27.5191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rq3KFEI/+ikpifuJWqHL2vnwwfLshB6WgLLGRmfLeyDgAFoio/bQA/Jch4jtrdTC2XKA9cGY/tpWgfhW1fXMJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9787
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

Set DW HDMI platform data's output_port to 1 in imx8mp_dw_hdmi_probe()
so that dw_hdmi_probe() called by imx8mp_dw_hdmi_probe() can tell the
DW HDMI bridge core driver about the output port we are using, hence
the next bridge can be found in dw_hdmi_parse_dt() according to the port
index, and furthermore the next bridge can be attached to bridge chain in
dw_hdmi_bridge_attach() when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
set.  The output_port value aligns to the value used by devicetree.
This is a preparation for making the i.MX8MP LCDIF driver use
drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8fcc6d18f4ab..54a53f96929a 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -96,6 +96,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
 				     "Unable to get pixel clock\n");
 
+	plat_data->output_port = 1;
 	plat_data->mode_valid = imx8mp_hdmi_mode_valid;
 	plat_data->phy_ops = &imx8mp_hdmi_phy_ops;
 	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
-- 
2.34.1

