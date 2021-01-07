Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF82EC893
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4A6E413;
	Thu,  7 Jan 2021 03:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1C26E3FE;
 Thu,  7 Jan 2021 03:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTGyINU3mKeiOUFb9uI5AmPmxLhHp3IBbIUBARvpYmgzDknV8w9r/Dc5VSOvXc9GaqMNL8QQWX4CULVwrPTJvbPtRCsogNBonc3/JTFu4YKWQMTr8W+ZeqjW71TN6wcHLECeVqlF62K6+Ygbb3jBiZr8S7w3K3ybEBltQYKeePBDMWCZQi9xH0neBgxOxK/Bx63OqAGRLdhtNWP/Ys1ofnhG2ngtYhLhuQ83uWVPLUrcxIcZbL4Kdjt7Io8UQGscdR3jBKsaTneXsjtS6Q/hw0HyR8rgBWDmLXzT8EWEhXir0bToGItvA9zF8kDm1km06985oWpvezieSbvzc0peRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pemfn7GBsU+zeI6Kcpk22IyId8VMfMz26SK9lCOMv6g=;
 b=krEkyR/d5B4sTEK3Z9BIQlQMbeVQyyTVZYcNjszHfyeaZpv/RoGURx5yRmbEHov2Z3gz3UazmZ9EFl7n6ABI2y0PqZNciCpzOpsKv6jhDmACUOY1js+9Nc/dkQmC/FQIUwJOejXXEPOQty2Y3q8BglWjLCkiXS9Evk4scMJz4IUgm7+z8vDCMg65XiKu90fy+D1Y59BcJKHKXSmK1YBmEyK6CJnFrB3Izpf6H+LNTLT51Jin7ZtQP4evNwgK/r2AaJAVguXUoroK9NtY4PviidmpmdfAsFEfay/OUbJBicFPlpsaAZ3e8TkotiBndkv6M2Xnz0Hbsee0QNVXjeDE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pemfn7GBsU+zeI6Kcpk22IyId8VMfMz26SK9lCOMv6g=;
 b=J7vZkaP7PW/QPcIW3vdonEJpCxuICqRqepWd7PurJzzhzqIOycdEeprZINxvmzEBSadNQUs7vjCLsqo26+KOeXGOksBldS27NURfrgxpu2Ck980tAoSQWyry8ilrfibzBdb0NqDJ0itFXtDqq+IXs1Rll7azF5y6ZVXRT++1ri8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:50 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:50 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/35] drm/amdkfd: add svm ioctl GET_ATTR op
