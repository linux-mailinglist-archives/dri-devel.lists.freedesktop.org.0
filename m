Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E0350D9E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AF86EC22;
	Thu,  1 Apr 2021 04:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D916EC1E;
 Thu,  1 Apr 2021 04:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw6Wg/LF2Fd9ax1E/4lto9L5Jg0Rgld5hb5v/tEt/9+WJsQLxtzFZzROBULFQM9lV7pJQMtwOFry3ohnQu2MhU4QqdYCuIb0IqGYjRMxxx9FbNsTRJaJcZMtKLGD7G8yWoC3AAXsnUb7InB8hykAx4F6tbGa65f5xe8KZ+I4pMxMXA/d/Jdc1E/u82R4fMvUExs1Dldj1k51I0+71gUrgHr79abCekkj92VIZyGXDo/HnU/khy+VK2mWknkWBmo9r7RUwTjm/PtXhN2xaIBBufsEzqQDI3rFvSSlIB47L07+dliQ2Ufg6Ak1rrLyOAHoQxCX0JvOn7OHWjpyibxhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9oLgY6c28l+da5qhncOoNKfqzhkjoftPp8iQSQLZGk=;
 b=PiwUG4ipAMe0V5IPATczwXgUhfY9FBEyuCV5Ya25QsXGeSYJhL27Dool5/ioUlKAUhczl/p6P8CwEDG/u/zyn4l4qYGPXjbX0hTCI7EnfCeoq6UEjDK6m1moaMVm2oY+cE5evWhmTb95IqCcQ+ifxD6eyP+1RHxTLqsWNVwyc21WZTZGIHYkhGyNzelWu//224oBG39MgoSF42siZAhVK20Rfiq3r22swZMSlZ8IEP4ne0AKRtyuJtyWYthe4Y7Z/AEmhG/uWkuCH811GR4DQs/aUV8afF0D27PT48GRhiZG96uDV0yPxFpVJYwiG9aKDThTMTyY88nN0UbPLkbTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9oLgY6c28l+da5qhncOoNKfqzhkjoftPp8iQSQLZGk=;
 b=pauVrrFJj93v4knIGPjdR0q/1UMp2AJSoo52khwsvI+mymlaTCPa80ZfGCqS8emPFEIf9bKxp/LUuf3U8Q3aJnkbBXCIh7Om6PRk1nS3sQRiSMaj8zOPOUQH31qFY2SbKfen7ypMtlB2dD4QnxHS10724/HCgma/kN+wGZ4jL/g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:45 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:45 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/34] drm/amdkfd: add svm ioctl GET_ATTR op
