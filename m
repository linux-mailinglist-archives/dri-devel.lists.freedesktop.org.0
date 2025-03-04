Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3FA4D9E6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4763910E55F;
	Tue,  4 Mar 2025 10:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YsJyXf0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1D10E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY8sBR1OnEJW3+4vTAhVYDalf1BSiAHAAp33Uf6EQYsuHSKShTKVSAfhkv14Xah2qZNN7026yA2WvRJwBSVI5TURl4JEOs7FCADRN0NTSUxx2RCDO7IJnj3jqdv4fG0G4UdR1IT4KbbQReQgyxCZJgYha5uHHzEqeA5o4S4ihK7dx+d9ojpQus8Ljhx/V+6JaclSZPrF23ForxMp13XVIdhjbZY2bKx2sHADXzkDdo/W/xAU46qkQMbsVMqwleXFTmyMfq54aiAjPZ3v6N1fUVGSAoRbHFu3YezuEbbnjFHQaNdrab7YE1LhkFFIY60lJUwI9xC06VZyAbl1dBflcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTtohqy3cYzJIPf1dbOtgcBHtzHnKO0farFosg+nxEQ=;
 b=vGNY1ZYQSd3XNI938ly7hpHgpmnGmJDx/kCf2xeTLTVbl1yby/Fd3aTcRa21HF1EEMa/OvQpJQYcn57jWwpfoBAlNYstTkMFioR+LRf+mo9xzr4eGFE5UL1jPxCZkEDv3AZo0muonTgj48XOpTcA4Kq64bgDlkq9j1gF8HuF+rKpwRWcTKaiUoNkMKlBFHRwXh4przGehTRG6o21nLkdyAUZi5+VOqRqvjszsMY9PoUhnXyo/UzUU50CyXkK8rkqEQb0ghCUTkEshPB2Ak+IZtZG1Hr4m6OlE+lWqC+VNbfRoA+MauzcKkbTWVLgAhWCpibLeAt3VHr+s42FHwpKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTtohqy3cYzJIPf1dbOtgcBHtzHnKO0farFosg+nxEQ=;
 b=YsJyXf0gNNZulBUQt2gC8V0B0nYcBYSCwMtmvu/hNZmIM4Gk5sE8bRrlG5IUL0CxHwIb8UbvSApKrZtk6FYI2Dpz7AzJXgsnVe56lpbdfP+nZV+sdfab6WPArrC5c1KMoSmGX97DiLdQwajz98BreVwDIPcUvlhh1ek1tm3PSTDVniwEO20ASp5OdbH/GFpscBnZ4bHOZJtQA95gsoFdYJ6kyNYNE66iuqqq/kdgCqP013p2KsrJct6hdoDjrrDMsNMPuCdFMJWyps2oqXUcDm5Q9nDg9cVvXSutZSi+xNQ7cpWO+BEDtjBgu0I7Szj2L037FYdq173r8siHBKLGRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9868.eurprd04.prod.outlook.com (2603:10a6:10:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:14:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:14:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI color
 encoder
Date: Tue,  4 Mar 2025 18:15:28 +0800
Message-Id: <20250304101530.969920-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2647bb-ab43-405a-9d83-08dd5b056527
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DYbb4M8XkYNh6ojCC2GELV0eLEbs5rWc21AtfIFZHS9MrxC6oNULewK0S4vK?=
 =?us-ascii?Q?ksIDCO8TkiVIHm/pvVufwtBkQbm+rd7HHfW6yYNCSd0LdxMf7+vaZRj20Axw?=
 =?us-ascii?Q?T+jf1KjU7y1fq8/LaNPgeo5R63t/z6N2F4LlwvaEnQ6krF35sFEz12eqtMUq?=
 =?us-ascii?Q?oU1oTJ/vd9WVSdTsd7N8jlHLmgbxEMdjSi6/tBEcLHsQe/xr6diwJCB/89bW?=
 =?us-ascii?Q?8NfoZoZW3mS6uTZmGjQk77+sLBqe0WMd+ezG4yjC94S7vj/IRfDrekJPyfNP?=
 =?us-ascii?Q?iDuoX8+z+jOiQ+1IhBKIrF0UifhINO2kx/RxNISTQbbg7JidHpn3KFp5FNp+?=
 =?us-ascii?Q?uIrHvQZzSVrQQHW/48utfb51IO/dZXDz+PenRxG8DE3Vj0U310Jx12SVMbug?=
 =?us-ascii?Q?QldoynsF+LObI9J3b0enxQ8wVzcOgNI5poGA85rRwArukLCoKnHiJpvJxYey?=
 =?us-ascii?Q?JtBCZvkByBcZhCGhiA+I9ym1/QIc3aQyLopnU6kYxMen5nDks457SWvR/0kC?=
 =?us-ascii?Q?PMpgJ6wQI2exMrIWLkTQ/RdIJZRpMMF93sUhr5NcY4TzcSpTGMDz+usuDiGr?=
 =?us-ascii?Q?qToteWIusn+iEq10YFca02HQ2PHbxUO0QSjXnMdB7GvI9RPeETME1meztzus?=
 =?us-ascii?Q?/oif3P1cGAuMDugSZ7aJO3Ew009TxKrdBI71dWWNZ8zr5XBZwxdZqoC7oBda?=
 =?us-ascii?Q?zrRsq8BOqcNBeccPg094cnScg6k3BXAmVtoIzqSotLgKmK1rmunr+zCgA+Lx?=
 =?us-ascii?Q?eUTS1uJ4Jlub25iUyzx127EwyZYTOLEmFPQ3XQ1dsbdrW+7zOCAXVQtUhOig?=
 =?us-ascii?Q?9snx+akVce/vpJNAc5D291cIDyclNuQ45O65yYW9SmNXpLGsZHxQhSCviQ8d?=
 =?us-ascii?Q?cRTYtwDYvdxqda+NGuBZF0MnB8TpUics0HhfAYMI24y3Hui7L9uSkLSnxGkU?=
 =?us-ascii?Q?qszsojg7Qd4gsnvKhb2/UU/CSnctyHjpOqykeQL5S+KdNc1MJQOagSxAM4Xr?=
 =?us-ascii?Q?04rn+SGjyJFSYjc226nqA9J1QIV7gIqezO4M+HTv4edhTqVo9GDRPeDLMfjW?=
 =?us-ascii?Q?/ECQyyq4D8imE9aIHGeRisM92nc1cawPfIW+M9wXK3hBj4q7OFBNZbBnpH31?=
 =?us-ascii?Q?0J37YhpVB9X26Po9WCrnABoyWIt/8hUH9xbyB/vDlNUbf/ZK4cMcafXqODgQ?=
 =?us-ascii?Q?rA+6AbWrihjdaE0eEOrt4MZCtZUQPYwaQY9tmEx1SmAZwTKSUUv6J5TT0bge?=
 =?us-ascii?Q?t47bpF9BYxAq7RaG1srDw9TRQVCVZSsrDmtcUvyF6Y5ht3alwm7CNRM/Y/2s?=
 =?us-ascii?Q?zhIhDT1WzERtTqlnAbTJUJoiLKORZeYZS7p7HkasGesxs9/KmxXZfiLQx2H9?=
 =?us-ascii?Q?HznNOmj6A7pjMHrwRJUHEzGobrBl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MENa6s8bwiKFc4gjeI9bMwvph3lVm8mtJ/YgMh1PqzOQjzPU8XVdrwvCUnPe?=
 =?us-ascii?Q?SsLvEI14+X0zzeZ1CbfDBECY0l/2xNUI3YEvNhvD1uXeHnMO6j1Bwoh5d00P?=
 =?us-ascii?Q?QiGBuWKwrf41bcmFPjDzmXZV1vQTajrYayfArJjEsHlaS4OuM/6JnSpn4Q2S?=
 =?us-ascii?Q?Q//ho34hGxPGZJOeKHPbtI0CD6UqV7DBb7VhKQdQpG1ecbACatkkCVukMi9f?=
 =?us-ascii?Q?ctJQHr42RDIPhRBJyNSV20p1GqcMdvl9fCHMvd1EOg4IS7hsk/kx1Oq0D1zI?=
 =?us-ascii?Q?XP1jv+k2MDVrIfwFLY78AqWGc4NoHOjSqFGjIjQPaCuTQvoNp6y+SZ2zW6QQ?=
 =?us-ascii?Q?wMHNCg5R/eegT5mTwOto3Koc/OGtwbYMHuvwfW6wIjp5LdJOVft1+4r/3gJ2?=
 =?us-ascii?Q?Yw9VIYnp8IrXVGjZV6tuoQ6iDWaGNfIMnG2svpKxsMYIGbsMrrqbaK9By9sW?=
 =?us-ascii?Q?qAsFJDhK1J4U+OcStV6oLfbtlzXAYXj1N4EL5FDl3iTe33nkERUCqFkG9Thj?=
 =?us-ascii?Q?KLJVxdB44zlFINgNCUdBwqM8myB5IllL+bYYa5YX+6HgmEIHp0a1H14MNmw3?=
 =?us-ascii?Q?QgxrFaApCE5leQm23Y7pFJ3xtm7QkQl+Cf/LVXPa4vPpKQhC4F2E4yE5tHKz?=
 =?us-ascii?Q?dpJgeWrEs+SctrEyPtnOn8AxE2kbg85NCI/ftEMga0/Xt/WeNV2ia6G+l4or?=
 =?us-ascii?Q?ZjfXz+aI4mVuufqc4zFo2jmjZCGph94O89FgEC3YhFiZFHWeLaeJg7o/kr+k?=
 =?us-ascii?Q?D5+CMINRbxLnbFzKabAQpFtpG2JhXVotgEnwbYZnYsjJCno2wu3ORvWxlbzN?=
 =?us-ascii?Q?p8lheCm5E7sj/use1Fa92Gc5WFFyFsUlYyACUZCV9QOodmBqq0scVJCNEv1J?=
 =?us-ascii?Q?X7gciSRk9vBbUBDBikh/xyLklFQ4S9hGBONHoP5NBteJfj3xIw9w6SRPapCC?=
 =?us-ascii?Q?DqHVMylsxrZXpI7L8G1A8A8H6ZlgDxtpRhTL4EbdRcDp8D6sUlBqBehyZjkD?=
 =?us-ascii?Q?vQFdNBi3m37fGM8VROJYZuE8SXoqj2+GRE60EciRnq3a/umLz8GNx1XsgWGH?=
 =?us-ascii?Q?fG155YxkpOjivuqC6kqYMiCdi+YXyuy/HU7Vb/LxYNTVl1720Gqej1nYduCs?=
 =?us-ascii?Q?5h6HBOQQ4bjeuGjdZ6w+W1IM7SIrBLZJwY7XyVFWobchyFVQkWhe2f5xxa3p?=
 =?us-ascii?Q?VASyJCrvc2U5inKsnzqCz6NRFyoSJM0IA9OrRaXhS3LUPeOfF1BQP3bG6/SB?=
 =?us-ascii?Q?Wud+NCQac2OFJz4KGmkFoy3D+G+sG76cBW94vE2puaehIEsEmZA1zOqrf8FX?=
 =?us-ascii?Q?1N1v1Wfi+ezhEDoSNy95ByJFq8Xwhj5/OecxPPLI5F6202o7oy8AyyozeE9J?=
 =?us-ascii?Q?9qCHylqqwYgT31OYkAFQxpIgah9P32lnuG3QIQzdCVsXA/q2CExBMYgZS/rU?=
 =?us-ascii?Q?jCaFyNLX9rVWQc7uXiXRH2OD7rfLowcLrhn0odYF7fwj6sBBD5UpKuAa43Lq?=
 =?us-ascii?Q?wKmMUhTJGtf2dXjpVB9ORRZv0k1C2WNEoNDZZR05uElsPwFa6Wusw5y4Og/3?=
 =?us-ascii?Q?US6lPgXKNH4EZqqq+AjpQ1xhR0haQvvp8QFhOR+q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2647bb-ab43-405a-9d83-08dd5b056527
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:14:48.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1rrN6FQ/6/CiEHjx84tq7c0k1XDxHSS7u/57jKvMgReSwWCXWb+M3Bukzu/6fNNloWi14L/uyevXivywSPOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9868
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

A DPI color encoder, as a simple display bridge, converts input DPI color
coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
bits in every color component though). Document the DPI color encoder.

