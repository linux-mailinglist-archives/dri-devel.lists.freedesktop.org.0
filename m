Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DEA37BFF2
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08809899F0;
	Wed, 12 May 2021 14:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBBA6E079;
 Wed, 12 May 2021 14:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS5RAF8o5mrHr9N1fu1aZIRQlgsHFjuMpUIBEpCrTafHH6nTO8iNwazNVupEyg+Z79D/+vSIsGu1m3r89fX5I+IhbXULVTQsE8yrYarkAxW+1TubW0UWEKVGjd0vCSk0x8/vwne6mIBAgjx5Bre4g34nZZMXl3SCN7m/A8EBNTCGj1rKQxHEbstf8M9Ad3DlIsyDmL7I6eaAkxxvLyz49g1hMBkjVZRV/n84qQdene3obYb18Z+X/gezj4Dsf9Ocjha/tixq1AJEBlhSxvtjlgz+WxH1wKqpxSTPXaXJtZZBeIGqQgQK1IkiQGYqvfGb0lDNLUmxBUJMEFOLCaS5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8CHomDLolHWYr6vXq3Rl7552WLkWchm5KRWiP0lHhI=;
 b=UnSgnzomTf/Uvl8LCWJAF8oEo6eEBA2sO2x7SFtS+1vI38X8KndCis4hf+v2rz13xOEuArVcKgmGjyDg7tzpvYROY48YaJrsr1TvqcGdHlj0DHP0Ol8OYKIBhWaFXj+uHr3OOWuAX7BOqPX30Ar3J4Zh96GUUSyR6cbB9JH76PCp4Xz5pG8B04he4T/9t7NWzxZ1g3Vg6ruhQEtJI2JJtyAAUC1N7q7aKYmIQ8mV4VjQvBX2Ox/uGerxuwYaDpVySADtxMYKEzD5Jfbhl8EzAisehQqPxEt2uwHU7Pfcal9xQoVndpsMf+9l50cfyz9FZPTHrfFlLwhh4MNp37ksHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8CHomDLolHWYr6vXq3Rl7552WLkWchm5KRWiP0lHhI=;
 b=MElGLQMI/LtmlnN1NF/t0kC4QD2NtiXxqxBhhdrWOULFfbiK/fsH5vywCJ685aaQBjt0ddVTOZunL924TRgNF+B1JIKxnwfAAp8Ax8pB4f67XlfCPp3P96c9nupCsSkrFzmVvbK6Jmii7DgxrgSBhb2h7Tf6DW4vqTPAqLFgGEI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:07 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 01/16] drm/ttm: Remap all page faults to per process dummy
 page.
