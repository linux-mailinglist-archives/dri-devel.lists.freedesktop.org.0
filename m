Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82B379405
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412886E8A9;
	Mon, 10 May 2021 16:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5D06E88B;
 Mon, 10 May 2021 16:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv+1MnRWnMteCZwc4yplDrgqfPyNPSPe+8xu7PfgadEMxK2pzKT5xi9IuYuKCQ+Ubg8S/5fNlkdvZxpXXdaqVhRFFWT24mgm76iukB3UR49yMmeiCvDCfB5QIFB/0U4NjbG9+dmgtNTv5cw8dokTvwSN2fekT+pMvHImzlOAOveasM6LYZ0UUKRIvgeFDCw3aXN3byyoMOAS2fq7DOkJgY4BkEEWDlML+1Sa35wrrHVfXVDJNn1qUiXEU6IIYuUWSp0C6TK2aL3vV/bYsEfsaahvfHPMIL1XjwLJtWTuCIRa11oWJnvoFoYrtx7GWgeOujDcE4xB1n+Voy69KVZmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG9hxNn2BX9GkWOFWtKfFZQJq6AU3DE2aXsSC0AMjT4=;
 b=c9ZjCwlX8iNH1StIr5yks4dq/UVAmTqH55xdxygmOGugzG2i1FswbCrfGgMp9IlVSgKeRRMNkN5s1Jum61Z7Mfrfo1355cxmP6b+fbZnntsV5g4Vd1cRb4kurvb19guQgfNBjvOGoCzruIglpHNKvwmpzPIZ6Bnr5EQLVNpvyPeJOsuJeAFzyWgzx8hgzor4DzksbUyasx7OoRGCH6FMo6+hE9Pnkz7/sX7GrLTfkW252c9EBlQjSN+e7KXRGdXWXhl5xrQ8w5pOFWrulGubGqci33ZiwVq02j5uMXWDbMaSg5NvZfZTKqFIek9f6CcCy1jpCd1thnMJJS7U/jMisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG9hxNn2BX9GkWOFWtKfFZQJq6AU3DE2aXsSC0AMjT4=;
 b=aXXEHFZBqDgWwUbsTKHkZFkKlO9fv2h8vPXg2q5qQCBT0uxpbcbXoOe1eQYmyP4k8Qk6AdIf4p9+xY4fVNlyzIM0T9nBv2yuj2ZUZp22/pgrWQjPS9tfPG2HBFO4ph70bWpq4gYEVY4ce9xYkfXO7XNULtPC51ndkS9It0YiG04=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:43 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:43 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 01/16] drm/ttm: Remap all page faults to per process dummy
 page.
