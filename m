Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E1D39F88
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4E10E371;
	Mon, 19 Jan 2026 07:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="BTquYlZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367BA10E127
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IafM6ln1DEFfpRD6FzX7qNhDwsU3yyxADEXchAPMUTvaLT2pJRv0UB2RS3Ad7UOtMZ6TAehgHvQiBERtCq7Y7Ij11o2F1pwMzkalUUm66XyNClCJkA7poN8InCZwSrxiB+8XtreD2G8065FHDfRA/gpCgijSeIHba2PKa9wpDwYzYfJxIL6UCWECUAhIlrGw0iDgHcRah83q3maDB76zODdZ28INQK/uS56w0FZKpJGwz7HdVu6Wnc5NajnuuzaSaA3oI7V7qQo178sSTNG+adhcJEYiOQNjOzfrL738RYVUju4rESAZEaTkaunIannM3XgYjXCU/rSb5xhXP8aooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+/WMLyv8uPKD2Yl2QWMYXjgEgdvzJFg5FaxVlJAkeE=;
 b=uFKhMiVNXrPZsG+PHzIHaV+evwyTbO/YICWU8dCoc5trsPcaWqs0fZK/YlqIv/F6wVPs0lBbOQ+ELI8u0uTG38iO9qeJDkG8BmXu8FeB/M6yzUPkXZ9h65KSxuEc5SzduVhIjE9pKRYI9k9J1g0avmTu7rtJHA+7awK+m7pC/qctbINXJg3M3YVOwXqW4VgNEJOCJBo2Cck0Pjeic1jsFlpkvM8++E0QIa3z2HwD3XC3WHDx9xo+RiSmLz42YCaqWEjxUctjz0aG+im2BpQQUq0KaxKMDo6UERcSyIGd83RcBXnB0takCXj6MtBegP+oxyk878DOvCZjP+n51MZW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com; 
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+/WMLyv8uPKD2Yl2QWMYXjgEgdvzJFg5FaxVlJAkeE=;
 b=BTquYlZCK/8D/YVyxKTZ8X+8HjB9L4s9+UkcPfGVF+dXTH6nPwbPuU1Q6JfcW3/GQEPQKpedlx8HTzWz0cKz0iTctRs0AzZV5OyCLpGhn76rWcdizK6kKpFe+pLG2o8CMKUAdLnHFunjyABccKJw18Zg0t4kj6+LvrIHELlUnDoPlORYAeZUJCeeDk6Jh+2fngYXGg+QErOEX70QMfgEkzi40ODzmveKcbacwaOy0FrVn0tz1BT9YLBGE+X/3SpYT+/6avjcCUQ9YHlRR0rOHRSth2MXwZxrMGhbvtojNSFFspcIb4nOlqYJcEufegU8mS/SgakczedjPPb+vyjBlA==
