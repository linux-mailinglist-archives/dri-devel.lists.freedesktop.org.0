Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D19BAB5C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4CF10E366;
	Mon,  4 Nov 2024 03:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SoOMsLnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B78010E365
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffhtI/UI8cu2FU4ywGwB+MYNAJ76FCdomddWkjLSjRwKBVheq8zWfmDq88WA7/nsTfbM5O29jkVnsllICUyexLVo/YKGt8OGEA6xwozaTOOKOaJEA6dlS+oo9HNUu+ar42t9QcVY3ItVxQJGKpva8Uz0nxevAnA7M+vriH6XZCdPbI2MG4/26ccqXoqzr5qJhbHCb5CQm1bZIvSXb1TO6zCwCXmqvaItRbjNwVupZmYUQAxJH76nZgIIGsKFK8ogFE9epcLvJIflDyOStuFQ3X4Zbds4Hsjpc2raFJU32BwNXVNf+mFzQfHcP9SMyBFTQIVvvWT2oAkQY3rvRkz1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxeX8pGRFBQb+YfN3m7GAR1TOgreB4/tlzwYsaXoYFw=;
 b=jtfHHw8AChT0yVGwVxu410Ajm82ixRNk0Y/F2CtQmDxN/bE7zi5bsMU3SN0jWXQ3X+F4JjEnZ2KALE24powHCLxcSXlENQbs6qYZ3Q9t1fnP8fVWmAwxpC5a88gHLy77t1FoYt5LUpuIp0ofxuSnNlkvExD7FD6oM+lCvXqZRASvpOxIE557CNki6QBM81Jm29BxlTZQurwyVagzqJQ9B/m1UTBHQBxbGl/kUP81/2RbaJBoejS3h5qhRbYpeSwTLaVpR1NkxFj/zOqq8gHWmdBcZ3ELmEpM8YTF3hquGQuD8g5YzG1EyPgyAAOlbhKf8QRxTTyB2Fo6bkLJhqlZ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxeX8pGRFBQb+YfN3m7GAR1TOgreB4/tlzwYsaXoYFw=;
 b=SoOMsLnlWAKBq6EJqsNV6MR1lhOPHb3CkZmCMnD2kl48KHh7A22/Wip8GB9IXw472lkEJyNgfsmL+3nDUGsdOQx6wMg7ClHjzMh8L20zJWaz3kiWeV/aIrsUg7C81fjmME5GbNXlpjMuvJFAY1wnkzoW/WBXzb7fGltAloUuDnEKaQx3RDO4Uzajf9rjenopReXhekVq4LMpYmBgqKLWslcCvKZHzirb5BSdpAeXI5+NxrF64mOUDT8jpsyo3Pcs9+/Td2Hjr2uQas9vcDODiZrRCfCYBc4aj52mnE0VYv7AUFaXdjteqROoYeUHpvcITXGdNiLfn18JIhyqJtVQFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:30:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:30:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 09/13] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
