Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5DAFC49C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07DF10E5B9;
	Tue,  8 Jul 2025 07:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gBsIxzJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21410E5B7;
 Tue,  8 Jul 2025 07:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWTNz2dMpfb+5uENAq8EsLqVGFTe9hkCiIbm57fmWWXoXibTJzfzUmTY5dEZgED9iwuVkad2k70Q8yhcnHwlggCssF4B0TMVZpeTVrZ9uBW8RkpwFm09QIv2M0ZOTWY+Y3J6BvGzdLkxlhna1SGYm4J+4Uvxoe6Xp56Wb/wkI0NgqA7Sz3ZTdBLJy2bUopO9IU4ZWYm9HoN2pT+Z+xV6Jr5c+j7YeQozCcjMlfjqaC6+Q/NOpVlTKhzJe9lKDXGpOaVBKI1TvptaoGa9lJBfHJaAAFoeEOUbm8qdH1+xtpSq5hFeQgdHRbAKAJXFV9fw+MpoxnGES5GIDaCy7Jd5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/kMdjNW6v3+pulSsqUQOCN4AFAHRvOBEoKn/Jk+vw4=;
 b=SQr4M12l5Al5+8/jWOkRI9UxdC3lQAsbIxhts6CcdAeHFp9RcVRcf8uKkZxzWs3vc80WH87q44bX+6q3MWeiBRLdEAheqvPndiKCd5yzx9WgRatMAX2X8VEIlHguPXOKcyfzQaRNf0UIdqU0EiJ8p84Z+WCqrhX+64GPDukBb4jo923riP3hd7sOMhBrZRxQj7Ph6qdbK6e92PrqLZIrPBijibGEn4AcRhf4LDAMUgoey7jMtJGO4bUNp96M18zsvbCATey56+RS7SoEBmxwHLUOizhDSukN8ycmjdwrEPwfln6aGpBAldAYpF1v2D9JDq3KkTWgwXDhiMozCK5eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/kMdjNW6v3+pulSsqUQOCN4AFAHRvOBEoKn/Jk+vw4=;
 b=gBsIxzJh3cBOeSWj1BKlUFZwObpjsaN461L01Cb+mDgREf+gewGBsPNBvGorpydaaQ2beOKKY1MFK0WOcLzuhhqVB6Khfj/WV9SEdQTk845BGDIz8cVpl2kBYZaQR4B/qB1Q0B1jK94KaqBBnV4GPNLqg/h70eqg/mVOrnvaHcg=
