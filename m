Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBM9HZd6iWlm9wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283CD10BF85
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6B410E321;
	Mon,  9 Feb 2026 06:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h2D6Sy61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C9110E31D;
 Mon,  9 Feb 2026 06:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyXKn4+UP659DIZkKsl+zdjunHqIroUKHoIRSTLs3khTqYclqo65xJOim4xpW/cVbrWQX9JApDvciLlz1cndk9qKjgui4G9LQi29yareR69i9HzsKmf+KqzhIInphrSwit5egvnjO8LjcbS5kAOV5RKXqDR0HeasQbULhH0IjLe7nmRlXCPPa7vSMFabCI4VixYf5KlLI1vUMNKRWZlF9FlAK3XhIGhaToFtYahZWY9E/d6w5AQGZWAqXUlKv1/3nSIFkpt/Q3jZWmVLshdDABv/umIlxFS5XiOPnzA1fXn6YTIbjDXoVZUnvDizr+ut08QbmqhcJ/4Cco2pYV6q5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNkXPePT/Vj8OyJiqkm+2BBC099VF0XjU2xt3SArCbA=;
 b=kXZcyWsyTeptFxlbyvSnutE/CCHYX+GKsGFQe9eR3ttczn6udnlTxyNDZe48BdOcdFxbUXR2iX7RX/G/86vBjbyDX62x887QZlcFukoX+fBs5MdtF/sCoW8NhYcj51TOdbylfR0u845+o+w4MJuvISOB2YfaLIdFjQlPJsiTXdDRsHjvuoYRgJ/hKWONNAh8qKnT3DTlywz9oAggyMSKVCsMqZ/bxosNHzM/9lp4hOyO83B+Q6TzAUI6Ip6E64Hs6bIO+GHFo6BtkvQ1fPyV6zFtO0mIu9b/J1tNZBEnma2vAW1LTw1dnG4I2KPwjIYHdiTd28GNSOHf9U3zDIXVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNkXPePT/Vj8OyJiqkm+2BBC099VF0XjU2xt3SArCbA=;
 b=h2D6Sy61n21e4/AcP4SjvLaDserl8ufNP/Fy28XRG1aTk9vduSxbDYxh3UsNtqSpzzy75LBfS59fek83jzpwMSCg9dwcyS5QFouMAPrIl1Y3mKXkXvEuKuzLb4dR9iQGPFIlIvDK/e/DWkLe+UkOJSSxw6oxUdrUWRE+VhrbykI=
Received: from PH8PR02CA0027.namprd02.prod.outlook.com (2603:10b6:510:2da::18)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 06:11:27 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::26) by PH8PR02CA0027.outlook.office365.com
 (2603:10b6:510:2da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 06:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 06:11:27 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 00:11:23 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Philip.Yang@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v4 7/8] drm/amdkfd: Unify userptr cleanup and update paths
