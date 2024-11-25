Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2239D825D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2EA10E5E4;
	Mon, 25 Nov 2024 09:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="U7fCPoKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E710E5E4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOCDGdCzz8bPpzUPllETMhHXJFwKjkArSysjb3PhYw7i1uccjboITE4yQtL7A5js5W540NSMKceV444tx9uXlrZzCRAeWQ+aG9tB8SHnMgV+nDY5mrqVPP7arQnF99AQeQE4DLelfHoA+up2PbaKLPzu+UuVVsqHe9iMcz2mvaScucm3bsm1l/XVajrLH65JF4BWyj+4NIIC510pdcPinHXnA4VHhiq/JZI0d+OKvwQCWRZ0VAig6WuBimeg0bH+vF16cd6HMvqfXwZNQ7nmzadsrADxetedaM4cG4S1tHTV3VdKiGBbZRKRsfojEEtzRC+14QyaqahKjjOJGehZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYW4Nd6BZSBAb2mPu34qXqHSb+jMo8+WW84N2LOy13U=;
 b=wbl8suMEkc2BpvEf6S0X3rIyGOCH0kqST6emG8v7VXefkpWghmhD04PhuvSX5A9gNdLoi66Ng1m1/iZcfAGjxn3h+t1moiIK6foZuXjNlWxZiwdc/POPVpSJkwhlLAe77h1ox562bVbK52T/EcjhjJgWQBcHHrmrh+hPXzqErWAvgX2yoj/12P6yWaggE+BNwXToNIRLF+/IcxsXmV4QxoxkDXvfXOhQGNT49weC05/YOb9BcOSWTu5dv1217JmuxApTDhfOwuLdotaA1KhNAqCrUcPMuP7klhiQ7JQZpxS8zHZo9xjF4vn7qvr+Cj4AQ5W8nU0eq0XTtYhfHU6jEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYW4Nd6BZSBAb2mPu34qXqHSb+jMo8+WW84N2LOy13U=;
 b=U7fCPoKs86Eez0dMgPxD4rqd14dbm/wfqu+hgTwnLJWxW04gD6NlcdRi0aW9LIPZJdnP96vphwusQ2C6jbBja4gDsSLXQUIFYE/NeSR7GvQWOn79PQkm6qZqflETv8ZLAIrmb4DoBvjt5kIjysRr9q+x+nUQlMpoXNgmXNHrpucT2TOQkCqVRijNzwGD7KPTFzPMDYLWAqClKdf3vwaBASV8FCXxrFjRdcsd2PlOwiWUCgH76OKWXyqZRz0lcroCfcFjJ1ezOtTrwpvCVlUY1XSQp12xLicc7bDfn1LDqmP7LakTO1dED//yXTp2I1EsBy2tLh/7Qawjjl0/ClpTTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 09:34:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:05 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Mon, 25 Nov 2024 17:33:05 +0800
