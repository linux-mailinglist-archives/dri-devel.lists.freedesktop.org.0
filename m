Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148EDA04835
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CA010E0D4;
	Tue,  7 Jan 2025 17:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Rj7/c+HC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2083.outbound.protection.outlook.com [40.107.103.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67B10E0D4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifmYtTJi21xEvmODYtb9cGhjpM2vV43xhOsSCJ9iBVi5SdDKFcb82LKWXiq6BzsQJu0x6wmWlQ4G1hvoAs9NNwNKm/SUjmIkFicB1WMqjtyH+V8P59VbbgvUUEiGu+cCzmj7p6j1G6pO8bBvfuK10ynUfmzO0lvd47ir1qBtEj0jH+n3bmmDxk6H8TdZDTL2VNzMCXnex3ZEWaXKxPmn+I8MD27Pww9DAKhU3gc0fnYjB0epAI1L1F4tAaknSvhc2x52P/6gV719fIh9SCGTcybNLDJh1SoFeYLAQ9mbqMW5u7esZVdfcdLsS2XJzliTAuinuPRWbiIjmvGwxYysSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf4Nki1lT8cEMN/2Pw194yGyMKo+GGZD/gXIsoAuW0M=;
 b=GLgxqOdfyVWvRLkpTiKkzZCo4wWpB4y8W0cn3J/iwg/q7H3HercHOQ8kV52wnv/E1srEwS78K3Iz5BnmyIyH33tQykA+46cNQJF6lRTmIUJDGenmrZ2xgFcdE+LnZBLsMl45kAoM5GSJuf2jIcbXtfAOj3SLVpf713vaqdWuX8M0tLYqvMMmhzNysgt/bjPTcNPOLs6JU2qtMq6c3xzXXLZrHLZ1KyhONkkOPRrQAXsHU+Q5cikkiG7OF+TYh+TeXocZhVjcM+hR8IFni58u3uJIJ4rmTSSHkcDZaJ2rO8POL6jYAu64J0w4FQNFqnf9PKO6DmIsxYwO0sjrNtmPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf4Nki1lT8cEMN/2Pw194yGyMKo+GGZD/gXIsoAuW0M=;
 b=Rj7/c+HC2WtpjKUwugmuw3isRQc/GIGapfTDQdoWwQbl9bSTBHbQAp4EKBqecR8V6KrtJNmNxerM2IHteTdDQeo5S6xehoCbJpn9MYiYrwTqn7p7h3yQRgz13lsC0KlmwJt0CQM4RJu0hgr6/Jm8PArsQYVZylsOtaA7OB5b4xc=
Received: from AM8P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::30)
 by DB3PR08MB8964.eurprd08.prod.outlook.com (2603:10a6:10:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 17:28:09 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::7a) by AM8P190CA0025.outlook.office365.com
 (2603:10a6:20b:219::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 17:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 17:28:08 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 17:28:07 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 17:28:06 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 17:28:06 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Florent Tomasin <florent.tomasin@arm.com>, <nd@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panthor: Fix invalid handling of AS_LOCKADDR
Date: Tue, 7 Jan 2025 17:27:31 +0000
Message-ID: <20250107172732.87044-1-florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|DB3PR08MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5333fa34-4513-4cfa-f8e3-08dd2f40a761
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nPB8yokrd1gxzkHRs6Qt6s2cn39fFN1ujYD96oyaR0n2BT0zGVHFIiYkz43M?=
 =?us-ascii?Q?V4Hb9VlIc9MWSyJqpeaDD3hheY4UV/LX5JPmfpE9yBEUMjEfl3OFf01wbBeK?=
 =?us-ascii?Q?XdHlwNJJS3lFQFvxoCBlYe2LinXGQZTIswERT28tj7C9bshetiuZgB91fkhI?=
 =?us-ascii?Q?+eHf/ys9FwS3pgoOVhrL3NWoRjCDMbpIpDMQdta92ppsrM6X5T/7v0LyDdup?=
 =?us-ascii?Q?gFvL4u9mT984a/eRn2VlyyPrLhKtU3/cP5PTrXIgHl/G3yAs4gA+QOFrJq4H?=
 =?us-ascii?Q?RrSOZC+yPtQyl+uZ0PuHUqbFNEUI5yYfFhIQ27WfUj/Q9JcBZe11c8UofR3d?=
 =?us-ascii?Q?q0FJvwADZRRlENnaZTabecKojhCgb6e0CHj5q4aslwQGlw2ex/9dtTvWCt21?=
 =?us-ascii?Q?4gyCCjGeuLf/hSSExMNiaA23Qs8GckXDQEUPAfA5rOs0vcK/h/AJe9ngK8y+?=
 =?us-ascii?Q?EjiipYkNDZAo5/Rly4wHTe8Xq+LGpCbbBUEg3OF0lPaHljLP9n5ddSJ13H6v?=
 =?us-ascii?Q?oytvM/FmL7RMtB+lnseWvmUjKrrJjP8kiikPF2kSRQqETusRT6RbLSA6JV+g?=
 =?us-ascii?Q?oKVWj1KufbxK/wv0rkjcBHFFQwuWmIbV4yLGX99J+y1Bf4CzAj6389VVc6vl?=
 =?us-ascii?Q?H3b/LiWRzX5EAk5BmsD02IBy8g0s1Vh/DWKzuKRC4OammHQOmcXjfAD32cYG?=
 =?us-ascii?Q?MMzH7uOzNCR2WbRMTc3Ff6nGKTCdNpsQJQHoZMa8KpnFwps1PEorwQDXtv44?=
 =?us-ascii?Q?iLa16g51xYW34PtMuYhXIpTC+ZiVMzyIsj4pRKbpmXzQdyaqRruGLLbxKeso?=
 =?us-ascii?Q?eBM3GTAz5jzZ8xsEMQCHtgLJvo3hVcHR5cPpRaf86VGsHKpsmnCQcSzztly5?=
 =?us-ascii?Q?i8NG2i+ag658jUxXTBaqpwvGm1+ufyVPWGyYSqJoGDnp/6aDpGWbmE1xw7Mk?=
 =?us-ascii?Q?ySA6bRCNBqKI0i8kSafR5zU5KTmMbulNE47jAA8xMfthADaBUU8pXX512MUm?=
 =?us-ascii?Q?3yOsxyajihXvcQ05a3pmNY0LCFAYkWKEAfBum+QsYNWvejdno1pHcT5Z4VLW?=
 =?us-ascii?Q?wh9CVDcZVvZL6ScBgAC2RNIwS9S6CkjPj5bSVRv3Pzb00zUYk0yI8ksz9/OL?=
 =?us-ascii?Q?AxZ/d2QGXacK29A4JnNgIdvL1InHCbGjAXv1RJI/9B8+0W2Kt/e2tHXihZ0P?=
 =?us-ascii?Q?vih0S9DAc648ieYJLp461ajAzlFkOo0h7AnkY+rZO8dI04mjR+ppEIAgWUdv?=
 =?us-ascii?Q?+XVCfOgbaT5n2n96WN5DiWjBBGLh0f0IAHOGOVZow+JuUIRzEkNKYWLMZWDf?=
 =?us-ascii?Q?coGrnn1DEejcx8FElYHGFLE3llszZqa9Do9vLkM4j7MaKQxhUQd/29mcTJwW?=
 =?us-ascii?Q?LppzgT4N0XL7kkqg/KRQ+zuyIor54r4FN+AtLls6dcTLn5QWsiTJEFPRlsZL?=
 =?us-ascii?Q?CukYKi1Zfht1l2CLmsYmj5tvklBVNRQ9eZNDb052fZZSkhbR1EfZ1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:172.205.89.229; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 17:28:08.8637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5333fa34-4513-4cfa-f8e3-08dd2f40a761
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[172.205.89.229];
 Helo=[nebula.arm.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8964
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

Arm Mali GPUs require AS_LOCKADDR region to be 32KB
aligned, and does not support a size greater than
the one specified by the HW property:
`GPU_MMU_FEATURES_VA_BITS()`.

NOTES:
- The size limitation is implementation defined.
- Invalid alignment or size can result in an HW
  undefined behaviour.

This patch modifies `lock_region()` to retrieve
the maximum region size based on the HW property:
`mmu_features`, and returns an error code if the
requested size is not compliant with the HW
limitation.

In addition, the function will guaranty the region
is always 32KB aligned.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 37 ++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index c39e3eb1c15d..e834bc4d9a52 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -533,15 +533,20 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 	return status;
 }
 
-static void lock_region(struct panthor_device *ptdev, u32 as_nr,
-			u64 region_start, u64 size)
+static int lock_region(struct panthor_device *ptdev, u32 as_nr,
+		       u64 region_start, u64 size)
 {
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
+	u64 full_va_range = 1ull << va_bits;
 	u8 region_width;
 	u64 region;
 	u64 region_end = region_start + size;
 
 	if (!size)
-		return;
+		return 0;
+
+	if (drm_WARN_ON(&ptdev->base, region_end > full_va_range))
+		return -EFAULT;
 
 	/*
 	 * The locked region is a naturally aligned power of 2 block encoded as
@@ -552,7 +557,8 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	 * zeroed and ends with the bit (and subsequent bits) set to one.
 	 */
 	region_width = max(fls64(region_start ^ (region_end - 1)),
-			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
+			   const_ilog2(AS_LOCK_REGION_MIN_SIZE));
+
 
 	/*
 	 * Mask off the low bits of region_start (which would be ignored by
@@ -560,21 +566,25 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	 */
 	region_start &= GENMASK_ULL(63, region_width);
 
-	region = region_width | region_start;
+	region = (region_width - 1) | region_start;
 
 	/* Lock the region that needs to be updated */
 	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
 	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
+
+	return 0;
 }
 
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
+	int ret = 0;
+
 	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
 
 	if (as_nr < 0)
-		return 0;
+		return ret;
 
 	/*
 	 * If the AS number is greater than zero, then we can be sure
@@ -583,7 +593,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 */
 
 	if (op != AS_COMMAND_UNLOCK)
-		lock_region(ptdev, as_nr, iova, size);
+		ret = lock_region(ptdev, as_nr, iova, size);
+
+	if (ret)
+		return ret;
 
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
@@ -608,9 +621,12 @@ static int mmu_hw_do_operation(struct panthor_vm *vm,
 static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 				 u64 transtab, u64 transcfg, u64 memattr)
 {
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
+	u64 full_va_range = 1ull << va_bits;
 	int ret;
 
-	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0,
+					 full_va_range, AS_COMMAND_FLUSH_MEM);
 	if (ret)
 		return ret;
 
@@ -628,9 +644,12 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 
 static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 {
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
+	u64 full_va_range = 1ull << va_bits;
 	int ret;
 
-	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0,
+					 full_va_range, AS_COMMAND_FLUSH_MEM);
 	if (ret)
 		return ret;
 
-- 
2.34.1

