Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CN6GZV6iWlm9wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D210BF6E
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550AE10E29A;
	Mon,  9 Feb 2026 06:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T+g6BMCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013070.outbound.protection.outlook.com
 [40.107.201.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F6010E29A;
 Mon,  9 Feb 2026 06:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDDxSMBX8zr2mKG4nbTv7JDSr8gSs2sWJC+fMiEFp409GZqU5mOaebPnQ1L8z5WplHrP4wJejnedPRv6c5E+oUTsRLcFmDcG2of81rdfvcPiFPAzru6DHDhYT9pcuPEh1T2haWuqtuiGvRmPNTv0sUZ07Vc7+4OAKntgEzsgNWAQ9SSpuKpXLv8uEiEk1DyFqRTinAMfJJbP7oFwon8e92ih0CuZ2SMwzezqWTGcLtuUsICYoBOv3zDwOMh3p7WXnGh5iNCSsqI2WoC7yClwPBwxvM45qgxxLS55htPGXVeUh940/rFIygtgArcDpzzmQgF67z82ttj4JznNf2b+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or/g3k8aWypXL2C3Ieox5FHOSnrb6FczpCu51sPvkWk=;
 b=G2HBo7hEbOmXZWp+BTC/jbtWOgZg2i6zYtlqgzkktIK17hi6Byvdyei58rIz3RdHyKBzG31uvewkXty7TAln0SZ9qe/rIgxMBTWLXV3WhdAjxBR51fNXbomAXCPwSqJ+6CD35nDaxwDPf6aJsRypv1TremJA9C0kXJTlTXLf2QdjTj+Bl41hzFUjDbPaVQHekeNcCyBFBRFimBPlwpS4lbGL9B3EXYDf7NfD31hTJMH1Vw/cLtiUR0qZxLjTve1ZDM3p4bVYaUF7jraz1XIiBpgxxfCII/cJdAB9KVHhYsSj6geY/xF+ib58ZTXXOvv6c/MX82FTVrlAiNjgE1XlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or/g3k8aWypXL2C3Ieox5FHOSnrb6FczpCu51sPvkWk=;
 b=T+g6BMCGSKZdEJlhGK+jjMhCGQnwT2TzOEgLTWCO83RDBO5Qa2Euj+r+E9smsc0PBORGxI6jMTZFke+JMV+pKgRDm7/V54awnrOw14s2eyV9rG4C3xle3Hk4glgMP9xq+KmpXvsnrArGRfd2lJBmY1bqZLVfsTKeWz4RCpfYDms=
Received: from PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::13)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 06:11:24 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::ca) by PH5P222CA0007.outlook.office365.com
 (2603:10b6:510:34b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 06:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 06:11:24 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 00:11:20 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Philip.Yang@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v4 6/8] drm/amdkfd: Add batch allocation function and export
 API
