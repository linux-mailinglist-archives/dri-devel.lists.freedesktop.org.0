Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DC343EFE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32FF6E0EB;
	Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175A89913;
 Mon, 22 Mar 2021 11:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO4ZkuK8zW1a7p1pomtsdTwrMbxip30E1/tFAfBumzcr7iVUjWtroKU+N8GmRtAJwFUEAV6LX5WXy+R2I/2w+mpQMF41o5IHnwxn1mqyAxBN9TaTy0hN+8alIHfwclUROrWuCA5rXhjSRviTZkpLe4B62YKeg8kc44jxqp/xmTW/RO3/339J7mYv26zo0EhA2wlmWRWFnpUZv/tPuFf9YYfSOyhgC4/oJGGinqI03ehyZNAj0FGMXVWjzmXNIeSWKNfnaIvDJw65wd1FvtGCqw+12hRcB51SCQ4/11t0u1A+0hdZqpuPFpB6iG49kJD/nGl0fvqJZ96GhAqxfdN1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cqQogQFUFI9BGZRrMAVqWmQffzi1fIhustsKCYW2mk=;
 b=RIhz08kxo6BVW5TIHC9RKGNtta62c6xbMIhlNaJqye2+gUv6Qw6GlhjklDuPrfPfojD9Cdl2djG+eUuUiOnf07ONYWBwrQRuQKg11peMJEMPVV9zKldOaGlfiKGWJYbqU09v6ohegKMY9pR0hLg+G7PPWTN9KCscrzsFNYEEaExHP0dKBGPW8rlRxFx2T0Zz2fWThIL6KjST4mq0vW0BdlG5EImtc2q/iS5vERW1zMM6gfyVdFEz6kJ5LxM0RJ6iebZDkf3kOJnD8ljjts4ZSjKuuMzurnknnZ2Yk5VDJVgQWrmmyFDelwih0OUxeC/PshwMC1NRiiET2jcWvIvaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cqQogQFUFI9BGZRrMAVqWmQffzi1fIhustsKCYW2mk=;
 b=ByN2GCJH9teq+yeNDtRoDzmXSyX3PjJmTCfGUZjeVGFvvMwui5myRTzAqlkvNjbohTkRWmGS6yEcrH0e+gTnIatsAv9LOEvh1+JZbxRAkJZZG0o4uRws3nyRcj2d429qd4BGMXjNvwUJLuhPh959KiJtNRl7j13wVey7/rHz0z8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:32 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:32 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/44] drm/amdkfd: add svm ioctl GET_ATTR op
