Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5943BD22DF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EC610E40D;
	Mon, 13 Oct 2025 08:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E1NGKoW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012056.outbound.protection.outlook.com
 [40.107.200.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292610E40A;
 Mon, 13 Oct 2025 08:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njM8QgBbfU8MeoCYC1XKZ0bSJc5/cp1tSnOMG7lgcYgFI/beUtZO8cz7kEWkmBvuo2PsXw3kMk8WCTBK+H9qZ9cPm8GSX7P3oybWGEFvguiUotpDkD8aOY9WOkGiOj/Gb861p2quoTPu8eMp0Ty8zVAz5Vk0bQG/5UUsdOpWw1LR1UPEYZDVm/zddClxh1ZqsrB1y9IrJhmCQU/rHZoeBVNw3OhnhckqydxdxXGm1HckiNKQbk9otrhDQ5hh8vS419J+XDJ0TTvsZ0083obyIRlCTukTU2oZgZASZAtt3vukrZ8LBKxnf4slucJ7IQ6JurFq6rBeTOpONXot2x244Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6jOBONQwha7701lJEA6mN4ftKNeu0jfBF1lhWAKu/M=;
 b=XUJazNLlBJPT//hL7uY7G6oaU5Dv2XKO/s7KpXcEuEdzXQ54Xej5Z/NzbJb6YOiBq47B/QtReRxuD0ZYWQ6kL3kxbj1h2CmS2RRipovmJ6JJeEli2QebIriiHamzusxCi76yjlXm8+GgR/gFVcLy8PIQCS1q4ZyA38fMSokC8BrWcgi5iiqWz0Za5KUbjLbUyI1KiW2PJub3oyqUe7vFMruJ9PkKW7FRFHvsLZzSYdjEPuDEdBKj+ee9h171aPninUfJM51KlAq8RWaZBLbOO6upzu7aWFFNXybEtb5E30Z6kQ73QyrmC06OHZl0ddu2jTh95XzGEv4nVWMXu6TS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6jOBONQwha7701lJEA6mN4ftKNeu0jfBF1lhWAKu/M=;
 b=E1NGKoW2/ln+MfkY67T6M+k8o5kWjSWNqg2Nr8EInwmIFTHtGh6Dawfw+oT4Q5DvXodXPdJlSp6WqEgM9/6h4qx9dMsvbWNIqwOgVLvuYvyGghUfs1iaSN8V4/6sM5hCOGftdb18sIWHvqq25QDwE9nnuOS3njupmMBnw0L989M=
Received: from SN7PR04CA0167.namprd04.prod.outlook.com (2603:10b6:806:125::22)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 08:58:59 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:125:cafe::89) by SN7PR04CA0167.outlook.office365.com
 (2603:10b6:806:125::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 08:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 08:58:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 13 Oct
 2025 01:58:57 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Oct
 2025 03:58:57 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 13 Oct 2025 01:58:50 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH v2] drm/ttm: Add safety check for NULL man->bdev in
 ttm_resource_manager_usage
