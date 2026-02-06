Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOhyNaWJhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A133FAA51
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4F310E36F;
	Fri,  6 Feb 2026 06:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GNBY55Sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDF110E38C;
 Fri,  6 Feb 2026 06:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2DUmIlGwf7uNp/q0ZwYLeBGU0gtoTQgd/AcT8/joR0ktffM1uUwrgp+SWMJanU02YmRTxLaTgwL/ULzErkWvRA5IT5510+W/xTsFy58URf/14Yr5Lwq1z9FnDMS+l8uh56qLWgkKiHBjIL1lcHf8oSSOp5rS5nmegGhOzIIzVisw3uSeuz6MC4HsHJF5LYt4NWg9vBtdJx3PqHYs8p7VfKzQbwAg8zvH5fwC1glRSidF7x7YIDy3uAtHfAmKDoOmkgIWD5H8XJWwRdDauCzFDNcZwnXRAjzp47sb5fjJekCd7SKFokODO2lWBE4nl9AVEUWPm8gykv0RkaLLyhF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzALAS1XYkf2lFaOnKhc6iRiArYlmarmcvNNz75KjJU=;
 b=Kaw20EDljgkbbjjDIU2MA77NAYiPSWLyELjNHloTFCjR2rZLthRxZZyeR6X7m/UuK5VZg77zZHYaaA4ILzLPpzrGMIAFz8nfg3hhOYJcOc5auoXX6oS22I2XTgXWFdmsLMNFpG5SVnXXz+he6clsqMFVVWFjcavVNgK94wHFPaFaTZ35TI2WCVN+5J2CJA1u2mcalWBxkUGi211ztyZzmsEM6aBxoigYzD1jVmrbUxGidtlzVnJ+nimhhiNZIe6xni4rD85bpzV5KoUZogyOCOt026qcyoDr62ULiZHWvPfYGW7C39dpke4hTnnqS3Uma33JXBH7NHP8epaFCGZBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzALAS1XYkf2lFaOnKhc6iRiArYlmarmcvNNz75KjJU=;
 b=GNBY55SrIYiza2A02UsZBThZ08sb76jvsjyvdeNNAKyBwJGaSE5fTYe4sl2k/qJWRRHHSeovIBnisyfe07agzqWupIfg6MFO6ib4x9l/mcQPm8x17jaK0oByxUW+uF4eGfe9utgolchnivGnT7/d0BZTLnzV3pmZmmZk3hs4k64=
Received: from BLAPR03CA0103.namprd03.prod.outlook.com (2603:10b6:208:32a::18)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 06:26:37 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::64) by BLAPR03CA0103.outlook.office365.com
 (2603:10b6:208:32a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 06:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:37 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:33 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 5/8] drm/amdkfd: Implement batch userptr page management
