Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949403AB728
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3B96E90B;
	Thu, 17 Jun 2021 15:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227D66E90A;
 Thu, 17 Jun 2021 15:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSKbggmrye6E/q9GUQ/zDcrpDQ/a+YL11vIFCpCuNd4gJXRocm9uL0TGzX+S1zUBYBcpsgOdrlsSa9NUcQ6g96aMe47WG1HJWeGGhWHeyqALjjttcDWjuIv2ODrNp1TBcsyeR26ZMYd59Ge/VO1MnB4efFE0UxfjNbVV4Zm1EOFnDBMjlMZmRFm3+M0+oYzszJjgc2KgfaCHHetjPpazHrLN5U6zOSpr8K7yzDGXH/zHdFXTkxkGNOWWXXobms2ZXk3Plfp+EROmSlSlHGvMX2cubEj0KOzHgXI1XQoGDONxfvl9h/bdiNwCTXfAv1gzCkYBXEPteTj64sEqADlzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vTCKBj0SX1TNChLxKKivsBwKkvPBzLKm0hXJsAP19E=;
 b=Wn8C6LfZmutlaFqzexEpn4nc8nD8aH/mV4SkPnn4zu9Qyam+kpFZGMPhWJKkA10NvncH4BzlBO+jBmr3RhROhcBlz4cVk20l6WEi5iq/dE987SJMxuTdVONlWWQRt0sVeM3y/0Xwi3rIkECadNIhQ7mQGqTAYbvVfLWmdVsEF+ORIa5u1wNytyHb6exYe0UmtIQp+Q9SItvNJZ9JE9kgzpz+n1wVFqLnIQw88hzPKWWEbVBTvTrI0y9gO1vAyaMn8ZRBoAEnaZJMTXDJcXVmirpodpurVBM1wFHdPHNAJA8KiU2ZuMXxS8Dq6/CllFKaHJLPeA2pJOcHiH8rO1qrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vTCKBj0SX1TNChLxKKivsBwKkvPBzLKm0hXJsAP19E=;
 b=jjr4v8umTxQMRymeGR7uSYlujzp4StOUaHNPTjyhsxapsWlz+NTR0KOkm6uYnbrc1LqWMMywIvxmU5j0j5dxm+TpYBydqxXLlX6MrVU00/GdApVx+tuPSi7yfpxtp54W1pzfl9xh6UVd3fsI1hz/s+NmFUaUoyuL38owfl1SNdg=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM5PR12MB1595.namprd12.prod.outlook.com (2603:10b6:4:3::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Thu, 17 Jun 2021 15:18:02 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:02 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
Date: Thu, 17 Jun 2021 10:16:57 -0500
Message-Id: <20210617151705.15367-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72caeba3-f7e2-486c-4ea6-08d931a318e3
X-MS-TrafficTypeDiagnostic: DM5PR12MB1595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1595B10E77C185FAF5A3B8C8FD0E9@DM5PR12MB1595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1gtpA4dRdisytZQ5rIHtkym8PFrc/M9UrJ9YptLWGUAwUe4VlD/tfpBflopqII2RyJaEf/od0cBKqzC/avQgDw40Pf53OeREuLe2viHCj3ivs1gxbWuABZUG56Gv0iJg9y6tH1YQWx0EVMElOghLYAqCMiY3wzZbafUnLoYIu54dvi0BzT0D2S54VVeS4bmX33avPpkFurqaG81HlIUjmAR5l9cwUmozTHNd4sSlRpTgA+eINMTkmoc6CssgZ+gixyal0fhxJeBRtQTXBEPe6nnuYbvOc693brIGZ31dOYc+o0OHwIdMCSUnivUPlYPLDIdm4e+TxWJ/BxbTKYeXWLTDc6/lLzbIgoSEGXTgkrI+OcB/FurEBkgpSHxtwq5y8bW/dW/Zo329r3U6gycx6EomZGJYTfp41jIIZcdaAlYgAjmMwa0AbJ+tOuHoYm+oIbJIKvVpXc023ZpZfHNhf/W1b96AS8+BuSmqaYrTKFgdjgWTmIiVgFkHhewbIdl1+FHmCLeTvvY3dCy4MQwQn2hss3cg8JAUDNYYugKIs8GOtmCjYr1TZSrbLOP3F1iFZlUCZYGC6Aj1NJZtkAmfBO2nasUa8flus7A2q+c3wyZZhw94XeGnkVD35KMH2RsrYOahdMJEGuQE5OU5OiD4Ha9Hjv7TJv7FgflzF5pwjv1u54HIJQerR9rzJk3OsIQE5WPzbzb8dfG+TulVGiIao4QeyZ5UMS8Yr+oj5n8C6IxujbsGrXemdqOGqADGJAYbhEUmUqriwAgt5C0vsDkm9RuxkHCPha/44dr27edlTbGDiQZIkvjNY4pywWvsV/AprULHpo5xavKY7dvgthTQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(1076003)(86362001)(966005)(956004)(316002)(66476007)(66556008)(6666004)(36756003)(478600001)(2616005)(44832011)(66946007)(52116002)(7416002)(5660300002)(8936002)(83380400001)(26005)(4326008)(16526019)(6486002)(186003)(2906002)(7696005)(38100700002)(38350700002)(8676002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6G5rVYljCq0uevLEsnVZVc7wR8dXbSLjFi40BL4YzosFBQqufuTw6bXuMA3Y?=
 =?us-ascii?Q?o79S8L5gadZh4Z5vovYug9Wx7dkMgspdpar3CUd9qX9qsBUx8HCBuCUiBPFF?=
 =?us-ascii?Q?VbJ9rTj29HKpAl5SCOVcPUj5AAbHnZ1HKjvDNoHWd3ZIROTYKeW+TN9LHr1d?=
 =?us-ascii?Q?+5OiHGC99up7ERLQszjyKK0/zR6kt21on0Cu++Rqh6yjqJKC9xrIIZexy8LT?=
 =?us-ascii?Q?Vy0h8Nz27e+rc39uyXaG+QW6IxoSlr0wegNgMfyArU2OfouonjqWnUvYZ3zz?=
 =?us-ascii?Q?F48SRPDVHVhwY/wRacBJ3b3F8HuB8pKUpquKtTFwLYMJU+RWNiRs8/AeYfK+?=
 =?us-ascii?Q?p9qdZ4+tRYmqtdBJdkJlUNzdj/yJ68QcwAe9yt0AXMAuCF1pJoblwqnKd0Az?=
 =?us-ascii?Q?O4nt4n2aOmvM6INRbx5B3lajstaFbK5DvNVDcnGM/RXWrnzYKvq407JZZR+T?=
 =?us-ascii?Q?F6JjP+tn4mqTFtx0G77ZfNCr0l9vvcic8y4bbqVzehPekimQ0H+7+6viraZW?=
 =?us-ascii?Q?wI3J/c/P8uj2JjwyOP8FB5CKpqCnAdKDogDJaTpIn+Bdu0AQGrF+sGqHLpVy?=
 =?us-ascii?Q?TT2PbBkadAtlpo/U/K01z3fYoXVK34QFerVLAgYTP/PLi0yUn34m9mrgZPCK?=
 =?us-ascii?Q?r9awVsI0YL9GybXKIg/bgOLCph70qFfFucTKS56PXwuCyGINEUjsuHSRG8ya?=
 =?us-ascii?Q?qMB7AdJ0FCg2D6So0jMZny9Sp3Y2LKaqYC7PH9ShCeFKFeehQ525vBmcH5no?=
 =?us-ascii?Q?MPO1LRNZfHlWZgi2k+g0SeLCm0Kri14tfG7mEICqh8RIWHn50NY1YikJxIwz?=
 =?us-ascii?Q?a56bSiOeDMo1OhcnT4vSPl+8pAMk8+vNsarZ2yOxLAh9d7/9rh4LSfTGmRDr?=
 =?us-ascii?Q?0LjG+Y3U6rv4ZYNuvSDqicbPjyiUc5n4xONyKD13rv4PC8zw1xVKXYV6dBMt?=
 =?us-ascii?Q?yZGz6ZkOfpnLw9ciBnw5LKyEWm4vtcwigNbuAvNz1h8Mqzg1qympvTh73W1z?=
 =?us-ascii?Q?IjfPPZ2nfo0hpksBcaqLDH5gg9ggw3/asA1YAAxUO4ArC8Fgk0CJ/Q9/QkZ1?=
 =?us-ascii?Q?aIZCOz/OcidjhYb99UuX5RvWH8Exe3Nmbgn93RbwYp6IiwB/annaQnZzZHVe?=
 =?us-ascii?Q?CRM1lkmnLaWo7KhPpvSVkez+gQ0Ww9ZXgPbGtJLIo8Bhqx81a5HsgB15ZJxE?=
 =?us-ascii?Q?5lPtLOMqv50G7gKb7E7vsIku6z9uvupfL7jj6/Cm8tKl+XzJWsGNeU/gfVnQ?=
 =?us-ascii?Q?4PLCHmALZeF/u3rEcHZjUlpP35v2wGkXHoBk9cTEvQ65klphoI0X1PacK7/F?=
 =?us-ascii?Q?0WHam9oHNxSZ5KwpG20UKqts?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72caeba3-f7e2-486c-4ea6-08d931a318e3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:01.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn9PGHhZeBfu99+nAbhulrVyHiSf+q56GqQmnKMHVsax4HXvWa4V5+kRd1J1E4GwuR88yt8aYuW6fmv1GKbENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1595
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1:
AMD is building a system architecture for the Frontier supercomputer with a
coherent interconnect between CPUs and GPUs. This hardware architecture allows
the CPUs to coherently access GPU device memory. We have hardware in our labs
and we are working with our partner HPE on the BIOS, firmware and software
for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu driver looks
it up with lookup_resource and registers it with devmap as MEMORY_DEVICE_GENERIC
using devm_memremap_pages.

Now we're trying to migrate data to and from that memory using the migrate_vma_*
helpers so we can support page-based migration in our unified memory allocations,
while also supporting CPU access to those pages.

This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages behave
correctly in the migrate_vma_* helpers. We are looking for feedback about this
approach. If we're close, what's needed to make our patches acceptable upstream?
If we're not close, any suggestions how else to achieve what we are trying to do
(i.e. page migration and coherent CPU access to VRAM)?

This work is based on HMM and our SVM memory manager that was recently upstreamed
to Dave Airlie's drm-next branch
https://lore.kernel.org/dri-devel/20210527205606.2660-6-Felix.Kuehling@amd.com/T/#r996356015e295780eb50453e7dbd5d0d68b47cbc
On top of that we did some rework of our VRAM management for migrations to remove
some incorrect assumptions, allow partially successful migrations and GPU memory
mappings that mix pages in VRAM and system memory.
https://patchwork.kernel.org/project/dri-devel/list/?series=489811

v2:
This patch series version has merged "[RFC PATCH v3 0/2]
mm: remove extra ZONE_DEVICE struct page refcount" patch series made by
Ralph Campbell. It also applies at the top of these series, our changes
to support device generic type in migration_vma helpers.
This has been tested in systems with device memory that has coherent
access by CPU.

Also addresses the following feedback made in v1:
- Isolate in one patch kernel/resource.c modification, based
on Christoph's feedback.
- Add helpers check for generic and private type to avoid
duplicated long lines.

v3:
- Include cover letter from v1
- Rename dax_layout_is_idle_page func to dax_page_unused in patch
ext4/xfs: add page refcount helper

Patches 1-2 Rebased Ralph Campbell's ZONE_DEVICE page refcounting patches
Patches 4-5 are for context to show how we are looking up the SPM 
memory and registering it with devmap.
Patches 3,6-8 are the changes we are trying to upstream or rework to 
make them acceptable upstream.

Alex Sierra (6):
  kernel: resource: lookup_resource as exported symbol
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: generic type as sys mem on migration to ram
  include/linux/mm.h: helpers to check zone device generic type
  mm: add generic type support to migrate_vma helpers
  mm: call pgmap->ops->page_free for DEVICE_GENERIC pages

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 ++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 fs/dax.c                                 |  8 +--
 fs/ext4/inode.c                          |  5 +-
 fs/xfs/xfs_file.c                        |  4 +-
 include/linux/dax.h                      | 10 ++++
 include/linux/memremap.h                 |  7 +--
 include/linux/mm.h                       | 52 +++---------------
 kernel/resource.c                        |  2 +-
 lib/test_hmm.c                           |  2 +-
 mm/internal.h                            |  8 +++
 mm/memremap.c                            | 69 +++++++-----------------
 mm/migrate.c                             | 13 ++---
 mm/page_alloc.c                          |  3 ++
 mm/swap.c                                | 45 ++--------------
 16 files changed, 83 insertions(+), 164 deletions(-)

-- 
2.17.1

