Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A378835FF44
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9316E995;
	Thu, 15 Apr 2021 01:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2046E98F;
 Thu, 15 Apr 2021 01:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKkCo4IrMSQvACbLf1DgR4imFbC/A6eeukX9USGs8qDT5t9Auur0VRXTdT1Scy9JeLnmthQduUhe4Cs2T+6K5FK5TPcPus19D305DBixCPxk1OqMDyf8jOmvslIhZWYUkJwiKXtOetJYjc9M+/wpgBT3xnz+TT6BZUWblEnhtyhCeP8KW6xbqqlkI4aRJxyB45PlTU9P/yGZDQYXszL2ciszCE3b9xBAimDr4TTRcv7B3hjhz18/PeGTDz6JEsTM4fQmieWeVXB0BHTEoRPlhqkfts1hCaV1RnyrWXhjL3vIgMk8wsicDpIBM83a/7vO6IF6GrEKMztgKkeIfArlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNV/CC9pDnkmpMEunOri10pdj0ABB70OZ+buCmvTM9w=;
 b=WxtMEl7ZEsCcDVy5ujw5nBxwwjhjJPFNUFPSSXei2SMGj5QqaMxVipITzkGeArpXpaYv+JjEppXjoR77SnCCT77zy9UafJdwaQwPj21hXOQw6eyheyKrlPyYrNZb1yCvkqf1rcwtqFEiMwMjr7k4UAvKIDoZHO0Ng17bV9a7Ra+IQntr8CzlkvwevHd3WKsi1PKuv4zPabITR+p/4Sy1M8BzlfzZwAjsdzVoPFhBTv+d+N4fJDvBUwlhtsfjd8y02fC2Vn7kx+woPoOkbMy6A77NptNB8TIJxYAKqHqpg6Ry33UbWJvJkOllhP6xRRshDF+VGBh7ZJgumncd5Ww4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNV/CC9pDnkmpMEunOri10pdj0ABB70OZ+buCmvTM9w=;
 b=ZsxBKMCg6BtRNlucbVISP3L7qFtyfQT+xqJ6SsthoQGD0OURfpx90DeHhcccDjXSe32N9JYCbZQJkQO76CCBJHDntbjV41rcDaEoLDAr8Q2Fvkhi539cMxHSVf1ilCnP2rlztBYbg55kmysDzIYi3qM80QjlpOu7Qd9ZTENoD8U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/34] drm/amdkfd: add svm ioctl GET_ATTR op
