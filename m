Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAthIQxajGm9lQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25023123585
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F32810E38C;
	Wed, 11 Feb 2026 10:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fJLm/0nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D7310E38A;
 Wed, 11 Feb 2026 10:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4PGJb1REnaK7PxOj7Oq2aifjVzrJ2ZY1AB831oJqQNiOkrDxHtLfNTaYeusPGJxYHC/ws2amHugqb32Zh92NCOdg7A2sfLGd/jms2uqds0cNPqWxoQUxeH0TreM9Qqkf+NWxtWkDC5qOG4gIWV5B52ikOlVCj4S5SkscCT44ktbeDuVGuwa9A9JCEjgI/5JBOzXXJUssAMrGfdOC+O98sl2BPADW/UK5U7q3MkqdHLmgnNn8/gpwsd5j7SXdOB8u3bpPBUp12KYJojJAnzn4axoxITeh21ui3+yN0B0cEtfKFn0qxsQvaUl0n4zhNiGtiP2BZPuoKKh3J55OmD5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYhnRcyxAEdAzn9EwUDFQaBV2exyM+a2Odl2/MsXxww=;
 b=UcOiSUWT10UN1l+2Om63sZSaKFSA3v9ATAwWoplca+ajGTCXB/Du7Q3E+3Cnyqfa1nUuPdjCTt2+nHzTS1OHCUshbmEbXIUf7dAtXvgJ/XVGP2hIe6Dq8/V8dhDp0eKskqnhBSeOQWqieaSwEwhca6Naz63pSqy8IrPm7GvFQiGr4g9jCzTVSE4/tLNcEVm95Dq7mciKxH2kgxxNUwzPe4Do13uCKKZQ50rA7EoxufJu0v6Qdw2fjuQpyioPemkMu9zuVH9IdFSO0TC5Z25J0BlmN2xppZNY4X1iVr7H+WUgC+vwC+AM+OVB4TT7xzX32VZZH2XsZmD1gO1u9A2mBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYhnRcyxAEdAzn9EwUDFQaBV2exyM+a2Odl2/MsXxww=;
 b=fJLm/0nfNygf2rfQ1DothwTtnyySQ7oAVUSTbK0PH9deZsi5XqqacsMCk7xZf43W66HDmVBSMdIlfSPM7Rbz/VqRy31d+5rqgw1P75+zzbzD19ZyuiTSGLZZRYyFBjPx/Pbnyg7p/4M4ypVz5DwtRXJ2BhdiT44pktx2yaW19/A=
