Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2848C2D4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 12:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8710FB89;
	Wed, 12 Jan 2022 11:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA0210FB89;
 Wed, 12 Jan 2022 11:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhNvRXWyckDdokBo4Y/Njke3v0CI+FhWTCp1dh/lfB4rse5QUJpB2e82eRwiFDYRzgPz75NAO808rCO9Dz8XxA5GTjVRf5UhdC6jeTsUU1vgPePd2TG1AjsFkjyXs/dzGzOJcdlwWluqBl4nC87GZrSJIJYjFa0iz5bHqEFzQmX1zTEjtQ4Hx9AnkNJSoqnpBmBwtsDoyxjyO3ave4sWFZxiNdVvgZzMo9NnbGFeZhyCfIAV6vIEHNqQ3WRcrEYBXN7KrOXWUYdX5+SDXgt8MEtYanAi2udZG6ATZNvA+pwjt9CDEjqyDup10RTxZ05QunGh/huc+wQL+QHucVkv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ue4uczCaY1S95pfgk9/7uUS/vkNRixQnqbOmmTG+vQ=;
 b=eHQAktHe4FBEHbVELUP+zT9UaP34aVuy2qrwhWuatkqgY2BoYBitEFCLA0BHIRzxc2f8LXl1sb4DFidnYOQhy3hp9JxyQChTwqGeLWKEu1ic7I5vLX7nhvIwxpkge1zmdQCMkXJ2lrCj8MEsQKIlvCpp3K42LKQJ+2ZtqaJEHEgVstJ6iClCDYL1jWPbcGduqRao966oMwNVIsbtaX43L7IyF6+s+DMZVgZ2o47ZvB5J+YqnUa5lYQ+ZsVOi+wpgb94ZNqgjdP+9ee40zjoyGAgIfKaMv4qHDo1pmdYV7Sr99N6liJ4hdrrGWxKrT4s9i31s81EBQGSNJpbjbPIZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ue4uczCaY1S95pfgk9/7uUS/vkNRixQnqbOmmTG+vQ=;
 b=lHCNN2exU+0b+Atl+G03PsNGKrBKRET75Lg23SC0iotno/25MIt5w9rXgisM3RnRDhSjL8KaoehCacRC0TX5QlRSFWyWEK1vSb+mV9qivZPFrt4+AKMdsrmXPhiJjvK1VJPYLqEYQCS/5mOJYW4wJWipa4ylf7VsBn0fabKYOhHKKpdajImFCcOAeYlcS1F4b+blRQS/g3zDyuKqcHM2wRKRyuXaQg/Z3v8yDMyLZuIZu1kKzBifRsq7/Lu/gOIHFGTxZA36JrzQoioa//vBuiVlsViid5S/A9Z7Pr6M+B/cq8/fqzn2P/sZG+aqKbrokGPMsP1Pr8qIK2C30F15RA==
