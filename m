Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D+IO4l6iWlm9wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA710BF39
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13D10E23C;
	Mon,  9 Feb 2026 06:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bxtYlMa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011027.outbound.protection.outlook.com
 [40.93.194.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1979110E1FB;
 Mon,  9 Feb 2026 06:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlJAlDNSyhNtaorBg8uvhCtPnssvT+gOEp2mVdcgleAYAUAHcc8lTgj5axg0f3M0Mv6iVVDeVHakKJHxrpPG4SAjeSKcdNlS47Y/H78p3BdmhHjXwsVbhaP4iqCDjJxF4REnJB1A9rSItGvACtyS0kMCJGdsPVpeGp8eL7Cu72bWd7odj83kNPrW5WgRD9kt00Gk4A7JtQk5C2CFWxqY0+/aYpvXqoSz+u7CgrBzRxEd6KSjQLLi1DZLKSVbHaGX2J5ZtLW+PYvLc+VDAenJytVn390iUHa32YC9BD+gIvQQgB8cGlzKKlk0tNnjZ9JfrmHCkC6V4wYCtZwXWQ/JZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf/6hVSjZ33ruWCNlfjJdVzYU6gW/NkkhjSUi89Hosc=;
 b=KIC6xrZaw4zQ0rXBwQ+QcPNX4i4cYnev7jyIGa7xOCTmBRmtgAAM1UP65TWW/i5ArNxetWt9GLP5iRiFw/0CtKf9vslEmTNR4z+umn+aejkQW61yUPUwiCR1C6XV2/4eQ+QkJ6bV3v9YVM4Olenm8ITMrfqJL1gEWBujeHRj5E5uBfLQJSJxZPKqCBLFzRJ4a3DtCTdJHLch3wxiC1EPBEJBzWfG9PshTjbcoQdvgTu0jwgSIG1sozqN9he49evGAVq27dRiCzXzhLkTpiKdfU5Mh+essC3VoJdITYhKcDE/DZxqu/FnmD9Cu2WbjCj81plScs8HJm7DM1BX2reu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf/6hVSjZ33ruWCNlfjJdVzYU6gW/NkkhjSUi89Hosc=;
 b=bxtYlMa5EsiasA3xHtuhBzkQClXa1wIyq9Wqh69LXt2pNfOjgTZVa6gtvnlR/iZcJqfopsJ6Ue1ZF+D0VuUrGq4jY4eYDR6SJ1uvfxF/V5p6wJSKXCfoj8+0mvpIOAjaYcSzU7OOQTM24ufTzQfvc2Y6PVjS0tCL37A8PkqseMk=
Received: from SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) by DM4PR12MB7525.namprd12.prod.outlook.com
 (2603:10b6:8:113::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 06:11:11 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::ad) by SN6PR2101CA0012.outlook.office365.com
 (2603:10b6:805:106::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.4 via Frontend Transport; Mon, 9
 Feb 2026 06:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 06:11:11 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 00:11:06 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Philip.Yang@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v4 2/8] drm/amdkfd: Add user_range_info infrastructure to
 kgd_mem
