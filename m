Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73059FE206
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4921210E452;
	Mon, 30 Dec 2024 02:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fS0K+23m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0810E452
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0BeJy77EiBirYm3Ijtu45ldDwEYnLP2cJCRqclnOxXrVBY0yfmlntoB5hkD3muy0be7c1eMgFM5/3tt4aba8Z26Q3UeMHjUV1RD/Z7nK9VRmtsrvc9WDTgmYyWyxtZUadza197ia1hBte9Xum6dYsiyuZ+yb5cgOiBnvEVowuaPJxw63/tIyQ96RoluCfSIrnei85oc84nWqvcrgxSo3OWl54GU05bYHKDDDAQguYVHNeq0pPUpTw/NqI4STlBYq9VRYAXNqWfGdQW/pKJhyrpCBJOwuN/btQwwleRwvWLttDkdjM36jvUkUPgVGdLAzV7O3BJjGN5gWasUYNU5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN921EOXRH4ZDzMBHcbJy6+yRoKwj3va4roCPLqmHM0=;
 b=vBN0PcWeqU3raoPkJRcgFIFrBTX2gg+9UR/JfDxY/nU3BxudEzdrsX0cY1TcGQ9bZv0XiUxlCXPaw+JyKFAFI3/xHtwlf7Jawm9WRvsxIocyJErB9jeF7n1mpSk6laXZv43KIGJYg1unzLXj7w1Hu5Mcw2s2CclvcVtSXmNmrl1i4y/d+bCLX37NYbwl00uxNMpEYUROV6YqKrc20KjHUSbsPn2tbGHjlPvqZfrW3GegPJa8TRBkUBMZHSFNgm4i6jk9xw96zBwByzvgdJxfiWm7K5IPQploKXjsT5EXRtVUJg8dDJpXvE7XQdtT5nS+o/7IAyvYG5r3dFAPXuiX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN921EOXRH4ZDzMBHcbJy6+yRoKwj3va4roCPLqmHM0=;
 b=fS0K+23mq+1kli+ImOgHgMX6FBhtBi844CGjHrFhRQeYsoYMqyoKzDJsbx0UpV4UregHMANc9KZhCVEZvO1jIskyCuYzddmYGKyZ3lawYklkCWpRqtZxMSBXzqS5YB5iVEpxykHUDgYSE4fcgbuKtW5dv/0qsU4YTQbERWnCHeFnWCceJwJuGh1+vTVju9NFGwE/botbe/dIc9z/HEyNgfiERTOiPEv0c5gqAuRh3qzrfDtdmXoXysdpnnio919GVy3P7gPNIg6ua1aMLxTPchaAdAOmMhvcoZ8tKRlHdyxWRvJwOt+RVA2LXr4QojVAo8vEvkeFEh6UnIwKXhEZsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:13:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:13:05 +0000
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
Subject: [PATCH v8 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Mon, 30 Dec 2024 10:11:56 +0800
Message-Id: <20241230021207.220144-9-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7dddd9b7-603b-4f7c-405e-08dd28777f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cVbrnI+zbnO8wXPDAdP3Tmd+mKHV8zf/Z9Bgq0kHwMdvty9OCaoLWeur2Z62?=
 =?us-ascii?Q?lX6aq1BGjC/NaOcJSnHzuoJvEue2NoGRdRySeSmtiLR1hN9I1Mx/OO9DJZL3?=
 =?us-ascii?Q?k98zWmPPpe+z27MdvK1qB2EMCCBv2kCHJYHkT5p+IU3y5+B7cvKerMcmE7EC?=
 =?us-ascii?Q?Qolp0vANbhhGeZ0wR6s+2b+8OrAVvlRoK8m6IqxXdkqvR1QSJiGMn92K/X8f?=
 =?us-ascii?Q?TjfL/fBMEZgkYJ2Xwy876WFlr1vn+cSnaGJdxyOp8ZuDt3DVLj0Z6X6tUelc?=
 =?us-ascii?Q?T3XAAtp59qlRKf1jFiGuqNoLXOMS8vV4SG91Y2s9gOv8mL8nNaotpa/4QhLF?=
 =?us-ascii?Q?jVEUvbuMGezwVd4BfPjmnT+lECyfFylayMMnh27rpS5VQjyNwAZx7SWKR1OA?=
 =?us-ascii?Q?wqm3dtqFwDejgK5wk8bvfpq1MHj8fRqxzQD2Kyd61BsnBTOsaMo7W1IPylmI?=
 =?us-ascii?Q?37u7JcLEDdXJOcmHbpNCEyJ/Qq6WT/hgfHHzg3V6KA5DY8tX5jh47S7PFcip?=
 =?us-ascii?Q?rWI6rqvT057CZhdm1mMtDyFUeR4OmOVQX1WMNTxQF0lQ3VJrqHul/svXKqrb?=
 =?us-ascii?Q?aqol65c7THqTyY/GJxdn1TRPCXPepp3kddMD8OmlN1OjxB2TC2xCbx0gMM2w?=
 =?us-ascii?Q?zvXVaHs2jWvZ1oIWS8BloV+Wco0uBSxzuOJtAJflbE18rUzVWU2Bv5xgxbFC?=
 =?us-ascii?Q?2Nboc0yWd+9o5tIN7DmDbrCnzysKqwdO4fOu97zJq0CwDiJZLYHlEiMNU+YU?=
 =?us-ascii?Q?IueV0Qz7QhpUotccJjGXIGqxwV3UODSG++99XO1IsrXffc9XRriNq/pefZoh?=
 =?us-ascii?Q?HjDShxoab6csWKc+L5nBGuSLLdKohs/95JDE0nI/pyHshjdFKujLLtyh2CcW?=
 =?us-ascii?Q?0tiikBupaFzgUpwGu0ed5CUU9gZSM+MUfmyolcXsdsrF8iq8FHGK39sEFuTt?=
 =?us-ascii?Q?5a0onaN5eq/G7eAhzzv8stgmDl44gZkA5J2tFPVYssZIGnE25YE3Nf71zzU4?=
 =?us-ascii?Q?j0X45a8OwSaBTnghBPPo1iPu8cqJ+u6VU45EPWUNPaGHZyPWAcQnLvW4aZ2V?=
 =?us-ascii?Q?HJcrVXD7j1YUaFqiK/pIYOoMeXb/vdFFtnvnYY3AjnHM2mUOXRyz+dvE9guo?=
 =?us-ascii?Q?/ZwMHRO2iXJrS0YiphvvuxYscqfIP5mNb0nOVpI/ZjT1pB2BJYgC2xbSD5Ju?=
 =?us-ascii?Q?uU9+ZlgxVEKYlnEutq3yH3oa+iPI1Ynd5ycKFkAI/mCWlFpHPgaXNIWnKnVn?=
 =?us-ascii?Q?LChoCB/OsNtlIqNC2OTWBjx1lt0mrvM7vQhbMom+IvF6FRCvcILAmJZcjHMN?=
 =?us-ascii?Q?Kmgq3iJepXrSoLkN47NAHNPWd80fnxFdddZlC1AvDyVHhGoz8z1Gn+SXcTbE?=
 =?us-ascii?Q?SK0nid7m8SajV+YAl9KZBP1Atb9r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VodLQh/Z9dwqd1OoYGK7TCyFTzBIcOwBLRiW62uC9EYIgfLpNU7vBuSk8SkF?=
 =?us-ascii?Q?oM/l95CDo1B8NF+vuHw25RM7N3w55+gOQVeBLvhEjgRoAvAFYbJCnYxF2M17?=
 =?us-ascii?Q?ovib9EzH17iYKuQGQTWyZvPFIn6bGs2BH+JLlOMoyZ+NLoR26PQqpix5xAcy?=
 =?us-ascii?Q?LC6QPF0gkdTDGNlw7jg2BKpfWgbtv+hV2NVZJ8dOB9PEL/4FW/P6s+J9Jl9j?=
 =?us-ascii?Q?sx/te2SH42S/2/K4Uro3hgSMYpKLmv1RQYaSvHnVa+93xLUxonfmclzfK/cF?=
 =?us-ascii?Q?21nor6t0Wv7eD7FQeCmtf+bspvz7Sc6h2bh+I9WSQTZoj7tAZLLTIF1+0kM4?=
 =?us-ascii?Q?e9G+1e0E1eZ90lSH6uc94ltUoyrGw5YgUYDtNHeNHti6cM/ljT61wWnPDQEL?=
 =?us-ascii?Q?/MKdtM6z0XHmAtWJ+9IWX3A3MDpA8nwkrb7lEwpk+pbqb20A8kDid5yOAc+G?=
 =?us-ascii?Q?ehGUpSQyqaqnNtv6Ts4VX09aQMa/b+GqKYM249KMz1pe2oTU74Y59wmoW1Tj?=
 =?us-ascii?Q?lLXgX5cpCyMG0TmrCr1Wj0AQ2YZ5cu9oMA6Z0P4Kxx6koBeP0h3Ae3NywaTJ?=
 =?us-ascii?Q?96YQu1L1zMv+mNZtxhSnSjAf9a5buXDqBycV5mFAFgbtb8gxUISdg6uIEfQr?=
 =?us-ascii?Q?mYwXIn48/mOtHbRdq5QCeNU8WYo+Mnvzx7XOOTtL9JCjnnMY7MjN83FMX7o6?=
 =?us-ascii?Q?aQ9KDf6Losh8iVwTfslokaThDW6sKooUMJKV+2puwWnw49/TuecW72FLdLvh?=
 =?us-ascii?Q?HB0VQvRXWF+SYfjnBE51YvWzP7wMvk3IvmOHpX6ZBBh0ksG+rqQ0dDk+58mx?=
 =?us-ascii?Q?94Rz/dDFDMpLriA9vOitS8ybVesjJ+/iubF/K0XAT7LSWA1iHkPn6yx1wIcR?=
 =?us-ascii?Q?iBov64SIZGAwG3zg99dV/gbKNmWV4ACO86czauedOdq7dAd6kOV5v/eADogZ?=
 =?us-ascii?Q?30R5CjlH+Xxn6bVQzI7Os1fq8A42fU/bhRKEppy3txYaW3LqWhOFqmrx53pn?=
 =?us-ascii?Q?BP53FyQKicMyOJBE+BYnEpJDxZZAu5ZvEtQvkOa8u9/gGZZYTUzX1Es7tDVB?=
 =?us-ascii?Q?6J2dQlSxxxENJF2I1xP267obi4ZVNGyxO/cVHM77uJumcwSphGlpI/mWtJ2/?=
 =?us-ascii?Q?IjQ5qtGC145LrSOX7u8G/deGvlbr3SHC+pYG0Lkd2nrxFQzVLXGvST0j2ga4?=
 =?us-ascii?Q?MJj0aa7ILVmY6LrJeqcEHlN4a0xmEBlwbB/x/6KZw8DxxgfwugW2cmtzvAcj?=
 =?us-ascii?Q?bO7JIjk2kiy3qkPwcYScSgxNMPUGJV9/kfqTG4ohpHP8t0Bi0+GfLX3UI2F/?=
 =?us-ascii?Q?0+PWfnzWgQ0ldbsHHDJNSrjpJKhw366yJMTTkcJCuDaGdWt8WejdMwrPwVSe?=
 =?us-ascii?Q?q8MZBrQttjI3ny6tkFaY9Ly5xkIhwmcA5HPhpAIx2amyiXedppADZjgeYLgo?=
 =?us-ascii?Q?ELFkoZhAUZ/6owZp1Qk7AMCGKywzNzD/UYsJWWQYWmK2pHLOvAqBelhaiQCG?=
 =?us-ascii?Q?cw57w3in0eqiS14yYZ5CUAYsbj9UMFS1aIHY9H/loXvIZ3bTNTM0IGmI7ZKb?=
 =?us-ascii?Q?jhag7MCTcO17dUlDlYDds7d/Fc645HTEFSPgHlWp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dddd9b7-603b-4f7c-405e-08dd28777f10
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:13:05.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVkAE8wHfa/DuSvo7wEAUQS+3sM1kLRVbaifd+qLAgjk8LgFubjkA2pwvuTElpflqm9VL9bc3vEltu3XyeoCMg==
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Drop DT alias documentations and add instance numbers to display engine
  compatible strings. (Rob)

v6:
* No change.

v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

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

