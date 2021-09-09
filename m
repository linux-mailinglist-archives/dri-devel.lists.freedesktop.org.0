Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72840404428
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 06:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9906E437;
	Thu,  9 Sep 2021 04:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11C76E437;
 Thu,  9 Sep 2021 04:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9ciD8yDWb/YqMv2R/0Rd6iQ9e6emGxCw/8GaAn53s0qQpMpqwQCSNEVi3l1eZdlt7dtz/O24/uH8ssx7nuysSUnJFLLTrsE2jo6CdTEzrbLQbuDiMLVpmBMH3hy4SqdbH4BDSR4msm0rOY+toCErhvYO0W67FwsQNrvWjcBx/BrgU14BULh4Ic1STB+ekmaJt/4KabMjvcuUnLvz3JuGeymNqJ35QXlUi7Yv+E+09F6Sn8mlnofwpWpKZQh34t5bvnt6tDgd2hjokvw2uRH32fDeMl3ZnBo+t0oOhn+NfxF47iTXSsFzpyMEFd+oXQbWMYCCJIhGO2a0hCl/IcNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81HVAdXZ/xV5qQxNdHooSo7SrUqwhIbs2GQ75VOX7gE=;
 b=hma4fiJzcFrbwNfsQmQXUUgoa2PYZpdP8AcslvDB5zR0hRCdcY6NT/vne9iPqCFYAIdN/Vrt9Ug7wEll8PwoUCihlRXGEmYhgIfHQnwlsKkwFNN1Yps3/6x9SzZx1g1nCrqrNdReMjwee7Q1sJ/2TxY5L3Yv4JJ/7fOH23nfOEMcvs7+/8nRrRRpfOsKQd5ClXNiicaf704PGk1H47sej1krrq6rYOR4i0U3XJ9QbBgrP/PEWvejvQjOiNhs0XeZUEttElR1oRx2N4cjJLejcQT3xhN0R+KBPHkdQWXaW/FmwM0sIdlv+WyAD6cy93v+mwiASEBQaOP3xkDxOhSujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81HVAdXZ/xV5qQxNdHooSo7SrUqwhIbs2GQ75VOX7gE=;
 b=q2ofnrexVv27Lwr9ECfG26ovmfw0pn8RQgYyLSSlCi5wzAoBfCzLeF1fNLNTyxHKjWdiUndrzbnJBpGGJg3ALAgLfIwJnBMsu9XJGnAmkTZcoIcQj59iw55rvmOIjM/P3qzmuD8iMrUqGSexxcbtktzboTZJ6x/QBY86r1FYGlQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) by
 DM4PR12MB5325.namprd12.prod.outlook.com (2603:10b6:5:39e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23; Thu, 9 Sep 2021 04:02:12 +0000
Received: from DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::344d:ea6f:fb1d:ddc8]) by DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::344d:ea6f:fb1d:ddc8%9]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 04:02:12 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Christoph Hellwig <hch@lst.de>
Cc: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com, Dan Williams <dan.j.williams@intel.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com> <20210830082800.GA6836@lst.de>
 <e40b3b79-f548-b87b-7a85-f654f25ed8dd@amd.com>
 <20210901082925.GA21961@lst.de>
 <11d64457-9d61-f82d-6c98-d68762dce85d@amd.com>
 <20210902081826.GA16283@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <8307c3b6-52c9-fbab-6f02-c00ed3e8a35e@amd.com>
