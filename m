Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD443B79C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 18:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493189ABE;
	Tue, 26 Oct 2021 16:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4F889ABE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKuTZ9SdIqfvmRb2WWjZ7QScaLWQoyAARcNrDzqNa7ZVlUrajd0tUxFL5cM9QAK0ByYVP6PKVOxqQzgunevEkFP5VBLASDU4x57W4FcHFjTeOPJhYDqYxGW+bHkx/oyDJ0p0Rj8+D6O0dymkvp+AxwLcUmbxyo1I/zMBiVGjQ8fez08QEpS0mWThQOj5xxMTyn0vkVZzF0dldCTWF/Ptgs+0nQsf89J+yAWPdixssFocDkfILBnEBq09Z+nm34Dsw7FfRPJqWWd7RxBuANyxiAyoK+BfYr/TGhE5/31KPLyJQrM3EoaeO+WJo5TcrgxS94Vlma2rot/kD1yrPzszeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gUoZjvbz2lHSNeaQzkQceRpb3xtquK9W4vgG7jqllo=;
 b=lHu/uaC64qRaaWtNf2RRD6RsyuHX/4EepwQe4rxxCQgo0Q3xRlcqNMpGRMTbaAZRSRqhio+M0phr7sGP1DOLXt+sjRNAOAqCTdN0LWm+0UKqb/c7aQeSd6D2dNFfllJLT2WwpBS3H8ItT9t/sjW7BagAxlyevTlBJScoR1aKOcTjIr4mq/c9aCrLZOguS+5SxBA6su1IgtLW6b7QQwWy52/V7DZjNdUcEWPzcvP7JOgDsDqeBaQK3BiDdvuOj+ZYpZFHhLCBPqiPXcPHYXxqpL5QIXfbSHt2TcWLBIY+8OK3ntIXGYKC9p21OvkiXYC//jnLaNpP9DIr1qfLKNtNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gUoZjvbz2lHSNeaQzkQceRpb3xtquK9W4vgG7jqllo=;
 b=Iy1kprlr5UChlQ0acxz0vcyKqfoANTsRljXVaVNMeFW9ieSz/4hGgfMGQ/38KYOB5WOHc1GfUcNXWK2G9IO+eZza9Etdej9+GOslOqGsv/18SngsFNhVeZ6fIwJsHLxLeEnPDNQkFrTxQe1d4IuPhs2PyQossCREjTvDdpoJtxmigs0W/A7hX1rzVk7BvruuhD2TyWXy+KKzIfIKIVVycHifMazI1HFqfUngvDi70C86gT8phHeSaHAIez59BKYvj+O2cUaR/PSN0AhqKYbnx29715inHOtAM3dw7vkC8bNPXMc213hQGCkC5S6jLF1Vq4B+9jylIvJWDSi/iP3jFA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 16:52:40 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 16:52:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: [PATCH drm-fixes v3] drm/ttm: remove ttm_bo_vm_insert_huge()