Date: Mon,  4 Nov 2024 11:28:02 +0800
Message-Id: <20241104032806.611890-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: d6391948-b013-4923-3f13-08dcfc80f65b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oM0lv0kPURxU+d35bnN4WKRQjuqeZ1pE0JnB9bkibsIRbeirF9u0B7YWz6yq?=
 =?us-ascii?Q?uGHKM1UmCkkPFhTUcfMGB41qFnTzyy+HNCZBXbnUQmeYPOCYwzX1agbb4Xge?=
 =?us-ascii?Q?poBnSuPtv1tyOZVSIWnxc/2r23jgpiZR4BFM35gdPMn/sl+bMQiEqvSwDvl7?=
 =?us-ascii?Q?uS+7vLNa/LZrypWM7W/SwJSzB8ld/77L5idC8Q+aWyH9HcFP9Lot1YAqwH/x?=
 =?us-ascii?Q?k1dfH89k+lvN6Tm3D0vOXv5ShKfWRXBt6Asi0jv5PLsRwmwMmd/QyEIHQgVa?=
 =?us-ascii?Q?zWqhKyjkGHAhcOdqOf9wjqUcabCPy3mmw1W8Ij3PzU5oG1CvBJXfmLQn4CDg?=
 =?us-ascii?Q?DZV353Co9aCS5gzBPISM23e0T4kZsdxdVL4RiXTp0sfEHs3kDOE/VvNDLsK2?=
 =?us-ascii?Q?lLq11qP365lwmT6t5z8vQan8Wmjv2LC2a9czil5kL1+74uIVkvzCcO+VIe4w?=
 =?us-ascii?Q?lHJLB5EIZfVsdiuR+joFvx53MYiC9GZUYQuiZd3rH2nrPTJIqONuHag9yucV?=
 =?us-ascii?Q?CUASCzs5hgYI8UQsOi1pXNm5objut2/5ol5LcgC2MDNC2XtcMuHIpJVkGRBS?=
 =?us-ascii?Q?EH7UOoURl/i7B4iIcAYdCSJauRIh8bi2UjT6E0qA6Q4hyPNUBCEBK0ESdNQn?=
 =?us-ascii?Q?HWUwsSs9zuwAK5cHtmn05Oylin1MmkUUFlcdyvRk2ljCF++60FfFhQxJqKX/?=
 =?us-ascii?Q?2nSDYe+O2Opb+eRJVHxpviMLStjUM8od0OI/XxtBR4D7bnlFtXE5tNQZsu+W?=
 =?us-ascii?Q?oQRzfKqhwwOlldqRHtRFEQoL+lumHu+ekkuXB+yG8tqO50AnNliPCf5cTrTB?=
 =?us-ascii?Q?P1uP/1VPVPanYwUcq+llTHWYCaH+GZcXQGlNrAdAaUS2zRmhcJS+lzfuTaMh?=
 =?us-ascii?Q?+jDfv0gplwYta+jxADM5VMg6PnBna+TRsddAcsROo2RC/lxysC713Fy2yh8M?=
 =?us-ascii?Q?bQsrhQ3TorJEe4fAGfHsEacjLIlDTGegfBqEPK3eOYyR0eEXMBi7gqou4zEz?=
 =?us-ascii?Q?ARrhkfEPCYIdGEvKvApkgMxuENql2k5d7sQzSLLFWFRWiw0HOoSVhedp8Yy4?=
 =?us-ascii?Q?HfFzJHzhpnqAvaHgX39q3RINM4wJVTTs54u078bwbFrP741TyF5GPeLcsLKD?=
 =?us-ascii?Q?xJupjZeJxeuRtPKJMFf4IjPs7otCr9ccfCxSfG3uiKfqR2ih7NFLxiaN3yZ4?=
 =?us-ascii?Q?u4IUhbzwdbvzh0ijfbM/UG/JUBrCqJrcRmdcsjtmksDRVcRL83RJfZM1lFLI?=
 =?us-ascii?Q?h9viXwPBqE+xnznh7lrK2aiumfakNtOsdWWR3c4fvIBv+oGuLYKEi2AFYyk1?=
 =?us-ascii?Q?x8ayNtaj3jAPio0/01JwpoK1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MYPcVY6bAQbfGVSPnzvIdJVpnb0/qtafvGqd5OpULRU1dvzqn/r1R2hK4TkK?=
 =?us-ascii?Q?o+mArrumOyRZOrFCsUmAKsgPiEgmg7WQAkYxFll3YTt5MV4YsfG5Xe+XV2WN?=
 =?us-ascii?Q?pOG6iZyd9yOOIqJfo1D5BWd3NagsVEeLjjK0P6qGFQ2s/PtVrvXnN/Mp5iEF?=
 =?us-ascii?Q?UD0mZyF8Uq1LVqk7k/SDfBM9W+LAPqylAn/gRwOj3olR8qjxdBcggqk4vI+i?=
 =?us-ascii?Q?QhT/Ht04YSWJs5etavTxiVJFEJyyvVdpXc5KBXpMStI76OJRZHsowkt5lDYb?=
 =?us-ascii?Q?hwj1uSzYJ5oCKHxcbjDpz60tRH2MO2W1FndkrC53lZdzhdKhoA+GM9n+H65G?=
 =?us-ascii?Q?ITjPRv1T9u5ii0clDSxeV5GPm9M0FWuunOv/eCJ3LU9OgTu314kjx941Pxoc?=
 =?us-ascii?Q?2+QGO/TZCrMCvDbPRjtPjd5bEwcFE/dhJ/Xy7QjkvOm6CmeI6WRu4tbp11tg?=
 =?us-ascii?Q?L+8BEQvdyHz1b5iDBcVAVshIX2bh3COooJbTPwjYPWaIT+hsHGuIKvE80f2m?=
 =?us-ascii?Q?acN8qhyU7YahjXgD4okEWa77UDrqUEWicQKLfTWlxPQq7y8NlPXUjL2aOWUY?=
 =?us-ascii?Q?k+lcRKFqA09BEscLGYr9ZwRqDMQn0KS6ok9UMuOCKKEGt/PJDuA7SJeggqpl?=
 =?us-ascii?Q?LCDZiqcVesC5e7cBy761+ecFDxB2xGCE+Fw00k5YhRMDvNPatKzlyTkur+9D?=
 =?us-ascii?Q?A1DWiybXwdVIJvpgyvxBAnY7iAAv39kPvheP6z4G2T7pDWG5Fq8mzcfAArIN?=
 =?us-ascii?Q?weosb99cqw8fxh6N6Z75SHQBoQfUnRsLs2kp8SRKfzy/ODTfcky/5IZCVGR7?=
 =?us-ascii?Q?UacJ8+psLdwAZUQ3QGTf9qPnArCwI9r1ZWJ4nvnpWlzjrPlKIX1wpheBFKTv?=
 =?us-ascii?Q?FLq804rsYaKy4U+P3fBRDMvgn7gLtFTpstBo3O4PChA49H4Gp4CGwfAjKfs1?=
 =?us-ascii?Q?3AC1aksM4xYypJKpbHqSCxa0bkBbf18qVqLGCdrMs+IzHC1gA7OumoOif+71?=
 =?us-ascii?Q?SwF1TCZlJecNvrGOqK+rc+TDgAGT65f8thB6UAjjPwa8Bp/KOwdDREYSKZnC?=
 =?us-ascii?Q?/Gi+5upsYfmj5XWLsype+xlDqJbe8HuQSM99PcIjkZ4o4Kg8+BiTIEmFA5FC?=
 =?us-ascii?Q?bVbfHIxTc9N6lDf7diGf3aDqXz/cVs3asjw/hrJPhsaOM7C7xit7iORjvxrw?=
 =?us-ascii?Q?Nccmes1cQzhBzqLXBFCrgOCOuETdRyPOpOEoLy8sJQzVQ3xha5ud1DNpPwKA?=
 =?us-ascii?Q?jSlAiVt5za5Lu0vCeCI/6LhwKdkluQ30bvvIPCB5u8VxFgsgJksgk4cQYFDG?=
 =?us-ascii?Q?Oop8Xe//qC9ZXQ6ViWo3lM21K8amZpiioX3ndYPg+jHal8d06DsMTFEmB+Xk?=
 =?us-ascii?Q?xbaa0NDExAxs+WcMq2cpCPYGfJuf/40ql5N2IoePM/T/G/0/D5PL+moSndYj?=
 =?us-ascii?Q?i2Xs46LIPbgCMgWJLIctl/w7crBA1LDtpG7sc7RBgAPAN5bhgWSMm+YsX7/m?=
 =?us-ascii?Q?vbYesemCLgv5lZiLuvp1RFc/ASdLcyZbf6qogNB17SHuVb1zFn5rxhgi43F7?=
 =?us-ascii?Q?zWsT/tcIdOit1zq9OGsJjIvGVP97bqXOAdBTh9C3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6391948-b013-4923-3f13-08dcfc80f65b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:30:00.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+fHRWfRlqIn+vBYnfnegMxxSko1eL0ysbb2AsbVVmN5Tc/0KkQbt3j+HryneY7W+RLXjQkyG1r5xDUdVAAhuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