Message-Id: <20241125093316.2357162-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0faa4d25-8483-4dec-0a22-08dd0d344e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3TDInMo/hF+xQ3bSF6sAinwcZr5o6b2lj9emCtPi7n4RVd/RP5bxcuyHyUON?=
 =?us-ascii?Q?cLTVqxzssosZnE3GuqRO1VKHUpkd6kNuznlK6DjRCr0X4gItEXYRjHF7A95Q?=
 =?us-ascii?Q?vz29TmD/MXcwmcqyxq43VAOobKEUoFQdfq4+qSsKH79D4axs63ueaMmwF2FU?=
 =?us-ascii?Q?Z2a6SADxUj8Fi4DfWG+9FhOEIJn9v5cloY7R15xFZ3IiRqO+G/ecJblryCBs?=
 =?us-ascii?Q?4BAi/S57e0Cal9yBMDJC42+HAwWfsK8fMCmFNxmsDlvt/cFPMk3YjTH3lJVp?=
 =?us-ascii?Q?9AJgrH4zm2Q5LM3bhkzQMT7T3dMKRR4p9GDWwAZGwdSUkDPXwVqVBEQh/RwE?=
 =?us-ascii?Q?dcH9If7dve1m9o64YxQ55A/n0fRqAKPF7w/fCPbBqV2ZkuhkprRehvQOr5ol?=
 =?us-ascii?Q?G0bX18n9pVsF/jouyVu/AjyXEdSTTucJbg3OrTewVUB0Np/U0/sCCTJM2Z+t?=
 =?us-ascii?Q?YhfAj3sL7V4dtp+CgqA+hVhq1o0IORFnpMcS9m8ydWpm/lfhccXQN0zBGo61?=
 =?us-ascii?Q?MpnF2y1h+EpTXCX8z//Nlqipp/PaZnOqTAU4V6ajN3lYveTkI/jZeCesidnq?=
 =?us-ascii?Q?uYFel6a8mKNV6RF9PGPaGg3jD1tn8f5cFuczxpzzuCxfz5HL9ssKYb8/K1Tr?=
 =?us-ascii?Q?nUuc6LxfEamGQwst52HxI+sZKkwqAAP3sEsmgAGhfLBwqxfr3fpUP/+BYp09?=
 =?us-ascii?Q?FLK/5zAz4QRt2Ad/wBRk4/1+cXvHuryXboff6f+khErM93qTiebmdJpiu68X?=
 =?us-ascii?Q?o8sD/MR103ufhpK0xrP0rqeIJx/jS2aEn3sy+nEopmMHQtD6q58byCESblF5?=
 =?us-ascii?Q?A2qaRxb+ZBqfZS96Iy7P0Ar3NfSXjU93MWxNuaSkyTBarBcjxDWmkpTx2yfh?=
 =?us-ascii?Q?X7SQbvoRqd++k31EV3UeTm1XcjXYDwb97cUcFTYircSvBah9W/6SLbHH4hy3?=
 =?us-ascii?Q?UOuNFv6+MNnUXRhbyQZxQ+MFCoD6QVFNOudksROwJMK6L7LWe4JLdd8ivkUL?=
 =?us-ascii?Q?XnS1ZY/hAcIIm3EDKwzJsQfGPAoqsSdPDL/e+xM3QgHmneaKGeJuEQzaAEoA?=
 =?us-ascii?Q?GgKbMYLDYzMDVDrWD/4ymZUhhCLE7MiUms1AedzG9hzh42c6Pxjd0nz21OdN?=
 =?us-ascii?Q?61nOGruXPBX9HQWzpaHtsr/8r7Wj5HCkLqw6Y6ToFEgQW6Xk/qrLvwkUbo4Y?=
 =?us-ascii?Q?gKXRTXKLFcbg1160eVHLoXzGBMOPC3F3sUnAUcbtKuA5IYlZERWMc7SjIWei?=
 =?us-ascii?Q?dWCBMJqkJKgbh0c9LZLOA8Imv63IC0ARCP/moAgbMF/j2OJarje0sNABJLQt?=
 =?us-ascii?Q?R4KictctFEPZvGkHPaVR3R4CQnEBKi9R+/2qUQNIJaNizg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zPrZkfDU9N6fJZYnQhTFH/xe2cb70O0u3Ldz5iLkBT+p3NlndB6VQj6WtRNl?=
 =?us-ascii?Q?7MN4TgAlpsY9tVDMr0iPjuwM2ZMSHOg2rYqClNAkrLH89AfLrzLCRh6ZdfRv?=
 =?us-ascii?Q?pM/nIUevhl/4PMC6YS9f2dR8BM2/BTUocdh/9/QRhGriTVkt34ZzxZn5zeIG?=
 =?us-ascii?Q?+FVFHAyocihL72y7N5Co5lQ2NEXCasgc/kCy4FuXSPLl1b8uPTpziIkrtFik?=
 =?us-ascii?Q?/83rQat6ZHSkMWbfbJlEqfyfLXIsdOBPOZlDrWcC7kVFU8dbqwrK7DpIzxQn?=
 =?us-ascii?Q?97OwQYt0DBOMp0pGEzEQz2PrbnTIVWhyL3Ifl9Zv9Ql/oUM+g1+Rs57gL0zz?=
 =?us-ascii?Q?ZVicw2dV4hC/QfU9wdyEvZEUeIrzo0VJ6ygR0OKEWKbIgZ6bADilp1Eb2Pfn?=
 =?us-ascii?Q?DXOHo6B+XsxQpQWJg4xEqOhiQS+EKWVXWvYYCZRejc9/844bYMfHhA3T3Hie?=
 =?us-ascii?Q?WOhDo+3FFr7kNeYvtlARuKyfSNCupZMK1UcxG6DJKrQrxWgbQrSO+V+P0bWB?=
 =?us-ascii?Q?5cX00AOZr3qq/YgcSxV3oPq9Te1irl12XUv4D7j1NcOdKA39/OYnmWaE6f4q?=
 =?us-ascii?Q?O1VGlJ61ss+tv/IgdjcTCEhTmp8Dy4VvVw9I8SKPUPSy3/6WXM+f62Qz1jLK?=
 =?us-ascii?Q?q9IDbKh64pIjRrPqZeiMgrWKkuHEZXPVA+CcEgk8579zDpKhRTzfVjsr18gq?=
 =?us-ascii?Q?nQ4im7WwfHvpV6vxGcFmKcVBonhHLZ8C03/aMvqPab2jKLgOMJZGhNTQ7oTG?=
 =?us-ascii?Q?1zBqkxNbY7d9i49Ha4fTcUm+jIKZKkCdWxan1Hne0eMZMi+wurLRllDNAHhr?=
 =?us-ascii?Q?QG8IshWQpDDpIDxKAPFQ0XYzct4c40fKzd+HPO+Bi9+XsoC5rfB/Fjksvdty?=
 =?us-ascii?Q?8iyGW8DWIu+TloKvju7NDpFJHvXcBdESlONPlkypuBl4xlBML/SOVinzm2tH?=
 =?us-ascii?Q?NVBwITMfKf7JWyfwBSs3oUxxnkJMuqeqBp5X/mhWvDQjD43FKdtlBDolx55N?=
 =?us-ascii?Q?QdlCMDZSGCSkPStJqVYlnmdpMBUI0n7OFQ8DO6zlIlobuICdptCZNWmzdKKr?=
 =?us-ascii?Q?WUZUQgSxbeGcX4dAxwy9q1P4HCV5e1Sf8iiUSJSpsGH8VxU2BSis8pdgHm2n?=
 =?us-ascii?Q?bU4LtrKpMxDa3vjiMWwmteusddtbic8Ttb+NDLt4HLmlkSm+oE5k6HWItOTW?=
 =?us-ascii?Q?Lf+/HuUyN8FHZkwLrkeT4iV3afQzZgIup4xxvXyMtD9MZRl/Q5spy/YksSOb?=
 =?us-ascii?Q?iZmIjlj+4RZfnaQ+Kr4k3vnePDtUwvmnEMg64qrDOxW0HoqDGsVgHx00sb9e?=
 =?us-ascii?Q?n6U08xlF3Vom80tCw2MCkvMwaQZwwYpp4L5O2Jz4U24KjTYHDw+wqpXoNuio?=
 =?us-ascii?Q?DTBwMOfFjx7WWn+jJsL6KBe9HBUAw6jVO7+xdYnJ4/3FDCGkOfIKyS5o0HjA?=
 =?us-ascii?Q?9KzsPfZsN5g5mSdEX8rcpy2KbePKKZNUsgfUag5lvNn7mlop1GwAFwp9TAZ4?=
 =?us-ascii?Q?iPIWXiZcJaboG/2w6Ck4+2Zl73wT5feioFG6S2CGzndx31OMd91wKNL2B644?=
 =?us-ascii?Q?fSw0b/YPNdoqQgBYVYtmTbV3gka+BE2zSY3JVWP7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0faa4d25-8483-4dec-0a22-08dd0d344e08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:05.7318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umO8qyMRc4hvBJE5l9PuNFg2XEE0wCf9UKyDV3A3b/6n3RgJZhsdemXYSnSO06QOhVK6XseGSFDhvxqSRGvC/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Use generic pmu pattern property. (Krzysztof)

 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
