Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1AC50F26
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D5810E6BA;
	Wed, 12 Nov 2025 07:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="avoEzBdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3F810E6B8;
 Wed, 12 Nov 2025 07:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5QPHN6LXZHw9oVg08IkKNGj/Q+xpNDa5M2KXk6tg4RDy7Pq28Cb6Wh2+KOsGqWTyLASAN2M2ZC57adDMd1NCZahBwtbOn0Ifu+M2TVDsrvDNkhYk1H+KzgotOzeLHkjMJ08mD4kF6jw2Q8xYE6lLkq9L/XryDXyXUZHc3grfgh7+xkgE8LsIOVijjAa/PTzSuvtEwhXNLA13VEjhBwBFztDhUiWyR0+9qQddrlKnllQfDFakbybOcGyAR3Syni83zEiwUTXDmEN6XA3Tuzi3TpOjVGAOx06YW/swV00Rts2DGqSAud6rO1tDUMTrkj69SOvCP/bq4Qn5FZ3jTRm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQQMX/nlAJhaBEBziG2NLFNNdRLNtD2k+Os9agqVAPc=;
 b=o2Iqb+0ykmhrsuMZ24MJDYMBOXnSJPxej4ULGM8HNgNDPGPmuZ0eOcPi/IBXCvn56qRebZCkW9x6e2KrKsw5CvDLZxmxpBDS//frpH5m4tS6JCu2nN8n2hTbdZE8pkpIIjrkjya9qxXZS0Xq6DMsd5IErmc4JA9B3V5qrBVwTmxNW7f1cgftdRfPeoTWwODmsvDLwOt/p8xpT4of+6o8wGNdZjbk2U/7sCT+dmQ/Ok2Em4nwNkmkhf7RB337wojzStt0lKOkYEXqiTRHuKFWKp7AlGcE2OeE4FAmdllb/OX1sWxGA2yZyFq7N6s6VDq5S1kvyLO+NCpTRyL4pzJRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQQMX/nlAJhaBEBziG2NLFNNdRLNtD2k+Os9agqVAPc=;
 b=avoEzBdCOmgqr477M5oAAKeCtp8EWQPZcSQsf7dohay4F7nTsUaNLRi+18IkW8zhjbQ9FOcCCqtClWTBXdDoM0SiU2Xmqwe5uwnaaXWpSa2tnXrQcHbjrcdL1VDucuLmJEJc7nTYFD76F6zlBzv4+PGu9Xb1szdGULKUK+Plh4g=
Received: from CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::11)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 07:30:27 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::2) by CH5P220CA0009.outlook.office365.com
 (2603:10b6:610:1ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 07:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:30:26 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:30:08 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuang@amd.com>,
 Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH 5/5] drm/amdkfd: Wire up SVM ranges ioctl handler