Document ITE IT6263 LVDS to HDMI converter.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
* Collect Biju's and Rob's R-b tags.

v4:
* Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for
  port@1.
* Drop "data-mirror: true"(30-bit LVDS data bit order is not reversed).

v3:
* Reference lvds-dual-ports.yaml.  (Dmitry)
* Add data-mapping DT property.  (Dmitry, Biju)
* Allow data-mirror.
* Drop ite,lvds-link-num-data-lanes DT property.  (Dmitry, Biju)

v2:
* Document number of LVDS link data lanes.  (Biju)
* Simplify ports property by dropping "oneOf".  (Rob)

 .../bindings/display/bridge/ite,it6263.yaml   | 250 ++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
new file mode 100644
index 000000000000..0a10e10d80ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
@@ -0,0 +1,250 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT6263 LVDS to HDMI converter
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
+  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
+  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
+  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
+  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
+  1.2 and backward compatible with DVI 1.0 specification.
+
+  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
+  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
+  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
+
+  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
+  provided by the IT6263 in two interfaces: the four I2S input ports or the
+  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
+  is supported at up to 768KHz.
+
+allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
+
+properties:
+  compatible:
+    const: ite,it6263
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: audio master clock
+
+  clock-names:
+    const: mclk
+
+  data-mapping:
+    enum:
+      - jeida-18
+      - jeida-24
+      - jeida-30
+      - vesa-24
+      - vesa-30
+
+  reset-gpios:
+    maxItems: 1
+
+  ivdd-supply:
+    description: 1.8V digital logic power
+
+  ovdd-supply:
+    description: 3.3V I/O pin power
+
+  txavcc18-supply:
+    description: 1.8V HDMI analog frontend power
+
+  txavcc33-supply:
+    description: 3.3V HDMI analog frontend power
+
+  pvcc1-supply:
+    description: 1.8V HDMI frontend core PLL power
+
+  pvcc2-supply:
+    description: 1.8V HDMI frontend filter PLL power
+
+  avcc-supply:
+    description: 3.3V LVDS frontend power
+
+  anvdd-supply:
+    description: 1.8V LVDS frontend analog power
+
+  apvdd-supply:
+    description: 1.8V LVDS frontend PLL power
+
+  "#sound-dai-cells":
+    const: 0
+
+  ite,i2s-audio-fifo-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      Each array element indicates the pin number of an I2S serial data input
+      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
+
+  ite,rl-channel-swap-audio-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    uniqueItems: true
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      Each array element indicates an audio source whose right channel and left
+      channel are swapped by this converter. For I2S, the element is the pin
+      number of an I2S serial data input line. For S/PDIF, the element is always
+      0.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0: true
+
+      port@1:
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: video port for the HDMI output
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: sound input port
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - data-mapping
+  - ivdd-supply
+  - ovdd-supply
+  - txavcc18-supply
+  - txavcc33-supply
+  - pvcc1-supply
+  - pvcc2-supply
+  - avcc-supply
+  - anvdd-supply
+  - apvdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* single-link LVDS input */
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi@4c {
+            compatible = "ite,it6263";
+            reg = <0x4c>;
+            data-mapping = "jeida-24";
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&reg_buck5>;
+            ovdd-supply = <&reg_vext_3v3>;
+            txavcc18-supply = <&reg_buck5>;
+            txavcc33-supply = <&reg_vext_3v3>;
+            pvcc1-supply = <&reg_buck5>;
+            pvcc2-supply = <&reg_buck5>;
+            avcc-supply = <&reg_vext_3v3>;
+            anvdd-supply = <&reg_buck5>;
+            apvdd-supply = <&reg_buck5>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    it6263_lvds_link1: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch0>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    it6263_out: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    /* dual-link LVDS input */
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi@4c {
+            compatible = "ite,it6263";
+            reg = <0x4c>;
+            data-mapping = "jeida-24";
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&reg_buck5>;
+            ovdd-supply = <&reg_vext_3v3>;
+            txavcc18-supply = <&reg_buck5>;
+            txavcc33-supply = <&reg_vext_3v3>;
+            pvcc1-supply = <&reg_buck5>;
+            pvcc2-supply = <&reg_buck5>;
+            avcc-supply = <&reg_vext_3v3>;
+            anvdd-supply = <&reg_buck5>;
+            apvdd-supply = <&reg_buck5>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dual-lvds-odd-pixels;
+
+                    it6263_lvds_link1_dual: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dual-lvds-even-pixels;
+
+                    it6263_lvds_link2_dual: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch1>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    it6263_out_dual: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

