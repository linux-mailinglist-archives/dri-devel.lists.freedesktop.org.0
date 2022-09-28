Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 575A85EDC30
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19510E49C;
	Wed, 28 Sep 2022 12:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148510E479;
 Wed, 28 Sep 2022 12:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHEJEguBzni4ePR19CqTEzuBHAUbpRCCcwEWokqc0/W3ldxS4h25d2v5e+El0zNcwZIhgHRczaM04sZbEWUsG5NOrSsr1IhzqEL7fuK830apCsF035z3nOu3tVrgpFXti/N9KPXA6Ca+yBTuZA0HG8X3GaL1HlSk9Qu/sNFoVqcDh6iZXX/jeJy/I1YKdzAC+IrhTCTp8TuYwuitnknL48D/SSu+7Y3+hltDBDy86TpN0RH0yWOrfBfKPvYjJqK06YyvZz1JqmLj7ZREhcT8D2Zx43HgBYgq4qfoK9BkaoAfxtSad9OXY69uN3lr5d+tvDe5A03HWx0KM85AQoI7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXSzlgttX5rlmCnLMM95a+/kiNZ2711zyubrbhwBCVg=;
 b=QU1+wfxi7c4P4Yv59a41Jxt242PiFZxnamyP6CBAn4qciit1W5wrxM6bRPyB8Szprz+4ps0WTcziDHcXbkGKrsi+kltkQELaH5DVYPEBnIA5+5SRuIlF7SNcoF6cyIjy9j9hnIE9EX4NgQfX66pNdLsCRj/XSqWWtChbTS1xPzAdLlUG7iv0UHk+d6F8Itx8ZJ0s+o9nO8QaPlTkC6sVrwQ6kBasOK06CCBW8pIfyLuB8p09E3nojWEcwOPrANu3ww1EyyPRug9abc58qCACbwzTx9ZUL2IAjmLQzve8v5iPUczsW+DVjWB2gYe+ocXlpqIGZf3fOWnHhxORMq6Ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXSzlgttX5rlmCnLMM95a+/kiNZ2711zyubrbhwBCVg=;
 b=KmHfUXuDo5U9QmYKzLJtrNeOLXZ5teMa8v8Cqx0faaRhoY0uIWaRLpto/KxsR72r6XcaRh0FnRq0RhYsMjBqEVLdiFbVUoJp1mqTu2BB0QZXgSZAnysnRoOv4XpX1UhA1u0LKYG2+bpstfrRCV/TAtf1PBNKd2uKNmQbKzb8dz/2e33laJlBAYK9DoizLr3UXqkvbi1YsyzTeBrbLwDQ3GCq4sRyVWp1p3tWTBLw5ofdEQC7YIikPdEvv4WriVcIeX+ueAOxfZ+z0CaNaJ04m2lWMB9KU2TbaEHhPpb1PftsAYh8qVuSKRvub1GXwH+l13tN9KuBaNgUaI7g2AsFSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:01:50 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:01:50 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 2/8] mm: Free device private pages have zero refcount