Date: Wed, 12 Nov 2025 15:29:10 +0800
Message-ID: <20251112072910.3716944-6-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112072910.3716944-1-honglei1.huang@amd.com>
References: <20251112072910.3716944-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: a613e7ff-c707-4875-d7ca-08de21bd596f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4gjWFkOZo3vQOUY2/EIfBEq5s6HBpOoiRqoqKteCe7vd4MgY38qBtYeCdBhG?=
 =?us-ascii?Q?SaoQcmg3FIkqMPCnzj66srwLCMfaQ3THUDZSepLyg79m/hRW1SaKefK4/Y/O?=
 =?us-ascii?Q?Fvyzvp5RsOtQmZ652O0M2AXSyrhkSpH55MWYi0Jp5ralVrkEJHBs3g4yZsq7?=
 =?us-ascii?Q?IcFTrMUEO3ROd9L8HUgAtD0K/qtcGmD7XK3IQnLAfTQBN7hDIw8Z6jS1l4DN?=
 =?us-ascii?Q?mdkQAWKv9sRNlQeyVFM4GRuvvyqBMnfqIIgKq3TU8ZGHuwGzCCKriQhNAuxP?=
 =?us-ascii?Q?zTsE0SIh0FNhQC5tX9FxGymfgin93iCoOBETSAcf9x97UJpuRkLYEj6G1tpw?=
 =?us-ascii?Q?finBWlaRpC+4DjX80WDNZf5RJKNEAu2Yo9X2FEgzIXXdn5ZIfNAOUKctE/bz?=
 =?us-ascii?Q?1OanDaeFTc2j2EyjpnZuezD+6NyLe6UgpjPWZNwiDxnXC0MAertKvglbNN1S?=
 =?us-ascii?Q?me1hamOtH7w0yfhGpuhuZm+BeJd4VsuUnllFMw8i3FyU0t1Y+Ax95gKUD+4U?=
 =?us-ascii?Q?eTD2g3haC44dqAmg/uFHxSUdjHH21Kgptc3vC60AEFXpZQyBS1U7nTnkRPgO?=
 =?us-ascii?Q?33rrYHzYotiaAtg6otCyhd6aqTp/M1DgwHbCTuinYbjLriTPLgoZLHZSWJBF?=
 =?us-ascii?Q?rVKCWTD+jC28R+H5HefC19gY5JNHNbxgfRsEjafLrKgRUqayY2/xjcoCB/xX?=
 =?us-ascii?Q?itf8mgspy+N+2LugRDShMRF6I4OrNDfmpgysnlPOO8V+r0QbIoHwKRzFeeps?=
 =?us-ascii?Q?QTy2F09we5EtcgT4bsevU3Nikh5/QLjGRHz8xLDmJQblwm6PLuLdllTRdvIP?=
 =?us-ascii?Q?XdoUSWw2N2n4VJJOBxRlbEMCKRvSVIUgxPB4iGWezXZs3c51UPYBqcwTcQuB?=
 =?us-ascii?Q?Ek79moQDvPBZqbrvqgDX1RwxHXm3b9jlOS69gQwSgCaAnd87wzHHbICzKlWt?=
 =?us-ascii?Q?KQ+HxDOvhkz4ATrbSBs5kO1HmIZ2MGY8oTnyYqgizynRQXHkITXN6sR9lkm7?=
 =?us-ascii?Q?E+u3yxbwHwSONNKUuWUttQzYPr5oOF2kA2h2LiulJxvEKT1WUpgqdA4JrP5d?=
 =?us-ascii?Q?BmM5ZBUHccPDPqxosXJzJTV8UN+4zBrXBityRGdSm7qlmVl6oVTriILYQaJM?=
 =?us-ascii?Q?NR9RvUAQDqG4RXOPsIWrJ+HsATTO4AnS0HCE3naC0EGV34lZvYce5Xcbab4F?=
 =?us-ascii?Q?LgQy9SmVB/1WZD99zH0h6ypjR9f/ASV7sS4anTvVLrdWlmZKqrIKpPxDFL/z?=
 =?us-ascii?Q?S1QNyUz5i4IV4/WE84hlOgtQa+JCCDi8WE+HcI5hHUsiq5kZCVormThlC8nl?=
 =?us-ascii?Q?L7ThjQ3dkxKbTWiLag/YImGHZzFg6kLG+S2M1CgpER5J3bfBXz8rSNpyrqpz?=
 =?us-ascii?Q?54T4SoGbSjAEyp5fGsV/a22V7Vqz9jEj0WclsBlocHHdq6MQTlENxSYDF81G?=
 =?us-ascii?Q?zo7kHQY7fhSOpdTHS+YfIJ3FLgM/Ab8huCyGTjkyWON2bU7Mep4dtBkhP9Yb?=
 =?us-ascii?Q?eP/0ElRnahwOU4P2ZXL9LVEownn2fPnKVcZHtVYH7O+1F//S7r7+xWZzS13+?=
 =?us-ascii?Q?H5zbPl4K3dnwYOc59eM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:30:26.5691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a613e7ff-c707-4875-d7ca-08de21bd596f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Implement the kfd_ioctl_svm_ranges() handler that integrates the