Received: from BY3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:254::9)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 07:51:40 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::56) by BY3PR05CA0004.outlook.office365.com
 (2603:10b6:a03:254::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.19 via Frontend Transport; Tue,
 8 Jul 2025 07:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 07:51:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:39 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 02:51:34 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v3 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
Date: Tue, 8 Jul 2025 15:42:46 +0800
Message-ID: <20250708074248.1674924-4-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250708074248.1674924-1-guoqing.zhang@amd.com>
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 681f2862-8fb7-45a0-2615-08ddbdf44643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ALh1AijuT5QseweA1hqO+g534VHkle9sRD9TSfgmNgAcW8gQvHvn2gk/FUS?=
 =?us-ascii?Q?B8BX9bMetiqHHYeTbZC44Joc/3eUzlirNZshqNnqh3Ea94Ag1PSouFJRM/SY?=
 =?us-ascii?Q?YgUJg31fHTD9CG3kJKxsSIqe+Gn0EPv5eQ/JQfvtwQHBBOI940ZyMWE9RdJf?=
 =?us-ascii?Q?trOIv1S5nHdoiomIBjXhNFbODCJenZHFBAFViQBzr+o4c1T57YPNU64KJAwd?=
 =?us-ascii?Q?S6CKX6c5AHENWuQ25GsKItKAdBCrg/upA4CrQIGVBmjxNTiaAB0cicQA7UeI?=
 =?us-ascii?Q?4+XM2Q26ltnZ/7gG6MU/UN2NVlTEL+kz8aTvHNaFvqUBY0l+MNLOf2bsmO8P?=
 =?us-ascii?Q?IySBOtDrv2VQsOcEIUKxEl+PZW1FZh5Ca2/Zr/znK/xzDb4EVVtKJshNWXDY?=
 =?us-ascii?Q?CxTFtBpYI0lRfmzolFjTWEgHPJG9VSw5KZAC+B3Elym+ag94pQgZNSTYnBoE?=
 =?us-ascii?Q?IiqkexT8JE8nVjteiBKIx2kL1V8P9HtaIxDup/45MefWXppQMuppmK+EXvpY?=
 =?us-ascii?Q?yj/EjHuhx2YdqjoJwNWAOX52jkpB6HyuTXDyS4C3+oVvJWOm3PrBF4HZETHy?=
 =?us-ascii?Q?vTJtl9o6YiVDDsECLQKlEch88cFe1n4UFXEJlzXzycPoA820GZNCbeHlRA4j?=
 =?us-ascii?Q?dNwsUorWmRsekxvg341kQm7D/nHUKklmCxHNIS2A0tg3Vp3LOKUK2NKNsIdu?=
 =?us-ascii?Q?t5S0nirt5ld47lQBZUILIr54ncnYwKzptclcTbIDBQ9Hp+3y7Mcc9GY4BCVS?=
 =?us-ascii?Q?uC3C7mW2oqeZSnpeXxAQ6DFx6OluC1N5xLJHzDBXooPGgFiKBl0h6XtsuXC6?=
 =?us-ascii?Q?W7jHRqPWbYACeqpPWl8SD5RputYBajhEqOPM1HlSJz8qfxc6aWJIoSTWYaiC?=
 =?us-ascii?Q?QtqwJjqrhq4OhJMN0o3xOvx+MvEoSobDb1HoQNahXQcABr3/lXau+IenJSTc?=
 =?us-ascii?Q?ARpHnGO/WxcVuQyY3GaCvmJH68KyGkMRDbNwRezwIc+YwWB/cdznTt8di1h3?=
 =?us-ascii?Q?wWz5QZZak9neQMl5CTXoOVCZ/BIESklEBPA3/xpqupad4sW7wI8OhhQgeMrg?=
 =?us-ascii?Q?koTIy4jglnJ1YL+coHuhIv5MODg3b4976KbovpFZdIzN9ebolil5y0mTf5AV?=
 =?us-ascii?Q?pCDJjdWWO5B6gaDpul1RjfXfYB7I1RgmD+unl7cHvKCRu6qsuDhHf8xE5USz?=
 =?us-ascii?Q?XWyWi6t5KMfyc9zo/HoS/bRhgsSNtOw5fPdYaUegVXhiYTwlUz1qv0gzyBzi?=
 =?us-ascii?Q?zGQqe0YzjaNxG8/nhualBhZoCOGhkCOgspxc/wBHvWlTntRe+Hs4x8Ccf5Na?=
 =?us-ascii?Q?aVkjlrwGhWpVmqq8V5sUROgFJI5hDiCbEalpMlDiT2PsTr3NzSK/ANiLdnIn?=
 =?us-ascii?Q?JQsRbzss2GHef+Ob7EQ7lVnSIn7KnjWyqjtdiOPtZSQVFjT7MdMo7y0CEoHl?=
 =?us-ascii?Q?/fk+Vtq766OKoRVJnNjWUPA6edhRUNuv9jO6XVd5WKy6Kg3dWQzliMIFcv7L?=
 =?us-ascii?Q?pgjQD3Vm8Z/jbwJzXbKVZitJKp+bsGqhbOQnKLUwpOCTs6Lz4Mh31CEqQQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:51:40.3609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681f2862-8fb7-45a0-2615-08ddbdf44643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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

When hibernate with data center dGPUs, huge number of VRAM data will be
moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lot
of system memory so that there's no enough free memory for creating the
hibernation image. This will cause hibernation fail and abort.

After dev_pm_ops.prepare(), call shrink_all_memory() to force move shmem
pages to swap disk and reclaim the pages, so that there's enough system
memory for hibernation image and less pages needed to copy to the image.

This patch can only flush and free about half shmem pages. It will be
better to flush and free more pages, even all of shmem pages, so that
there're less pages to be copied to the hibernation image and the overall
hibernation time can be reduced.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 kernel/power/hibernate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 10a01af63a80..7ae9d9a7aa1d 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -370,6 +370,23 @@ static int create_image(int platform_mode)
 	return error;
 }
 
+static void shrink_shmem_memory(void)
+{
+	struct sysinfo info;
+	unsigned long nr_shmem_pages, nr_freed_pages;
+
+	si_meminfo(&info);
+	nr_shmem_pages = info.sharedram; /* current page count used for shmem */
+	/*
+	 * The intent is to reclaim all shmem pages. Though shrink_all_memory() can
+	 * only reclaim about half of them, it's enough for creating the hibernation
+	 * image.
+	 */
+	nr_freed_pages = shrink_all_memory(nr_shmem_pages);
+	pr_debug("requested to reclaim %lu shmem pages, actually freed %lu pages\n",
+			nr_shmem_pages, nr_freed_pages);
+}
+
 /**
  * hibernation_snapshot - Quiesce devices and create a hibernation image.
  * @platform_mode: If set, use platform driver to prepare for the transition.
@@ -411,6 +428,15 @@ int hibernation_snapshot(int platform_mode)
 		goto Thaw;
 	}
 
+	/*
+	 * Device drivers may move lots of data to shmem in dpm_prepare(). The shmem
+	 * pages will use lots of system memory, causing hibernation image creation
+	 * fail due to insufficient free memory.
+	 * This call is to force flush the shmem pages to swap disk and reclaim
+	 * the system memory so that image creation can succeed.
+	 */
+	shrink_shmem_memory();
+
 	suspend_console();
 	pm_restrict_gfp_mask();
 
-- 
2.43.5