Date: Mon, 22 Mar 2021 06:58:21 -0400
Message-Id: <20210322105900.14068-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 628f10ee-257d-42c2-a238-08d8ed22b09a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678E369E02B49D58C9DFD3792659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KfWlrj0zMPIwwq9OVI6Jj9TGlsyaXZ/8XYdqmnNxdcLtwgipW4696IK8txXGj5A0mpVNf0hi/b+hk3a5llKAQdq3vpk6oIWMG/0Z2pvpIp1SBW01mWqtUCs8oy9jhzUPxorFKRbaXp81cw7QSDs0JRtdJf23eFWItTnnY+6F7M53iXHqYJtcXqUfnAcIM6/MRjYa2lDim4dmUauhaa8xZ8Py2K2czUWv2bxzxdOC7xxmced3sbT+B6FIIGBl1NjN7j2mtoJuJIgR1MqhwNzbKcIMcxrPbgNbhhVziB2aJf/AnoxU4GhxaBl+z/njGOZqRt3LFep4/o88vRRsSLZK7VGAYCOowYtOm/z9xeNBxeXI0WFhlnOS8b177+Poypcga1cNQI2U/Py4JQUYdhPKr3xUVSy5ZAnKzW5X2edJma3nJjSvuFhY0Du3XXYqIU2l1Ro/GEhFC4KNbVjJeaipmR0JD/XtahrXLEaDiMc9oNzCp8fW9f5XmvW4EFNNrrZ9TMYPsxbiSrFjvzmeWHqz9d9wJLevzTfJ7e8VEGIkofH10+tC9S5ZnAmynUktIyutM9pjbpDT8pLky8Ee39CY/Q1iDZ1d+Tkr23IVx052xm1h8aXxG6mSL7DCXsmIAXnYUiCKpi+uDmxVtn3JClJgFPOtuSlYoqXa7xTIeuDpay8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(54906003)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gohQfFUlW0N58mV0idS2bsmOcIb0FF63xZaDH9xMug2AMxeucmMzyWQ25b4E?=
 =?us-ascii?Q?vov4Oy0jixJ7WprFL2sePshQ18mkTOoJZrFf/yupt+APVIKCcI50vEHNtb3/?=
 =?us-ascii?Q?S2lmla2pw8zj1d8I56tsEkqigx9ZwIH4Ve77brC+Rcc3RA+6OmARE32H910c?=
 =?us-ascii?Q?rXcfPtKgDhGCYrrILZA10RbJct8aCK0Cg/6QFv5pXwRM1P8Lc8jDrWZxMdV2?=
 =?us-ascii?Q?/wkNGeasPuSo3AQ4zFZz+RUfABtCID0Qr1+vMUgQ52fOXgsRBWnCEmrDkp6F?=
 =?us-ascii?Q?D7/NV/VfzLwfcXK6VHPgJOZapTgJFg82QMJrmjbkKahDalnskwJ109ei9LFp?=
 =?us-ascii?Q?T2sh5i2y26vI3ozds5zR0nzp+eal801MyJljSraNkg2M3xCv8JfTArKRsjvE?=
 =?us-ascii?Q?6hxDdKFXLQLHZcBKNwdPrBjv60g2JkPXHnn9YtujWqZMZZCf9Zv5KT0CZhpv?=
 =?us-ascii?Q?SYS79fxm03saObWPgy5bFJdPvUcjJSQhtszmcZJoI4Y8w4GDL6kMnXoAH30s?=
 =?us-ascii?Q?2sV1stbIS1rCKm8jtk8jP+5/aSnFSQB+UkBWkzieX67sdFxZZ7iCQLhUgPqY?=
 =?us-ascii?Q?u/DaQC7EDswCtBSMruUadadU0fkshlY6BtDOMjkrJOVQtcQp4D8GqbPmiACt?=
 =?us-ascii?Q?CG/cPiqFwjhPsFCrwByt9SZAhAirhj8xVtQLl/zeCucb8GKcU6yy/2HTttd3?=
 =?us-ascii?Q?9Ws//LKgjh2K39XdDmVFHn1KFXrFGAUE9wBCrtwYVgtf5ocd/8V737eNWW8S?=
 =?us-ascii?Q?NJ8UDJKMEOb/nggabir8T7KVKL6Tw2dfZGt7mUMD32DsKLyHySjDWMz6/6xo?=
 =?us-ascii?Q?ZBfY6Ez2TIO9MREDyy0sEtOFGDwVrxbd3PhktJQPUeekrokj9p9NuTn83HvP?=
 =?us-ascii?Q?ouxnsWDD/XRnsVECFsGgtrtXY8reUYJgdZzWLBYMRS8/dmA9NvLRDZco8mdI?=
 =?us-ascii?Q?zvXTj5TEOo73fTSP71CiGJNiV7wnpOzQs0cBfnHE9sXs76/4MZmRaFS4Rrxg?=
 =?us-ascii?Q?L6xv7YnJuVMxJA576YHI0rQdwWyOsq4E4a1JENOhnj88t7fn2QzY3hMc8O9k?=
 =?us-ascii?Q?HIYyEPs4Jg/VYeIuFrOuxvj5ricFcqLgpz8wEqhXBo7HkuKMpIb+Q/c6uPho?=
 =?us-ascii?Q?RTyDnSCc4Dre5YYSeDp7pYSjvIxAo51LLGI2RCKC//bQxRz4AkwqX/n9jwGy?=
 =?us-ascii?Q?l08WwagWBbNWBZMOUBzEtkE0tNHp3Ni9jD5dcgG4bHHe6XA+pyfgS5adoVK+?=
 =?us-ascii?Q?YTP4I9hH0zE5vNHua2JrErSvVwGP9iwgsDVF+2KQNu58BM4lML+TdzD7accO?=
 =?us-ascii?Q?cumIIFaNB4aoyIhsqHwjkzZB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628f10ee-257d-42c2-a238-08d8ed22b09a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:32.2760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lrauoga0+oQQFnWg0V8zpAp+mCyGi4MTDMY+dUUN6+7T7VDOtUdI9ADLxaJZZfLVyYbxRorj+PpNt9nP8Qzxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
index 22f942bb2b0c..e57103a9025e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -769,6 +769,167 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
@@ -782,6 +943,9 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
