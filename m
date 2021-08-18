Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6B3F0BC5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD996E929;
	Wed, 18 Aug 2021 19:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC4E6E929;
 Wed, 18 Aug 2021 19:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmqAQXEpdPdb56bWQLnHNSLDQOMGxN8VS/P7Yt77DbI+5YYFwp0KU1atRqRD1TnaRH5CVZ1lNfSBAOZXIJz8h2rSmYT0cOl6/BSHvJccyOJTzOEuCSI8YCXCqn9pRrFUZ3RcktSO+fkGKrxVCQx/MSIoYPBvAk8jfCMibKgaJppWWaD1nRkw1+RrCLUXwJFFjXGCt+SkgMigkKVjKIH9IP/03u8+hlvJC9DCkwR9cdOcgdPyNcDLRCbnAX61Z559KG7m6MH6OQWdp71b4I8OzTzoGWFgsbtXBqaNHvCR5jQvh/z8cbSkVbEix+R2b6E7YAmC380XHkoRxkYCP+nQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0dxBB+gTPgn6xtJRTWooXg5Ofo2P3zOE2xwaHUAyrQ=;
 b=J2qUs7VWgvBw2jNN1Th68X+biEN4JshjW8F7UcXQp222K9sJDBIZILqXFwXHk1CTXubyf3AD8ouUUXpt6zolx3OpPZTzyqU13urlZ0giXb3CdS3c2YovxST6jhwEat8G5nCjPb7vdTzC1jAdbbZwcwgpKdlGbTB+WNUZ99DmpV+PUnIbMJCYHH4VDpD2sb+7twAHTw6wy7ckyR7QvG5ci2HK+mkt3EP06hGzm/utcbdMTjvs8mwz5hBRg4UbEtCXlNEmRwCORSZPUbQqfRkWJQNvxBk8wZEBSdQ4IrNsFJ2t0/YmbvsM25RovSIYxaC91UDQfhOCd9B+Et9Jpq10Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0dxBB+gTPgn6xtJRTWooXg5Ofo2P3zOE2xwaHUAyrQ=;
 b=pt4FulzCGAi6z3RnU1HIgF/giSn4aJ4+QiNKT99IQN+2FcFVNWdQskycy5R1vzxhx3k24TIbYTHIxCNDsm8HdjFOgos7bKyilPZOVC7kmMxH0dTIlUKAKFItG1bl8nwYoCveSj4u7OZM9Y/MA0cn8QbWjvxg3ZU0p82WMo5BfQpqZ2i0lySiVqZceiIOCIVovSvMq5rEKwnXORjNJQUvQS+DJAhUw92jRpvkUVPAGIGNWi8p7iSAY9CpWIMU+r35L2rb83u/bRCB8aAMBYDJ3/jWVNSjb7f+o0rdT6X+bdRMV2auGIYnLvoX5SerzauujmEGWWTMOxJCc1aKneEGag==
