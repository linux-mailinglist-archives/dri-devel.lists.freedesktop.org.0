Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90CB41E4D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6C210E7B7;
	Wed,  3 Sep 2025 12:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="NrTze3JV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013046.outbound.protection.outlook.com [52.101.127.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBDF10E7B7;
 Wed,  3 Sep 2025 12:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2DG+7AYCzTRBc0QKsRP+H6Cjt6SJFTV6ZAA52g9ZKPFBIOgOkbROMCjgnyiXfba9qPblKHs/aW+Q9dpyx4ibqhb6uEcERAHhlg2l68iXZpZJBLI2BsfmNr/IckqSCwRctJKkQ4ud05VbXVJ1cLCHgkExZFSXOb6IcHlEhxUdBTIt4vQhCYIqM9k2D9kMp2LE1weLg/jhyqS75kMtaeeS7oiAd1JSL7voVEoGj/lBolR9+8zvBRA43+lcWoTkGVwO5vBOhl3G7vpyGugPN5E+nDE9Qg6OXYHN8aZWDpk3kGj8Y9HUagLz0Eux5dmOIFC1ygZ4l+RteooNG0JAs5WhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssrfv54LlHqKaIeABTxYQupQs05H/wF6jV0jQOuJi/4=;
 b=nFzNG0HDXIZ7hlZUS+rLEZlPbuIGv0zD/dj2Anrr2MbD3d3UEAWlJEeohXKACjKeRaBoSY5iCY3sQMdJaRAibulLK4stMi45iXk9OKKNHlYO8L9UwFnPzf5c7//hke7GiGTwYv7cKqApp6moW07iUinrLqTomoJXoSvo4v0oVDu0k3tIRoTRJLLIqF+r3aD1l5drvw2gM+kdKRfC+K8xo88FaTWB0OU1WF/C6mL7zVtuZK/ogJxeI2/L0i4huA6BW771nD7qer70bgIw8XDX/lBKktZn8fbrq4/zcASTzDonWzgBw8WNvv7owZdDKtD8leH/otPl5whqyoLHGS6LdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssrfv54LlHqKaIeABTxYQupQs05H/wF6jV0jQOuJi/4=;
 b=NrTze3JV02NZzyT8jb24pZSAncvpUBv9PXNmg9LUVZi5/vc+kQo4dwaorSk1iRa3vodNIJgL8agQ+h4olPPVGojy11+yQZ9+tqnGo74acgzPi+FTAtPqxhhdQfGtC4ODHLbf8YXV3J2GebFcT/Tyi+ILcl1svqfaRXaksTTcq6dB2MAw3osnGGtNI5R3X9GoTNzSrhFu0FtyCJcd5YWYVtrU1uG20Y44dOCePmws3TwE2qkte8Oh4lpMdhOvWgai6ZD+mKU8GExn6zdZpFv0Qr/paBBTo1YNzMC/+xj9pGsZF9CZ5VIlKzm0ZFWtJ+ApojGVuxuze0lNG4iwVq30AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY1PPF568C2A376.apcprd06.prod.outlook.com (2603:1096:408::914)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:05:51 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:05:51 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Kent Russell <kent.russell@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Tim Huang <tim.huang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 David Belanger <david.belanger@amd.com>, Candice Li <candice.li@amd.com>,
 Shaoyun Liu <shaoyun.liu@amd.com>, Natalie Vock <natalie.vock@gmx.de>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 3/6] drm/amdgpu/gmc: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:47 +0800
