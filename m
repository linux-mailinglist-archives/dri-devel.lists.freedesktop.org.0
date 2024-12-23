Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D189FAA87
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C12610E314;
	Mon, 23 Dec 2024 06:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b5ee+yIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33DA10E314
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+ZgASOWrJTU6kmfLLbhwKnT2PpRtURkpefD7vFpF9LHjWJ70tR7QKnK/TYMOJ+sZB2jdCtBptD3RGqg06HxuAiLG9Dxg+37oudOKhmy3alrzvfhTUauG2IDGR/4GvezQ7JJ0ox7Np9QxxNxYbfeZlFCSQJZ7+uFuxZ0vfwiqVrCnGBVxBp6Gn5f1T4M7rFrOxO9V2wFzgSaJV7ZKXWmTuUZ4gCeIbEgz3RIeRsB6CNUE+x/qcIQnb2adTLIGcAPk/9YHB9+BntZbt7WQfN4x4CXiEjjwv36/ZUQ6wgGuZrIMr/1YXEukgpiZeH41oKlR5cHpCqN8nbVDxSKst8YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsyWWrI5GjT0B5shM7zKy7frQ3QBVDXtpKjveWOOL08=;
 b=VzaAj29AWR19i8owdMlz9A/T9RoIRJmNVC2mDp3j2eJi2EgXcPYrKT4NaOwdkUZLB/NnP3IoeP1stIx5/Leu2RMkP1hcR9yqjxPIIenmdvZwWRrduDJWsrFBjxSU8cYNNg1EvXqxMkulXL1DoIC3iPyr0L2io6mJrcBLEF063IWQfD/sI+NHdIhzoaEGcNGSZ0aTL9UFpgKWbXxKBLQaPrWvBD+AjNohM3WYhgpuI/pZmxBSdPwECe7Bpd6DyIQnsPVOBzvO1IqN7qbL0IcH42JzYp1b6wBc0vc4QyZZ2K8zsLjKk818VkrRHzmZRSkV2x8KkrP0AhSn8xhu4n4Srw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsyWWrI5GjT0B5shM7zKy7frQ3QBVDXtpKjveWOOL08=;
 b=b5ee+yIgQhG6a+DEQlTeSrrbQ4mWmx72HKmyaXeZjbRsHPVX/KgrmHopO5HWvrdR83SrB4KiZDoPv2myJFTJxz1+XXXDtASttDDedTzX15ePG/d/FN1jXyr8nS+5usFJHvBMht5WdzFtXExiOK4yz8mFQ0KozA62w6d4bO2fqOwcdLNgJYXMAsQkzqeQ1hQTseQgKyZoDsZogbXoj8HPIUip0keTbxjk7Xve9Pb6ZrHF//ivsn0ruEsK6imCqb9nuurqDDSF7CUE0OtcX2W8orYvKvLJgsvs8roGg2x8RwSDaQSK0BWfBwGkLQkydWBLyP6/3KrCAFDn9WRkKMCifQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 06:42:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:42:08 +0000
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
Subject: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Mon, 23 Dec 2024 14:41:31 +0800
Message-Id: <20241223064147.3961652-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d43749-3306-4527-8074-08dd231cec1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wXQQqrBnyHd+UNIV4dcWgauuptuWySOTcIEJLs3n8pVViTe94SN3EBpzZeJ8?=
 =?us-ascii?Q?2BRUQMByeAK4g9bkkwTTIB5zMyW2xTkGUwEYcVCb9iwtsROEVxs+a29sbUcx?=
 =?us-ascii?Q?FWUXQFcyAf0HqHq8Ol+QlC4RMn+25NBpnGq8KDgXlaZSQORnVfMQU8U1Ok0l?=
 =?us-ascii?Q?h20FabiI4Ojb9KzJn4Wxgj0DP0+Q09UxtN7jxN6V9B9p5XPMeYrId42Nm8Xj?=
 =?us-ascii?Q?KceVjMSWKHFx9sIeYBJ8rDZdiG0b5oDETaj4CbXaAj/TB9ILKoNLL/w8MmSG?=
 =?us-ascii?Q?/M158PSxkdugu4p3xAZmgxuEQ26Yj1dT26SCaaauUSwae46kj2DOOBGoycOP?=
 =?us-ascii?Q?LQDMhnBSNYccmBwS6ctt5zWuGxOB+mp04wBkl8CnJNPKjwomzYxO4e6alrR9?=
 =?us-ascii?Q?yjITHAXtlPOIneJyABVoGOH4o5uV7AAB3mNPny/C1vc5KnfGoWu+USA2RpVC?=
 =?us-ascii?Q?zBO4EmSrJVWqxVnfjioE1VYlabaS6Qti7pXgMxn4mjEmFzzcZ+wurLky9WL8?=
 =?us-ascii?Q?WG91dLVBcikaMAWQAtn9mypTFXDFywUXQJrEkcuN8YFniERu8AufpBETw+aJ?=
 =?us-ascii?Q?rrMoSMEHVejj5jGLgH3tu9DjGex3HNbTsf8fIJ5w1jz0A/ASRvMZqrQHlVWa?=
 =?us-ascii?Q?lxdW/NQqruFG0vWdNxNYuSx8cIaj7uz04g0mD+k0pj1XR68Qk/GwgiM4J6GK?=
 =?us-ascii?Q?tEit/par1c+QWVmjl93xmdBeG6XBPgRkM9dNHUiBE3SCTmG55d4dSh8tDtRh?=
 =?us-ascii?Q?t44YD1Yku6pue0cLwdmXLpeHOHev0m/iacp1kawv3UWzdMuWgYwMwdv4yifO?=
 =?us-ascii?Q?qkocJ87UMWDAEnMSs5t2l9QkGm+jASAvcJW6kCMLEHD+ufNouhnQLU2boWdX?=
 =?us-ascii?Q?jZw8Rbp/mDMYgovbOeehn7tEAWn6951SogBFwgv+LVw1szLb6Xxo5Z/eV7eK?=
 =?us-ascii?Q?2OliI8Yt3eQQrg2PSkqii1q4FHwA2C5EKa8SLeanMlnrpKqkLO9wfOmAgglL?=
 =?us-ascii?Q?XKEROrn2+F/08xkuarNF0bVOLyczn0l82SRuFYBTX0CAjTU4fCsa+ymkTUHG?=
 =?us-ascii?Q?gg9MntSE6j3lguvZq9n++RTmqSv3r8xlHcCpK03xPw8/IwkWkoKWekNSZ1GJ?=
 =?us-ascii?Q?k04AZAXvhPNoGlTOSUOmnpf6ik6LqTMqQ2Qs7b+vPY16MJBdlUlt5YkF4Ens?=
 =?us-ascii?Q?yQ7TG0SpaZip60p47zKw2R/YKNJdOgnBrt6F9TAp/uURyvY22XJ0yGG+ALU7?=
 =?us-ascii?Q?f77EXLuwDhAJwkogySbb+660zpSL8VPlxErE5LV07/Ea0OmRYn5knrrEEzZG?=
 =?us-ascii?Q?Llxqy89MyPFFso1BHzzOXr7oY4yb4L3EMU70gSD1MGTBuKtlvlHbF9min2u9?=
 =?us-ascii?Q?kok9+0g+BrRT3UjQZGV0Ow50qZqH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQXd+qbxJVd6xGsxbRB9PwFcfnB0QhXLyC5V3Zx5TJSETwt91CpYus+8Rdvd?=
 =?us-ascii?Q?kQcA4dSxUPDm2WRUOg4labkugzWFQ42blaBwfAe27B3mOTpGR+RsGVj2zgaS?=
 =?us-ascii?Q?mNPlXVs457e2QnaTKWOfqX8AbGJVFg8BdX+KUdKcblpyvadamv5G0MSN7jeS?=
 =?us-ascii?Q?EdekwA5QkTnDXxo55dplnV7ilKpDT8nMNOtad7QvvwddwCEqR3H2ifFH6K/t?=
 =?us-ascii?Q?KgngMls0ZooN2z1NBG3Ho1qzUIx9ziWGIPfPoyBzip+wMkn8px1P45gFrC86?=
 =?us-ascii?Q?Cz/X6vNrjgUuiS/cErZHxpkGQebiOYc7c1MTzyYqRimtRvDchK9CXj7AZEYK?=
 =?us-ascii?Q?hXgvO6pOdOBmso0OJGNOdrJWhIl4XV0icA0kzuBBwdv0PPNutZk/CZCG2vI5?=
 =?us-ascii?Q?+5Ya/Yh9nvEl7Qui7ftcN0CF8W3OZYK3pOHFuxROuDxzR4bVhpBb2szx3/Ab?=
 =?us-ascii?Q?KU5NtCPZsk0ywU7U7MpWdAchPF7MfrdRT+sdkxhcbEA2dYd7PNALc+rG67ma?=
 =?us-ascii?Q?7oy+y89FGC/hOLsqIpNaoR/vOz6GKT2RNuzTRdWWcdHXjoyEjVDBpo5iUmLH?=
 =?us-ascii?Q?OX+XVB99ZFOVrK/PSM7TQy34QfBY7vKOoaznyA3jHOKNQs8x5gcBgDPI/2ZJ?=
 =?us-ascii?Q?pK6WnIY6MHAKrjUox34hQbDs8PuWGUa7bsZjTAjlFbpl1wkteIJJXY4FAmgY?=
 =?us-ascii?Q?O7OYVDPkdB8JP31nD6s77cLPhdvY+qXH5TOTLZrVHNhbW3PNdmJwQl/PU55/?=
 =?us-ascii?Q?ghUdU7jq/q/O09+CrKvvWvf0wsM6fUus3QauT27BvbNGkA21pFI52gZXQUTt?=
 =?us-ascii?Q?dctsrgB9uXbVjsoIlKVz+CASf+cz/FT9BvKC0gjvoRYhHbpva61nDmd/artM?=
 =?us-ascii?Q?insEPXN2T8GAuuRx7vh/Nxu7+SWlkMab6CLCDv+FusFL/0EOqESpwFq4asIq?=
 =?us-ascii?Q?QVGsNAiYMLBkeMMXN4AFMf8igVs36QD2nj3A+t340ae2gtXUatMTnNZlrhNJ?=
 =?us-ascii?Q?WJ1swXxMEyi+dFggCWBgRuqsg5M9EVnskS6OawgWQvVz8ktgfrQEIvVr87sc?=
 =?us-ascii?Q?lfpT8Kk2+CqLw8CMVw2q0bMpcP+JRpGEkHe0zJhxLc6V4KZRMqmBIJMaPkNi?=
 =?us-ascii?Q?ttJ2wYAIX0rZ7hLsCp5TPnxJBkgGGsEbfY4Enb+TONMkp8Of/ird74jP2fKk?=
 =?us-ascii?Q?U0OC2PioTlq4gCuH5NnpLQBrfBUjiQtykkQAULBEsXgAVdincXP8s1uYdVKk?=
 =?us-ascii?Q?S9X3VLi0I7E8bBkYM1xsWm06r6suWoDjIefezYK06CV+7Gu6FrzJK94IPYQ/?=
 =?us-ascii?Q?EEVe15ke2MI2UEFFN9viZY/W9Ay/opsz9ys5kzWBJVxtDOkizgPa/FqwHsLq?=
 =?us-ascii?Q?1CnPJi1d3Yu6doZYJiujpzXm73XoAoZgIwl+F5GnLdnmTmdiwQt3RXaU3nx0?=
 =?us-ascii?Q?iTyrfOZ/gvwkQ+jJUqDcm7/jIJg1NA1Hel8gnVdQTzbdr/M1R62VNLytRsYl?=
 =?us-ascii?Q?OI/Si3qvfvYpE0ClzVw18pT+lBaI2/+SOadsl1REULr/Z/gwKEsNkcxr/ObG?=
 =?us-ascii?Q?+FJY4DMcxbELd2nw29Ac+9AF2MPJiQq5CZUErLtM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d43749-3306-4527-8074-08dd231cec1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:42:08.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtJDutofjnr+8waXo4eR6zQEAEp4yucmj7Mf+N9damGEeqg5wFt4/iWKgqknA8n1XMe6ecB5FBa+i0Wvo4N1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986
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

