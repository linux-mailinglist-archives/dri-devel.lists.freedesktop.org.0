Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995C61914B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612C510E6C4;
	Fri,  4 Nov 2022 06:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717DF10E6C3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1yTJ8//nf5CJo3t2VsIAAcS79aTdElhk15wWMGc0aG51NitdLBi8qL2TRRaf/Pk8jDD41QP/Fhc4YmVL31su3LdOaFnAraIeTqqNPjlwfNWsa8XNE/si0cS62TxLS0yzmJNZQhUPTCgULllluG+ql2bAFHFCeFJmfcIBGN3Lz34yMZ6ZDw9SiHKEMPEisZMgFXElRjIm4ikdbMU/elfyCnZAWYtKZQ1StuKaDPnYyLxq+kpF1ormcHHjHR2M1oWTVOfdPVIca/pt2o1U0tRVUa62cLVO8OQ9URwHLQ2vOyC+MvpR86QkicD/IIl64ghaHYfgNa5v0tMomSHaLAT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnD5Bm8F2xRhyp06cKg2xQtki948J1xHsDaYw24HADA=;
 b=iwgy7yoJsAktya1W34Ly0i7iK097o5OIOVcmwSedyG/RerF2829yia4cZnRFCT8WNT+deXPWPmxo3NSwJhzO0Xgh65Bf7BCE81TTqmtehdeRH9xd7MipsEW/qH1Qhs17nrDEq694HCfyyveOymDSihpWqTetUOcl39N+9Q3YD5RM0qSOhGU+XFIXCWKprCZ88E6mo55F7a5Qf+0Z5aD/aDNx6Sdi1M46nCU9UMvOH1Xi7K+/Q8z3NhqSD68XX0bRhr/Zewlhm7pz9Wd/fXEfbCyMdzKnRqCUPLsPSfxJqAEj1V3SxZhp5EwIPOdOd7CTblKp2fUA+c1rpdctBoGyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnD5Bm8F2xRhyp06cKg2xQtki948J1xHsDaYw24HADA=;
 b=RMdPNPmfjEPlPZSc3J8RvjWuaV6Q+ivntraEOVtCiS4w2zl8BzSHXB/TOB9IX+iOFehHPAf7Y3pyFOG7py6lWngx3pci2UweO0RJs+K+mO/7QL8AtDDVc66iyhPisunx7pDbn+gmF9oIc/t2nHLnFJT1Wrg/6dIHY95ObjK3qkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 06:47:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 06:47:26 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
