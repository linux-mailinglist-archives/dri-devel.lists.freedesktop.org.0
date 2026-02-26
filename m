Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPTiAeUUoGlifgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28E1A3988
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D014C10E89D;
	Thu, 26 Feb 2026 09:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UCrdUgD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942F10E89D;
 Thu, 26 Feb 2026 09:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUscVXLTZXO8VJZwnSbyw5iZKIvI+obrSqrRJAedoxlsc1HR4c2H5ZtZrxnKpmJf4ukiAiU+IPdiT0t7goVms0cg5rpLwbtg6bUxsriCL2Oi4B9F7VStBBVzY+xf17sy+7sNtXTJGQKgtRBr/k4KCacQLiuNUmcMSPCctLKLvVuCP/gFm66zRbD5YK6mQpjKjfHjUTShaFmUjUqf8xXzehLpN/qhhIgVH5Mfvyv0Sa6OSmddS27z2PvVkPZokbfyPhSbR0hOr+D9c/9R6ODwiStPJRiV2N298rWqLsdE4+MLZ8wRf3IMJDnlcMqgzWYq1X5dwse9tnx2jpzokRoI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7GWTN0t5MnEuaeC7NZXQRWtMxnmb8w4Fun8c//khGE=;
 b=B2p6PzcPAvH5LHS422uzCL8AuOo7n0n72+qE8Hitt74IysPZV1HEe7DOzbcS8Uz7lOdwaN1i4hiBXaOIC/KDTQPEyOU/X4oZw63OW/7dmMS7J4TJjU6PekkH9CabssfyRB7tYq8CEJoVF51v7ExSSZ34+7bQl/bEEWQdmfX+XTRPAAh2uGzdp7CnX389dnNEgjT62iTQ2xVM1kTM60leVZw0nyWHzRdFRGk5p9EMM67Jt2DjukszHH5GlRG5laxsrpLBtcWi77ix9Hy4NR/jiqKmUai9K2SHZZzdBeyqINGdlNfLpjB9J8/vzwrAaG0NxTL82wdqB2QtIRdqNm+u0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7GWTN0t5MnEuaeC7NZXQRWtMxnmb8w4Fun8c//khGE=;
 b=UCrdUgD8TzYtLlciVdm+gAD+DfGlRGGHLBa2pu7/H50KbNro8OK9PjdncSv8FAFbk+eFyAgT5vyBlOsbyQJUJmBlwgR0eq69UP3E0B2R6T+wmcFnIsFmX39It26q2FZ5+gEV96CgUPIFiV4CUM42bRii2Xl41wPJqKCpFLKoVys=
