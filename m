Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CBE354A52
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310946E1CF;
	Tue,  6 Apr 2021 01:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93076E1CF;
 Tue,  6 Apr 2021 01:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu1LrtJc/1wjT+eTIyX8rK7hZlPbNct7Ku/fJzLoUYjXTkv45fYSvOcdpXdr7/0lcs4/+vxbNdQtQ1arj8whB44vB0mC/lIhEE76CIR4dhtyMddLMvg8YgS0BKW/Oax2yEZ58+YMdWJKKonloHMhTbWOn7I4rCTM7u8vdnV/tlS0dfwTlTZZx+74ulngaxM8lfwlRBRhZn1af09rQC3lkfsryB+DW0071TXvBDknqtqnWEviHtS6ii4L2PhRinEdDwvfRHY6ponIGk/amIyBUFMm5dX6q96qdXBti7ENUtOYl5tmgbgNVQXJDN1H2wO+GRtls3URkC+hKIn+4BVAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJz3JukYHMXrlk3kdOnvkK1KngdOhzD1h1XPJR9e9B8=;
 b=Sg9icosSHzVnW78wm1fcTgksLm80SnbrsVNBpWsEbsyhxzfdGVYVyN8Nv+0lP/K1YWSzQYIS1rNlyjC0qzMQjLgwsFV8NPNsziCCAOF2hy5HVK3xKwTlEGaFu+P+rLzbZIvoQclVU1LoGi/gzWgP+TNdX4oHjLpNUpAMs/QpsBjCVdBoCsPsJGJZhaLUvSiDeL9OfXrElhVNx0zk1BMTqLqbmI9Iw/7eA0I9dQPiWFdC6bqovKwhmFnkOa7gFTWjwcRIwpytK/COcdyyHBig0aGIPu+GL3PlGkAQ7L+SVVqihiqYW6eLcGxzShu+7pgq5uzEdCmQ/HAU/RBcQmjMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJz3JukYHMXrlk3kdOnvkK1KngdOhzD1h1XPJR9e9B8=;
 b=r7BCIMDAsUY6gjUelWZ2xv3kQDPy7noQgBUIsV8MZyBErg/7BE1pMSBBeUxjUphswadEUoT1yglW3n9Cb5GI3UPmIJQEFWhQxFoymJoQK8gfBWRYfT5WRW5qQWhKwqifM+Gv2uCrFygL6qcjVZ25Vuw/8S65xH1MOR3yjSPbZss=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:55 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:55 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/34] drm/amdkfd: add svm ioctl GET_ATTR op