Message-Id: <20250903120449.380087-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903120449.380087-1-liaoyuanhong@vivo.com>
References: <20250903120449.380087-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY1PPF568C2A376:EE_
X-MS-Office365-Filtering-Correlation-Id: 934f1f35-d0a2-40bc-b80e-08ddeae239d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KrWJpcDZ9O3jNb5oPwh19qdyliOj7lWDvXKvvG05HyMAHiO25gpsJ1FxEj6B?=
 =?us-ascii?Q?A0ov2NLEeMpRLEJYskBxYTFO1X/2JjkhZE1dqw9KwA+G9TOCkY6jh+lYt7gS?=
 =?us-ascii?Q?QHGPZcjWMvPIUdIqKbjDXn7JyRKcZmnFgR3eMgVZhDm/Z+7G5/ZwGRxuv1Qt?=
 =?us-ascii?Q?UGCrCBujdYSo9LJrPFKSMUF4YE8tXrkmWdyxfDE/Es9QvyHwlRXHFsXINk+L?=
 =?us-ascii?Q?YaDvm0ZrCrSVR9XpVS5q3mnkEOXMVqU+UOJ7fv8F3oR05LdJj/q5ZomahVZj?=
 =?us-ascii?Q?XbetnfkXBTdGNfg9+poTP1FQJqYvQvv+XBQ3AplVzR/dTwjm1i0egvJhzl+o?=
 =?us-ascii?Q?5u5nOcGXxnpuk5E8YRQe+cYK5UipzxNrbRsOF8MdoCyw6CvBW2DJdi/7iIPV?=
 =?us-ascii?Q?ALCar8lVCypcZBb0otneFbDEbCUI0wzxHYOiP8E/L5DjPseRnuSL++qedhxt?=
 =?us-ascii?Q?h9gf/+RV38dck7NlBE14pqP+b1N1YTLV7fhZQ0KTWphAWHjx5MwilnMlskZo?=
 =?us-ascii?Q?eZ+e1FssnZUovb/e8UUgzbQ3TE/JhkDvolmMfd5s+sGBuSXn/oV+3lIkF52J?=
 =?us-ascii?Q?rtslEk4qWp6guCM/sIz1XlTMpfKJ10CnSgEABERzWmTHSmQHkwK2zsrMo+1/?=
 =?us-ascii?Q?GOX5WuGXYPIDYnzPtsnmBaCXrraY7ucit1S5r1cPc473PEhIrqFMGtcotVBf?=
 =?us-ascii?Q?0R9K27UNyaar/jk1b2bCu1QAD/1HPgaMGsTUp2eEBbX+1Hfqit1wq6xhr5cN?=
 =?us-ascii?Q?hY4r8FXjAjt6xgvKz/+OrzN440i7R5kRZ2q6+VLbeHGi1L+t7YoFEBQkGU0m?=
 =?us-ascii?Q?cYTUC6Zl7yFau9qAGoPEnP01wfvp2vzspxiWMCXa1gX7oecqp4IBhxsxFUn8?=
 =?us-ascii?Q?VojQ7x/Ifw+imzE7hVD7oqnfzjM+jjtTb7EKTumKwkrKNa+ZUiZCTs6NMYck?=
 =?us-ascii?Q?bmO0/Injlzh8lie6Id9Gwwg5okmZnK7wqg8L0BXAzdmVnySxxQWfw8zcxGM+?=
 =?us-ascii?Q?wvx1ub+0xEqII98X0k2qjhHYUWRQU1U01Qo/1v3ZDNhnWAOklECmYG/OjrXM?=
 =?us-ascii?Q?ybssGb6IcpWXgMWBs0F34JecNv7pzca1+Cl3EdYwKZOWCmP47n4OOUTNBipV?=
 =?us-ascii?Q?YviUlR+R5JPh/LjX+URtv5g1L9DrLrtvuGTscuZCbAhXlvb5x0eSJmPaceR9?=
 =?us-ascii?Q?C0LY/xZGDHlqMNYQzYXn3wdkao0TW/0tHZsBANAXHMjJ0ceo88WObyARm9p7?=
 =?us-ascii?Q?k9Nl8+42m5FCTaGtdtp4FVl19Ki1k4BjHeSqeg140jYlxmbW1Z+IQmYQi7Hk?=
 =?us-ascii?Q?JfSPnA0yQBjOn0QZalSXwpH1CFnZFjITX2mCPDLkgLtbcofg2NK5TwZEAywB?=
 =?us-ascii?Q?CeAHEMqeZoxj8m+G4g3uFJV5v0KzPrRWwo/W3ykamJb70TXAnBjGwS9qaOYT?=
 =?us-ascii?Q?GaXQh/jq70rgUpbpSTLPWhiL4LUwS2e+8MYLfo/jDOnEno4V4GxjVr90vjOZ?=
 =?us-ascii?Q?mpWVnPajfIiBubw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJSiwcxb+IxYy9RPOCyt/4e/l3rlz8JUTBd9rGeSCQr08gMdn6jet3x7v6B1?=
 =?us-ascii?Q?RDf6HPkl7iI/C+7yY5+Bo3dCedFLOPhMRrMXNhiB8G4GrfUBVzF7nQacvMIf?=
 =?us-ascii?Q?gy84Am0Hg5iCGpbldWozSXgIymHDY0Uc4cTRmn5N0yxTqRaJFuNGa/g93CSI?=
 =?us-ascii?Q?+1IP8dvwbLBVm5iN9NHXlq4t4KVVjjw261g/4AUx3YanhjX2bP0wHEyuMX/r?=
 =?us-ascii?Q?NAD+FEtBbYx16dYFxgoQsdaTNI5PEwtKAKWOz88sDZNmG6gHh3aMAGM5/6+y?=
 =?us-ascii?Q?799jr/IGDsbjrMvJdW0ZlgfAOJx9i4aez17Ln6rtpnVa4Z2g3DUPnOad0DFR?=
 =?us-ascii?Q?Kxlfc2Ej7nDViNVMyxtEgnKr8zGNKHb2UPEacGwXpX8eLN2I7tj9YobO3boP?=
 =?us-ascii?Q?LBG7o/nh39IxK+GtK4LvPuQAY0INQ9KkewRQ5mecdS1bTMbSrj8w/3hL5QrJ?=
 =?us-ascii?Q?H6C32H9s4BotEApimJdKcyhNzUku+CXQnvAXrked5ip5HRzYMkTMjKljt4eH?=
 =?us-ascii?Q?IhYF6OAn2gGirYUvkcLe0oixogcWE/aHQQjuHKbI7uC5HbOP1WJjlww2rmcR?=
 =?us-ascii?Q?L3xjcyqupQWIFldefbPmEQ9GyZg1ZHImuvh7FjsFEedRSaThDtqEvxAtsDCh?=
 =?us-ascii?Q?MUuvd+esw3krCusdPS+7hB+5ySgvmeOjchMVpITSOo/5x7CIBHIYFxLyURjr?=
 =?us-ascii?Q?Lux5caeTkRWf2ktzLUZvEEC/cC/vWvs71IDTAO6MNUUZh/3RBzmTtlLOHDLr?=
 =?us-ascii?Q?ifJGwtaCllPXZIXsNcT42fyWl1GBI1VBQA7LWhTvxWcqI9+f/vY5SlkHu16b?=
 =?us-ascii?Q?3N/i7W2EorYvNOoF0bNT5ld3it3DHLJEFP4oNyxpcjcubS40bLFh6ByZOkLl?=
 =?us-ascii?Q?tCoC8UYpU4T1yOX3gsCwoWLwvyDs2EYHSBJJ3BKfJaDqS9UNvV1K6Emx4Vhv?=
 =?us-ascii?Q?BgASWnBM72n6sHWkybgeIkfAtHed7adYjQFKjCHpB7jsfEXxOT+AlUWhe/YE?=
 =?us-ascii?Q?ecE6y/7JQwcP/JHaa22mtTtho3RC2B7+BKViuC1y5WYjmG1HTbc2yXJGhwJ/?=
 =?us-ascii?Q?KTkOb/L6A4hgp7IhL0dj7dDk9NzlOj7MTrcoJfWpOnRp4LH8Oe2goB7zsLif?=
 =?us-ascii?Q?4PtBVr00aod+6AqmQydedSh/KxD2Jt3mSjgLPB9tzgAa7CQj6HX5laZMARqC?=
 =?us-ascii?Q?kFZeII5zkHXsfwe4Hrb2+Hu8FxaQA5qg1HmRmiKSWK2C/FUmnFYMtoL4bJxY?=
 =?us-ascii?Q?3lSlgLGzUuNST7F6IsgRQcXUga/MUN0Obn+N6ZZpphU0AVuQJ3wwjJMevQLH?=
 =?us-ascii?Q?eSWDFXqCfItALJmgpKJylY5WHe7vQCmLTVKwpmf8EYF8ZonEQS8oUSFc899l?=
 =?us-ascii?Q?ilXaOxQxQPnQcm5CZC2Ynxg9EkzvE0KaOTfmb/Xf2bz0rnFk7v6y9WZCUO0s?=
 =?us-ascii?Q?ebdnzTxsKckGmh9tg7c2zqE7Be7y/i1rdA8lnp+YGtWpOL1OiL2XUXOgBZ6I?=
 =?us-ascii?Q?7clPAhQGJubfQ9I3LBgBSS2YPcNf+XgbgEzTervuIKu2EgcxeADOa/LFuLg0?=
 =?us-ascii?Q?/VGNQldPzhh446sWksjSbK4iD1tXNnZWUjmAYnHO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934f1f35-d0a2-40bc-b80e-08ddeae239d8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:05:51.3235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6TbK29OwforekW6Vsd2sGNohh2HTMnZRGsfQcteXOG7gk71kXQs8EZf6Ion68dFQrv6lnXXYxjR08uL2NBfrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF568C2A376
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

