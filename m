Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E27542E024
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC176E1D8;
	Thu, 14 Oct 2021 17:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3756E1BB;
 Thu, 14 Oct 2021 17:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT/wXuK05mbOCnBeLElg7Id8BAP+FDW2bGG+u6JuhOngeJXv3fwIFAiJsZgQL8RRnVdYmkDC71AVl9Ft9g1adGgOEBa4jXtb1zaEeEfouCHixzWmuxLMF7+V0mfJnMbj+XiU238x55V7M4YmDZak2eN37U13jARPhh5RGmq1wvpGQp5IiEVp/vykL3zu+5ZP6ZeWsb3sflmSXSHV7ni5PHNMLw2R4Sylr/ycjrKQaR3eGVEpbEjFNWknrcrav0YG8FE+RJazE/lpRMPrMjTUkxPn+Hunne0bU1TdwFdS/9CTO10sGRfGE5lcZpesfMsgJ4NM7XinrOQfaZmfk3Uu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWvb25JkDfMpg3JxqpciD0ArRBV2EnzgM1d7p/8xxTI=;
 b=FLHQ9ovUjEFw+LMDid1WT2+3gGUcgrjoWgYwsDEJXvpAdLOLZ7K/1E2C4c+fWGaahD87FA1o0Kz9pN4g4UP/pghHYEZ10MUCOFYFjNDNVeYLZ8Gc0vvAX1p69gGGz4FOoA7cgb0I1KNnX551bz1NA6iYoNemR2Onp3SpnBlmKvNxhIIVnskTr84aIUfJOcoBIygvIRDYHpUqssySOf2O0Ddv2uDhaZ8ixEIDCzkwH3gAbczEXkOwS2scx4CvANzFv4HGApcPEfezdkrmh/kvJ+48iPV47MKAlVdT0yi9EIssYtq4aEAQviuzxmUOprbraYEohIY2zMNel8MFqFfAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kvack.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWvb25JkDfMpg3JxqpciD0ArRBV2EnzgM1d7p/8xxTI=;
 b=g768QAHuDw0Ng2zLQE5QDPZNedGanyXZng4H/fI08unqpVuzSnXOtWWBcMr58ilohwO1V0aE4CDxGNu6w+H7jUvUSLcpXlFmi+rSqdU2ZMxQ89QAgL6G4IzmYjuRAeiJkFWNc82D7wcWkPD3AmdypJfmjhSydg4JTUOtUQAo0VDqX8D2sahdL3RpfMevBJ5OBAOr7lMOUfjCrjg5JgmuUDci164FhR6pZweEnEu/h1neOzJGwAyoPpC8aHd1JVIpda4vqQCmML6gs5gL46exSjoUsbHCdD8kGOsJ2oSrXTTvClV6Sj6Ga5P8toa4J/An7PGUH/t/GKWBHWag25qXKA==