Date: Mon, 9 Feb 2026 14:10:46 +0800
Message-ID: <20260209061047.3881808-8-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209061047.3881808-1-honglei1.huang@amd.com>
References: <20260209061047.3881808-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: f0860438-ad66-422a-7487-08de67a20f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FQW6nW8QGcf/DiSGusNz5qB1RMspC4ouQ9CQqjPafB+ltc8sT5FTC3JDtbFg?=
 =?us-ascii?Q?EJhI0X5A9DCwYyn5UUeZov2nWwdwdzwagmtyyPCmwVtHhAR/C0JCEptY0TRm?=
 =?us-ascii?Q?1ygtgtHXwQOp1FqAyefNpOrVz0OXMSfQ9gEr2K293OpIpUnsBkGPRPo+AI8Z?=
 =?us-ascii?Q?AvFZ563+bR6YQNzbpd7iFFprSZzTaf2reVapb07aMTmPwS1pJpPN9WyNjIEn?=
 =?us-ascii?Q?cH1XQH9YMH4vLtmykXMDBpFWxz4dAI/pEJDqmyZh8fhD6dlSflmpdeNXMTAi?=
 =?us-ascii?Q?Exp7nldIG4PcR1fMnHFepg1YcOaF+Q0nVgvaUolvdj5Ts8CL9/V0bkLhmdMu?=
 =?us-ascii?Q?bhsqE2Puyl/Kci60H06MIfrHn+aJ2wupfxz7RPAfyNHNYzJrYl7rt23892bi?=
 =?us-ascii?Q?SkUfzCY0KUDa6Ik1mkWU00I/VSU8Qzg0cW8lseFy0kDaR9HHWr8f/m1UR1kA?=
 =?us-ascii?Q?lkKdAIZt6ofOJnRitLC5X/JQkvTt39oKLd99DlLjO+oLm5zDVyeHUDUbHyTY?=
 =?us-ascii?Q?RljnWla2cS9VKI1tYjaMVlVsGTJN2JwpbV9MD01pqrOPFu5TX25xHgRgWoCe?=
 =?us-ascii?Q?Frws883J990xeyympUdJFubxl0iWNaLa1Ag5Rm34lusH2bordEBQiihKFe24?=
 =?us-ascii?Q?KmxpFsu06bv/CASUaIvbjRQ6S5/5YK+Pls/PlHZgJ6YgnUzSLRxgiXiU362j?=
 =?us-ascii?Q?h0tJbzO0JhXaIaQopPvECunAokB/arZYYlJG3Dnntay53hEDdUguzKCHfRCM?=
 =?us-ascii?Q?2Kcu6gwFqqQHSqq4MuUbHPuVlr2ZzfiXeg90QOo1DaorOJtHOx7gpcFVzNC9?=
 =?us-ascii?Q?UvPYwCDjPMM5k2mVvjl5Dp0J3x9id/12koA5kz3FnO5rkEI7HtRQHKXWvcJu?=
 =?us-ascii?Q?+u7QAgjc9X8B/odrYrt+LYpva3gP2rVnLNsANmgC+/+TO70CD0LTw5hiKS5V?=
 =?us-ascii?Q?20QA8gSU9k60qLUhySQ+2mXeVtgL05lXV1OIJ6cW97xZS9QfHlJ7naCmcjrq?=
 =?us-ascii?Q?jbmfaMg9YSx7LleOTpU3HtO/qtEQNJFU/OWx271kDqxFAjHjYXfZqB3ktpi7?=
 =?us-ascii?Q?UIAHAgcxj/gB5/2ngH6VRZK3rxrGogVM2I4fn6NgZl++SLJpRTNmJZU3vQQn?=
 =?us-ascii?Q?T9pNsEndQqfdO3XKL0dDLFVwYEpPqx5rzZR5yNWzap20wPMd/Bc7yLiKfcXT?=
 =?us-ascii?Q?pLiytIYhs+i2jSQsRu9r4g4udbhCQyHxquDJq/gsP1hsx+lVtciCrCiUbk6k?=
 =?us-ascii?Q?ja9rXQlOSM8+NEcWnM5B/FfxoNp3lRJNNMKSQSFVbUU9IHG2SUQxf7xnW3im?=
 =?us-ascii?Q?BZedgfr9W/ani7X2P6havFYYU6ZuCXCuuo2is17Jf/xaesyLbqFbVRIseyGT?=
 =?us-ascii?Q?+y1+8uLQ78LXJqdtEytDWAPidCELbgzzn1O4T7XqrMY9E8e/O93ANPXiqD/6?=
 =?us-ascii?Q?sI3s1cRO6zKHUcJagFi2n/VGHcJKlULRtd/gpPvnHtQLPZlS63rgtFj4FSyI?=
 =?us-ascii?Q?P9CH9wDWWG8rTTn7w7Y9uT/U3wqeBbF84njuyOK+P3PKroypAD0X6AUXiYij?=
 =?us-ascii?Q?fb2ODJiem5HBX3lyce2JnFSX/K6+Hxc2EXmDq3Yo3xVAqBMX44EegYIi8WvA?=
 =?us-ascii?Q?DuYXAMRmg6GTNyhtJrOHPWcWJev/h4Q1KZizCDPSYFYVVJFGJ0LMVKn44Ymo?=
 =?us-ascii?Q?Ivmaow=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PTt/gnT0yshQuaRzv5cZu0NSfvDVaqxUvRNVWkNzRdU8sOdmIejkChJ4IlWdhlK2UOIu4FBU5lrgmfYh9rC05LQIlwfJSOz5qEvKqXD2p0t+qe2A1Yq2LmHHW9yjD6WweS3PteVkV7fV94yO1wLPQ5lk7u/eC6NyC7Hk4D/+7AVwvxFGBp2RCHD04Xn6K6NLNqxry6hKCrvVsJu4u/3rLevzCv6qayG4pvUrHmEvp3viTYG6hksbBE+ndq7wSXYO9WD90T4Mf7Rp2hPChe7ly1/8vrfShRn2wgMrWxoSlR48EjAaIHCErq0+rekEfsWXjUXW0jw2GvcBihW2M5sF1EhOz1ry67DUNB508fZ6uOzzd9yIPFte0TR7M6iBEua9nAQlGOKSETzfisJ299gfcEmr4yzfEWGf0g7yEAaA3DtbOcaoSRlTww0zmS8dp+ii
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 06:11:27.3529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0860438-ad66-422a-7487-08de67a20f66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org,amd.com];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 283CD10BF85
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Refactor userptr management code to handle both single and batch
allocations uniformly.