Date: Wed, 14 Apr 2021 21:23:07 -0400
Message-Id: <20210415012337.1755-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:23:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb331153-5020-4d94-0758-08d8ffad23d1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839E9686444D8D1087F0AA4924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQ5JyiCJg8B1iSfkAReOK0C/ElM4Xsu/RftHaLo4eRtSfjY5orqqhnNXbQzsmnOJZXAtHNKcrFu63GQNmaIEwCpzdSagFEDMBrOhv6C+s0/W5EzH+P3C8AR7q9my9icaat2hWVWeUmBhSSXI8CzSjqjaV9sl1UwEpYXe5RzTFAryaZSUDfBBOpUGGRd1sHAjDgjRg1g3VqdvImaBavjBpkCxJnutuXq1dM5izxEPOJxjSPwUWh8XHugbYTv/nw8lTB5WScji3hXdKzFGnBLSCSZcDuMIxAh+if2q26sTnvmn+xAph5qaUu11aq3umtIVFcOjQ//2+s0T2j2ENT6Gh8/mcH+JY8eE3O4738wtz15vgSeFPXuG4m8RvewjrmSAOwGrV5xIenUDxXScsHxTLv/cXSKAbpEVje6SIfK+0KLz2dVUR8U4rnhE1TSTERULITiF26M5Mxf6aT1ZyjJpfLOSLtTPvqAR8C0oyinnhZS2SqGSgJWguJ16h+F53EyvpS47rJGbp3ns9XRNTNMNCzy9rtk/T4W7QSWk2OKbZz008GYOwHFQOcLPwv/Al+d4mz//4HLzEHnLIm8tWcAbJuILaNJzR9qMUlJC/l09MlkA6J/U+0sTwYhamhfeGmKj7UW941sI82k7xfmNFiqvan1GP6cH3O3qmWil2lvBf0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(54906003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nQd8S45dPmPAhyobas2v25v+qT7otUSrZYz2LlSSF8zdq14bGGr1+OyEnpxF?=
 =?us-ascii?Q?xLuqf+joqcORrEaKC6sU56zQj9prPQXw9/1uiEyedk7k5m9T2BoBOtn4Ph+X?=
 =?us-ascii?Q?9iJEa2cvRMMBw8V2H1Gylv8OFDpdXq7oKaEicmOi0xEmrgYBJ2cInpw5rg+S?=
 =?us-ascii?Q?fO3FaEBOAdilWMW0i8RGr5DcNp69jMbp8jf+3Ket0ieQcok6bU3IlobQ4O6W?=
 =?us-ascii?Q?oXqa1GQTmdNBmTq/DDKPunfasTZNgp/WLtEcr2eHowndQ2OWYFHeec+BDhVZ?=
 =?us-ascii?Q?9H+ASRiR4cL3PJigPmL2gW0jGaK002X1XermE10+7rVrEv6jJej5XOzpxQG5?=
 =?us-ascii?Q?zX4+PEwl+QJCYNzPOBxznkAfck29v/rDdXi4kHjFkxfQIX9g1rali3C01M4c?=
 =?us-ascii?Q?C8cIXlFw9mSdVXqi8+NkukSYQA+sXCDoiQVMZzv5qkeuISoeEke3v41zbslw?=
 =?us-ascii?Q?YPfdT2vyxH13dsBBpcmED01rtIeExn1UA9oz9gP2kPThwMpDpkgTbCvoA8PA?=
 =?us-ascii?Q?m4Ngvdede6vmtyqvzITabg6zs7C81aXfFbM/qL20/AWb+p157w5wECvO0cOy?=
 =?us-ascii?Q?5Dap96utATbZiqLkYOUoqAK1hqiQPxNiKpWb5OHnuTHurBliGBIpjSuWKQTM?=
 =?us-ascii?Q?1ez/TpVpk/yp1UfDj+NeRfo32KnRDp+4vqtkptgpUxHoT9E9ldv/RuOVrR8x?=
 =?us-ascii?Q?w3MgEyyZg68Ux9UFxxQ7QlDfD9+yaMSZX7Xceuv4PUpwf+ejX3h7jr/ogCN3?=
 =?us-ascii?Q?fqA751F+CgfLTdjQq1OJx1wuQcXg2FP4bH33hssC4H7dgHHOLx5F1Y9NN2e5?=
 =?us-ascii?Q?cHN/LDzm5/5uPD8T0ffKo3xqVFBXtg0P6fm8il0D0nrMy3u47j92Iqj6wzp6?=
 =?us-ascii?Q?s7/n6tfaP92udfEOQHA2FtjaCKJEBA06UJzi3rUDL5HcOwIOjKQ+i/RxwW5c?=
 =?us-ascii?Q?f2RbQUl13/NqjxM8VOdKcMWjI4puOMajyIfyLWL3IKZ05wO6Omc1RG2zfPtu?=
 =?us-ascii?Q?gd59D54xwfBhNoib1Sr0QLtw0d1g7O7uanvLaJiftudjJMQeO0W1O8yfe6TF?=
 =?us-ascii?Q?wqJ+LxHkGOwthj0DWHi2ZPU0aUa2xWWLOMAjFMWqyKEn9fjxHuEEHpgfwAB3?=
 =?us-ascii?Q?BfzEdEqJhPIQeYin2dGJG1tq6to+GnqJe06JCpr3KQku68z6B3jSx8vpt1+L?=
 =?us-ascii?Q?EafZfSbJfp/KBLWdFJj97dzvFwWWSq9VbfBNpO1dEACi3FwYyhrTUV1hkcd6?=
 =?us-ascii?Q?WV3pACae5Y7IMC30HYipD7sel2x04cCw7DR6h+9ax7LFPBaCXdtP0SmxHZNJ?=
 =?us-ascii?Q?G8VIwAnxZQy4Gfb453XTsMjp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb331153-5020-4d94-0758-08d8ffad23d1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:56.9356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGUq60ToJOvJmqqOgKNlZoqX8a24LP50Wlt8zz2TryM8C9dF9quhv2oWuxOOE8gWe5eLLZuJCaIn0P7dq9immg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
index f56f463dd0f4..8f147fa4ff94 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -706,6 +706,167 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
@@ -719,6 +880,9 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
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
