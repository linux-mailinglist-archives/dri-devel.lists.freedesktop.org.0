Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D66ABFBEE
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 19:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE5E10EA0C;
	Wed, 21 May 2025 16:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EuEigowA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4B914BB9B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 16:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZ2nxCB1EbWN/g4qvTgv4rC5LJuCofRN6AM351tAGuiCfWqTRsXm7uOflS+2JEM4f7DhqatpKvEmS0MIjNuK5hlfnjh4JLVd5DNaAM4eSJgPwnksbx83bp7ears2gXDftHJQxQ2YzEZAf/QKU1vkMOitnI+jODvXsj2Yd0ZGRfVvex2+Z2cFbYRTJhOxi8kA9+Mj2zsikBE/fL08j55ZPSX37+RQdf/Hm0SAhY/SM/tRZBE5gcATuELGxckekHuPuh++U7ixgQaUElt95piss1r0IJtSotWWnL0XaFVkrpdUtvic67m3yOPwWNVht98RWAQYfMndfJEL7PqKsH6H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYQ5SMr20aNnaT1TA2L/2OS4u9LRSP5HYGX8ZBxGWqw=;
 b=Axv8RcNSM4AHCX9DFjZ4AwavGV7UN7pQZj39BKUIePJNPxAFO8W4CdnKycXldSS7Yuq8qBsb6E2ln6em0oEQXXJ9Ui/adrYBcfOTNFOLfMkSYlkRr9KhMSlF15+1idLUffI6bN7CElD9TXWgQSS7XpZmnysxIZBKQFi7vvQQJiq1luver2FKEx9C0yD7jP0Zt5xTVC6kXGxwNkQjYEj9L9dAsd7Hkl87eZk9DjScNKGe6897q1tfUYP6SH3m96Xx+ZHjxzpzpFmyo4TRg4GcBVAjhUygv9uzYlYzgk+1yLJ2W4cDhlb/opBVDKkU1LOOIJJqBVeWkHYTRHJkIcKOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYQ5SMr20aNnaT1TA2L/2OS4u9LRSP5HYGX8ZBxGWqw=;
 b=EuEigowA34bji8zMHlRQxWL4SeUfyPhVYPAw1cC3kdtr8DO0XqUFdko+dC9LdqlH4gq8lD1BrQBxudueShzlEIv+nG5W1ZZBPk8S5QQ58QRvIbzdzZ/N3dEg0MC17hNHS4mDAMOB5TVD9yplDAsHpS89ZgrDRnkk3ozMKf1sL0q3g+pCx7QSDjRqZxMZgeiaR5qbYHQXNnEunwdESe1whexSi32mb1Ke6ip6DAdi59BkTsTd6Th0tT0AIGVqzTdPl7s1HQkhkB2IZ90dXBMPHwCdgeF9b3I5W6Rkcc1gNOrLDZCsnBijHu2cAYt5DQKV6DSBOJadTAqdLhVfd/c7rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10650.eurprd04.prod.outlook.com (2603:10a6:102:486::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 16:53:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 16:53:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: display: imx: convert fsl,
 dcu.txt to yaml format
Date: Wed, 21 May 2025 12:53:09 -0400
Message-Id: <20250521165310.307339-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:510:2da::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10650:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf4722f-388a-496e-c35c-08dd988802b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A8qYc/ggclJtIhqItLtkN7qOUAfSVABlMkdvioWl0HKMSkuNndPZbnJhVwhb?=
 =?us-ascii?Q?LEmLQbNdfVW4+WqYpFP++PYGqdhrxt1xitbG1v0tyVSMDVhkIYWmDeKOZh3e?=
 =?us-ascii?Q?w8u4OizodWc8NZa5X3yysZR8dvJAeoTEchP8NNLjSJnR+8HaMkYasZija9AF?=
 =?us-ascii?Q?HWf7aUK8I2IbuH/bsmd8WbhwP6n7483m5FrFJk2aSH2lWrjpHjkmvkl6fzGN?=
 =?us-ascii?Q?lgQHOgJsKtU/C0xwEuMbtPHJsOan+CevTGHjoXhFmDe2215LMVzcr9UCQIM9?=
 =?us-ascii?Q?9w9qmtH6JOrTqYocU87LkaYC3RPD1sYj9JXOPiXNyIFhUb3XqAGAfk8AJI+8?=
 =?us-ascii?Q?+Z5FEYQYujAhKu8M1sEsCmc8MqXderygW7QzG7/ChEGiepF2z3PHzTW1FzCq?=
 =?us-ascii?Q?PagZ4kDN9zsTXzx8MaghLTPBvNMZUfXO5EEjh3YdRhXBWzoMoHasg2T/1Suy?=
 =?us-ascii?Q?pVJTEaILF+8N9E59bNk3eVkdT/PwVyeVwUnfyriS4+diKjvuETkLGCPt3Yol?=
 =?us-ascii?Q?ubiHAmMKbjrzu04eNFTldqhMZsHZXLHKPCqX7DwJKVgEg1o8g8IJ+QYztSPD?=
 =?us-ascii?Q?2HtePYw579yXjrz9k1gMA1PxbVEnA5uHQ1p/gYiqyJFMsWWNh1zUgffMDWJH?=
 =?us-ascii?Q?WCRfCv7N5s1MJMRbqZyfTjnypcG47D/rvQk9wQasOt5Qwpu7vwpdQ38ySiBF?=
 =?us-ascii?Q?kAqWgtALJA/igXQtXsG4cRZXaweXuQ8gX+ltfeEap9ZOXviM+nLFcvPoXpDx?=
 =?us-ascii?Q?znLHNH2L5imPYBHRAFVrj3EpG3MVDxZ5dZhagWTlxQco+6EuVacMVWQqN/hG?=
 =?us-ascii?Q?Wj/Qut30oV+rE1Fz/pGF/6chIku2OViMmefKaQjnqX7nftOZujwwbCWjwb9H?=
 =?us-ascii?Q?zvM4qVz3tWe79GI9t2Lce7zIv5p7wUUEpu4Tg2WG1SmzF3IBTUyrWo3PoJQv?=
 =?us-ascii?Q?UO+kUb2MjX7KbU662R8cD95X6g7+OwFqbFHS3dV0P3w0tYUrsXb5+4EAbcVd?=
 =?us-ascii?Q?d6k81B8UwlXmmOmwMYBJbzn/GvTIKwtz0199HUEDr75ls0ZFXj0K47l8PABK?=
 =?us-ascii?Q?xr98O7/bmY1bTiHo2WzvxScH9GilSdOOU4RyBKHunZrG8CUE4rXuaMZY0v4O?=
 =?us-ascii?Q?o6/9DszzRwg+uElDpb0nWHF9XhdqQs0EbyYdiEgFJGzap/UCve9MdHpQDtF4?=
 =?us-ascii?Q?z7AMvMLooQQhK0Zzvl0KcDC84v176nJy5S+RIB7Z6D8WZrB6BM3qoE0M1ySM?=
 =?us-ascii?Q?bSGusYX332+983Q7lbVvt+4ls227TzAI9Jov4ehc3HOLRVtVqtY48eT8Cnkw?=
 =?us-ascii?Q?A3suCcejfN7syC3gZBvdo614bjrLhBMeu7sXwV65vePEc9XkfCT+jpklVtay?=
 =?us-ascii?Q?DpQLYVu27kGVwzkfCpOjaNqfYuO7QOm2YXUAs1UH1ENC6rZzz5NmRR4QjFbW?=
 =?us-ascii?Q?xOlB+jlYAqICR33J1leq0QDyAOuogb7d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtFytkNItnYdReffsrS3HtY35YDndXaNpXRdHlXhF5fEGA18a0nUIcdyJs8X?=
 =?us-ascii?Q?/RyzHz3c5AgcdRj+6/5PXIJkZmkpS0erjlZzqoMpvc0o9o9DftL6zOKkYdoX?=
 =?us-ascii?Q?V5XI3TLd7kLlFbk5cv4timQCK5fO5yl5HQveGUh3Vucepe+sWMg+Q8rFnYfL?=
 =?us-ascii?Q?IddYO0h2qmB8CVSW/9ZtKXeJb1s7e8xEn37TmPYDXLBbKoq/Bo+kGDDD1CwY?=
 =?us-ascii?Q?M+L7hNy2DIFfpKG/UgIQBdYWGDITUrRJH2h6QHNPpsphMZaSLNiq0umtCvTN?=
 =?us-ascii?Q?bomw5ozJFWO3O18ZqwOaCEHnpV56bDDELzurbLzFFARb0YgZaquPFFMCxVlt?=
 =?us-ascii?Q?3AufxOhBPQJmG4aIXlqTB+GA6FmnKhl314Ie4iSWc1Jk9uIj4AB3PG/X3gWW?=
 =?us-ascii?Q?ziipHCMVmbkh/TktQwp+s/WRInmNqjHtPu0Zr0FmnViNf4sge8heKb0O/uWd?=
 =?us-ascii?Q?82kDXFRu5jjDRRaijY7hX54rR5QQTA6uTtkLC4U/RVJecz1tmKMl0I6+Sxgn?=
 =?us-ascii?Q?a0cyUbUVT3RqrFjnre/ar+u6CcvlywMYLtTVoJ4E/9SvXc/wm8QQHpobzFdT?=
 =?us-ascii?Q?YXIYBpbQOkwovS95yey6tBoSfU8KUoYZh2x2//nOiKLF9JA/4Chdlg0ayclt?=
 =?us-ascii?Q?Ta9oUVsJ93s6KLovTMK4Et0sMVARYodEd3MKPGn0/TneWewiF5Gde9zgt0+z?=
 =?us-ascii?Q?XCig9i2TGpqPUJ6k5eYt5xXsO/+DMgjpQcnPmP5Tz6PUrcF317vtKgcxAoh8?=
 =?us-ascii?Q?qq5EF4YLTxFKLQBqEoRoNFZrZsEt9N4ZIHgU2ohskPMhJXJiIst3hOHadkeM?=
 =?us-ascii?Q?4RFvqrYiMN4QK738M1AdGZ95mForbtR8mA2evAVSR1OICJfuISSdDxhRNVUN?=
 =?us-ascii?Q?+lDcqzQxhAS5UKH5flkmcI6GwV/j4JbcFsKqppTSQz5grufBAphdKoz0Svgx?=
 =?us-ascii?Q?hQkgSYf9wRbeHHvlAel+2/ajeJsHBX0Ufw6ggjP/lhQsE4lQtPR9KTKssrW6?=
 =?us-ascii?Q?f7X8Y8E/A1xTJJhhpNZk5VF/3esvyNhd19jXC3c6IbCsN/BbEg6QrsCz/P3m?=
 =?us-ascii?Q?J98W0hFh+NOtpw4Fq29BrbIpv/gnnZ/YYP5Qq34jXrb6yoNSRjlYEnJAtcTC?=
 =?us-ascii?Q?7kSymUHtfpLFlyaSK8P9Eti4aI9KO0eIdpl8Z+AYOC9PsO7Bog2AWPmyzNCA?=
 =?us-ascii?Q?p2ywex1YG/jTZGquuI57RUnsJMwn/iQDj6fp8DRMFm2+H28uKCZYWF5sZWzh?=
 =?us-ascii?Q?MvyrR35qYrSHFdywjM+Zs9VEqjxPOCoTtP17OIzB6dYeFJVx+VPwGtKNZoFs?=
 =?us-ascii?Q?HjR7lbTLI1AQ7xTpAC0R10/Yx7rKpC4SreIBP1An1aXc6X4JzBuChV5vVWbh?=
 =?us-ascii?Q?RN14DlPiauxFmInxfe8p/GiChuDnoDZWSM8nawZbZeqyN2AkJT7c6A7Z5qpd?=
 =?us-ascii?Q?puEGR1i2Orjfs2BYe9/dgTbvkkXpq0EuEQzel9A7p8tfk9RlI+gJ9wjxnS1v?=
 =?us-ascii?Q?6i1ru2b4hdn0YXLNXTxX2YpP9x0wIMxipzNxTVo2hNHUwRvFHQ8N0nx1hxfF?=
 =?us-ascii?Q?5Db8GEkZtvNp8Aydcrz/Yc8RxB4A4l/hH9f4YUmC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf4722f-388a-496e-c35c-08dd988802b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:53:28.7405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0xG/25qRos+dnm0meeOAw3X/lz/L86qwTLJrQGDymcagb/uLYU0tXcePw7DvWVMamxrOcWABl9NDgCuaYC1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10650
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

Convert fsl,dcu.txt to yaml format.

Additional changes:
- remove label in example.
- change node to display-controller in example.
- use 32bit address in example.
- add interrupts property.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
Change from v1 to v2
- add Reviewed-by: Stefan Agner <stefan@agner.ch> review tag
- add interrupt
---
 .../devicetree/bindings/display/fsl,dcu.txt   | 34 ---------
 .../bindings/display/fsl,ls1021a-dcu.yaml     | 71 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 72 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
 create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
deleted file mode 100644
index 63ec2a624aa94..0000000000000
--- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Device Tree bindings for Freescale DCU DRM Driver
-
-Required properties:
-- compatible:		Should be one of
-	* "fsl,ls1021a-dcu".
-	* "fsl,vf610-dcu".
-
-- reg:			Address and length of the register set for dcu.
-- clocks:		Handle to "dcu" and "pix" clock (in the order below)
-			This can be the same clock (e.g. LS1021a)
-			See ../clocks/clock-bindings.txt for details.
-- clock-names:		Should be "dcu" and "pix"
-			See ../clocks/clock-bindings.txt for details.
-- big-endian		Boolean property, LS1021A DCU registers are big-endian.
-- port			Video port for the panel output
-
-Optional properties:
-- fsl,tcon:		The phandle to the timing controller node.
-
-Examples:
-dcu: dcu@2ce0000 {
-	compatible = "fsl,ls1021a-dcu";
-	reg = <0x0 0x2ce0000 0x0 0x10000>;
-	clocks = <&platform_clk 0>, <&platform_clk 0>;
-	clock-names = "dcu", "pix";
-	big-endian;
-	fsl,tcon = <&tcon>;
-
-	port {
-		dcu_out: endpoint {
-			remote-endpoint = <&panel_out>;
-	     };
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
new file mode 100644
index 0000000000000..72d14babe993a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale DCU DRM Driver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1021a-dcu
+      - fsl,vf610-dcu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: dcu
+      - const: pix
+
+  big-endian: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: Video port for the panel output
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  fsl,tcon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the timing controller node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@2ce0000 {
+        compatible = "fsl,ls1021a-dcu";
+        reg = <0x2ce0000 0x10000>;
+        clocks = <&platform_clk 0>, <&platform_clk 0>;
+        clock-names = "dcu", "pix";
+        big-endian;
+        fsl,tcon = <&tcon>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&panel_out>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b119ae6b5f144..4f69dd990bc93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7973,7 +7973,7 @@ M:	Alison Wang <alison.wang@nxp.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
+F:	Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
 F:	Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
 F:	drivers/gpu/drm/fsl-dcu/
 
-- 
2.34.1

