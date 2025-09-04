Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D84B43A18
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED010E9FF;
	Thu,  4 Sep 2025 11:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VQ40FkwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013050.outbound.protection.outlook.com
 [40.107.44.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562CE10E9FF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2Hre2urpvptKT5DCQjHIHbg8rwa6SpY4O/JNKGp7APSzvhXFHOYhZEw4x8ylyO5TXRx4nIc2xcvY+OuIx3OWSa1dRDggG4MN373DAy1IT1dUbo9hK3tobW5Aqqj1tezs9fLE9Cf7I/Dcp+hSJEIdCWkeieJjAxY7OsE3pjJ/yE1hbhHHCtiNA3ef0U8BAOjTehoIfqgzjmY2+77O65+Gx0FqT2r+5z5Yccpc/BzKg10/eM8HfqbDefEh+nQ37CobDKqGVLU4P6zsI7saMAN+AUozNp6ckM11dE3jRLIs66+jd6WE0paxGc62eSQAutRaZHcBbMn8QKjUXh9YyoCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chhjTT0HkHObU9k2wz0nc4+UzZ/+2+7nfCcx6T7u6pQ=;
 b=s2Jz9XMPVL/P+t2xu5JiXJGAsOhl+bpt6I7rtJCR3CKjnbZyyQTEPrMNN5hborL7vdWa/mkCKyP4vCGgmR9tE1MH+UYqj9CSoqXAaVowo1uIgvBQveCMa0wsOiWY0scYCCNlq5oTDmRbjD2ZGLpuZmOHLjjAPX79Ce6pstRtT891dkX+L54CJL08FpypwK6573fdl/ILltt6Jjf5S1COHsq6agnjr0i6u0nLXu6epuBLpBcpEsMLsHdTWZHF10h3LoueZNh6TP/TptBu1RA3aPnX2HYg2EZ0Gy0bSDMcSfNmdfp2c2PzTcdbizw3ZcpzCdBDNHMv2DASrESw3IDf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chhjTT0HkHObU9k2wz0nc4+UzZ/+2+7nfCcx6T7u6pQ=;
 b=VQ40FkwFCYqUAivxvp2/uRZobitbo+UBNCKsJFdcbnLPk6X2Aq8xQ3Gevb52E/RN6/TWl8AlxLnKvmLF7410zRgVr1MdhuHg+7HqnE1t9fVvqjnAHtUyJUFTAGBMta6g/U0az6zaaG5fagQLOxSQFVj+UF8j+PDNHem69pJulcsKfcPYbffhaiuS1lCR058vNm/P/cpOnbXgbn84Q+61m2yXvHiFGMU7Ok4JJnP1DHf/3VInhmSy5BsnvHPR1PmDyPhWYQMy18Jc9AVv4QUwOMXP+SU1W+v5fLpiWUo8IccLqZGmLZlZ9XTWbaq8PhfJkWFeum9Lfu2jaZXv/b4x2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB5753.apcprd06.prod.outlook.com (2603:1096:400:271::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:28:34 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:28:34 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/sun4i: hdmi: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:28:23 +0800
Message-Id: <20250904112824.350939-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f36aa20-567f-4ed9-7fa7-08ddeba62f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4hFukAXH+uNDDZoyJkoqUBbm3p8NJl+nnoXg+Vyticf/rWZIElPVHa6afN45?=
 =?us-ascii?Q?5MAm+EEfEhWBYXtqW627BZ9IaGpWx5kffM0oOk0xFKmuiVHlX9rfRIsb78CZ?=
 =?us-ascii?Q?+TAcYgD8zjAoLzg6J2AHKa22e0U+DZl9Pjs/TwqsOZIluEDnnYU5RtnBz0lS?=
 =?us-ascii?Q?wP0KHLJsEP+kyY/D1MPuYqq8qqruxuVnCTPgB3161j2NE4GsTCML8TpTBlM1?=
 =?us-ascii?Q?dh/uxDtG9jSEWW+RjSlwDw79reZ6X29gAY6PDKHSBvYOzobaOqv0O/T1PvF2?=
 =?us-ascii?Q?4WKGOgDVzWsipLAf0ESZ3zdJZ7NtfMnPjkAhBhmEIvO2Nthe9QJ9qMT1e9if?=
 =?us-ascii?Q?j/JQQSJyZ46GtM3sxraAvNRgGq0dGJ5ipmSFf0dFHy0e5kgG1QY1YsqF0xwj?=
 =?us-ascii?Q?NU+FFrHxeloJT8T+BEUv+/pWyGXkmpGeN3beFK4NRvuq4VThnd0ZndDXrEdx?=
 =?us-ascii?Q?ke45V+0niYwxUDT0WqVOm0GuXS/JjwAGdqjzqGs9vg0Au3O5mPJzOXI/Pixq?=
 =?us-ascii?Q?lTn/Yqad00ePOnMMg3yi7KsXRgqi6jBYouv04FR6Zy1r3KoE3wWJYD2efxbV?=
 =?us-ascii?Q?stOaz/TZP8cE4/DtFaDoU94wSJA0fPF46CaSe4XW5PNEiEEjFYZjlUSRdkZu?=
 =?us-ascii?Q?LmWs/HCY4D/OHjL72KvaW2TvPxNxsIAgrK24oQfM7PPRTm7zDI4Vf9V3fA95?=
 =?us-ascii?Q?1eGkKS3916Z249a7MzG9upcgMcrEccACT/awwYEvk0t6rl4ahBO9opThMw8Z?=
 =?us-ascii?Q?63/88iw1YaqP1l/wGchhGv2kd68nXKz5ms47tG8/y1lASTz+YJETlpxnsoW9?=
 =?us-ascii?Q?opllnaZC+BRZNnM2cMIM3Moxh4ctBY6mBnSZnz1ZA0cPY9AN0QIrbfmc9uL8?=
 =?us-ascii?Q?5Iq8YZsAi1xdn09GFyjaREJb2P5BBDMJhuyJCMKbj9ckTldwD1Gy/rUUkKMq?=
 =?us-ascii?Q?gZwt6P+STfw00oXS7pso+gdqMxUPtBunWk6OTQVgVsWj+eI+N8kkI2ZNZITT?=
 =?us-ascii?Q?k8QmifVuVuoK9VtwsFeI0MZvDH9137g+AfzuSnZcb5fgsxo1MjLHfE2ar00U?=
 =?us-ascii?Q?TE2vd59w+MJ4NldbRdCu0jkSz2WcQwfaqqmDnrFpb915iaPEh6QyzYp+hxSQ?=
 =?us-ascii?Q?Mq1RX/JEodNPJrvaiMseeLxm4+78o17YclzkT/InoBDHrV1ue5SN7U13BSOk?=
 =?us-ascii?Q?LESHrERwogekypLLgGWJAWzneK8iN0Z9LaLnrayfJY0gvZ/+E2rYmhL1e62I?=
 =?us-ascii?Q?yF248rC+T3sHJdkvOM0vBbJB4m88YvlEX32SK56aQuFYTujMspLtXufjdprs?=
 =?us-ascii?Q?c8RMg28zyDj9PC6pSBHOOxRhNqIe4mJM9d6FbDlFqZ6Bb7+rALaRlqj2KfbO?=
 =?us-ascii?Q?MkGR5C1eMm280RjtAfLuVwhNIaGL/hBXio+SRefUBL1uUXgzlaasVZ38CNxj?=
 =?us-ascii?Q?dAIyfL4OrOmK+cSCthlS5MTfzSKmnUnZRSgFJWo32PpPtFxD4zOBD6TvQfBC?=
 =?us-ascii?Q?h+tyyVvD1LVmMl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XmdDCcaBmdxdP49Qv016mf5bvlaOi33848xx3G+eFjnXIg0gZ47U+aBGhIcu?=
 =?us-ascii?Q?qg6BpaDHMVfxK7wLVsl4PeG7OTlFeBo8OFg8B1/uIbjDn0XSkq+EetBZrs1G?=
 =?us-ascii?Q?i2IDXnz3uZjiah6D9bLM+arLZ4F3M3xnrjtCKv8Wfvt0ZLZP+MUCZZKPo1nc?=
 =?us-ascii?Q?t+dpEsoqe1uoenXLI0gA2lJyEDSwbhQ79e848QgLIemnrgnUMc+JXNRZqmd+?=
 =?us-ascii?Q?yR8KvX69fgLgcxlG5v2Cddp5UHviZ1nGzkczVNLDWc7I4K+h52JBq+DCoj9a?=
 =?us-ascii?Q?guaaySmHPHfpu8IM5g/P2LPoWzh3QbONsQtitM92A0gIJv1VXl81F9iZOkJv?=
 =?us-ascii?Q?f3uSf9f1V9KmEHkihT4dlUi1ivTDZT9CNKR03glqqu42M59JOpqNp7VvcHrO?=
 =?us-ascii?Q?S+adOVk1DlIHEE+qsoFcwi7BrqQzDh/gAvB1cIYCps+GU77dF6tEE/bNyu+3?=
 =?us-ascii?Q?YRF84Fp6gDJNaRi+JXisgJ3FNNsPXuhKgpearKrVLqxhvJKmDYU70GuTxEqr?=
 =?us-ascii?Q?R+hLZ00/76lEGhl7S3rniZvGUnh9tX+N/tN3HvNij3TLvDMWbZpK1hCh3ikK?=
 =?us-ascii?Q?PzvWiUWZCobVxpr60KGaWrFAl07/13MNj6ASv6yoOQuSoZLxqhRoNaqXsPuG?=
 =?us-ascii?Q?wY7Ij2dgWP9La9o+cSiDQoivXKxTRmqefmdrncTSCKbuG7UCxE7c1MNIE/kj?=
 =?us-ascii?Q?/l/omAq4jZmf9zBEQhN/JovCsLss2orbJfduoQSX9d8jmiyYwcxtJkeiiq3Y?=
 =?us-ascii?Q?p7V7Mi9A9CObT8WhdZO0k1aQARH4w0wMLjks/NPhOyb4fhKnARtHvLvZ0ML4?=
 =?us-ascii?Q?Er3Ys7SZGVnKZNxRToSoXkJCQSVU9USXOpgE6v87rrWXHXT7RCOm6iife4zL?=
 =?us-ascii?Q?BYEtSrUg9mjHXlXKrG5g921oFCj94UK91U4q6n9o6nstY6wTPQ4HtkYFyHu+?=
 =?us-ascii?Q?nI194Mvcw4wAqkaqwChOPaRiJLdO14AHBQwjgGFq2SRjL7ojklaG3c2iik37?=
 =?us-ascii?Q?mRS34lHsen2reEPKNGkWvhG7blCxzuonxvaboi/kCFodpAIUEYDttz3v7vVD?=
 =?us-ascii?Q?srrL/lltSFLAQYofQkrjvCqEDh/9dqFXSlLcKG/7+UNn3Zli9Erfkl8b4CKI?=
 =?us-ascii?Q?0pinpGtulCT8jfAjOnMeSv7kLj6dLADEOX9bmVQrROaVJuLbfIzMzFcx5UQm?=
 =?us-ascii?Q?5qXWbwCAi0xUaFlGP+qwF86rQM9LlgzofHH0kSLHQvhAfrOQ0pnkN1SiBzdK?=
 =?us-ascii?Q?qj3ilSXTQkHlbBu0XRgIFahZIhamShNhqjGY/JnxVVEVOSwxDuq2HP2cszdB?=
 =?us-ascii?Q?m2Brd5RUz7VJ9W3Y9czSZrOZ9ACrnuo1ypgBCOMwWUOF4JDax30D77C8MHEm?=
 =?us-ascii?Q?YHCHjCw3/KJk4DeuC85onb97sEFpzEIAOCqbvC+d9Q2pAJiAWBMJqAeO9hlw?=
 =?us-ascii?Q?RLg0t19+2w5YOEp4wUuBDOCkwugoCR167Oz7h0O/A98TEa9oxonQWR4IFmME?=
 =?us-ascii?Q?DrzIcKzPED2a1NyNsQmnloaeYhIp+kapz+IjgGHp2MAjp9STV/Pah3m3VVfl?=
 =?us-ascii?Q?gTgGnVTWHJx7Rc4lLHRriqGDnRk5of+DlKOhE1MI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f36aa20-567f-4ed9-7fa7-08ddeba62f21
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:28:34.6443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKodWlc21FAAV0c8qFpGf/GD2zV8D5EoC6WKCm39X8s1Mwi/JGt+gGXvsJ6O+ToC+565O4BQKWzq2GfUoZWANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5753
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index fbf7da9d9592..591962db626d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -49,7 +49,7 @@ static unsigned long sun4i_tmds_calc_divider(unsigned long rate,
 			    (rate - tmp_rate) < (rate - best_rate)) {
 				best_rate = tmp_rate;
 				best_m = m;
-				is_double = (d == 2) ? true : false;
+				is_double = d == 2;
 			}
 		}
 	}
-- 
2.34.1