Date: Tue, 26 Oct 2021 13:52:38 -0300
Message-Id: <0-v3-53c9dd89557a+8df1f-ttm_pmd_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 26 Oct 2021 16:52:39 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mfPgk-0028eT-5P; Tue, 26 Oct 2021 13:52:38 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d818ebc2-1a61-4fa7-9352-08d998a10569
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:
X-Microsoft-Antispam-PRVS: <BL1PR12MB51743EE033D6E63783AFF461C2849@BL1PR12MB5174.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mIuiJyU/LY2TN4xN0NG7o/KQpYju95OtTiyODFbhBgbFdTCHDNcXHPSP3RjKOEyB2vE4DlM6iRz5+11StP/6VlVsqZjywX3i6KaTgLyEGgGo9O/SZcG5r73/BzmC8dgf2KkvbjbNWbTasW4odpQ9arjjfUfc5SconTGny+z/VavK2kR/WoF5CQe7xrmmt761PtImUrJ+jloIR4O10qUBwU92JLkhms5j9Wo5V3CtF07Rmj5Y3aSB0mnCBDwKgUs33EyfAIWiRqIzn4v0an1dHtQ035JiSqtHteswlODusmYTcoVm3jZagUuc8ogkf5VowNSq49DRjXS2CRD/lQ8KQIeKydvtpKByhMvOWOlIaoibSHcSR2f/fSfIkM4n+jkFbqGTdXEbfOSh+zsTNnEVB9ym8ZD8KoIJWGWgr2eLZFb5cG7IJgMKoDLTOlS1z8XUNhzWXaLymicYNVxCLS6QfZX+IbxQ13j792broZFSIR0EObl8KoxFKku2BJnS0LmOhaVH0dX2aR7p4woDQYVHphWngdZbOrkPq13gTR0U0fg7Cqy8znuHWzFKqLpv+HMoVgAhb5mHUKauCN6opsIy8iceVXsUEYjYAKDbuA5Llbh+BU189GQYA4+w9iXFJYRoLYdejZB+6jfG5KKsemtxLOzYBm7iP79t3t95ogC5QujAs1TPalHG19usd4/IzNpN/hMg8ku6iOL+mbl3xFp1wGRZk6kh4IKE7sWmdOuyf31giXi3aloU+4r4kpu36iEdnXLwzfbSbt7dPh/dMQmFYHa47dxiTem5Fx3BQ0hCbeR0bhXTkrj0AyiGarewXGnWncXGT0CN1NKJy/F0EC4NYi1wPo1C9yGHbY/mbla2tEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66556008)(86362001)(66946007)(26005)(66476007)(8676002)(316002)(426003)(30864003)(966005)(83380400001)(5660300002)(38100700002)(66574015)(2616005)(36756003)(508600001)(8936002)(9786002)(110136005)(9746002)(2906002)(4326008)(54906003)(4216001)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUoxbVNjSEZEQ2JzNDVNMUlML1M5M1NGTldONHM5dEovdjh5Vm0vRmM0Ukcw?=
 =?utf-8?B?eE5uVU1pY0VaNUt0aWsxak9hYjJuaTBCMW9ZTHZxQzBzQ0FKeWQyeHdqcEwy?=
 =?utf-8?B?dnVMU2M5dHhEZXhXdGhXN1pPVlh2YldQcENjNlZuUG5ZeXFTMlFaR2RMNk5z?=
 =?utf-8?B?cGVzNzF1WExYY1plY3AvcWR0VDZ0WC9aOERmakZBdVY4UkJ4RzRBUkpKZjQ5?=
 =?utf-8?B?dUs4OS9xT04zTklLK2h3bktNQlJWa0lpbG1JSlJFdE5SaDZ5dWN6TThGYWJZ?=
 =?utf-8?B?M3orcXZmOVVEVVJPMHFVSlhVWW9DUHdwYzF6R3F4N3JUOXdjd0FtdDBFWTUw?=
 =?utf-8?B?b3hNZ01PS1RlUEQzVkpITDJnanlGLzk1NXIzcWtCWU1mTlZkMDhJQUhVSWg5?=
 =?utf-8?B?RmxyZWRWRkZqeWladlpGc3lUWFpOUDIzdXpITEVwblJCTVdPTytXZVhRYXhk?=
 =?utf-8?B?U0R1dk9GVUxqOWVXSm5pakVkeGQ0WXE0b05qbnIwcGhja3l5bEpWWk00UzV5?=
 =?utf-8?B?VVJoYUFhYUluTzgwb3pWeWtacE03ajJ3NCtzbmw2ZWd4a05adTRZRmFib3Fi?=
 =?utf-8?B?Q2pUZnd0R0FEUUV1RVNpdnRRY0x5dXo3bGl3bmk1LzlYYkFYTHNsVTlJVlBo?=
 =?utf-8?B?QkM5NjBEL1MrK2V0VnVjMTFEcDNkV2FPWHJYSzIzYktPYXpmWDFtWWN3cDU2?=
 =?utf-8?B?cTNUekgzVVE2SEtoK3AvT1RJSzNMSlk4dGpSd0V1OVNvWTVuZTJ3bWh1QTlo?=
 =?utf-8?B?cVF2NjFBYzZDK1BaSzFyMm5JN0R2NHE1U2x1ajhNL1dQMEV6WEQ5YlBtR2o1?=
 =?utf-8?B?OE16UnE4T29sb3RGNm1OVkFMSkVIaTJmMkZoMUNaTFVIakNoclZIdWZyQzhi?=
 =?utf-8?B?RFZXb3FlT25nTDB1RVNocFk1U2gwbHZKb2ZRSW9SZk9FK0lid2lBakI3Rkcr?=
 =?utf-8?B?L1UxVVhjczEzZWFENjRZVXlDNmI0TTFPMEhqZFczcmxCZGI2c1NMazVuN1pN?=
 =?utf-8?B?dnN3cmFvL25INVFNMVVnRnd5NHhQR29hdEJhNkJaNXJrQS8zQ2g2ZjQ5Ym9Z?=
 =?utf-8?B?UDg1K2ZFS2p0YS96SG1qODcwMjcyVDR6dGJIMHVVOWJSWlZmbHdxZEVNKzFm?=
 =?utf-8?B?R3VrZ0lMQS9tUnpEUmZFbjhsQThJN2NjNUJoVmJlblYrSzh3VWtoUzVMQWJa?=
 =?utf-8?B?RmVKUWFuUURrSWhNQlMxNXNKdGloajNjKytjbXIwSysybGxmK0RsVEp4aDN0?=
 =?utf-8?B?WEFCZkN2NytMay9CTlZiMkwvMDFEQ1czZ0ovbXFTbm8ydnlyY3ZLSFJ0L29t?=
 =?utf-8?B?emkveFBmMkNzSDdLTXRaMU4vKzFjeWpxVWE1YjdBKzZ0OHJVOWFHZmxyY3Zw?=
 =?utf-8?B?TVBZVHZPTjFKbDcyWWI3Mk1YQnc1cFdGR2I5Q1IxOUsxdHZmQytyRzE1MTFT?=
 =?utf-8?B?Mi9kd210OGhreUkzcytmQkRoRUZPK2prTUZIQUZ6d1hZT3dGTW5VRW5pOEM3?=
 =?utf-8?B?Z3RtRCs1SWdLTWprVFNudGp6bnJFdGlGVnVYWmZFZW0zVEp5OFgrb2ZYbllj?=
 =?utf-8?B?T0tRUjloM3h4aXpRRnJETkZCMGhERUk1QVNIZXJxVEhIQnBUY1plcUV0Uk1x?=
 =?utf-8?B?bjVxNVkwckY5Q1NjQ3BkbTRTZVF4YmhRWktIMWhGc2tSb0lGNHJNbCtkbHpH?=
 =?utf-8?B?bU1wWndYQ0lFNWpOME1JTExqYklpbHgxODRxb0dPYkJZM0dnSXBRRm5JVUdv?=
 =?utf-8?B?ekgvZCtaQ05LWDU4VTZ6MCtSaHBuMEZuNjh0OVZKelFVdDQ5SmFxb2JGcWNv?=
 =?utf-8?B?dlZ3OFQ4R0ZxUm5TQnRpUFNCNlBZT2hPanJxZ04yeVI1TTNMeFFuWlk1OFdw?=
 =?utf-8?B?eGxySW5ZUWdpd1lMZ0xnWFBuTTRPUVYwVFduQlZqSEM1K0tWVEZlQUtIM2l3?=
 =?utf-8?B?QmRBNkFYaGROelVxb2oySkJHSFRxWjVVeXNyK2FiVUgxeFZEN3M2eTg5dzNK?=
 =?utf-8?B?NklJVzQ4TzM1ci9aUHdabVpONTNVNDdSVzJLU0xsa04vS2R6NmNMaFh5a2c5?=
 =?utf-8?B?YXE3RDVlVzBkWG5NWGQ5cWdFZnJ0TUg4SHdHbGVlS3Nid24xOTN1U3N2b2Yx?=
 =?utf-8?Q?SkKQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d818ebc2-1a61-4fa7-9352-08d998a10569
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 16:52:39.9997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE8dkAchLs64q6+kUpALTpBnuJ75naO1yQKKFQLc/MAGU9VZcyePQ5EdEkHINUks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
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