[1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../display/bridge/simple-bridge.yaml         | 89 ++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a..c1747c033040 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -27,6 +27,7 @@ properties:
           - const: adi,adv7123
       - enum:
           - adi,adv7123
+          - dpi-color-encoder
           - dumb-vga-dac
           - ti,opa362
           - ti,ths8134
@@ -37,13 +38,31 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: The bridge input
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              dpi-color-coding: true
+
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: The bridge output
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              dpi-color-coding: true
+
     required:
       - port@0
       - port@1
@@ -61,6 +80,44 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/display/dpi-color-coding.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: dpi-color-encoder
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  required:
+                    - dpi-color-coding
+
+            port@1:
+              properties:
+                endpoint:
+                  required:
+                    - dpi-color-coding
+    else:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  properties:
+                    dpi-color-coding: false
+
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    dpi-color-coding: false
+
 examples:
   - |
     bridge {
@@ -88,4 +145,32 @@ examples:
         };
     };
 
+  - |
+    bridge {
+        compatible = "dpi-color-enoder";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                dpi_in: endpoint {
+                    remote-endpoint = <&dc_out>;
+                    dpi-color-coding = "18bit-configuration1";
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dpi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                    dpi-color-coding = "24bit";
+                };
+            };
+        };
+    };
+
 ...
-- 
2.34.1

