Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A5B07011
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2110E737;
	Wed, 16 Jul 2025 08:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sI+GULB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F2810E709
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoLVOzS5FKt+C8uOS5RMsgKPSYBA7/4CahuiF6aTNhaX5m0S9Apv5ZldgZvYd35HkzAzc0oqWvJijkUEVa7HfUnM8aSOKAv3P3DIYOz+y8nt4PRr9KBDyj3rG7T3kShXRyoWZRuaBW6scF07SWUn+Y02FN8JtL4AZJTPHKKM6f2SypliIvGQjEsfyiCh3hGRCv+vJMMS4O5Et0N9FBEyVcIZqBRamWZcP09zXwr2MEpqTXCxk45809YLpAyAvRHgoVneG2aAV3uCrolhSul1RtELQSCzZX285BMGWpdtD9yuZC+vsDnFE6gjf0PLDlT2GZ7W7/lBJ9FqJB96GB054w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fQXvSQ8hcZV5gpgxbzsy7pfjCev+iulwGCzlJz9a0o=;
 b=q0UBG8aXjERXmKr8d2ZGQTSZlICQbGpAZpkem2bf/IbaLKCp8LOmOS2b0+IHfiUBcqVqt597jH4Ms19Jhu0QbunZk2DcKbSRDvuRTq0Qgh3j9pXvH18CuVBPwwTBaUOo5XvzdRsWaNx979N9Bi3vJto+I2ajjPvCN3dKAOYNVMsOKqblEYGXudeLZZpT3T0Yq7vQlaZwHup51a9qYAqbnDKSSW+umYfzGeG/cEXInBa9UtVgoSCgNT+xR5cW5v1tgB9ckHWCShfw4qeX/Bqfd2mLsESa6Pp4r3xMjD6fbvDSlbka9yzRd7GIkXiixeIcWkpAPGTp+f5eZqML73woPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fQXvSQ8hcZV5gpgxbzsy7pfjCev+iulwGCzlJz9a0o=;
 b=sI+GULB6BdtLj9rgP/mEQVBtI6ZxfjghngXc/hYKxsyMPmzVxbEKN+SnAJ7j0qNIuNzr/S28qvIw/YZsF3YW4miQNYlFjLt7d1SO6emNeHFj/pZk3Wsu8YqWEEd5DszG104h5Ou4riufR0N2nxdrFz49zhh3v9SFgSy7anSFsL65fI87Q24hzGumIgK78kXQ1U/Ljj/LjWcu/jqGjL7RROlTn/uW0CJGBCjeRmfn2QlxE9PRtciE9gXxNrb67eaKwkr/jx43YeXHKUzOI7lnfuwQwnDsdtWGZoPIDTTkKvHm4pgVNNM5v4oOMdTTU/XV5Gx99HcWaUGQLHVHEFs1ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:49 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:49 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Wed, 16 Jul 2025 11:15:07 +0300
