Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7FEB9466C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD210E55B;
	Tue, 23 Sep 2025 05:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J1+dOp9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013053.outbound.protection.outlook.com
 [40.107.162.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429F410E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MILsFqB+loJ0J8p5qUniAQHATR/FmKvDcruchtJVa7VqXKcqLl6jKjZgbbvb/xJ+KX9qlVogYM72XYSEKozB6BhSn8It4hrsy3FYNiqW4RmclmdtVsidDa9zyYGudyOuTIWy5vVTKQZwhDb3/ZNr5iZj7qEfDyMTSu39/TFgQm0KfpRt8/zVTfMJxfpfCd68CGG+GXRrsepegOlSuzD+EvccZe4Gd4SNXa+pjObKG3pvRkfFN5U/UVNI6aHFPKTZejo2cZm2RSn8d5/1GxVn4ldDv6A3J/qfGO+RvYsgxP2wkxgdGiTiGq9LPbwgCrqBpDPecvGHy/Lh4/L5oJphbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3EVaev+6rXX/R3EigweYiYXYXRyOL1iqaVrKuGJY2k=;
 b=oRsoyxlvvmwSleKkd2nbuzsOyiL/M5PHHtG32afh42g6UbqKhleFTefbB6PVi5OxI59xc14TIgtxkFgl+EzxW7gCWqB/zjNRUxA3ufESyPWG0NntrmITPIkOfltVAsg4+xLhV2az46Rgx7eXB6Dff9k2j4plZtOm5Ivt6ITNt8w2zVbWzUjmG1PK575bjYt+s5K+YE+/iH+MGV7KfO4oLku+34nYIwQQ/i/xQjkr5lQagBeNqDjHZepXyw6wJ72ZV7X7WGHLt3Wq6PjPPYB/yZzx2bl3QoZj47fDPlaQvJ6jmGJDF1k4s+MAd2xyluVts3P1fvc78AK73DqJ3HeAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3EVaev+6rXX/R3EigweYiYXYXRyOL1iqaVrKuGJY2k=;
 b=J1+dOp9SGAXjato5QVnt+fJDmzvIi+PS4PuvLXFzqYnnQw/pSvVruF7nov6cVZOggED6XOmZ5Bicuiec49eXPTGa5gtNobXPf94dgvKputWutoflfZVXSJERYAcvCTflY1i1y1LYnsuIZD+iTyi84xCK/y11XCr+7QTFQ77+BLJ+zX7vVvuKyGlhDLkLlQJ4eWQwCRBmsbNfth4Rq/V/ji8tXePyWOmVhhJEOGmL2QluRFVfR/96jyyJZcptpJPfDJkf8nyavV1gK1uhFgAsQixiKMDrZKTAW5yI2BzvJQMtomjjcZz0UzlxVl2WEiUt/QPL6zFuAJwswyiasfVw3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:30:40 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:30:40 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Date: Tue, 23 Sep 2025 13:29:55 +0800
Message-Id: <20250923053001.2678596-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a364b0-20f5-4ed1-8075-08ddfa62553f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JT0la8YiA1qcXy5cWLbw4ydAImcMEfWqSpOUqPKRXgzjsIfvxHOoXf0PQ++6?=
 =?us-ascii?Q?8BOOo55nA14SWUMlBojd0ZQByIGNk/qqfu54THkqqd2Teq0mGQnIPYN/bPKz?=
 =?us-ascii?Q?uZtGB6gKtf8pEeAzgbhZR1x4Se+As/2NWEsnZ28awpStUe0jf7P70+fYFkTK?=
 =?us-ascii?Q?BtrOilijBC8zIIjqEuMZau5+6eC0znKJXLeFwkGDMGtSfDcPHCSjnHHxRZcc?=
 =?us-ascii?Q?sNrVBy/M+jrUO0eGa5L6Igy2mkTKolH8s8gkPixCe2Yiq4eq5sA862/WBRxD?=
 =?us-ascii?Q?QUS3GvYtScJ0NLbDpvQnmGuCUK8zPiBgg4G//yaB5RTen7kCMOEnXPG+gN9h?=
 =?us-ascii?Q?BzoUogMvmXjt6u3ywKh5sFJkUCBh5idd/ZWJhIiRnKiKZ6g1H6QcbgWEvoRC?=
 =?us-ascii?Q?7HCDAN4bsWMRKSLmlED88xsrIlUthl8eScTzOcAUnxbbXBsbBHLzlU9BOKT6?=
 =?us-ascii?Q?XD14dnt+TMwb7L97++M7X0XguSTqhRU3ZWH2PIFV4EnxVrEa01lFrdXBx91k?=
 =?us-ascii?Q?LinVyMwKVLxAoEDvGRy3gzMsZf9YELG/PSB6eAiqfP7y8MpR38tfW9y1IxR+?=
 =?us-ascii?Q?U7kE1DKA4OPu/avG9ofV+t7chHDLByORzJQb4VQiaNyt9QWerG3dB1ALAZzx?=
 =?us-ascii?Q?GMceVTCzLMj/3Kb4VmqFheD+jfduoy/A/yB4YwMKMZh6KPDeHHZx5gUdSDFo?=
 =?us-ascii?Q?enwW6nZNe+sP1NoBRpYYL3+M3Xw//VSrbA/j1BCFo31B0O3dgqGIl6mbu1tY?=
 =?us-ascii?Q?6vrN1H0MBYRBZp1qJ8CWQlDgelZvkgnEhX4KsPAEkWTbj5iq6DL/uL9gfg5Z?=
 =?us-ascii?Q?hlP+r2ZjnhgY5PC+wntkPuO3DSk9+ZF7cTmkI0sl4eDCo5DEZwjcbnSXj/6C?=
 =?us-ascii?Q?V8kaDtVa7NDRHNIchHoaT+BY9mcufCEjn3+ejETyUAtv5kgZNY10OKozpGQV?=
 =?us-ascii?Q?O2uk8BF9DOzDznItPPa7lv8XR63qeCdlTNB+O59rOjQ00YyLEKbG/+BM82bL?=
 =?us-ascii?Q?VaOP8Fy0Ga5pRPnfjbrTLR6P7aVeg4HxhWjSaDjPpQ2sBqNRTkAutja7VVN5?=
 =?us-ascii?Q?pVXA0DC6WxgvBJjb0lIFvIePtnNzSUHiIxyiKree2d2wWKbFfwO7Qs+1x/O0?=
 =?us-ascii?Q?AnDoihOf3JmDXOI5bhcdJ71Kq9tu3qDUNbYYxZrVqlxQsYrKvDEnIxATwU55?=
 =?us-ascii?Q?OwPFpU4lMoAkQwyjhoOvg7RmBDVQmIoyGupwxnihoj+oKYxnm7j0+N602pre?=
 =?us-ascii?Q?Egvfmaj3jCghknOLS8l8XTm1geG7tEjefNPd9iMXEKFELMxmXQUOXMHViTHE?=
 =?us-ascii?Q?IKeWVcR49JVLUcVQsk01DdjfhRBE/gO1JkjsPMwGNZDVi3BdUI33iyCw4Tgx?=
 =?us-ascii?Q?fHzaL3SVCugm1bQZRg44jsUngSyi8fTfFYktofHelO/5wgHOzgGvGAH280Oc?=
 =?us-ascii?Q?Gz5XnclM4OR/ff8w4HgU1l3y37MLbFBMREXb9sxFMAX4h1tI0Txhfw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lC9vw7YUR9cYyzncg1xZFWpu0aF+rpOEfE/g9aMQJeC93LBdbklpCbtr/CAW?=
 =?us-ascii?Q?fJVbTj9NhH7hL2AKPl2cc85GNkwmYbgrW2Tf7AnjqRuLVEe3VPk+4wnoeiSU?=
 =?us-ascii?Q?5cY04J1+ga9mB6lgyHLROb9tqOF72yXZ3FJyTC1PXfXgieJoZsbIKE13vTSi?=
 =?us-ascii?Q?VsvwMdUVwrf1tuic6ftVDieRYUfgh9wcVT2xkL7x4cnSsYLnWTvQdRcfRPXq?=
 =?us-ascii?Q?0eTcfLZG5NWmMafVa/iI81ORS9BZJ5+K7QiCwudZmjKTir70wW2wg8khJ8wQ?=
 =?us-ascii?Q?noLb/+SKNV/BZkKO75PZf7wYxR6CM/7pnW36mjpnrYkna2ux4hqq8JBLnute?=
 =?us-ascii?Q?IiLoqBLL27bjPMxBtgCbcdC4nSRhdSCs1Pl5i13vKRD4UqDjLVL/zbK2oZEb?=
 =?us-ascii?Q?3z+yPl9S4wsSKlNce4ZmJAToRxCV5G+M9qeIm3nVNih/M/eZ7iYaAdRh9OvG?=
 =?us-ascii?Q?6RDNfCXkeTlHe5KJr2Zl/vfya3fvbYfMpyiNX54/jDzwbc9RmFCNKdq2nyun?=
 =?us-ascii?Q?prDJsVBNcV1whg2qzLTdVuVdpQxJh5k7EXXoYcbFRtWstz+s9F2jHAkRPI9T?=
 =?us-ascii?Q?F1eVkbPtPH3yi7eMlhD83xbY/ZAkc/V2Wk5WFSL+AKMzGP9IoHCYctJ36PSn?=
 =?us-ascii?Q?a2dtmBEKVBEeeUo6yOsb0AfXojinrSpaAI1mNRIaY4EnjsY7W8l7X8una34b?=
 =?us-ascii?Q?JaK/WgSJ+8zadA+rOI881Z3OvaKZ7KP2yv2BZ1inbx68Y6+/hMbGh9uHdOER?=
 =?us-ascii?Q?2MYGbVfOQFtcg8zqUfMpPopqzhR8+wP/r8XCwtZYsaIoG3jnZHPvOXJQT6hh?=
 =?us-ascii?Q?w7xu3K/QgJkKtJbkTOBFYRXqKvVaYJjPHyQXh28InlU3JOyX6yIlO41fUJr1?=
 =?us-ascii?Q?q8ENnwag+qcByVLOepKMufJAEcgGTnlIqNeAJ5eGbH0GFXq+Ks6/t7B0aTlj?=
 =?us-ascii?Q?ObPtK0g5j5zfnO65pOyTN5KsWVhZAjxt4Xb5ZZn9+SUdfp4d/s0zSdEjET8X?=
 =?us-ascii?Q?PeqOLquEtMvmXLV5YTe7sxULuPmZSzZHt7rbEMPyRwtYFZq0G16xRdQ00HhR?=
 =?us-ascii?Q?vOXcT4FOKi15Rwn6700HvOwusqJdhCWQ/ESb4F4ndn7NwszWyXwl5q2TUiGN?=
 =?us-ascii?Q?zriL3UWUmLiKNDBrp3M1EXfPT6fltioYOy0EBOacqLsGZlIe/aZPIV7e/lnm?=
 =?us-ascii?Q?ox1eQRyc6sf2TgOW0sKPdhj9aRNL4mC9mh8appFKo6WvOaK4PZSROokDVcmZ?=
 =?us-ascii?Q?h34FtekgbgQv2jfyBMrCHn/prr8tfqWpwjsPrCbJxpmAieDJn76cNTb9+V1S?=
 =?us-ascii?Q?jYJlw+CB6C+zo4bGSEkj0twaEchK4VqU77O3Iba6iyLb9Kb1N6iLWLywtLUH?=
 =?us-ascii?Q?2uTJcDErBdESoc1501vmvdOqa0qiDsKvReXfAVI4HQ/IShGDMgl+5cm/33Gp?=
 =?us-ascii?Q?0A5uW4IvonrmlBbCKF4j2cuwbQlMAkXwNjoigOvSEY4hfIn6kreYcWa0ZnFr?=
 =?us-ascii?Q?NgZVjrS5WLydIB6syhR3zYqsymlpnWJUjk86IF/w2H75jN46TRjtVli2Wjw1?=
 =?us-ascii?Q?zLCU+/oxg6DiJA+zL76auq0ZQERwz/Mr5tXiDFJi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a364b0-20f5-4ed1-8075-08ddfa62553f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:30:40.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjduGLZ9H8Mda2y4cEaXUkHYimD5CPS5Woa7wEIbmancr4+rW/zqPxVN6iUdd9KXa2NuYTdpHbsNGSYdFDmMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920
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

Add binding for the i.MX8MP HDMI parallel Audio interface block.

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
Controller compose the HDMI audio pipeline.

In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
index 05442d437755..6211ab8bbb0e 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -49,6 +49,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel audio input port
+
     required:
       - port@0
       - port@1
@@ -98,5 +102,13 @@ examples:
                     remote-endpoint = <&hdmi0_con>;
                 };
             };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&pai_to_hdmi_tx>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
new file mode 100644
index 000000000000..4f99682a308d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Audio Interface
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description:
+  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
+  Audio Subsystem to the HDMI TX Controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: apb
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output to the HDMI TX controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    audio-bridge@32fc4800 {
+        compatible = "fsl,imx8mp-hdmi-pai";
+        reg = <0x32fc4800 0x800>;
+        interrupt-parent = <&irqsteer_hdmi>;
+        interrupts = <14>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+        clock-names = "apb";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+
+        port {
+            pai_to_hdmi_tx: endpoint {
+                remote-endpoint = <&hdmi_tx_from_pai>;
+            };
+        };
+    };
-- 
2.34.1

