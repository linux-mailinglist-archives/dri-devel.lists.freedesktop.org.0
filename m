Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4443F2147
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 22:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB076E9D2;
	Thu, 19 Aug 2021 20:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23196E9D2;
 Thu, 19 Aug 2021 20:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYtJKCeN8uGLsNIm60zi1Q8QmcJvv6DnmR77GxkiP/SMn00ACempbN2pvPrhWmUr8uTv7WMu7Xaz4BQONNe+9abQtBAsGusinKPP3W0zgXieIAbq+IbHxPndFiEgwRvzbhxZltmuZkl5Syq3DKEj/FZPUM5tQSe7F5ycrM0m8cucj7DnprbojIkc4G2uFjHytz0w0mfYcESORer0LDOt0sMdGtD0Vro4ZIMyAwEgJ0VWiMEDswhS22SrhsOiqR/PNWb0XaPKuIwYK8+pN1hqGX4p4FLNIYZV1Zh/sXgQeqKUj6sJ/GWBCNq1VQyjDuqffkckNC99f3seNyaTn/DtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCBUfTTqqpuerEHnFnvf/1cxvCyZmPPHUtnQsc01D+c=;
 b=diKiGpEjexEkXQJmL6CNadRwdcwg18BoV5s+bW28nKeCjOxiQsfvAuAdxJS0F5hnE2jdQhXuhnpT0Qwe68WF4P2n0LGMMAqyPit7RDod2TW/s9Yr8Mr4nnTeziROHpopgFH3eeprfVB/sJ/ofJN5vj/XCVSV05+0Fz0bma+ySi0wSPVv2NFkd6O07hHBhM2gxPkmufdw8sEwe532JG0kWtuC0WsakoBoU+YiBCVxqYNP9o5br7dMJMe0IMQQ8AqtwZglIv4VM9hjo6WJYBuga/Bw3KuGHtq+WKc7gs56QOS9EPVonye2LEHeMFFDvnbwmGETaPyWuimGJXQY04xwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCBUfTTqqpuerEHnFnvf/1cxvCyZmPPHUtnQsc01D+c=;
 b=L50r1G2b2A9nNP+Msp9qTKeE3Br5rIv49P8MLkvFOXXbvofBFd7XPzrQxx5v5MP0OdL687JwZJDUhxH0BdCOLEic6VfGoBRubNLAfVSxMxQ1tMPyDi5dSScBvp4+h6leyolz2hsXux0Ea3FoUL3oAyKBDzW30MGMV3cLppVjVrs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5225.namprd12.prod.outlook.com (2603:10b6:408:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 19:59:58 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Thu, 19 Aug 2021
 19:59:58 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
 <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
 <e155ed59-8c3c-4046-e731-f082ee4b10bb@nvidia.com>
 <600a4c43-271d-df98-d3e0-301af0e8d0fe@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <40d4a39e-e874-4ba3-e9bc-42015f0383fa@amd.com>
Date: Thu, 19 Aug 2021 15:59:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <600a4c43-271d-df98-d3e0-301af0e8d0fe@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 19:59:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99952300-d5ec-4202-b876-08d9634bebe3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5225:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5225DB038126294EB9ED0DE592C09@BN9PR12MB5225.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zyzMqYoMPm0AUW0TALbJnaBOM3c1cqF7RdX7FxgbPWS+OPXsM0q82XMjWBw86mR91yqTV4vTS6PNModKxD6T9QinQC9gcbstrVOmUQTOLxraRLiHJA1kkmcDceFu2DFXxi15VUMEti5ENo/IZK9h0vRACAPrVOp7hygougF8M5Ju+v3NGV9tZt6JldCKXHrEuYNnBefXMxfiYsWyrmF5DQdqVNIsD+7ZEeArf4ThsLNaWoqKTSDIZflPGjBy4bNIF3Dq76Uf0byVZAnnRlm7s0qbQrVMCHnaronju/cikajWxIBLBOpdMhHW8dlwDa0lLjnHm1dJLTXFc4uYDADbXjqijEuG+T/4aV4d4ne8+yPM7wuX2R3490rTi3ji5qBnLRoqylq40hxgZ2kF4tI4+aqqcDfkdqD1ieeV9dhDwpQ2FBuMDtthkaTZy8vLyFOkOO1HdwTfWq7fW1W/tIrwSqEapBKTCZ0pvzDzkJ6Yo3scgceQ0X0F+c4rjq1kAVO1Fy7L48weL9I/UPHhdFj+R3iNShvLWpsIBNjxwriPQL8Z8/hxL//0u2DjNFaQ6LiaSX8PzjqAwPvrwfwRC1Gd7oZOhAK/saYcnKdn/DKAXDzbLIrfeXgLuuVyb1sZon1D84iJ9gD6lCzXP1eZcVFTwnZIZVfJ5owAGdBv8zZcmH1n4LsTTI9g1kiMygl+f115nWmuuNlkDIMwibxd7/OOps08jOIZuF6bNaL3kTcuUJN0vNrO/XGWB9wlIv5mf2RvFYgZBhy/OPShEh7RmD8b5UzMjzu4QQ+sbVdCmb9TTvd7vBUZGLAlStu2dGurggwNfyyYautremqzgNwp6PXWLYJL3AwdPKBSEATQu16GqEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(84040400005)(36756003)(83380400001)(110136005)(478600001)(2906002)(966005)(86362001)(956004)(66946007)(31686004)(31696002)(44832011)(66476007)(5660300002)(8936002)(2616005)(66556008)(26005)(53546011)(6486002)(38100700002)(4326008)(316002)(186003)(8676002)(16576012)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdoYS9SNkloQjhvQzZhS3VIY3Vla2I1SjZSUlJVNmsxUWVsdDE4UkdLaThZ?=
 =?utf-8?B?c1VuRXg4aDJnblZJc1ppK2diMEVKUzRRWlNPV2dHUCt5WTdPOUdFeURhdlE0?=
 =?utf-8?B?NGtCbXJJTmx0cnZaeGJGdjlmeW5BeC80L2F5T1kwcmpiRjhYcFdJWktidi9U?=
 =?utf-8?B?NlBONk5GU2pUaWlUK1RxV2o0ZFdGQWxTbnlkZjF0L001NTlhN2dKUkxKNWky?=
 =?utf-8?B?aVJRVUtVM3FqUkl0MjdMd0x5R2pPaHAvU0c5WWFWdXpIamFNMHpJYzY4clVr?=
 =?utf-8?B?SXd1Z1pxUVhGQ2RiZWdUcU1RUld0a1dldnluUU1rVkRXaFZnNUpVYXpBOUxl?=
 =?utf-8?B?SnVqTTNCZzl2Z09wdEprcTNPbFFKSlZGd2RqdW54T0pkb2xFYUg3Si9hejQ4?=
 =?utf-8?B?TkVxRWQ3bUFWbzZNSlY5WXJkTWFQY2JHMVV4UTJ5K1UveWZrejNKaTRHdncr?=
 =?utf-8?B?dmZtNmhqZDgrQzRnV1FEeGNtaU5lc3J2dTgwMEh6YkVRTHVqeCtkbVBhVzVp?=
 =?utf-8?B?UGxWeWp1SmhzaW1UYnhWSy9OTW4ydnE3VzdSYWloL1cxR2Y1ak5XMGlKbDY2?=
 =?utf-8?B?aitzNXRTclg2YkpGRk5ZYnhTTk9nZVBQVEd5TlVtNGMzeWNHZG1IZ2UrRzZy?=
 =?utf-8?B?czVWYXlGOXhEWUF1K0FGOGw1VGYrRVA3WVR1RmQ0SHljcHg0Qmw4SDFFNnNa?=
 =?utf-8?B?VXJYQzIyaGp5Q1BTVU5mODEzMlZHTFd0Um1INGRVR3JUWjA2Y3RqQmZoSTdB?=
 =?utf-8?B?UVpyeXZTRGg3Uk9lN21ROTNBaVNnWWN6bHFWUk8vdE12bWRoSHM3a2FrWHBn?=
 =?utf-8?B?ZHhOWTFIbW80REkwaVV5bENGYzZKSE4rQkMzQnRLcGZIYkhwb3hjVytJZE1m?=
 =?utf-8?B?Y3AvRmwxcmplNXNPZXE5cWpmcWVVMEJJMm8wR0hPcnNoc1NWekRqRXVvZzVw?=
 =?utf-8?B?ZUdpM0lFbjltQnpCVU5HcVNzWTJuNHVpTFgvVnBHRjNqMWFZTVdjMUtuMDJT?=
 =?utf-8?B?UC9ENEROR2lvSU1RNUM4aHJ2YzZ1WnhoZzhsTHEvc2M1YnVrZEtCN3AxQk90?=
 =?utf-8?B?WFd5ZTQ0aEJKQm5ReWlKNWJlNGlXT05QTGJnN1NGcFQ5amNOTG9sbnBBU0dG?=
 =?utf-8?B?cXc0VE9UV2dFSDU4aDRhWWVMbVIzWUJZTWhNL2NvQzVyQVdSc2ZtZ1BJWXdV?=
 =?utf-8?B?Y2dvUGJ0ZzZWMllSU0o0VTRqZVFLbC9OemlzZGJUOHk0TnlTdGJZS0M0NTR6?=
 =?utf-8?B?c2pNOE5PT3YzYkNtNEV4MmhNeFBzdkNrMUdZTGY0anRuUnpxczhrMWhLeEla?=
 =?utf-8?B?Tkx4Y2JUdzZpN1ZJb2tGbjdDS1J6ZXdkOVNVay95SDhxVm4rVUFoOWZFWkcr?=
 =?utf-8?B?dWltU0k2RWNmeTF6RnhoeGNPYlpzUzU4QlZPblhGUFFYQXZRelRCb0JuRGNy?=
 =?utf-8?B?eWdVREdwMUVDMVBUeWpLOW5JaGdGLzhKekxTLzFmZ2JyMlFUSUFvVm5PRm1L?=
 =?utf-8?B?MWJ4SVRlZEtjK21SMDlIVmgyaTFhNWhDZldSeWE1bkt3ZnYzYkdBNEhXb3Vo?=
 =?utf-8?B?UFBLbGFVSzZoaXlBd05PWVhqSHNTdDRHTDVabjNYbEhxRnNpb3c4Rms0U09Y?=
 =?utf-8?B?dnNSVXVjL2w2YVJpZHA5TXlaNXhpdWFpOU1mUW54YjJnZEYwbHdHVWdpVmpQ?=
 =?utf-8?B?bUIxSXYraHZpaXZmSVBid05sdDJVME1vRXFMR01LS3YrbW95UjllUmpDakVx?=
 =?utf-8?Q?bETeFv7HU0GIQVCv6hdnsQ+LXKMVp60Ae4kWA9a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99952300-d5ec-4202-b876-08d9634bebe3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 19:59:58.3222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D5Rc9gPcUn2Z48m3nIS4WUmkiN7jGGXrxx4yYvxI6GRvWNdsa8vXV9Zo8zh1elztzUqJqc+Ia+w5qGPGehFEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5225
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

Am 2021-08-19 um 2:00 p.m. schrieb Sierra Guiza, Alejandro (Alex):
>
> On 8/18/2021 2:28 PM, Ralph Campbell wrote:
>> On 8/17/21 5:35 PM, Felix Kuehling wrote:
>>> Am 2021-08-17 um 8:01 p.m. schrieb Ralph Campbell:
>>>> On 8/12/21 11:31 PM, Alex Sierra wrote:
>>>>> From: Ralph Campbell <rcampbell@nvidia.com>
>>>>>
>>>>> ZONE_DEVICE struct pages have an extra reference count that
>>>>> complicates the
>>>>> code for put_page() and several places in the kernel that need to
>>>>> check the
>>>>> reference count to see that a page is not being used (gup,
>>>>> compaction,
>>>>> migration, etc.). Clean up the code so the reference count doesn't
>>>>> need to
>>>>> be treated specially for ZONE_DEVICE.
>>>>>
>>>>> v2:
>>>>> AS: merged this patch in linux 5.11 version
>>>>>
>>>>> v5:
>>>>> AS: add condition at try_grab_page to check for the zone device type,
>>>>> while
>>>>> page ref counter is checked less/equal to zero. In case of device
>>>>> zone, pages
>>>>> ref counter are initialized to zero.
>>>>>
>>>>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>>> ---
>>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>>>>    fs/dax.c                               |  4 +-
>>>>>    include/linux/dax.h                    |  2 +-
>>>>>    include/linux/memremap.h               |  7 +--
>>>>>    include/linux/mm.h                     | 13 +----
>>>>>    lib/test_hmm.c                         |  2 +-
>>>>>    mm/internal.h                          |  8 +++
>>>>>    mm/memremap.c                          | 68
>>>>> +++++++-------------------
>>>>>    mm/migrate.c                           |  5 --
>>>>>    mm/page_alloc.c                        |  3 ++
>>>>>    mm/swap.c                              | 45 ++---------------
>>>>>    12 files changed, 46 insertions(+), 115 deletions(-)
>>>>>
>>>> I haven't seen a response to the issues I raised back at v3 of this
>>>> series.
>>>> https://lore.kernel.org/linux-mm/4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc@nvidia.com/
>>>>
>>>>
>>>>
>>>> Did I miss something?
>>> I think part of the response was that we did more testing. Alex added
>>> support for DEVICE_GENERIC pages to test_hmm and he ran DAX tests
>>> recommended by Theodore Tso. In that testing he ran into a WARN_ON_ONCE
>>> about a zero page refcount in try_get_page. The fix is in the latest
>>> version of patch 2. But it's already obsolete because John Hubbard is
>>> about to remove that function altogether.
>>>
>>> I think the issues you raised were more uncertainty than known bugs. It
>>> seems the fact that you can have DAX pages with 0 refcount is a feature
>>> more than a bug.
>>>
>>> Regards,
>>>    Felix
>>
>> Did you test on a system without CONFIG_ARCH_HAS_PTE_SPECIAL defined?
>> In that case, mmap() of a DAX device will call insert_page() which calls
>> get_page() which would trigger VM_BUG_ON_PAGE().
>>
>> I can believe it is OK for PTE_SPECIAL page table entries to have no
>> struct page or that MEMORY_DEVICE_GENERIC struct pages be mapped with
>> a zero reference count using insert_pfn().
> Hi Ralph,
> We have tried the DAX tests with and without
> CONFIG_ARCH_HAS_PTE_SPECIAL defined.
> Apparently none of the tests touches that condition for a DAX device.
> Of course,
> that doesn't mean it could happen.
>
> Regards,
> Alex S.
>
>>
>>
>> I find it hard to believe that other MM developers don't see an issue
>> with a struct page with refcount == 0 and mapcount == 1.
>>
>> I don't see where init_page_count() is being called for the
>> MEMORY_DEVICE_GENERIC or MEMORY_DEVICE_PRIVATE struct pages the AMD
>> driver allocates and passes to migrate_vma_setup().
>> Looks like svm_migrate_get_vram_page() needs to call init_page_count()
>> instead of get_page(). (I'm looking at branch
>> origin/alexsierrag/device_generic
>> https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver.git
> Yes, you're right. My bad. Thanks for catching this up. I didn't
> realize I was missing
> to define CONFIG_DEBUG_VM on my build. Therefore this BUG was never
> caught.
> It worked after I replaced get_pages by init_page_count at
> svm_migrate_get_vram_page. However, I don't think this is the best way
> to fix it.
> Ideally, get_pages call should work for device pages with ref count
> equal to 0
> too. Otherwise, we could overwrite refcounter if someone else is
> grabbing the page
> concurrently.

I think using init_page_count in svm_migrate_get_vram_page is the right
answer. This is where the page first gets allocated and initialized
(data migrated into it). I think nobody should have or try to take a
reference to the page before that. We should probably also add a
VM_BUG_ON_PAGE(page_ref_count(page) != 0) before calling init_page_count
to make sure of that.


> I was thinking to add a special condition in get_pages for dev pages.
> This could
> also fix the insert_page -> get_page call from a DAX device.

[+Theodore]

I got lost trying to understand how DAX counts page references and how
the PTE_SPECIAL option affects that. Theodore, can you help with this?
Is there an easy way to test without CONFIG_ARCH_HAS_PTE_SPECIAL on x86,
or do we need to test on a CPU architecture that doesn't support this
feature?

Thanks,
  Felix


>
> Regards,
> Alex S.
>>
>>
>> Also, what about the other places where is_device_private_page() is
>> called?
>> Don't they need to be updated to call is_device_page() instead?
>> One of my goals for this patch was to remove special casing reference
>> counts
>> for ZONE_DEVICE pages in rmap.c, etc.
> Correct, is_device_private_page is still used in rmap, memcontrol and
> migrate.c files
> Looks like rmap and memcontrol should be replaced by is_device_page
> function. However,
> I still need test to validate this. For migrate.c is used in
> remove_migration_pte and
> migrate_vma_insert_page, however these are specific conditions for
> private device type
> Thanks for raise these questions, I think we're getting close.
>
> Regards,
> Alex S.
>>
>> I still think this patch needs an ACK from a FS/DAX maintainer.
>>
