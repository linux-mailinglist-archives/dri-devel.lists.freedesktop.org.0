Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658AB4358B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099B10E2DD;
	Thu,  4 Sep 2025 08:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jrv+oJkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012002.outbound.protection.outlook.com [40.107.75.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D76010E9A3;
 Thu,  4 Sep 2025 08:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffx6FNi/MYlA5qVvfjoRbQY+pqkaD8l4tAP22ka7+uAWCSbNdkL8ktly0wgaWD1fnjU/10kr7QqQMa8o4nVg9hSrmqRZ/tOJK32kIRSNpryoW/Ey50cDj+Asq53lu8Qq8d3RodAbMqPjq+mko2A8vl5ALwGN8tS8WgzHTk97Z62i6Dnwv5r4mhINNV4j5NTbLVJLudpy6H+i9JNdPHsZ+zP7ijls2wVzYGgFP03LyaXWa6s6pb8zOWmGjG1FCAiXaWKqHK89sskSKEk8b80hOgnXgidGFg1G2uWI9LME55djZ8Awu5v8U0gsSlAQiymF3vQkoaEi1RkGT5MRIIY24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TYr7UfZtZL6+Y2T6nIAFMnMmGyDcQrAh3fTrWXapfM=;
 b=nFvBQx4Sb1j04EZkghat5cgnLlpBlycCxRKK2b9JB0yHGF5/YtpZMF1m104VEuW2D8P13DXKdD/tM2ZtmmwSSqvf2y+0/IkaC5B0zlr07RCyg6O9agh42QslSpkrByq+zUV4FzSxB+bRkM/lIvcjQuSmQURPQLz90NI0FIi+EY4lfq5B3eBntWc1na1A8+wTXU4sXik4FiyvW5xkSqkzCedT3jf6e0acJnTTAbMuvNasUKw9vl4Fq//bJzPiz1Pe0bpZoXTtX9OqgqFSRgUbeUYhfuSR28Fr/qaysvnOWO8ka+MDBPV6L26yt79VfP2NCXhPXC/VEx/0ZMIxghPpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TYr7UfZtZL6+Y2T6nIAFMnMmGyDcQrAh3fTrWXapfM=;
 b=jrv+oJkJj5JffN+Zg+ZNNE2HI2LDVYf2SamymmTGxSj0fKsZRsZi9InNcmuPzafC6bAvEGRVBgnUlal4+3Hl6uB8iAIJvxF9+rqN2bCJzhBEowxooKp/YwxXLQRr2jM4FF+bg3wyzhI7himJzb+MintrjJUqCZFZEZEng1BHnXnzHVaCZ+HFyYg5VaffE6MmHU2/F3HYR5Xxb67pOACF2XRI9m+DXdPEDT9/e8R6fg9eYhv+1xNRFesVTJLoVVsihSk7DgAesa7h8WlM26Lu/2vr4XWvnezGYZs2DqxmKxORRP47+8uGCdn7KDDhX7eTHJbCmOgNAczJWg9QlbpqXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5062.apcprd06.prod.outlook.com (2603:1096:101:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 08:21:52 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 08:21:50 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Charles Han <hanchunchao@inspur.com>, Ivan Stepchenko <sid@itb.spb.ru>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 2/3] drm/amd/pm/powerplay/hwmgr/ppatomctrl: Remove redundant
 ternary operators
Date: Thu,  4 Sep 2025 16:21:12 +0800
Message-Id: <20250904082127.271638-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904082127.271638-1-liaoyuanhong@vivo.com>
References: <20250904082127.271638-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 635958e9-8baa-422d-b549-08ddeb8c18f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L3Zdd9Egjm8B7ZdpkMg2RsGAF1HiR+mVjPVFmvgTNQRkbtHHF56ITQD1m5iL?=
 =?us-ascii?Q?bTTMoHAp0nprfbLA2PBUkJk9VUVctecpVCelw2bB1H0rS43nLMiG14BkiMMD?=
 =?us-ascii?Q?F7pmxqUdBkCUTNjlwI74Fxzx6pvmgA50f3w9AYrN2InT8q0OfC3YZPFh3zok?=
 =?us-ascii?Q?qOjv/IeT9tblz6O7y0PseCcykMLLak3Jdy26+M7+3qUWdEThW0kIMfnyYijB?=
 =?us-ascii?Q?5YZqNm1/u2TKmKErjaWqXWVU7iS7paPHwh04bNzxLlfOJXGp1pugUFfY0ZBu?=
 =?us-ascii?Q?9anmlU510oyQYiA6ozj3uwQWw1mOqNYyGLZhS+9O+2T3QpfUtqME+6q7Xn+y?=
 =?us-ascii?Q?ArM32ZZVNwPJK44cic6u3inujUkgkBK32WOVxdhjoPwcFDELice7mS4Mb1XR?=
 =?us-ascii?Q?krzPn8Ia6O9YGA9rMmw4cAcpICrl5AtOlBXavpkselarL/nrZLf8jyUCt7TW?=
 =?us-ascii?Q?r0bXXnSuxQHyQRkgY1j7Zsb/sOduSCicJdQvwxWW7dc7N9D05S2hApNAR+67?=
 =?us-ascii?Q?bkptD417Ze5HegjLK7hjhQf/3vhg1Q33KPCjY3pk8SNAjrpbBAiLxABLaBqt?=
 =?us-ascii?Q?BaDE+iTdaH1VY/FvKfSPPGmo3FAhZ4vBfVDdiHlHQHG9HwbjpFrcmX4A8Epy?=
 =?us-ascii?Q?eQtiItpGfAidUtHuz78RVX4v112gwx04f/8G7R29FOnufiaioS2bPY0hQbTq?=
 =?us-ascii?Q?py1kodtzBrc442u6MQJylCehNAOV7e5bGMOjGYd0SvpqOc9nYcrKhlvDXzwy?=
 =?us-ascii?Q?QJ5Br1iTOmhiZLz8MjpOdR5U0p2zH16HTS30YlPRXWkXeZgXGUv6HxKw0r58?=
 =?us-ascii?Q?1QeOwfqUrAG7ZElKlpL5dNtq5BcJDknP0GXp9pEYpIqOlJNUBKtktxTwU03F?=
 =?us-ascii?Q?3n+7Mwk0oxk9fDAJhXlLdj7NOUxO7+1DnbBkMhuYJEDbdcE4K88HIBVqPMYt?=
 =?us-ascii?Q?THdE/YK3xVILFKgwMiMz2sy6vJEgmszrjJ60O7OTl/dnei5VnmAsIQ0nfM+J?=
 =?us-ascii?Q?rclnUl5jzo6RPB3Uz1VQ0t+NIr/MJnCi/ZtyuOzN/6b83VRVCrqnhb0oFq3h?=
 =?us-ascii?Q?Hr33Jbs9kTjvzlzr+VPix2Gxvm4MvDD/1AGno11+F+YQWAc/WeJVN6c0P7q2?=
 =?us-ascii?Q?c72oo9VAeRuufczT6n/vi2PFheRoj/W1H5QtNAp5J3dC5KmN7xPk8q3LQ7bs?=
 =?us-ascii?Q?DgTkX+SMnfLP/P1zxi3VdfJng7k3rq/0llSMvb3vhoj26KXjrAcKVwB+PR3B?=
 =?us-ascii?Q?jrpJu7Kcu5b4NoNlSLloe8DqT2wJA2S+ih04Ep4OP6zBbuitINWczjIj9t5i?=
 =?us-ascii?Q?vCvh7pTkwoFkth4jvcIUwu/8GmcpBapanV8+OHMgRlNSh1sdeyka0dqkQ4Q4?=
 =?us-ascii?Q?v3IGUQB3XMevYu2pMULUl4E+v5Dkr/h3MsY9m5utinzgMMpvB1zhFAlvs2vq?=
 =?us-ascii?Q?p2yOtDl5B5Y6P5TNW9eb7ET77wkbwrfLncezGicChJ4wMPytTaA2POKVOMtT?=
 =?us-ascii?Q?liq/WFuUGjXmpkA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JH5+H3HS9vmi4XBGbC87VFOwWw2ty9TaUPkDmKgb82g/NmtpLIS0P3qiXkbO?=
 =?us-ascii?Q?SFuMoj8b2/38qTl7GQ0NWZxTA0n24tCn2soQgOYmUXFMOxkhH2xwkBidfGvw?=
 =?us-ascii?Q?QH99pWL/uaja44N7Jfhiglpie4/6URJVDHMD9nFQtkBaa8wdX87/X2Fv6mWq?=
 =?us-ascii?Q?C0YF21nCVahNe6b+DnHTNTkiUGllCchT08AOGQffAK7J7IC3lgs8Zrz/6zvD?=
 =?us-ascii?Q?AbeK3sU6ggbKyVCT8LTlkQA1yVImWavmUbZgKU/OncGSNIwDNMSdSPM0PqRl?=
 =?us-ascii?Q?y889lGaLb7Cz+FgdJj6PuBJHrstf6KfFT42WkrKzbb+DUOxCzPxqBjKfMHcH?=
 =?us-ascii?Q?FhpNB9vbNtnFpzIreFq2vkOhRVhdThq6OJ4OPMv70vdhg2DCPtklx9HtbrDo?=
 =?us-ascii?Q?dnQLxhhe4oZH+3caXXHgOmYyOVZPJ5um4Sc3WnRQNkITjpbQgO/eBGqiEmO2?=
 =?us-ascii?Q?1KpCIh2+K8O5ZmC++QGReHGo1AjAmfPddJs30/Yp4RjpxXqwDxBjaH6ORhNS?=
 =?us-ascii?Q?qyKJqO2e5QSKB3rx/fuQEm44WCl9+zxJdDAibJVhi2RXmBiMRms2hDnE8Vus?=
 =?us-ascii?Q?0wFpetHdMbM2XLSg+Qv7DyW+SinDUygWeV0bL/ALyzYMp9+k1uGlzqMSMYLt?=
 =?us-ascii?Q?bDXryQI8ev/3NOgi7bbOaf0gKT9BaOntYWZiqG7EH4pKUnOAtK1CPwi9r9JL?=
 =?us-ascii?Q?AdxG7ewUmklJAdveLqwDuOxk7UHxe1whVjTcv9KcuOI2mTvSZvC7fpf3vIqN?=
 =?us-ascii?Q?mV2YEA1Zmljg8InkZ3nISc1ebDH0Lfo9KV7oT+xNrzwg2FpTy41r25myuiTp?=
 =?us-ascii?Q?+ZZC8eFwTBXy4uoA/JuMyifCpOJgDjiEwg8n4Xp52sJ7Nq+x0+lvWk38XlTs?=
 =?us-ascii?Q?kvEZjS0K8EY4G9SnaOaQ6MOP3au8Ys6Wnd7k76o6kZe4NV5vRvnfnUvPmbP2?=
 =?us-ascii?Q?+F9sbSt/YAQ3RJzySUpNX1/cPE+bmYQbveBJe5xqVQRjWO5hb9NedtFtnkj/?=
 =?us-ascii?Q?QiysyNL4TYCsyDVc9nr171H2+WZdtaMRz+L+vPK7S4+9Wb8q0Oh7zaxcY51c?=
 =?us-ascii?Q?fSnjlRtASOZ9sMZjJHCcAnLT72tWwut6IFJZTJujwDEAU/cTiV068oy6AaJg?=
 =?us-ascii?Q?dLLmflhzNbJN/aBgtXONzDO5Swixp/T7ixhydGJEOM7uQCtUU/jk+LAtsV94?=
 =?us-ascii?Q?lzWbS6P0OR8MqDgJwf974xLtLU9VbDK64jEzy/gCfY4ZpZOlPSoFJHR2FtX5?=
 =?us-ascii?Q?xZRJKV9KiaS8rWQX5T+ddWYVxwEeQ4RWIfiY5HnmApZEr4by1G/pUnLCmK8M?=
 =?us-ascii?Q?JzmZQYTYDOvoZY4KbHjXwhK+Q4rqaXCmzwK0eZhtH+KTk844PS5xxWC1ugec?=
 =?us-ascii?Q?tRmOjTkOuhOoTSchLlubkmfABrm7ic+tw8K1/33dqnF+B581f/z7ivhGB953?=
 =?us-ascii?Q?QUKQ7gt4/RIomVg10mCDBMtUPpbxjhusWlB+Fd9yUBFkDYf59pRlLtTz6f2r?=
 =?us-ascii?Q?luEMTzCL/ro9RB14ddpeHRj+ZSjnzo+KY0VfpU0JyKnXgc7+8JQJ2JxI3R8r?=
 =?us-ascii?Q?fSVVGJl3Vj/Ciy2SPp3h/ZMX2E9d8ATPtwmcBjHb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635958e9-8baa-422d-b549-08ddeb8c18f9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:21:50.5420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +t1ykNu8OBxSXcp4Q8FLi+urfe+Pkcd/LoqLY17Ae58s0pN+m4QonxxlF02uX4VN4gG9PuJ9t9uWoYffgvk0Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5062
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
redundant ternary operators to clean up the code. Swap variable positions
on either side of '!=' to enhance readability.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
index 8d40ed0f0e83..ce166a7f8e42 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
@@ -563,8 +563,8 @@ bool atomctrl_is_voltage_controlled_by_gpio_v3(
 	PP_ASSERT_WITH_CODE((NULL != voltage_info),
 			"Could not find Voltage Table in BIOS.", return false;);
 
-	ret = (NULL != atomctrl_lookup_voltage_type_v3
-			(voltage_info, voltage_type, voltage_mode)) ? true : false;
+	ret = atomctrl_lookup_voltage_type_v3
+			(voltage_info, voltage_type, voltage_mode) != NULL;
 
 	return ret;
 }
-- 
2.34.1