Date: Thu, 9 Sep 2021 00:02:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210902081826.GA16283@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::16) To DM4PR12MB5133.namprd12.prod.outlook.com
 (2603:10b6:5:390::6)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.186.47.3) by
 YTOPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 04:02:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd77367-aa11-45e5-ef40-08d973469a3e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5325:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB53250B4366D863A3DC70D32492D59@DM4PR12MB5325.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QoB3mXpDVVBL3VlWuv5Np3fQLGpKYXd3C5LWNOvjTwv0hNETrIWaUFQffD/GDSHNZfcA1d1mQoxP4teRbZdRkGQDlDp2Cn4crmwnqF7HaU21Ff8FiujdO4bljDU2H9Wbcrrly0OPIw5c8Fspz+w+c2A72alVwl05mvRz4RyxKQEg3mcXMiXMa+EL8IaXwQitNoHTkHLoiQamTq2r+H6pRqlqlIGbFT3rPBGV+QPk+hglHkUfVL9tEkP7CH7VkcX8TsZns6NAE/zYJnW521vr7eReg/CclnNbSU+NUfXAu/Yk0nCf4dDAliLww+0//4NqXueWY0FUAx2FayoP5QdP1es6VRMCBH2TbItH5hNonb8uBChx/wXammQkwPbEDVCN9jClZahpaH5bhXriqW/8eUKI9EDtkIT/YBV9u7SnjFuyn6rExA1qUoF8JMMo1jVaKD5RksZ8ZLkFQhSZhchupVRXQ56phvAklSYnrz3xR5VpfczPzBWeneQdGg3OsPzRU5tWug9YEHkasSi47UXPJ+zlJdNSBcjqZKcj9o1z2JpL66JXb/fAw8deNFrFda4wqz3V8mHHMRX5q7G1vYv7ZcjBmh9skbQze6FRYmHoGquMBwkoTehhSI5SvPgbEElSTu5WBVx16fM0LvZAqjQdSq10dEBn8riBmxnU7nN4iELd83xaDMPD7ETSIViggzXF4tkMVu10TWaHku14Od/FA09iLqggqPPQAJ0hdE2s4xtla26aFZa6Ri2eDjbfRE7E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(316002)(4326008)(86362001)(36756003)(54906003)(5660300002)(26005)(478600001)(16576012)(6486002)(66946007)(31696002)(186003)(66556008)(6916009)(2906002)(38100700002)(7416002)(8936002)(8676002)(31686004)(83380400001)(2616005)(956004)(66476007)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHk3NTl2bUp1ZFo5NHQ2U3EvU0JXazVNVjQwbjNEQVhMNklRWW1LM0tMdEwz?=
 =?utf-8?B?bWdHNE5KMlhMbk1HWEVBdWh6Nk54ZDlzaS83VWRKSmZadytGR3J4eEtsUnM2?=
 =?utf-8?B?QmZnek9HZWJ5NFFUdUJHdVhhQ21McFFWRHExRzFTODBqMVVTajYwWFUxYmZr?=
 =?utf-8?B?UlNlaGgwSHlGTDZlV0NubXArbGJmYXNqTEk4bmhDZnZ1RUIxVDlJOFBFQnd2?=
 =?utf-8?B?b2lCWXhpdzJqQW9EbGVoTTQ5SUNZRjc2b2RjVWJNNzZiWnY2M1ZrV3Z1NGNl?=
 =?utf-8?B?UXdRdFpjRTd2VGJpSi9ocGtEVU5jU3AzRXZva0lkZWR0WDdRVXphSjR1WEQy?=
 =?utf-8?B?UEtQc2YrZ1B6Q1MyTys5RlBsMVFYalpJcEl5OWJNTU1WL2RETFZkSWxRV3BM?=
 =?utf-8?B?bmc5WGx3UEd1WkhwdDhXMWxWdkdnN1hvb0xCa2lxN3lEMEVESUNmVTJieW5W?=
 =?utf-8?B?eU44TVkxNUY0SUFSUGV0SXhLUk9XcmNpczZHUVlQK2dQNU9rN3JydDlqZmtE?=
 =?utf-8?B?bW5TVFp6QnRZeitzL0I4WElrV3owQ3FMUUYvQTF0dEtRb1ZaQnlLYmNienVN?=
 =?utf-8?B?aU16a2NDUEpwdEl5SWNvZ3F2WkdlZU16SmxtUWdycjJGNXBnZTY5SFBKYVNw?=
 =?utf-8?B?Ny9LNE5wekhKNnRZcnNrN0dQNGN2Wm1yRTEyUExOa29GQ0xDWExobzVkeE0v?=
 =?utf-8?B?cjRRTVZKY3NhUDhPS2RpbzdqUXRyNHMyQUZpUXNNSjZscXVnLzhtQ1RWd240?=
 =?utf-8?B?VGJ0bUlqdkU4NkRrRGNHWHYway9FR0RWalBHbGNDSEMwNHZiSEF1bnUxRmZw?=
 =?utf-8?B?UTZtd1ArLzRMUkxCQThRYnJ2eU9xcXVlR1RjcVZ2STBOQUNlNmhkcmlhSmZr?=
 =?utf-8?B?VzltZTZSY3lvYy9FQkhwNVh2S3hySTBhTFVIUnE3U0luMTAzSnNuSHAwWGJG?=
 =?utf-8?B?TmlYS1Y0V0pMejUxSFhYYUdLSFVicG5tbUl1QjZwblJkVTFGM01qckIzQlh1?=
 =?utf-8?B?TzE0MGJHNTJnajUvQmpVU3VMOGx2STBYd0lneXZ1dUUzOGY2K24yVnVhWHN4?=
 =?utf-8?B?SlQ5clQ3amJ4WjFWVXF5Sk9Za1Y2U1kzVUFRZENvNlc5S3JKOUNzRlU0TEE2?=
 =?utf-8?B?ckJXRHNrMTdqVGZCOXl5T3dndWx6L2prWnYvQk05T0UxRGZocFZLZ1VYOENv?=
 =?utf-8?B?VnI4UEFLK0FmT0g1TFI4bER2eDBXUzFZMlovRDBJYk05WlAxSmtmMHhEY1J5?=
 =?utf-8?B?eS9jMnBXS3pWVy9vWjY3MVVMcXR6dEFkY0JiTXNNNHZzdTgzQ0pGU0NJYThX?=
 =?utf-8?B?dXo4aWF3bU9MTzJmRjhRSHdFenBGS3lXZUtIOXpUd0o4RXp2VXNueWtFanR3?=
 =?utf-8?B?ZkhlcU1FOGw0elhqcDRjbUlibUpKUW8rekpqT2FjVTMrY0FBSWdkWkVwWDFi?=
 =?utf-8?B?a1pQbGFnZnloNENlcjJoWWg3cWtsajA0cE84VndObFRJQ2pBVnZEYXRhWkZo?=
 =?utf-8?B?UXg4OElaSFl2R1ZLMFlhVkhadk5tbG56MFZYWFNzekovVnJqMHhnOUlteUJu?=
 =?utf-8?B?KzFhdUdpNm8vUnRoRml3bER3cWNBRk1MZTUzZEtjN1hKT05Wb1lKYjNiTGpU?=
 =?utf-8?B?eVJjWFdRaUZpZm9DcHlBZ2FMaEw1VCtJakNwdy9lUERmd01kbmlGUVNYVXpQ?=
 =?utf-8?B?VjZWM0NXemJJd0o1eFYxMnlyeXhFTnJDbERXZStzZG1PY2JPNjVzNmsrMkRZ?=
 =?utf-8?Q?gyrXmVwZAdT9ZEC3qt750WGc8RgSZBZsB6clj4M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd77367-aa11-45e5-ef40-08d973469a3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 04:02:12.5084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EWvkY1SRC99zunzkk+9JwG2SHeDmCUY2WWVQV9YJLJ0d87x+F2Z93ApOfz03yEa5uAFliTZPhk2E8W368OSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
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

