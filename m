Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C202AF8FB1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028CE10E9D8;
	Fri,  4 Jul 2025 10:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sOIR+tw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2794E10E9D6;
 Fri,  4 Jul 2025 10:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnGfiiT+1cNil41CDz8I7O3hx8hn7RIi0HUIC8FW55BKFatuaKDDbzsdcSw3uCoGHluiqYjppmk1Jy5Ad/72G99GuecNOHREk4yL/LjtGWeyv6c4dJ6XViK+tDr0Won8kxaxChcjkyIQDd/c0taZS8cuF7eFJJNrZwD11ArYdQDKvA3N3mVl00QSTetronNrZoa4ttEF6BS9tV8i8exeN7eFzQ0eUdpIfKOCUK7SsDcmXittnfW3ParVmxj2Ay0bJxrXMbAvovQWrsGcAFsYBVOB/P42QohuEDCwjcNRHnkxl3+UuEo71QMjAxRkD6n24X6IGWUC4yHHySpYBFy3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Uel3kGi3YS7Y/E1TFsLBIbfwWVpvv62+BZ8FOiWdEQ=;
 b=VDI9D1skoxfHvmuuTSwc8jwPPJSXYyFsT8Qj+aS6qA70A1pbU0jQ2L/L4CWOibP8Su7XZIyXLxt5oriYqfQd4CyrwnXkrAKu9hcCqEosv+P+rEUsQiAfSlpA74tPE++eiaToahbeIkQDuZVEuIQD8O2UfmgSMAa/CU/PcRYdwLOwfnRLL6j0saZlctUbLAPc7DLW1ZOUE2+4S/u7RLjxlCIPbnOEo11J+1FqoSZ7AR+x7xKsDDwbNrEJ4UtX6B1LW9yvoizXizFOp3o+XuVQJYKx2xXh1UXY8D2T0mv85GKQs6qnrvXq2PkpP5Ltt4NJgsZYnVyj/CsvVrsWoJ03cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Uel3kGi3YS7Y/E1TFsLBIbfwWVpvv62+BZ8FOiWdEQ=;
 b=sOIR+tw/Mo11kNSRHkXyb/VeGUnN22MIy3BzaNbf75rFDnedQPn6ayJtbvJw34uV1ySNejorMrT8bqjjQiVtsWDVZujFFRS9yVA5SYm/5Whrm/2FD6rZvqw+ikuS2dMoVdmNxseoF6He/0OURJ6sbL/ro+uxm1ih0OTReFMDsgA=