Date: Mon, 9 Feb 2026 14:10:41 +0800
Message-ID: <20260209061047.3881808-3-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DM4PR12MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8024ed-29c7-4e57-7ae7-08de67a205e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qOlsQDLVYa3KQZhjYVMMmHe9g83qDXZvWvAhSsvx88VWItKuK7DzCN95efs/?=
 =?us-ascii?Q?WJvo7X7rOcnV4wOV/MfqeTfvUBFb4M2km77/3aAyMNTc0gX3xHfHsyHBlm32?=
 =?us-ascii?Q?DrsnIus5P8ri2dWfz4bEE92W8nWnLqaRsAM7OCehV2YiIA8BIPu4Kz5td52p?=
 =?us-ascii?Q?BB71vzyGFyGGGb4jWEp3bNtigX0Wgx0m1pDLRw7d948KT2XPu5ttB7us6UgR?=
 =?us-ascii?Q?h4v7VrjLJhmsOp2X8nu/Mx4pkuGvmnanYGqbjwrXtQk4cMrCbA3l/AR/s5jt?=
 =?us-ascii?Q?xWsswr3jfXLPXMUFKqJcHYifqRkxyQb5spTzXbqXyXJlD4OCS3KYgK1pDdwg?=
 =?us-ascii?Q?+ynLP9M6Cd6OwiI+qEx6st0S/Q+OG3K+BFdvUWnJl9SE9UUeulOCkO4NGoxw?=
 =?us-ascii?Q?yqAgm1roonBRMKACfzFKYqmjAf8RNOOtLT0iBQUFKANz/cTqZ5UcQKTpg9x5?=
 =?us-ascii?Q?2sFDFY3Wkr2LyTR95kHCpin86rNB7aPOz7b8qW5ks/CE0bT/2HGIG+s/dz0N?=
 =?us-ascii?Q?QttgMhzFCgbuRA4Z938pHdlrePAXYc5wDEX0jltsvpx6sJUJzgQNyUEyozMT?=
 =?us-ascii?Q?QezLwJEuRSzOiNssguKQCUhg3H12NamWv7nmqeu9OG/QKlZCtpBHc7/FJqjz?=
 =?us-ascii?Q?g2WrdLoN6Wlx096qqGgRTCBO53TE+xyJOi3WijMJ1MTgP61YyT2gMORgLnby?=
 =?us-ascii?Q?Ke8WmDjr3DYAOZbGoA+qf4MybNDV+hfDjcJT5F4voeidpoiYTFS2KWF803zN?=
 =?us-ascii?Q?Ag3Xh7ZbnY3abBY+IbKSqbJULiZjRcXWDCCHCO7vIyICn3ffkRboAc9jvAWm?=
 =?us-ascii?Q?MosiegyqRbEaRHS7hWR5aY8zDB74vLTK5VryZCF5XR77wTCgbRQvzyyNUmVk?=
 =?us-ascii?Q?uIfPaqbGVUqvh61rPHFTikDdveMLN1Qe9Zh+XIGRlSInmwSRXNxB+OlCw2AX?=
 =?us-ascii?Q?BbDxU9o8uQMIU9Y6OR0c8btTJtSbFWVIAzuIA6OO2R9M4a3J7FR/MGqaMc6j?=
 =?us-ascii?Q?j5gdxGPKeZroXnnQgKn+20xq/oW4aC2lldFdy85un+yw9ySO+s73G5o/addf?=
 =?us-ascii?Q?A74Uh1P8U1SvxahOC+tSPSUsMIC748H6XmCsxtZcapfAfGVQ7C/5y0EDVw+k?=
 =?us-ascii?Q?UjaSLLjNGdlPg0V3ZNvFkdBzyo4yYe+Wx3zI3G0n/mB4rj3B61hpT4MXBHBZ?=
 =?us-ascii?Q?Dd7mKgxFFP1jMMN0BxNt1aTlXFDwTlQkZc8mXAu7RFA8hPxpcMPWRnfwn6vv?=
 =?us-ascii?Q?WfnTt0i6E+edRQRZa6tjLqbRc04DPTH/vZjOXxPj8V0sOTxDwRoOVvZoWW9j?=
 =?us-ascii?Q?f/W4dH8AnzTPOeY6hcOjQxhdwvJRAgBLD9w40dNbv6o7XeAaWC+JgV1cVtvo?=
 =?us-ascii?Q?MToxhZcU8p83Bd0UWdzdyglAQUBIFm1hYpD+IvR98CcGXz45xfcgPLXok2vl?=
 =?us-ascii?Q?fT3CEUn0rZjyCl3UvL/3nzwzOLPnPZm3rZP3iour+/HPTYV4hi5svNd5IRQX?=
 =?us-ascii?Q?wlHiS7l5f1+6m2kWNUzicsGKOw0crrBDziVGWmI1gyqSsnMkUluT6/kYKw9m?=
 =?us-ascii?Q?vyxIbqb7e8SdfDQynXQE29uL+jNGdlaIjbhQnavN/w4DQd+sbE9t9Koay81/?=
 =?us-ascii?Q?X9H6ro4cGtkZIo/nIFi1e321tYLLFfN2gNtM0zQgtSM2jsyo+vykTi23LhDV?=
 =?us-ascii?Q?iGviaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OJQR+SUSTJMimMrxejpf0e+/qWmjn0l6qPh0vdW3qXTN8N/mnmKGoZOon1kj76+TnTruO0Tze8Oiod89lo2uT6xOCGnyKk4GiM3bkfYWJCLw184TniIiKzlzyWMeguHBPkOJDudN3RFkGeGtMwYUer6t0GcRx+qALtAc5Z2E1qJYrrUtww6tdqbOGqgeC5+geSmzciJwAdJnFQffq0u+l2BQMQwmrv9nqTA6UddPROhK2JUqTEHspr3VZFmA3K+4oHDUVANiISe0oU6upE43ObMpk6Lmcxs/ok891HDvZmAN9CG79gSB4496eOITCf6zLRTA9KXkeZuDRZl55uvLePmRR4zkZOpdziPFmWa95EPrQJ8PQFvOqrVxoqTsgxq6W3L5QSfO/htA/eEGp4vxiGSjrFrjbKl/bIEQNl058fdjztmCeYJQ3K6zZt6jQTvg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 06:11:11.4256 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8024ed-29c7-4e57-7ae7-08de67a205e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7525
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9FCA710BF39
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Add data structures to support batch userptr allocations with
multiple non-contiguous CPU virtual address ranges.

