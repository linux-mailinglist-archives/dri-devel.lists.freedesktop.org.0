Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNwAB6mJhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0301FAA61
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0431910E379;
	Fri,  6 Feb 2026 06:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Maod+zg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E094610E379;
 Fri,  6 Feb 2026 06:26:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWTpAaoPuUVTtAzoWNonFPBre5Jv21yzVRH0ska2WicBE8bI3s4KU59Yx4FRvBqbObynKbtHKlnMTDZ9DUQaFU7Xun8mKPaYGo9efIOdq+FnUbUGeChsoVs50y7jF84e0YBNludfEenMoYAhT1HBO5GDSE7RAUvWoQAdm+gi3zl7RWsKOaMIsCCk8xI/2RCDowb0mfYn5nNjE9Y2FJ/pG2RE6vazj1tLY9QEGPdzKUFnA4E7yASabfrTSvaBKhMYwL5yXyiGWtiX5oInd1g2LumfKD3SZm1qD2/zUFSSfNU+D2adVO585NDQZZtncuc7YYeP5xBR7oDQ4I5wv+tfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmg9i++VzxJmdqMmTmXcHQuMr+JO6cpSqx+3c2AtMRs=;
 b=G+39/YrAHeHuWcxb4U8IrmvEaiWBv95zOxcEsQI35NwqmH02UVmKwA+GxLdJ18/uh4vY6/cSxj2xxLl8EzsgRk0feZoKLtBT+4KEIY/v+/6jsMRJ8WAg4yMjYXp0+/H6a5lGN67Vhbj4uSOXEL76OynNt6QJdmyEeoUCGMNL4b9HIGDM5S3HxgevpzsPBJ17jwVop/C+vNhZWYxgVaeh3Y8Mjq1GlfmxpPLFjl0XpWNZ3/tURRk89+RYmQuHcw5VhfoKXdasc4/+0YOGL4vthCk72rwMgOiwPTZIkYcQ5PU+/8gU0Rv80Ew4oiQNKZ/wUrnKeLPhxqF1dXzGW1L4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmg9i++VzxJmdqMmTmXcHQuMr+JO6cpSqx+3c2AtMRs=;
 b=Maod+zg/6ka0gwuvC4Au7dUGoZZDEBHybOD4Kf+fkBphLo9D5utaPBH1wzKyiCkN1idkf1k+WfrY9kHUnrE/37qDhzHO85TsGX/isxbo4hcYFSbILNRrBBSrXVA2szU5yUrjSxTJUSK0mYRPGTh75IVyFEdJ2NJIjZpAIoZxiGU=
Received: from BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::15)
 by BL1PR12MB5971.namprd12.prod.outlook.com (2603:10b6:208:39a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 6 Feb
 2026 06:26:40 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::22) by BL1P223CA0010.outlook.office365.com
 (2603:10b6:208:2c4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 06:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:40 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:37 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 6/8] drm/amdkfd: Add batch allocation function and export
 API
