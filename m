Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1BA9F4467
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502510E494;
	Tue, 17 Dec 2024 06:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G4FqX0b4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CEB10E494
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHWyAT8C8bWoDvOgrcmobUfTfTv4txYn2a//yw9GVPx5eBNA3IdH8F1sKEQdG4U3d4ZjLq0v3ItVZcKgbvN+ec5Te4xM949ivHBHTOFWEpyxeMfZlejTE5CTSXbyAmQZ1GWfPAfaXZydD2cTDQuBvoVPPji5H51ojeTy6hNmbjg09XrvQYj7uTAfOGXqEJ0vJVBhfKngEP4sC3W6OJtivYh+4mlzvxXspPa1w1qJ1tB31RJ39KzwrKM9WX91uQ3kzCHG2IkFYZxo8iaoW3+ndcJ2UB3sOlO+DDAoAiKdDkwwQmi9VCGnNbtJl0eJQGDtbKg2hXWt4z5nps+E1t0vNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJRZ+bxBzMs8rjogrl9qEflcdJj9tua4H9AFhCHXhLo=;
 b=Dte3DvUs2lzmAgIeMQiN1TE1TZuQKsan1nioW/7V4ohLgnEMfkNWPcJkAfaIVhyjzD9eGbBS96073/6DThcWGySDqIREbWdyj6iq+FYiy7Hi1t9EKbPi47AEV9Oah+ztZiJTGAtIuKSNB2VugeqscGZ+J7CYUgZF9RE6kxpxtuDqGSkyeXEHhVzFeW1dFnSy6g7jTpD1CG7PFIpEwtVF1R4FBfUqKUMQpgpgWrlAmfk+M7m1acv8KTGmQcjgXmJ6O3VMxVe8Y/jiy72MVTZgQPhfriUmL+AvCudaZUL98QVNwlzNs5d7WDgc8H63O/oNX5aG2sNC82hgUtYAl6XvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJRZ+bxBzMs8rjogrl9qEflcdJj9tua4H9AFhCHXhLo=;
 b=G4FqX0b4+RCDsIIFSqw/QjC9S/8UjHji6bqTkRh4vihBPpojAHQQrm6mHn6CvXcbZbG5/g6q0u6tm7GCNAMQAOugGo9TfCmWyPMPvF5TS11lEjBJk2SGga+hs8G8WeqVFpyaqIxlY6pRswvpNM62YKbTInlPCt9VJ37zrenhMT7eUKOTeZ78c2TpCSaAHD7YHFXR+JhxtU3F/Uj1f3h0X1cY9ecPHI64zXOQIeCdhLgRwVJ0U/OAhF2ifqLrKbAdLfvQ/RW0XKaWwIR5g2faF4zap+SmtVbai4H5MNaBCGNAHZ6UHd6WxQUR0MUV0/dmOTCWLCX5qhHtc4ZQ3o3vIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 17 Dec
 2024 06:53:44 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:53:44 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v20 4/9] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue, 17 Dec 2024 14:51:46 +0800