Received: from DM6PR10CA0005.namprd10.prod.outlook.com (2603:10b6:5:60::18) by
 MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Wed, 12 Jan 2022 11:06:10 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::62) by DM6PR10CA0005.outlook.office365.com
 (2603:10b6:5:60::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 12 Jan 2022 11:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 11:06:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 12 Jan 2022 11:06:09 +0000
Received: from nvdebian.localnet (10.127.8.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 12 Jan 2022
 03:06:05 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Date: Wed, 12 Jan 2022 22:06:03 +1100
Message-ID: <2389959.omVpu533ic@nvdebian>
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.127.8.9]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df7489ad-a22d-4814-ef05-08d9d5bb8a18
X-MS-TrafficTypeDiagnostic: MW3PR12MB4571:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4571CB0732427FD8695F5BCFDF529@MW3PR12MB4571.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4N437EaEoDk3XFzrJ/KYoK0VkJ8s6ZzxJsXljjSb9HMCQgMTEr5xZ2kfq3u8MaGVS+ZI1Vtq+GhCxY+q2V2LElquTUj2+Qro5jAZ1xzlQuQwPWg7bowMKJEEfsu1k1DEyKaWRpcFrk2amA1s/bt44UQlSi4ux4HGkMxLb/r0aySrWMEQkzyKMwpwGLabWQq4T8N+1aZzXiQPEuzAlU+g/MyBFaDvmu12r7LWd+A1JlNW+YyrNiQ6e+NXjMPry+nT4zsdnHqmy+8ov0TJ+Ud05COvyjE6f4nMNTQQTJ8reAFLEXjh/STpNH1DHRVF9YQMRVk9P5hdMtYv7fpIKshSvUKIvT3Apd6mdAN9vv+oSXdwVGd1PK2Mn+E/RhMyzSbVH7vBrffT39BZbFUgjCboRTb54mCn+LdR4IeEcSCC6+0RM80OjxpyfB9jS7yLaFigdtSIsjYonh/LXsVl6B6QSb6VK1vP0DcwWD62wmf4cwQGvT1qHbJqk1cyJ1yqxA+27QxxMkfIn6TskcSSIp4aBr9HXaTNB8N3Ovx34z40/VWCe75O7p0NnaZq8q60O+z1Id7XhutP1oWRko5xzanUNcPDxl1OV5AxmJUEWkYyfo3Ft+aYc8DH6YN+iRrIYeVTLG8Ht+hkHrkPmGOLKnYYAgjdRZIOLXXrla41cYLp9H71v2SMFPwZMJWZ93qLvbyJ+KRQzaMpjP+e7aMYJIjKVdBuSbFLdX12KXZ+nq20ioZsTDZEc7UloyjbmjA0zXJogsS/ZlLc9zMs3jRRAHZXWZTv/obgvoDc9KkZ/LGwUg=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(336012)(7416002)(70586007)(82310400004)(316002)(40460700001)(54906003)(8936002)(8676002)(110136005)(9686003)(26005)(186003)(70206006)(16526019)(47076005)(426003)(83380400001)(356005)(81166007)(5660300002)(4326008)(2906002)(86362001)(36860700001)(33716001)(508600001)(9576002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 11:06:10.0720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7489ad-a22d-4814-ef05-08d9d5bb8a18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have been looking at this in relation to the migration code and noticed we
have the following in try_to_migrate():

        if (is_zone_device_page(page) && !is_device_private_page(page))
                return;

Which if I'm understanding correctly means that migration of device coherent
pages will always fail. Given that I do wonder how hmm-tests are passing, b=
ut
I assume you must always be hitting this fast path in
migrate_vma_collect_pmd():

                /*
                 * Optimize for the common case where page is only mapped o=
nce
                 * in one process. If we can lock the page, then we can saf=
ely
                 * set up a special migration page table entry now.
                 */

Meaning that try_to_migrate() never gets called from migrate_vma_unmap(). So
you will also need some changes to try_to_migrate() and possibly
try_to_migrate_one() to make this reliable.

 - Alistair

On Tuesday, 11 January 2022 9:31:51 AM AEDT Alex Sierra wrote:
> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
> owned by a device that can be mapped into CPU page tables like
> MEMORY_DEVICE_GENERIC and can also be migrated like
> MEMORY_DEVICE_PRIVATE.
>=20
> Christoph, the suggestion to incorporate Ralph Campbell=E2=80=99s refcount
> cleanup patch into our hardware page migration patchset originally came
> from you, but it proved impractical to do things in that order because
> the refcount cleanup introduced a bug with wide ranging structural
> implications. Instead, we amended Ralph=E2=80=99s patch so that it could =
be
> applied after merging the migration work. As we saw from the recent
> discussion, merging the refcount work is going to take some time and
> cooperation between multiple development groups, while the migration
> work is ready now and is needed now. So we propose to merge this
> patchset first and continue to work with Ralph and others to merge the
> refcount cleanup separately, when it is ready.
>=20
> This patch series is mostly self-contained except for a few places where
> it needs to update other subsystems to handle the new memory type.
> System stability and performance are not affected according to our
> ongoing testing, including xfstests.
>=20
> How it works: The system BIOS advertises the GPU device memory
> (aka VRAM) as SPM (special purpose memory) in the UEFI system address
> map.
>=20
> The amdgpu driver registers the memory with devmap as
> MEMORY_DEVICE_COHERENT using devm_memremap_pages. The initial user for
> this hardware page migration capability is the Frontier supercomputer
> project. This functionality is not AMD-specific. We expect other GPU
> vendors to find this functionality useful, and possibly other hardware
> types in the future.
>=20
> Our test nodes in the lab are similar to the Frontier configuration,
> with .5 TB of system memory plus 256 GB of device memory split across
> 4 GPUs, all in a single coherent address space. Page migration is
> expected to improve application efficiency significantly. We will
> report empirical results as they become available.
>=20
> We extended hmm_test to cover migration of MEMORY_DEVICE_COHERENT. This
> patch set builds on HMM and our SVM memory manager already merged in
> 5.15.
>=20
> v2:
> - test_hmm is now able to create private and coherent device mirror
> instances in the same driver probe. This adds more usability to the hmm
> test by not having to remove the kernel module for each device type
> test (private/coherent type). This is done by passing the module
> parameters spm_addr_dev0 & spm_addr_dev1. In this case, it will create
> four instances of device_mirror. The first two correspond to private
> device type, the last two to coherent type. Then, they can be easily
> accessed from user space through /dev/hmm_mirror<num_device>. Usually
> num_device 0 and 1 are for private, and 2 and 3 for coherent types.
>=20
> - Coherent device type pages at gup are now migrated back to system
> memory if they have been long term pinned (FOLL_LONGTERM). The reason
> is these pages could eventually interfere with their own device memory
> manager. A new hmm_gup_test has been added to the hmm-test to test this
> functionality. It makes use of the gup_test module to long term pin
> user pages that have been migrate to device memory first.
>=20
> - Other patch corrections made by Felix, Alistair and Christoph.
>=20
> v3:
> - Based on last v2 feedback we got from Alistair, we've decided to
> remove migration logic for FOLL_LONGTERM coherent device type pages at
> gup for now. Ideally, this should be done through the kernel mm,
> instead of calling the device driver to do it. Currently, there's no
> support for migrating device pages based on pfn, mainly because
> migrate_pages() relies on pages being LRU pages. Alistair mentioned, he
> has started to work on adding this migrate device pages logic. For now,
> we fail on get_user_pages call with FOLL_LONGTERM for DEVICE_COHERENT
> pages.
>=20
> - Also, hmm_gup_test has been removed from hmm-test. We plan to include
> it again after this migration work is ready.
>=20
> - Addressed Liam Howlett's feedback changes.
>=20
> Alex Sierra (10):
>   mm: add zone device coherent type memory support
>   mm: add device coherent vma selection for memory migration
>   mm/gup: fail get_user_pages for LONGTERM dev coherent type
>   drm/amdkfd: add SPM support for SVM
>   drm/amdkfd: coherent type as sys mem on migration to ram
>   lib: test_hmm add ioctl to get zone device type
>   lib: test_hmm add module param for zone device type
>   lib: add support for device coherent type in test_hmm
>   tools: update hmm-test to support device coherent type
>   tools: update test_hmm script to support SP config
>=20
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  34 ++-
>  include/linux/memremap.h                 |   8 +
>  include/linux/migrate.h                  |   1 +
>  include/linux/mm.h                       |  16 ++
>  lib/test_hmm.c                           | 333 +++++++++++++++++------
>  lib/test_hmm_uapi.h                      |  22 +-
>  mm/gup.c                                 |   7 +
>  mm/memcontrol.c                          |   6 +-
>  mm/memory-failure.c                      |   8 +-
>  mm/memremap.c                            |   5 +-
>  mm/migrate.c                             |  30 +-
>  tools/testing/selftests/vm/hmm-tests.c   | 122 +++++++--
>  tools/testing/selftests/vm/test_hmm.sh   |  24 +-
>  13 files changed, 475 insertions(+), 141 deletions(-)
>=20
>=20