Date: Mon, 9 Feb 2026 14:10:45 +0800
Message-ID: <20260209061047.3881808-7-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: c96018b7-766c-4585-066d-08de67a20d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wixs8bF02poqAGs/4c3Riwqho/k8bguEG7CV+hVslfUKFO8bAuk8IsX/TClP?=
 =?us-ascii?Q?nmHy8x4GfwsFIK+dG4fW1Y9Zs++3L7xGLM/nL/Mzsldhmglnhpn49zBJVnN9?=
 =?us-ascii?Q?0ofQIl9RFmtaXDFhBK5W4XRKjRAtU1/iyVfxI4qMuFDdlTKCyZn+rUfw9SqN?=
 =?us-ascii?Q?5dGOKfshubqG42GWT1c97OSXCZPxEDOu8e3NHKKcfNyE52712/S7VE7FBoDW?=
 =?us-ascii?Q?BIEScy6e48lvvtQ1mRisuGoJOKYvV9S57idNmCklOtjErvqfEYqMGEItGvB5?=
 =?us-ascii?Q?G7HVWrboyeN1UrW6+Z7w59HMklhoBDHPDWDX22iejM4a9OnDjklAClBN8T+c?=
 =?us-ascii?Q?87F7y+FRu+L3F9hMOU1m01cVU5yMLHemIahycvXmD7yAH66zGTf6YNsZKs3A?=
 =?us-ascii?Q?p/7YY4O+tpF78gn1l+J7bhKCrPTEKVo10ncOi28aQAvNC+3UqopQUypOQDGz?=
 =?us-ascii?Q?QJMJGzAafn83FFyItUfS5pc292X3k1IusHdCdneHxSgvnL0wVIvSoJ4EI0zz?=
 =?us-ascii?Q?/iTWVUx50/dFckXL6GziuKVTKxbGPdFcHAi0gP9wVLISVTAqUfORSRVIrl/4?=
 =?us-ascii?Q?49Wm/l3mSP6u6DhrZ+Av5y+Yo7qVX4SpWbdexnJTJhxI/Jl96iR6eggKm7WX?=
 =?us-ascii?Q?CTAd6BZD9HDQ8rW+qA8EEZf9EUZCOVsNS5Wy/VbUnxtJ4/h4KWX3udhkwYbM?=
 =?us-ascii?Q?JVh+bno6klyrNVDyW+Sm94H5Xbcypdigg1/IssbzlxxxJWkGkXbwnBtaQS0l?=
 =?us-ascii?Q?Fz4k717pL9Tzi8k+hwhHBqNVKM6i/lJoKff7Om/ZBMora0RRvjaS7ibjX7ou?=
 =?us-ascii?Q?9CpRJoprHCegQzNYc3Z7XBEnqIAdIjRYVO0N9fLbBPwz9jASyW8c+KHVZoK9?=
 =?us-ascii?Q?VNa6tvTlXsbtRjZoY0B7HzqlzukY2brewik7yy/OGdmKT0LKclI//AYj6SO1?=
 =?us-ascii?Q?hobwpTEyChpGtj1JrHljelBL1Y/rR0TmYx48jmCWaMw8F1bqN3UY088qAC/y?=
 =?us-ascii?Q?kUwqVjeFpRce8P6fq29Nvz4MQOYVxYn+pWP9GTtTytl3g5GIjKDyLJGhVVkz?=
 =?us-ascii?Q?zlqfAQh6Fpxdsv4cPCHonkHEYOJh/XpO6g7Wtnr7uJTBpe5ku9VY3hnU4qjr?=
 =?us-ascii?Q?VewHbhbrile4OOPWvThxsU/TKwNcQ79mpHa7o5XrAs/vThnZYkFA2bs31Sev?=
 =?us-ascii?Q?SHs07pZZ/PtXOnOxghMaAve6HrffZiwqLd4NITCJHMCaFmUGIvQck5Nne4XO?=
 =?us-ascii?Q?y6BdbPNkcyLzTXXLK9yw6bNS68SXi8QBU1tHEVw3+dGEW5JCeCcH8m+MJxLV?=
 =?us-ascii?Q?Am7w0H6PPMJxzT8zEZC59CC5lbFEJtXbKytONotCMF0XIIwrMRqSLApGaHwk?=
 =?us-ascii?Q?7TN/ZUynKXI8CpgRDV1Ja1C6lZ1W0BaPJaZ4QU5nf+vdSIr4uC/7NnU6pQzp?=
 =?us-ascii?Q?FUld1NAtoY++hlEM8z4EOPMHxEEdxjdI6A1qDct4GDdcd8ZA+46F20X7Ylio?=
 =?us-ascii?Q?TKSp5v3DbFQgl45zt8br9zk9F141BpfMHbcb9z8anwCM2bXISUH6cJS5GOoG?=
 =?us-ascii?Q?Levf1VhfWPgBMWWOL+Sc3IXfvdlWOY+KhxKEcOiDOJXpO8ptFMCZWMhQkufu?=
 =?us-ascii?Q?LlByRwwvIuawuT0ET1S3Fn23wQmNghRQUv9Ns0LE5VQGIMZF9RpDXmuf5wRE?=
 =?us-ascii?Q?ONd3HA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ezTXioitw4moKYVE1einpPlyPWtptlEQtE4q8qbEryaRcseoZm4lnM00onm20xuAdqifXtmSCskCETav0qkrQ3rs0TfMutPtdVbafd3DFbfE8kx2CEgB1HSPa0x85C83gef6RsLd2RdnZG9HX4yyTA5ay7rgLJdO7vHyXlPFuzwmtpB/GDbCZJvvj6bAUxFeGr1SHlhnt8q/OIG83MNmMjvcH9PBNyIWNTU4xar8T//F3l5y97BAmSk0KXK7LuObnonCTs7a/TpHTEb1Tj5ncDD1/iz7hCZ/skOArSB8trnVpDRhy87dIt4C59PL7k783c22CWPjIQSzg7yn1pb3wF0I3SKPIQqTnnqLu4osN9P4WVufkTPVwqBQ/2G4q27FdOO93GAt62Ti/ELC+lgiiSJ06dGt5B+XDuClYgzPApgY98gr+EyiK2RhkTMgdgBk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 06:11:24.0370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c96018b7-766c-4585-066d-08de67a20d70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 173D210BF6E
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
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 276 ++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5f10a4514..c2fc31964 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1247,6 +1247,163 @@ static int set_user_pages_batch(struct ttm_tt *ttm,
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
+		mem->user_ranges[i].valid = false;
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
+	if (!mmget_not_zero(current->mm)) {
+		ret = -ESRCH;
+		goto err_unregister;
+	}
+
+	mmap_read_lock(current->mm);
+	for (i = 0; i < num_ranges; i++) {
+		ret = get_user_pages_batch_locked(
+			current->mm, mem, &mem->user_ranges[i], &range,
+			amdgpu_ttm_tt_is_readonly(bo->tbo.ttm));
+		if (ret) {
+			if (ret == -EAGAIN)
+				pr_debug("Failed to get user pages for range %u, try again\n", i);
+			else
+				pr_err("%s: Failed to get user pages for range %u: %d\n",
+				       __func__, i, ret);
+			mmap_read_unlock(current->mm);
+			mmput(current->mm);
+			goto err_unregister;
+		}
+
+		mem->user_ranges[i].range = range;
+		mem->user_ranges[i].valid = true;
+	}
+	mmap_read_unlock(current->mm);
+	mmput(current->mm);
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
@@ -2005,6 +2162,125 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
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