Message-Id: <f2b7beebeb99ca69021ca24744e29af3454f5620.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e95c237-6016-43d5-04ed-08dd1e678c21
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kOJxZp1rMICAoT4H19ziUDgZErZtGjq2eVP9NOqJLbZrvWWYbe5eKK/25pV1?=
 =?us-ascii?Q?ZKgCAsRdlk8eH7zgr4YqNokKdA9byCgMWmFM5/BtOOIFV5gnltYS7NH5yCUA?=
 =?us-ascii?Q?iew0glATKcscR0rQ7yEawqixsQB3vxHAO1tBHt3TOcS8ucFYgfnzYSPr2V9n?=
 =?us-ascii?Q?UuL4sOMQvOnseO10fwkgue8sWegU40G7mWAGTo32/3VE5NLkH4BLlr+ThTaT?=
 =?us-ascii?Q?ULh8mhJKAG7TRTi5EgbfqHmg+kK0TKeAsBXFgSRm1hMN8Sfu1X0D1QVdEDBj?=
 =?us-ascii?Q?reiJTzuUXN9nVkVIXLN2eYikwOGpfNTNBBG6MtkSC/iDntjo8f6nv9usFcYH?=
 =?us-ascii?Q?4sSNjsXfaxRwMb1NmVflrp1b/rc1Y0TtQ9cZysIvi+LFIlw1ZCYrc+E4xwI0?=
 =?us-ascii?Q?OHwNPCCuh98MxC/8F6F1VA0QQI9QLERo9I3zvkdSaKgYyhg5UW+k72LhHoMI?=
 =?us-ascii?Q?5GNTpMuLxflQ5eT5ZAJK6TP6GnWoa0tP77XnF5dX85DT6spFTgSYXZKdEf3y?=
 =?us-ascii?Q?39HB8AP8TkETq+XDh7QUAgAsyC40xHSSgaYEcIrVIWkqkZDcq45uNRZmhaUN?=
 =?us-ascii?Q?+B2SGtmuwZ9xkYddeXlEEf4Ey703jXnc2JlR0oy65ECbt5H/ndioqL/xKS3D?=
 =?us-ascii?Q?CuvfT8b0vHYsTLRsiTUrECOkplfQNWGqYspWjaOIQjZlxJt9RysyvdK88HEF?=
 =?us-ascii?Q?Vv8H2c6kNQXe7ZoOHhvHGdsw0/F00ijeN1ymiY+LG8omEcRY/XQsPRfqDt/h?=
 =?us-ascii?Q?NwZWvogPYn0QH5YEjQ0zSLKl2bjIXtKT/1sOr4qdxPiZvYzrxkb4M6u27L8s?=
 =?us-ascii?Q?Svb4GYhUAyVO3GO8L28UKsZzZUPePPGiLJAgDoyaBOv4pnKifXwaQPJ+Rd1d?=
 =?us-ascii?Q?ci5GbSjOZDOa9SSscl9sXUjtQSS+2KbWAkIAOW7LYSS8sbzGRuw1xIzNGaTI?=
 =?us-ascii?Q?fCnyxDjnwEVaS1Af9FsJ+jwhRC7h8G4Hv3jpfgiyQIO4gZyUIZdYQdu3WoI6?=
 =?us-ascii?Q?RFjpsGPpysEnXjUMi+XDqQQwIfVTG4OmuAImnCtrvcplDQBTrLvi+CeMGaw9?=
 =?us-ascii?Q?7yqQ2duBD7sgSGLb8rcvWAgrzn2+75ADUhHAE76g3/2Zk1yRfbO21SiOn3YT?=
 =?us-ascii?Q?1Zxu95byfwiHDLk66Zc+GgjP2+ApIEUiEoLs6VQq99KAZwGAw51HhkDh+ylS?=
 =?us-ascii?Q?PVSOvs9OXvWYSV/Cu4ZfVvkacj7r0AHmH0eXjFQJVos/yLioWi10V5TslUdy?=
 =?us-ascii?Q?vF6n8ZWX2yEf7edrUbgtSJkcWsvBZxq5hh/MccQOelwr+GjyUDFrMtDGukuC?=
 =?us-ascii?Q?r03c5Vt5m+E3aSSOoMmrqGsx62vMdn780FpOaFj1W0BuEknm7UGp7sgNcRCR?=
 =?us-ascii?Q?UGZFNK3DqDoBCTRpLlgkM/c4afKhwyn4VNjtKRmSs3S7LYEJFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJyv/qcBR7cgbIY1PYd3K8DmJm35l/ehM+K795L3UY+uzZbH4tdqgZxkLPYF?=
 =?us-ascii?Q?2uF5h2ukdhPMOhmiYEtDsztbEdgBTYvdKh8BGcfUYJKpUj6sGJhq7Q38UuBe?=
 =?us-ascii?Q?zQRF4n2HKQcoG0ehpX4J9MvV+ZqIs4A5EPhhzTdL3UYAD8DJfw+Qq3WgpOBS?=
 =?us-ascii?Q?bgnPRNr5xzN70IPBn+voBKNPV4LGvyhfF0sTnudQvC1b0AOqWBXUQsxQkpZ2?=
 =?us-ascii?Q?MSEeWmyZHMRbcMD1WN4sFSrEITBUh2m4/BMxtZlOD3gmIAU1esWrfUAIKPky?=
 =?us-ascii?Q?1O9ekoChO0hy1LRup86SaHHWDMOtsY0xfJmLBJ2eAq5hARdZvdjdVmdW2rWk?=
 =?us-ascii?Q?OOMimOdNIutienuiDuX5OZWW3tJicgDy3mTcBIj+poWfgEy+edteFbEaknHN?=
 =?us-ascii?Q?N1aDLnlNUxxhYcr36fyHGuFQhS6d4BUvGaaoVq4z5cOrJgF1uMGBFsRvEQHl?=
 =?us-ascii?Q?FdcW1XQ/9OD9SRtAKsQlM3eufMPmmBr69cWiI0oQms2DpUBSae2vkEr79zYt?=
 =?us-ascii?Q?Ve4FLXcq52/4Olr6vCACswCE8SakmhgzBVLlTEAzXjJh2LW7yUziau5NqFa9?=
 =?us-ascii?Q?WiEH+l4I5WV9qauF2FNyFQ4xr1nyf3tMx56SrJXcLIZKaulzUajfN1cHHizq?=
 =?us-ascii?Q?nGBTg7P8YfEmRD378rpvEQrGDEN+qC8BeccLNWXfDZMfwzvckfioGkATkg5G?=
 =?us-ascii?Q?ZlmGmtR4AgMYijqdq6fliMbCt/myjlp70js5jDWoQ8OXq2WVLU/zrHi7f6jV?=
 =?us-ascii?Q?9SzsfBF1tqZhIjKpUBytQiXRYWy7xFpeb4VuKFDNSPkgqhXtuCt3N17y+AAM?=
 =?us-ascii?Q?5/9VdPe7Y0CN+jzCWdPrPb7bkxivpIHmgR8q3m3nx585bAzEiHVt/vxHnK5l?=
 =?us-ascii?Q?HkuRtXhlSkZ6a0AExFpEQcRmO4KzBLz6xjdUS5218zz9tA5MLTxG2vrMD3TM?=
 =?us-ascii?Q?Vi5w8KV6r7jDDKqDupSFUwKD1Bhsj47qnOAzRj/CQm31MI8pAlrWaIJR3urj?=
 =?us-ascii?Q?M5bAAxNkTJkuG8av//RONxLVQTMUvjpmskmtDyfqPKRbXfi0F3gLflRn2yf0?=
 =?us-ascii?Q?BTW2q7k/eRrM4Ho4S6EdHR1nNFjVdlWJsA757W9LlxeWm/U7zWQsliWEwR7i?=
 =?us-ascii?Q?HY72HO64P19pCYno31S0UGKdqetgcBxt5vreyCeo4n6gSZbHCV51x6+Ve4s8?=
 =?us-ascii?Q?jE15OA3dR4ZyaxsLN7ajOF25vgEl+OhHNdBdp9AHVvnq6UzEzr6ff36Rfnkt?=
 =?us-ascii?Q?1ReTYD8fG6gAPDyX7VpSebW5NgEaee4UkWawoyWk7YFAy9LW4L9wt3wb2ory?=
 =?us-ascii?Q?UHTVEY0Y2cAJWtPOc5P6mQzjbPEbLy1UxhhFwcVKfXoWO+/HWha9hUSqEB9e?=
 =?us-ascii?Q?COn8hItNaTNJJNiVZA+7YH8MwjyL04LQ4QxoUBGMZH0AHq4Voj7jL8sar3lO?=
 =?us-ascii?Q?xdurrKZdtBPfuH/YwQP6umnMoOUsUQKl7Lv+JldOgPUGI40fffTH2l2rvS2I?=
 =?us-ascii?Q?oBMXOYHApqck1MtDhPOjyu48dctxaLVSUMWzuNEqy18pLG1bqE3h+Yqig2ZW?=
 =?us-ascii?Q?i2J9Ro6vUj0ePZD6Gscxt3wVA9So6g6kyj1AckIY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e95c237-6016-43d5-04ed-08dd1e678c21
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:53:44.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2NLX/BSHDrrukAn3VCTnknBhBTddIcGIuQRRCdLFb4EqGlMaNvQqYv/gyNLnJL+ikjzmdMXateXtcI5CC6+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196
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

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v19->v20:
- remove data type link of data-lanes.

v18->v19:
- move data-lanes property to endpoint of port@1

v17->v18:
- remove lane-mapping and replace it with data-lanes
- remove r-b tag as property changed.

v16->v17:
- Add lane-mapping property

v9->v16:
 *No change

 .../display/bridge/cdns,mhdp8501.yaml         | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..2417f4038b437
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DP/HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: Lane reordering for HDMI or DisplayPort interface.
+                minItems: 4
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&mdhp_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                    data-lanes = <2 1 0 3>;
+                };
+            };
+        };
+    };
-- 
2.34.1