Received: from SA9PR13CA0161.namprd13.prod.outlook.com (2603:10b6:806:28::16)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 09:39:42 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:28:cafe::18) by SA9PR13CA0161.outlook.office365.com
 (2603:10b6:806:28::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Thu,
 26 Feb 2026 09:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:39:41 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Feb 2026 03:39:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: [PATCH v2 5/6] drm/amdgpu: store ib info for devcoredump
Date: Thu, 26 Feb 2026 10:37:23 +0100
Message-ID: <20260226093727.2584-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: f11cb368-c2c8-4abc-c370-08de751af767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: YRanT51pnBSD0FjtzT9aDVQYhH5Rz3WsW8a1C/1v3+uCUyB0YZ8nwoVs7pDYDeKg7Kj7Jbbr8jkLdEV991gFpGUWDkqoXFNZuJ6r8Nua51QuNtF9JoJSjL3mIxrg/6cdw9nwE/5HiZ0ShXoZkYMamvC+XMRB4P1abhggsaQUDQUXh7NFs9RhtuqWFSnLNTOmbbwn//zeRT6Tounxz6P1a9rR3d5dtkzf9uBYUjAcNqJ/z19ZnklAIh7DGgVnqOi0UkRXvcbJlsEAnBTE1eESs4tIrXNG5Q3F2CYEF7iKt1QhkZ5do3yDNmshnobHJihQIvOmxVOsAxC8EgyQM+l3hglxiSdlktT5D2olFvxPOSAm16kaWk81IO15jY2+cxMA2d3qA/V35QhwePe3Cw7EVX3vBdM0etn0Hjil6UgGoBhQLtEyxen4lKOQKFkXGlkiuFwwp2S1UG6VPGtIrGt1CRVUK8B1Ej5dFczBEsBRULyr0rSxRItPCGxdu7Hk9v2rEkCN3Q386J/NZuciqUv5HJ6vkRD2TsaHCxlCPvvDgI/lP79JUrrHUZTr7sL1AtLe1ueMDWyka0IF80WYYT+F5h01w60wTtWIvqokqnb9N04KP339rNoqInATwxeF9vaYahStKnH6S5AQw/gEW1fUUvUk9oGqyZ3sfncf2AS0IJ+qJ+KZ/ayfeYzqjUxi3yq7lwXfM3/ToysiX+Em8HnrWgClAN+/9sKHwkFinLCUK/EQ48HNOqpcOiv+h97Mf3B7fdgW78A59eAqaemUevCr75rfSIgxZd1LDVOOormvpxdT5hT6OdKe39dtLxFbh1PeK4DvxDLaxqpnRuU7utRKzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3RIot1hjja3cQupIHCSwAgYX3u35iFa+chf/GCV0yNAUvvZdOrOHP2Id2bMWOndBVC9WpUhUpZ42JbmT5f9ou7Q18uCRqydntp2NnSciPxb/q1od3uex2yZKeijjnLwdeoEyhORqm16jFw6ne1bQhW4fFoBdYUx6XICH3Tfd3aGbHdlUN3Vo8mxeuHq1xFimJcsTts2BeGS0Wws3u/XQb325Pr1JYpNl1plTdQs1evwXYrVyDVlo0M4zMpSWWvrexGXoqsZ/zkfWWlai9/MQ0LQSHRYrBr3BdR/J5I4AFzY/dpux1c550G7PjX4VcHzBterBgod7ZWQRxsfpr7BJ+jydAdWdVHMtnV79KvwDnV8F40zvW+ELFuLNZcR489G2vnCAK081aUgL1MkCNV+IVxqFVJbfD5fAzHq6dOWxfsGRpr6yk0QNKi4S8ed/0tKG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:39:41.2952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f11cb368-c2c8-4abc-c370-08de751af767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 8B28E1A3988
X-Rspamd-Action: no action

Store the basic state of IBs so we can read it back in the
amdgpu_devcoredump_format function.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 13 ++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h |  9 +++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0bf85ab43204..d0af8a294abf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -387,6 +387,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 {
 	struct drm_device *dev = adev_to_drm(adev);
 	struct amdgpu_coredump_info *coredump;
+	size_t size = sizeof(*coredump);
 	struct drm_sched_job *s_job;
 	u64 total_ring_size, ring_count;
 	struct amdgpu_ring *ring;
@@ -395,10 +396,10 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	if (adev->coredump_in_progress)
 		return;
 
-	if (adev->coredump_in_progress)
-		return;
+	if (job && job->pasid)
+		size += sizeof(struct amdgpu_coredump_ib_info) * job->num_ibs;
 
-	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
+	coredump = kzalloc(size, GFP_NOWAIT);
 	if (!coredump)
 		return;
 
@@ -406,6 +407,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 
 	coredump->skip_vram_check = skip_vram_check;
 	coredump->reset_vram_lost = vram_lost;
+	coredump->pasid = job->pasid;
 
 	if (job && job->pasid) {
 		struct amdgpu_task_info *ti;
@@ -415,6 +417,11 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 			coredump->reset_task_info = *ti;
 			amdgpu_vm_put_task_info(ti);
 		}
+		coredump->num_ibs = job->num_ibs;
+		for (i = 0; i < job->num_ibs; ++i) {
+			coredump->ibs[i].gpu_addr = job->ibs[i].gpu_addr;
+			coredump->ibs[i].ib_size_dw = job->ibs[i].length_dw;
+		}
 	}
 
 	if (job) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index 1c3d22356cc7..49486d1f6a5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -38,6 +38,11 @@ struct amdgpu_coredump_ring {
 	u32				offset;
 };
 
+struct amdgpu_coredump_ib_info {
+	uint64_t			gpu_addr;
+	u32				ib_size_dw;
+};
+
 struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
@@ -58,6 +63,10 @@ struct amdgpu_coredump_info {
 	 */
 	ssize_t				formatted_size;
 	char				*formatted;
+
+	unsigned int			pasid;
+	int				num_ibs;
+	struct amdgpu_coredump_ib_info	ibs[] __counted_by(num_ibs);
 };
 #endif
 
-- 
2.43.0