Date: Fri, 6 Feb 2026 14:25:54 +0800
Message-ID: <20260206062557.3718801-6-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: d863adf1-8187-4f2a-d29b-08de6548ae84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wLCO4L9d08nlfx93L7ytZvvI+KT0vKhb2pQS6J/umA4BTsKr9m4JNkFfkg2u?=
 =?us-ascii?Q?z3iVN0e+UKl2fQeIIcLUwsfoIsiCziqHY5zmMm7H4cKLiL7KUegf5xH/bHWR?=
 =?us-ascii?Q?e+cniB2636ypwh7Eoo9OMdOh/3RLYxYFO+HJgAT9OTF7zOXfkXMg71nDANBx?=
 =?us-ascii?Q?6GBh83TJByocqh2Vozj66UZNvRsDRvMdtbeXUWPhSNkh7UsHeoAhtTbezsiq?=
 =?us-ascii?Q?TqWvxRnIVBHZp1ftR9lgKx472FPhACqAUK6G71bPe9otWmfQCiEKnD3NyfvK?=
 =?us-ascii?Q?zKfgNjb9zDtVha/9rFtbWgh49aBvYtrEa91sMYhBEqzbkDOURPknLWgOwF1A?=
 =?us-ascii?Q?o5sL9mzZprT1zt9jGJve8IlzhWO1rwEH2ah2Kl9gs4pc5jwHKIPTPcZjNECi?=
 =?us-ascii?Q?olMdaVt7TQ7S5GJ/VHvT0m1bzxJI57BRm/xA+4aXhr/dbymYAoC0WoX+hSLZ?=
 =?us-ascii?Q?7vplklppUNkRsWhQzR01SFOGv1UODpdHTGXe1dTaFsg5VRiYw2bTmPVY/FKC?=
 =?us-ascii?Q?4KFK3DjvvzNiKyvgsgexTy9Ewnht/Yc9/wWJxhQnrJT7SAeCwQQ79a8Abu/F?=
 =?us-ascii?Q?MYYdsjSlHwkfkEVaarIIqy/hj/Fc1LSa+k77dPlvWpCtAyVs/qYa94YUtelQ?=
 =?us-ascii?Q?PhSQK6tsXbaa3Kw4ARx1T4Kdzmf1d7OGotKxG/sNPqLCkBfNPuapkdoFNvbS?=
 =?us-ascii?Q?XRsXrOTyD5Fcmk4htaBQdXusTGrnxv8DGCwy+Z0jF06Xw607JCIWBb5ILWK/?=
 =?us-ascii?Q?YzYwGeB7Y8sc7G1bS2q06YvbRezwvKSgbe2u26ElXcaomVnXZSha1F39S0g3?=
 =?us-ascii?Q?Q9A+kWf62q7SkQ+DlBv5fFU/Fr3mz/mUc/kPb7MT8lW7IsdqJLA1GAFNXGDj?=
 =?us-ascii?Q?diNgm6klTNAeF+S5QYTS4InV53DGX4blcG+IYJn40pv/mUxDOXpMXzTBuX8R?=
 =?us-ascii?Q?SdRY4MMFAhAxXavqnANPLy7rKS/H76lWAWmLMzAkCXSNVXF9gIbZOsxYPyXG?=
 =?us-ascii?Q?lLaq6/dsiHg7r20NaLEAvZnd/HIHMY/X3nOqHhU7jTQ5/9kHm9DTKpDVxeRg?=
 =?us-ascii?Q?bzq9+lNPE7qVuQIcEuuAJ8SdMFDV5WcIbsxnAWkaKzZo1mC+whNisLtbPjWt?=
 =?us-ascii?Q?DWdSLe4vFGeJnMVvyt2AaUNi7RUsvC+JUTouDQ/eK7pDaFnFdJZgxKaGmm2k?=
 =?us-ascii?Q?TKP+ZF7WXyh6dtlhDWeBQsglmOEPtZcdNl70bFxzcc3/R6Wy+j/1LQemGrVi?=
 =?us-ascii?Q?4ODdS4dYupQqFd38dgSnJJd13xvU7axSAJbftuGpCNfOgiAMJ7H8Syac+Cf/?=
 =?us-ascii?Q?6cTIymHEGYIy9RW4qVCirbiMDAzM23K+bzIJWcgAzegeY4gBP3U7fh+D4eKi?=
 =?us-ascii?Q?Fz/vZZc3QY1Kkfu16E9I1o+d4DR64wS2fyIGSh5AxR/QiO+WgpzUJlqV1qth?=
 =?us-ascii?Q?RdB991g3q7QxuLAmYjLwoNo1w4FacvNZCH0ub158JecaBtRyJWFenPaHhtyZ?=
 =?us-ascii?Q?i0jwjZGKWsjBQsYBlsR5uh8Cwl4mh+DA/jr+G9qSIl7SKU6W2PeZ74D0Rubu?=
 =?us-ascii?Q?kJMQw9B9O/3cFyZWowbmX25V0v3Pc6OZwBzFgucLDuR1GAOX9E2MIZmz3V1R?=
 =?us-ascii?Q?EtMCcZ60iKccXmOmr/JdXiLfTZ9W8OU3Ad8zko5hrUuaxawqFtg1H+ujDp+X?=
 =?us-ascii?Q?Hb4lJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ACe0VkGZRadvBPx9ClOgovBmRnrHFuG7YUrlW8eTujvI0n0hYXA/4ES7rTvr07/F/XoRs7TnsDxrToJC+dtV2hzGJnUdHOc//D2VsxcCPqMXjfMp2p+G6oTGGZPZ2/4Kf4neLU2nqp/Tta8osmdKBNyv3DmCuD6vtEdCX8jw4qkSbQIdZJb4juPJ2YavTP2SvwLWp8j0adPJ2cb4zWtaJpg0pF1J8aNgPZWY7kCQE2pfS9j82592x9/30g/cy96ek+QY7rsSqqdl2X0XEnK1a+c+0NJew5gHnV37cMvPct7Q+y+U1B4bPMxkP3DbEcEBw4aYD9dqGFO5vn8kNtISkhXAkebSMip/Rjqzgc9vXWYOacP+Hk4EaCWyXwQEPYnD3KH2p6nyIlCRyJ3lq5pewR7D4d3kVExzY1rdNh/F0A7zGewu1wk275sNZhBPrYAE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:37.2732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d863adf1-8187-4f2a-d29b-08de6548ae84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778
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
X-Rspamd-Queue-Id: 8A133FAA51
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Add core page management functions for batch userptr allocations.