Message-Id: <20250716081519.3400158-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 17556ec0-7c2a-44e6-0a26-08ddc440f926
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XLGTeFDgpoC0tstNA5pbmNHxQywwST+Blege1VBqBbYi0W+K8gUhRSN0J/PN?=
 =?us-ascii?Q?RU+8+88MJLCHIZznXROvzCgKi5fwhKNBHDAVpjQoPzROKhunMW6giqpvr5Us?=
 =?us-ascii?Q?5t9EY9Jgl3xU/UWF7T/c8ijauRwdaYY4+EumJ4DWRJzw+LO/IwIjBCl4n5b4?=
 =?us-ascii?Q?yMym6I3ITrAtO5lwl6bZM6egM2MgydkT+PPN6OnwHEekqf8cVcQ24+NzWz7n?=
 =?us-ascii?Q?tIZEsc823qMse+O7l/JR2FwhztAmLP819VXbP11uN7nwBuYki2iuIqLDg9Vp?=
 =?us-ascii?Q?NovG1twcz0TEnj/4z6UE5TKwFST24+a6EwzuJEoArNdnSjSuYFlajHmq8GZT?=
 =?us-ascii?Q?RqKJy+JvcYznFW23d6vgrHKavCJT5Mfd5xDdlfr/NhVtBJV4r0TAExOJMbmC?=
 =?us-ascii?Q?U/8n7pU1iY7gKnRmFg9NeG+4vSqWasFviurrAnHR3c+b8BpjsZVgOp6gV+aY?=
 =?us-ascii?Q?t8LJPkA0o4MRJ97aH+i3FMVNtcNHdzIyu7hTHiVPv1grz/rSjijbsgW2aNja?=
 =?us-ascii?Q?0w6FBZOEYRaN5IItRTu0MVn6z3fq/1qfC2S94+Kvzb/s7R3wjfwpnHtqchCM?=
 =?us-ascii?Q?j1BrbJI3GjVXP0fRCCy+ZXwbk62KwvbNhO6unm0z+c6iOXCdPpv0N2+AY28n?=
 =?us-ascii?Q?8aEbZI+Z8+qM6PfALaPmoVL5NJUCls6WCeUOM/F+c3iXXRjEXtOWYEi0l7DG?=
 =?us-ascii?Q?G063cR6/Lxd4PIecaVYoLsnpMq5aNtM4jIWFTIrHIPSYRSYFkwswcHkM4F3n?=
 =?us-ascii?Q?Ee+JoOf9ZEPlt9yE92h8KSjKJ9401n/1XMw+W9nS5ry7R4B5gX5/q0ImuEwD?=
 =?us-ascii?Q?ZpgZkysgKlL+jwD2mjYSZH1xY9hYzUF274Gsg+Qz3Zhz7cF5oYg2+e2bNWAK?=
 =?us-ascii?Q?8VjW+/rVNHIg2sxbDsrUKTlCDvLBThKyKIZuajISyjt9SSBL0QCCSmwNW1v3?=
 =?us-ascii?Q?51OgzZV/i2hA+r8zIlPLLhfXKTQHtpX5Y9Y2USEAiHMgXhMB1fuLqJjl9K/J?=
 =?us-ascii?Q?kdDh7ZWQhYnM3C/lQ2rWAQMHaUa94JCmEXz2PBWD8fTT6bA67bNpwfzt4sRB?=
 =?us-ascii?Q?zxrfk5dnQyJYnJcgl+t2/sQNrQeoC5XfevrUbs/hGxdqX7TWI59RtxVZMYMm?=
 =?us-ascii?Q?v3oxSqGMLBTp+lYjBITv1vLDQdirR5xPxPJpnkhOraHNEXcrAaySZ0N2shHX?=
 =?us-ascii?Q?4JSTNwYm4AB8opw7mT/ybkxDJ2Cf+tdPf5TMZjkn3mPR8CgJvwJPdGToXpt3?=
 =?us-ascii?Q?SeUN10rsrw01/Z7m9htfHr1jYALCuJYXW9i9i6NAqJctbIdI3ejWi4Muw+uU?=
 =?us-ascii?Q?Qcz5Vd17R2T74RmFgoX4cehQsL5wHB+9ZshvUN7qI7Z9OV+ovoov6njkllE6?=
 =?us-ascii?Q?558hgn+DhgbpJNGLauMGk6thZdkOj7u0nE9/1P6iAyEar5BZwvEB0P5ILq7f?=
 =?us-ascii?Q?4yeFqYpn8znhVg2g9ybTTPAe5Abf7aqvhHQV5TOtt74bopbflvPSnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UDSYBMvGicwHH7e66ODQ1DEvsxytPDqJP2zFceSXYGzMEI4VhKCjRTtObE8u?=
 =?us-ascii?Q?XmtkxhflAPF0l0RRLI0+GBw4fNlU4bNS4CSSiPGqmrIT8slh2o92pghAL77N?=
 =?us-ascii?Q?hu7PKDp+P6I0VIH+etz8O/ZKIXKNYP9pP38yrP3Ia74+IypqjykJeMkZaChR?=
 =?us-ascii?Q?l+C0MFeZl6CHiRNVBAiUNplkmlQd3uX0z+GsmzDoM15vR71pT2h9pIFynODG?=
 =?us-ascii?Q?kbU0vcjcPKzLgd70tuzBvSkYYJdM6wSwhzWMREByTD2oysQq4Bh3M5UNdJuc?=
 =?us-ascii?Q?xw9+kit/XAsqRZEHVNHZdsL5R1RY9NQOGIIbXQeNw4snzFb+jLUYJ4lUMfHp?=
 =?us-ascii?Q?ExEO4QHm3uYKxSfk2sfmVd0zNE4votWxCLlYijHnXJ5b7TU8vlvqD8H2ByN9?=
 =?us-ascii?Q?+UC3cPg5NAXgKGHlKoiuaabn9IpQBhRU+NNhqRYAi8RfIMMLIaFOvpB3vW1t?=
 =?us-ascii?Q?GjVaMRAl/xdSdXQUMZnCJyhLmNzbcfGjBHS5aKUFWIDPERbm05dZ4wEhEWan?=
 =?us-ascii?Q?hxDiE9HAqsFpXALpU6NIiNdJBPdy2439N99Axz+HRAaMrsT3lp4HWDSgZVSI?=
 =?us-ascii?Q?472QCBUEoHTyIr5kpE0Bu4QY5lCzrzNgBArk8hf+swxxbFutzTNsliGDrrZ8?=
 =?us-ascii?Q?Wv7OYLFYyW68aHmf3mbF71PGQKDmfsQ2Heh3wuCATBLK1nnXc1iEEvqaRX5P?=
 =?us-ascii?Q?9lWzFZl7lWVirbjCLcQTy/exiSuoJUMVMBxip9uVnGC1sDeaaVmW45ohblKK?=
 =?us-ascii?Q?4yPr2hDDpHSxZlU+JsFPMHey+e9OplLa3e7EgJD9XPO9MPk8ONISmCCnbAh9?=
 =?us-ascii?Q?DFZjBVPVF6227wwGUhcYDlOfeLaO4K3Mi8Iq5yDpNpuKKlamXHoC4zymLMK+?=
 =?us-ascii?Q?rsJbyEFZ7fFTQXIn3Wpm07eeMLKP3ki43IEcV9fSshCGdOhCVUHgLWuOR5iT?=
 =?us-ascii?Q?31hovS4doD3m8HmK+Al2oylYR3zAMd5ntZrhmlKWotUDoWzIEx2nfs0dl/to?=
 =?us-ascii?Q?WGTH9+t/tsGg92vupdxnbbxb3KiLBhUIk+OfrCatPWXe+8uh7XEB1VWlSOkR?=
 =?us-ascii?Q?prGu7po0Jk74cC8HbhEJC6qzrXqS1x1yEG/BErR33YnNTv33ZqAJT4v3AqlC?=
 =?us-ascii?Q?Xbf3BeP2pJLfsskGfzUSJK2NjSgohg6EiKMRNxGk8iv6aHmmdc8QyRbLcA/l?=
 =?us-ascii?Q?ozlR9fH5A65OWAVgzxirOdcextE3TSIGtSAppIVNs+g/6HzgwQKcvVCAp1IG?=
 =?us-ascii?Q?QvHwGWTIghAeK8ZaO2DlScUBKpThukQ7Kc60wyZ+Xw9R5M3B4tMx10D5jaKI?=
 =?us-ascii?Q?AIfV8t3k8hehu7cfcq1JYEw9cUJ7yM1JzGUru78boQrAOErdjV3iRQSWJDds?=
 =?us-ascii?Q?m6HWaEyAPNCCWKXxtwYbhv579t74ZeZo66ha4vAIlp3VZqwHOxV9/9GbwMqC?=
 =?us-ascii?Q?PGdaZJr9smJkwUx2IjL5gvEeU5NoaOZesHMcWlvOZPt16zH63Y+FI22jzMEp?=
 =?us-ascii?Q?3zGlAOpUuq5BQAo7WaQjpSF2BssgwseGplP1r5NewRT/zRpwSfdlg0UBDzbz?=
 =?us-ascii?Q?8yhsS3dl9PHM0HY4b6VVcUaXjnxSrq1dHXXCwO3dQzJr8GnhSSGmF/bgnTdF?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17556ec0-7c2a-44e6-0a26-08ddc440f926
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:49.5185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXv+tgoiQ8IkgdccWr4xrOwLBTnbrTy+3XoLMJWwju9wHIP6EWJvSthZtdqvzA3X7ydZN4VWMP3DZ+vnwPfscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
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

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..a54b8f1478049 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:
-- 
2.34.1

