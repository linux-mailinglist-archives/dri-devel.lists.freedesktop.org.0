Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475F9A35F5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 08:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36D10E899;
	Fri, 18 Oct 2024 06:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oDobPQYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2050.outbound.protection.outlook.com [40.107.104.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB5F10E899
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 06:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9c9fV91Ln66V9grJqrNO56OHRRdf9eYvjqEwsLf1tWkpnROgA1CiGQlXUBsPrj/0E4V9K7I9UkgMCgR/LEDq84E+iHBaDLlf81Sf80OSMYvG3SGjhvJ5WSS/GLvk41Zw8O6D8YuON9Smgjz5GNylkzLfBLsLcMCfTOcTRgYsSowmR9Unf8/Fvc+fuYSRmPA6egBCJtojiiNKimiwejc+82wmk0SaTgvUOLSsx271MnPgagrEqknOhtjsVuHIyQq94QmClTnz4WXlLX7oBIgj1VXVGkB2TUTDiKZh2YDZvcJZCGwb4xF6Gjgtaj/tH83zfDi3XHTmwsn+l3IhNLInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRYkO4XeuT3rwCKNhLiGWIQ7+KUTZeQsYmB0Pgck8H4=;
 b=aMCNyUENoBiBZNbQAWeSK3GAjSvGv24x3+5CTytIcs1aBRRv4+eK4RUAtnyqeZ+3ng2UdQ3XSCqAEEp3olBNvy56KMkdjUJ/fP7Q6XAekhGCSwdbnkwUx1CKfUdL8S/Wg8+GWS2K7Wc4vH6pznWwNgULWaa3yjUIZty0Tfc2C9SnWOeolJTxJRM/08/JO+ACyglwWGGuahZau+k9/ddTCIm2ZWQChvxAK5ySn+ZXXVHbSPj5QgKlqDVhfos+7WimWWQxpuk9nGQruaOrDFlbFwpCbJQuKRfnwL58PqMA4DvqrjUT1rARgEPL2aUcSAdf3jl9qm+vwJGYEtxp6xru+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRYkO4XeuT3rwCKNhLiGWIQ7+KUTZeQsYmB0Pgck8H4=;
 b=oDobPQYPvdWyB6vRzGhDw8Wi8ID6qDN97VQ3PPKkRJRRh9rUqvU5m/YCVBpmF8tgvq2yBpuCz4zu4OJ4t+kUCe3bRnfn6agBBw09QBgEHI9lt6jxjL86RlZbTOfxxW94h0E1ywJNW2fLqj5vhYyfNeIHk5UVv3ARMhvvbLiB1c34RaU8FGDFrmrYcgnYF9qsvwPjSBp6xxas2MEeUeFNDJSMEO6NzKsAXsFR70YAa6G/dC0tz+ntJZt47rJzF0FYQ2HFcW/nRPCUYecmXX+hvjjecnmq/TJE5cPs/Pyik9pPnJYK0M4HN5ONl4X6qGF6mIDgOCMI1Re0hI94hhMQXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9787.eurprd04.prod.outlook.com (2603:10a6:800:1d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 06:48:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 06:48:05 +0000
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
Subject: [PATCH 1/5] arm64: dts: imx8mp-kontron-bl-osm-s: Add HDMI connector
Date: Fri, 18 Oct 2024 14:48:09 +0800
Message-Id: <20241018064813.2750016-2-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 730764db-8a2a-4207-278d-08dcef40d1be
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MOdHxs/jmgUZdu7Pe1aVgO0aXHGQu3QnseEnO+zRMtSwfOE49CGssiA0+sLB?=
 =?us-ascii?Q?i5HDRIjl0lIIG2tAUh/nbDkVNH7Gr9BVABi0VdXDo2YZcQ2jygPqH+h7MNw3?=
 =?us-ascii?Q?IhzXed3GuLCK3K3ObK69Zt/Epv782IxnrBAlprx/vCqOUdBKSUASHZw1om3s?=
 =?us-ascii?Q?RKC/A8hcILbnbwqlf47+bTB0Xi31DrDuG3hFdZdK0aZe2KoEPkdYYSZSnTQZ?=
 =?us-ascii?Q?+FGTkSTmpnYKI5ygxHBcUdke9OENwOi+FSsF38gvfvOUzEA5wHs9wjWHfv+r?=
 =?us-ascii?Q?QfW87059Gv6bD78cuVb6fD0nRF0q5qu9zZ5BPE56mfZbwYj9UI6MfYsZfKqw?=
 =?us-ascii?Q?tYsrbHcBtQUn48I7LS4nb/LtkUCgTbxtfDuZplWtfdqEeQDq4ItZJOxRZGnd?=
 =?us-ascii?Q?AWnOtY0FY/HSqpXXDFHDB2gS+2+fAhwAhvmapcmcESU+Mg0ChLpglaIlefBA?=
 =?us-ascii?Q?ZYMoY0LQ5XvNAk/F3tZXHKKu5xMIEd3oXgFb1XaTk3IVE6YY5yAYBkDfHCcC?=
 =?us-ascii?Q?UEaQNuu3e9T/JqGDXY3SeRfOmV39NtZbfUfzxzju1Jl2tKP/nPr4F5f33Efr?=
 =?us-ascii?Q?ZCGvDykrRyG0M32ZYd1hRy75vLOaNQAbbkgl5XGVB2Ug4PKfCple4VcR80n9?=
 =?us-ascii?Q?5VYW59JB21FpSzCLb67zQBAMUq4PKn+Ua4RlGrndlJI3zYeqMl1QbFH+S9NR?=
 =?us-ascii?Q?u5EW3Y9Fey/CTepGLTHVj3NMsnEhkgGbwUW9uwwJn1EIQUuFF1Yz6ppbhzXl?=
 =?us-ascii?Q?pDdR7ijnv2vpoCvsbi2qFRRNrGmEIatGk7typcy9mkR51j2qugkoykxWj6HL?=
 =?us-ascii?Q?CnrodcdqJoFLTTErI0ohRPUPaREvSleXsOsYht4cyIHmVn2/W3u45Dvfs8oi?=
 =?us-ascii?Q?Hct42io3epKYxdHs8vWfM0wN76LMYQ1zB/jCeKou/Gu/hhf+k8Wjp4VTAZ8u?=
 =?us-ascii?Q?k809G+RjZnsOBoeRUEsjIV9Va4GhKk8PQt+CEchDfXR61pzKaRS/A8WvQPi6?=
 =?us-ascii?Q?jwzQiF4dG0Ibmdh7mru4lVBmI+nm29LD6t5pvDjmuEdmdjc/KL8nQhZz6Dlt?=
 =?us-ascii?Q?IcAvqoShnDPyjcBU55LsgzrboNfnk3ByLqJPorJ6hse4YE/uQAqlqy0MUcRG?=
 =?us-ascii?Q?EK3rd9kr2THEJ+hFLfrRlwHoPJmZZGEzskszV2DRcO0Vpyyyua44znLCC+V3?=
 =?us-ascii?Q?MVcuXYHrdR2Vt64JhI719jViXjpNYWqjTZC6qDS8jK/K1ZXW4x28ZiwiCPwN?=
 =?us-ascii?Q?nueuoh64cFbaNxKl7jtOr8f9hHGjQNciGvEGf1ChYZ6GaabVxkMEpFfc4TMi?=
 =?us-ascii?Q?AsM9MpfY9ZmMdesy+CHpZ31Qlp1fmQSovYizgEwBNWFjNPrCsDY7MGGzQ3Rl?=
 =?us-ascii?Q?D2mK8Q0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?INk1cOJ3Nf5w5iIWWH0pe35RY5usDkYiLAou0AyWJJJYilozbmpU1kqUFInQ?=
 =?us-ascii?Q?ZWt044R3xfUQy5a8bhwtjpWZKkGQg8Eq2zBWCcdtj6mHr1iK2w8a5g/aM+zV?=
 =?us-ascii?Q?vbBIJxsKB5WvRP4PhDcoLtAov3db1PDxODIvdxOI/hkAaGhfG7NsZIIvJScd?=
 =?us-ascii?Q?uapPdnRwRhwWhK7pKS+azybOItO22ZKOsQ30prCOsT7zkn8jqpXneY43ZE+J?=
 =?us-ascii?Q?YppFgzasgCX3Xppj3JfGnUGt04OtBGqgZmrRmFttDCyshoLVmM79U0W6PVND?=
 =?us-ascii?Q?O9PzObhvFTiydAVsFkW1aPRnEdlq/mVhYmXjeJSPnRiIY9yv150byV13Sbbr?=
 =?us-ascii?Q?ZCzY/dUGnAg6SztiYLke3wHv3CWDFEEA47iJmq9ctP7PZ3xagEFZ8Zc3YEF8?=
 =?us-ascii?Q?mfFaIrUfbWyzr8V6hwcosNceKGK7a5ewXC+qPdp5L34l5jYWvneTy7vJCukM?=
 =?us-ascii?Q?uKMgU/P6vKBJIQlxrmTqgqZd8v6OPR2EtyKd/JHM7H9qfCwitwCkiSEzlMpy?=
 =?us-ascii?Q?FoEuSRhaRwPFghDrmQgwpaGMbb98TG5igfpacCfb6rCuORIRgPgxxaL0zpYe?=
 =?us-ascii?Q?A/hC7kkHuMG5q6TxlK6VctLzJmpSmjDuKarENv877F5Vu7GeMxd4H2cLK+qH?=
 =?us-ascii?Q?wTlWPC9UfkUt+zgrDihx1bIulZZ4QHemJY61JhN0O2nWA7QL6peMWVDD9wMF?=
 =?us-ascii?Q?CAatCIhcxdZcdaKRf05/oEOQPeN64P11UbNcK2xUU7mSOetY/BHr+2rxoXEq?=
 =?us-ascii?Q?Yuj170bQbuAJo6rbR0HEz2Wo8jZzHcXJ9rCUUUDhr8nwGi5FALRwFTQJAxdQ?=
 =?us-ascii?Q?pnGWVl4eHe/tnl4Om/x1aF24OOtaThjY/Ghq1wCh5OO09XIgPRF8IP+TChQa?=
 =?us-ascii?Q?Mpw4oDxjV6aRJCxrj22ILGFYyDuSMHs1OQso2iwR0W2yXfSgzl4OAfR1aw9U?=
 =?us-ascii?Q?ht3yiRxYT7fT74cp7TG0JDzuaMzLvpRYmYcjB/U33lhEVChINKEBPYU762dH?=
 =?us-ascii?Q?elUTIVj6rIM1Y/DrY9uNFEf+Te8XKS2MZ18mkteAuURp53zhMITsrOjJKC0k?=
 =?us-ascii?Q?BLN2BKPXepIn+xF4CvCOhKV1SlCXt/rINTcJVH6Nx9SxnqdFzCX5b/uBw9DP?=
 =?us-ascii?Q?byNVMw4Rjw267e0yIjDbHcwvN1olP3IW7CeEjtd5p2XHxVQTiJu1O0Aq2Bic?=
 =?us-ascii?Q?1KATHvnr1cmFXvoWyeNfWcZGYVsEFqlF+ak/+3akWdBJs/DQ/oQr+2e/Mjgv?=
 =?us-ascii?Q?fGqkFDPmjhI9orZ4QzKG478vMIAPbCistkvzRf0uOObC6ThFplt1dUzZcAIR?=
 =?us-ascii?Q?4jQuyz0cfKq6YTS65W6ZHtwy+zORJ+Yblh5cnKFyBhP5ugDbMzUEYUut6EGf?=
 =?us-ascii?Q?KUWL0rwbgZMSPJ8pKmciuRSgZykiRKcWvECzaDzB9QnxxWzxp2jQm+cXZi8s?=
 =?us-ascii?Q?ohD4dQO++oGHChiBPEz2H77S5Xec/S/6Z1jQ6URWD7WEx7dUMVfzpivsaOhT?=
 =?us-ascii?Q?qbHdqKUgG5eG3XoIUUbuYMQKFsxhzIKxjXgHAA60/0qGRzC09jslb4i8XUhK?=
 =?us-ascii?Q?SregJjinizvmUmd9oQOEGdAFc5YD3pVSb8ofDNcQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730764db-8a2a-4207-278d-08dcef40d1be
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:48:05.8758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtkYRw30Lj956rkvrV3A4Wm6aegexvTLf+4wQWcDlh4mWvZC/+ZlDlm0qpppvWIY5EoDVcnqzLkmJHFjxTIuQQ==
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

Add a HDMI connector to connect with i.MX8MP HDMI TX output.
This is a preparation for making the i.MX8MP LCDIF driver use
drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag.  With that flag, the DW HDMI bridge core driver would
try to attach the next bridge which is the HDMI connector.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 0eb9e726a9b8..445bf5a46c6a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -23,6 +23,17 @@ extcon_usbc: usbc {
 		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -168,6 +179,14 @@ &hdmi_tx {
 	pinctrl-0 = <&pinctrl_hdmi>;
 	ddc-i2c-bus = <&i2c2>;
 	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
 };
 
 &hdmi_tx_phy {
-- 
2.34.1

