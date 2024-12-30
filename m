Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA89FE1CA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D0E10E44C;
	Mon, 30 Dec 2024 02:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ladIXU5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2059.outbound.protection.outlook.com [40.107.241.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094B410E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht4/BBxyCiwdseMg5uhUIIJAJtfNXVn/jOXx1QeP7vyJklSZdm4SGg2pMCRFlplnAqx/1oJCu9sy4IuYetwHU95UVb2v1kXll7HUjWDHhuGXBQv3q8yC/cvgPDwbUo2n0eLOFATcNi9Djc5mDqre0pWn3u/lZjI6vj/PPb75MaoW0DTUTGEVtd86GLMAytEblPam7O3b0KYZPT7QPVs55HtVplzg9upzSpomMXfjBkZUJlI1QzZqSUu8dKdauiixdqqd/IJFlF1VFWiFoX61Xeq7UL4P2YWypCxC8u/q2TxaR/PGxBa4NkKbJLJPkcwGmugI/eay8f0TNnN9g41fDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpTfpkDr44PgXAMiNe7D2DmBpDq4kFdDtA23EOR0d8I=;
 b=iSbVKcw+n4yeHwIblRPJGG7tle/L0OeqWsuQxh320L2V4okCEhsPMkbvgDtWnBBKrszcjeanViwRasJ9/PuENaJSRNW7sefZErbGEy3aB7PsdpbNkVj7TLFKsaCP4VcYtS6jU4m0uWhiDLkMxEG5w2JvktJ8+twuRuv+QDsvhLA1K/gdd7mg30lYjVWPcvxsBYBfpbjV8U8eVUzj8AarEfZNxuzcGCS5Ltlal+5WmAE/D2ui7gv58UlrKNUO4aYPDIJtZCw5zpR+jN3cviwtgY8dyDePpE0N+XpXqn/I4/o+dL4iD1wyqZVuKtcGtQ4iisDVNIGs6Qqq2UA1Aj96cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpTfpkDr44PgXAMiNe7D2DmBpDq4kFdDtA23EOR0d8I=;
 b=ladIXU5rXhA3ydfR8Unp2rmfiD9bkUDI7a7mCXvSStjr/ILIv2nuaArpm9nJ4pOirXiFHiOnz9gPwoMUtaPHgCH+evQsWjGYqPGYETVK4+5jbmSnarNIUnpkNa4DwKgUDqdwWIrSeTiD8pfYsdGL6LHp2sTz/ndWA6bZQf1MHUcCvLx55F4Puvz/Ykv1CYzdFKsPTTUi1EzDMlHvXIYgLsbgCrUwTT64PYqLepIqHYZNfCNm9+3LkKb4tuqfrOM4+Z/VDybBv8Z14j1Yoh4pee1VtKmvuSvqlCq2udMLA6HQ4bWCyhCo8DY3vgZpGKA25R8jA7/8Bj8Zx4IRuGVHlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v8 05/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller AXI performance counter
Date: Mon, 30 Dec 2024 10:11:53 +0800
Message-Id: <20241230021207.220144-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ca1328-1db0-4bb3-5363-08dd2877716b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BYu2fuMu7HEevoygesVocAc3kAE+Y/vqbDBCVFbSihCwVQvYMyplPKVMDf7o?=
 =?us-ascii?Q?z3wLppnvgjF+goSDEcDSkrVVCkN9EQnJA0Lm/cFRKDTvR97UEuFEYVne7hGB?=
 =?us-ascii?Q?C6HsVyg6ToUPkdmTI/0IDKEgVrQhX7XphF9vpLe/OEXokgkUoLZHaZRYj6mi?=
 =?us-ascii?Q?fnzxvUqx9pJCSyxC3ajxOeSHkG+70xvAJKqKtDX2dI8Oxqb+vwVlm4ylgPF5?=
 =?us-ascii?Q?2ag0d7CiMMYewjwlt1v2MqhwamrVcmC5pWeAoElT2HG0+Nn+R7cHyXScdjDS?=
 =?us-ascii?Q?f9K4XJ/9cJqx7mWFFyNn/pLtZmtQIMD9AtVSJmB96Cfp5EmHpskwWTZuBmas?=
 =?us-ascii?Q?IoslXU1QsdFYSXvK2xqZsNSTC9Xy36A4DMOi8E3ZFwu7GWvM46XMkfOLOQ6x?=
 =?us-ascii?Q?D+5qRtPzaFp0S9k3YTgTnngTZ6D0ufKGqYC8C7uSi9ZsEqO49bmeHMKQBs3S?=
 =?us-ascii?Q?5b8/Fd+on2IY78c9NDzxbgZBKXop/6EVmiOLuygwM9/78cNrjwWOK2jmRENJ?=
 =?us-ascii?Q?g+hFa4e5zNG4g6VhCmkT/9GZGd2G86S6MyFsF0m6C6EoPqqHpDhAgd77oMs+?=
 =?us-ascii?Q?RV8/0+8Ta50tZ1yp1j6zeyVqXwMt7wVteX0u7UZXqwXMUK0ze8IQiPuFT0Zg?=
 =?us-ascii?Q?QAzpSo9dcLz+n4mImYedFgPl8K8NURC0MkaYLVq+w3vaBKmfItmaULz+yp4y?=
 =?us-ascii?Q?OSg06gD4AzxuVqjaPHTnPbDMUnW0Ez0pZTRzl46Gn2fECRo75Fm4dmCSeUay?=
 =?us-ascii?Q?0kCcgpVUhapDEtOHKe5enXwT9+rvPjABNQ8KlqtSUWoDJtObOPdVHLePyqk3?=
 =?us-ascii?Q?yy6zWRNVMzlPDcCi9AOpZl85A/KJ8RlVwSn/c2eP7ZKeTxiegI2hks09sO8t?=
 =?us-ascii?Q?lNj/8fXLMMFfawWoho7NsdjJI9DTv9GjTU+4RiXTi+xKvbtof2M9fTNffbcM?=
 =?us-ascii?Q?EwR3xTp+CkOPjy+Xs4IPCMIuofHYreKSRjd6fcxjg4WTSxeoWk6WgNWW9jFO?=
 =?us-ascii?Q?IzzRrXPTXP3EukAIkxjRy4EwkzU2FuHj8J9LCReUhdZY4MkfpLFsB+nnh9Gf?=
 =?us-ascii?Q?3WueSASgfnSQPRJ1Oka+0Y+p/bEoJhzKTi1I//qlIGY0RnrYE6TIcuHVOols?=
 =?us-ascii?Q?4sAd6bwT2D9r7+yY54Too+9Kn78s0w8m2EipVZnB/si7GRFU6KHRuwtBufUG?=
 =?us-ascii?Q?q1Cz3defiNJ4HpyeAW9YLhn/zl3KuWNjK+Se1U/Aa0zNaA6IBt0iHM3ir+XB?=
 =?us-ascii?Q?+ClI9aZu1yHtO7B9X346BuvK4XOX+QesTPxfN2JRjZomsQ1GyikuhCKaY/iF?=
 =?us-ascii?Q?SC89wH1hLAr0WcqKC7tyaYWoY8GniRGceJVSoLFhs3cQmpr8N0Xcb3ANnIoz?=
 =?us-ascii?Q?Lk2qj8yK9PsI9lAovsCwCejAS+YO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nPM46EKhMqD64PMANrjwvxG/oj2iEBbQ7loCCgfpmcC/ulCfhEnqlY1H5yVr?=
 =?us-ascii?Q?UYgL1xl3lMjzgMvfNM8Pfz9iKqgxClLlMVjdr0TeDCFquHU1vA+UJF7mwGt3?=
 =?us-ascii?Q?W2eFKypf0vfBuzyqSjNxoZIA6evtIajqq+BoHprNw0bZ7AxsWYeN4NDfZVg5?=
 =?us-ascii?Q?MZYghFuWQs2gixJsE/FHggma3Ykws8C26LnkUznuRQaB9UYzUG1en2Ii6XUk?=
 =?us-ascii?Q?doyv6jUl6wNGxsWPDl0T6Q+yfxtZec/FbL8304E5dJ2ajmSYRkJ9HbIo2IE9?=
 =?us-ascii?Q?QDEPLeLuxoq5F4SSmRc0HgF6bLWz4J3UNb1csjIqnTrOq+zN2AUY4A2Tzwnq?=
 =?us-ascii?Q?r8i9QnGrx+sSCWtHS8FsX2YMOcD2JPg0Q94IzCUlCif6ELhwRE25Th0qFM3X?=
 =?us-ascii?Q?Wv15NNDZV+t1XE110+ZSuJbsHAqgkrwyuqR8rXBdVgktX08KXxUw8FpWbcnE?=
 =?us-ascii?Q?9nlKB1jCX6TVPvNn7oCI++EYAVCfmXuoZreENFlueKxQIkAcCjIglxqPy5e3?=
 =?us-ascii?Q?PoXjTPyikaLjUrJyW7HMtvOWeYrxl9s9duI8kRUiJgM4qBTNMVOpLOU8VL3c?=
 =?us-ascii?Q?ouPq8M2PoBqI+PYcMkoHcp0VXdK9XuTRaW19p7+6gvUnXm7zcq/rJ1+viUTg?=
 =?us-ascii?Q?tSPMvuhLGjVlUwO8yyQ8L9YDaPfk6PvGhSz2wUGw2IFyuPSRhxi7EdFRrq64?=
 =?us-ascii?Q?MsDQKer1vw7SUI6+lN4DM2HGlpLVpp+UtOd9F9YLqZtoUNMP/gXOUh/+6eoW?=
 =?us-ascii?Q?94Ca4cX/mUj441T8A/84c/ZSc03HFc4iEICaYFOVuwh9IO6Iu/aXGKSGzddP?=
 =?us-ascii?Q?c5l/IuyJNkzcq4Yv8+21sZrH0sIY4IJqTUuSVnKtb/vHm18p7QGrQgsf9p5H?=
 =?us-ascii?Q?+Iit9cE2D721u7AqY2HkZ+NTpPnmEWPxkRSIJ+zNjD4+Ex5HFocW+OBcdqe4?=
 =?us-ascii?Q?UohA5rBOxk/X4e2ZVfToE8Z4bnSVqR57ADMeM9ONdduqLBZkgrsolDJYH27e?=
 =?us-ascii?Q?xBjR6lmuWLdBOEGNwzZW4R5kF3CqymRFFEECYfboLfLZUUilF5Vm0ZRf0Esp?=
 =?us-ascii?Q?tQZFGblCrosF8fb4WPll3oWgFksW6Je3Pz3HbqK8R32LPiqSt9bynimsZVVC?=
 =?us-ascii?Q?EU6Xz2yJay51MMek6123oZsNspv2gNl7nH69fADmF+ZaPU9BiYJnBM6c1Zku?=
 =?us-ascii?Q?HBCiqQUNs8WBEE7/PcUzDviPK1LRlEiYPLK0D1x/v2I15XXb0em4KlErScFe?=
 =?us-ascii?Q?dkla7Hq+t+k1ghFtvrzd34vUSYmshZrMdhHC6igZsttNCqi1Sjy/sTG9fA+Z?=
 =?us-ascii?Q?4VtRbPdZFEgNn9+wIqQAn9DLLuMH574M5lSD1lvUoGvCaz+NKSD1hSlKa+cS?=
 =?us-ascii?Q?ymhJUyPIWc7u2vaPFwf8nv7IzAwQGhHcggT3zj+HHYSRXQy5bUAhJxyhZaXR?=
 =?us-ascii?Q?op46attpJ4e3H2GyDsQJRI3Yf0MOBM3WTfpDUiZXjdwPBC1RAAgqg6rIackz?=
 =?us-ascii?Q?KOKI7y8LLkIvrrighn0DdXhqlIJYzHStnoRLVJDYImOLNh8xprKvr/yWE3p6?=
 =?us-ascii?Q?5VdIY56D9cvCukuP+Hu8KXZYtLv83R9fVfUo7FsM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ca1328-1db0-4bb3-5363-08dd2877716b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:42.7237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L32Sf5lN6k1OvvP1KzUfCAEgpI5XRHZvgsZ0onO1fsPlh18InT3/hcvd7htzNZuCKLjxB/KPq3x+5XRizymbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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

i.MX8qxp Display Controller contains a AXI performance counter which allows
measurement of average bandwidth and latency during operation.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 ...sl,imx8qxp-dc-axi-performance-counter.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
new file mode 100644
index 000000000000..1d6501afc7f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller AXI Performance Counter
+
+description: |
+  Performance counters are provided to allow measurement of average bandwidth
+  and latency during operation. The following features are supported:
+
+  * Manual and timer controlled measurement mode.
+
+  * Measurement counters:
+    - GLOBAL_COUNTER for overall measurement time
+    - BUSY_COUNTER for number of data bus busy cycles
+    - DATA_COUNTER for number of data transfer cycles
+    - TRANSFER_COUNTER for number of transfers
+    - ADDRBUSY_COUNTER for number of address bus busy cycles
+    - LATENCY_COUNTER for average latency
+
+  * Counter overflow detection.
+
+  * Outstanding Transfer Counters (OTC) which are used for latency measurement
+    have to run immediately after reset, but can be disabled by software when
+    there is no need for latency measurement.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-axi-performance-counter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pmu@5618f000 {
+        compatible = "fsl,imx8qxp-dc-axi-performance-counter";
+        reg = <0x5618f000 0x90>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+    };
-- 
2.34.1

