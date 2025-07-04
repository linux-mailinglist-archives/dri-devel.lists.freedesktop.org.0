Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DA9AF8FB0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41FC10E9D4;
	Fri,  4 Jul 2025 10:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aoc5UyQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2291D10E9D4;
 Fri,  4 Jul 2025 10:14:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxA9v1LxNSjPu4+s6Grid8yp+MOPYaz3Z20VXqsL0svy9d68WigT9pkIwthhd+U4NRm7jwDGiYZgKFywRLJ7NvA+ARL0WSzmLjODP9td0waO3D2XJmQJlIriLVJKt3v1nUD/nP2+9NG8P7dyUGq0DdZgDngcJyKFl6Z8CefvpCYhHYyWEZZbUFEvnPBRNLukMldTw6NyztEOkh6Jr5sApa9ZAu+4i/XYUa9vGPSsI3bA5tYI38O/2eVUHfJfoE30Eh0pcDsRDM5V52lAaDc80vNbgsstisS3/FiRUjH3BBMaRhP2fpDHrZk8SIwAx47eW3G0EZl60qvimaGWXJk+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/kMdjNW6v3+pulSsqUQOCN4AFAHRvOBEoKn/Jk+vw4=;
 b=tLX7etbeMTlu0ldwR9+C6JP5bp9NkLXWyEEUBPAVvUKM7uGhvZd1bH5S7CdfsI9g8fOrRtZZ9sh+vUdgSsGqgb1/OIBKpZAreHTELBPuYt2E79xVOuN8OBOKjCCaPWvEMwpNm7LFXnlvSn4Ho3tY2e3PXV+ugK8sMdwUeRiyFnY6RgR1jVKTBOmdrV5GOVgBy31Yp+/rVsVKETo9aZCuQX8aX7DGvUOstFnhNxgMxj4ZX1K2nsX0DMhBd214XdKiGBMukxjWHP4/zRWUiF69BfCLAn7NMh6OiRCO2h2VkBQH/mclka2kem+GUrmns9AWGQKsBpv2lQbDOd9yTsjf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/kMdjNW6v3+pulSsqUQOCN4AFAHRvOBEoKn/Jk+vw4=;
 b=aoc5UyQF1I5VtGHHhBVl0pe0kDi5q45f2xn/lkMKo2+H4X/N108oXpCd4Az8/4tQro7UFpnPdaK8LCDLajQnOPcUQpLT/kqmUFG+4MFfdm1y6BCfatoOscsh0cUfOUDLzm11RNsd2+gNF7cIfrO06iDIliJ4Lin9NoZTIvlj7e8=
