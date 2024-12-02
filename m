Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4D9DF938
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BAA10E417;
	Mon,  2 Dec 2024 02:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fgt8ttKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7710E417
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4XhihVjspifdW4PLsVQRXXCSq+y+C4U4SWOZQHQ0RWuL0/0XnDUN7AXShM+tvxlRG75fn5EAsH83f55KBFCThh4yoPR+56uq9/CBZjzm6XMJ9euYQvmG2bfzbyRlNACY1Emcy+PtE/POL3IOklBL2u1R7ATK+sBMxnjXLq4uuTSD+UD9mxQyx2MPMQ8bYlcinM6cM6CF+nk6OOL881JHPGs0Ilw/JMouWh2/x5oteus+TqlTVkzdtv8J70kfgvXQMQi/z5R/viSeQTZoHAUvRxoMD2BseoVNxhgSGQo2xDkbOFlIOGyjqRk5Qju4zSpqtvPk4H+lOXkFquO+7oOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xSKwmLVZQHH3V/dac68pufnz3oIzK6qFtTNeYVv3KY=;
 b=CoMqVbOgdA5Mop/hJxkFKiy0SOJ2wX1xQv4nObPMTV7wOQupyMthIsycMq+rJtDUw7NY5MCBPqvU/v3K1fETyB1fFMd2IhBwBkXzi4VfNKx/sZ/ssZtupV2qJs+0iMLehji05aNceRTdeGyyUtQIJZSH+em40alRcEHgZp50uD667Qmbx6Ui3wbD09taSi/en8mswplKWoWp4oiNyfa3mvonn4AZmNnniHO1ctzQzm7flA6yO/A0k2DEMIluMcL2BK5XDI9l6aHdgUfJc0x11HolnMF3/sv5aRpOXjRG0osU3QD+n3tiPTvJAJsuuxJ89TpE/+VZra939LuM6IeU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xSKwmLVZQHH3V/dac68pufnz3oIzK6qFtTNeYVv3KY=;
 b=fgt8ttKNxeRMNMWqSwpfdHQYArs+KIVENGqkhHeCaMnMYF9AZOZ0K7lTWpeIvCaviyqxE2YctIRgIFgQxr6w1NMzFzazUaiNNagmf7dgT+KaherhBJsbeD4i9eI6YnQByB6KAWkDq5vDBA1SnmNBpqctA8NMglKETuw9IF4Oh9hAri4sP5xP2cr5WR7EnGbzwJtBwsjtI19YtYL7lsi2zmEb6gqs6JrTWWFARqGaIFn0T7/RYtKzF7igve+KnbBJay/cj8+QqdhapQdoGPC/4btWFgMI4XW128/xT+k+gOwOMaWZ2u0WqfJYWHVHP4FDJ53VNYrj3V398h5MjFHx5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:58:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v5 14/19] dt-bindings: phy: mixel,
 mipi-dsi-phy: Allow assigned-clock* properties
