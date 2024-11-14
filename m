Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D839C86C5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251F210E7D4;
	Thu, 14 Nov 2024 10:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tEdVRIr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51F610E7E3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Npb4Vqp4lDeGa3DanBJPHeaWx8zSryvA179Ggz1IXOaIWMDSE4uncahB2WJyX8GHqu46mMv6dSxIdeMbCLVTG5/NbtskBhCPSO7PcfLIjx+QgFU1Xbdm9VW7cb20TY40sEawXM+3qaVDTbPg2uS2bJnqBVVnfqLJXHFqzzbU0PatNZk2HRrdKGJUK8BxfZzbF6Wp6nT/kM5eaafq/jfNbYTSTZj4Usu0ooYVoUWHcz51krER6BTnI/q0vxD7j6EP60W7OHff9L+LkSj5bJEKePgnYaLqmN6WRowivnkCjn/Zw+fQHVsrFMnHyB9gTmoX/E8KkN6VFztfgH+X8CkQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qt5i3oj8stGipp7Pv2R5c4lpJd0jiua3CfasWK0oG4g=;
 b=dlHDgPORJwMU2/TdUE73vSmLPGjMRo0WUGfWqgIy2V0fIsu57zpmyeOPzGU+dfhMj4TMzkS4EYrvBuoh4OPAk/0P447iDbiZmrrDcQpH98tpiDtbV/WoIj9ws2PhH7Q9aOYhDzR3fP+yn5aM2+MNSkd0JV1RBjyt98tCC4Q4Wk64mA5c5YyoRWYIjJBbUFEsIPZ8cySuivCQSg+n0Yy6Kn8svkZlIF/RPjgWAfLkLYLAPqIjJe/aMJeMi9+8tCWR8YC10g+CShDvI6Nm49iFLIA3MJqzqo0BhdZYu73z8IeuqlyfsOatYDihV8B3SCvYysvgVZVVqhl70VDew0sVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt5i3oj8stGipp7Pv2R5c4lpJd0jiua3CfasWK0oG4g=;
 b=tEdVRIr4t4UB6gj8GxgwEhqrTqbWwce2KOXl3yAh0p7M9Xvyvf/3qY5UWANTXi38B0xGmsHXM+fOHrZ9Scv4a1rX5aa12f8mrPxLfIJuPLMrHTRHVvFxObbkraNVLkuzYjmhdLSkjnRNq9H+urgDHfpjzfp+Vz86RO0NGvoUCb8=
Received: from SN6PR05CA0020.namprd05.prod.outlook.com (2603:10b6:805:de::33)
 by SN7PR12MB6960.namprd12.prod.outlook.com (2603:10b6:806:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 10:02:13 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::1a) by SN6PR05CA0020.outlook.office365.com
 (2603:10b6:805:de::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 10:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:02:13 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:02:07 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 6/7] drm/sched: add the drm_client_id to the
 drm_sched_run/exec_job events