Received: from BN9P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::14)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 4 Jul
 2025 10:14:27 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::29) by BN9P223CA0009.outlook.office365.com
 (2603:10b6:408:10b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 10:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 10:14:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:26 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 05:14:21 -0500
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
Subject: [PATCH v2 4/5] PM: hibernate: export variable pm_transition
Date: Fri, 4 Jul 2025 18:12:32 +0800
Message-ID: <20250704101233.347506-5-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250704101233.347506-1-guoqing.zhang@amd.com>
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fc6ac0-c729-45ee-fdb4-08ddbae38f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5QnZo2fH55e3M0wNZY3LXxdN6Z6+lb5dqVXrh37SQpioKW1Niov/gLKBR79O?=
 =?us-ascii?Q?cqMKRYGhvE8OyBaI8TkWS4TePyO5YJKW0/aK+e+eAy/lu3PStSxQYXYfDfPi?=
 =?us-ascii?Q?VSBIVo71z6y71UVcljPpMsc+xhhBmzb6O2FME7RxeJBkYmZNR5F/bXERbrqs?=
 =?us-ascii?Q?hibK5ej2vtJwxO4PZRJ7A+9jTkh/6wqdrUZWh4jCduWgWHy4XuWtkhQpDlkd?=
 =?us-ascii?Q?CX4VYuz+OQiMs9t+V7NBm1PIaxXkVMkD2qNlZfDZ17t+p8IpshxLGtz2MBxd?=
 =?us-ascii?Q?p9usChF/cYeJ73JQb2cTMgxEF5zHSSCPz2FSy32RaSZRrhQh2cgGf9X1NIYX?=
 =?us-ascii?Q?Ro0XEXTWqKpfXSjbex9yzsKRlO6dIMOJ05KYPhKZFnnd1l2m80S53xKsD3+M?=
 =?us-ascii?Q?9ud6hJkSh+mbRiTUXyjNLSHXqt+0n5Crks7DRRIMy1D1GrPIux8NYphxGHWI?=
 =?us-ascii?Q?ulbWEvPI8YqfkBvr1UGPaypFwgOudsNqJ+LSw+EgWf0zHaRKSqQDjsJ7tINg?=
 =?us-ascii?Q?zAq/Gr0M2ucXfmABeIXu7hYDZw5w7VDJuGHTFoyWP41ta4e3KnJAULiUENn3?=
 =?us-ascii?Q?g5VTuckswTmJMovIIFd9r1I1/FuOp+ibdumnEaxG6EnFl60WHyYJkILqZpe6?=
 =?us-ascii?Q?6nS/HBV1Nq2nP28ha8W81mbM/5WrmMqbOzqJ+M6ueUCdA+Tmo/ICPh1FcOeC?=
 =?us-ascii?Q?1YYfaXBiVz/pxIo0rAAmeNMP76M7+SB7AxCjslkknLLNMY65ILkrgFTGM9XH?=
 =?us-ascii?Q?z8Ixvu1UtYs03QCrP5xk7jHKhyMAqmNYTcHYiBkmm+0kZ2NjsnKcD4guH5gd?=
 =?us-ascii?Q?i/3I7wNs37sReJt767F2oQRygia7tWLFC6Tu1a8SDxLYZSmaY2j17U8ANW6B?=
 =?us-ascii?Q?519lLTE4QXlbZ2WSYOm1LJ4LhrsTFFcZ+o271FMYziImS8DbpsMGc2sticYc?=
 =?us-ascii?Q?sEFzMRCsCjTtF//thBZG4GgkJfnVNDIRm/DeR9gxByy1fvp9UD3E50DjfTb3?=
 =?us-ascii?Q?b50ifmSCyzgYwjz4W8cRYe++vsZmMzfK8N0P93HmkTwlnd53oC2rAZdn1wX8?=
 =?us-ascii?Q?XuJEEa9fzckdAKRls0vQD1AG17zNrDMP/RK7L/EsO+VY4aDUt4YtRLiIwN21?=
 =?us-ascii?Q?uhUnJER/KU8ffTMOlkQ6qPF3Vhsv6wKep9ZdnAoNGOAtVUmqM5QqSpqg2G6F?=
 =?us-ascii?Q?0pRkrQbDUkIEyiWQNE/fXcEKtubmPYpLatcXZEX8GjupRqbCPFdJXSbO/iWy?=
 =?us-ascii?Q?dRvurVcMjBZWwDgvDBC6cMmixs0ZPOGqHyp6fbZ0zorfA/iAw/h3rSuOhkIo?=
 =?us-ascii?Q?Usdvc8K9dkUeq969uKP+DAs7m/zAw7xzFh5X0nq5aLl85UwQ6EncR5WJUg6o?=
 =?us-ascii?Q?7iOKI8RGxa/7c9GaxAdbk8xyQzCEn88GFpvX5phtFTuotKldo/RKfX1m7aQp?=
 =?us-ascii?Q?LPKYZ7FfCHg0InLlNpXSrrXQ1YI57IVcSPcbV1aUtOGse6G5pf40/32zzJZ+?=
 =?us-ascii?Q?pZvAnXqofYhhfrU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:14:27.7173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fc6ac0-c729-45ee-fdb4-08ddbae38f18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
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

https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588
Per this kernel doc, dev_pm_ops.thaw() is called mainly for resume
storage devices for saving the hibernation image. Other devices that not
involved in the image saving do not need to resume the device.

But dev_pm_ops.thaw() is also called to restore devices when hibernation
is aborted due to some error in hibernation image creation stage.

So there need to be a way to query in thaw() to know if hibernation is
aborted or not and conditionally resume devices. Exported pm_transition
is such a way. When thaw() is called, the value is:
- PM_EVENT_THAW: normal hibernate, no need to resume non-storage devices.
- PM_EVENT_RECOVER: cancelled hibernation, need to resume devices.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/base/power/main.c | 3 ++-
 include/linux/pm.h        | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 40e1d8d8a589..d50f58c0121b 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -61,7 +61,8 @@ static LIST_HEAD(dpm_late_early_list);
 static LIST_HEAD(dpm_noirq_list);
 
 static DEFINE_MUTEX(dpm_list_mtx);
-static pm_message_t pm_transition;
+pm_message_t pm_transition;
+EXPORT_SYMBOL_GPL(pm_transition);
 
 static int async_error;
 
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 78855d794342..f01846852a90 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -657,6 +657,8 @@ struct pm_subsys_data {
 #define DPM_FLAG_SMART_SUSPEND		BIT(2)
 #define DPM_FLAG_MAY_SKIP_RESUME	BIT(3)
 
+extern pm_message_t pm_transition;
+
 struct dev_pm_info {
 	pm_message_t		power_state;
 	bool			can_wakeup:1;
-- 
2.43.5