Received: from DB9PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::31) by DB9PR10MB7267.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 07:09:18 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::95) by DB9PR01CA0026.outlook.office365.com
 (2603:10a6:10:1d8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 07:09:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 07:09:18 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 19 Jan
 2026 08:09:11 +0100
Received: from HI7-C-0001H.de.bosch.com (10.34.220.0) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 19 Jan
 2026 08:09:10 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>, <daniel.almeida@collabora.com>,
 <aliceryhl@google.com>
CC: <dri-devel@lists.freedesktop.org>, <dirk.behme@de.bosch.com>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <dakr@kernel.org>
Subject: [PATCH] rust: drm: tyr: Fix register name in error print
Date: Mon, 19 Jan 2026 08:08:38 +0100
Message-ID: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.220.0]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|DB9PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 2736697a-3ee5-4163-3f90-08de5729a9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GdfNp4+oS79FqeW9HzKIgtXpFbYNzbdtGQvthSPuLQu3RTcv9RCU/F9ql3tY?=
 =?us-ascii?Q?xlS4OLEOfW1B8NNGQ3y4wTwQq/hxbJGUVn/KlPOxHs4t0Su4I1ZHLQ9YlT+L?=
 =?us-ascii?Q?VyHucTzSi3fOOQVi9j4Fid3kmOlybqypDnRTkH6IYwYIhqIPOJDGO0eDCb5U?=
 =?us-ascii?Q?62+d+Y8yCt0Lon5jUsmLcOsM/Cjep6WUsnLZSK4BZ60eCFOKicgc3np5WBtf?=
 =?us-ascii?Q?xup4UHPYaeXxzsStjJWraR5BwO0aMsyoQn8ZgE8l94ejhYIzpXlgXwNqaGRx?=
 =?us-ascii?Q?G7OUGVyEt36u1kirSGWs69xPVJX4i0N6FtftgTPW0hnayqp+PlRcW8V4lOOf?=
 =?us-ascii?Q?ZvqaS5xw5kdjGZenkLzBXQltphVnp4SUGlecFS94obdbHPr1lqS2Fgg6r+iu?=
 =?us-ascii?Q?fXp9VO1mDiA0yDaeBAwN/Z2hoXDj39hj/7SU8zkoA6sSdDtn4lohiLkh1Vz6?=
 =?us-ascii?Q?8yDDnya6OJNO8lk5wNRejQT/1C2kQVqROPhaoPpX+ZjA0FIyBMoWN8nMC6PF?=
 =?us-ascii?Q?bQYUil0uqxeuXVvzZ36MoqVIbhRhs/Pdq5VayVqlYti8skMxXw2LfMu50yiB?=
 =?us-ascii?Q?6csuvvTsr+WNgJ7R07cCtQTN6HMcmwN6myNSE+Dxko7BRkQ5CzjWnNOfgkLd?=
 =?us-ascii?Q?IGXSlHrT01Z3ASkqXJ1c61Lz1tux4+nVv8C9CAxd39oeHof4/d2A0PWJDzi3?=
 =?us-ascii?Q?qzUUXyuk3YtDEQ2Nd/84N114cIyctADkakzDbd997XoBgspPGh+e3up/ft7D?=
 =?us-ascii?Q?EJWBaKRtJd0YybVuOHfJFidB/7mpg6vpo1ZjBY5hyb9KozyEyNtj/0Zrpi4E?=
 =?us-ascii?Q?tK540Zo5HxO7qGpGY7bWvLkO3+llX43LnwBhBH1m6ZO99qZ7KX8ShfSmYN+f?=
 =?us-ascii?Q?lymWn380VKjv9bJZG36lkDXiQhVKaTf/iHSbzkAmzSpb9jDmP6qi5TCNgrRP?=
 =?us-ascii?Q?fMyRbj3JZS6ucFKXwt9CUCvQbQe0tFZmIoD3T2W1Q4ULfVhg/Lfkw6PfK2ew?=
 =?us-ascii?Q?B5OOabEdiz45BjM8iN8XAGlQ0w2u9hVxhYlqk8Zr8UBHpoKU+9iHQDfiuNDh?=
 =?us-ascii?Q?ELBU7nCcif25qcSGy97e+iqqvNSFb7iHaXMlTe/NlsPO78ymZ+rOUNBk1YN6?=
 =?us-ascii?Q?vTDuoIT1T1CeIY6vkl0TRYkO2/vVOfZDjakU+rUrsuWAuo0s875Tv4H0YF/z?=
 =?us-ascii?Q?Qm6/rOG8EMZO4Loj3BGuDBpW3H0z0UbD3asn/iPI29D7nWz/6Zh2+UNtD0Xs?=
 =?us-ascii?Q?yYS/TsEw2zl3l5eBVX/SgFKeOy0N3Z7bif+gZrMjp94IZXedGtk1hOlRVCLG?=
 =?us-ascii?Q?aS7dq6kAJnFKRiBOUY6CIIJm7vI1jC9Heg5qYQrZvxQi+Eh4BCWdvq5DSFo2?=
 =?us-ascii?Q?h6I+5owV+TiQ51/adRXfs4GBAUms5jeEtkbzXkB0r0AZLiAbcEC7/MzO7Qi+?=
 =?us-ascii?Q?nLiUyGzRjojSnD1NKFp3QHGC4nIRUZrY3iMwh+hpWD3+34wvRIuyhJun58as?=
 =?us-ascii?Q?kb83Jh8dvS8nfOwothl+gbU1qrnr3laKs3h7hp8NzI0XRJeAZuhM+LQ50maX?=
 =?us-ascii?Q?AppFVIiXvnjOjtd+bZCmkG5MYo7oDabi1NV7X+d+DPvx965MwYqhxBsVs7QQ?=
 =?us-ascii?Q?CiI8jNZDcFQ9bWZa95l5H5w9Ab7LGjk/xgSZQzVSWuDhQwA6s2XOLdndJTUt?=
 =?us-ascii?Q?DlqBew=3D=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.206; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 07:09:18.4411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2736697a-3ee5-4163-3f90-08de5729a9b2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.206];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7267
X-Mailman-Approved-At: Mon, 19 Jan 2026 07:18:11 +0000
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

The `..IRQ..` register is printed here. Not the `..INT..` one.
Correct this.

Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
Link: https://lore.kernel.org/rust-for-linux/A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/gpu/drm/tyr/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c0367..3047fd12fd849 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -76,7 +76,7 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
         dev_err!(dev, "GPU reset failed with errno\n");
         dev_err!(
             dev,
-            "GPU_INT_RAWSTAT is {}\n",
+            "GPU_IRQ_RAWSTAT is {}\n",
             regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
         );
 
-- 
2.48.0

