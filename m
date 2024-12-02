Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488FD9DF926
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7D310E3E3;
	Mon,  2 Dec 2024 02:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FbW4uUys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656410E2F8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdxKXBPWfWXLJEMBohAbuR2VDWUBuNydUMerWsp3w3LkF4+iWsNPa8+TSG18KH9GzVgIhNaliRDi3muJjfXq87l1HRfwEirz/xdJhEWLIy8ztYfyHWiEMh1au8V/6u8OI7RZykwde5XhsUm+ZOMQW173IdLnNSeWpzN2ZJPs12Uq6c8E90t0hPlPvpYBjBvpVyEoqHKlGUP57C4CqE84p1AOghqugN2yqzqi8AgBF94xlzZR9wgZsz6/5P8e5cOcNMXrslRYhEcpwbshw/jrmC/IRh060R4hBDmNEQG058I9NZhIkenn2xppFc54uF/lfjY0iwumGgPdEw1tYt2XIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlYCszjOb9ae4enBB14z9kgjSacz+U6zrDT+54z7UpY=;
 b=qB17mNW2iigAlrWLjHL98POWxIHEwu3EC/cRzTMjvUCxuM1GsKWBWF8IlKcRgonddX3CAV9AN04xlQYx8sHdM/pM1qCqOEyTJF547hTjSLfPneuCJddKD3FTH+RI87Nt17zNDcJsA17XTqv/LXF1xndglZ/YgdsybIo48bUX66Hj5s2lBDxq73/PKSgiGJS9BAOIXwLjJeKj3pD29yY2afcmzgSW7uG99f8nXlN8PySndd0MKPj0Svklu7y8rryL1m9RPSOE5v0/gqQ60p2chijajgnF+IUZWKkSyCLPT+tdfPYdEYmA/AOk0zK4dXsq2BLvgKqm+AZiVeFGj7txuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlYCszjOb9ae4enBB14z9kgjSacz+U6zrDT+54z7UpY=;
 b=FbW4uUys2D7U589Q/41kGkriT373i6WygUhHd5QkEcZmxdpv8tOvuIFUH7iVZ6JYmUjY1xGH7zwOLW2f1rLmHNUDOXOIgPvYVhCoc5fRuqgHZKBfC2MubOouWGk3wDytLmoe3N8/e17ytQVX/WYUrSP4PuFPOTl2xme86u3Y6Hn7HZNizc8LKark0NwY4AaJQhyGNp0+FjHc8bykohFLnon2fuu8rdka30Hw6mIe8KpsLbvPXFujcdLIDapNgEjzE5D87JWOzBl1Atlb4AXT3EYgSve5znN7/40fwkK1FRpgA5bAL6W0rZ4K/WybWqnfI/QKS6aKhAUufVdtXNsbPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:57:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:57:12 +0000
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
Subject: [PATCH v5 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
Date: Mon,  2 Dec 2024 10:56:22 +0800
Message-Id: <20241202025635.1274467-7-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c53728f-64c3-46b5-aea1-08dd127d04f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4sW3YAH2UrzULNawPO6prtp2QJEcE1Nlg37u/LzDshdvZHaC/2htUc7AAjl5?=
 =?us-ascii?Q?g0R3OI3AhW/rbLUCOm7G9YvP5GHc3YOJtdIkD0o9wupCrVD+C/YRrzAgMdwE?=
 =?us-ascii?Q?y6rPZ5CQ7GAafbMxmFAdaCLOmTKLUZSKWSQtCRr8S/RbDbjlnmPbxnMmXR4o?=
 =?us-ascii?Q?BmsMQWgnuf5NoMlO3WXGKLBUfGJYo589vIwJh1g7gwaffwVjix0Xk5A9e/EF?=
 =?us-ascii?Q?ETcibQ5v7XOF4LnOYMUqimoJzy4fJDBYSB5dRiWG4EkL1oUB8zH06I2mk120?=
 =?us-ascii?Q?aw8CpGXLusupcX/SPM+LWwi+a4TGYhHzop61yGkbhTtfX7yUQYUpheg+RYKM?=
 =?us-ascii?Q?EuV4E35bnj5myau6HJok5nbO6euMv2veXwltIQMjtWR75drWCHDApehxUQvx?=
 =?us-ascii?Q?cH4/2c8n+Cb0AJvRUMvczRsmQHaAm50XbRLfj7XAHAwTf2QKns3wmIvlO/d9?=
 =?us-ascii?Q?wqUfaPWMmlK3nnyKB1EKcKODcKnil5TlnWFwM3gCAErLlZ/UDmY5dfv9MolQ?=
 =?us-ascii?Q?87oi9imI33nkABDZOQi7lkmezpPEJyo/H5ExxX8wkJGrTH5I3elCaM/kgRnh?=
 =?us-ascii?Q?tc6t0EaAUnIdOXzBksJN4Tu/N5HHpdi/6DfE9bvwECpxUYu71sG5KyWv4fk6?=
 =?us-ascii?Q?ldSuzGtteWPpgLzM6CWkMiK+RA2kRJD8o61Qe+c7vcsBP44lhA1vmUrS7tMN?=
 =?us-ascii?Q?PipmbQ8z2GGVF0G+1msas2EeBzIQyjZnR2HdpUAiaav6oV48irQtvAw+sKgn?=
 =?us-ascii?Q?TKvBXHEeUN4PGYsJNbtLtjSiUG1lP1L/hFfBslA9wb8OJxitrj6+epycr/g4?=
 =?us-ascii?Q?xFjaVZTLfwEJO0lQ5j5zrPydrhNgLrexRKgXLZAW5J6wrnNhIiP+4yG+yU3v?=
 =?us-ascii?Q?qskkrac9CKKgY/MB6AwJSVvfrg+XCVNZ7DNKcdVY3OikY6oF7fkgNJpccP7J?=
 =?us-ascii?Q?lU7XRsOoI8h8YiAmwd1DctinNotAr4lmFkWSc2RNz+zET4pjGcXRhDXSdRIM?=
 =?us-ascii?Q?klNRh5e6tAEhg24NsKkCxL687JJLn0b5QIdRMVfXXTD+DQeTpJ/HFOXU+dPu?=
 =?us-ascii?Q?CSjqXtlE3VlLRb3zE9FnPqT+6NfljcPCe76SgYZLaz0QxtBZuYxWYQvXqFtB?=
 =?us-ascii?Q?5P3Br4gUfWDSCFQ/SFdEHe5UJo1/8A5JvmE7K9LPrA4ZXwZusfhVEZ2jPtIc?=
 =?us-ascii?Q?o2/zHXzNy8a3J/mCEMeinDFAKxFM+6uiI59Pq1YWWKfH67FBlhc/xD43eNgS?=
 =?us-ascii?Q?awEmr17PkHXXVvf0wZO6+1E5cpgCgdgToWB76gGDcw+mmsf8cKwxWBFpvCxp?=
 =?us-ascii?Q?mGXxMz/3YzL/zclckxCnWaL8JJnSvVzYg/R9x6U55wY6LQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TkVlGjxVMYPb/nDsX9nQEc7JYol71tOdSND/0OnCZPCFiCvj6XNKzct88K7w?=
 =?us-ascii?Q?4iI2KEDqXd0Q/IPCgGJLaNmmfcZuPJQW/F62ms5iZFKbCFY6kntW9+iz/VYI?=
 =?us-ascii?Q?cbKFk8Sl+YEYVK1h1SE2bU1HHua5qBQ61cLFYfCe4t0TqgJ7+zKci5mP/YXM?=
 =?us-ascii?Q?WEq7b2CIBzp62HqMOiwwyk3WghcwUBCnMVzk1zaFM6f1R/jKMvX44wkjgfqo?=
 =?us-ascii?Q?KxTwDGMVk+BTDMRY5SGYo5tCEfStVc9obUpPlQBdAKT/apmxrQ+KVTS9v2gL?=
 =?us-ascii?Q?96bVQpdgvwGUil7/WBHcAonRwybVu+s1trG+tbXo61REdNkew5TjR1qmJD03?=
 =?us-ascii?Q?2BiFvtDxJJU19jC5pSOr3/u/uVOnT2nTXmH4FYuWsjaKRaay6GEYKy6m3RzF?=
 =?us-ascii?Q?JVeDvqQDT+FY8mF9upnrjWS2h66sk2jOmznWaFXXLyhjWvO/jr0HfQ/NSOXG?=
 =?us-ascii?Q?IlySjHEnWmqFcRE78IxOt4sa/uRqvJHXzOMg8iXMwAhK0WiKtQiyVwbvw5+Z?=
 =?us-ascii?Q?h/w2MfxHxPZxcBFtnsZQ0p0bgZOScghLCQitNevfAay1vN3cDDiivCSgMnJu?=
 =?us-ascii?Q?lj+pRnuuEs8nwe/T3Bh1AGCmcE8hHjXuhTMDgiBK+5phTm+HflxRRANY3rmr?=
 =?us-ascii?Q?+mpt3bFULhLUONjKVUpK2a0zw2mQzDSrFIVOmOe0DXStA3i19l1Z+S70SE8/?=
 =?us-ascii?Q?gzKexTRd2uzW2d0u3s4wpHMUxe/CfSZGyaW6FhGm6b8sKwzEosCB8F2lYYB6?=
 =?us-ascii?Q?fzSI0U9n4saj1gGqkUEa12L3RH0/sALQNugepVM2qNh+JgjIyWupIn9/auRE?=
 =?us-ascii?Q?JIUZo66d8KCVDSckonTjMC8bAB6mO13hQ5IhhQ4ZnLbsAtsKoPSmXZC8x1sK?=
 =?us-ascii?Q?c08rgeqy7iz3gQT7bbXxoDetlBG7AanAjpI3NVoY9HjKTaO4sgqWDpePElu8?=
 =?us-ascii?Q?7lYNIle24mRBkdNkki+3oebR1/umsuj9HSe9VPveFjLAzWOG3Tq30HMHaCZj?=
 =?us-ascii?Q?hqyWX9VNoQoTw96sOJrSDg95r8NfntMEWmkWysZIjGAN/OGW3i9diRrqeIo6?=
 =?us-ascii?Q?O5CCQ0glTXfmFMzV6+KluCGhNli80e1lPWx4apsU7WgBEOqveEs9l4jW9uMu?=
 =?us-ascii?Q?NicsW316qRYSnqVUpNe9D9GAsdNpv35awKi+PHgxgt7X+3xEweewSW3SLKXV?=
 =?us-ascii?Q?taKk/FmTJDXgwElokNhT++8KcP8+7qwaJd2Z6E9vul60Ief6UTgdm/LeqOTW?=
 =?us-ascii?Q?wUNBjHZoQ8r03v3jFyaoxt74nrkxsY31UN8qeVJsdV4ST2lrhG3Qv7fDAFd9?=
 =?us-ascii?Q?FBF7KdnEKsGAMGWX9uxWEn6i0oUrUEg4q3sjPNdHVmorRP6dwiFehU8xtYPC?=
 =?us-ascii?Q?MhaYemeZpZmVGWt2EWNmHqtK4/8hdkf+ODP24DkLCNf7YxDD4HSSJ4C8TKcm?=
 =?us-ascii?Q?BOosyBcDcN3oDezb1kXCLD1brew57ZIweVVM+cYkAKoXb/TH3/JIZtTRmKiT?=
 =?us-ascii?Q?FJ+dhaqf+/qNSAnYNCMOWu0fRANXf7aGDACja9CsJRRh1L0Ww1muMIA9SE7C?=
 =?us-ascii?Q?hUa4VRUEXiueHxWK2ARUeg6xDEI6EYzoSgf1wzsp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c53728f-64c3-46b5-aea1-08dd127d04f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:57:12.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGTX1P2We9z/A1cecxC9pwb0/e9NrlMWts/JmtCJ8shhcP8VWIDqC92Zw6dAxWZU6neuJGryMfxWLWSwjp38Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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

i.MX8qxp Display Controller contains a command sequencer is designed to
autonomously process command lists.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* Replace "fsl,iram" property with standard "sram" property. (Rob)

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
new file mode 100644
index 000000000000..27118f4c0d28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Command Sequencer
+
+description: |
+  The Command Sequencer is designed to autonomously process command lists.
+  By that it can load setups into the DC configuration and synchronize to
+  hardware events.  This releases a system's CPU from workload, because it
+  does not need to wait for certain events.  Also it simplifies SW architecture,
+  because no interrupt handlers are required.  Setups are read via AXI bus,
+  while write access to configuration registers occurs directly via an internal
+  bus.  This saves bandwidth for the AXI interconnect and improves the system
+  architecture in terms of safety aspects.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-command-sequencer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: error
+      - const: sw0
+      - const: sw1
+      - const: sw2
+      - const: sw3
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the mmio-sram device node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    command-sequencer@56180400 {
+        compatible = "fsl,imx8qxp-dc-command-sequencer";
+        reg = <0x56180400 0x1a4>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <36>, <37>, <38>, <39>, <40>;
+        interrupt-names = "error", "sw0", "sw1", "sw2", "sw3";
+    };
-- 
2.34.1