Date: Mon, 13 Oct 2025 16:58:25 +0800
Message-ID: <20251013085849.1735612-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|IA1PR12MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: c09498ed-dbda-4727-1e1b-08de0a36bf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmRxa09RcjdwQkxUSnc0eFRwaWJ3Wm9ZSVJVdFdyU3Y1aWJ4UC9zN3JQNHpP?=
 =?utf-8?B?eVhNUTlHZEt3OC9jakt0ZndEZXNJNU5xWDVTRU1OSXY3RWVzVUM1TTNnaU02?=
 =?utf-8?B?NFAxa3hLNHZzRVEvbnJ1STZnekxBNHRqZUNxTW5QN0JsSXJPTTVVVU9SUnF3?=
 =?utf-8?B?bHY4d0loTTB0d2F5S2xSMTBrSnc1dDhMSzZVUk8rcG81MDhuZ0hOQmtSSm5l?=
 =?utf-8?B?U1ZKZjhIMXVISWVtNktBOFdxeU5rQlVQaWEwZis5TGRWcS9aejd0RVIrbUZh?=
 =?utf-8?B?VHo1UHBLVEJsQmY4QldQMjR1SjNQRmIwZ0tDajMxUk02V1VCcE16SmFBa1Vs?=
 =?utf-8?B?MXJKbGtqOXg2cm1scmlacW56cFBTTEpuZFM3bVduMXk5RklpWHFCbnhLc1ZF?=
 =?utf-8?B?WEdNUDB2aHdWRFpJVDhWZUo1d3RtSUp1bDJHMUhZU3AzVzJEWTJzajZtSGIw?=
 =?utf-8?B?ZmRPVStvZ2tDVTk4SkplTnNWYU1ScGRXQk9mUzBsR09WL3Fha0FGamxtMm1N?=
 =?utf-8?B?QWlGbngwZWxRcENwTElIcXlMNTVTVGxKYUNhU0FtUi9uRVlseDJXUDl5K3c2?=
 =?utf-8?B?VmtMaUUwSGRsZHN1bHhsUnJhOHBGeXNDaUxmbmNRYm9CWERhVXpBaVdvRy9N?=
 =?utf-8?B?OTBJNWsyWWZxdkJrKytHRDFqUEt1RVdON0wxMyt4VUdlRmNpUnlDeGlWUity?=
 =?utf-8?B?L3Q0TlhSR24vYnNuVm9xVWtibEVrQmRwb1JUQ2RzMDI3YWsvUHR2OXlIQlhn?=
 =?utf-8?B?S2kyRlUzcjNTaUdpcXkyekNiY1AyUFB5ZzdpYUx0ei8yOXB4QUFlSXdNZXZV?=
 =?utf-8?B?VmhPTmpwUXlTMU10NmdNME1YZFlDYmh6NmFpenlwZ0oyQTJhQVNVQVRCRDVC?=
 =?utf-8?B?N3lqMXRiTld6OGtLZjhqakZPM3JmK2l2Y3hUdGk2SFlEYisxN01ZblZmNFgr?=
 =?utf-8?B?RmhZYmpHZjU5SWU4ZWJXV0FzUnZHcS96by9xY0Vqb0dzS3ZLejJHdUlhUW1j?=
 =?utf-8?B?MmR1L1ZxTEZVdk9TSHhJY29VYVBKRnhtdk9BU0hyZ1VuRjlVUWpoSFRRY3JR?=
 =?utf-8?B?WnJaTFA3czRaVStOWnlJdmJCUVBlT0FMTkY2ODBDR3Z0TnRSNzZoWTdVcGVt?=
 =?utf-8?B?Y2tTQlVwakNrU0JrTWQyU0V2cEQvcWFsT0twcUZhdzJkcmxVTTE3cE5nd081?=
 =?utf-8?B?aC8xTWVodW45bGkwd24vMjBwQnpGWm9idXlXY29HKzdCL1ZpRXc4ZnEwdUxB?=
 =?utf-8?B?R21KQWpLcWZWWEozWVYyOEJiYWExMW41dXJNblNqVThPMEhVTXRIZUs2Rk1q?=
 =?utf-8?B?a3k1S204Q3RTNjU4THowOGtpZysvSmVmaGZaTlhyckV6L0pXWmx2aFJmOXIr?=
 =?utf-8?B?aVhydWltMGFZRTZMOW1qdXVJTGQwYnVuZC9MU2NSL0JvU1NCUTljeElLYXpk?=
 =?utf-8?B?VDdXVHBNQVpYa0E3QmRYVlVXeVVMNSsxaHpSYnRiN053d0tPY0hyYVpZSkpX?=
 =?utf-8?B?ZUxQNG9qUDQxbkRTTDJIZmRnMVRHbzVScFJzeTlVZC9yT0I4eFhWRGFHT04z?=
 =?utf-8?B?Sk9PUjRxV2RTMWx2eGFhVXBuWExrZjBGeWRlWG9KRDVkWFIxd3hMUmVXNnBB?=
 =?utf-8?B?Y3FNYTRrR0ZpdXc1VFY1cHpacEhxRlludEpUWTc0azJyTmdiQ2xYMmp4RzY4?=
 =?utf-8?B?eCtTc0l4SDlFWVhpVUttcHkyOHFCOG1HR2UySFNQUWVxNTc1YkFxRytHZEZI?=
 =?utf-8?B?MEMyV2RaNjdhcHdSb0daSEROc3ljaWJnc0JMZVFTeVhhN1NmQUtXdzZ6YytP?=
 =?utf-8?B?YlM5YzJtVWo0SlJzdjBxdDNpczVpVlVTdlc0QjBoNzB2TGVIbCsxS29LdjdQ?=
 =?utf-8?B?RlZaSDBHT1JuRUNPOWkyR0N4eS9CY3BPN3JFNFRUMG1PdG83Ujd1YUVGVjFV?=
 =?utf-8?B?TVR4a3RmTUpWS0xaNTdJZ1pZR3ppeWc2QnRseC9rVjFlWGx6MGQvY042RGFT?=
 =?utf-8?B?MjZoc1pMOEJSVXdUZ0lxZCthanRuZFA3OGdGUm1NTkpRd21ETEZSeUpYV2dm?=
 =?utf-8?B?cHJvb1Zkc250MGpsTWg0R2NFZ0Z1WDN6WDErNmtGWWdnc1FTTXBoc0VkVWFy?=
 =?utf-8?Q?r0eg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 08:58:58.2212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09498ed-dbda-4727-1e1b-08de0a36bf0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
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

The `ttm_resource_manager_usage()` function currently assumes `man->bdev` is non-NULL when accessing `man->bdev->lru_lock`.
However, in scenarios where the resource manager is not fully initialized (e.g., APU platforms that lack dedicated VRAM, or incomplete manager setup),
 `man->bdev` may remain NULL. This leads to a NULL pointer dereference when attempting to acquire the `lru_lock`, triggering kernel OOPS.

Fix this by adding an explicit safety check for `man->bdev` before accessing its members:
- Use `WARN_ON_ONCE(!man->bdev)` to emit a one-time warning (a soft assertion) when `man->bdev` is NULL. This helps catch invalid usage patterns during debugging without breaking production workflows.
- Return 0 immediately if `man->bdev` is NULL, as a non-initialized manager cannot have valid resource usage to report.

Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e2c82ad07eb4..d93d1bef6768 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
 {
 	uint64_t usage;
 
+	if (WARN_ON_ONCE(!man->bdev))
+		return 0;
+
 	spin_lock(&man->bdev->lru_lock);
 	usage = man->usage;
 	spin_unlock(&man->bdev->lru_lock);
-- 
2.49.0

