Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DBA23CB2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B27410EA72;
	Fri, 31 Jan 2025 11:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oOkmWGaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2B110EA72
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 11:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fq1eSAv9nhDbLzSP2jZKEvw15Ka/CNXN0E/HtAi18W9C791Fi+ydSbDGJny2wT+PKFfsNkP6KxjKcnQByRSorR5sVjZ2qhhFwEIzO504+s/L1uJ6qTDU+8EhZfSmlaev3LjR20Upk+T5IjrsfODeeKQA5zi1YzR9k9/PsZI8w7ecWfJoi+bITSv3dBU9CKPz7L6V5KwDAGV1v3rO+iwyU5iO5e3YJ1472cComBMtijy2ctUifNmo1kccLJla953OhX5cArU0ZfBKMbXo3vxbc+ztluzMjOjBwVFgIzzYDLJdItz/ifeVwvA9Cuyi7cCewArD4GrwvCKGujVwMuaPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNi6owNmaR845DAkF3+Xpgj66GaAOfDzDBpPLrOR6hk=;
 b=LOcJdmHkt1Pb0R8cb4jl1FuVcwlB0fYjDGVP7+A1tOGREMoi28w974df6sYHCihRDW5RLAX5NZ0x9Ls2gr74RPcyyiocfXPqpw5emiu6tiDoTvDAOMtyIuXH9pHsdK6i/UDGuHRFJl7DVG0tlOekqPi1Ot2naVXEv5M1QiSv67pwagogw7rYsgGtiT0YyWqrFAS2TQX5O0QCevhn7Ejz0ytoO8ADSevLHCs4K997tzCPDBxt4i3uIlq0dKdaxAeoCbnmgYV9JTgRAHOiNExEI7rHM4I1Ayov3N+1m1XLuxhZufLSoYJ1AnkFAq5W0qeazV6ie4dp8aEC563ZllsXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNi6owNmaR845DAkF3+Xpgj66GaAOfDzDBpPLrOR6hk=;
 b=oOkmWGaQ7ucpYpigOp+REkOwE7AuuJ1nFrytep4T1VNfpejI2XZzlg7G8nSaaUC/VXxc9jfqA5NFsiHNaaNMmMYeHUSyEuHGzVOKl6Oyo2hzwUP2cOFZhMPmIp//EuThO5LZ6kLN0Hdsz6swevPP7USfi7hRDUH7+HYxbZpRpW8=
Received: from SJ0PR13CA0077.namprd13.prod.outlook.com (2603:10b6:a03:2c4::22)
 by SN7PR12MB7179.namprd12.prod.outlook.com (2603:10b6:806:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 11:05:52 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e6) by SJ0PR13CA0077.outlook.office365.com
 (2603:10b6:a03:2c4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Fri,
 31 Jan 2025 11:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:05:51 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:05:47 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <pstanner@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 6/7] drm/sched: add the drm_client_id to the
 drm_sched_run/exec_job events