i.MX8qxp Display Controller display engine consists of all processing units
that operate in a display clock domain.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* Drop DT alias documentations and add instance numbers to compatible strings.
  (Rob)

v6:
* No change.

v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Drop port property. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
 1 file changed, 235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
new file mode 100644
index 000000000000..60d1e0a4a5dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Display Engine
+
+description:
+  All Processing Units that operate in a display clock domain. Pixel pipeline
+  is driven by a video timing and cannot be stalled. Implements all display
+  specific processing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-display-engine0
+      - fsl,imx8qxp-dc-display-engine1
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: cfg
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^dither@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-dither0
+          - fsl,imx8qxp-dc-dither1
+
+  "^framegen@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-framegen0
+          - fsl,imx8qxp-dc-framegen1
+
+  "^gammacor@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-gammacor0
+          - fsl,imx8qxp-dc-gammacor1
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-matrix0
+          - fsl,imx8qxp-dc-matrix1
+
+  "^signature@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-signature0
+          - fsl,imx8qxp-dc-signature1
+
+  "^tcon@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - fsl,imx8qxp-dc-tcon0
+          - fsl,imx8qxp-dc-tcon1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-dc-display-engine0
+    then:
+      patternProperties:
+        "^dither@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-dither0
+
+        "^framegen@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-framegen0
+
+        "^gammacor@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-gammacor0
+
+        "^matrix@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-matrix0
+
+        "^signature@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-signature0
+
+        "^tcon@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-tcon0
+    else:
+      patternProperties:
+        "^dither@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-dither1
+
+        "^framegen@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-framegen1
+
+        "^gammacor@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-gammacor1
+
+        "^matrix@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-matrix1
+
+        "^signature@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-signature1
+
+        "^tcon@[0-9a-f]+$":
+          properties:
+            compatible:
+              const: fsl,imx8qxp-dc-tcon1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-engine@5618b400 {
+        compatible = "fsl,imx8qxp-dc-display-engine0";
+        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+        reg-names = "top", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <15>, <16>, <17>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        framegen@5618b800 {
+            compatible = "fsl,imx8qxp-dc-framegen0";
+            reg = <0x5618b800 0x98>;
+            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+            interrupt-names = "int0", "int1", "int2", "int3",
+                              "primsync_on", "primsync_off",
+                              "secsync_on", "secsync_off";
+        };
+
+        tcon@5618c800 {
+            compatible = "fsl,imx8qxp-dc-tcon0";
+            reg = <0x5618c800 0x588>;
+
+            port {
+                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+                };
+            };
+        };
+    };
-- 
2.34.1

