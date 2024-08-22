Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6295B9E0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 17:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394BF10EB2B;
	Thu, 22 Aug 2024 15:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="KV//SAUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2069.outbound.protection.outlook.com [40.107.215.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3624110E81C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 09:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPOdKv6W4jf0GM2UT0BgkfoXnhRQUvbQKTktN0xZqLJF+q91TsPRRTZh+Hm0aTZ7uodQasuE278nhBLYJlNkEQ9nyhDqkwn0Bbq3cUS2TOrUw6kePqOqQSIOPgfKKVq5rmcRzUcKFYkQ1B8SM0IccJ+tdgmq/N7RliVS/cOYXIUayboXzCVAgG6Q/qyJE7uAQt2lwirkQ33/yL7BjSz792Xohi6tPASWKV+JiGZARSVagAIRpPPZoQ+81YOLQh8vMBuaZcGIg5cTivPiS1fWqKoH9rjfpLE4nLh1fONco3luQe73OjrJQEHlohBnOUClEuA9N1jq8NOfZaki4752ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAKXJHhlmiEe/bEm3eU1F3I6PANSb+CKNpLIjKQj1lg=;
 b=HxjUJiAY7r93yTPCREcO8sh43jsMUv2JsqnlwhNTXMQaw4txPlTJtBjqJJrXjI6Tzy6Nqc47AcvJ1ctfNeUfkP/LryKw4vizbqqzv4wYud6UH8FYIb8hf1LGLD7axfgmrlZ0YAD9OUoyoCY4mYzDEludyBPAh4K0yQ/6Io9cXpzChmuc1blKrQZ/HYOLmpFu2yvmpxbrjxeFMUFLTtZNDkqb6+uW76MNBSkNlUq9igrsVVlRrNzA6CcQYUS5FQ6jzqzrtB+7bGa4fcoKjSL7TFl6a45DybxbZPie2dh7wU40PBTh7LQxMTcuU+MO4Po+egAk0SobvRstFu4HkzGJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAKXJHhlmiEe/bEm3eU1F3I6PANSb+CKNpLIjKQj1lg=;
 b=KV//SAUewwXeXnCNW1y0GW827Ckh2SAofUcW/gsY53z/dl4MY9pqK7bYDvXBsYXbFGxi+wa6DChZ/kuJI3fYIoQgGnnIQCNuBcwjex784Xdiexl3ygTfWuRLRfJhq+wqjf0WPBXIMLD4Ofv4un0n5Ha+VY+73vC1U8/ZLIzP84KyLyImKrx2lRjCbs7WswdlXQpjT1XYUFfQwh/bxoCmuN6/q4mfwTzasTSld2vPdzF6dlNhcoDz88f+554lxrGH5IPuLoUCAltikHtCQOXH1KX9tQdZTHRI1CHhp4WPevWiO8bZhGFQj4pZHKzx7hE+dJIV13ke3M0r10ZIqRx77Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com (2603:1096:301:f4::9)
 by OSQPR06MB7251.apcprd06.prod.outlook.com (2603:1096:604:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 09:09:47 +0000
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6]) by PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 09:09:47 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, daniel@ffwll.ch, krzk@kernel.org
Cc: alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] drivers:drm:exynos_drm_gsc:Fix wrong assignment in
 gsc_bind()
