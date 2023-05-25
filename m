Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D782711262
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BE310E728;
	Thu, 25 May 2023 17:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7910E6E5;
 Thu, 25 May 2023 17:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMEIDTwloEQZ+dCfRmnOUZJzLD/kjkNYJ7otTZ1Ytz4KTuSqz/5/QvvHZDVOarLPwP0NcEyU616Iaf83aH1EKNWqtskmEOAzzGm/HEK6YozUDVTFbJLsSQra/KPTRfvsqfoU4GosO73BlWlMX6ODeVaK9ksXUKhhiN6Vt+ON4HNe9xqTgWw0ZqPkzvEo0GdSsT1Kkl9jQdE2mNa7rTVmTSxbYGSgZlstQA7g50/6bHCkn192na5dnM3gcpTEnP0aWyUVjKypQecZVSc1RPOVUfy2fNe0wkU+Ntz+pp93di3yiEmXjzIhnTyqLsSOrTLzYd0fzy/Sg34px3g8Lut5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkYBfFgrZfJtoYKN77l3xQQMHilsRZC2Jn7eTYgVCwU=;
 b=FlTdTiv3/mrW280dUXolrQi3NI+cMFBW0S0xsjNQMvPa/f4cwcdvqlQc4HO5gw1HIEmPrmN2QHUkoXyA6ZjYmZw7awDfevt7nEyTrWNajHEH6cGnsOVJl5VHxNIcojo2+vEJn2kr8j8DOWZUzKfF9IQmJKHptXtwv98VTlzrP4CHIAqf4xFaBFCxnipYXFTEhsx8Vey5ZjAJ5NwmQMgMAScyBCXzTR1YliDN5qSAHhJ6TuvznRdJSuJsw2Ca2sqwpsL///qk+r8g04Ife3zDcy31+tlQMmFtsSygCVFwp/4V7ud3O8zCqb8XVJqpW4Ph7vvIvGwZfZoSjCYIidzDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkYBfFgrZfJtoYKN77l3xQQMHilsRZC2Jn7eTYgVCwU=;
 b=liPvEqRh1Y+bJ4FxKO+NETjuwaG+1QW7A9CxM8yhTxbcYPCqaQZ6B4kTZSelltNmGMVdOnaFBt2SCU8ck/dV6He+jBT2Q8dFNBvD9Q4Oby/4T8sZE2iJYTyn6zvqT8rpLjqPdQPX3aKAEcJFhiLj9qg5GaOEdV1lLkh3TVx6obg=
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:10 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::bc) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 17:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:28:09 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:08 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 33/33] drm/amdkfd: bump kfd ioctl minor version for debug api
 availability
Date: Thu, 25 May 2023 13:27:45 -0400
Message-ID: <20230525172745.702700-33-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: eafa5ff2-c616-42f7-9a46-08db5d4568f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psFriYXRkcS9hE91ZIRmSEWrGKeQ8bSgpGxVXpgVDzPC9ZTNfEa+sLhQPL6g8EWdN0M+f9Kz8mRTxwlXMTp7WeCFZXUOdLork/IvBXWLeAUYqarhJ/ebOei0WXw8nFi2pILzyvFtSr8YOPTCBO3ryxefQ5TDd3nhFkbaGYJJbC3Mk00pSPCtJgk19swec8fJ35lgwoiX4w3h65zmUeAOonO3nKEtInZFixGeKSMRhvdIOYzVsWVHKm7kfWxkMkNAAyTVTeUue2gGbWCXjUWbTCH3EoR2nJHOBN7xvBKdX5yXFbuyKJFibYtE37EbptZyrNwrNGEO0GrFJXSbZWVamc7ww60HnDLx1seI9rAFAC6Tw3sKU2A+uFQiAxtFWtH0XrKPMoJ4muO2z4UjDV5lPnSmXmzhGYatrXpynkRx7/WwucCCVlZzJXxj1S6vRUV9TlF7gV5Z27cTUMwA/h99bWWm5l+s//NGg4BbaEF67D2bVtnJje8VgYkZm19Oc5PcgMO/YlxRvY+24ZD2pjcO4VJFN5bmDcDXQC7kZKU5KPeetFulaGuYHuQ20pF2oiNkEo43PX5QHOvMmSUvAtw8QVy+CdQim6CCDFJLXdQbNKRm7cHj1hwtb84jLGe3846vKrfX6ENJD23KcVXcUN5n7wPPq7++J/iYJw8Qmei9szPxDeBcVEYvVoJmkUwxpphQJrnYaMOgJkzkBtJDVisjEi//aZpBSErxG++3NjrKTwLPBSov2zq+dDY98TqSxqoTzN9LK6myDAC04BABqFbkKQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(478600001)(110136005)(8936002)(41300700001)(7696005)(8676002)(44832011)(26005)(1076003)(450100002)(4326008)(6636002)(316002)(70586007)(70206006)(6666004)(2616005)(2906002)(16526019)(186003)(40460700003)(426003)(336012)(83380400001)(47076005)(36860700001)(356005)(82740400003)(81166007)(40480700001)(82310400005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:09.6572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafa5ff2-c616-42f7-9a46-08db5d4568f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bump the minor version to declare debugging capability is now
available.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 1 -
 include/uapi/linux/kfd_ioctl.h           | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f522325b409b..56f55da482e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2984,7 +2984,6 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		if (!r)
 			target->exception_enable_mask = args->enable.exception_mask;
 
-		pr_warn("Debug functions limited\n");
 		break;
 	case KFD_IOC_DBG_TRAP_DISABLE:
 		r = kfd_dbg_trap_disable(target);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index dfe745ee427e..ea0d50955eac 100644
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