Am 2021-09-02 um 4:18 a.m. schrieb Christoph Hellwig:
> On Wed, Sep 01, 2021 at 11:40:43AM -0400, Felix Kuehling wrote:
>>>>> It looks like I'm totally misunderstanding what you are adding here
>>>>> then.  Why do we need any special treatment at all for memory that
>>>>> has normal struct pages and is part of the direct kernel map?
>>>> The pages are like normal memory for purposes of mapping them in CPU
>>>> page tables and for coherent access from the CPU.
>>> That's the user page tables.  What about the kernel direct map?
>>> If there is a normal kernel struct page backing there really should
>>> be no need for the pgmap.
>> I'm not sure. The physical address ranges are in the UEFI system address
>> map as special-purpose memory. Does Linux create the struct pages and
>> kernel direct map for that without a pgmap call? I didn't see that last
>> time I went digging through that code.
> So doing some googling finds a patch from Dan that claims to hand EFI
> special purpose memory to the device dax driver.  But when I try to
> follow the version that got merged it looks it is treated simply as an
> MMIO region to be claimed by drivers, which would not get a struct page.
>
> Dan, did I misunderstand how E820_TYPE_SOFT_RESERVED works?
>
>>>> From an application
>>>> perspective, we want file-backed and anonymous mappings to be able to
>>>> use DEVICE_PUBLIC pages with coherent CPU access. The goal is to
>>>> optimize performance for GPU heavy workloads while minimizing the need
>>>> to migrate data back-and-forth between system memory and device memory.
>>> I don't really understand that part.  file backed pages are always
>>> allocated by the file system using the pagecache helpers, that is
>>> using the page allocator.  Anonymouns memory also always comes from
>>> the page allocator.
>> I'm coming at this from my experience with DEVICE_PRIVATE. Both
>> anonymous and file-backed pages should be migrateable to DEVICE_PRIVATE
>> memory by the migrate_vma_* helpers for more efficient access by our
>> GPU. (*) It's part of the basic premise of HMM as I understand it. I
>> would expect the same thing to work for DEVICE_PUBLIC memory.
> Ok, so you want to migrate to and from them.  Not use DEVICE_PUBLIC
> for the actual page cache pages.  That maks a lot more sense.
>
>> I see DEVICE_PUBLIC as an improved version of DEVICE_PRIVATE that allows
>> the CPU to map the device memory coherently to minimize the need for
>> migrations when CPU and GPU access the same memory concurrently or
>> alternatingly. But we're not going as far as putting that memory
>> entirely under the management of the Linux memory manager and VM
>> subsystem. Our (and HPE's) system architects decided that this memory is
>> not suitable to be used like regular NUMA system memory by the Linux
>> memory manager.
> So yes.  It is a Memory Mapped I/O region, which unlike the PCIe BARs
> that people typically deal with is fully cache coherent.  I think this
> does make more sense as a description.
>
> But to go back to what start this discussion:  If these are memory
> mapped I/O pfn_valid should generally not return true for them.

As I understand it, pfn_valid should be true for any pfn that's part of
the kernel's physical memory map, i.e. is returned by page_to_pfn or
works with pfn_to_page. Both the hmm_range_fault and the migrate_vma_*
APIs use pfns to refer to regular system memory and ZONE_DEVICE pages
(even DEVICE_PRIVATE). Therefore I believe pfn_valid should be true for
ZONE_DEVICE pages as well.

Regards,
  Felix


>
> And as you already pointed out in reply to Alex we need to tighten the
> selection criteria one way or another.