Received: from SA1P222CA0183.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::7)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:29:25 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::9a) by SA1P222CA0183.outlook.office365.com
 (2603:10b6:806:3c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 10:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 10:29:24 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 11 Feb 2026 04:29:22 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: [PATCH v1 5/6] drm/amdgpu: store ib info for devcoredump
Date: Wed, 11 Feb 2026 11:26:52 +0100
Message-ID: <20260211102657.4180-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b9f0ef-7f4b-495a-3204-08de69586d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7tRZgruFkJ7GblOwsbOFQQQCniWMEofAxSfEDJmN2DFlK6o1lBKUwIMniwPa?=
 =?us-ascii?Q?hAnmU31qzokwmBGo/9ZRPFg1X+Mrq7hqK/7LXfXp1Fs182LIRJs8t6juzRXF?=
 =?us-ascii?Q?IDWukZMWl3yZarqnfeudSLKogUYY7U1l87cRuYl0iCMeEuGEGDCIbPiohnv6?=
 =?us-ascii?Q?6Si9TNxoM+0aZ3IixUwDk+yQDIYMnFyGlx+VrEP1Cpc7KwtLQswT6JgTKmDE?=
 =?us-ascii?Q?LYdt9H5ZWogoyH4ufQaq3VLW2K6SUJlTo7VN3kpYvxknAlSqevMRCEVmiHzH?=
 =?us-ascii?Q?rPRAmiK3a0VlOqY/gwdNQIMXMcIyc70hiuOjmcoUTl+HDOhV+0bOMHHCqIVM?=
 =?us-ascii?Q?g6zbZvHj3HkGQO8ix3HijmnlIIEl9rtdlfdHSv9Ae8gmBWFmn/rOms0Oeq/7?=
 =?us-ascii?Q?jRr+YE7L0Xb9lwFgm9dzQem8CiUNjRs+E5DBKpzcuDrSpJphUjTpM2GePb+r?=
 =?us-ascii?Q?RgJD/H8rFp2pOMVhrveFACS+XdhtbLnlvr0RgNu/zqUNY/rTmcga45ysvNFD?=
 =?us-ascii?Q?IVWjrHyjXWq5B/edryrlvrcYBOyKcAbgZLihybNQMHyT+3T/v+VGG0ZDDZI0?=
 =?us-ascii?Q?DAnQ5qKWGNtc05m7i9UMyZ+N1WpZrBahkG4PPEDGDBBfyMFxXcEr9Dus5f1e?=
 =?us-ascii?Q?owJz/Bsf+YbV6gKKjCgf3rMGc0qDnvgZdonSRM6vRFz384RsgsJ/1xj3zViM?=
 =?us-ascii?Q?dVM0Zgu18N/fbYmejhrvm97n6hQ+oMTLwEu5o4twESGCHOyhwNWcht6QwQV9?=
 =?us-ascii?Q?mJ8Fx2f0DHwMA9AqrNJ+lNymChX+GXgJixUXB1/QEyEWoPsyr82xHJOPZJ7L?=
 =?us-ascii?Q?i5rc1m/O9TSG+/BvlBIN6XXmpFsCaJef6wgsMkZ+P92u3nb115yMKJyzkNQI?=
 =?us-ascii?Q?4afDj4hfkR6C8eAkrUqJT78T14TT2NEmjjN2MBB/GnDTuTwl/QEyJfy81Pp3?=
 =?us-ascii?Q?snL7ytD4J6OaZvBxST+N0/ouW/qyfxxu5VTGF+uwdooF6vfOZK7WbGOUKJX+?=
 =?us-ascii?Q?ArIXp8ugCQKGk3eMY83mqDRkgzMWLnOLQCnjwMygrV6gREni/jMF6zqYFlqt?=
 =?us-ascii?Q?+lt63EgBldYZfXwr4Bf02DsBNEYl6b1lNvQSnUOh18spmBirrgKRctFG5rt2?=
 =?us-ascii?Q?Up3yj6/gAImEEbeSMa7+9bzgs/zhFJWRp1GUEhsaeWmZT0Ss2lfaiCcBRKhq?=
 =?us-ascii?Q?Q8j/nTcUB7zCGDkEEVsBzOIAFySkspq/udZms+L1SlWd0P9hr2qTsOepA+59?=
 =?us-ascii?Q?XDXPaNBd5zNQV2jIOyvfCDPXdfDh/pByceVs/VpZZwsiw1ShAfeZ2qpDDGC3?=
 =?us-ascii?Q?iYRD/Iza2+McrraoFD+160Lm7iLv8hD5uV+1v3YIb/csAJTHmoS4a2pbWstp?=
 =?us-ascii?Q?ATw/01XHkelzYxytNhvs3dwPPwM80PPOr3o5H0nRydSIjXeD1mi2Z3W4ue6R?=
 =?us-ascii?Q?dS/exIbS6Pnn2o33jSwSVOVXLl2Hf1sSoiZyVwLx40ptEfbqL11J6gBLyWlW?=
 =?us-ascii?Q?Gf1g445KOE2EhkEi1h8nAx9fZC64ep7V+hUI8gspcHozJG1Ry2aGqbsIpr9A?=
 =?us-ascii?Q?HGgaTShtHJveMfdl6nLoRHGGagILACyUM0FN9Auk6iLCQ584C3ZJNbnLV29b?=
 =?us-ascii?Q?Csm0fQYZlxhAnnhl2yqCtJoKa6LMEWggYLBtnpM+fybWFowQPp/gISp7WYhN?=
 =?us-ascii?Q?QsF4AQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JQCXL01nvbIYDOHv14T9hZQD558MglS7bLr2FRFgVCupwfK7+RfSzpsQQIRN8HzO2qvTYR1yZIzqdOwjh0/QhqqIfPxFujtBn/Hsdaz9isfCR5RxKmfLJkBkdvPVlgcZlmd/PRcKwu7+mdchEXrcHDkgfmCV07KesutyJv61EQjpr38uVAfbywGTfioKq6iAqKoCkB+fr0+mt7/2fNRanycfhx2pQHCNOJpm3uTjYCucJG4oEBAg5aLp1Rywj+XDRkve+KPJThmeUXyLtJxdfgMV7/PdqmU7OfYsLo2qWv21ap6CoY3atb1FEBq87lSdGBlZRVGKCX68jQ9Q4dXdXAsLx3uc+pDyD3MM9RU/m4iKecJsX4FHu6ukaSG0zxYnLkJ15qpXysbYPUwco9W1MGwVY/PAvWTVxJacI3/ETd8OJNfwBBn1216iqacaK/t9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:29:24.7819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b9f0ef-7f4b-495a-3204-08de69586d82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25023123585
X-Rspamd-Action: no action

Store the basic state of IBs so we can read it back in the
amdgpu_devcoredump_format function.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
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