Date: Wed,  6 Jan 2021 22:00:59 -0500
Message-Id: <20210107030127.20393-8-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca294bb6-1ee3-4735-b9cc-08d8b2b8b814
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39995BC03B9120846FF0894492AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJHULn/0gRNvzWpPo+zkIME/xX4jki6ytLCCvSLuFWJACvuJ0Ftm/w+zEvpPVtoTClQs0TrXt+rJp9PuhguYFiO5oxD+kkmi+Njcx1mP8BeB+8njaSgqKC+XYtmBrwhZK9DJ5L64XvjyjmzbRYBcylBvOEk0LtwROiELkLYbIM6E5qxVAixOqnY9/KYHrm5iLwSD3SVZ40LqzCcaaS1v+oWsqknDJMzWKxuVD5YorRLyV2fHYtk0wxgknxbQTd9Ev5FbcJpazCg8TRDBfyud+TTKMCjCPK1gI3iq3CuVjD/hzVOy9+sqpcxcV+2UkMrXMkjd+eSuRdumaN0mQ6qnRqn3o4aA2BP1GUUCamlU2UiOQGZnDUOATGDHVOOLA65MTvjr/reVikA8zsONMQXiJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uxf/TVeB7l7xX6gYZfyF7Ti0JKjIzrCS3jcVf0D51fE6hqU1X1GVXVva+RsB?=
 =?us-ascii?Q?tRhVRROiaTD/7P+H12n2C9zehOVWSQZ7BgiF0jEO3unbWq/PdLp4y/lzj/z1?=
 =?us-ascii?Q?j0ZElVTdxv/5qCf2TG2Sdh7txhke/zh7sVPhf2ot8DdhhUYCfIMSG+KfGYVi?=
 =?us-ascii?Q?uyjq7udLYJDy02+fZRaynyfrZFxd2jRv8SC0+090bPjYx8NGnjg4Rwcn2GIa?=
 =?us-ascii?Q?NNXBUzjw8/nryTk1GXDs3NNf511Vt1mYH96NpVPQVTuTeSG4WhSbZA33YqoM?=
 =?us-ascii?Q?5U80a9V05Xinm2O3ztnvMcCBELM+4ZDmbFK+dagGiyhmZyQ6HjzwJMOzvH5k?=
 =?us-ascii?Q?YztrBs/D9fqTSQ4coE4ADixCtjWTvxHunFF9+wx51/BlOOT7k9r0MTNG5jMS?=
 =?us-ascii?Q?AcougUDIXawXhqWAE18aYj6vkNrUaKmwfdKMyaKz4m7uT91SPbhlbud+19Hc?=
 =?us-ascii?Q?+BDg+Nd+R/YtQBvLqVFlz5aR9E4uZ3EqJHUP641ZI6tgDtsr9C388qeTIdhc?=
 =?us-ascii?Q?utq1khm7k5FmrdOqrO2XAsWknDAiA9X6zhfUk4+0Z6wjsNXysPxHEOm3y7CN?=
 =?us-ascii?Q?BzrxXex3ml2mR3XWoyKRQC9uQa0prI0Z+lOLcR3C89DobAS4E76ohcVNvWm8?=
 =?us-ascii?Q?HfqVflBOxxHO6abWysFRIQ2TjR3JfvbFUq4OwMykKg9+tjcWRuc1gL8FDQwX?=
 =?us-ascii?Q?60LtT7VYPH+6pJx7Gea0oYNPFOrRKgFS2uuN6aYe1RJjQzwIAUaiATQqXBgF?=
 =?us-ascii?Q?X6PJqDTZMBYoZKiuEFzEkxF4wAftCUsLjsl3E5q2kD7+7cadwINIaSJenimN?=
 =?us-ascii?Q?vle3e/dnyobczfoyuB1EAEj7iHOVTse/s2dsxca8xK3Y7wcJYY/7F8gBkeSM?=
 =?us-ascii?Q?Ab/TzYq0k4zo9DDH61f7uX+2rufqu7ugaTlN2vkNcOyHZXVOr3pR+ZeB1cQm?=
 =?us-ascii?Q?T/RTiIOFqyLVoBr+iSb4NR8ZlX9KleYTZvAjUMZtBhoO+NGPw5FBN/IvfBPy?=
 =?us-ascii?Q?lDNl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:50.4062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ca294bb6-1ee3-4735-b9cc-08d8b2b8b814
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVwdjBkzwGl6Sj+Ojq4VlRf6qW4R+alW3a+VOKgadFU/PXXsF87TOr68ctAt+k5Jl9Cn5EpYTgUXXuGSIFosLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Get the intersection of attributes over all memory in the given
range

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 175 ++++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 0b0410837be9..017e77e9ae1e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -75,8 +75,8 @@ static void
 svm_range_set_default_attributes(int32_t *location, int32_t *prefetch_loc,
 				 uint8_t *granularity, uint32_t *flags)
 {
-	*location = 0;
-	*prefetch_loc = 0;
+	*location = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
+	*prefetch_loc = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
 	*granularity = 9;
 	*flags =
 		KFD_IOCTL_SVM_FLAG_HOST_ACCESS | KFD_IOCTL_SVM_FLAG_COHERENT;
@@ -581,6 +581,174 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	return r;
 }
 