Date: Thu,  1 Apr 2021 00:21:58 -0400
Message-Id: <20210401042228.1423-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a7f2f2-835b-491f-f2c8-08d8f4c5ccae
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916B6CD1919908D8FFB090B927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPaKfUfLN0TsJKlkjCZsBSHqlkZQXovHqVfXQDXmrU448MygL+As1dTKlbYzdv5h+T0f/QRcrAdAC+dZ/+8pl9mU6QjDoHKdoK3IZd9mYjY3qZwRv5TNl/Y68pUZ5PINBLk6HqCWqUfnLWrgq9seV6hi8jVDkez9xFxItDMe+ZLYcaDYXPr/XQlLp9Sm54xw5+Lbl1deG9YA2J0d1nrLEErI0evt2bMqNgjtkSQdeVqRfy4f2+oPaB8czQfujOEBGN5mV2etVblPoZWp73p3Dr3WqB1Agd8K3KIT/k5Kz9cmp8ibIY0ep5cWHoCOFYCXDgHSM6/WSCHBT0LE2juND6bNHyHDecjRI6185U7fh+WQdYcK9xZx1/CYp0wtLVAWQHh69ezB7xJLfzox/ESDGUaVaZq/ECZcu6SaC4xtlwX6VhYHeHLxMdHTDWJvgUCx+DE7XQfNaDxvA/OSGaVBeIBy9muaWOQei32jRz9vT/yPJQqNhEKqU6t8Rup1FMoltbj8Djjr5YFWskCAqm4EbBdNwKbDj90pqhyA9OOV/4IekMsJp5lSG0KmY1WmFuFHSSc3/isQwdqxYWt349oba0BjfAeY6fF+eVJ46eIvLQAZvf/61wat2k++2Eu0pBmXAzeaksS/OpO+g0Li77eYRceh1hsygL4YUtUzRWk5JuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(54906003)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eUbtBGkbMDc0Mx2AlSxpMiqmiH4hMmKcFiPOIkvPQ6+dkqEViZokon5AEh+6?=
 =?us-ascii?Q?I7ipKhehbJlmRpXednzOS62OhQoJQwblW42WgZXrn0+HskWtqYqKNR3fBUFv?=
 =?us-ascii?Q?v+jIu8pk39uNST3vwbzaSPWuZpBHVCcgKvK+oArj21nEscUL6YI3PvnGw7rQ?=
 =?us-ascii?Q?eFfMK6fYFmqKh8exJFaxAyInQpGH/Yd5Ev0Ja2Oweiu8bAJn9pOKI1ztskh7?=
 =?us-ascii?Q?wehEgaZ7aIXAlkbv8D+0PiAcDz4q6Bb216KVJdBsywYlscKlaQtz0w41ga/c?=
 =?us-ascii?Q?SX08hpIR5mfUAyTMd712SPz5uDroIGq6f+qShT6rNF8AZlByX9x1gkNUJmmW?=
 =?us-ascii?Q?jaXGyea9sA7hNFbV9/t3I8XVEN3dH1YvkdjClGlZLoGLdFnzvXfSR/dMvZTu?=
 =?us-ascii?Q?7dpSOdjs+xtS9UEYHW3xxIPPUy4YnPuC+bm171pKqCEIe8awzxk0PkG/YEb/?=
 =?us-ascii?Q?BzdxMQsg1GQbZ2t7DKJiOwM35KKFvyscuPF7I08sslB/I/EjnPh04Wz81p1Q?=
 =?us-ascii?Q?qrSaUJa0V2DIK7msucEYN6CHAFSWoN+hL7bJtv0cDEQYJLVrwioP3Kex/PWK?=
 =?us-ascii?Q?pCHdemAIKXKPQigQb2C/nPjWrAKpvjhyv/JmWNs1ULjirFYR2VfuPZtqH6qZ?=
 =?us-ascii?Q?7UedUhZOtn2KOggdeEpZ/Yci3okdS4v7NQ67+X2g1jhDGUo43DQlu0J9AsGZ?=
 =?us-ascii?Q?qtGEN00kYnST57IYn8TONmoGHYgZ+4ri4tz6APP89HpX1h/qifTKjf9R1oVR?=
 =?us-ascii?Q?mRJt7Rr6hTl1o8gdYNq6NcxgKRavezrYK1uGnjrmbAKUD+d+9jP0HUKtlmus?=
 =?us-ascii?Q?i5P0c8wrKxN/FCZYcmdodw6cNV4erv3hjEunrI4vyGhJkkolc3OuBpROGetg?=
 =?us-ascii?Q?kIv3jvpjV4yFOU2jPEntr5zRLRjgtFkKFSU8NICIiYnMGEJlImvU/uH1h65F?=
 =?us-ascii?Q?uNNOPegFF0p8EtTciJsMKYztoCjUtOYW4zbFr6vX/4oQi0hltCidzb9ct4kh?=
 =?us-ascii?Q?4mN1T+IDXICHLBgd/5IDH6GxhGob5taa8k7YYT1AIhD3hWEz3CXM901VddwS?=
 =?us-ascii?Q?mtir0fS7GfYWqPToS1/LUmg7DOsNzG11XVAVyPi1V1dOHc0tJt02UyOwkmWv?=
 =?us-ascii?Q?SGUc2Wc+T2bZEJrXxUWW7dFu2A74ugcSxPYL/LvkVTP7lgbnERmRwhUiONR9?=
 =?us-ascii?Q?uo+TJNxiwNm0KBwxOEP5mjiac5Blc3+lHNy5KwM5xRDLj3+LdeA2sDCqpO80?=
 =?us-ascii?Q?fvNfLxl2SozJYSozlorIAPW9KWjgPFKUsR/nACIjdMuc1etOd/YVyxLGngmS?=
 =?us-ascii?Q?YUIW7SIoslGAqg2zgS/zbD/n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a7f2f2-835b-491f-f2c8-08d8f4c5ccae
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:45.6082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRTDYeOZdRBDYLKs0Mkx1WY+nIbltagyHntWc5Wa3+048nZCarqlAbwa2WNJRlb4UerOCTk7FwKSxyi6i8iAHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 164 +++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 21e6a7959bc7..de62265adeaa 100644
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