Date: Fri, 6 Feb 2026 14:25:55 +0800
Message-ID: <20260206062557.3718801-7-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206062557.3718801-1-honglei1.huang@amd.com>
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|BL1PR12MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: e5187281-d8b4-40f6-940c-08de6548b0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EAfvIfaxbhelI+h8Ox4GYGR2EJeKZ/lRbbXeo6K0tGYWc8T46dFBdm/jjFVY?=
 =?us-ascii?Q?watN1f4ZNyDkpQJSZbd1e2CAaz5C+dLuV2XmUC2e0E5RewCuQ4tMyRqlOjFT?=
 =?us-ascii?Q?PURUGVKF1bbuauH3bIz7KFdy60ssEAF+c9FlaTJdvZMlVYw/omQNR3taztf3?=
 =?us-ascii?Q?RHtRoXVza25nMS2C3DpSumwoDZrqmxvUItsuLr8a7NCXfbFPX5fS/fTxDD3J?=
 =?us-ascii?Q?Ol7DOksfrWmf7N09HoXub00met8zQC9Yb7/YZGb3+pnTLJNWFHG7T6AYhRuh?=
 =?us-ascii?Q?H1BsAGVxN5vUef2gkyIKPRhhlYo40ul8h5yfRFN25Eje7BL83PrZ+IO/Jr9Z?=
 =?us-ascii?Q?ZIi87yB92mFhn9HTfsSzA/7gCKNX+s6jrK3CfivZ966F79SQZrHkso+g9hKi?=
 =?us-ascii?Q?b2nNLQb71aF88WX8zYcsZT/3ocvf7/aiEcP2hXHDPFAsFKSydaEBop4mEWsw?=
 =?us-ascii?Q?VHmKCCJ4yEo7Eu52zo14CefvcW51QgBfOU2iV4qP1NMnLfdcpuzT54f6ybaQ?=
 =?us-ascii?Q?R2Uq4b+Okiv3tSsIiqRTnuiA5mgXw195SZJfThcjZTxp+9YjkG3+RVFfoJ1I?=
 =?us-ascii?Q?7js4CjDg4vGOqGJDV7BfvHZqHw98Uwe3DXBIAC1m8fB/wp7bxfC/CtQfly/E?=
 =?us-ascii?Q?IgqBGZletCgT5GrEGsPVut1Mu6A/39OdM/fqfY3m91uJ5U4pJi4Ozhy6Ifr4?=
 =?us-ascii?Q?ESL90jKZPN3SOxTY5uyktZI/OrM7eR6jSRbgJ6FzKXTq8k8dVw9FnGYoU0ie?=
 =?us-ascii?Q?FOIz8QEodtmn0UdZG7eRIBSKGXvUB5DrVDdjBO0AbXrmW81IWc3WqTvTYlcL?=
 =?us-ascii?Q?iLaVkOlOOvPTIvas27hyDjuGmezt46NznpaTsch5sI36HHsF/uiWgj9dnQMH?=
 =?us-ascii?Q?sCgb/6VQQ69mQ/3mUEfNpnMxz9WgPtVO4Dosw/NNmrq+0MuGHYrJ1z8EuW15?=
 =?us-ascii?Q?vbMVjaq4O4yvq3y1pRoZMtLiBbu0bfU0EnH1z3FqVZIShYMVA/EJInUznJw+?=
 =?us-ascii?Q?Xy80IG/bs+mq8pWwwSVKN2fV1sDJMS39GxF4RlMkfNooU8ai4mrKuHgrFu2P?=
 =?us-ascii?Q?do+o9TmAgEoAyuGhXpz8Azh5rhuhBJ4WfOoxRyILiQAjQtZspSIeJ0suzuMR?=
 =?us-ascii?Q?xWso7on+j547pbsbNxDYbLRYezFIhsFXxu2e3Us2fxX5jhpNLRbiOn7c+zhD?=
 =?us-ascii?Q?Km23P9J0EuOiwKW9nMXfna4Gl7w9eiHpqEgLdaWsYIV1rJZT6ZC/Kq7UGu8C?=
 =?us-ascii?Q?86eu1Lg+xhFH9He6rKhJih1ltcbytfig8Vp7JwqYsBUiMMNmu7zBmsLcDeDF?=
 =?us-ascii?Q?tXV+XFsktX6a4otpLQPWtBKPHZHQCycL8Ew4pz3u4VmJ9Zq387Y3lEnRnbCd?=
 =?us-ascii?Q?dZyf7lOsuh09FFvn8E3DBQ92qdvF8M3KJF2dolH9smvWMjZO0XWGrJZTRnaB?=
 =?us-ascii?Q?wRb7srN7XdP/g43f13XuPCgXUALVp1uliJTcF/sN6JlI1D9KzM0vzYz/syK2?=
 =?us-ascii?Q?6NCY19h3+i6pVaKVV+axj7tLMRGckqTP/hjJ5IARVzTwiBLU5p3vBnBXqQoA?=
 =?us-ascii?Q?xImW1x9aEk3sNUe69clJThIfLP3G5NUB1757onnf17E4oAY7mL0U4UQwaJ7G?=
 =?us-ascii?Q?MTG134yf6wLEO336Mf1cB9hNTohliPWyd0Hdvc67kvSHErAJNhpo1aM3rtNa?=
 =?us-ascii?Q?HyoX2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y60fKEo7lHTgYEV1CCFlo3mqAMP/obu2wbHgiwJ1A6vNX856/HkURBeZUe0YLrKOFRjrdoT8BufwGmsKhsGBfl+AEBWUN32m/dNzGT+O4R5cNU0lS40f9S74EB7mUeWYvzfgi3BxoIOkGkw9SuL/j64vHoYOT0bjzNxnKddzR8c2QAuMbUL2qU7aaA98Ko5ZOfobWBHaxjqSZ0owZaH2abaMH9X2DPpWpeUYkT+PDT1mZN5FPERdkbvATQjx/pfDuU+GN4xAbj4hi0RzAjFkrLpQW2W6Cop+PhfUPm/tcw+3FlnlY15+TM/eG8IEVGqVqD49yYgG+5RrzzB0FF2G2PtmDigHpijHYfb6h0z3vgo1kbkSBfOTEgy74C8PP2ylXpdFKFAhjydZM+DaO8AJea5Ke6FcnvVaBv6s2qS+dCgpdN34+hrOBpq4IlHuec+z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:40.8965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5187281-d8b4-40f6-940c-08de6548b0ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5971
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
	FREEMAIL_CC(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: C0301FAA61
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Implement the main batch userptr allocation function and export it
through the AMDKFD API.

This adds:
- init_user_pages_batch(): initializes batch allocation by setting
  up interval tree, registering single MMU notifier, and getting
  pages for all ranges
- amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(): main entry point
  for batch userptr allocation
- Function export in amdgpu_amdkfd.h

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 264 ++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7aca1868d..bc075f5f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1254,6 +1254,151 @@ static int set_user_pages_batch(struct ttm_tt *ttm,
 	return 0;
 }
 
+static int init_user_pages_batch(struct kgd_mem *mem,
+				 struct kfd_ioctl_userptr_range *ranges,
+				 uint32_t num_ranges, bool criu_resume,
+				 uint64_t user_addr, uint32_t size)
+{
+	struct amdkfd_process_info *process_info = mem->process_info;
+	struct amdgpu_bo *bo = mem->bo;
+	struct ttm_operation_ctx ctx = { true, false };
+	struct hmm_range *range;
+	uint64_t va_min = ULLONG_MAX, va_max = 0;
+	int ret = 0;
+	uint32_t i;
+
+	if (!num_ranges || !ranges)
+		return -EINVAL;
+
+	mutex_lock(&process_info->lock);
+
+	mem->user_ranges = kvcalloc(num_ranges, sizeof(struct user_range_info), 
+				    GFP_KERNEL);
+
+	if (!mem->user_ranges) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	mem->num_user_ranges = num_ranges;
+
+	mem->user_ranges_itree = RB_ROOT_CACHED;
+
+	ret = amdgpu_ttm_tt_set_userptr(&bo->tbo, user_addr, 0);
+	if (ret) {
+		pr_err("%s: Failed to set userptr: %d\n", __func__, ret);
+		goto out;
+	}
+
+	for (i = 0; i < num_ranges; i++) {
+		uint64_t range_end;
+
+		mem->user_ranges[i].start = ranges[i].start;
+		mem->user_ranges[i].size = ranges[i].size;
+		mem->user_ranges[i].range = NULL;
+
+		range_end = ranges[i].start + ranges[i].size;
+
+		mem->user_ranges[i].it_node.start = ranges[i].start;
+		mem->user_ranges[i].it_node.last = range_end - 1;
+		interval_tree_insert(&mem->user_ranges[i].it_node, &mem->user_ranges_itree);
+
+		if (ranges[i].start < va_min)
+			va_min = ranges[i].start;
+		if (range_end > va_max)
+			va_max = range_end;
+
+		pr_debug("Initializing userptr range %u: addr=0x%llx size=0x%llx\n",
+			 i, mem->user_ranges[i].start, mem->user_ranges[i].size);
+	}
+
+	mem->batch_va_min = va_min;
+	mem->batch_va_max = va_max;
+
+	pr_debug("Batch userptr: registering single notifier for span [0x%llx - 0x%llx)\n",
+		 va_min, va_max);
+
+	ret = mmu_interval_notifier_insert(&mem->batch_notifier,
+					   current->mm, va_min, va_max - va_min,
+					   &amdgpu_amdkfd_hsa_batch_ops);
+	if (ret) {
+		pr_err("%s: Failed to register batch MMU notifier: %d\n",
+		       __func__, ret);
+		goto err_cleanup_ranges;
+	}
+
+	if (criu_resume) {
+		mutex_lock(&process_info->notifier_lock);
+		mem->invalid++;
+		mutex_unlock(&process_info->notifier_lock);
+		mutex_unlock(&process_info->lock);
+		return 0;
+	}
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = get_user_pages_batch(
+			current->mm, mem, &mem->user_ranges[i], &range,
+			amdgpu_ttm_tt_is_readonly(bo->tbo.ttm));
+		if (ret) {
+			if (ret == -EAGAIN)
+				pr_debug("Failed to get user pages for range %u, try again\n", i);
+			else
+				pr_err("%s: Failed to get user pages for range %u: %d\n",
+				       __func__, i, ret);
+			goto err_unregister;
+		}
+
+		mem->user_ranges[i].range = range;
+	}
+
+	ret = amdgpu_bo_reserve(bo, true);
+	if (ret) {
+		pr_err("%s: Failed to reserve BO\n", __func__);
+		goto release_pages;
+	}
+
+	if (bo->tbo.ttm->pages) {
+		set_user_pages_batch(bo->tbo.ttm,
+						     mem->user_ranges,
+						     num_ranges);
+	} else {
+		pr_err("%s: TTM pages array is NULL\n", __func__);
+		ret = -EINVAL;
+		amdgpu_bo_unreserve(bo);
+		goto release_pages;
+	}
+
+	amdgpu_bo_placement_from_domain(bo, mem->domain);
+	ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	if (ret)
+		pr_err("%s: failed to validate BO\n", __func__);
+	
+	amdgpu_bo_unreserve(bo);
+
+release_pages:
+	for (i = 0; i < num_ranges; i++) {
+		if (mem->user_ranges[i].range) {
+			amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, 
+							  mem->user_ranges[i].range);
+		}
+	}
+
+err_unregister:
+	if (ret && mem->batch_notifier.mm) {
+		mmu_interval_notifier_remove(&mem->batch_notifier);
+		mem->batch_notifier.mm = NULL;
+	}
+err_cleanup_ranges:
+	if (ret) {
+		for (i = 0; i < num_ranges; i++) {
+			mem->user_ranges[i].range = NULL;
+		}
+	}
+
+out:
+	mutex_unlock(&process_info->lock);
+	return ret;
+}
+
 /* Reserving a BO and its page table BOs must happen atomically to
  * avoid deadlocks. Some operations update multiple VMs at once. Track
  * all the reservation info in a context structure. Optionally a sync
@@ -2012,6 +2157,125 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	return ret;
 }
 
+int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(
+	struct amdgpu_device *adev, uint64_t va, uint64_t size, void *drm_priv,
+	struct kgd_mem **mem, uint64_t *offset,
+	struct kfd_ioctl_userptr_range *ranges, uint32_t num_ranges,
+	uint32_t flags, bool criu_resume)
+{
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
+	struct amdgpu_bo *bo;
+	struct drm_gem_object *gobj = NULL;
+	u32 domain, alloc_domain;
+	uint64_t aligned_size;
+	int8_t xcp_id = -1;
+	u64 alloc_flags;
+	int ret;
+
+	if (!(flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR)) {
+		pr_err("Batch allocation requires USERPTR flag\n");
+		return -EINVAL;
+	}
+
+	if (flags & KFD_IOC_ALLOC_MEM_FLAGS_AQL_QUEUE_MEM) {
+		pr_err("Batch userptr does not support AQL queue\n");
+		return -EINVAL;
+	}
+
+	domain = AMDGPU_GEM_DOMAIN_GTT;
+	alloc_domain = AMDGPU_GEM_DOMAIN_CPU;
+	alloc_flags = AMDGPU_GEM_CREATE_PREEMPTIBLE;
+
+	if (flags & KFD_IOC_ALLOC_MEM_FLAGS_COHERENT)
+		alloc_flags |= AMDGPU_GEM_CREATE_COHERENT;
+	if (flags & KFD_IOC_ALLOC_MEM_FLAGS_EXT_COHERENT)
+		alloc_flags |= AMDGPU_GEM_CREATE_EXT_COHERENT;
+	if (flags & KFD_IOC_ALLOC_MEM_FLAGS_UNCACHED)
+		alloc_flags |= AMDGPU_GEM_CREATE_UNCACHED;
+
+	*mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
+	if (!*mem) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	INIT_LIST_HEAD(&(*mem)->attachments);
+	mutex_init(&(*mem)->lock);
+	(*mem)->aql_queue = false;
+
+	aligned_size = PAGE_ALIGN(size);
+
+	(*mem)->alloc_flags = flags;
+
+	amdgpu_sync_create(&(*mem)->sync);
+
+	ret = amdgpu_amdkfd_reserve_mem_limit(adev, aligned_size, flags,
+					      xcp_id);
+	if (ret) {
+		pr_debug("Insufficient memory\n");
+		goto err_reserve_limit;
+	}
+
+	pr_debug("\tcreate BO VA 0x%llx size 0x%llx for batch userptr (ranges=%u)\n",
+		 va, size, num_ranges);
+
+	ret = amdgpu_gem_object_create(adev, aligned_size, 1, alloc_domain, alloc_flags,
+				       ttm_bo_type_device, NULL, &gobj, xcp_id + 1);
+	if (ret) {
+		pr_debug("Failed to create BO on domain %s. ret %d\n",
+			 domain_string(alloc_domain), ret);
+		goto err_bo_create;
+	}
+
+	ret = drm_vma_node_allow(&gobj->vma_node, drm_priv);
+	if (ret) {
+		pr_debug("Failed to allow vma node access. ret %d\n", ret);
+		goto err_node_allow;
+	}
+
+	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
+	if (ret)
+		goto err_gem_handle_create;
+
+	bo = gem_to_amdgpu_bo(gobj);
+	bo->kfd_bo = *mem;
+	bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
+
+	(*mem)->bo = bo;
+	(*mem)->va = va;
+	(*mem)->domain = domain;
+	(*mem)->mapped_to_gpu_memory = 0;
+	(*mem)->process_info = avm->process_info;
+
+	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, ranges[0].start);
+
+	ret = init_user_pages_batch(*mem, ranges, num_ranges, criu_resume, va, aligned_size);
+	if (ret) {
+		pr_err("Failed to initialize batch user pages: %d\n", ret);
+		goto allocate_init_user_pages_failed;
+	}
+
+	return 0;
+
+allocate_init_user_pages_failed:
+	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
+err_gem_handle_create:
+	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
+err_node_allow:
+	goto err_reserve_limit;
+err_bo_create:
+	amdgpu_amdkfd_unreserve_mem_limit(adev, aligned_size, flags, xcp_id);
+err_reserve_limit:
+	amdgpu_sync_free(&(*mem)->sync);
+	mutex_destroy(&(*mem)->lock);
+	if (gobj)
+		drm_gem_object_put(gobj);
+	else
+		kfree(*mem);
+err:
+	return ret;
+}
+
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size)
-- 
2.34.1

