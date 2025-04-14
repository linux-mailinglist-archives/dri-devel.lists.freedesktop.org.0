Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF3A8767D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3224B10E469;
	Mon, 14 Apr 2025 03:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CA6Rb49n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9BF10E469
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIHCZCmq80HIUaOuRR5Jh5lFe6Qyizbi7v5nsPPVpKx2B0bIqpDR7N8m1yy61Ff+KqDTjoWb+YQW6Af/JZ+/X/O+h1XcUjMSLds+hIKzurOLu3FrTGLzI/rFT1xxhRsk74BefIJCCHsFFXqJY2w8uwCNJ129hS3yCyF/nQ/t84OGWl5Aj3/4uEBTiYSU13sBDQW3KGphmzJn2LjwAjDiy61k91FQ7INlBIi4sBqJ8SOUqDYdyHes+iXgF6ZNd4wrp7jawXG4AMXiPiwyL4eRPE+6kD9K/JGSMzTAt1eMrN+AfwrgV9sdJk/Qax8UIFCuEGOXHE/7VX/uKxG/JIarsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6sIbbauufVAqY4/z/NPLebuXcL3gOyq5tnhAZS8cQE=;
 b=MU0zFiehr4gUWSFljSCEZbwPrtellvosNuAMS42cP27mcZqdDEGKN2mZfpxz0qqwX4F8URrgws+MdUeQFiWyag1y4+A8c8X2d4CXFT5sj3OLW7dQ5lOhNKnQ6FDCvM2fMerDXmGZ9ae8xD42aI8ZiH1oK/w5eYDnOqTRtLF0FVftUzKU9GiviXOUNMB/ob9hpEWAuV8zOI2j1X9O0Ts4O/8UiijXVfDYbHzNwpdWtb5dAVEHoNvaQjK6ce3+5E6Sapt3zcgwxUgVr1gLhLuwtq40YkQ6BFWD+aLXWil55XJrqUJnNIAEBbLwYHFxS9boxveO0deYEneyHXOwi1cxbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6sIbbauufVAqY4/z/NPLebuXcL3gOyq5tnhAZS8cQE=;
 b=CA6Rb49nkJM3MpK05BUY6evG2AxcUkurHAv3beq+hBmF6F2WU2U/KU5D+nZswcdKHMWouccq9L/rBav6sYgHK1doGH5dpkbRroE8ozEwZCCAi8TPpaKaxfOQUIifpsSGTz4TQcNxYSSYGciRYZ2bh4uMdnrX8jcDdwewEDC8vJbIKXsnecMm25uPmMngxT7HY1NDP5WlvALKq2ejhYgnkj2dvSfYUSYgWhuhiqycVOhbw8RXi9M5CCh/xk2+sCPW6XAcNx5iLsrrfK0OgyXhuyjiWeEfepaNh20l4IqxQigXeUA1V9eiN9nvjTY7XD1fjdrC1yic6+fhjkbGTCGlvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 03:51:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:51:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v9 18/19] arm64: dts: imx8qxp-mek: Enable display
 controller