The huge page functionality in TTM does not work safely because PUD and
PMD entries do not have a special bit.

get_user_pages_fast() considers any page that passed pmd_huge() as
usable:

	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
		     pmd_devmap(pmd))) {

And vmf_insert_pfn_pmd_prot() unconditionally sets

	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));

eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.

As such gup_huge_pmd() will try to deref a struct page:

	head = try_grab_compound_head(pmd_page(orig), refs, flags);

and thus crash.

So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().

Thomas further notices that the drivers are not expecting the struct page
to be used by anything - in particular the refcount incr above will cause
them to malfunction. This means even the struct page memory cannot be
used.

Therefore everything about this is not able to fully work correctly
considering GUP_fast. Delete it entirely. It can return someday along with
a proper PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.

Cc: stable@vger.kernel.org
Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 94 +---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 72 +----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |  3 -
 include/drm/ttm/ttm_bo_api.h               |  3 +-
 8 files changed, 7 insertions(+), 175 deletions(-)

Daniel/David, please grab it thanks

v3:
 - Updated commit message
v2: https://lore.kernel.org/r/0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com
 - Remove the entire thing as per Thomas's advice
v1: https://lore.kernel.org/r/0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com

Jason

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d6aa032890ee8b..a1e63ba4c54a59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -61,7 +61,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 		}
 
 		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-						TTM_BO_VM_NUM_PREFAULT, 1);
