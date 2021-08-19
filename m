Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAF3F1F7C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 20:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0D16E8F9;
	Thu, 19 Aug 2021 18:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100126E8F9;
 Thu, 19 Aug 2021 18:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFBSLXGc3AXYiB2o3sT87sP1zO/Oa+7VizQ4v0JiBV+Dp6AzUXWjSDl4c6mTM0A90doZSdz6I07/LoJHLyR00AlJJXbTehWCDsqkSQ7IE5SSpPbc4NNZPcWAFKPT4mUMUs/Izmg7q4u9s5oskz4OOKtd3DdUpvLc9kboBxGLvV+tryInBRYMS+ynZtqinyXqoDTP5wfsf0Djv542Pj3YEkYUhkmMJZdWCquzqPaakWtQ/XGEIoHCcciIw+yzXb5nzbdteBMrZRIFoksigMgiv3FSou3VZSZPr5s0yPUf0+amaNXMtEIoNoL2r+zerEuEFRs7UcuxnQAN4qIF8y3zlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFc7qdDUgQq4K971TROI2d9CFYyaLY55LxcsvRtC2Xg=;
 b=E9WDEg82S5urOYI/UcJs2QyeEjE33uH+kWyISgo+e30st8F0P7TK5/umoeVdNPVy3bH/hJXyqadYrNV6dgweFyQYOgAZWrhOz7MaJN+Q/DGmG5BlrgGhiQWjcZ6qEhBWpVApN7/kgFzdaE++ydIbcycQhYUgjmgP8e55jWUZX6upblV31ozPBBvuIIKeWIa5yehhVjdgDaQpy7MOA/T1fGrSIepTY+8N9h2qi85Beyz6IFftkBpDZtbELypXqEI/pdG+MESJEyM4k67BzNMREw+5VUinPS66F01aQpOCSsRvfMDTqDWniVK0qnC1nY0SJoTV9QLkLtiOnzodXqi7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFc7qdDUgQq4K971TROI2d9CFYyaLY55LxcsvRtC2Xg=;
 b=XvYTgtDJ83eRuJdc8CBZXnnOaL1jrqgSa0Mrkqr9sJ+A8do1Gj6ubZVgckW0aRJGtiEWSMQ0LVdFFtNrSJI8uFLAUiXGc0UbH/FWO2AGBYsUdWqbZx9JLz89JKm30uql6lqziT2dFfzrDMSuL9imoqwFegp+VQAwboz1CwNTxxQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4429.namprd12.prod.outlook.com (2603:10b6:806:73::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 18:00:36 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 18:00:36 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: Ralph Campbell <rcampbell@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
 <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
 <e155ed59-8c3c-4046-e731-f082ee4b10bb@nvidia.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <600a4c43-271d-df98-d3e0-301af0e8d0fe@amd.com>
Date: Thu, 19 Aug 2021 13:00:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e155ed59-8c3c-4046-e731-f082ee4b10bb@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SN4PR0801CA0005.namprd08.prod.outlook.com
 (2603:10b6:803:29::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SN4PR0801CA0005.namprd08.prod.outlook.com (2603:10b6:803:29::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 18:00:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abe5aca7-f0f2-4737-8211-08d9633b3f44
X-MS-TrafficTypeDiagnostic: SA0PR12MB4429:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4429B7BDE45814044F917DF8FDC09@SA0PR12MB4429.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHNjHeR9+SH74tLlUx7aDxu+biaeaPW53mxXrg4ONXfP3JyNYhMDD0rhk3TBBiDqQHvbih8VpeOVDFrzpmE0mLOUVYhKl20IlQeQ/wiZtvEzEOkDcwt1cIsq27PWlUR2+oSID/NdrzXrm9wNZbzmhu/EvQOADAUIsPmdbc6MS3dxoDgsGrYDH/3Ox+PuLtDoiAzSp74Ax9In+0mFSRXWJQKOcUeCQscApgtnlx87wWiM9t7Cih5vRpYis9IokeRXm0dQF1G9YiWkeskPy1brM8bodm/AcguWyS3m8sMxyjIG18FOOy6LbiOIwqHTL6HQt8eZPQye9NL1UFJ8xFdm+vuNFuMnVf2P0vHWioqjTmbsIZJ7OQ0BsptvpPy/sdH3bMKwlYXh7fU/vHmSofWN0dVYw/JPrjSvnDzKRhNPuVAV2u00+p3Foh0NJHJtdWKn2VUX5lkEYppi321FugUMEBLxf9edQpRHIddmQ8JumuGOgAZ+rZbhe467wjMP5NglCe/t5skpgdo/J1EVsvcZ5MeRJFpg/XN1Q5NV13OLfuXTKTb6JIS7OD8raqd1k59xbyOUlL7p2fqrKwykak+WWzczxmJ8iaLQ9OzygdtDG9hXign/nF4O5KPl28suuyqXi+OB+CUcwXkbtiqhi6EsdAaaAMkk6kcRc76FOZqOFQjmAN95alnrI8CJZ5TuYRjuKioGqUBivM9fbhtCcsx4UWhGruSuHSOMVwZYKI3ARiTYZy2mJrlWjXKezW/mf0pofm4TKIshmE8ybw0OP+7lsUHlIXZ4x/8egQ2PRP9CZ05qQzj8tWNTHMxsPxtSszy5qYu1Caip6vYDWc1nuFVze9AOdxtAZnM8uaWdw62+Q7vr+D6eebOc34TEFuYbRguA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(31696002)(36756003)(2906002)(66946007)(83380400001)(38350700002)(110136005)(86362001)(38100700002)(31686004)(16576012)(7416002)(316002)(5660300002)(52116002)(8936002)(478600001)(45080400002)(956004)(4326008)(53546011)(186003)(966005)(6486002)(66476007)(66556008)(26005)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGZqeXVWcGR0VmhVenhSYW1FNWt6SzZiNkp5Y2JiQ2I0emlJR2pQT1JSZUpm?=
 =?utf-8?B?a1REbzBCdFlrME4ycENITUlaQkdCc2t2TzBzSGo3UStQbjZFUDlpWnRzbHNh?=
 =?utf-8?B?QUt4aGIwc1lFdmZRWXJQOW1iRFVqR25NcmJNZ3FHTmhiZzhnSHk1Mk10RE5x?=
 =?utf-8?B?bHU2eHBmQktCcFFWUWZJYnpQSnFjWUxCeVhxODFWeXovZ3R4djhmYUE5WFZq?=
 =?utf-8?B?a04zY0l0ZS9XQ3ZCcGNKYWQxd3RPRlNFRWN3d1NsdU5hUDJtMGh5NzB1RnpN?=
 =?utf-8?B?VjgzWEpIamtheG44bVQvemYzS1RxWmpEOWlxMlZ0K0tBY2xZMUlORW1XSkQr?=
 =?utf-8?B?aEE2N0xEWEVJSE5kK0xJNmdVd2pnazd4VHNFWUlXQVpFdVdhcHMwQXN6eGRB?=
 =?utf-8?B?a1FZNXJwWEN2WXNRQ0c3YitqWU9McHQ1YVJYNXpDTzFpVHJyM2svQkxJS3A4?=
 =?utf-8?B?bG1FTUF5M3lwY1BacjVJOWtHV0VlcEJvOGRqQ3hnMjdJd01HSmhzL3llM3BM?=
 =?utf-8?B?ZWV2RXY5YVFHQzJQKzVLYlgwODBBdzRJeE1NL2ltRy9RbzNsdlVaRmRMVndq?=
 =?utf-8?B?V3JlMXVQbDhra0FTSlV4d2sxblB3YmZYVTZqUi9laU1FYndDbS9wS1psaWxP?=
 =?utf-8?B?UkhESlhEU2lqNkwxbktLZEMyeXRralBGNzQwRzlKS0ZIL1FJMVY0Vm9YNGVP?=
 =?utf-8?B?WWUvWmR5SFhBdkhvOG5GTWZaK2w3OVRaMWNVRmdhdGJDM0Z6SGVLTVZDZVJ1?=
 =?utf-8?B?UlNoRllPRFVkVFJnMWowSUdEaldsR0VTd1FUd0JyWEtEbnRoSEg3R1Q0NTd2?=
 =?utf-8?B?c1l4d2o3a1lVTGlDZHdzWDFnYzhRbytQRVE4ZlFvMGU3MG52Unlad29nVFVS?=
 =?utf-8?B?akdRY0lIRHZvdktLdUt0OUFZOTV0dFhCdXhaY3NORWlDL1h2ZTQwdXFIVGVo?=
 =?utf-8?B?OXFrcW1vdFNjejBuOWZIc2RMYWt2ZS9TdVowZHNZM2xqSmJrR1NSa2FZT1Jx?=
 =?utf-8?B?dUQwVDg0MmdRYnVsSHdYUVRCQVhlN2xhTUE0ZzFTZ0t3dGZsQzhmKzBZKzJp?=
 =?utf-8?B?MlNTVDRWYmgwWk5jQ3I5QmREZGpMNXVpVjBwK3Rjb21yc2lkQ1hucEdXMjFn?=
 =?utf-8?B?ZlpVelJSUk9HVW4raGp5WkQvS09SdHJGc2o1RW82eld5SDN5UmQ3eGxQWmRu?=
 =?utf-8?B?YjFmUmhxREtYcHN6Y002Y2tkRWJURUN3SGZyVmlPaWgwY1hiYlk0L2QzbGlj?=
 =?utf-8?B?eHJyaVhIZmx0Y0N4M2ZQL0xKNE1zOHBXSjVzYitSM2ZKL1JJN1hBZWZwRmkr?=
 =?utf-8?B?TE1xVjlVdUhJMGJFMHkrVWpuOVF6MGtyQkt5QkU3NytTV08vODlGSk00VGl5?=
 =?utf-8?B?d3dVNmdEd1c3K2NlL1I1MW84TEorVGNFOU1xTDArUlY1aC9SdWRqWWlGanEz?=
 =?utf-8?B?RFNSWDc3TldDcEtCSXk0ZVd5U3hIUEtyM01yTzF5TUQ5akpQWjVubVg2aS95?=
 =?utf-8?B?cVdRL3NMKzY5ZGlGZTVHZTJFcTNJT2NJdEE3Q2swY2lEamg1ZnhXUXdkUU02?=
 =?utf-8?B?VVd1ajJETDhET1ZmSUxqTW9xVzkyV2hiTy8wUkRkaHZSN2lJT04rS09RcGJM?=
 =?utf-8?B?b0pTK1p0T0JZeTExNmtwUDZmNDZXbWxYTnpJd2YwcFJoNnFoajRzN05GNU5N?=
 =?utf-8?B?VGZrNldibExuRjBERldKZzVGY1hjOG01VXBOdUprQS9HUC8xaFdGN1lGazJu?=
 =?utf-8?Q?QmRo8UOWBzrnvaJJGmHiFkHx493URTEIQviqvu4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe5aca7-f0f2-4737-8211-08d9633b3f44
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 18:00:36.7610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Be7zvYpmkKN2Gcmap1vRnE5hHjBENfT3IYsvMZI4g4lWK++LZiCMFKX6fzahDcZ0nB1nZF3KQbc9CryHCpAMbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4429
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


On 8/18/2021 2:28 PM, Ralph Campbell wrote:
> On 8/17/21 5:35 PM, Felix Kuehling wrote:
>> Am 2021-08-17 um 8:01 p.m. schrieb Ralph Campbell:
>>> On 8/12/21 11:31 PM, Alex Sierra wrote:
>>>> From: Ralph Campbell <rcampbell@nvidia.com>
>>>>
>>>> ZONE_DEVICE struct pages have an extra reference count that
>>>> complicates the
>>>> code for put_page() and several places in the kernel that need to
>>>> check the
>>>> reference count to see that a page is not being used (gup, compaction,
>>>> migration, etc.). Clean up the code so the reference count doesn't
>>>> need to
>>>> be treated specially for ZONE_DEVICE.
>>>>
>>>> v2:
>>>> AS: merged this patch in linux 5.11 version
>>>>
>>>> v5:
>>>> AS: add condition at try_grab_page to check for the zone device type,
>>>> while
>>>> page ref counter is checked less/equal to zero. In case of device
>>>> zone, pages
>>>> ref counter are initialized to zero.
>>>>
>>>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>> ---
>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>>>    fs/dax.c                               |  4 +-
>>>>    include/linux/dax.h                    |  2 +-
>>>>    include/linux/memremap.h               |  7 +--
>>>>    include/linux/mm.h                     | 13 +----
>>>>    lib/test_hmm.c                         |  2 +-
>>>>    mm/internal.h                          |  8 +++
>>>>    mm/memremap.c                          | 68 
>>>> +++++++-------------------
>>>>    mm/migrate.c                           |  5 --
>>>>    mm/page_alloc.c                        |  3 ++
>>>>    mm/swap.c                              | 45 ++---------------
>>>>    12 files changed, 46 insertions(+), 115 deletions(-)
>>>>
>>> I haven't seen a response to the issues I raised back at v3 of this
>>> series.
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-mm%2F4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc%40nvidia.com%2F&amp;data=04%7C01%7Calex.sierra%40amd.com%7Cd2bd2d4fbf764528540908d9627e5dcd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649117156919772%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=P7FxYm%2BkJaCkMFa3OHtuKrPOn7SvytFRmYQdIzq7rN4%3D&amp;reserved=0 
>>>
>>>
>>>
>>> Did I miss something?
>> I think part of the response was that we did more testing. Alex added
>> support for DEVICE_GENERIC pages to test_hmm and he ran DAX tests
>> recommended by Theodore Tso. In that testing he ran into a WARN_ON_ONCE
>> about a zero page refcount in try_get_page. The fix is in the latest
>> version of patch 2. But it's already obsolete because John Hubbard is
>> about to remove that function altogether.
>>
>> I think the issues you raised were more uncertainty than known bugs. It
>> seems the fact that you can have DAX pages with 0 refcount is a feature
>> more than a bug.
>>
>> Regards,
>>    Felix
>
> Did you test on a system without CONFIG_ARCH_HAS_PTE_SPECIAL defined?
> In that case, mmap() of a DAX device will call insert_page() which calls
> get_page() which would trigger VM_BUG_ON_PAGE().
>
> I can believe it is OK for PTE_SPECIAL page table entries to have no
> struct page or that MEMORY_DEVICE_GENERIC struct pages be mapped with
> a zero reference count using insert_pfn().
Hi Ralph,
We have tried the DAX tests with and without CONFIG_ARCH_HAS_PTE_SPECIAL 
defined.
Apparently none of the tests touches that condition for a DAX device. Of 
course,
that doesn't mean it could happen.

Regards,
Alex S.

>
>
> I find it hard to believe that other MM developers don't see an issue
> with a struct page with refcount == 0 and mapcount == 1.
>
> I don't see where init_page_count() is being called for the
> MEMORY_DEVICE_GENERIC or MEMORY_DEVICE_PRIVATE struct pages the AMD
> driver allocates and passes to migrate_vma_setup().
> Looks like svm_migrate_get_vram_page() needs to call init_page_count()
> instead of get_page(). (I'm looking at branch 
> origin/alexsierrag/device_generic
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FRadeonOpenCompute%2FROCK-Kernel-Driver.git&amp;data=04%7C01%7Calex.sierra%40amd.com%7Cd2bd2d4fbf764528540908d9627e5dcd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649117156919772%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=IXe8HP2s8x5OdJdERBkGOYJCQk3iqCu5AYkwpDL8zec%3D&amp;reserved=0)
Yes, you're right. My bad. Thanks for catching this up. I didn't realize 
I was missing
to define CONFIG_DEBUG_VM on my build. Therefore this BUG was never caught.
It worked after I replaced get_pages by init_page_count at
svm_migrate_get_vram_page. However, I don't think this is the best way 
to fix it.
Ideally, get_pages call should work for device pages with ref count 
equal to 0
too. Otherwise, we could overwrite refcounter if someone else is 
grabbing the page
concurrently.
I was thinking to add a special condition in get_pages for dev pages. 
This could
also fix the insert_page -> get_page call from a DAX device.

Regards,
Alex S.
>
>
> Also, what about the other places where is_device_private_page() is 
> called?
> Don't they need to be updated to call is_device_page() instead?
> One of my goals for this patch was to remove special casing reference 
> counts
> for ZONE_DEVICE pages in rmap.c, etc.
Correct, is_device_private_page is still used in rmap, memcontrol and 
migrate.c files
Looks like rmap and memcontrol should be replaced by is_device_page 
function. However,
I still need test to validate this. For migrate.c is used in 
remove_migration_pte and
migrate_vma_insert_page, however these are specific conditions for 
private device type
Thanks for raise these questions, I think we're getting close.

Regards,
Alex S.
>
> I still think this patch needs an ACK from a FS/DAX maintainer.
>