Date: Wed, 28 Sep 2022 22:01:16 +1000
Message-Id: <cf70cf6f8c0bdb8aaebdbfb0d790aea4c683c3c6.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0085.ausprd01.prod.outlook.com
 (2603:10c6:10:110::18) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: 45404f4b-7570-49e7-ff4e-08daa14939f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2AQERJpNRRRHCGU79grVWkpGdxmjaYr/4QkPsUsOvZy3bjRvEXvEjpdlzfBGcfWzvpLKMIuAZO5JyfSxELZ9ttRi9YgrLpQA6jabh279eKAoInxoYRSrY6vtNjU/YLHCl89dTioEX19ZtSE+Bzviee382GfN7Abyqpxl2sL+dbXXziBJLmTT1nq1vr1tUG/J9pj19mNEWeALLLwoDOlPrFRus/kB1eXY3pzm4zN0qbsh2WVpoGC8GKBHyeAbE2zNt7M3lUkTmUmrNwSXCSthfzpK8TEqmesW/a5arpxtroIJofKkbBzmRp13bcb1pclf0fQnkbbeDPqkxozQm79rWm1buYW5pVXBy5LOfSup2tFDX+shGoLZtMSHnveaUnLMm58uNUOzSHEON36i49vSjbVm1dRKueoOVCWu9irlY0QEcuWdPApvo6pBRjQxa96t5FpOwml9crmd9of0scplGyGwDDR848szKdcmJ3lA89n8C3dMzJkZP3lPt91W/gQTYo4CFmrvzUH4cAiYLdGWvwPs+TNpHNgfv1kdrd7Mk76Uzs1AILfNeNj07DDYjShg+3/MXPes3DMAskJT6RXmXieAmOF0on7UDN71HkM4krOa96JjIXwjxcC/2wzpsO5l2FdmOQkJdtYS1r5PMoLupF2LNSYKb9VF14nSLeqINzZkfPiApfjOFyMENnWjBRs26Jm9d0ED1V/e9/QfizfuoDmnTQVH8+Zyny+SBXX6CVSDvmb2rv5Pv0jd7laydVVM5bAf5CgiYq1s917Kd7lWoQvvJBzJDpeZfK4YbP4r8C8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(86362001)(36756003)(2906002)(2616005)(6506007)(7416002)(6666004)(6512007)(26005)(38100700002)(83380400001)(66574015)(54906003)(316002)(186003)(966005)(8936002)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0VKSWRFVEd1Mk9CR0NFeHBZUUZ4UUZidFRqLzUvQmxFeXpOR3E1SWs3UVFH?=
 =?utf-8?B?NFloVjR4WXZsSU9OUHFXNlg0eFBpZXNsVE1JZVNLWjFCQXRLQ1M2djBsaDFW?=
 =?utf-8?B?VUhaU2gzRXNBbEVvVFQzZTJVVjkxcWQwcEYwYW00TDM2Q3lVekc3Zm9NREZU?=
 =?utf-8?B?NklLYzB4Y2JaZWZZM1VJSjlmcFNsR3VBR3FEa0dIZ0V0dFIrdFo1cFc3RExl?=
 =?utf-8?B?WjRiZnpwYVpGelhOd0tEZ0JBS1U5a0piRHFTNTZ6STRQQXJUZWR4TGxFcnZk?=
 =?utf-8?B?WDNoeGV6MHpGQkl6b3B4NDdoYldERjN6WU1NbmFPS1NxYytGd0ZhY3gvU0Nu?=
 =?utf-8?B?R3gyTjNzNFY2NTE1bG9lUUtXNnB2RFkvREY0NGI5UFVCeUM1cTRKZ1p3RHFU?=
 =?utf-8?B?bGIyS2tKNG1yVEM4TktmQStha1ZhbmxpaUpaSUY0SGhlZlVaRTVaRW9WUHNU?=
 =?utf-8?B?VkN6TTlMdnEvQTNSQkxJWGV2TE5acEZJNUV5MVNXNDNJMTQveEdyMFpHc011?=
 =?utf-8?B?YjhPU1pyd2dMaCs1ZXJpR0VmMjJBUVpzbjkwMmdiU0sxVnRTa0JBRGZQMTNK?=
 =?utf-8?B?Mm5vUEhRcmxkNW45b0l0c25BVVhqMFhLcXlDZ1N5Z3dmRTN4SkhQMHo1aHhk?=
 =?utf-8?B?dHE2T0pwdkVKSitpK21YZFZOUG45VFpoQTBCRVVqTzdQWlBCa05xNFVXWFNm?=
 =?utf-8?B?SW1iVEgrSTBxMzgyWFl0Qk9jSlAxaEZNM0NUMFh4VlBNcmtkb2dpZUxjVzY2?=
 =?utf-8?B?OFpsbWR0Y3NoY2JWaTlGZjl0d2hmcURuZWJycTEzK25RaWxVOXkwaEZSd3Nl?=
 =?utf-8?B?WHRXQ1FhNS81YXVSQ3R1YzUybHJFOWI1dHdiVUJzeEpMeENPQ2JCc0NJUU9x?=
 =?utf-8?B?QnJzMzFTazZ6eGtzQ1dVZWl3VU05eGl2S2wrZ3djVGFlM3hHMmVNR0FPNW5h?=
 =?utf-8?B?bHFWcWpGNWE3MDBIK0Zwd0JTOVp3NnliRUlUbEpqVlhGU3p5emgyUVI4aTd1?=
 =?utf-8?B?a3ZNUmZXcDkzeWwzWFdlbDNlbXB1UXJJWXk5MEdBcmJncWxadmVLdFZ3VUJq?=
 =?utf-8?B?dDEzUk4zTmJzTjhRSGNuS3hhajU0MldvemlKSUdsYTFnRzdocFc1Z0JjUnBl?=
 =?utf-8?B?dGtTRWc5NVVqY3dwYWlUQ0tDMXU3OG4zU1dHWm1raTc4RHVhejNmR1pjMmhn?=
 =?utf-8?B?WVFsR0U5MUhMeUR3bTFOUFYwMGtNaFJWdUFPc2sycjNmUE4yd09EaWdvTFZs?=
 =?utf-8?B?aGNnUXc1eDVhYW9SQ3ltYzdFU2N5OThJdzh6NncycWZ1cERtWFV5LzUxMDBN?=
 =?utf-8?B?dmx4OEZtZUJKaUNkZkNuZEU2TzhtWjZRbEJIRzZ4RjJvQWdLK2plaU5qMkRZ?=
 =?utf-8?B?SDdFQnpHY2tWNERvaHZRa2lvRGhielhRRzdSQk1BR0JFT3JHSkV5OHNRMlFF?=
 =?utf-8?B?Q2JlZ1BnNGJtTFI3VTlNbCs2U3ZZcWxlTHBPa1V3R2kxZWNHdnRlRGtNcUNq?=
 =?utf-8?B?bTVKeWd1Yk5BOUU2cVpkRVkyMTVWbExmNjZtZEhzLzdFY3krNS9ZU0liR0ly?=
 =?utf-8?B?WVkzQ2ErMlExdmdtcWRLM3RYcFBYdm9RUTFDRlFPQlBhWUtmZTNlcHN1eHlO?=
 =?utf-8?B?ZWkvSzEzbjRVSzNCZjBZQ2JOcTdUdGtxUW1YUDV3U0M1NHlCMXN1VHBhcU1U?=
 =?utf-8?B?b0ExWlJlWHp2TW16czhJQlgvcVowN3J3REQrSHhBUDVrLzhOaElJMkFTdHZX?=
 =?utf-8?B?ellBNURTd2Z4M1FkdU12Y3NKQ1laOU1hSVZOY0N6S3dicER5VVpha1hGWFUr?=
 =?utf-8?B?TG5xeDZnemdXUll5c2pkaEFBQ1FhTzhjaVFmS3F2ZkhNTUdmSmtkclRUY2pY?=
 =?utf-8?B?T1VPa2xZd1RHNUVrN2xFT0RGeFBURHhPU011TEtkMkJ6ckZJRUtuTWZsaEZE?=
 =?utf-8?B?U3N5TmIzNG93b3FoUXAyQ2pwVXZHZmkvc1M0alVxVGM3ZEpzSmlRNjFxN3lB?=
 =?utf-8?B?V0dyTUgreW1sU0FmMmhCL1ZzVVlYZVpJVFR4aEhkRFVJUkFMa0Z3cTlWWjlJ?=
 =?utf-8?B?T2FiZWFjOUFKbzcvNnBZRFBRYy96VFNjUUtZbnQvM01UUXpOaVAreVVBY0NL?=
 =?utf-8?Q?F/euchmJ4MYyrD+aQU7fbccuR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45404f4b-7570-49e7-ff4e-08daa14939f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:01:50.5122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOqWpQclmsW8U5eqg93LySU3wWOVAMBgMIMXWLyjkSVGLgCGd1D5QtSsjNI+0+chw+ImlZDaX1J94EI4+YS6gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