Date: Fri, 31 Jan 2025 12:03:04 +0100
Message-ID: <20250131110328.706695-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SN7PR12MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 218049ff-2af3-4bc7-ecd2-08dd41e739d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z9L6pZ3nygCg8Ykn99a1QnrFdzCvM0XYZvtcCIObgfcgIZ4Q5j1T4ApPRexq?=
 =?us-ascii?Q?VbmMRv7D2pjIpi89c1fHChkER4NyJShquLEUJEAl5KWaqky3U/RyYy55CLEL?=
 =?us-ascii?Q?VbVt7W9sL6tRDpESQINt+fnKV7J1oVlofX6PsCZe+13ENQnbxRlyZyafNUZb?=
 =?us-ascii?Q?2MmD5hQUW9JVWsHjvx1JLPU9XIvNvvkhIiBl5MBNeUJEMUPW+KxJHzQE4t6R?=
 =?us-ascii?Q?dbl2iWpA4rZePJ02UGSSQ8N4pAOyHwN14thzI8jbaigkE7QAJ+xRYIUTn5ga?=
 =?us-ascii?Q?z1MtrHJm1lMowWX78UwYLPHYd4MbMVfTX3cM8trRYNIlqtelSw4HDCCbRRJG?=
 =?us-ascii?Q?Z+xuK7tgYfgKXmFDUE3iU+FO9A/j9PKiETKSVYeKdtZBwWQmSf9sFB/LGYNj?=
 =?us-ascii?Q?Efd5F+AAzTxypcQWU34Qnq9LltID9eWqM7or5WSwDzMbQlirINCMw7egafs/?=
 =?us-ascii?Q?kmyvxZ/aGNCNRJ7DMY1Q5W/pMmJ5ymnobua47N8kOW7FrHtkTJ59oBFxbdMC?=
 =?us-ascii?Q?klMw+MFR/8ntCufImyiG0gVU0YSZ3v/aQGEftpkRHAuwe+l5HLJyYNyrvBu5?=
 =?us-ascii?Q?eZmgIJK+pfG8+OWWU+kEySxMzLGldh/mc23C1qe0XWBxu54MxE+VYs0edels?=
 =?us-ascii?Q?z1nSk5OK3IV2WPfOFqFyhR/EM5zdknpSQIV/BoT6GtRSKgSn+hvZzNvIH5Al?=
 =?us-ascii?Q?PE47cpSOTJx6zpb79RxrzqP16wj6uuzOQU8mxvGcShv8nv0/4uO0dHSobcEs?=
 =?us-ascii?Q?KsAaoAewd1S4rUkeM/wBN0/LxDQzmrHbGLaPNmSHk9bYP6o3UMgMSf8yjpCV?=
 =?us-ascii?Q?knQd24gCJgS7Gg4aZ8C5iWQko5JVnc00SBM0NES0Rxs66Ns0l7dn/B5QuRZA?=
 =?us-ascii?Q?zoQmy3R5p9Re1AALR8jTVhW2OjdvtiUM2BBcG3UNPSkebP8YGeisQYI465c8?=
 =?us-ascii?Q?waUtg3gh4JLIjid8hvm9FY4Br813P9frrYs6Ea2UIge6kDBo16pWOrKb2kVN?=
 =?us-ascii?Q?qaff16X3Haq6bgRipjnVbw8ErqURcJe1DqpQufhRab5dlcoItlG0iXh2buRA?=
 =?us-ascii?Q?wfCysVwoApAbDskQkhyFpWMaKtSM2x+l3+DxSrKzZ4thLYmN3iUxygVNZKZR?=
 =?us-ascii?Q?5bpVVmkjQKWsswKqYaxmEr5u3iT0NhC1SVBJ+kNSbfU1SmDYiYJQQyHlOWxU?=
 =?us-ascii?Q?N6+flwksz3opb90YExnYcmufUkCfh4bUHhTl+KXAzPZ7t9CRJcjs7k+yfGjD?=
 =?us-ascii?Q?X9RLEMkxMZ0qTSL4X03jNBhiVvBaPWTGSEtb0Bl8Q0p5w9Fkf3iU6+lyg5nU?=
 =?us-ascii?Q?sLOcdbGkz3lRgDAzXizdqgCbj1Y+8+o6FVhY1U19JI9dV/W41tOiFRLiyIkO?=
 =?us-ascii?Q?RpJkOg5Xx31nYCfaIeYvxZ0i7ltXOFNpah2DARwdQ5t5jekqs+rrt0jsetVL?=
 =?us-ascii?Q?CfklJv7+9Lvpa5MWYUBnIc6ovyoJBGieouYok5K8/AJZFP9aD5nB5CeAugvM?=
 =?us-ascii?Q?ECQ5xNu3kDEPDZE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:05:51.8356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 218049ff-2af3-4bc7-ecd2-08dd41e739d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7179
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

For processes with multiple drm_file instances, the drm_client_id is
the only way to map jobs back to their unique owner.

It's even more useful if drm client_name is set, because now a tool
can map jobs to the client name instead of only having access to
the process name.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index ca19cd9a146a..5c740cb80037 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -71,6 +71,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(uint64_t, fence_seqno)
 			     __field(int, n_deps)
 			     __dynamic_array(u64, deps, dep_count * 2)
+			     __field(u64, client_id)
 			     ),
 
 	    TP_fast_assign(
@@ -93,12 +94,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 					dyn_arr[2 * idx + 1] = fence->seqno;
 				}
 			   }
+			   __entry->client_id = sched_job->s_fence->drm_client_id;
 			   ),
-	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, dependencies:%s",
+	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, dependencies:%s, client_id:%lld",
 		      __get_str(dev), __entry->id,
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count,
-		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps))
+		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps),
+		      __entry->client_id)
 );
 
 DEFINE_EVENT(drm_sched_job, drm_sched_job,
-- 
2.47.1