Date: Mon, 14 Apr 2025 11:50:27 +0800
Message-Id: <20250414035028.1561475-19-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a95aa94-0f13-4677-3a0d-08dd7b07ad27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3lAF36S6jJH5n6OJ0c8UuS4+WqxIJ49VAo+qNGxAQjdMi/kDx+reBEf2L0fV?=
 =?us-ascii?Q?yYPtKr+8sVI4nfViytqERKgiBfSZHhMaggT7z86Vf9lTAimCVwuhPzEnuFdd?=
 =?us-ascii?Q?aqjg8FU31PD12xMAicdAkhqUGMAT9Pg46RYH5+QTf7436ggwtc+6ynd5tzFw?=
 =?us-ascii?Q?mFvTzWORD+UTwrFY8/ON1LLzu33Kz38g78JvRgDNrvTSYfBzLWQoSqvmaqYZ?=
 =?us-ascii?Q?rIJF3hS0cV4g4+6d+kF0aNDckN1ENLE70O3Wv8xP7GW55+Dsm8UiIDYF/eDP?=
 =?us-ascii?Q?zXIdJAKM/NTlOfZal9GRPpzIk9/Miyv35WbuwOkQvz87xlMtAJ6bWWHuK5Qf?=
 =?us-ascii?Q?nZjXjylVhNMwxUlK13CTyO57f42VmM1BZ5e/WIN2oP/TKSvHj3vC+/4J8uDQ?=
 =?us-ascii?Q?K4zz6cAAZn4qgqaghua+VSnT8oC/pLZ9J45tQhoMjFyBPdD5eBvrN1jvcpuk?=
 =?us-ascii?Q?LsCVKFRCbG+OpYy7/oJplmeO63lJIQbqvNYlAKIPG3DZyO+rpR8rj1qe8ox0?=
 =?us-ascii?Q?8A0lXjkA6nFHB5GLaCR6gDvXS0cWFsVfAae82wiIshJ023vGRCgoIxDvkPe7?=
 =?us-ascii?Q?DOIlD+Yv5+IHJC8o2dV5DCKThILfc77fjXSIiPIGZhAeza11yIGmHFmuVOk7?=
 =?us-ascii?Q?FjxjcA+ZDMYSzooE1Ti9I9Yn8xTNC0FFP0Lrk24JLXJShy5tFgZBML21pb5S?=
 =?us-ascii?Q?fls1FhQ//GvD3d3JT6K+hEb5qiquCJn2e73f6816jlMXUzU+xonZbn8Hrboc?=
 =?us-ascii?Q?QGPueSHecUBS2j7F+wGL0dphYV6jsIrWNh6v5j+7Cmm4qvV1H6E88PoyOzI+?=
 =?us-ascii?Q?OdOtM8AG1GTYw4Q83h0iDnGGvk2rf6vCDghHQTOb1WFfuBhcxcK24cTzClpz?=
 =?us-ascii?Q?Sv7qB71p0x5emhc4grPqakPaufR+j/cjUnnLh4R7KXzUx4Ylq8dsoPUp0SSm?=
 =?us-ascii?Q?mrplAVlgxO3lY+xoKcLkQEMLNLoW7Joo3db3LJHK3z4AMp3IFMCfI9gKRWf+?=
 =?us-ascii?Q?3cSymsoniMChLrEjiVV57BD9pVxUxZRshq3ackmcM45xYTJbTgBOaod24zFk?=
 =?us-ascii?Q?SF4KEZb4Fw/y8JKA9ieLsYbDDjdVBi9tbVbpJ/Uqe/zspsnfJcRLTP748GNn?=
 =?us-ascii?Q?in+hnMcjbsw44oWeaG3yezjl8ugOKVoaaMAIao24R329j5QKiLxOzoSkzljk?=
 =?us-ascii?Q?5Uf3Xm9ycz99lK/2inPZ+G8/KE1LShYK4Vp9H+2hOah9opSQoHkktenZY4I1?=
 =?us-ascii?Q?Uhq0GUvph0rlHoT5YcxIvhF8/2LWtwXUPFJ8aSVC8uaAxG/P1OLS4Ah4uhbV?=
 =?us-ascii?Q?hbLvhorIVCIs6mW6ZDW33ajAfrLIy0ozPfE3OIX8RJ+OCVA9GmrQkMeLSPYs?=
 =?us-ascii?Q?u4f61UjEQOAKK35cD3yTU7IdfAnr2LaH3/mNCZtdECR/Zh1kjV+GdlvmwclX?=
 =?us-ascii?Q?Kb/fJbsN3Mv6cxA2C5mBMLp5FB5HmQl0eBvvd4+7Q9d90t2j4rxk6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qnAV6zaru7iVcVljjI4MAgqn2z3pa+xSwkQwlp2eVPAqTnwnkI1wxtbFcjp5?=
 =?us-ascii?Q?/IAy+fPWPvmWxILVPZnHXrKtaJqaO4TNijFtFCG2w/mk1NiHS4ZgrT0sN7fG?=
 =?us-ascii?Q?xzJCXLKW64ZswFglEALRn20EnL0sWvlwEgs++AvAfDmCF5L3GzSxqNoA6Rug?=
 =?us-ascii?Q?ndXC1p+DjKNCY4PaEX1IoCNKrXdo11gzUpjqLRPOtxscVu+Q9zQu5uHO4hSC?=
 =?us-ascii?Q?ycmIuwFZM/Sa+5i3t7IdQBDzXAAEQBjg+mOYH+jmEV7o5by6mayG1WBNVm5e?=
 =?us-ascii?Q?zVOXRVfixYrjTt0ZqnsAd6FvzuyNZB0j9bzmT6AMIuMETMuHSeyWGjl+hlyW?=
 =?us-ascii?Q?Y4pGGdlC3MdZPUgT0n0bJCgiEUS7tygQKjtT03xzU7YsU3fQ0O50tS+iywtw?=
 =?us-ascii?Q?GQnO3X7kEOI5O9+29UPftNx3sx/+I4/OfjkBzjTWy0E66nCOyyw+xD3na5q9?=
 =?us-ascii?Q?xLznZYlHA1vVjtPtIqX8HASAOYYmlvqH0j8C+Pqv3Hjyff8T+L0wE7ldRZHO?=
 =?us-ascii?Q?Szy5isN7vRRZy+AJw4xnNycYZ4Kq1b15KSM4ZYEz2tNbvvKuDs91keh0cDsT?=
 =?us-ascii?Q?iV3yJkmeoXUM8E0VyjVCrM+Gw2Cgi6P31tqtUtbSidQcNkhp+QTzAWtcbLol?=
 =?us-ascii?Q?FtOjZfImfR+iMCnMB7+3ozIgnS6dq2X+DvHfMcM/PqsUm0TEEs8flE2A7+vn?=
 =?us-ascii?Q?UCw80EGPmJ7jdUxfCRlIqZbopprInT0mjzS4qdSXSAdDjgoLtrAZmsd+wV9p?=
 =?us-ascii?Q?8ESgEXE3rHBtNJBcZ4MJue1jIIOUQRHuBmWI4C5FlGtvNIU4Hmb3kPI4gf/j?=
 =?us-ascii?Q?StLbforEfl/5/VjocRo/JyYGV0QfDKWinSKY2M23gLd6oq1nELZDzFUWvaZf?=
 =?us-ascii?Q?j9KsjT7x4xMGKFmTaJ8EGuvpoNSYtjjuNXzUBEPWnMm6Iq1KJq7yFewjKmSg?=
 =?us-ascii?Q?lyrSGZq0J/HXMSA98HpOdc7CkBpAFc/b+o4zQh6iJekIFCZpsz0fFhjNxqKW?=
 =?us-ascii?Q?ddxKzG+2AjEjaRNAwxP5iE/unMy5HEZ/V5P2y2byOjtS0i0lnFZ2WLccSclN?=
 =?us-ascii?Q?Th5x/huGzJLzwGG1ZWvVfyNpCyvFqwgvYQtsfdwzapTAKx+uCsf96/pLbl3T?=
 =?us-ascii?Q?4ZC2p8WNOwMDJwYVdq5ao5l5P/vFV9IefsxoAHAAzZFtJsVOXU6LVjleMkdS?=
 =?us-ascii?Q?sYwrQEYOLZBnmmz363djvgZ5+4WV8TD7JC6UiTuAR8EIvkjhOqBAdrnpMHgt?=
 =?us-ascii?Q?58l0KsmW/iWppzV3tlJIeG9fyF6YVYZ91V4Q0n81c5xuBHQ7GWmRAD+OCh+8?=
 =?us-ascii?Q?/8zCgrodrDQavFMBJFJFQ6zQyD/fNn1YwDGEfqnyrfOesvekw6CsNcpgpkZO?=
 =?us-ascii?Q?qHbFDrexWs/iP0juXmdFVagnN0ieXykovgMd8IWrb75a5+6Qtm9T5jHD7P4s?=
 =?us-ascii?Q?g8eMNXXGL60eRVY8ufexqLYhfn6GTcRniwtAQzknNcxzanZIoZ+qYho78+E1?=
 =?us-ascii?Q?lXkqE2XD02GPO3Nfg7prqgahgCNOOS8LFt4g+uC9GCkoYkbEi51ZKp7D6lKT?=
 =?us-ascii?Q?ZrP+wVTUjKrPNOt7aHWQ3dLI3tCFXG3ev2+j+sqe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a95aa94-0f13-4677-3a0d-08dd7b07ad27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:51:45.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7UBNhyKiSZoj+jEVTVvs63N+/kG7RiQyfbHTpksYnxNPNWl6JjAT9VpH3Cfvxafo3pXEgzcOobzMONJEU20wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205
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

Enable display controller for i.MX8qxp MEK.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9:
* No change.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a669a5d500d3..a4427a77ed50 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -261,6 +261,10 @@ &asrc0 {
 	status = "okay";
 };
 
+&dc0 {
+	status = "okay";
+};
+
 &dsp {
 	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
 			<&dsp_vdev0vring1>, <&dsp_reserved>;
-- 
2.34.1