refcount") device private pages have no longer had an extra reference
count when the page is in use. However before handing them back to the
owning device driver we add an extra reference count such that free
pages have a reference count of one.

This makes it difficult to tell if a page is free or not because both
free and in use pages will have a non-zero refcount. Instead we should
return pages to the drivers page allocator with a zero reference count.
Kernel code can then safely use kernel functions such as
get_page_unless_zero().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>

---

This will conflict with Dan's series to fix reference counts for DAX[1].
At the moment this only makes changes for device private and coherent
pages, however if DAX is fixed to remove the extra refcount then we
should just be able to drop the checks for private/coherent pages and
treat them the same.

[1] - https://lore.kernel.org/linux-mm/166329930818.2786261.6086109734008025807.stgit@dwillia2-xfh.jf.intel.com/
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 include/linux/memremap.h                 |  1 +
 lib/test_hmm.c                           |  2 +-
 mm/memremap.c                            |  9 +++++++++
 mm/page_alloc.c                          |  8 ++++++++
 7 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index d4eacf4..9d8de68 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -718,7 +718,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
-	lock_page(dpage);
+	zone_device_page_init(dpage);
 	return dpage;
 out_clear:
 	spin_lock(&kvmppc_uvmem_bitmap_lock);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 776448b..97a6845 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -223,7 +223,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
-	lock_page(page);
+	zone_device_page_init(page);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 1635661..b092988 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -326,7 +326,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
-	lock_page(page);
+	zone_device_page_init(page);
 	return page;
 }
 
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 1901049..f68bf6d 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -182,6 +182,7 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
+void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 89463ff..688c15d 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -627,8 +627,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 			goto error;
 	}
 
+	zone_device_page_init(dpage);
 	dpage->zone_device_data = rpage;
-	lock_page(dpage);
 	return dpage;
 
 error:
diff --git a/mm/memremap.c b/mm/memremap.c
index 25029a4..1c2c038 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -505,8 +505,17 @@ void free_zone_device_page(struct page *page)
 	/*
 	 * Reset the page count to 1 to prepare for handing out the page again.
 	 */
+	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
+	    page->pgmap->type != MEMORY_DEVICE_COHERENT)
+		set_page_count(page, 1);
+}
+
+void zone_device_page_init(struct page *page)
+{
 	set_page_count(page, 1);
+	lock_page(page);
 }
+EXPORT_SYMBOL_GPL(zone_device_page_init);
 
 #ifdef CONFIG_FS_DAX
 bool __put_devmap_managed_page_refs(struct page *page, int refs)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9d49803..4df1e43 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6744,6 +6744,14 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
 		cond_resched();
 	}
+
+	/*
+	 * ZONE_DEVICE pages are released directly to the driver page allocator
+	 * which will set the page count to 1 when allocating the page.
+	 */
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
+	    pgmap->type == MEMORY_DEVICE_COHERENT)
+		set_page_count(page, 0);
 }
 
 /*
-- 
git-series 0.9.1
