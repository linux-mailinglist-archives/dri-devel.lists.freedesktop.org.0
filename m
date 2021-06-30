Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D8E3B7AF5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 02:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9726888FDA;
	Wed, 30 Jun 2021 00:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F356E909;
 Wed, 30 Jun 2021 00:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrR5mmc/qmtXYawpqRjE39VM6UEVnMXHYrdSBcB/Et0vU5PceOpxyx92HgyO+vEBbM05zw6BsQ8im2VuZki/BVKBVove96yNl7Z4B+wL7zhyp5IehkYkOnQxIYsG4NfEUf9gj4nqSck8mPJfQExry9f4VyP/gzWyvqyCKnv78J0Kn8NWK6gWPCck4mei+Y2rzI6DrFYZE+pi+9P7c74XC8DMeWusDPBEa/ZCP0wX6NvbLL/7Y9WJW9w4V9r94bYZ3N8DFIp3QGeZug8SV/rnTgwvvlMkv912TEyOKs2/wFMQof5Lv8QnuDXe9q6gBJYlkIeON/6f8IyPfyQ+MGge+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/MU13EJJdQtq1C0Hzvv1TZhNFjRG3LECltiLLJS/7w=;
 b=aoW5lZkGO2nIccyYWqHi9s981hLiOG0015EqtS6y321vbxRUAwjL2s8aImpYqiVhLqnkOESO84ak3mjyXbm/OpfxNYbZDsXakAoeV2PmShW49oGNaB3UtE2ZdWkFjq0neSrnXTbILBsW9tK6osPgsOKB1qAd1Xx/5yiGxPSTR+cc4c0uE4Rijnn/uiNhR5FrL4J8LVbYkawUhvRpxUsfgvdNkwpmKVSiAfeKiPnqUsx4YdWMbGEHNo6Z61qGZ0ZmUehtm6L6LDlh7eMR5Qw1lCw4luMqCmJNG6f3gz+bDKSyEegtOndAokq85yMOQ6/e5DWrhAoxzaykPaHkP/F8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kvack.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/MU13EJJdQtq1C0Hzvv1TZhNFjRG3LECltiLLJS/7w=;
 b=EYurZZMIGtgj1obxKwnF6Mg+qkNcCpPTb56JabJ1NmEYuq+BwzDKj1vRVLO4g3hsRprNqMT35oxRbu/ZDAPJRdeD3wC0dDAqRp/Ypk89uaEwy5lshPlS8BnzBL2Izr8L/SKdqZfM4/jFhfvvmy73/P3mwUCb28/xhPwpQlJVAW/ilFUKADy16t6m6YVkvL6iyWdTCbbHvVO9Fgn6HrEPF+r63pU6ss0hWLP2wyKoxPqVRfyLVdOibl8zSiuR9xRJfju38ofPzv2aYE68ssseG1ESDellRNwIRkxcfBFU8zjOB5N9GAbfw2SvaDrxHb5D9Zol22mZga1Wa6loi4vIQA==
