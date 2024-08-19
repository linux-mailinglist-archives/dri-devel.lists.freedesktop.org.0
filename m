Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4186D956128
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 04:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59FF10E194;
	Mon, 19 Aug 2024 02:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bF9H/TS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C56710E191
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfttBRbjc+jLk3hZGKlg07E3fDuAAtRGvNHgOUMHtuIycITlQor9cWeqHuqlJM4P3jNi/1W//iofQWTeC6R3XUk/egj7aAQMXYCzMIG9TaaTkua8C0IVOvZ4z7rap9eaJgG6D4Iy2EleYHmFAGrs5bXkLfwm9GKBrWOtFi5HqteIfR2j/GusxuDqK9TbK960fgFjvbRR4vCaGDDBEn3AxNJwWBRZnTBg4wDkdq5PSlgwykusmoo2283mMmKLl4tJZKvVhR61m6G/TMUDeURUm9BaeR6qdKqwsgavkHNPMIcfNhsfA0+PwXjeu36uXII1XGcaD1uOK5V2apgR1AgBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOgHqJJS2it1n2g3LplV9lY7EitEwoWzqQ8I6euYF5I=;
 b=uaKVr982ziC/WjMeQ8poycZo1J07NK8jDPB7IiPF9DDO9sJpd9TLhWnLaogA87u0CH0DE8+4PeMMnxHgRwgOoDu2zPRedNErO4TRiZFJ3Q7ZmmViO1izC6PXUe1is6l0K42hWFfV/Jep1xkrkaJv9ho14UhpjthHoyvHQuyKT9NbUlCqY8PDN8W9RM5GKxHGyMtkl2hfVg0+T6F7UJx7M5j1UiI7ardbamgoxGKgD/GQ0Af3CJMuAluaveQLkcvFWJl3ETgy3xwuKjg9y3YkRIzoZ20gr2f58qhOX7jUm2RSXjN000cctul2JQenKwwA9gTn5R/IeR/sUCk8/Dj58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOgHqJJS2it1n2g3LplV9lY7EitEwoWzqQ8I6euYF5I=;
 b=bF9H/TS3cRuC9v+v3QmjweRXD2Xl86gFk5ITb44zvkl0iQxZeWQ4dGu8myDQYv7rZRkWw4N3mCs7uYi0ca3uYgK5sQsump/i9Bjf0kzj8QPPDu5Sdvw79hnlwzi+oxHrUYqLTwxVbMs5bsuHANLpl2k9OLK5XrjdPm5ObuwIEl775rZ4jfXZ1VdYhPTwcnFqiFPMT7x43LR7c8j3WsNWmeCg5XNzRm5b7X9jZ7NRpFYMRrSxrvzCv8ci/L1kZJQrGSIr4aG6tv+4VMN3JmJteCtNBOfqQMWMtEr5urmfwLtVQ78IQiV+6NwtmV8aNio5Kn/AC2qZMymw1q80Cqz8lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8807.eurprd04.prod.outlook.com (2603:10a6:10:2e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 02:40:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 02:40:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, peng.fan@nxp.com, krzk@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Date: Mon, 19 Aug 2024 10:40:00 +0800
Message-Id: <20240819024001.850065-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819024001.850065-1-victor.liu@nxp.com>
References: <20240819024001.850065-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ad6927-185c-4643-48ef-08dcbff83ece
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xpd1luQtKa27dwNW2Yy4REuR+l/b2gqta8xWU0ZETNyjOcPgPJWqTMmoXyFK?=
 =?us-ascii?Q?bxzxqwsyu8VXin1um9onQHbtcAQecFZIVEV0LnR8z8Fv4Fwm2iYjBId5jD0Q?=
 =?us-ascii?Q?Uo22o7hHoTesWIMtqxt/HSW9WbLZl52LTnhL59dq3dkbfbZni8TP+pzaTXu2?=
 =?us-ascii?Q?4yk+aIxjSXmbTtEurYm4HY9/QxdulQKcoy8AcBg50+9EY1cL/kK4XB+5ng9g?=
 =?us-ascii?Q?WA+IW7YONwAVlAxltzoxC+4CFfZVJl2eVj4JlVmwxTuGNTQI7HZ8zM4X804I?=
 =?us-ascii?Q?ynMRCQKyByZFx0WPUnYBsTtPTY23pYMgx8O37IW359sEvLj7vl/KbTiFEpHY?=
 =?us-ascii?Q?M7VwTZGn74Tk/ZlCeJMbeQMo+7D/yb+uUWuXZMxPEqQd+lfPO/DW028PU6WC?=
 =?us-ascii?Q?mlhC1dT0lZpcgUkY2W0JNOOfW9XDYT+ZWJwneu3bk0GIZcx0YpOCV0Vb3xoZ?=
 =?us-ascii?Q?bJ4Fy9Iid1xJ9cOogBu/cSu4FQjhJ2c84x99jXqnsq+wwFSNaiKLHSE8QTRx?=
 =?us-ascii?Q?t671AbgIZcOHJYUDgZKoNzDAhcvJUSSfgiouEWjcab1mu9Rl0b7wim6wCusu?=
 =?us-ascii?Q?WecNic4zGhbHJoUJa8GfSgVJmbWRViDF3Pz4DoA63YXpGkW1F8jqAwpQJTzR?=
 =?us-ascii?Q?OnBceRYlBRC1vJErqpsVzjcmWABODrPGr58vcEgsObLwxoPDxHG/Ki89w6oE?=
 =?us-ascii?Q?R+Iz61INQAKwy1yZqT82U/Zlq+JxGcufm+i9uqeCoYeUyoGta4GeGusTXwHK?=
 =?us-ascii?Q?0/pbNtBiC9v7k6CpQNeh68nbyPRhvsSEOxdSm/LkHdE9B0ME3AGLvSKlhAlc?=
 =?us-ascii?Q?KvYF5k9jhqIiJnRgRgSJXoe4Sj5cZWTZOSxw9+8K0bfC9VN9KSUJs3P8RoIu?=
 =?us-ascii?Q?UtndDyY8fdu4f4M7OzOG/y/i0Cqq1bvo4r2gMjXJpIhBYcH8l4PVLwAyc6nB?=
 =?us-ascii?Q?68kNgorNvxF8Wc904IqrpgQgLm3KUMxFdoI/zCNIFJejpnZOflcvU4exZtHl?=
 =?us-ascii?Q?tqmlgyPy3ZFwDc2DeSDsTtx8eazW/9N8fHhvq/jPMXJmeWT7A7zv+pkItuCw?=
 =?us-ascii?Q?9Ubl/MbuXCD4jSyY5G0NeDfaG4mj/LmmQtKz1pXIc2J9HCA9ItIyfSOr60LW?=
 =?us-ascii?Q?JRPQodpVxsTlmGltVF6HD9ljF3egY0rGW15HypkoPcHnk22LG6JhaYjIJ91T?=
 =?us-ascii?Q?BWGb/FDH6ifQYKWGs5NeU7WA0Zjym0367RsmStFfbOfdZ6dCdjkFJjVyvyDL?=
 =?us-ascii?Q?AES9jwUYrYwrD8XZz9/jii5bWGEuxeC7Eo22IOYoj8tWyQIYCIvPd9b2MPbb?=
 =?us-ascii?Q?ot4YHnV/jbLJyoDIaUV6yw6H8QikQDrdopTTcPw7MMEg90q1d3WqA2+/bhXp?=
 =?us-ascii?Q?PyyeCukygh5VGE+bF1gvImXmoOwVAPUCAVy6TpDqClHcBIVGrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FxXCh7ozWRfB9QCP17r+DU8U3pvOKiD0Bb62xP0mWID3uNLJdcwC7UZo8dFQ?=
 =?us-ascii?Q?Hk8O4aVUREQR5va8xuATEBa2KWEdyetH3uAFgko/bX7ur2B9BC6zSfw8oWBT?=
 =?us-ascii?Q?svOiEFRKX2yaviQTsmI5eM4qdfS6dLjKUUfJVEarPwCCtBzckIJ8ziEmpUHg?=
 =?us-ascii?Q?3WQaIiCvFk3ygbrkytL42hQ3Zq5g5sKFapHU7yOFSE4ASk6CB9j20Hs4vFHE?=
 =?us-ascii?Q?F9wC+k83YqoA3TaTkQbJlaAWD+ituujh/6oqywhDtLR68vey7vg0zPcblz3Z?=
 =?us-ascii?Q?Y+mB3uVsFb4KyCJRt6YUxlszYtGfiRbDDzEwr7mnvQozQXI5BrTI3txa/mmu?=
 =?us-ascii?Q?DNJemuCxjje3zRdt3N/kxrzvHJY3SRkCTDj2AN7fq/lOAIkRmQQkeHqYFFkg?=
 =?us-ascii?Q?f14+G+tdIF5XrdNtqNHkbYUT35wRixTdzD1a85s0BFYYKZSVFibt7F8qUEzC?=
 =?us-ascii?Q?c9VHSbrPGI62XCTY8/bP1xxny4Pi81hV10UI1LYVw801D2uRFdsM7irtm8UG?=
 =?us-ascii?Q?OGRyIrcCmZEgiAxI7TllYBcIPWyGbZ+dOxSMFAj9vZPvvw4QN9JSEP2PGADd?=
 =?us-ascii?Q?YUL5AS+1o865+HPzc8lpYgEmb4smbg2QswmPke5rRUrwKUp32Cnd1fo8Nyym?=
 =?us-ascii?Q?y423cSc6p4XXyH6aHhCuYm/liOG7T/cMNKMGDh5p2mXNCsDDVdN8sXKwPYyO?=
 =?us-ascii?Q?usU1xdT9k8mzYBi5VLTBOMdTXTWJ+JpRa/xjgFDH5IG20l3g8qMWYhC5wTo5?=
 =?us-ascii?Q?oaHxUiTOXwqRDFfq/uS1do0QtQbpeWdjDT3BSUw8IZpRhI+3ojRbHInMoAqr?=
 =?us-ascii?Q?ZLI4jMyfMQWfZNUchO85NhPjfV8C5fSP7YXxOlrRe2LvhyjofMW3Twh4oEne?=
 =?us-ascii?Q?mavR27pj0+3/xuw5seFUcs6oEUOVkF0lTIqZ25DC8J3mHt5dE2oc766JhPxM?=
 =?us-ascii?Q?eAV/R96nKtQIIg2LNS5p2cTlXOF7Cy3AQ+Azs27jmv7SEp3hVrGK6qxdOEBg?=
 =?us-ascii?Q?rgRB19KBs32Wo3W1yJN+XdjWm5f3eIbkIOnI3lfX9QopGE3VFD9cbh7LLlTe?=
 =?us-ascii?Q?FDibfEVCQ8FFGPFbQg23Ve59Espg0H9D2I6kroGP16rlJnQG8X258CQKRk4v?=
 =?us-ascii?Q?W4fjwoQClTTpqqfo4kkcvJBu7RflyOTmuI03ngJqONznDslkPFWH+UxMHy/Q?=
 =?us-ascii?Q?l7/YaxQpUMXE8yJ0IOGWnpZX6k5RppR2tFyuu16GUoiMCGvjdtAHS1IQ35o8?=
 =?us-ascii?Q?MP0gYsv6qyXBVFYMgHZqVsz3KQKTnEqeNMtwnwrRWS3K4utgYygTL08tR101?=
 =?us-ascii?Q?9BsP8mRPp4sfFbOhAGX85byP5LfTEI7wMCitxKqaKYUMxK6jhlvQDBP7sbYo?=
 =?us-ascii?Q?FDtWMdokBayQOcCjayYZnjSgYTRli0+gTHUYQRnHtg+VuS7XeBaTkEI2rIlC?=
 =?us-ascii?Q?K1aYaPx0lIFq2NBx8INbn1GVOBfGvLGIwz51I+AhLx9XaSWd7CjikhrxE8nJ?=
 =?us-ascii?Q?CS1DoiLbd01HRLlJeFQ6Gr/IFKXA3hO4Us/22glt2WvRnhhrwpJpO2zxmLVD?=
 =?us-ascii?Q?om9e7yfj5Ql0G1cKUbc1xI24QHnvmkb72H01Esta?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ad6927-185c-4643-48ef-08dcbff83ece
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 02:40:10.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OfEKPjWJrc4LS+2muyOixMU55BEVK5uOeJpzHG8prQEv/62g/DqWcsq5fNGa2ldkSd99SiKX7YCqf0waiNpPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8807
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

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v3->v4:
* No change.

v2->v3:
* Newly introduced to replace the standalone dt-binding in v1 and v2. (Rob)
* Resend with Conor's R-b tag and with the patch rebased upon v6.11-rc1.

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76..3f550c30d93d 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -24,6 +24,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -46,9 +52,43 @@ properties:
       - const: csi
       - const: dsi
 
+  bridge@60:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: nxp,imx93-pdfc
+
+      reg:
+        maxItems: 1
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input port node to receive pixel data.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Output port node to downstream pixel data receivers.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - reg
+      - ports
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
   - power-domains
   - clocks
   - clock-names
@@ -76,5 +116,33 @@ examples:
                <&clk IMX93_CLK_MIPI_DSI_GATE>;
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
+      #address-cells = <1>;
+      #size-cells = <1>;
       #power-domain-cells = <1>;
+
+      bridge@60 {
+        compatible = "nxp,imx93-pdfc";
+        reg = <0x60 0x4>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            pdfc_from_lcdif: endpoint {
+              remote-endpoint = <&lcdif_to_pdfc>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            pdfc_to_panel: endpoint {
+              remote-endpoint = <&panel_from_pdfc>;
+            };
+          };
+        };
+      };
     };
-- 
2.34.1