+						TTM_BO_VM_NUM_PREFAULT);
 
 		 drm_dev_exit(idx);
 	} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 8c2ecc28272322..c89d5964148fd5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
 
 	nouveau_bo_del_io_reserve_lru(bo);
 	prot = vm_get_page_prot(vma->vm_flags);
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
 	nouveau_bo_add_io_reserve_lru(bo);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 458f92a7088797..a36a4f2c76b097 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -61,7 +61,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
 		goto unlock_resv;
 
 	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT, 1);
+				       TTM_BO_VM_NUM_PREFAULT);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		goto unlock_mclk;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861ec..e5af7f9e94b273 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -171,89 +171,6 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_vm_reserve);
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-/**
- * ttm_bo_vm_insert_huge - Insert a pfn for PUD or PMD faults
- * @vmf: Fault data
- * @bo: The buffer object
- * @page_offset: Page offset from bo start
- * @fault_page_size: The size of the fault in pages.
- * @pgprot: The page protections.
- * Does additional checking whether it's possible to insert a PUD or PMD
- * pfn and performs the insertion.
- *
- * Return: VM_FAULT_NOPAGE on successful insertion, VM_FAULT_FALLBACK if
- * a huge fault was not possible, or on insertion error.
- */
-static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
-					struct ttm_buffer_object *bo,
-					pgoff_t page_offset,
-					pgoff_t fault_page_size,
-					pgprot_t pgprot)
-{
-	pgoff_t i;
-	vm_fault_t ret;
-	unsigned long pfn;
-	pfn_t pfnt;
-	struct ttm_tt *ttm = bo->ttm;
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	/* Fault should not cross bo boundary. */
-	page_offset &= ~(fault_page_size - 1);
-	if (page_offset + fault_page_size > bo->resource->num_pages)
-		goto out_fallback;
-
-	if (bo->resource->bus.is_iomem)
-		pfn = ttm_bo_io_mem_pfn(bo, page_offset);
-	else
-		pfn = page_to_pfn(ttm->pages[page_offset]);
-
-	/* pfn must be fault_page_size aligned. */
-	if ((pfn & (fault_page_size - 1)) != 0)
-		goto out_fallback;
-
-	/* Check that memory is contiguous. */
-	if (!bo->resource->bus.is_iomem) {
-		for (i = 1; i < fault_page_size; ++i) {
-			if (page_to_pfn(ttm->pages[page_offset + i]) != pfn + i)
-				goto out_fallback;
-		}
-	} else if (bo->bdev->funcs->io_mem_pfn) {
-		for (i = 1; i < fault_page_size; ++i) {
-			if (ttm_bo_io_mem_pfn(bo, page_offset + i) != pfn + i)
-				goto out_fallback;
-		}
-	}
-
-	pfnt = __pfn_to_pfn_t(pfn, PFN_DEV);
-	if (fault_page_size == (HPAGE_PMD_SIZE >> PAGE_SHIFT))
-		ret = vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	else if (fault_page_size == (HPAGE_PUD_SIZE >> PAGE_SHIFT))
-		ret = vmf_insert_pfn_pud_prot(vmf, pfnt, pgprot, write);
-#endif
-	else
-		WARN_ON_ONCE(ret = VM_FAULT_FALLBACK);
-
-	if (ret != VM_FAULT_NOPAGE)
-		goto out_fallback;
-
-	return VM_FAULT_NOPAGE;
-out_fallback:
-	count_vm_event(THP_FAULT_FALLBACK);
-	return VM_FAULT_FALLBACK;
-}
-#else
-static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
-					struct ttm_buffer_object *bo,
-					pgoff_t page_offset,
-					pgoff_t fault_page_size,
-					pgprot_t pgprot)
-{
-	return VM_FAULT_FALLBACK;
-}
-#endif
-
 /**
  * ttm_bo_vm_fault_reserved - TTM fault helper
  * @vmf: The struct vm_fault given as argument to the fault callback
@@ -261,7 +178,6 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
  * @num_prefault: Maximum number of prefault pages. The caller may want to
  * specify this based on madvice settings and the size of the GPU object
  * backed by the memory.
- * @fault_page_size: The size of the fault in pages.
  *
  * This function inserts one or more page table entries pointing to the
  * memory backing the buffer object, and then returns a return code
@@ -275,8 +191,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
  */
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
-				    pgoff_t num_prefault,
-				    pgoff_t fault_page_size)
+				    pgoff_t num_prefault)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
@@ -327,11 +242,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		prot = pgprot_decrypted(prot);
 	}
 