Received: from BYAPR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:e0::25)
 by SJ1PR12MB6073.namprd12.prod.outlook.com (2603:10b6:a03:488::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 10:14:25 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::a3) by BYAPR05CA0084.outlook.office365.com
 (2603:10b6:a03:e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Fri,
 4 Jul 2025 10:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:14:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:21 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 05:14:16 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Samuel Zhang <guoqing.zhang@amd.com>
Subject: [PATCH v2 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
Date: Fri, 4 Jul 2025 18:12:31 +0800
Message-ID: <20250704101233.347506-4-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250704101233.347506-1-guoqing.zhang@amd.com>
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SJ1PR12MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e586360-4f58-4438-0aa7-08ddbae38d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tfKXNG45OgGOfHnIZtCOwvWkMGynEHgu2fWii+RFjqb6647EGWjfmlgHbRO8?=
 =?us-ascii?Q?1TZXgSnotjM9Ce415mCut8VVO2ulS7P5btmXFCLbwBfAxsPmCB9N/ZaQn3vk?=
 =?us-ascii?Q?2g5iQF6PwUURHOcUIwaAy84Odm6KIqmSZosNL0hwrWm/GSGSQvoqy9MYq6Zw?=
 =?us-ascii?Q?d83Ij2U+S5ZjMwKzfrJ2LGNkptUFnrMsk/+R/zNktdGAzU56Al2lCNAYfWKg?=
 =?us-ascii?Q?3t4cv+rwTgw4w/Ay3ogmgGoIAvaFotg/qRkgAmHhe8ib+cRa44iJEE/wCfoL?=
 =?us-ascii?Q?ozpDKD4nz92PrWXJLzGa9htUWyKR8C4oAOhDNJoUtxoH4NemjGzANkWOTDhR?=
 =?us-ascii?Q?/4cDMIPZmsBoAZMpR3MsmPP7Ast8u/WDLakcez5Bu4iG7zSwhs2YG2xQ5863?=
 =?us-ascii?Q?+qC8AOqq/adl0zJGhXltsbgan+pjU7iq6RD1p1q0+HrcEB2ENQ7ECguwySCe?=
 =?us-ascii?Q?Mg0r+DgXd8GFYoHzdzmJMpQmy18seimd60OmqD45y34a6VqQri8yGutuftYB?=
 =?us-ascii?Q?0SYHa8iFmvxr3vrinUZOCFizOF6eA9pq3AJWwVunr27g0l56fQENDKFAzzit?=
 =?us-ascii?Q?aI3JmBWhcWdZl9ahffcCubpKieBSMomAJVrkOotrMoKF+eVBDZho7/kD8FK4?=
 =?us-ascii?Q?kQ4tDlHFmvpTBXo+FmkiYg1/69XAKv+kxCV/Z63qFyGcBAdTbAhxZcOeNSnG?=
 =?us-ascii?Q?4hGe9eg5irqsqrGQ5uVe/3PouT+wkANXS+Bv6H4KwpIgkysw6qMusX6ySwNm?=
 =?us-ascii?Q?H8u7+zxVLqKHRcc3qGV9xmQMTheKtbtL4VetbRiCjG2oaO63N+jr1ySGfb0/?=
 =?us-ascii?Q?JKddzszFV02CAoSJHFOMg1YpZud1SbAHkrxV7JUJW32ahO84aYQ/VKhGwo9I?=
 =?us-ascii?Q?w8dbXF7dBFLFKZyJdm5/qCIlxc20J/VjlPR7M8zdXVAs7PpGbfAlADYPwcVD?=
 =?us-ascii?Q?xrX30IL6FElLu4DRM9UuWw6zui/98lO0NY9Xpj+v1K92wzpG7i+VLfzkj5me?=
 =?us-ascii?Q?AjfUDOtlu0rZttsDFHJ1jloZ8Rl++SmthaHEL8Trd8AVZZTl2/9ZvAj+Q1PU?=
 =?us-ascii?Q?4a2iuSuWf7IZDr/DMVK1n/xt32BUo6WDPy3mvMQ3geDN0IZFF/h2xa06ZDrH?=
 =?us-ascii?Q?K2GMa19UPUZ/wvKR8OhBn84WWofiV4m31qQmtGfHnAO07EuQEngizPm1D+OR?=
 =?us-ascii?Q?1uHrMhgpzTJcvldvYR+3U8I3Av9MJJHv25kPKqYT+nzQP4BWbiJLS3gN4Q9K?=
 =?us-ascii?Q?5E0elchwBsZtd+ecChKuer2RNBfkH3aeBbkB1bbb3rjbmeaN25KD+DvUyf/1?=
 =?us-ascii?Q?3PFVzHP/tY/WaGMgMhI1IQ2o8WBHeEYiOzOO57eIU7xZVi3aeWFRGKUNCRoS?=
 =?us-ascii?Q?3ZyY3OpsorZolG0UMHA9n1G+gXWkEKd19k2qF1kKH7tdiI0/BEUROPf/huzq?=
 =?us-ascii?Q?fHYVfZEPI5XGjxv1wcMK7V+rMoVx0Wa/I3tQrGH1nytTS9tq6eYJP5SCGNDu?=
 =?us-ascii?Q?cPWEZAXkdZmqGBjDaHhRFS/ISoNwYHh/Tz49xR5ETtRUkxavOL96xKTtMw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:14:25.0444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e586360-4f58-4438-0aa7-08ddbae38d8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6073
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