Received: from MWHPR02CA0018.namprd02.prod.outlook.com (2603:10b6:300:4b::28)
 by DM5PR12MB1609.namprd12.prod.outlook.com (2603:10b6:4:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.24; Wed, 18 Aug
 2021 19:28:31 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:4b::4) by MWHPR02CA0018.outlook.office365.com
 (2603:10b6:300:4b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 19:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 18 Aug 2021 19:28:31 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Aug
 2021 12:28:31 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Aug
 2021 19:28:31 +0000
Received: from rcampbell-test.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 19:28:31 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: Felix Kuehling <felix.kuehling@amd.com>, Alex Sierra
 <alex.sierra@amd.com>, <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
 <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e155ed59-8c3c-4046-e731-f082ee4b10bb@nvidia.com>
Date: Wed, 18 Aug 2021 12:28:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ca49a3a-3231-4322-e250-08d9627e5d0b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1609:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16092220E81E2EBBCE5A66FEC2FF9@DM5PR12MB1609.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpQvXu9STTWL62aQ9sm3SiAiAuc7renl76Gf3apCxC6dfqMz5ba7e337onDgTTnp97GB6WdCZXzpLTUzFVkO7wIdTa6wceM9aeNi1k3xZAiYsRQ/WiTRaKJb6mXWuWM4qns+A5pBsgYB0Nve2Vrsp8V2AiiRkNQUckVKxahydna4r20JsxRkk/2KEbZnKLN13Q/sWfbUDQc9Vm/eoZhtklqfhlK7pMn2u9QDwBUuSNHEKsYy8lggMK9vbLpXxMLG5+si9n/jJgZ5fa1lV34GZ5bOPewkMDlt32p8KJ+JWZF7SPmKi++LZ6RxBXpVrs3ySuodvPgr9V+M7xatUiilVZnE1upsrmFe6cnWCKHnufKWF7zAju4K75Dg4FT6NHeNZNs7Be8NqWr4M+aDclW0EmC3Mc9gzoRD/mtc7Sa9sPRJvYrPkwzjsk2oJhK4boNuH36VJtmRAoaGxBq3eC2yNxqjoaV0k3Uz3fFdPumDWn+2BCuUVoKGDNhnFN1LKt4YRcHRWFVbVmmErydJE+rKWyvTnPQLu1dYWVPsb3w5ayMfuz44G++oEE5Mu++xJdCWkulT6bClScEWRzuWUsZ2QkxngNQ7+ypLmDVWRU89nK1rwO+i/uHn4D2zbMdJyLsSh6SSdzDPjEYHsSlbNwQ4OTmRJgCkrdZdzN6J13xeW4AoEuOpX4j4/E/hZH0RLZpJ0uqRqI7Pu1GmT0k5mQx6E2/sEEB/sK5u/naXP2yGvx1e17fzoXR0Kcn4Z72I3d5gghms4FTzNAWRt+REDg9B6iJAX6/dBj225YerKItxDrFwCnxL8nkJRMda7DBzcOf2kxgku6+l2rslz/YaFEvoJ2MISmngxtSuTNe49jQmtEU+py2uBL7FPhL94iT9CM0D
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(36840700001)(2906002)(54906003)(83380400001)(110136005)(86362001)(8676002)(316002)(82310400003)(8936002)(47076005)(31686004)(82740400003)(36860700001)(36756003)(356005)(7636003)(53546011)(70586007)(70206006)(186003)(478600001)(336012)(7416002)(26005)(5660300002)(2616005)(31696002)(7696005)(4326008)(966005)(426003)(2101003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 19:28:31.4867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca49a3a-3231-4322-e250-08d9627e5d0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1609
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

On 8/17/21 5:35 PM, Felix Kuehling wrote:
> Am 2021-08-17 um 8:01 p.m. schrieb Ralph Campbell:
>> On 8/12/21 11:31 PM, Alex Sierra wrote:
>>> From: Ralph Campbell <rcampbell@nvidia.com>
>>>
>>> ZONE_DEVICE struct pages have an extra reference count that
>>> complicates the
>>> code for put_page() and several places in the kernel that need to
>>> check the
>>> reference count to see that a page is not being used (gup, compaction,
>>> migration, etc.). Clean up the code so the reference count doesn't
>>> need to
>>> be treated specially for ZONE_DEVICE.
>>>
>>> v2:
>>> AS: merged this patch in linux 5.11 version
>>>
>>> v5:
>>> AS: add condition at try_grab_page to check for the zone device type,
>>> while
>>> page ref counter is checked less/equal to zero. In case of device
>>> zone, pages
>>> ref counter are initialized to zero.
>>>
>>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> ---
>>>    arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>>    fs/dax.c                               |  4 +-
>>>    include/linux/dax.h                    |  2 +-
>>>    include/linux/memremap.h               |  7 +--
>>>    include/linux/mm.h                     | 13 +----
>>>    lib/test_hmm.c                         |  2 +-
>>>    mm/internal.h                          |  8 +++
>>>    mm/memremap.c                          | 68 +++++++-------------------
>>>    mm/migrate.c                           |  5 --
>>>    mm/page_alloc.c                        |  3 ++
>>>    mm/swap.c                              | 45 ++---------------
>>>    12 files changed, 46 insertions(+), 115 deletions(-)
>>>
>> I haven't seen a response to the issues I raised back at v3 of this
>> series.
>> https://lore.kernel.org/linux-mm/4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc@nvidia.com/
>>
>>
>> Did I miss something?
> I think part of the response was that we did more testing. Alex added
> support for DEVICE_GENERIC pages to test_hmm and he ran DAX tests
> recommended by Theodore Tso. In that testing he ran into a WARN_ON_ONCE
> about a zero page refcount in try_get_page. The fix is in the latest
> version of patch 2. But it's already obsolete because John Hubbard is
> about to remove that function altogether.
>
> I think the issues you raised were more uncertainty than known bugs. It
> seems the fact that you can have DAX pages with 0 refcount is a feature
> more than a bug.
>
> Regards,
>    Felix

Did you test on a system without CONFIG_ARCH_HAS_PTE_SPECIAL defined?
In that case, mmap() of a DAX device will call insert_page() which calls
get_page() which would trigger VM_BUG_ON_PAGE().

I can believe it is OK for PTE_SPECIAL page table entries to have no
struct page or that MEMORY_DEVICE_GENERIC struct pages be mapped with
a zero reference count using insert_pfn().

I find it hard to believe that other MM developers don't see an issue
with a struct page with refcount == 0 and mapcount == 1.

I don't see where init_page_count() is being called for the
MEMORY_DEVICE_GENERIC or MEMORY_DEVICE_PRIVATE struct pages the AMD
driver allocates and passes to migrate_vma_setup().
Looks like svm_migrate_get_vram_page() needs to call init_page_count()
instead of get_page(). (I'm looking at branch origin/alexsierrag/device_generic
https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver.git)

Also, what about the other places where is_device_private_page() is called?
Don't they need to be updated to call is_device_page() instead?
One of my goals for this patch was to remove special casing reference counts
for ZONE_DEVICE pages in rmap.c, etc.

I still think this patch needs an ACK from a FS/DAX maintainer.