+static int
+svm_range_get_attr(struct kfd_process *p, uint64_t start, uint64_t size,
+		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+{
+	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
+	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
+	bool get_preferred_loc = false;
+	bool get_prefetch_loc = false;
+	bool get_granularity = false;
+	bool get_accessible = false;
+	bool get_flags = false;
+	uint64_t last = start + size - 1UL;
+	struct mm_struct *mm = current->mm;
+	uint8_t granularity = 0xff;
+	struct interval_tree_node *node;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	uint32_t prefetch_loc = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
+	uint32_t location = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
+	uint32_t flags = 0xffffffff;
+	int gpuidx;
+	uint32_t i;
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx] nattr 0x%x\n", &p->svms, start,
+		 start + size - 1, nattr);
+
+	mmap_read_lock(mm);
+	if (!svm_range_is_valid(mm, start, size)) {
+		pr_debug("invalid range\n");
+		mmap_read_unlock(mm);
+		return -EINVAL;
+	}
+	mmap_read_unlock(mm);
+
+	for (i = 0; i < nattr; i++) {
+		switch (attrs[i].type) {
+		case KFD_IOCTL_SVM_ATTR_PREFERRED_LOC:
+			get_preferred_loc = true;
+			break;
+		case KFD_IOCTL_SVM_ATTR_PREFETCH_LOC:
+			get_prefetch_loc = true;
+			break;
+		case KFD_IOCTL_SVM_ATTR_ACCESS:
+			if (!svm_get_supported_dev_by_id(
+					p, attrs[i].value, NULL))
+				return -EINVAL;
+			get_accessible = true;
+			break;
+		case KFD_IOCTL_SVM_ATTR_SET_FLAGS:
+			get_flags = true;
+			break;
+		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
+			get_granularity = true;
+			break;
+		case KFD_IOCTL_SVM_ATTR_CLR_FLAGS:
+		case KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE:
+		case KFD_IOCTL_SVM_ATTR_NO_ACCESS:
+			fallthrough;
+		default:
+			pr_debug("get invalid attr type 0x%x\n", attrs[i].type);
+			return -EINVAL;
+		}
+	}
+
+	svms = &p->svms;
+
+	svms_lock(svms);
+
+	node = interval_tree_iter_first(&svms->objects, start, last);
+	if (!node) {
+		pr_debug("range attrs not found return default values\n");
+		svm_range_set_default_attributes(&location, &prefetch_loc,
+						 &granularity, &flags);
+		/* TODO: Automatically create SVM ranges and map them on
+		 * GPU page faults
+		if (p->xnack_enabled)
+			bitmap_fill(bitmap_access, MAX_GPU_INSTANCE);
+			FIXME: Only set bits for supported GPUs
+			FIXME: I think this should be done inside
+			svm_range_set_default_attributes, so that it will
+			apply to all newly created ranges
+		 */
+
+		goto fill_values;
+	}
+	bitmap_fill(bitmap_access, MAX_GPU_INSTANCE);
+	bitmap_fill(bitmap_aip, MAX_GPU_INSTANCE);
+
+	while (node) {
+		struct interval_tree_node *next;
+
+		prange = container_of(node, struct svm_range, it_node);
+		next = interval_tree_iter_next(node, start, last);
+
+		if (get_preferred_loc) {
+			if (prange->preferred_loc ==
+					KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
+			    (location != KFD_IOCTL_SVM_LOCATION_UNDEFINED &&
+			     location != prange->preferred_loc)) {
+				location = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
+				get_preferred_loc = false;
+			} else {
+				location = prange->preferred_loc;
+			}
+		}
+		if (get_prefetch_loc) {
+			if (prange->prefetch_loc ==
+					KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
+			    (prefetch_loc != KFD_IOCTL_SVM_LOCATION_UNDEFINED &&
+			     prefetch_loc != prange->prefetch_loc)) {
+				prefetch_loc = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
+				get_prefetch_loc = false;
+			} else {
+				prefetch_loc = prange->prefetch_loc;
+			}
+		}
+		if (get_accessible) {
+			bitmap_and(bitmap_access, bitmap_access,
+				   prange->bitmap_access, MAX_GPU_INSTANCE);
+			bitmap_and(bitmap_aip, bitmap_aip,
+				   prange->bitmap_aip, MAX_GPU_INSTANCE);
+		}
+		if (get_flags)
+			flags &= prange->flags;
+
+		if (get_granularity && prange->granularity < granularity)
+			granularity = prange->granularity;
+
+		node = next;
+	}
+fill_values:
+	svms_unlock(svms);
+
+	for (i = 0; i < nattr; i++) {
+		switch (attrs[i].type) {
+		case KFD_IOCTL_SVM_ATTR_PREFERRED_LOC:
+			attrs[i].value = location;
+			break;
+		case KFD_IOCTL_SVM_ATTR_PREFETCH_LOC:
+			attrs[i].value = prefetch_loc;
+			break;
+		case KFD_IOCTL_SVM_ATTR_ACCESS:
+			gpuidx = kfd_process_gpuidx_from_gpuid(p,
+							       attrs[i].value);
+			if (gpuidx < 0) {
+				pr_debug("invalid gpuid %x\n", attrs[i].value);
+				return -EINVAL;
+			}
+			if (test_bit(gpuidx, bitmap_access))
+				attrs[i].type = KFD_IOCTL_SVM_ATTR_ACCESS;
+			else if (test_bit(gpuidx, bitmap_aip))
+				attrs[i].type =
+					KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE;
+			else
+				attrs[i].type = KFD_IOCTL_SVM_ATTR_NO_ACCESS;
+			break;
+		case KFD_IOCTL_SVM_ATTR_SET_FLAGS:
+			attrs[i].value = flags;
+			break;
+		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
+			attrs[i].value = (uint32_t)granularity;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
@@ -594,6 +762,9 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	case KFD_IOCTL_SVM_OP_SET_ATTR:
 		r = svm_range_set_attr(p, start, size, nattrs, attrs);
 		break;
+	case KFD_IOCTL_SVM_OP_GET_ATTR:
+		r = svm_range_get_attr(p, start, size, nattrs, attrs);
+		break;
 	default:
 		r = EINVAL;
 		break;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