Date: Mon,  2 Dec 2024 10:56:30 +0800
Message-Id: <20241202025635.1274467-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 05957e5c-0fdc-45f5-45d3-08dd127d2a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vWaFo99e17AJGn59KB8ZD99T+fSKAYaCNBlUhNN07GQIJA+EqkAJuksUsYhD?=
 =?us-ascii?Q?rZ3cIeS/LOhI2r+zhDHbiUdp0pTc0KfpgshB98CGUGszMLgv7SdY9FQDjO8g?=
 =?us-ascii?Q?SFzdmd55InwzFFoxEpnfNACRn0HUWqgCbKAqgZVOTG+kbtaCy1K0ofbn5RyO?=
 =?us-ascii?Q?w0BruTgoMl4eTWqUQC1D0prAFNzAA09LoalQR3p/NApYrtpqP2VY9bw/+WcF?=
 =?us-ascii?Q?SX4UNdn08fDLuIymnyWHwKNKE92M3nXXE0D6cACLqP+7xv/b+AGDvkTV8ak7?=
 =?us-ascii?Q?EEjyni9/QvKgNU97qx0o/BraArz7dAbRuL8YEueKXXJXglpCHYUXN2R3KSqZ?=
 =?us-ascii?Q?OCM+BRWfPvPPRqfhCizj0QRXzZVpXD7kjby+0k+Wz1Zbf9172Qrgt69R3g8Y?=
 =?us-ascii?Q?UpfiuS0D8lB9jWmeqAxM4UAddVRz7AVyulGl7c6OhuyV5daRO0ThoaEHO7WB?=
 =?us-ascii?Q?ophtBcW9NWPfmT0dPusktzzSPWQLDvNXdPrsYBR/OXzvDCgTRNNbD3eK7HYe?=
 =?us-ascii?Q?dQTljCSkf5fupvKbZz7GGd54d8KZ8K/vuLtP1DiRyXGEk2QjlMKAjvHgXa1B?=
 =?us-ascii?Q?BWo46cIDm+tcCnok82BC4V6/VTtgNZwHYdN0Uh8SnhfvRQFIIPEjcxZFpejm?=
 =?us-ascii?Q?cOfdNlbNmxBk/kyYhUNcoPLkwGi/7F6g4G3hg7/4ypOvnL5XKIKb5oVFkD+5?=
 =?us-ascii?Q?BsFJ4aDDlJhr8IwC4yS6I0k62bTR6xj/B4Hdq4mJfhy0aTyA0JTOJAXsKX//?=
 =?us-ascii?Q?4i+VQU3WnmY0v7IyQQJKlECfnKbUM+25W0PMxx1naF9L8pi43SLr+rrpfLeG?=
 =?us-ascii?Q?2FdzBR7tVp9Wksxps+BZZC8HtO+JSqmq51VrilieJ1FAcScRer6Jdh/vkrSl?=
 =?us-ascii?Q?xcNDPmYJZ7ELsUKLbg8SyVEa1MPJ/Aqle+1oH5P0P7JHkjWQ2O0tz44hpV2l?=
 =?us-ascii?Q?RX0ZUGJYxKCh5NqGGqe4AzXTpMwHVI/w5cPu8kyYZOHEfr3ViY5L93GiQe87?=
 =?us-ascii?Q?Ovpf5g9zN7UpX1SRUXAhrlYtaDHA4Mn0ZEQr+PoBYX2axXdfHBjWf88BEn82?=
 =?us-ascii?Q?ZF24R9quS5JSkVQZO9b40bPxvVFy/GKxVC9k7djwS5KkMj+ZcWjBOYz93aWK?=
 =?us-ascii?Q?i1dd7cwQfE6mzo6vqrM8izwN1wLyeKahzKIkYsVdjrUd7WTa7vFx1DNTmVQ+?=
 =?us-ascii?Q?zNudug9ohVvil9ZkSUMWNrjioNN9EkuYkqlI3gAyez4prRIWzZKSTFm/J3XK?=
 =?us-ascii?Q?K0z/xFuPYbY2oop3sUOqF+b443wmfpPylDx/mPpp+FsWylAHhPQfLEEcIzuq?=
 =?us-ascii?Q?RO2ORZwnq7Gl77lzOfCezFS7429tGAOeLEF50sD8VM+XG0I3EW10qgklUxU4?=
 =?us-ascii?Q?TSxEX+v4KEkhR2EsZSs0bMAlSOLxMOql+p8S/5ug/YVzU1Fymw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SmLn9wmZO3wz+19Hh9fJWhLmF8auouwepf3MFlUWLBIOYnOtQuCcCbT131JK?=
 =?us-ascii?Q?JVHGTMezkuf6991lfvQejyXzT6KARoI/4Dzc1R8Cfc7nYrrqi4JXe86zGtRo?=
 =?us-ascii?Q?RZhos2XFON6O3QQUMZl8w1ZU9XEbpgS8uv05w/rPfTgoO1ZSlh9MnHAc3BJ4?=
 =?us-ascii?Q?BKgWR73JD2lWAlLyraYIx9+XtAuGTg8/GA8qmd+pDcXcUeDjOyluvkrJAj+v?=
 =?us-ascii?Q?F6aGL0SiGMUm4QdTODGsTmVNVhbYXq9xuqj6EkFviqLBBd8NVf4cuHaydeBh?=
 =?us-ascii?Q?xD8xxJACYs1XCzZBk69HyRdowa9PdBYNA7VpgqPuumfCLrBHhniyfRfjE0pu?=
 =?us-ascii?Q?9a13iXAzSljc4EmSMFaCnyo2i5ceGvqk3gA5mhNEE96UDiqWWvIBDHwh6bTY?=
 =?us-ascii?Q?+oDv/4opzsC6sNo9LDthOsGVD4dGGFKDRhMF9Yi3Tc0yjbxXiHjkN0QoLlNY?=
 =?us-ascii?Q?e1WlpRu4CA0w15jGok8isxiMhfmn9Q/N2gPefSc/WY5UuD5/sGK3MhMN79nz?=
 =?us-ascii?Q?b6ty3G2bakVyLh31woKaxnYJu2yKdJKAYPNrMGLnjW8dR38vLAzQhZJ52VMn?=
 =?us-ascii?Q?eo5n71V321PMTRAA6OmRy8huKA9b0fnL4j6yPmZxvAf6I0yZ02dyIRSrYYtu?=
 =?us-ascii?Q?0oDUoxDeBPGT0B7xA8VPE/QWYwZ5c2dGe0aaA311DiAUvgc6yO2obKta6yG4?=
 =?us-ascii?Q?BaCNj/q4k3Sa/XEYT3i3ctUYU3Jk84ZW3CK5Gu9ALHO7VZ+2vbtaHf0WBfHD?=
 =?us-ascii?Q?/NaTnCuznFi7/h2ivvcLZBpits6Fz05OtOGIx0oZu4hSd7OOLmuxbfsY3Cpa?=
 =?us-ascii?Q?KUnT+eXYqLfBo1SGvACODNRWHpUK32BO8vQp/tQktoumu++DmclrHTYCu0uR?=
 =?us-ascii?Q?d6ph+SM0mnlIXRBfdWyqp4l4iqV2Sq8JXUoVujZwrTo7AnUAsx6vnajikn27?=
 =?us-ascii?Q?Z++vd8QVzB5+NJlCVS33Kmu7luC5Nh3KRKUjCuKxnkh1RxD5Vwhz7qNTHZLD?=
 =?us-ascii?Q?huQkskw1aEBSm3NOUAGKJ+swG9iyTuCGEcNeZpzGoZcAc2ijcztiQL5BujPj?=
 =?us-ascii?Q?gefm659tCgFudVSQY6GeXpx/XWm08waGFoGYCdhzB46bcAgh10ZipDjRkkfz?=
 =?us-ascii?Q?PIoMRw+oz750/nZEnjPNPmLpbrfGceDO1x2BuwQfkv8SrzV8w9dSYZkUh3QK?=
 =?us-ascii?Q?/PRfVOHTxkxsSbpreyDuHn6dhGYta5KAskqp7qE++LKgPR9quDlxBLjAgjqv?=
 =?us-ascii?Q?f0es2nGhsuBzuWCaX+HicevIV1FBGZnBGtdGkFGfOiZeYXgqjXb/Cg4lbZbb?=
 =?us-ascii?Q?SPD5U2yFtKhyuM6ubngiffra5gvoRzijofPyCHMy/+OccEqK2yL9UIBpryv7?=
 =?us-ascii?Q?o/66T/aaQ4OCSzB00E2ySb0Ii2w6Q5INNxeHkJXomDFk++UxokewVs4FFKQ/?=
 =?us-ascii?Q?qiCxQoQyyH+HDQ/SdJux+pJJB4I6AaEaF3jy9fV/BZbuYAGVJuN9hsUeAOjP?=
 =?us-ascii?Q?45Ex30MzEDMimxtzhdhEMnWn6iaJ/SfyGz89Kr7uSq1xnhZCICKLcisYJNNz?=
 =?us-ascii?Q?Qs7eTy5iozV7Hj04Vg9Be4E0U49LuHBjYfQjyLP4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05957e5c-0fdc-45f5-45d3-08dd127d2a23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:14.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gj4zCrtXRynj5I/Lgkqen0Se2vgOR3Kf6cefdqNutWDlaC0WyLG0zXjLx9dfl/OZyIOH44hz9upAi5zkpeKr3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
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

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by MIPI/LVDS subsystems device tree.

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f097..286a4fcc977d 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 
-- 
2.34.1