add:
- struct user_range_info: per-range metadata including HMM range,
  invalidation counter, and interval tree node
- Fields to kgd_mem: num_user_ranges, user_ranges array,
  batch_va_min/max, batch_notifier, and user_ranges_itree

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 321cbf9a1..5b6d399f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -48,6 +48,7 @@ enum TLB_FLUSH_TYPE {
 
 struct amdgpu_device;
 struct kfd_process_device;
+struct kfd_ioctl_userptr_range;
 struct amdgpu_reset_context;
 
 enum kfd_mem_attachment_type {
@@ -67,6 +68,15 @@ struct kfd_mem_attachment {
 	uint64_t pte_flags;
 };
 
+/* Individual range info for batch userptr allocations */
+struct user_range_info {
+	uint64_t start;				/* CPU virtual address start */
+	uint64_t size;				/* Size in bytes */
+	struct hmm_range *range;	/* HMM range for this userptr */
+	bool valid;				/* Flag: true if pages are valid, false if invalidated */
+	struct interval_tree_node it_node;	/* Interval tree node for fast overlap lookup */
+};
+
 struct kgd_mem {
 	struct mutex lock;
 	struct amdgpu_bo *bo;
@@ -89,6 +99,14 @@ struct kgd_mem {
 	uint32_t gem_handle;
 	bool aql_queue;
 	bool is_imported;
+
+	/* For batch userptr allocation: multiple non-contiguous CPU VA ranges */
+	uint32_t num_user_ranges;
+	struct user_range_info *user_ranges;
+	uint64_t batch_va_min;
+	uint64_t batch_va_max;
+	struct mmu_interval_notifier batch_notifier;
+	struct rb_root_cached user_ranges_itree;
 };
 
 /* KFD Memory Eviction */
@@ -313,6 +331,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct amdgpu_device *adev, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags, bool criu_resume);
+int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(
+		struct amdgpu_device *adev, uint64_t va, uint64_t size,
+		void *drm_priv, struct kgd_mem **mem,
+		uint64_t *offset, struct kfd_ioctl_userptr_range *ranges,
+		uint32_t num_ranges, uint32_t flags, bool criu_resume);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size);
-- 
2.34.1