-	/* We don't prefault on huge faults. Yet. */
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && fault_page_size != 1)
-		return ttm_bo_vm_insert_huge(vmf, bo, page_offset,
-					     fault_page_size, prot);
-
 	/*
 	 * Speculatively prefault a number of pages. Only error on
 	 * first page.
@@ -429,7 +339,7 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 
 	prot = vma->vm_page_prot;
 	if (drm_dev_enter(ddev, &idx)) {
-		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, prot);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index a833751099b559..858aff99a3fe53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1550,10 +1550,6 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
 			pgoff_t start, pgoff_t end);
 vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf);
 vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf);
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
-				enum page_entry_size pe_size);
-#endif
 
 /* Transparent hugepage support - vmwgfx_thp.c */
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index e5a9a5cbd01a7c..922317d1acc8a0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -477,7 +477,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	else
 		prot = vm_get_page_prot(vma->vm_flags);
 
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
@@ -486,73 +486,3 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 
 	return ret;
 }
-
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
-				enum page_entry_size pe_size)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct ttm_buffer_object *bo = (struct ttm_buffer_object *)
-	    vma->vm_private_data;
-	struct vmw_buffer_object *vbo =
-		container_of(bo, struct vmw_buffer_object, base);
-	pgprot_t prot;
-	vm_fault_t ret;
-	pgoff_t fault_page_size;
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	switch (pe_size) {
-	case PE_SIZE_PMD:
-		fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
-		break;
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	case PE_SIZE_PUD:
-		fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
-		break;
-#endif
-	default:
-		WARN_ON_ONCE(1);
-		return VM_FAULT_FALLBACK;
-	}
-
-	/* Always do write dirty-tracking and COW on PTE level. */
-	if (write && (READ_ONCE(vbo->dirty) || is_cow_mapping(vma->vm_flags)))
-		return VM_FAULT_FALLBACK;
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
-
-	if (vbo->dirty) {
-		pgoff_t allowed_prefault;
-		unsigned long page_offset;
-
-		page_offset = vmf->pgoff -
-			drm_vma_node_start(&bo->base.vma_node);
-		if (page_offset >= bo->resource->num_pages ||
-		    vmw_resources_clean(vbo, page_offset,
-					page_offset + PAGE_SIZE,
-					&allowed_prefault)) {
-			ret = VM_FAULT_SIGBUS;
-			goto out_unlock;
-		}
-
-		/*
-		 * Write protect, so we get a new fault on write, and can
-		 * split.
-		 */
-		prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
-	} else {
-		prot = vm_get_page_prot(vma->vm_flags);
-	}
-
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
-
-out_unlock:
-	dma_resv_unlock(bo->base.resv);
-
-	return ret;
-}
-#endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index e6b1f98ec99f09..0a4c340252ec4a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -61,9 +61,6 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 		.fault = vmw_bo_vm_fault,
 		.open = ttm_bo_vm_open,
 		.close = ttm_bo_vm_close,
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-		.huge_fault = vmw_bo_vm_huge_fault,
-#endif
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc6982e..36f7eb9d066395 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -594,8 +594,7 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
-				    pgoff_t num_prefault,
-				    pgoff_t fault_page_size);
+				    pgoff_t num_prefault);
 
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
 

base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.33.0