Date: Thu, 14 Nov 2024 11:01:09 +0100
Message-ID: <20241114100113.150647-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SN7PR12MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d15d28d-53bf-48d3-30f6-08dd0493698d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jzzdZ2/KbrgeIT0DowW2bNgMmGKnrZ7VnuoUPKmK3/6+/D3p1xImEdavvvV0?=
 =?us-ascii?Q?ckNEAulurXElO65rP96MZKpx9b45B2RzvFnOkPhvHXhTo1RZoeq3TbyS8zf1?=
 =?us-ascii?Q?JKnCcEwyYMiO7QqF628HrtyLy/lKDxxLECDMOLBYawbm0C/pW1PKY1YKVS5S?=
 =?us-ascii?Q?QGlZ2pC9LOlc2C0GwLCHTQ4mvtqb5nQ+RBnubpINyBopVkCMJ1ftl5Xr6YUk?=
 =?us-ascii?Q?QVSHD4yQGQM2nqY8isKy9ngjl+ibsKZZAMOrLyd5wv81LjB/PcwNeh64VQP4?=
 =?us-ascii?Q?f26Gry/rgB81RXYy9yTSPvohO3eyWCZGsNDDY4bCF69xcDkCJC4ZnCom5VfY?=
 =?us-ascii?Q?EUJwpa1PVshfOncByxUVrmd2iwa4Yfy50S8pHDCUwK4Q1F6XXZfEQ1h62/qr?=
 =?us-ascii?Q?l8T7w1dNbBGjcgN6P4kerZSt+t0I1/7e0FdRgzu9jjFaia4cRyUP3vTR4LKw?=
 =?us-ascii?Q?JrfRT8qDhtNkF1XAeTBbzJ4+7RRW1Ebw/7PF8Ln8OcHcwtedXPnqeAbcyrB3?=
 =?us-ascii?Q?a/us0ssaQRn6RqqDrOvLbX683Al1iQ7IHhLhBTG56k1PXFmkwOat0HNrxcFI?=
 =?us-ascii?Q?06sw+Jyu1xmz2ChDRPlEoNs+4aAYErH8EPwGAZHc71eGxJ7gfyllAuGPmfER?=
 =?us-ascii?Q?R9ySy8bBTRSDORNtmEZ7Ig9srZw5vUCO6xXsDbMhptXHHqHce2gfpxIdy9dm?=
 =?us-ascii?Q?WvMGmvleqKIRYBoy3ZDIfmbYs9aD9ojcSSkP+YPhWEDK7NhskstANWxkybR3?=
 =?us-ascii?Q?2BT6UAxA96otknwRgB8h7CdNfLuTvSMRD4bCnhNBvpoMNdTp6STbpZSac1lf?=
 =?us-ascii?Q?XAidG5uJ2QkNugC6ZJSKX1jeXncQQHLUioJizKherWVAQjqNJwm6DsYi8bRT?=
 =?us-ascii?Q?yqOum+i3K36Ywk/I0AQyHPBeKQXKSNjbK1sDTUE1AK6nevA0YkjfpEUpRn5K?=
 =?us-ascii?Q?hAZYsICExuYCpgXmSX8nsH/omh0SIWqeoShM8dYOTgzPlnmfESdYTczwnyx2?=
 =?us-ascii?Q?r42/wNFOkghL7m8VZdhgYbSQPPsApCP5FP4NFZXxzp3gFJLS9LHtvl4DPJm1?=
 =?us-ascii?Q?iR+RBddD+zaVSTGHKe8coaEydr41BhPZ86ibxeCsORFHzfRWz7QGKGnq6jHr?=
 =?us-ascii?Q?uY9kqw6i/FRTzore7LP9jgrwzkJA9aRaAJPUTQzmnYAsMnc/2DxvpEy5AvHi?=
 =?us-ascii?Q?xcdgevHqzxw9GmmUqlVaN2yT4N6rmFzl+ZWGhItBAz1metb4D3ZxZMNqZBi3?=
 =?us-ascii?Q?Hynk5g+CeXFKno7OBc9NsX7EJ7uMahJ1Yx5juQO1j5e8iThLQXMT2TjxkPC+?=
 =?us-ascii?Q?ndhBga8+I4lEq2jetzqpjF4EC8YegdCWyTX0feADIc5GD96j3Nbw2a6NHe6G?=
 =?us-ascii?Q?tg/xj4pyOWb6NRKtmLF3N73W9LEVuqrElptphshm7ZFb7XtCSqxbvvwQyd+3?=
 =?us-ascii?Q?eR82rWwWxmE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:02:13.3261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d15d28d-53bf-48d3-30f6-08dd0493698d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6960
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
index 67696f5e1331..8340c7c0c6b6 100644
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
-	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d, dependencies:%s",
+	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d, dependencies:%s, client_id:%lld",
 		      __get_str(dev), __entry->id,
 		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count,
-		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps))
+		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps),
+		      __entry->client_id)
 );
 
 DEFINE_EVENT(drm_sched_job, drm_sched_job,
-- 
2.43.0