Date: Mon, 10 May 2021 12:36:10 -0400
Message-Id: <20210510163625.407105-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1335a1e4-36ba-4dba-2763-08d913d1cbc0
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462E04E3BA57757F6BEEBF6EA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xa49JixO2HyZhn/YFsiz1JAdN8GXcTMH8zwC0lJTSZVVHTVBcK6h9jp9Vsj/psb+STTqioj2JECxYKM9jGRLvLiqAqfz8wxX64GBife7181T1fyAg3goTA2Cey+Zu7kXCo1OYH1yKRWhBNX9NhlTPjYf7ItJShVSBJWOGcSY4V4Px1MxZ2vI97mUAygxlCXoBlpdXclo7ZxmyR1rnwj9A4lpFaaCR0d6sos5vySVffdSttVLcEguKyDnPa/O2H7SDyPXMieWOdy0W/S+ZZQu6x+Yu1cqMog0aVFlfDp7jSX7h9/gfd4WHyOevx22Huq2K8NBEq9YawJOg2r2jJmZMUjR3K9NGYntMKLPy9a8tMOcg9mD6p2vGA3to9X5zFrAtYUEzLfaiDnmdyIWt+69niuyWFUH/DdAI1O7By4rkP8UraWmlbkHJiWmVDUZaFlHEK/mIV/F4/6Fj2F4MPXx//9reCoiOKIuX9kyMHWgJACUv/WfjZ/8RSYSfpe6+6QRm38Zb6cofkCy4yQGVu+Nm+4LxxclNCfHsNhWR0/ieWsLD61Hfeey+emLx+y3qusUL7Jk+RRfb5+cCoFg4h3yQnVKXXwbuySYYC6sqOwDBoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(66946007)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CTZ1QAS1hUwICbdgwHg6EJwQVrfYz5pGwiiFpLoGXHfwwxY1QeE6GLyQl9to?=
 =?us-ascii?Q?tOP08i6OVkIVixaGQbb0fTkLncLhnQ2VK683DiSFhtMQsTBt4351opQ1acKf?=
 =?us-ascii?Q?dT2XMNoiRylqJ6iY+v4EU5WjrMJxO1H1jamjIawDgwMYANpBg1CpCJLKJndR?=
 =?us-ascii?Q?TcT/VKw3ollP4zweR6yzHxztoIBjcGMParKhpX9jet9sC46IxhVCQ9PiG0aM?=
 =?us-ascii?Q?4AP+Bg9/vaBe4Cq0w3mS3z5ujK09ImMWyNjmkHEl8nb2v3HFtPfbejuQPzWQ?=
 =?us-ascii?Q?bnftXlRj90dGJHhBQw6sRysMm0bM0/3USazOW3X6y45vICzcVrS6xKAQIYA1?=
 =?us-ascii?Q?0kieDVfsqoTfXx/hhjJ/j52qeC9oaEHRYnDgP8vduAZrccw0SuwCe2ABjf5/?=
 =?us-ascii?Q?dYgiEX5d61c0ZhRkpUPHoe8bfRf8WXGuFOC5vubh+kUd/fg3EzMI3j4AC4Gy?=
 =?us-ascii?Q?FMuZPz6QznHhK8hQS1CcEsnAt/+9DgGjni2Fcdxx8KqTI2POjM4aY/FKiPYX?=
 =?us-ascii?Q?YB1EOPnm+m0xHuIhZJeTmRY98EVnVNqw+9SXjCSX3QPrObvfIoTvgOMlYcbh?=
 =?us-ascii?Q?3JS72sML2tL4hD382baWBcjwDay/xGZhEsjtb5ldxe1s5UgkgMwJFv3RK0IQ?=
 =?us-ascii?Q?RpXY6Ei1WylByqcty6I1zOHuF6r2xd9l/EE6OXS5sYXG867nlFaCDLCOOlKz?=
 =?us-ascii?Q?VknPY0ueltqmG8JOBImrcBu67vA247gBvXqW/BUJKJGdAkM58juRtB/7SZbm?=
 =?us-ascii?Q?UX8Sb7gEiwAGmMd6hvo8byGwIpUVLZuhZ8iUzTBaHsxYthlztElVjhouBSVd?=
 =?us-ascii?Q?uQVS5axmP9wdF697dhRsK+dwVgIK7BmeywAeEepEg5lyEy1W8blnpkLPXszx?=
 =?us-ascii?Q?8NcqOhZkjlJI4r1DYh9DZZZvVwlM11N+Bz502JNA3la01/w1Iifk0Diz1S0p?=
 =?us-ascii?Q?JuUVeyUpONDqTyLj11bKM55KR5eWNIPXubL8ytteCQSXC3jeUEseR6fjySrQ?=
 =?us-ascii?Q?eVB7tLmQ2EDbN0Z5P3KeYz8am6JXeDYWwyLuoCdiwwYylcFoSXDumNuqVvlH?=
 =?us-ascii?Q?axMz+J1k7ltheYAFYPxLSReTvOMWdFMS2zQ2EUHIbpoKMCt2Y0VsRwG3RHE1?=
 =?us-ascii?Q?7TfNUIxyG+7OfMUfM4CpwyD/ocf8h8ZuVg36E7ecynSN5Lh9ETUhg9xB3roF?=
 =?us-ascii?Q?g7EaEllenyAUGd98NwTY7mss6WNedkI1rndl1+XSBpBd47FBLXhwKLj9XrAA?=
 =?us-ascii?Q?tIRwVsVddiuGtMJBlgTx8yE5FHEc3c5mcPlzg/7zVfx3HLMUIa/34Ekxu2cS?=
 =?us-ascii?Q?9Quhp45nu0OF7n+6U23ujPC0wIYylAcev0JapDuUdDGfmMXPnv9gPSpffgA0?=
 =?us-ascii?Q?lOpg05AAYrMuNFCfUjiSfSpFi0KX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1335a1e4-36ba-4dba-2763-08d913d1cbc0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:43.8465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXBVsxul2R5Kj0vjqikQvLrfjP3SLadrsPLHvTNrbEodEOsBZvIinsOYqKsdJGeG0egX3LpsG62qkYw0UUzgQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
 Alexander.Deucher@amd.com
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

v6: Polish ttm_bo_vm_dummy_page, remove superflous code.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 57 ++++++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo_api.h    |  2 ++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b31b18058965..e5a9615519d1 100644
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
@@ -380,19 +382,72 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
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
+	pfn = page_to_pfn(page);
+
+	/* Prefault the entire VMA range right away to avoid further faults */
+	for (address = vma->vm_start; address < vma->vm_end; address += PAGE_SIZE) {
+
+		if (unlikely(address >= vma->vm_end))
+			break;
+
+		if (vma->vm_flags & VM_MIXEDMAP)
+			ret = vmf_insert_mixed_prot(vma, address,
+						    __pfn_to_pfn_t(pfn, PFN_DEV),
+						    prot);
+		else
+			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
+	}
+
+	/* Set the page to be freed using drmm release action */
+	if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, page))
+		return VM_FAULT_OOM;
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

