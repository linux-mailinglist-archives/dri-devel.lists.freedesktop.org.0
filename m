Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEB67BB73
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A8910E849;
	Wed, 25 Jan 2023 19:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BBB10E81D;
 Wed, 25 Jan 2023 19:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTWclPSd5QZEIOb5Q9cRBH0Qvgi2h2qkb2yzuczhi0On0lbsrDiOK295tD59VU6rPNVxUgde4+9xAPjN0mXCT6gxoI2ZeAeU6xMOAzBov2FTXDvXaJTUuj0SXeFMsnFQ8rVQijaUtqd3gVwwqu156zrE4JaC5hftZjjrESTe3kc8GYTIjou0bKrRfkdhixBmVqdbYwnrW5EReRso5WTcd1LoELWgunFl1LAOYOMo5wF9/t1kPIoExInExDAvopGhxkSHdaIS7MRvjHmqNPhqoByzB4JPyLKNc3B53DqcAb3nyESPzQqpn7k+HKNBQNZDxB5jBhgVlpB14cSUJv4zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAFFR2fcPp+XGtMysB6gn6KumH6tKRRuG/1YKdzJWLw=;
 b=EukMpFmCEMcdjKj+BOnmpvxiZ61lu5suODnj0oO3kn90lXMqf7Qm/oSi1xWUB9qUEeD3Yaq89KuXsGmrDtWRbfHsPnI51KIKkAhBJz2URkqRI5Q90lBU0t/V5NPkXdmPVy/ck+GAvA0aArbGCGTBkg/FLTm3dCzs7SNFBlpuuT+s6If6VRmiAHpryL2BGvMhWGnolhwdIJ2SwAP3Mj9TnlrhVA4DY09wjnqknV8dAGa6zsAFxDThK4UBXM5ueGglUWOQi7fFcq7nwKR0INhiAl/UcCcfELUgOMnWQ7brA/1KIsPH0PIYKGmbA7E9oepT0Ac2Dp/2aEXj/igluYaMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAFFR2fcPp+XGtMysB6gn6KumH6tKRRuG/1YKdzJWLw=;
 b=sH69wQPI1Z1N3fwmKGD8fd1gGc+dPfr2hCoh50D+9UofEfW5sMTmSbGp7/tM8IBKRT1mWINsV8k5dNe7DdMmpTEcx5+iJj8faZ8FQMTosU3xSzD6l/NYIDpmvNKfNHiJM8Cakfx7VYogu91ctAJesFT7/IjLm5MRTF9bWlddSZQ=
Received: from BN9PR03CA0697.namprd03.prod.outlook.com (2603:10b6:408:ef::12)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Wed, 25 Jan
 2023 19:54:28 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::8a) by BN9PR03CA0697.outlook.office365.com
 (2603:10b6:408:ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:28 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:27 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/32] drm/amdkfd: bump kfd ioctl minor version for debug api
 availability
Date: Wed, 25 Jan 2023 14:54:01 -0500
Message-ID: <20230125195401.4183544-33-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ac1286-18e1-4ce4-42bc-08daff0df818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsYoDJDB/LS1Yhy/4wrS01YixUqbbVDreQpm1nlkNXoeo5KUIzTtoSXyrh84HFvlSmcLsi1aRI6ChU+JXR6pkYVfIj6nR+2SSnS3NuNZxP2hHbQyX7rYS7ppKv6JxWLoVeMRBcRjQVgMUmaki3Y7yBjxUI/MLE1PUutla+CM72tTOrVjxR1w/b+1JJklIFwZzcfN4kCHzUil9Z4VaY+ixlxZbILWktAahi4GmzJ3ynzBTPUnErj1msiPiJjvygX1ytOzsHfq8/ktS8SGYbNwxlJbumDBDqB1+OjUI1if1F26hGhbm4eSAw60ac0j5/8gX8tvSe3T0DYvC5B2DcqG17muFCcLrKnScUljpp2oJ4ld/wtE5u9n999Rpx8f9HNnK4nwsSAYNaQgF8jC2YRZr+SyJnqmJljrNQn95Iaz62W1Ht0vrcerTd6ijoMMP7Qg5d7PUY1YYV6qfjd90l4pdL5MbC2MsgUz1IDCUtaK70wKngkTcJHLUZTGhY2/tCFoX18592QO18xfDSn6isZSQXTtploLwEK6YKN0jnKatsbQQfngrrubeiHivGdsvEPBYrxdnUrEVMr8xqqNXlHMVCyrQOOjSDZd2UYmizPtCzvNG+YzJSzb0iFk5qMhSZoS2wckH6SgNsPfCCZWK1M1Aixmjg428/JbXKfx5cbi0LiMjH1Tf0YCSueMOhURzcwaCxtNeEtjtLkBdnwf+06nIg+dv5ITAMYHvy2h/hkPcJI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(26005)(82310400005)(186003)(1076003)(6666004)(86362001)(16526019)(2906002)(478600001)(82740400003)(70206006)(44832011)(2616005)(70586007)(4326008)(450100002)(8676002)(47076005)(426003)(41300700001)(8936002)(5660300002)(40460700003)(36860700001)(40480700001)(83380400001)(356005)(7696005)(336012)(81166007)(316002)(54906003)(110136005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:28.8030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ac1286-18e1-4ce4-42bc-08daff0df818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
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
index da74a6ef4d9b..c28d4b2dd0ef 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2896,7 +2896,6 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		if (!r)
 			target->exception_enable_mask = args->enable.exception_mask;
 
-		pr_warn("Debug functions limited\n");
 		break;
 	case KFD_IOC_DBG_TRAP_DISABLE:
 		r = kfd_dbg_trap_disable(target);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 9ef4eed45c19..a0efe1ccdbd6 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -37,9 +37,10 @@
  * - 1.9 - Add available memory ioctl
  * - 1.10 - Add SMI profiler event log
  * - 1.11 - Add unified memory for ctx save/restore area
+ * - 1.12 - Add debugger API
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 11
+#define KFD_IOCTL_MINOR_VERSION 12
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
-- 
2.25.1