This adds:
- get_user_pages_batch(): gets user pages for a single range within
  a batch allocation using HMM
- set_user_pages_batch(): populates TTM page array from multiple
  HMM ranges

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index af6db20de..7aca1868d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1200,6 +1200,60 @@ static const struct mmu_interval_notifier_ops amdgpu_amdkfd_hsa_batch_ops = {
 	.invalidate = amdgpu_amdkfd_invalidate_userptr_batch,
 };
 
+static int get_user_pages_batch(struct mm_struct *mm,
+				struct kgd_mem *mem,
+				struct user_range_info *range,
+				struct hmm_range **range_hmm, bool readonly)
+{
+	struct vm_area_struct *vma;
+	int r = 0;
+
+	*range_hmm = NULL;
+
+	if (!mmget_not_zero(mm))
+		return -ESRCH;
+
+	mmap_read_lock(mm);
+	vma = vma_lookup(mm, range->start);
+	if (unlikely(!vma)) {
+		r = -EFAULT;
+		goto out_unlock;
+	}
+
+	r = amdgpu_hmm_range_get_pages(&mem->batch_notifier, range->start,
+				       range->size >> PAGE_SHIFT, readonly,
+				       NULL, range_hmm);
+
+out_unlock:
+	mmap_read_unlock(mm);
+	mmput(mm);
+	return r;
+}
+
+static int set_user_pages_batch(struct ttm_tt *ttm,
+				struct user_range_info *ranges,
+				uint32_t nranges)
+{
+	uint32_t i, j, k = 0, range_npfns;
+
+	for (i = 0; i < nranges; ++i) {
+		if (!ranges[i].range || !ranges[i].range->hmm_pfns)
+			return -EINVAL;
+
+		range_npfns = (ranges[i].range->end - ranges[i].range->start) >>
+			      PAGE_SHIFT;
+
+		if (k + range_npfns > ttm->num_pages)
+			return -EOVERFLOW;
+
+		for (j = 0; j < range_npfns; ++j)
+			ttm->pages[k++] =
+				hmm_pfn_to_page(ranges[i].range->hmm_pfns[j]);
+	}
+
+	return 0;
+}
+
 /* Reserving a BO and its page table BOs must happen atomically to
  * avoid deadlocks. Some operations update multiple VMs at once. Track
  * all the reservation info in a context structure. Optionally a sync
-- 
2.34.1