SVM ranges functionality:

1. kfd_ioctl_svm_ranges() implementation:
   - Validate input parameters (ranges, attributes, addresses)
   - Copy range descriptors and attributes from userspace
   - Call svm_pin_user_ranges() to pin the specified memory ranges
   - Construct kfd_ioctl_svm_args and invoke existing kfd_ioctl_svm()
   - Properly handle memory allocation and cleanup on error paths

2. Extend attribute handling:
   - svm_range_check_attr(): Accept KFD_IOCTL_SVM_ATTR_MAPPED attribute
   - svm_range_apply_attrs(): Set prange->is_map when MAPPED attr present
   - svm_range_is_same_attrs(): Force update when MAPPED attribute used
   - svm_range_has_mapped_attr(): Helper to detect MAPPED in attr list

3. Register ioctl in amdkfd_ioctls table:
   - Add AMDKFD_IOC_SVM_RANGES entry with kfd_ioctl_svm_ranges handler
   - No special flags required (use default permissions)

This completes the implementation of batch SVM range registration,
allowing userspace to efficiently register multiple non-contiguous
memory buffers with a single ioctl call.

The implementation reuses existing SVM infrastructure while adding
the ability to handle pre-pinned memory pages, reducing overhead
for applications that need to register many scattered allocations.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index fdf171ad4a3c..7e7e00d3f873 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1739,6 +1739,70 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 
 	return r;
 }
+
+static int kfd_ioctl_svm_ranges(struct file *filep, struct kfd_process *p,
+				void *data)
+{
+	struct kfd_ioctl_svm_ranges_args *args = data;
+	struct kfd_ioctl_svm_args *svm_args;
+	int r = 0, err;
+	struct kfd_ioctl_svm_range *ranges;
+	size_t sattr;
+
+	if (!args->nranges || !args->ranges_ptr)
+		return -EINVAL;
+	if (!args->start_addr || !args->size)
+		return -EINVAL;
+
+	pr_debug("start 0x%llx size 0x%llx op 0x%x nattr 0x%x nranges 0x%x\n",
+		 args->start_addr, args->size, args->op, args->nattr, args->nranges);
+
+	if (args->nranges && args->ranges_ptr) {
+		ranges = kvmalloc_array(args->nranges, sizeof(*ranges),
+					GFP_KERNEL);
+		if (!ranges)
+			return -ENOMEM;
+
+		err = copy_from_user(ranges, (void __user *)args->ranges_ptr,
+				     args->nranges * sizeof(*ranges));
+		if (err != 0) {
+			kvfree(ranges);
+			return -EFAULT;
+		}
+
+		r = svm_pin_user_ranges(p, args->start_addr, args->size, ranges,
+					args->nranges);
+
+		kvfree(ranges);
+
+		if (r)
+			return r;
+	}
+
+	sattr = args->nattr * sizeof(struct kfd_ioctl_svm_attribute);
+
+	svm_args = kvmalloc(sizeof(*svm_args) + sattr, GFP_KERNEL);
+	if (!svm_args)
+		return -ENOMEM;
+
+	svm_args->start_addr = args->start_addr;
+	svm_args->size = args->size;
+	svm_args->nattr = args->nattr;
+	svm_args->op = args->op;
+
+	err = copy_from_user(&svm_args->attrs[0], (void __user *)args->attrs_ptr,
+			     sattr);
+	if (err != 0) {
+		kvfree(svm_args);
+		return -EFAULT;
+	}
+
+	r = kfd_ioctl_svm(filep, p, svm_args);
+
+	kvfree(svm_args);
+	return r;
+}
+
 #else
 static int kfd_ioctl_set_xnack_mode(struct file *filep,
 				    struct kfd_process *p, void *data)
@@ -3226,6 +3290,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_TRAP,
 			kfd_ioctl_set_debug_trap, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM_RANGES, 
+			kfd_ioctl_svm_ranges, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
-- 
2.34.1