Received: from DM3PR08CA0006.namprd08.prod.outlook.com (2603:10b6:0:52::16) by
 DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Thu, 14 Oct 2021 17:35:29 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::aa) by DM3PR08CA0006.outlook.office365.com
 (2603:10b6:0:52::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 17:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 17:35:28 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct
 2021 10:35:27 -0700
Received: from rcampbell-test.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18 via Frontend
 Transport; Thu, 14 Oct 2021 17:35:27 +0000
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Sierra <alex.sierra@amd.com>
CC: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <hch@lst.de>, <jglisse@redhat.com>,
 <apopple@nvidia.com>, <willy@infradead.org>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <eafbccb5-f94b-0ddd-bb46-7ee92ed36ee8@nvidia.com>
Date: Thu, 14 Oct 2021 10:35:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211014170634.GV2744544@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b98879-206f-4164-4711-08d98f3903d8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4265:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4265133C80AC57DCE4C93BE6C2B89@DM6PR12MB4265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPqtKOkWVoOdxIrOIlGmhwpjBfOMas1PkaxppOZ7ozZi2CJk8eVO0I+wQ8Y2YEIdfdD+7X3mlnQJwfET6ftctNHlRS4cnslfshH11HWhhE4tBW9dH25hL7Kugh7zq/tDCZIuUDUEFAvMDRqBu8Bb5T0I0g0QrAF7C4wGZaCoy1hSQK84I5KFHOfAnAwsht4qgnPub3fQ7l9Et4asl3qB74ju48zS0WiXbm/1Yp0uPMDbHMDP6KZxERkgQuhU/xvpEPSrMQSDdfSQ2Gf9qRBSDXF7qInCXFU3yiSaFRYZIy1liDeu9lxzee9k/ld+8zDTMO2JzIwLscx6e0rhJafjoo2yZuWu3aZFAmyYCcaWR1+JoORLG8cFqqJOkRaU4PPrytSIUH9cq8/z/92un1PiwcXLKX324X4ZCEDAYDBMyDzav+FclTLV2vAg6NLIN60ecbZGD71ElD56/dRMWoyqYOCztMjvZBm0GifwmmmNKHnSnSIo6BdiX8/SNHqrBOrrdVZsHQDoLDwBM0pA9EtZxeI4w1SY4B+o6ZvqhBTNihd7fscTvnVTtlHrZg02GD7dXu9Dkvmhl9yxOl1Pn4V2unOHXEfuJJWXlO2MdiHSoUyJtKCzlluDM+BFTOjOpHeMzgo6Hl/Bmg1xKFZf4fCWB6CcOHt1NvevSZbXuk4mfbYvpTg0SAINyIA7ymsECSpQGcrwXwFUAIgAVjfYILEYhDyk4JFq+tm/c1+SDL6QSujGO/NVwKew4pVkDbkH7ccYBwVIsUtBkoWylKU4pOivJ9MbaKG2Y+g9/LEVZwqfg4RFwdZVqMjX+WDN4XvUlzafPVZsBkSjSmYD2jEJzjhpEz4kfOX5qbDvZyozEG7EMf4=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(7416002)(4326008)(31686004)(53546011)(8676002)(8936002)(7696005)(70586007)(70206006)(426003)(47076005)(83380400001)(2616005)(508600001)(7636003)(336012)(356005)(2906002)(316002)(186003)(31696002)(36860700001)(966005)(5660300002)(54906003)(36756003)(82310400003)(110136005)(26005)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 17:35:28.9049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b98879-206f-4164-4711-08d98f3903d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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


On 10/14/21 10:06 AM, Jason Gunthorpe wrote:
> On Thu, Oct 14, 2021 at 10:39:28AM -0500, Alex Sierra wrote:
>> From: Ralph Campbell <rcampbell@nvidia.com>
>>
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> ---
>> v2:
>> AS: merged this patch in linux 5.11 version
>>
>> v5:
>> AS: add condition at try_grab_page to check for the zone device type, while
>> page ref counter is checked less/equal to zero. In case of device zone, pages
>> ref counter are initialized to zero.
>>
>> v7:
>> AS: fix condition at try_grab_page added at v5, is invalid. It supposed
>> to fix xfstests/generic/413 test, however, there's a known issue on
>> this test where DAX mapped area DIO to non-DAX expect to fail.
>> https://patchwork.kernel.org/project/fstests/patch/1489463960-3579-1-git-send-email-xzhou@redhat.com
>> This condition was removed after rebase over patch series
>> https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>   fs/dax.c                               |  4 +-
>>   include/linux/dax.h                    |  2 +-
>>   include/linux/memremap.h               |  7 +--
>>   include/linux/mm.h                     | 11 ----
>>   lib/test_hmm.c                         |  2 +-
>>   mm/internal.h                          |  8 +++
>>   mm/memcontrol.c                        |  6 +--
>>   mm/memremap.c                          | 69 +++++++-------------------
>>   mm/migrate.c                           |  5 --
>>   mm/page_alloc.c                        |  3 ++
>>   mm/swap.c                              | 45 ++---------------
>>   13 files changed, 46 insertions(+), 120 deletions(-)
> Has anyone tested this with FSDAX? Does get_user_pages() on fsdax
> backed memory still work?

I ran xfstests-dev using the kernel boot option to "fake" a pmem device
when I first posted this patch. The tests ran OK (or at least the same
tests passed with and without my patch). However, I could never really
convince myself the changes were "OK" for fsdax since I didn't understand
the code that well. I would still like to see a xfsdax maintainer or
expert ACK this change.

https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

> What refcount value does the struct pages have when they are installed
> in the PTEs? Remember a 0 refcount will make all the get_user_pages()
> fail.
>
> I'm looking at the call path starting in ext4_punch_hole() and I would
> expect to see something manipulating the page ref count before
> the ext4_break_layouts() call path gets to the dax_page_unused() test.
>
> All I see is we go into unmap_mapping_pages() - that would normally
> put back the page references held by PTEs but insert_pfn() has this:
>
> 	if (pfn_t_devmap(pfn))
> 		entry = pte_mkdevmap(pfn_t_pte(pfn, prot));
>
> And:
>
> static inline pte_t pte_mkdevmap(pte_t pte)
> {
> 	return pte_set_flags(pte, _PAGE_SPECIAL|_PAGE_DEVMAP);
> }
>
> Which interacts with vm_normal_page():
>
> 		if (pte_devmap(pte))
> 			return NULL;
>
> To disable that refcounting?
>
> So... I have a feeling this will have PTEs pointing to 0 refcount
> pages? Unless FSDAX is !pte_devmap which is not the case, right?
>
> This seems further confirmed by this comment:
>
> 	/*
> 	 * If we race get_user_pages_fast() here either we'll see the
> 	 * elevated page count in the iteration and wait, or
> 	 * get_user_pages_fast() will see that the page it took a reference
> 	 * against is no longer mapped in the page tables and bail to the
> 	 * get_user_pages() slow path.  The slow path is protected by
> 	 * pte_lock() and pmd_lock(). New references are not taken without
> 	 * holding those locks, and unmap_mapping_pages() will not zero the
> 	 * pte or pmd without holding the respective lock, so we are
> 	 * guaranteed to either see new references or prevent new
> 	 * references from being established.
> 	 */
>
> Which seems to explain this scheme relies on unmap_mapping_pages() to
> fence GUP_fast, not on GUP_fast observing 0 refcounts when it should
> stop.
>
> This seems like it would be properly fixed by using normal page
> refcounting for PTEs - ie stop using special for these pages?
>
> Does anyone know why devmap is pte_special anyhow?
>
>> +void free_zone_device_page(struct page *page)
>> +{
>> +	switch (page->pgmap->type) {
>> +	case MEMORY_DEVICE_PRIVATE:
>> +		free_device_page(page);
>> +		return;
>> +	case MEMORY_DEVICE_FS_DAX:
>> +		/* notify page idle */
>> +		wake_up_var(&page->_refcount);
>> +		return;
> It is not for this series, but I wonder if we should just always call
> ops->page_free and have free_device_page() logic in that callback for
> the non-fs-dax cases?
>
> For instance where is the mem_cgroup_charge() call to pair with the
> mem_cgroup_uncharge() in free_device_page()?
>
> Isn't cgroup charging (or not) the responsibility of the "allocator"
> eg the pgmap_ops owner?
>
> Jason
