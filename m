Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C695AE23
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06B10E781;
	Thu, 22 Aug 2024 06:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="I3eoZeL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2063.outbound.protection.outlook.com [40.107.117.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1B310E77F;
 Thu, 22 Aug 2024 06:55:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+MNeNa31xyMCWsjPNy7IxtfBMfKPU1IuvHbGcC4xL/G23tRawtKvcGVNemJ67ywR1WKP2r7P4iZLSJ9oRmOCElXvKKh00DBe/YguieAYNP/VZOx8mG45llpWQp7fM/Hq15z3OZfMNLdDdo/960nFFuLZfuXFOId66cf5pa2RJKNw8WzPt7ppCexBRtyKuBnBehsvZMY0N339w/Iz8J073nU5h/CCyRafHsN6ejKJY/P/q15QCF7HgV1+LFMGOesuwTsZN7ZO/s9X1VqOVU6jB7oAWQlKNe3J7Fm6/6nyi+QG/rQa9Eg7FgxpwJz4z8le5WVI/7FV1qn1PdJxt376A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=N8I3DHcGDCl/Q0u+v4SWJorcbd7pg1Xtci9Ft0HPlQJnJtEUgQcNpxpS+tYkTWsDppqpfBHYMKpCOGTbWZV9/+LqgwQE9XPA+tJcuz6N4ULTzwrplYy8zBmesJ1dIjqvVLUcZ3EB44RFs0rv63IHMKiDCk29nzB08pba5c3va3eThynnbbNDabYEUjPQlbcFJm04D5rmRb65CTAWvh7l8qG9UhWRq7QGWMBgcMD42UulpdcLDdj/XSWMRyzTNgchHy8LR4kIt/1rChiAdQz7S0ABt10kKPATqFiozcXjDeblXItagNYk/DCTtzecEQL6oG4IuAqdHHLLD1TsAhxW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=I3eoZeL/IBZc41ivNA5nBxdKzTX/iPUvtUbzOgmjpAXfCSX/3uw4Hr5pRZu0wB3fZ9VeHSgtMpOAInGVHz5pzsQOoOs1H6aXiF0OImjjmNkVgFa1nrDB5idqu84ol3gKIN6tWRwYFirOAo7TBVbMiqTTwQMoRHRH395U56sEtEIgpaL589tI73ed3kx2lnKLr2fIICFq5F+6EcdE0u5l1+eT6ESEIZCxBVxo304Jy7E1r9/Lk1UlxcuR3oVGYbbWxCCct8KCOU2CyTtSr44ZcJeC3CoIkOm+A6KhP72vTlo+hfPIWNx8Owf+JPIXRKUD5wT9cSGA/kdLz4TlnNaPzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:55:07 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:55:07 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 1/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:54:42 +0800