Date: Mon,  5 Apr 2021 21:45:59 -0400
Message-Id: <20210406014629.25141-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d948d50-61df-4a3a-d316-08d8f89ddba1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB377308CED256B4F68E0C20B492769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3OFSJPhv9udJPLQhLbGhBJyeXBq906wvHdlB6YZRz6EU65Jha/5U3lyXTuuHFJ70cEzux1CnnjzSIMPOUgQdRiQeBMwNb50aOHvMlnAoVUIeD7WQof1KFoh8wjTp/GPfKJEO6z1gQF4LPye9rxcLg+BaonPlRBZm21bXhht/hbyKUJJsKQH0fEX5BT/5nobFiSdUcTTCIOZOef47Mu7qkGB3Ij8kXtIo4bQGxMKqSWeM+OY+fwR2DHdayLtGetaexs3pGwZgeHwliR9U+SHFWh+glhGzauk2H6s0f07LH7jiXz7NXhwUkO6H1s+2Gy9txf52ShHVeVqT6Cb7gAajok6Jv7WjTaFfDsXGKb8atpj/KAaqo9M0pkTX0LzxhtTThBYsTcibbdZ9K7pTHgUlIJ4NEHqfqel/Uh1c8YEBh4icG13GD996Za5jb9sVlSkuvWsLiF2/R3wctnZ2Zd5RW/JOrC3ZHcPI5xz1zvdDD9CdIsNyolNNOqAisPPfbkSpmIxZyIGny3qAbIYCyq6ZW8GcOGsIaFk1Eig8rkWcD4Q5cigoOCHU64lMgFeSJC6OQaNeizr7AzmW7lf0rPcnedBs45wpYR/j3IfWiPmdpm0Q4k548D0HQARn2yZtkxK+Lvy2Bh5jW2h6i8auQXOi3+oE8iMlrbIcm76H8CZtLiN7eKYEG89ld6t/Lg1+Nzs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(54906003)(4326008)(956004)(2616005)(38100700001)(83380400001)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+yyEL1qnU1QmhburVNMVj/HFKEhyc1MDWIfT/oj2W95GLFy0RZ7JR9n9IeSQ?=
 =?us-ascii?Q?DOGDWM6C2Byvw4FKzUlULJiiOHSfxDRlY4goVXHNGg/SKSS8bRw4LfYf2X1R?=
 =?us-ascii?Q?6DPx6t03an+dQIbB7pJTBlZ1+mstOlTNEZvwddaX9CrftsRgttDD2j61n/92?=
 =?us-ascii?Q?6mts60i6ZqVKaleMw7301SVG3NAywdQ7FICP16dbMgM4BrfoG5oPC2upYowi?=
 =?us-ascii?Q?dhTgFx6odcJexD34hKA0zvaZSw01LHCJ839CURnN+9xDOkg6LezFa9Q1UqrH?=
 =?us-ascii?Q?R3Sp/Ub97x0Vj/0spkczP/0kBnqZTOp7Dkvq3Z6BtwtOmpRBR/hUUngRhvDi?=
 =?us-ascii?Q?7zHFeg0CEzW+ISsNWQuIsA2+7Owm8nFXBzgHid+yRHjIDlHHzt7A1BrBFUQh?=
 =?us-ascii?Q?uRdkOp8KZGEWHAZAmVJJpDBRVdIeYZytgwoX3T/x3dc1h7c9ZCSiN62zcfHa?=
 =?us-ascii?Q?doXhfKoYwl/tWrW2sSV98L1aYcQ3IVQRkudYdsTgNot2gX78KQhqpP1Ecpyf?=
 =?us-ascii?Q?i1BYRduAHwS6BAGafKnEub4pLfg00Hh/Hfl2T98IJwDKUmJ65CPKJFFzj9EG?=
 =?us-ascii?Q?ei24wp7ftSK717z5KiSFn2UViFnVg73BZDmGzqWEzbXBsegaWv9CBY3bq1sE?=
 =?us-ascii?Q?6dE98HJkSs2gmEzhHMmZUg3RCkmdMorEG0vOF8fZdbFxa3BMsaBzLhte7Q2z?=
 =?us-ascii?Q?d3j0s2X4dCZ2CNbzVK+pBdQtHO7UH+n+/Ya8PHmTkJWuj9mGh3BDUJaU+IMB?=
 =?us-ascii?Q?aFYIymsl5clCrH9IwB1ArhyEHqkNKmuFKLzRJT1Pz9RIg9jgRLYOKsVD3wfH?=
 =?us-ascii?Q?M+ejNa+/NbpUdOe2HvcEeF7cDOMjc3JHt+WLZ0A6jDDu9j8il7pMRQhAEYx+?=
 =?us-ascii?Q?h+5BKTmU1/8Dgp/JJa4gFYp2oFdQpkP0w0H/8yIP2zF+LLKlS5evTrGRuRsG?=
 =?us-ascii?Q?tjkLJ55Mis053YKOvE981gWda/+Ma82YLmKjLkgc9/yyf4piQWJSnNmJ1xhW?=
 =?us-ascii?Q?N9kyhIRJa5U2lA4dai2Jnp/9nSi+Me18u3t8J2FNYqGi+Lj0fjWgNlgQwmrb?=
 =?us-ascii?Q?n9hUlYYYGagecX1Yl6tQYQv+L4NruEDIzweKu6UcFCotjyAx8HIM7o7C1XBi?=
 =?us-ascii?Q?6dl2fesbRCAoRYwHvCJ/6Unm72Vjv5RtDsDsV8Gxb7g0w3fnuKlVA7uGrkj5?=
 =?us-ascii?Q?25wNaHY8fEre9HXt3czLPL+f456FuEp3yaTYQRF/lTunzRZhy4DbWComVJXj?=
 =?us-ascii?Q?y/c4FH85pfqueASJWGeO5s79RdgnIvUfv33rIWjczzPCv9/K8X9WXk27Cbcu?=
 =?us-ascii?Q?W4R1WWBxdZQCJTfkR7sFFFCd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d948d50-61df-4a3a-d316-08d8f89ddba1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:55.2837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGYdLef8iae+hMEviNU9vsZinWKWPSYC56+PzsHyRN4RbQi5dCAedhPT0U5Fj3YvJd+50EczQGetohwKBTTGDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Get the intersection of attributes over all memory in the given
range

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 164 +++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index cdde477a0b25..1d99f2f0cb31 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -707,6 +707,167 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
+	mutex_lock(&svms->lock);
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
+	mutex_unlock(&svms->lock);
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
@@ -720,6 +881,9 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