Subject: [v2 07/10] dts-bindings: phy: Add Cadence HDP-TX DP PHY bindings
Date: Fri,  4 Nov 2022 14:44:57 +0800
Message-Id: <bea6eb888717e1c0a3efc58761b0e75e4104f737.1667463263.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667463263.git.Sandor.yu@nxp.com>
References: <cover.1667463263.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 308e741c-a486-4717-3905-08dabe306f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5bkqY0PeMcoN9JxDtEMSAScRI90G1GFrbe0g3TsRXYK9ODIxrWyvZv0Isbb+Q3sSt8oiIp3ZrZCPdX1E2lEuabrpVv1/13DNC1YWnvULFIia1EE1gbw0DX4mYn3y6HT+aUSgi1ABse+IVAc2U8/DZpHMWeRZ7chnZThtaD+HD6e+nkx8zE9PXm05qz/IOxEb5Ak/oODH4GhqC372dH6q3W1OkjnbvOxEsT/yXkVCU6eI/J+PdxxE1Uy/pp7Ez5QC7HoqGVzl2dD7Xhg0mZod3zHHd34DaXA7+jRb3diPe3o9s0NuzXheWIJ5DsB69BDBm93FJOq2gCNPHtFfsvXKGK3LoYNYCALUIRBYzf52Vhq3k9j0thJkJb25f00CkVC3+4mtZnbq+i7O/2FXqI0xzJWVu+YHUays/qS+jXvF7JbbQ4EWKvAP8QP9NsWKYCJ6IiPsdzqQVNSfo0eWFaKzQp9qnAunJy6S2ELRFdshiUiom7cM1YiHA+nR/pu0fHA+m5HwpJ4+/ouLAlwiDinzxrKKYpcQp9UeNK3Pnr2husqNL7eiFZnlL9b0DzqEM/MMCgWGvSn7ScnUzVwEVLaE7223L9GT7vZoi+YU/j/Ge0Bt2/sojcwpD5WzYQSgNrQXSfNN1BgHdYptP+lnlH29RTwQ8/wMjkFrvMMJQ6OiBRvzR3Lnib3xFcyRY2VSAxGlrDPsKAZVWo8EB2jIh1Pgw7Q/42eEb2TeZYSS0JLucYnfN0CM9C3+ptY/ffAew54MULkJDjWVPJ7K6fUpg9gycBembECpLSJBVOFc7uJlt656h1qPuLv5bp2xf17PLW4VJR8GgeJTzQauV2D37hmWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(316002)(8676002)(38350700002)(7416002)(5660300002)(66556008)(66476007)(38100700002)(4326008)(66946007)(36756003)(8936002)(41300700001)(83380400001)(6666004)(921005)(186003)(2616005)(86362001)(6486002)(26005)(478600001)(6512007)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7JG0NUmGV0ZjYclPp0EBRSNKI5148YFa8mwNxRv43eX+EzHD3wO1CaugrHmv?=
 =?us-ascii?Q?P2g7lo5LYzjLjEbzrBNy8DxgKQ7fSRfegDLY4xrXnq23wXsZH9o2Low48G5y?=
 =?us-ascii?Q?kpOtUTgJGLmV/gcNH94LnNW186F+Pj68dZ889hgJvp5lw5Qp4KJXiWCW0AJi?=
 =?us-ascii?Q?hRxZuY1wnhjtpHKEQuEV93KRKcckG0IL+As9YRpK07sEXroOAujbj6ydJpD1?=
 =?us-ascii?Q?LScnOclcuA93llf5ZlX7YqpRq/AjY2GCHHv8hRGDcaOTk+apZa6rT4u4610u?=
 =?us-ascii?Q?AJUi67P3QmPfZwEDF8Q4hDHz4wl+WeTJzmm7qZpn8aBL4AVkgsV1fJmS5dFA?=
 =?us-ascii?Q?r3rFE+9Nem8ccyQoqOQrXc+oXPtV4ARF/9j3qCJaoIfNh4nHbW2xxn9alWRl?=
 =?us-ascii?Q?L0k4A8iNWkCVDOXZExV5hjwVUZPq7lCfrN7lFdxKu1pmzRsauJMQrbBI3Ma4?=
 =?us-ascii?Q?LhItnc+kSQwMPfe/froj+Cr21kkCvyHh1zHTGkzyNZukHYKuRciBmK8rnVj+?=
 =?us-ascii?Q?O7BL+xNa17qlPTMVfJnWDvOLP2VrTPIZTBpHEPZ1xaCwJ1ilkrnEUmtmhasx?=
 =?us-ascii?Q?cOHO4eZdyb1bptLD4LP35kTHXJ9i8/CJr3/oqgVD1Cgaj25BeVHsHInxnEiy?=
 =?us-ascii?Q?+UjH1c6vHHKiF3kw8PBTb5FeApf4X67xd0uJJcWu0VABgXV7eF5gVrywg88W?=
 =?us-ascii?Q?QiM/CAGUv26iqNpXGWmvruSAH32UlwXoydPbbY3Xx79qoKW6IAgKvGjLdTl9?=
 =?us-ascii?Q?N59BZLCcQ9szy1mvwy2lADSS7ig3CY6xXHkjRQnYlW2tsvzjH5muERaCo5vJ?=
 =?us-ascii?Q?TjXFtWeo+THkw9/GWNEphiX3CAceh4XXDLQk20WWbuxWarQiSSqlnWvQLoXV?=
 =?us-ascii?Q?+CsNPumyjgSsH/9fO68N6eYxOFPAQ3/PIikwCveQrAzWsc928G1DK/1JRF+P?=
 =?us-ascii?Q?h3xuI6eFu1SnuuqVvnth/1lkwzo6tpDaICIXEV3elYvGnHin/6W+zAPSHZ8Q?=
 =?us-ascii?Q?QGfXqELpbthrB1LL8nC9DH06aqM9ADrAxKrPq5+GvERolrxYjBitU+QZ+NAD?=
 =?us-ascii?Q?SY9ZE9kTDnDHN2mgueB6aqsuBMxDXhIsfM21MgPn6wdr1tgKfBdw5mtszE8O?=
 =?us-ascii?Q?EcS3sgkmzLwyduLtkzbnUnqqH5u/ksIrS1iSTmgwXr2KT/xP0/V4A95S20qM?=
 =?us-ascii?Q?nhMIzqQkMPhvPSxQpfhGtC3NUYdN0RyWuD80CJ3vYCZcgbQBct1/SMZm5GkL?=
 =?us-ascii?Q?5Jikw2VdS+tC8sdIJ6t5NrL85HQBYELxSIfg6ZtEWW0lTDr3EciMTIK7nVyd?=
 =?us-ascii?Q?S/C2EgdguxqkqNfF3tZEJqtaQZVGGCp/hbaUnNTqDb4rRESwX5yyRNTMeV08?=
 =?us-ascii?Q?DyIHDuDJZBtOnlBkJHve0BoktwNGO+lXTwvIdeIvkxhW2+nBeX+cs2EN9Ygz?=
 =?us-ascii?Q?MJnDUJUV1XxnE62O7BCfAsHoJMht9kzT1sMcxX0SBi+/nKY9Un9FmWNNuOwS?=
 =?us-ascii?Q?54TJ7v/Y/p1vtp7aRO2uWfvkOyuyiAPpOCeiAZ66CYIoFJ+XnAO6vgVMO0SB?=
 =?us-ascii?Q?F3o9fee/JGjP9m3CgIZWIm6ZkB3kJQr9F6SjfMyp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308e741c-a486-4717-3905-08dabe306f0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 06:47:25.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HPqI/QPJQWgSU1QfuCb+gci0l/Ht/uka5QjP2S1GvWApLLzvIrsqzv4M9Z1kFEPGb6EpfALeoV3zQV1A/yN0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, p.yadav@ti.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence HDP-TX DisplayPort PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/phy-cadence-hdptx-dp.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml
new file mode 100644
index 000000000000..ab6f4e25c425
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-cadence-hdptx-dp.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/phy-cadence-hdptx-dp.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Cadence HDP(HDMI/DisplayPort) TX PHY for DisplayPort protocol binding
+
+description:
+  This binding describes the Cadence HDP-TX PHY for DispalyPort protocol.
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,hdptx-dp-phy
+
+  reg:
+    description:
+      Offset of Cadence HDPTX APB configuration registers.
+
+  clocks:
+    items:
+      description:
+        PHY reference clock. Must contain an entry in clock-names.
+
+  clock-names:
+    items:
+      - const: refclk
+
+  "#phy-cells":
+    const: 0
+
+  cdns,num-lanes:
+    description:
+      Number of lanes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4]
+    default: 4
+
+  cdns,max-bit-rate:
+    description:
+      Maximum DisplayPort link bit rate to use, in Mbps
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2160, 2430, 2700, 3240, 4320, 5400]
+    default: 5400
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: dp_phy@32c00000 {
+        compatible = "cdns,hdptx-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>;
+        clock-names = "refclk";
+        cdns,num-lanes = <4>;
+        cdns,max-bit-rate = <5400>;
+    };
-- 
2.34.1