Received: from BN0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:408:e6::29)
 by SJ0PR12MB5406.namprd12.prod.outlook.com (2603:10b6:a03:3ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 00:23:26 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::96) by BN0PR03CA0024.outlook.office365.com
 (2603:10b6:408:e6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Wed, 30 Jun 2021 00:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 30 Jun 2021 00:23:25 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 17:23:24 -0700
Received: from rcampbell-test.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 00:23:24 +0000
Subject: Re: [PATCH v3 2/8] mm: remove extra ZONE_DEVICE struct page refcount
To: Felix Kuehling <felix.kuehling@amd.com>, Alex Sierra
 <alex.sierra@amd.com>, <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>, "Yang, Philip"
 <Philip.Yang@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <20210617151705.15367-3-alex.sierra@amd.com>
 <7163dbb6-67b5-6eef-5772-500fd2107e5c@nvidia.com>
 <cecd2164-ebfd-382b-af73-992cdc4304b7@amd.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc@nvidia.com>
Date: Tue, 29 Jun 2021 17:23:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cecd2164-ebfd-382b-af73-992cdc4304b7@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d9fe82a-6e48-4743-715d-08d93b5d46f9
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5406:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54068E2956E48723E5DE3CCBC2019@SJ0PR12MB5406.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prh+q7BtytT3EGdDeO2L6f6NlgXGp8P3c/Z+Ab4mb+XT3Mwz/Wos2jk/NdGF31S4DKC5WYGnfLtNos03UzKbFGl9QFw7MCBnx4cT4geSwQ9Ff/CjG+zv6j/yDz01EatNiNNvue6zCY7xpI6SCb8aJbFRq/KYYh02M7mCxL+IoBxX9vxRKCvepEIY6a85mEw/FH0vk/2DFfDxbPa58TaohzlQDhEMb3wlDC4fwbZjsgUM/6n52zd0xslAE2ReB24NFRGOx2GBHC4vpJpGyMFItn67NONnDcukZfFY9D2494b9Z+f1GPXeRl01/usCNOyuk0KIyiSSBlfSAsc93ND5pebjFKQV3Gd4h6elk7mRdMsyH01aof5LblUnzsLHW0ic1J+9i+wyesVB8UfT+ZQB7H4GEK3Tc4vFFzkGhO28YWel0bTgqWQDg4UyBLh/VSaNzihGrif+n8/bA7hDwNvZBllAYCPHmAQPLPxbq4DbPqRg+xH7C1tMhG0SBFkeIoh98WOGT2r7dsB1HuwTNC4V5rbEwIoNhgoc2iYKAXw5E5dzIgAlHBhPwgH+D19mm0NmKKrLiKX2RwS5k/RIA3MfKx+PD0fCepAEliYEEkmU/m0G43uuNjhq6SZKFbH9TVAPeCstwhOaN5WhO562ldQqyUyhMDQY6x09niDqCNfQ5BvXyio9bK3C2adK3M1INpUdc9nhdfuMB0rYA43/lzMrVylk9oIwFOI3HfuHqYf/bD+t0yyYqjSPTbSeW9XWPbp8
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(36840700001)(46966006)(336012)(47076005)(7696005)(5660300002)(356005)(82740400003)(53546011)(36860700001)(36756003)(426003)(8676002)(186003)(82310400003)(2906002)(31696002)(316002)(54906003)(7416002)(70586007)(26005)(86362001)(7636003)(83380400001)(110136005)(478600001)(8936002)(70206006)(31686004)(4326008)(2616005)(43740500002)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 00:23:25.6836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9fe82a-6e48-4743-715d-08d93b5d46f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5406
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/21 9:46 AM, Felix Kuehling wrote:
> Am 2021-06-17 um 3:16 p.m. schrieb Ralph Campbell:
>> On 6/17/21 8:16 AM, Alex Sierra wrote:
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
>>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> ---
>>>    arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>>    fs/dax.c                               |  4 +-
>>>    include/linux/dax.h                    |  2 +-
>>>    include/linux/memremap.h               |  7 +--
>>>    include/linux/mm.h                     | 44 -----------------
>>>    lib/test_hmm.c                         |  2 +-
>>>    mm/internal.h                          |  8 +++
>>>    mm/memremap.c                          | 68 +++++++-------------------
>>>    mm/migrate.c                           |  5 --
>>>    mm/page_alloc.c                        |  3 ++
>>>    mm/swap.c                              | 45 ++---------------
>>>    12 files changed, 45 insertions(+), 147 deletions(-)
>>>
>> I think it is great that you are picking this up and trying to revive it.
>>
>> However, I have a number of concerns about how it affects existing
>> ZONE_DEVICE
>> MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_FS_DAX users and I don't see this
>> addressing them. For example, dev_dax_probe() allocates
>> MEMORY_DEVICE_GENERIC
>> struct pages and then:
>>    dev_dax_fault()
>>      dev_dax_huge_fault()
>>        __dev_dax_pte_fault()
>>          vmf_insert_mixed()
>> which just inserts the PFN into the CPU page tables without increasing
>> the page
>> refcount so it is zero (whereas it was one before). But using
>> get_page() will
>> trigger VM_BUG_ON_PAGE() if it is enabled. There isn't any current
>> notion of
>> free verses allocated for these struct pages. I suppose init_page_count()
>> could be called on all the struct pages in dev_dax_probe() to fix that
>> though.
> Hi Ralph,
>
> For DEVICE_GENERIC pages free_zone_device_page doesn't do anything. So
> I'm not sure what the reference counting is good for in this case.
>
> Alex is going to add free_zone_device_page support for DEVICE_GENERIC
> pages (patch 8 of this series). However, even then, it only does
> anything if there is an actual call to put_page. Where would that call
> come from in the dev_dax driver case?

Correct, the drivers/dax/device.c driver allocates MEMORY_DEVICE_GENERIC
struct pages and doesn't seem to allocate/free the page nor increment/decrement
the reference count but it does call vmf_insert_mixed() if the /dev/file
is mmap()'ed into a user process' address space. If devm_memremap_pages()
returns the array of ZONE_DEVICE struct pages initialized with a reference
count of zero, then the CPU page tables will have a PTE/PFN that points to
a struct page with a zero reference count. This goes against the normal
expectation in the rest of the mm code that assumes a page mapped by a CPU
has a non-zero reference count.
So yes, nothing "bad" happens because put_page() isn't called but the
reference count will differ from other drivers that call vmf_insert_mixed()
or vm_insert_page() where the page was allocated with alloc_pages() or
similar.

>> I'm even less clear about how to fix MEMORY_DEVICE_FS_DAX. File
>> systems have clear
>> allocate and free states for backing storage but there are the
>> complications with
>> the page cache references, etc. to consider. The >1 to 1 reference
>> count seems to
>> be used to tell when a page is idle (no I/O, reclaim scanners) rather
>> than free
>> (not allocated to any file) but I'm not 100% sure about that since I
>> don't really
>> understand all the issues around why a file system needs to have a DAX
>> mount option
>> besides knowing that the storage block size has to be a multiple of
>> the page size.
> The only thing that happens in free_zone_device_page for FS_DAX pages is
> wake_up_var(&page->_refcount). I guess, whoever is waiting for this
> wake-up will need to be prepared to see a refcount 0 instead of 1 now. I
> see these callers that would need to be updated:
>
> ./fs/ext4/inode.c:        error = ___wait_var_event(&page->_refcount,
> ./fs/ext4/inode.c-                atomic_read(&page->_refcount) == 1,
> ./fs/ext4/inode.c-                TASK_INTERRUPTIBLE, 0, 0,
> ./fs/ext4/inode.c-                ext4_wait_dax_page(ei));
> --
> ./fs/fuse/dax.c:    return ___wait_var_event(&page->_refcount,
> ./fs/fuse/dax.c-            atomic_read(&page->_refcount) == 1,
> TASK_INTERRUPTIBLE,
> ./fs/fuse/dax.c-            0, 0, fuse_wait_dax_page(inode));
> --
> ./fs/xfs/xfs_file.c:    return ___wait_var_event(&page->_refcount,
> ./fs/xfs/xfs_file.c-            atomic_read(&page->_refcount) == 1,
> TASK_INTERRUPTIBLE,
> ./fs/xfs/xfs_file.c-            0, 0, xfs_wait_dax_page(inode));
>
> Regarding your page-cache comment, doesn't DAX mean that those file
> pages are not in the page cache?
>
> Regards,
>    Felix
>
I don't really understand the FS_DAX code. I can see the __wait_var_event()
is being used when truncating or punching holes in files but I'm not
quite sure if it is using the >1 to 1 reference count to know when a
page has no "extra" references or if it means the page is actually
"free" and no longer assigned to a file.
I really think some FS_DAX expert needs to weigh in on these reference count
changes.