new file mode 100644
index 000000000000..0a72f9f0b5fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller
+
+description: |
+  The Freescale i.MX8qxp Display Controller(DC) is comprised of three main
+  components that include a blit engine for 2D graphics accelerations, display
+  controller for display output processing, as well as a command sequencer.
+
+                                  Display buffers              Source buffers
+                                 (AXI read master)            (AXI read master)
+                                  | .......... |                  | | |
+      +---------------------------+------------+------------------+-+-+------+
+      | Display Controller (DC)   | .......... |                  | | |      |
+      |                           |            |                  | | |      |
+      |   @@@@@@@@@@@  +----------+------------+------------+     | | |      |
+  A   |  | Command   | |          V            V            |     | | |      |
+  X <-+->| Sequencer | |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |     V V V      |
+  I   |  | (AXI CLK) | |   |                            |   |   @@@@@@@@@@   |
+      |   @@@@@@@@@@@  |   |       Pixel Engine         |   |  |          |  |
+      |       |        |   |         (AXI CLK)          |   |  |          |  |
+      |       V        |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |  |          |  |
+  A   |   ***********  |       |   |            |   |       |  |   Blit   |  |
+  H <-+->| Configure | |       V   V            V   V       |  |  Engine  |  |
+  B   |  | (CFG CLK) | |    00000000000      11111111111    |  | (AXI CLK)|  |
+      |   ***********  |   |  Display  |    |  Display  |   |  |          |  |
+      |                |   |  Engine   |    |  Engine   |   |  |          |  |
+      |                |   | (Disp CLK)|    | (Disp CLK)|   |  |          |  |
+      |   @@@@@@@@@@@  |    00000000000      11111111111    |   @@@@@@@@@@   |
+  I   |  |  Common   | |         |                |         |       |        |
+  R <-+--|  Control  | |         |    Display     |         |       |        |
+  Q   |  | (AXI CLK) | |         |   Controller   |         |       |        |
+      |   @@@@@@@@@@@  +------------------------------------+       |        |
+      |                          |                |       ^         |        |
+      +--------------------------+----------------+-------+---------+--------+
+              ^                  |                |       |         |
+              |                  V                V       |         V
+       Clocks & Resets        Display          Display  Panic   Destination
+                              Output0          Output1 Control    buffer
+                                                              (AXI write master)
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: axi
+      - const: cfg
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
+  "^command-sequencer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-command-sequencer
+
+  "^display-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-display-engine
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-intc
+
+  "^pixel-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-pixel-engine
+
+  "^pmu@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-axi-performance-counter
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-controller@56180000 {
+        compatible = "fsl,imx8qxp-dc";
+        reg = <0x56180000 0x40000>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@56180040 {
+            compatible = "fsl,imx8qxp-dc-intc";
+            reg = <0x56180040 0x60>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            interrupt-controller;
+            interrupt-parent = <&dc0_irqsteer>;
+            #interrupt-cells = <1>;
+            interrupts = <448>, <449>, <450>,  <64>,
+                          <65>,  <66>,  <67>,  <68>,
+                          <69>,  <70>, <193>, <194>,
+                         <195>, <196>, <197>,  <72>,
+                          <73>,  <74>,  <75>,  <76>,
+                          <77>,  <78>,  <79>,  <80>,
+                          <81>, <199>, <200>, <201>,
+                         <202>, <203>, <204>, <205>,
+                         <206>, <207>, <208>,   <5>,
+                           <0>,   <1>,   <2>,   <3>,
+                           <4>,  <82>,  <83>,  <84>,
+                          <85>, <209>, <210>, <211>,
+                         <212>;
+            interrupt-names = "store9_shdload",
+                              "store9_framecomplete",
+                              "store9_seqcomplete",
+                              "extdst0_shdload",
+                              "extdst0_framecomplete",
+                              "extdst0_seqcomplete",
+                              "extdst4_shdload",
+                              "extdst4_framecomplete",
+                              "extdst4_seqcomplete",
+                              "extdst1_shdload",
+                              "extdst1_framecomplete",
+                              "extdst1_seqcomplete",
+                              "extdst5_shdload",
+                              "extdst5_framecomplete",
+                              "extdst5_seqcomplete",
+                              "disengcfg_shdload0",
+                              "disengcfg_framecomplete0",
+                              "disengcfg_seqcomplete0",
+                              "framegen0_int0",
+                              "framegen0_int1",
+                              "framegen0_int2",
+                              "framegen0_int3",
+                              "sig0_shdload",
+                              "sig0_valid",
+                              "sig0_error",
+                              "disengcfg_shdload1",
+                              "disengcfg_framecomplete1",
+                              "disengcfg_seqcomplete1",
+                              "framegen1_int0",
+                              "framegen1_int1",
+                              "framegen1_int2",
+                              "framegen1_int3",
+                              "sig1_shdload",
+                              "sig1_valid",
+                              "sig1_error",
+                              "reserved",
+                              "cmdseq_error",
+                              "comctrl_sw0",
+                              "comctrl_sw1",
+                              "comctrl_sw2",
+                              "comctrl_sw3",
+                              "framegen0_primsync_on",
+                              "framegen0_primsync_off",
+                              "framegen0_secsync_on",
+                              "framegen0_secsync_off",
+                              "framegen1_primsync_on",
+                              "framegen1_primsync_off",
+                              "framegen1_secsync_on",
+                              "framegen1_secsync_off";
+        };
+
+        pixel-engine@56180800 {
+            compatible = "fsl,imx8qxp-dc-pixel-engine";
+            reg = <0x56180800 0xac00>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+
+        display-engine@5618b400 {
+            compatible = "fsl,imx8qxp-dc-display-engine";
+            reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+            reg-names = "top", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <15>, <16>, <17>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+    };
-- 
2.34.1