This adds:
- cleanup_userptr_resources(): unified cleanup for single/batch
- discard_user_pages_batch(): discard pages for batch ranges
- amdgpu_amdkfd_update_user_pages_batch(): update pages for batch
- valid_user_pages_batch(): validate batch pages

Modified functions to support batch mode:
- update_invalid_user_pages(): uses batch update when applicable
- confirm_valid_user_pages_locked(): checks batch validity
- amdgpu_amdkfd_gpuvm_free_memory_of_gpu(): uses unified cleanup

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 158 ++++++++++++++++--
 1 file changed, 141 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index c2fc31964..7233b127b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2281,6 +2281,35 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(
 	return ret;
 }
 
+static void cleanup_userptr_resources(struct kgd_mem *mem,
+				      struct amdkfd_process_info *process_info)
+{
+	uint32_t i;
+
+	if (!amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm))
+		return;
+
+	if (mem->num_user_ranges > 0 && mem->user_ranges) {
+		for (i = 0; i < mem->num_user_ranges; i++)
+			interval_tree_remove(&mem->user_ranges[i].it_node,
+					     &mem->user_ranges_itree);
+
+		if (mem->batch_notifier.mm) {
+			mmu_interval_notifier_remove(&mem->batch_notifier);
+			mem->batch_notifier.mm = NULL;
+		}
+
+		kvfree(mem->user_ranges);
+		mem->user_ranges = NULL;
+		mem->num_user_ranges = 0;
+	} else {
+		amdgpu_hmm_unregister(mem->bo);
+		mutex_lock(&process_info->notifier_lock);
+		amdgpu_ttm_tt_discard_user_pages(mem->bo->tbo.ttm, mem->range);
+		mutex_unlock(&process_info->notifier_lock);
+	}
+}
+
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size)
@@ -2322,12 +2351,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	mutex_unlock(&process_info->lock);
 
 	/* Cleanup user pages and MMU notifiers */
-	if (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm)) {
-		amdgpu_hmm_unregister(mem->bo);
-		mutex_lock(&process_info->notifier_lock);
-		amdgpu_ttm_tt_discard_user_pages(mem->bo->tbo.ttm, mem->range);
-		mutex_unlock(&process_info->notifier_lock);
-	}
+	cleanup_userptr_resources(mem, process_info);
 
 	ret = reserve_bo_and_cond_vms(mem, NULL, BO_VM_ALL, &ctx);
 	if (unlikely(ret))
@@ -2914,6 +2938,51 @@ int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
 	return r;
 }
 
+static void discard_user_pages_batch(struct amdgpu_bo *bo, struct kgd_mem *mem)
+{
+	uint32_t i;
+
+	for (i = 0; i < mem->num_user_ranges; i++) {
+		if (!mem->user_ranges[i].valid && mem->user_ranges[i].range) {
+			amdgpu_ttm_tt_discard_user_pages(bo->tbo.ttm,
+							 mem->user_ranges[i].range);
+			mem->user_ranges[i].range = NULL;
+		}
+	}
+}
+
+static int amdgpu_amdkfd_update_user_pages_batch(struct mm_struct *mm,
+						 struct amdgpu_bo *bo,
+						 struct kgd_mem *mem)
+{
+	uint32_t i;
+	int ret = 0;
+
+	if (!mmget_not_zero(mm))
+		return -ESRCH;
+
+	mmap_read_lock(mm);
+	for (i = 0; i < mem->num_user_ranges; i++) {
+		if (mem->user_ranges[i].valid)
+			continue;
+
+		ret = get_user_pages_batch_locked(
+			mm, mem, &mem->user_ranges[i],
+			&mem->user_ranges[i].range, amdgpu_ttm_tt_is_readonly(bo->tbo.ttm));
+		if (ret) {
+			pr_debug("Failed %d to get user pages for range %u\n",
+				 ret, i);
+			break;
+		}
+
+		mem->user_ranges[i].valid = true;
+	}
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return ret;
+}
+
 /* Update invalid userptr BOs
  *
  * Moves invalidated (evicted) userptr BOs from userptr_valid_list to
@@ -2928,6 +2997,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 	struct ttm_operation_ctx ctx = { false, false };
 	uint32_t invalid;
 	int ret = 0;
+	uint32_t i;
 
 	mutex_lock(&process_info->notifier_lock);
 
@@ -2951,8 +3021,12 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 
 		bo = mem->bo;
 
-		amdgpu_ttm_tt_discard_user_pages(bo->tbo.ttm, mem->range);
-		mem->range = NULL;
+		if (mem->num_user_ranges > 0 && mem->user_ranges)
+			discard_user_pages_batch(bo, mem);
+		else {
+			amdgpu_ttm_tt_discard_user_pages(bo->tbo.ttm, mem->range);
+			mem->range = NULL;
+		}
 
 		/* BO reservations and getting user pages (hmm_range_fault)
 		 * must happen outside the notifier lock
@@ -2976,7 +3050,11 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 		}
 
 		/* Get updated user pages */