For ternary operators in the form of "a ? false : true", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 7031dd8c3c5e..d7499be8c4bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -963,8 +963,7 @@ static int gmc_v10_0_gart_enable(struct amdgpu_device *adev)
 	/* Flush HDP after it is initialized */
 	amdgpu_device_flush_hdp(adev, NULL);
 
-	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
-		false : true;
+	value = amdgpu_vm_fault_stop != AMDGPU_VM_FAULT_STOP_ALWAYS;
 
 	if (!adev->in_s0ix)
 		adev->gfxhub.funcs->set_fault_enable_default(adev, value);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 93d2b0bbe641..7bc389d9f5c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -905,8 +905,7 @@ static int gmc_v11_0_gart_enable(struct amdgpu_device *adev)
 	/* Flush HDP after it is initialized */
 	amdgpu_device_flush_hdp(adev, NULL);
 
-	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
-		false : true;
+	value = amdgpu_vm_fault_stop != AMDGPU_VM_FAULT_STOP_ALWAYS;
 
 	adev->mmhub.funcs->set_fault_enable_default(adev, value);
 	gmc_v11_0_flush_gpu_tlb(adev, 0, AMDGPU_MMHUB0(0), 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index 9ba055ddc00f..76d3c40735b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -893,8 +893,7 @@ static int gmc_v12_0_gart_enable(struct amdgpu_device *adev)
 	/* Flush HDP after it is initialized */
 	amdgpu_device_flush_hdp(adev, NULL);
 
-	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
-		false : true;
+	value = amdgpu_vm_fault_stop != AMDGPU_VM_FAULT_STOP_ALWAYS;
 
 	adev->mmhub.funcs->set_fault_enable_default(adev, value);
 	gmc_v12_0_flush_gpu_tlb(adev, 0, AMDGPU_MMHUB0(0), 0);
-- 
2.34.1