Message-Id: <20240822065447.1333390-2-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065447.1333390-1-yujiaoliang@vivo.com>
References: <20240822065447.1333390-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 302f88bb-faf8-440f-ddf1-08dcc2775b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dCwpgp1Akpsu7F4nW9x02nG0MbzlmykmrQDf+nIiCc4xWgwVKdi0UKIlYyBN?=
 =?us-ascii?Q?2qAcrBjIWGpr1EfkK57QnfO/0faw1Z+u55jo1cshF9HBkPbmWBISdFA/rOXf?=
 =?us-ascii?Q?MjIm5M3/0tzZnEeYu28WGrgFSHFjYP88D5GkzaUoWiyKeO6nNynhfehjw1dN?=
 =?us-ascii?Q?Su5UjhM55RWlPZ3PePgy+LcRKbWqaytTziCbFGEIVXCy+S9aDKGfAnYkQSsJ?=
 =?us-ascii?Q?Du2O+kSHhbM1BBEGnEOPCMXdZrlFbphjwvq7HK6ThLfobZ1aywLlJIDbRFZn?=
 =?us-ascii?Q?yyLiirshFBO+MZo12VGE4SB9YFBB2e/CEwxTDAZYP42BF1HT9HJKw1uzJRjL?=
 =?us-ascii?Q?sY7iBCFBeWNPUIdTCthE8qxIGyPWgcYzK1c/yOAxSt46GgPS9UMO2mOGEpck?=
 =?us-ascii?Q?zKxg0QKP1iUKhlfuD5TNV0MA1oadoLH+yWxcJDAoeAwlSGPRlG+ub6Tvjzt9?=
 =?us-ascii?Q?Jt7EMfbf5OAnW3b2RlPZb2/dHUpVd8NcdMJX3pRVxvthbkBM65VNSnnqPIVx?=
 =?us-ascii?Q?RDp0Cs3o3JfgcIlod8lA+f859KCoDeDxLstO2cwYP2tFp3aBtBvnuxkAr/NA?=
 =?us-ascii?Q?7tFRjuzXVh7OiQgJ+j7RN+gOamHrJqo3XyQiSi1RVfnQVWLWqqGc4rxLh4Sk?=
 =?us-ascii?Q?dYZVtkS+gkGYYKbW4WyHHtXze91st8hy0mpNHOQxHASiaCT5yKl5JOb4evUx?=
 =?us-ascii?Q?FUPVRkah8T/FybKJTma0Moi1EV6ZDmsrXQWE2U0A8HSvzV/qnQ2SaXfXAoCh?=
 =?us-ascii?Q?oScjqIkfSBKPJ02TnypggLpfpcKeEmCR+TNsPFx2QDtk4arJYiB4nLzet9UV?=
 =?us-ascii?Q?eN4yiRlpjRMfbiwYfwL3x9lS/1WM6rIo5zFMMZ6eDCbqdB5GW5d101q7vj1V?=
 =?us-ascii?Q?daP3bPeh5nnJEWgkjeFDkBVEqylsAHwh+8kMqQJ2zhP2kidrRru+7x5u6wGQ?=
 =?us-ascii?Q?eYw/SBPVQTZDage08LOzWWAiHK2taX+1Zq6NPfIoAyRn1ekdhxncBniAJ3n0?=
 =?us-ascii?Q?4ujCtLK1MixWl1StNs6v0fMpdHcAKVk3f42RL/vkQ3uZY4cTw3qqZVWZkDXz?=
 =?us-ascii?Q?ytSpHm6O11644PUzOh6VSUv1qtxyy7+us97OL7f8e5VfHa1xC9Xw1xA9VDiB?=
 =?us-ascii?Q?NJXPyMLuiGpOjORHfvbbW/HaKW3UsCiG2gSwrGrQRkJehSJqehoHPFMqbHC6?=
 =?us-ascii?Q?Ew8AxizxsO1L/uwi06tSwTbcLZuDOD8XFNanRMQVOneRPv5M6QWL9ktPqrXY?=
 =?us-ascii?Q?k8h4bJQ4KPsqEpGqypqyGx43RSJoN3rzvr4IlrMzwGSY51ck079WdB6PsPCt?=
 =?us-ascii?Q?jcYP7U79+oahW5yI5qeQgORFW9PD0MvRc4IrAmv/lXOa7WqkPWvmsPLPCUhM?=
 =?us-ascii?Q?mqAxir1M+nWbWk4PqBrIwZbgEp2su2PlC6298sAIwwF4+PFQlzSxd/2Q6ZdI?=
 =?us-ascii?Q?YWAf3+IjH58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BKjoH/Kxi3AzxrO/6e64YhxmzYp8VEGD4T8b3UL+RjuFdK8Fxw5VZ4kJtzPY?=
 =?us-ascii?Q?Gv1Om5E9in2Psl5gf908dlcXAwuG+Vbz6P3uXRjQFAmy2ELvbmE2S8qhralk?=
 =?us-ascii?Q?kOTgj9YMVxXewopnOKSuyBsZMc/UVsuWivyIcUmP43J2pFLCZQLDkqCLTuSg?=
 =?us-ascii?Q?ANIYeTFwFp4l9/TbZB4y5oFHbGKAr0led6VYRBv9K0m46y17P8nqEZKW3j+1?=
 =?us-ascii?Q?9gB85h/ZF+33iCq9TXFTAfeUbLiCzc8uj9afTjduoEe4aIWH8rsuN16gFxgn?=
 =?us-ascii?Q?7rUfMTUNyC+yHoe3Fxts3f6m+YMOHfiw0ZCYZzyVegyDaNCdl/PK9G5+MVKc?=
 =?us-ascii?Q?AHEInjLhvoeip2cHtdpFDC2tdmY6InNmhO41KzfFxd5Z2E1BFXY191jZImNU?=
 =?us-ascii?Q?IdgWJoTDzf1p1Z0LwofAS3/RKDdogCzJu9hTfewjsTkznjLWziD2HEa3xe7L?=
 =?us-ascii?Q?xvFqsN9bCzJ5fYtSNJ93kJE8IOq8Is3ZKrGlyp6AgsDzw9JozGf9pn6ID8Zd?=
 =?us-ascii?Q?SVs/hp4qTEuBkJ9pAhWB4Ubh0RoJwlAks7kEYu50YADmCJJR33dX4TVMfg4i?=
 =?us-ascii?Q?12AUR2+TnIQgGxzWTmktjxHLbl5Nz6C7D0wwN0PXSKu+32tfiU4W2oLH07ZN?=
 =?us-ascii?Q?DFKhq6x/nB2Wl92fivCDqPhlcjGeNxIgU06NKoF6uv0el1JL0Q8ih+HVCqzl?=
 =?us-ascii?Q?sydFM2UciOB3AmA+/KufTYCp0iKD8BDBuwBTz84M1BO+TKkWgr97yDTjA7wF?=
 =?us-ascii?Q?pML4z2Rnyd/AaJs25AWke/u2ms21GUW7Pne9Gq0AkGYYYWvsHFY4axsQEXaX?=
 =?us-ascii?Q?01Pbk+nOzVbS7XU/VOs0cGTN3RSYiSf0fuVilB9LcLE15256asHdmyT03yAD?=
 =?us-ascii?Q?jn9+hLCkke7D1bTJ5OgA86LsmPobjCK8AQlvXnYKQQk4cTSua7GahNCb8fF+?=
 =?us-ascii?Q?tilEhQkQhm8A+lsQdEByphKKnIft+ziMWoWxkQsepulcLtYUXGbm8vBdT84k?=
 =?us-ascii?Q?8GdS/taTd+tWr1bGjzrPaUTm0kVUXC5PE5u/Ccy1E6/mSn2Dt5hF+C5eCSMp?=
 =?us-ascii?Q?UjUWxyRBDgkB3vjNSmTN5BixK24PcNR8hgcIkf9YdEUP6+Iy90VChhBkgToY?=
 =?us-ascii?Q?/6+8iWOlf/iyl4C0yS6q7IBQs1gqsxtj39mpFPrYY2k3nBD0jybKsS1ve13G?=
 =?us-ascii?Q?dCdIXw0Oq0HNbu4gFGPgHVC6Xcw/5nvS4rmD7Hn8n7I9S+LL3ppj5BUdz/N3?=
 =?us-ascii?Q?dXUSGvkKd4TO5MFGNcb/Y71dhAJ8gjbgqxEVQGdZFlO5mb5DNLe0TCRONGxl?=
 =?us-ascii?Q?+cHt0ad637oqQ2XVIT49/qo/HvqGJHkJJcoQ6cEp81f6PjToaIoqI4IR887G?=
 =?us-ascii?Q?rwjquC4sexJqcGFUZvWHdTlbeT5dqxJCuX5F0MUkv8qoTRaR7FFoRHrrTeqm?=
 =?us-ascii?Q?0cM+TP13zd+WY/h9v+o0wepw8hXhHK5pM9Ts6bRBmEaVJz2txSakY26tCGN9?=
 =?us-ascii?Q?1KW8I63tvHgzQimy8KI5axsy01xcKD/M63om/YI09EzbGJsXvdALYF1vn3Y6?=
 =?us-ascii?Q?twLEV3HhltFNRrjlk4OLk1IxlxpIxksX72IVg7WI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302f88bb-faf8-440f-ddf1-08dcc2775b69
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:55:07.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwI3goTtQqt4tq3i/ImJvpvjE5JvBEbo+FRwHvksfavFcFzelQ+Jg10IZNrvTRQ3iW17KtN3avXaAiAyijmR8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5982
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 3bacf470f7c5..f8c1650eb21f 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -2300,8 +2300,8 @@ static enum bp_result get_integrated_info_v8(
 		le32_to_cpu(info_v8->ulNbpStateNClkFreq[0]);
 	for (i = 1; i < 4; ++i)
 		info->minimum_n_clk =
-			info->minimum_n_clk < le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]) ?
-			info->minimum_n_clk : le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]);
+			min(info->minimum_n_clk,
+			    le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]));
 
 	info->idle_n_clk = le32_to_cpu(info_v8->ulIdleNClk);
 	info->ddr_dll_power_up_time =
-- 
2.34.1