Date: Thu, 22 Aug 2024 17:09:27 +0800
Message-Id: <20240822090927.1444466-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To PUZPR06MB5724.apcprd06.prod.outlook.com
 (2603:1096:301:f4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5724:EE_|OSQPR06MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 802edba2-e0f7-4828-fca5-08dcc28a2b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R78pIjoiFNnXvFSEcXncDAsQ/bjyXfmb+7KYx9eLpZlLHVGdZIaIP/R2MI1s?=
 =?us-ascii?Q?HRlGfye0/wcOJieC45/d8trePwv1Wd/G1jh8lC7sLQTZw4g9CR+WWrMCOumw?=
 =?us-ascii?Q?ro6jvsuopZHPC2SWhxWptOHeL/mYcEGWI7+68ESwYTLa1eQtFXrjCXxP1ALP?=
 =?us-ascii?Q?PWFQaJPNXmPhcwFN7dLMWJYO6ABJ9HnHkrkeS9fxmfGT55/XzEETawfm/Q/d?=
 =?us-ascii?Q?7Ovw6EM0IVgqJfXawEdv/S4Pcqb26Nw7vC6hTv2zR4R9zyvS2CSMIagAC2YG?=
 =?us-ascii?Q?HvSM9imljLMboZQ9SgFnNJ4F0LBFsUp7jCgaxHM925VEJUJx/nRhAfmaKPhv?=
 =?us-ascii?Q?lxjf7lr3NKEdWEtxgWEgCCxb/eMtzAj7YO+A6BSbOxftAYJ4QfBAt54EWjgh?=
 =?us-ascii?Q?nXfbyEyg/BkLYdhfl0b4eswQLa46TMzPGYboDui2brvowe8I+VYubqWGBSGx?=
 =?us-ascii?Q?y7O9un4vRylqO1eB3CKDs/3SlVqPAC2Du9MM3vwOIfkBSg7j0rm0r1aTum8g?=
 =?us-ascii?Q?p/FwPjqs5RJ3cViVkUwyr4xxVq2W75bnxlhmLHCRvpKvQh/lyQtq9a+7YgWl?=
 =?us-ascii?Q?2xrzFmoVtuCOIt0PP04U5dmnxJ4n30MYSdimwS/+qwmnMu5FDLsZuU/G8rR7?=
 =?us-ascii?Q?3i02gifSylnT5OnFmaN+QvWP6lZLSDyN08175gHeXyanSk6E2+AADQgnMBpK?=
 =?us-ascii?Q?auz65/lMVf+x2bOWmQLF1D95BhJBXvAkhzEiix2f0My1CZeBd71QWotkoHwK?=
 =?us-ascii?Q?10LtT45x8Z702sBQ/aezrbDNRNRmpumQh2HiW6e55JNTr0xWgyv/hL+xmUMP?=
 =?us-ascii?Q?P3YpGCWtQJtwyvn3sRQ7fFdKlqu87HgBDubWipHEdElY5HvkSvbo/JgLvsL3?=
 =?us-ascii?Q?k5prxdodf1Sm7BeM4qRU0jr4ZDXFi0bBHtKqR4eg1s4LH+Bo5+87HGxEjBhG?=
 =?us-ascii?Q?qQygNSXKR4f5kWddIRw5AychBKlfw4RcGwtSDThE9E3KS3ZnM9VPb4jE/Bs4?=
 =?us-ascii?Q?PoTMF6EWrkUdbxKXKbfFYBn6A4ogpr7OuRyE6q6nn8Pd8bMXoTFlfLYwViCe?=
 =?us-ascii?Q?PvRKUQHKaQ8IjvlDeYrKXHT/I2/Lme+Q31TUzIkIJdTO0gOW9Z6WPzXu7DPY?=
 =?us-ascii?Q?1cG8KxhEulSn2G5Jq8BLT9Ur1eHC4ihZEIeIwaRIDmjzlX8q79ASVYYAFeq9?=
 =?us-ascii?Q?Kyj5Hi/ckVqETwsE2ZtKy0+N8EjLfYZ/MQbGcRaOVezey4YIC2DWOcOIkR4+?=
 =?us-ascii?Q?n82Mk9Mw1JpWkj8jiFD3U5mXKdU48bGoojPeRkJ2165GdgtOGqCBepjhREXH?=
 =?us-ascii?Q?F6H60v6TV8VZTIDCYStEQxw5mjcnRWrBh6H3TEsbdblhoMDMOgMWxDi2pPPb?=
 =?us-ascii?Q?7BTfJZe/DPdhJpUQ7/326BMvINzSb0vDYn5caqIOG3rWzYupBw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5724.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aMHsu3SYabYKCE0fT0Emy5VQ/HX1eyjjGmbOYSu4F1nYmqyw7xUXqSbo/09x?=
 =?us-ascii?Q?KOIrnn03xHVWhWjfjTEucI8jv+hHqSOxeUXD1HvP4DgxLU2RZ22NKbND/rSj?=
 =?us-ascii?Q?MunosXfzZHhFWzpAzniQie4HIbj3HvhxlNVKRkoN6JQ8Pfo5tO9LknaiFJnU?=
 =?us-ascii?Q?z8urtNjpTAPz26fyOzGtMH0GCPk81dJDRdFmue4t7W+LRmg1U/d+o0GsE4S/?=
 =?us-ascii?Q?pZtQDcuLJWOh5cM/djVxrFcP72PeKwGSQQIAk41l42JReoISQMtQ1+ZVKaTd?=
 =?us-ascii?Q?u4z9mpXEkvxjJuYeULT8m3kDzQyD6y6qzL8/SEh66DrVS/I3s2yxM6+Iq5+0?=
 =?us-ascii?Q?sAC2NUSCxsSzr17OdJpW6IVfTcC/eVPj6euEo7meTGR8yzJjq5GeS80qAePQ?=
 =?us-ascii?Q?jqDrNRDkUeqGITtq+5OwGdL5RoquSGkwwVP3+IcvvNByPzNK5WW/JFM8BbbM?=
 =?us-ascii?Q?Fp9RTrUTDb82dSyTa4MzCg6WQObKpYPie6watbif23STT7ur+TuWUMfqjCNI?=
 =?us-ascii?Q?4TPqG/C9gHWdDY8lSK01f9MDzQvgYNr2tMET+d5LEXUP1tY3P+4v+E4ND47D?=
 =?us-ascii?Q?k0zP0cVYFFSjlQQow/5TgDrex4OythFPPiIfqIPMfB1fErKRjF71ZWCH7qAm?=
 =?us-ascii?Q?T9R/+UKFzgs3OQRzGff22CYq+XJmLag+uj020Hi2iDT6uO6iJ4g0UzRx+pjT?=
 =?us-ascii?Q?gU0XDNSgwhOXkzyO0r4xofDInplJKyKJoJPoZfwr5CJS0+lymelHQipznMDj?=
 =?us-ascii?Q?KPax6a/rrDeFpVVbvPgjGv/WhZmuLXwSeON0JByxxCZu3OAkBHUSczV06R0n?=
 =?us-ascii?Q?64PfbSTnJ99SekA7kPkGf8vKWfEfW70kiaIDTKzbfAKA2FXYfvgetJGyc3kM?=
 =?us-ascii?Q?s8WJ2z4LUX1q2KFGHFoCuoiiaHvzCdkycyUHjNzh7dArWVT3hnP1TIdpo/N0?=
 =?us-ascii?Q?JQxG6J/7CdOeCVBtMNprA6rd2u8xeKjWmyd0rWU2TEOwcvwlWqfWDa7oj0UC?=
 =?us-ascii?Q?VrGqUOy+lP9+rKkQe/kgJhn5h5T2BYROfRrPZUbm0QeRP4Wh6vDSzWJ9KcvI?=
 =?us-ascii?Q?DM3I66xfymcbysheEID1nOBs48tInvVKTcTMsD1TDEhcdCOF4uS/RTPG4Bro?=
 =?us-ascii?Q?8tCRS8W51BDDNoS5Dbd9EldAuHXEdSq82hzxubw34VrSKUGVvO72yvnNsQRM?=
 =?us-ascii?Q?5PrYIa+GpHRiGXF+BRU64/YsihHSZ1wJbYIgdy5m9pagc7yJ+1O590j4McVr?=
 =?us-ascii?Q?W8xTX3V7yvlyAK/5UfeXcV9BnT6osQnepuhFMrxaAuHKXtbqwVvk175wyP4o?=
 =?us-ascii?Q?Yb4a8zt3eEa09v6A3GEtDTKUeGoeZMzdyLryRk07O6W1xFr1OhIOeGwuxTmr?=
 =?us-ascii?Q?1SKXch4tLCXugPP8ElbGy2mvIsAVg8idShji1JS4GTH32Ek+2DPtLDmlj9HM?=
 =?us-ascii?Q?fShioqNpdevF+GHjAY41WgFeL+8qUcb28fmOpgV9b9oO/gDszsQajQykA/ZK?=
 =?us-ascii?Q?F2cNHcjptfhze1J3Gl4xipPcABiMhu00pi8TbdUS33eXg/gIaz+pFmlwi4TW?=
 =?us-ascii?Q?qjVwa0phNDqu+UN60wUmgw989YVQ3wwqzqaFrZyV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802edba2-e0f7-4828-fca5-08dcc28a2b66
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5724.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:09:47.0980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEpXmEFRHs6IZ2Vrpyxt4sPS1wnu6n60NuTqJ0hJc/Ff3ybEKa/uHb+wHVQNVY96tF5tf/JC7VHuzeKeUNggRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7251
X-Mailman-Approved-At: Thu, 22 Aug 2024 15:16:40 +0000
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

cocci reported a double assignment problem. Upon reviewing previous
commits, it appears this may actually be an incorrect assignment.

Fixes: 8b9550344d39 ("drm/ipp: clean up debug messages")
Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 1b111e2c3347..752339d33f39 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1174,7 +1174,7 @@ static int gsc_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_drm_ipp *ipp = &ctx->ipp;
 
 	ctx->drm_dev = drm_dev;
-	ctx->drm_dev = drm_dev;
+	ipp->drm_dev = drm_dev;
 	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
-- 
2.34.1

