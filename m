Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C676CADB2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A75610E70E;
	Mon, 27 Mar 2023 18:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400CF10E6BD;
 Mon, 27 Mar 2023 18:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M87AVQ1fLHvij+Gbk57IhX9UxJqwt5dwhE02URu0kcNaKaEvoSpjgLImwi2w031kyElOSg8sRSyhgeyLRSMTeiK1jufRRYPLodiVVJfXal1TCzKetFcLshlqDi3s9nihlyNXoqmfDEUFl06z2/OWLZ58YyL7Ym70hg4t6PkXsCNL2TBZRWhxcTgx9s1kVuQUA7is2HvqLYd6cAMKXcRt8Blcr0tOWjhs+gpEmDwFfgzDGtcllwjjeOAw9TQ9YC4Gp+x68GAedmeeJkXDCxLUAvesy/+s6Mavs7PFII5D08zSwztRPJJoSQdDkvHmtGEqpN+dXbUj0h4K9vTuRpW1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVEeDtFlsXdMwzHhEjDgHGOaRdm6sLUFz277TN2QDl4=;
 b=TaG+b10aJ5A9q0f7iLyVrDjqjeRr/T/uYf173VH4eVO44XCnkKzNkyn2koBjCW+NmDzX9dw6awoXWl6bhri7RClN+TvmosEYWYIJ6fFh6+7Ow3JiFZf1uOCOI8NQRvjG20CxRb8obDJofZeurtFmu9bg5nGjNaM34yXrdI+wWFBynMvtaRFTxTNF4PLJgKFuNOsvoaYY1zIgi1JcGtPDS51A/9SgNbOLnLurvs2eJKZ3d9uEbGzZGG2a9XbnbBdbW2RR2izp/X6PNGhoO290c4GmV17RxDyQ2ub0fW/DWG5UfZMe0JWCUeZxNCL/Scuu8vOQh/P2RmgD1urREr8A+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVEeDtFlsXdMwzHhEjDgHGOaRdm6sLUFz277TN2QDl4=;
 b=w//T1X0sVHkzxv7Y0k6fptw7sbNbglEcTkd66lHPW4A+5dQwDC9Kk2ma1sIUmGhu2JzFcUAIFD+yh5MRezRKNVZVFmXEV3fnUGYg8/7+/O3KJWmbgKufV6Re9PZOepI8aNX/bVWsG4hG8q6Sot7uBjTGx50GRkzluw7ekvVddBI=
Received: from CY5PR15CA0074.namprd15.prod.outlook.com (2603:10b6:930:18::28)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:44:03 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::9a) by CY5PR15CA0074.outlook.office365.com
 (2603:10b6:930:18::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 18:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C979.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:44:02 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:44:00 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/34] drm/amdkfd: bump kfd ioctl minor version for debug api
 availability
Date: Mon, 27 Mar 2023 14:43:38 -0400
Message-ID: <20230327184339.125016-33-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6cb0a7-a9b2-4fca-55f6-08db2ef33c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAVMxFOL9w40xHXSaKh7OU+v1PJonVgQNsYNbKOhoKRDoZSR774cpumCJNUGj/hg06tOlLTKUYuGyCSmSoK06so1iZ197QZR4FNflDnf36G7fVGK5K8Ncp9tq9HgjnJ68xzlBN1T+jUjnPOL75cr+WIfausnJJ4bZ6a5qPsunoPj2saAcA3cj9diIDGLzMyyS7I6r0h7VFCoQ6cPfOB8aai59RYac+pa57JQfEoMnhTYDBa6DiQlxVPBCzncSXvNx3qzAU8y/v3ZiZJa7vaJMz6AKX2ZcaT83oBfihMn8MtVp9FfnjdTrAAE6t2+9esD/JCwt7Gq3pNZS32dVijgaLuAcyzUbySZZb27MLC0oTmsbX4gvX/+aqWzMalmhSGBY5ugD7dJx5ZB1JXWgqcalUSjMz2lVZDvtq6v86kXySwC5M7AaBaLg5ZglU8I3/54R4w0AcaekWmK2x62a32XpV07XmEhXWGkKXUzOWC33UbQkbznHC9kZ8mkkmPQs7zbyPtGa1LaprlX9b7Dc03xDqI0hcmd5m88HR2K/km4iJOBUhypdnqKJRSB5AnKFg4AXVGl6xtZLb3QfR6SoXJSMTaE3O6nILK56FMuhlQa8RU1IS3CsLJOI/yQ7+ahEobaRKI1+oy1SYICRQ4+fTc1LMek8+WiO4ngg6aeCtSnhnIKjqVET210B1omiS7ik47WtS0arLaF1O/iM0jj4OvhTxkf2oJ3SkZzs9vWCtiiJgE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(4326008)(54906003)(7696005)(110136005)(316002)(70586007)(70206006)(450100002)(8676002)(41300700001)(36756003)(356005)(86362001)(478600001)(6666004)(2616005)(1076003)(26005)(47076005)(426003)(2906002)(8936002)(336012)(44832011)(5660300002)(82310400005)(40480700001)(81166007)(16526019)(186003)(82740400003)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:44:02.9396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6cb0a7-a9b2-4fca-55f6-08db2ef33c87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bump the minor version to declare debugging capability is now
available.

v2: bump to 1.13 after upstream rebase.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 1 -
 include/uapi/linux/kfd_ioctl.h           | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 3254274bcee0..ead5afe4216b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2970,7 +2970,6 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		if (!r)
 			target->exception_enable_mask = args->enable.exception_mask;
 
-		pr_warn("Debug functions limited\n");
 		break;
 	case KFD_IOC_DBG_TRAP_DISABLE:
 		r = kfd_dbg_trap_disable(target);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 0e05c0f3f348..7321fc8d1622 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -38,9 +38,10 @@
  * - 1.10 - Add SMI profiler event log
  * - 1.11 - Add unified memory for ctx save/restore area
  * - 1.12 - Add DMA buf export ioctl
+ * - 1.13 - Add debugger API
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 12
+#define KFD_IOCTL_MINOR_VERSION 13
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
-- 
2.25.1