Date: Wed, 12 May 2021 10:26:33 -0400
Message-Id: <20210512142648.666476-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 975d7753-45e7-4525-b5b4-08d915520562
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576B7E47A621593392FF689EA529@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etRnEnff2z2ZPq+iDnCEn6lAqBYiED72ykSUMSeOX/aYUCJF4AXk1i7ykQgIsxkTepOwTquWwDGKf+7gqXiiAmZFoh49JBzhWijeuHaYXs9j5M9Pdw8gE6pO/Vfi6JOIvRg4JlR7xOJYo21sighKrL9ljmXzzdaPV8RTV8O+nHFNqPwSQZCjc707IhmJ5T/nuRYKQ6xcpUBjLTl8RFOYqQdwbQAw2PWRF1Kapok7nkTydnEqN1Sia66E58Or1L26RD+Wvz2c2Enbe6/hmqtesE0dSeWSFO+9xYMS5X1W0B/olq/7nCsFiP+yEKg6ZdMlUancXt5HV8oNKKgi7V/g5bieXor0dO94Nt1NMCs46ilMNak0U2D0hajIf8hGl2lU9G5jIjhxSjMvqY3Z3o1r9jF7WPK1qMnLZULUQkhOPeWUz3Mvslrjb5k6ZmWb73Q6BxqXpgObxJOjyPUyD6vyKCHDZ23CLSTvb6azTT12DzCCzIcddZGMgWrEWYfCfIPHMpxnRcBQNp8q3h17H+gkE5A5E9eqcpEb1nBccJwtWHOWETJzwhc1xobe7lRJbu62JehEKdbBieOlnN4v8hgQuDf7qCR8Fs99MWQT6m2A0NQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(66574015)(38100700002)(5660300002)(1076003)(6666004)(186003)(316002)(16526019)(8676002)(83380400001)(66476007)(2906002)(6636002)(86362001)(52116002)(36756003)(54906003)(2616005)(66946007)(66556008)(8936002)(6512007)(6506007)(44832011)(478600001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTcvWktXN3FmMlJHMWYweVZOTlFvaS80L0NSdkdGRkhPdlVJaVRWeWt0clY2?=
 =?utf-8?B?OWExRFViUFR0WmYvaUxOTDFDcWh2cm5aamhVaXg3am5ranJUTTNMaCtXdXpo?=
 =?utf-8?B?aFh1QXJSanpJUW9qb1QralFTQmlWVzhKMVErLzdLUFFKbE5rb0Zyc2FaK01C?=
 =?utf-8?B?djcyd1VacFJDYS9uTk42YXBwK2FiV2RhbzlQNm8rWDNWVmE0d1pGSDZmTDA2?=
 =?utf-8?B?TE9JS2cvRXpJZStnNU5Gd2xuZ09EbmxLMnEyR1RVV2w0S0ExbzBWbkIvclll?=
 =?utf-8?B?eEprdndxem9Sa2F1R1Q5aXU1M0JmeGg4MUdUUDZ4ekNjc0M4NzFVM1djVnB3?=
 =?utf-8?B?bWZYMUlMUzF3bUFHazhMdktLcHlFaEpjWUphckVpZGVVazJjWkE5V1BweFU1?=
 =?utf-8?B?NlZUZVh3ekQ2b0hudWtCc1pUU3RWTjVXN2VJT2RKZXEyUnp3cHd6amtKRnlV?=
 =?utf-8?B?UWdqWk9IMXVxQ0l0R3VrVmNCczFvWkJyMndEamh0NVRaUld0ZHgyM2V5ZCtq?=
 =?utf-8?B?cU5oNmt2WFV0YUg5TXNFMFlod1pQQUpVSVRrVEtSbVR4aG9QVE4wVDZGQXdH?=
 =?utf-8?B?TVhBZUZjUk5GV2sxVkQ0MXhHK1Z0R0Q2S0orSkRpbDF2K3dTbEJRWkZocENX?=
 =?utf-8?B?cWNlWWZIb0tWR0JRSHNIY3dXT3FQUmNOSHpjQjYrOUltMWRmQ2pCMGZSWGVE?=
 =?utf-8?B?TGJiaEZ4eUw4U0xKdjhybkhPdFVmVDJJY1Z0cTBDUUxpdkU5TDBHTXBKWHNZ?=
 =?utf-8?B?a1BCRURmMmQxMGtFSzlLa1pYYWs3TzBZNllEUGxSS1NKOVA1d1RxSjFIdUxJ?=
 =?utf-8?B?YzBwemZTUkprc0tRalRSMEVBMFF2Rk9GQjFMZ3RtQitGenU0Nll2K3k1N3N1?=
 =?utf-8?B?T3UzM0FOL0pZeTRTOFZGZ2EyK0ZEYzJDWURoSUhNWFp6MEcxOTMyUnJzbUJW?=
 =?utf-8?B?cXRhOGpxS002ZSs4U1crTTVLVlNuUmtUdzNYNm91V255cXBXOXlCaE9FQ25B?=
 =?utf-8?B?L2Z1ejJzOUdKMGVkMU9HTXd4M1ZvUUFDL1lqN21RbmRjTUJqZzlhdC9vd0hM?=
 =?utf-8?B?bTRnYzBYZVVidlJ6aDV2bkdRVGZCSVRYVWNZSnhvQWpORnYrb1VNYmtia25W?=
 =?utf-8?B?TTR3R3ZGZ1VnVkJuVHFQNmM4OVhYcFAzVmdwcXpaS0h1YTJsS3RXZjdMdHRT?=
 =?utf-8?B?dnp3azF1dkh5bTZ3SnpxcHpnbXRBMEtFcmZCNHNFRWpzK3VZeXNicWk0MWRP?=
 =?utf-8?B?TTNVN2VUSG1COUpwZWdFcFRSYmloNld1cHRBWXlyK05xMTZDQmZBTFRiclFO?=
 =?utf-8?B?S2xGWnh3REdtQ2d4SEh1UUtid1VoVnNQUDZXM0k4ZFo3QlozbkN3cWMvRFNW?=
 =?utf-8?B?aXNXOU1GdklLQlpZVkxYam1xdFBCcC8reFAzK0FkKzhGL2diSGR6dE9LdkZx?=
 =?utf-8?B?Y2k0cGhIblhPZmFxSFg1dno0YVQ0NHpraUh6dnZyR1dLYWVDdXRjSXYvUkxY?=
 =?utf-8?B?aW9pa0NKcW5vOUFoL0w1Z3hNQ2g4MUNudVF5bThRWGNwcnJvSWdsWjFqdkMv?=
 =?utf-8?B?dUYyZmg2WFg1OVVEYlNQcnArL2s0aVhtN2tjNm5GM0w2eXYvMjJKbVNHL0Z5?=
 =?utf-8?B?QnA1NG9xc3VyTTBXMExkZXpENGFENkh0Rk9yU0hRd3V3Z1pRZVFBOWJGRTZ2?=
 =?utf-8?B?c3RFa0lJNzhPaFBDbVEyRWFuMGZENEtZUWg3TExJaFBXUEdTSk0xL1NUN1pQ?=
 =?utf-8?B?Sjd3dGlzY2tmZDlKT2pBMTNJVG0reHpCT3NTOXNRY1NaNmx1UUVTaUcxTjE3?=
 =?utf-8?B?dXJvd0NJd3hRK0FqdW05K2diM0FDcE42YUszRm1hemNMWGFpcHVyRHd6L2Nj?=
 =?utf-8?Q?Wxc41HIjO5NKi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975d7753-45e7-4525-b5b4-08d915520562
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:07.3141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdMMo6DCYooIsq5NApc7PlP9izUHeDiqnCKOpVX2DIKb/wqPVcJw6nG6c0ALf9FFAfw0mi0nZ+dKFtSvgDfsrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On device removal reroute all CPU mappings to dummy page.

v3:
Remove loop to find DRM file and instead access it
by vma->vm_file->private_data. Move dummy page installation
into a separate function.

v4:
Map the entire BOs VA space into on demand allocated dummy page
on the first fault for that BO.

v5: Remove duplicate return.

v6: Polish ttm_bo_vm_dummy_page, remove superfluous code.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 54 ++++++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo_api.h    |  2 ++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b31b18058965..7ff9fd551357 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -34,6 +34,8 @@
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/drm_vma_manager.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
 #include <linux/mm.h>
 #include <linux/pfn_t.h>
 #include <linux/rbtree.h>
@@ -380,19 +382,69 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
 
+static void ttm_bo_release_dummy_page(struct drm_device *dev, void *res)
+{
+	struct page *dummy_page = (struct page *)res;
+
+	__free_page(dummy_page);
+}
+
+vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct ttm_buffer_object *bo = vma->vm_private_data;
+	struct drm_device *ddev = bo->base.dev;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	unsigned long address;
+	unsigned long pfn;
+	struct page *page;
+
+	/* Allocate new dummy page to map all the VA range in this VMA to it*/
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!page)
+		return VM_FAULT_OOM;
+
+	/* Set the page to be freed using drmm release action */
+	if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, page))
+		return VM_FAULT_OOM;
+
+	pfn = page_to_pfn(page);
+
+	/* Prefault the entire VMA range right away to avoid further faults */
+	for (address = vma->vm_start; address < vma->vm_end; address += PAGE_SIZE) {
+
+		if (vma->vm_flags & VM_MIXEDMAP)
+			ret = vmf_insert_mixed_prot(vma, address,
+						    __pfn_to_pfn_t(pfn, PFN_DEV),
+						    prot);
+		else
+			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_vm_dummy_page);
+
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
+	struct drm_device *ddev = bo->base.dev;
 	vm_fault_t ret;
+	int idx;
 
 	ret = ttm_bo_vm_reserve(bo, vmf);
 	if (ret)
 		return ret;
 
 	prot = vma->vm_page_prot;
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	if (drm_dev_enter(ddev, &idx)) {
+		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+		drm_dev_exit(idx);
+	} else {
+		ret = ttm_bo_vm_dummy_page(vmf, prot);
+	}
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 639521880c29..254ede97f8e3 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -620,4 +620,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
 bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
 
+vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
+
 #endif
-- 
2.25.1

