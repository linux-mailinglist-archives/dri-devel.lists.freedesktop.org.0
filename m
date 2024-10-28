Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BCF9B22EA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8808810E31A;
	Mon, 28 Oct 2024 02:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="H+Pw+XpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8182510E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg+Is3jIVqE5r6XCc545amvgsv0FznjKsl9TrgBuQTf6TfGGA0Ch6C7Dl5dunvzQ5X6tdBfBvawb9b+B6WSi0o+f/N0GeWW88vTF/XSzvA6qxUUPxvYOrdfgORBeReLpBV4g52LOmMmLG8qWcO9HYQl9JAas1JEEAIwO99C6KG00ChLmZBNq+jbvK4yUEfoaCtDtGPLG906gNMF8L9hbEvgFvnFmo8apYV5PsrwoXNBEcLZdXyscrNl9NNUhoPtwbEdipRO/evwMICabuLlwUq9F/EL5OYL2MZvl9hwr+qHEtuAlp7A5/RHybLtenQDh4UDowTE4Ht4LLV5fLxPJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+1a495inYw7VVLlNvDjNC6p6Qn+6KBgA9h3BNyVCvg=;
 b=UQXy5Fbhp6nNDjmjNaS65RsL//uiCEXQryygTJ9ySY2nGvzC0d2g2xLpnkuk6aMNsozZ5LOkWImw71jGpTbU4199xG3dkkIq9s9bHuyuaqbmM7khKBs9T2Qabg7jLMong6RpTEBojKYGI1JXr1a97KnmFb8ugV6MSDFx47MgXHeHHblW0ISKg7oUbu4DfS3dxBcWf+sYkM/K0IGIx4iGBjHdnNLFi/hefw+BLKX9SOJKEt6/ebyX2L56guv12n4SkdhvPLiP06mF6ySZx1O9rjb5FJLMATe357HH2q6YA3idFlt5SgFKObm8M5fTfISqZga+1C+HRMLz4KFQbAsJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+1a495inYw7VVLlNvDjNC6p6Qn+6KBgA9h3BNyVCvg=;
 b=H+Pw+XpA3Q0byhTe3nK8hVO7TWkVzvwlPMkfsMSQ34C0/An5Q2LVFE8iBoYvMGrJUJlYnOfsEcC30I7j9tVpluqdmIJshbzC6t8m02t6sVHg3vBsPJWRMDCoxzZPvNN+zh8ju7fHfbPTvp6wy58ABCH93rNhnNcgnb0VsIsAjwdAUrmK9kY5d3/7akre3Axbcga9/ih0kAHURvBeVtsk4anLHtRrrDVwjy82siaYqlJ7FodJhD7SW/ghv74V4uUhde1Wvt0ge26B847Lqml17dV8GqFmKJNoDzBU02T0wPNFUE4b1/HdGouQ9W7AxMn74y8mc0EPgf6IPQ7Naz4aHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 02:39:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:39:23 +0000
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
Subject: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
Date: Mon, 28 Oct 2024 10:37:36 +0800
Message-Id: <20241028023740.19732-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: e78e0f2b-0cdd-42b3-ec22-08dcf6f9bb7c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EcY8nK3iJZeiDScnN0N1kSLr25hjrdHuCP7/lK/hJQVXMwAx8YoVkNkzTRSD?=
 =?us-ascii?Q?mLZOxKZTtS/w5FKHWAXpIeGrBOXFhDwulzXJwi7KC0YTsHHFP7N7DqzQRlq8?=
 =?us-ascii?Q?vdz4/5PdjqDnwiLC0Itpd8kvpgFbipbUxg+pgQh0IKzebmXLMAAYc648GEb2?=
 =?us-ascii?Q?83owK3+iudEhgcxY2+vFWHmLhBUnh7tAE9SEXamplNHVDqyR+WXdmwCoZ5f9?=
 =?us-ascii?Q?uPerQfuPZqX5YXHZLqaEysnkdknmFA6qg+g+BEnfKQ8dNBjROwA06ZScYS3r?=
 =?us-ascii?Q?wYLuZbbY+urR1uw+3wMRhmTVRjCpUDgzAcGmdh+KCvXfEeC3IcdfU9UZDa0W?=
 =?us-ascii?Q?4vlXcwtWacvMGQoPEvsDWFZY9m0cclUmImfvTEt+1+b2VVa6c8eZM6HhOTJw?=
 =?us-ascii?Q?+uEeCqAcQkBvk5Y9lpnumQirhSb/+wTeJkhYERfZ9sndPt+t1x8u8z7scnzP?=
 =?us-ascii?Q?Y2ezekOya67c6SNJBa4RJltjhhmsRqbr2+Z21tzrSxn0+vVI0WuyvPhLU6jT?=
 =?us-ascii?Q?r1CK1M0wZseyKQJlZSm7cr95dXOovWTMCkokeoOo8wBfi6pFo/VG3DmAsQ2+?=
 =?us-ascii?Q?cHNM3mgbr6CY4YcKr2XoLaOkgqqDStamRiuTwXEyYB4WWk0jbOHYPxMrY7ga?=
 =?us-ascii?Q?X5x/XsujEAEyRdMF8By5/WVslAJe2NB7S27DogmdVfGIK4VxY67/chW3hSQf?=
 =?us-ascii?Q?+kPxxHYghs5nclO9GbleGhVlEX3vIGWUkkY+BJqVnyZQeSpxEmsctDRKOtvR?=
 =?us-ascii?Q?LsjJ0mb+niRjI1lG7H+beIW5yuvAL60iyDpjZDBFiaIMF7AatGbaXxJTPlhR?=
 =?us-ascii?Q?FkPbQ88giiPNMvQCD4hW8mR+Hu2QYJssaay1gLBz5e+lw8IrNbKzk+JrMm47?=
 =?us-ascii?Q?SvRk3r9ogdAL+qSb0dezwQinBo6Dkf65W75bhhDGdfwxdQp6h0SfD8wM6O6s?=
 =?us-ascii?Q?yAsj+vZ5RONbr6uIUCd/CdsTuoqemcBIJcPMbL9lP9HDNwKFZReuR0cYNAqe?=
 =?us-ascii?Q?cHq+RGtBpUIVnnlrFSJYPhReR9JweugxsCPUVG5ViKvliGcJCISPe80BicNl?=
 =?us-ascii?Q?bk2hwJ8QWXNUQP9j/crMxdLHJTvP9LWWpZn3FMt97n8aoSafLuQ0JnqyLU7S?=
 =?us-ascii?Q?wJGFx2De90Tjv8B0yS6Wz9pMmUA3kOtAADJD9ui6rF9uvJvpZBhiBACGxrYc?=
 =?us-ascii?Q?TKONQ0xtmMFRv4yS+evMenrWB8APPRwFAWTW51UZMI4d4JfRLJrFimu48zlq?=
 =?us-ascii?Q?qjOfnCdsBIMahsxgQv36C3CRo1fzTF55NYc5vvhyT+r4ipaXOpd25krQBpRL?=
 =?us-ascii?Q?lmulGPWKEbZG9dCvW6+wxFG5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H34y2JFIcY3337W7AHOgmVp/5byvwmY9dsc2690aP2JX3stB7dV1lapS2V0J?=
 =?us-ascii?Q?PdoN3sc7CbJr4ozBhewZ6F8pIb0sx2ajPNzqh7gGN1wRT7wrNpdrYJCVKGWH?=
 =?us-ascii?Q?p7IEqjLI09uVNTVeewUbKNk7sv1t6b5Cwj4s9AtNHlXWLInkCGi6bsxbM/+6?=
 =?us-ascii?Q?fF6J/zSYyuHprgPD0SgENcKwPhuJgenpTh1Eav2L3kwe4PnLDEFxPZPDLo3z?=
 =?us-ascii?Q?OvCAVOKwU04Sgp2u3vjSwknHeoAKPPtqng9+va1S7MvWCV26HzMcv+a/NTvD?=
 =?us-ascii?Q?/EvjvR9105YroUV5PRPBLBl2pljMYAAGxqqGJc8fHOAoHPyDOA0IC9i3MJMJ?=
 =?us-ascii?Q?ioFOTGRu9NDnZW7JGKevU1n6JUjKfxnL2hpfeJl6MdVTxCr30K+JK7OlN8TJ?=
 =?us-ascii?Q?/yP0YY/QOlQnlgAXue8BAp1+qdI+jNuPpX+lc2XLIhBREBGNBUXc2luQSkWU?=
 =?us-ascii?Q?qHcTXf3kVDyvEDHWIrm1NDk/6HWPD80HBWqvXTJhSBiNrrsx8EAAZOmi6YSy?=
 =?us-ascii?Q?9SFndz4TDLhym6cguXA9kjdqqRFrUeUez+W74vkwpdGW0+20mSw82ivrVNhS?=
 =?us-ascii?Q?YDagm6v2PkE0Ec3RyUtl5S4HOd3akEmBWYRVw04S/YkCXuz3foI+1Q2vhepY?=
 =?us-ascii?Q?M9n2cwht3UIQODCeZqyTYAmdTbGEEXknVLlXtLg37xbGo6lHoeRmRlIN+04S?=
 =?us-ascii?Q?orCkxR2lTvS2UbY/6T03ELMxOOCe4CrW2RIY1MVx1ildJ+0RC9pwP8A7u/l6?=
 =?us-ascii?Q?QktyiT5asBsXBMwpaLKGdFNuhc9s/isCRVJ8OUsGcFrF2dTBIudV9ux1uf1k?=
 =?us-ascii?Q?m+8fTOFzuKWaQmudlpv9aZy/DBh+GmdBv5XIddZcY2XCd1ZZS93J/aL+lrTI?=
 =?us-ascii?Q?I+i7lhjloJotR5OqVJpoMvk5bhb2OMz36ugYDslrDvzNGMTGzu4duSJNCAUY?=
 =?us-ascii?Q?AeMSe1uZ11Uh0CAlLbMblSKSpLs+O8vHoz1GCl5blnLI1LvIFDR/WhbWUt88?=
 =?us-ascii?Q?hsayBKO3xpMpM5AdwFht7cgg3xVqxYDbh5H5gWw3xETFySVN6jjrKKHcoTnJ?=
 =?us-ascii?Q?5FGOVBI7UKDrQpuViPT9ouIVJFCAM89HZ1Roq0zl6r6TuEXHBqyXAtfzjMyM?=
 =?us-ascii?Q?IXpANVGSMr3fWRxZtIZPyxZBDn+y1fvzQTH7iJjsZt56egsRDoG1IdJwL9Or?=
 =?us-ascii?Q?WL3dwNoQUhf5CUR8c1aQlpOu+5np8zaZp96690SIsuD9pTqA8uGFtm+TeETW?=
 =?us-ascii?Q?2VdiGXahaJkg86bmyADckYAnhEb9eItYq2myxuXTQJlDA5wfdlhRYLIrnwtD?=
 =?us-ascii?Q?HRqIF+RTooZjKgwgWAkB565j9muGe5Ur1RGm7ypNbPrlH+AdU9dTY2ExFA+S?=
 =?us-ascii?Q?hC8Mi8fxaZTDFaXIR90lpUIp3UHlwcrR+sQMptsdNDwEj6OckmOJxKPlrQm4?=
 =?us-ascii?Q?gzwZbXSpZuDzpqxZ+lZm4YCMWdcDrtaCKTqBMiWcoR0UGjYGDwv+/IL8GMyL?=
 =?us-ascii?Q?h7b+egjLr5ygvv/eXoT7w2pUl4DYfp1wLJ7Sg2YbjcTeYhQTuNyJgXEDMhcL?=
 =?us-ascii?Q?ZdjBHmEJvra2mTa0v7XSB9quLdd+8w3+JxDOuFtQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78e0f2b-0cdd-42b3-ec22-08dcf6f9bb7c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:39:23.5311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW/5ScHla16LaStCTDU3JFK8OLcMuNr/b53S1WyFbEswJfk9PvLUlpD+QjWWGRuEYfkmgY1TqZwpEPypyVf25Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902
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
---
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