-		ret = amdgpu_ttm_tt_get_user_pages(bo, &mem->range);
+		if (mem->num_user_ranges > 0 && mem->user_ranges)
+			ret = amdgpu_amdkfd_update_user_pages_batch(mm, bo, mem);
+		else
+			ret = amdgpu_ttm_tt_get_user_pages(bo, &mem->range);
+
 		if (ret) {
 			pr_debug("Failed %d to get user pages\n", ret);
 
@@ -3010,7 +3088,10 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 			ret = 0;
 		}
 
-		amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm, mem->range);
+		if (mem->num_user_ranges == 0)
+			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm, mem->range);
+		else
+			set_user_pages_batch(bo->tbo.ttm, mem->user_ranges, mem->num_user_ranges);
 
 		mutex_lock(&process_info->notifier_lock);
 
@@ -3024,6 +3105,17 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 		 /* set mem valid if mem has hmm range associated */
 		if (mem->range)
 			mem->invalid = 0;
+
+		/* For batch mode, clear global invalid counter and mark ranges as valid.
+		 * Individual range validity is tracked by valid flag.
+		 */
+		if (mem->num_user_ranges > 0 && mem->user_ranges) {
+			mem->invalid = 0;
+			for (i = 0; i < mem->num_user_ranges; i++) {
+				if (mem->user_ranges[i].range)
+					mem->user_ranges[i].valid = true;
+			}
+		}
 	}
 
 unlock_out:
@@ -3131,6 +3223,33 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	return ret;
 }
 
+static bool valid_user_pages_batch(struct kgd_mem *mem)
+{
+	uint32_t i;
+	bool all_valid = true;
+
+	if (!mem->user_ranges || mem->num_user_ranges == 0)
+		return true;
+
+	for (i = 0; i < mem->num_user_ranges; i++) {
+		if (!mem->user_ranges[i].valid) {
+			all_valid = false;
+			continue;
+		}
+
+		if (!mem->user_ranges[i].range)
+			continue;
+
+		if (!amdgpu_ttm_tt_get_user_pages_done(
+			mem->bo->tbo.ttm, mem->user_ranges[i].range))
+			all_valid = false;
+
+		mem->user_ranges[i].range = NULL;
+	}
+
+	return all_valid;
+}
+
 /* Confirm that all user pages are valid while holding the notifier lock
  *
  * Moves valid BOs from the userptr_inval_list back to userptr_val_list.
@@ -3145,15 +3264,20 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 				 validate_list) {
 		bool valid;
 
-		/* keep mem without hmm range at userptr_inval_list */
-		if (!mem->range)
-			continue;
+		if (mem->num_user_ranges > 0 && mem->user_ranges)
+			valid = valid_user_pages_batch(mem);
+		else {
+			/* keep mem without hmm range at userptr_inval_list */
+			if (!mem->range)
+				continue;
 
-		/* Only check mem with hmm range associated */
-		valid = amdgpu_ttm_tt_get_user_pages_done(
-					mem->bo->tbo.ttm, mem->range);
+			/* Only check mem with hmm range associated */
+			valid = amdgpu_ttm_tt_get_user_pages_done(
+						mem->bo->tbo.ttm, mem->range);
+
+			mem->range = NULL;
+		}
 
-		mem->range = NULL;
 		if (!valid) {
 			WARN(!mem->invalid, "Invalid BO not marked invalid");
 			ret = -EAGAIN;
-- 
2.34.1

