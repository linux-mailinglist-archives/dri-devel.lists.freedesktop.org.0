Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC95E4DBD45
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 03:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A7C10EAD3;
	Thu, 17 Mar 2022 02:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4810E039;
 Thu, 17 Mar 2022 02:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLDDBMfwn9Ly3GpwhdtwQANa3eKAEtSX0SEBcxGNvAxagUFU0//drNJEjX6KxYXorjtBB/DV0ZYL5izrEeQWXCZ99zI5dcV/bLXlci8U5Zri7i89s+I0GfuBWufTVjX2DwEk+plhe6dXOrMOoAHEgdGIlJ1vpqJaU7YNHl/YVeeJ72mDqIXyqNuH7J2HBRZJ8fd9IpbYcEwir+trx//XRhLecUId+VyWssP5gNCwhjlozxIPtuE+wrYAcv5pUKZs9IIQRJOjednAYSC1C+ClJZICLKltGdj/YeOrKYYL6QnitgnFZh8P7ilZ0I1l/U/1g5TWFKKca0n8zwgx/oGcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2IUc6sSBHfAyfWR3EcfnQYIN7/iwGjIjbECCQIkknk=;
 b=GHBNNDaThIYMeMkK6IO85liCTKMCng8mjWTt6QlCydfQ2SBIkYk0fy26YDNDTAddFuUfHq9/F3TrnzJH5/VOwJJvO81ik5fkRCAedPmHJBAGK7Xo+ouRg9Rl9JX1b7Uj9zydQxGRfeVMuYSysUfMZTUJoqx2EBJBkh5ETa5l6/X+PX4KjG2qLYXuSUTewp4Afs3bx3lg7SPr4YhSTsMA1TwdYRZgenvmYGIRwZ3EmbFiMstdnQXc9Mq86pbf2XpiXnBwyx3pnhyrfF5WsLXE6qV+LlHwNodFk+FRixKBYjF0f7yd/CRcEtgedp5LXNtkx1qK9loqVedhlv3MKFg0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2IUc6sSBHfAyfWR3EcfnQYIN7/iwGjIjbECCQIkknk=;
 b=CVfc6HpE4cKFyPzlEtsJSLWHXj1Ir17mFo6//o3TAWQdKQmLn+4id2Wq8mvHOqCCItUgBNxkAF4xhg+AwYoQ7fdXwyq4fdlDWmYSsw0fS1nfBUJzUkJNAN91EqRFKHyNUAE2D0TnY9o9/fS8wNMpX9hpLaGWc2O28PjESNiv/Uzo19Ygju/56Vhz2oVD5yokLxHB4HILymM13MOJci6NPfmaTKNxHHaicIskgI/E3OzlkD32eBtrwnxXeCNdem5ZWBnx020Dg7SdqHbT8KukpsFJnLLrYwCkFPIgKqDHGBrnvFgBn7oM0sG2OFs4L3o8bwomwfJ9JAFYrzpHlhLZ6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY4PR12MB1607.namprd12.prod.outlook.com (2603:10b6:910:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 02:53:47 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::152f:613b:7041:68d6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::152f:613b:7041:68d6%7]) with mapi id 15.20.5061.030; Thu, 17 Mar 2022
 02:53:47 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
Date: Thu, 17 Mar 2022 13:50:37 +1100
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
 <YipQqqpTz8hZAbLZ@casper.infradead.org>
 <651099d6-21ae-16a6-e500-a87002468cda@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <651099d6-21ae-16a6-e500-a87002468cda@amd.com>
Message-ID: <87mthp8f2g.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BYAPR01CA0053.prod.exchangelabs.com (2603:10b6:a03:94::30)
 To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19b376ff-c325-4f39-e142-08da07c15b7d
X-MS-TrafficTypeDiagnostic: CY4PR12MB1607:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB16071B8EBB8013DEF13FB152DF129@CY4PR12MB1607.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jEheHv+5GLJoX3k2dqtm2lIejj/x0D9IKpLtUmNEZ4iBTz29vGgAWtC0yPAGbOsPXsh1JbYeDV9bjjjPpm03n1iN87sxODXzecBeExUZGlFcVUOPRxUR3sv6Y3yHFV61HhhFoRkVgmB+hrJCiQXwgCymFKUJUmSQ7fbTyntuch6VjBjzLJg6zWGi2HiPJzfvj25LbbhBMHPKbbHgtlc7YNc5n51NWAmDq+cShMQ69m/MvnaD45KNiRIMKjVzSb3h5921LKyvT56aaQPr0Rh5rhAuyzGvQrraoHLOBrY70hG2NB8sorZ0AA3ZCA23lIA1GYKCFXdYGGvrupQLB+c8VgEh2+/9RmNgWIIMz9asSuYQ+PvIVVzscmGH9xVgoc1Pu9BLw82w0BmUNjP9ARyC/qPo/yCsvMkbkN0QdOQ+qHQa9pfNNBdRKjd1UOMf1OzW/nOfMpGgrzj9vF87cq3mlVXDX5lR4SnkXFOjNFqRIlJ2rlNSnvXu448HJMiuNTqyltnGHhuJjxVK58VFXSKKMVZMMXSbe6kPqGOA4onjed2Vo5m9F6Nf5SaEQm3AVal3ikAGWrW2hooRQR5Rswh4Y7tIz7VYLtw3rMRrM0oR0wrx6Fzi+oYhooJ2cI+JHj9CQPtwXWJSlbyjD9TDP6NHMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66946007)(33964004)(2906002)(508600001)(7416002)(8936002)(5660300002)(66476007)(66556008)(8676002)(38100700002)(186003)(316002)(26005)(83380400001)(86362001)(54906003)(6486002)(44144004)(6666004)(6512007)(4326008)(9686003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE9ZVGE1bUk2SVpxaUcxQXNBU1o2RUtycG5FMkFXUUpuRDVsQ1hXaXR2TEFQ?=
 =?utf-8?B?eFpaZnRldTFTYjF1MGhGYVE4L2FnaHVpZXNVVFVTSUN5WjUrdkxka2dsTnBi?=
 =?utf-8?B?UEVXOGJ5MkxpRHlmWWNRZ3pTQTBITkJlaGVMeDkvbXQyUzNzZ3dFTjV2bUFO?=
 =?utf-8?B?Q215dTBnODUvN3ZENjNGdWs1U0FiYyt1RzFFTWZra1dGNHF2UTRqbGcyOTI5?=
 =?utf-8?B?bjBZVXNlMXh2L2hLNldDQUMxdzRsa2trWWpZZEpTTzduYTE4RFNKUzRYNitY?=
 =?utf-8?B?ZUtrdWRjWk1TTFJDMS9NT3EvaGVPRXhVcTVNZnUyK2ZUM1RNWDFzMUR1Y1VB?=
 =?utf-8?B?RzhrQ2JxRGJnQ0JnbThuNk41SzJXM2JUN25lU2prWHQvMHJCQXQ3ZUgzYmxE?=
 =?utf-8?B?Tzgxa2hRRHppM0s2L00zVlRxZVlTL1VOVmg2VWQyUlZXVVNMM2I3LzdudVBY?=
 =?utf-8?B?Rm1OUnB5Q2F6bWQ5bUpVcTAxY1E4a2IyKzNic09weW9YY1pBMFd0VFd4THE1?=
 =?utf-8?B?aVFhK2tkeW9aODFjcG1xdVdDcTYxVmtxeCt3WjJjS09COVpxMHVlMEp3eENw?=
 =?utf-8?B?a0FmaytvbkdaWVhCRGk0c215enR5WmhVUDBGSjNvdVhDNWpnTWNDQlQzVU9m?=
 =?utf-8?B?aVlzTWdiWVkrbXhnTU13dGUwVHFxbWZ6SUJjem9VbUpOeDFXYU8vTnZadjI0?=
 =?utf-8?B?Q3hULzNWb080d005NEVaUGROUzlyNnhQYU1lZXMyckpsK2FyYUJ0V1BaT3ha?=
 =?utf-8?B?bjdzZ1BsZStnR1pOaUxmMkFwdSt2SW5aT2Zzek1ucXF0YTUzNkVvZU82dllS?=
 =?utf-8?B?YTRUbW1Odnk3OVZiRUEwYTU4NFBoNzBzMlV1ZUJXWHVIVXlrWDMzL3E4Z1A1?=
 =?utf-8?B?ZXlQQ2JvMUllWk9JU1BOOU1kQUpUVDFCNUZuZGZrT1ByQ2ROcnNoRFJpTWlm?=
 =?utf-8?B?VzlXSVpFLzBreUdpeEh5Y0FPTnAzREVpZDBxZTFkRFhSajIyYkV3YTZ0ek1I?=
 =?utf-8?B?Um1ma1hUeS8xZEpvektLSS9rMmVneGN6UWluc212aEhtbngyamxsR0orb1oz?=
 =?utf-8?B?MFdISVRObExvaXBtNFAzQWhtTTRtR1diVmJ4bVhoMzJyVWhtd2QycVp4QWw5?=
 =?utf-8?B?MTllQ2xudm1LTUVBUTczNXIwbmNmR0VLUlBZb1k2K0ZqTkwyaCt6YlpYWjBz?=
 =?utf-8?B?QktJNlE5eXZxUEZhRCtzWHV2eVd6b2RaTGI1Y01wNHhQZDR3NlhqclZ1bE9w?=
 =?utf-8?B?Zk5BOVJNRmtGcUFrVVRueFlDNThCYkh5RmFYYUNueXJkcUxmYmRhY0xJNXJ5?=
 =?utf-8?B?MnpmL01rUmdUSmJIVEVwT2pDZktmK0FHVnBnT2VsWlNoQ2xQUnVqVWxpdFhH?=
 =?utf-8?B?T1FuL29Wa0IxNXByN3JPS05RV0RMcisyWXVBTXN2SlhlclFjTFhBUDdHNCs4?=
 =?utf-8?B?cmhJSytUZFJaZm9abE05bmJudk5MdExvSk9xRkkzQ1lITmZNWGhmSVZ0OEIv?=
 =?utf-8?B?M285SUhNZ3U2cHRIV2RJQVR4eCtuMzB1Vy9Va2VNcmp5dmsvdTJDZzdNWnRR?=
 =?utf-8?B?T1pvK05hWHVHQTlIdThJYmZDaXQvZFFpTmFoN0FDMHRLQjNzbVNIRVdjUjlP?=
 =?utf-8?B?Y0FDcmZOZ2psc1BFMlRhZlNDbC85eDl4RjFUR280VkYxeUdLRFpGWmI3ZEV0?=
 =?utf-8?B?cEw2R3c5ZVlndmxJbHdDQ2tOVXpEMkRTcmpPY1FaNko2akZQOEdZb05CajNM?=
 =?utf-8?B?WUxELzFnYi9UeGdjTXZuRjQzYVFpMWJHV3gyaHluVXVneXFvbCtzSE4vMlFl?=
 =?utf-8?B?TXF1Y3d1bUVPUllOY3BGOHR2S1V1YkIxYmxENzNTNGN2NzNsdlVuZWpzWnJF?=
 =?utf-8?B?NXJDSktNMUtzdVJGZTkwMFlvQUpEdVluM0RNZTd6Uis5TE9pVUZ4akV6dU1O?=
 =?utf-8?Q?GVhZGIzbrAF7PoSfAuE0luZF7sF4I3PK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b376ff-c325-4f39-e142-08da07c15b7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 02:53:47.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Njvebd9FEeupqJel0mMFzNMP8IsU4YZjVqaer1R5AOakRYQQAOtR6Hca85D4biXVkdcBfU+4PwCfDetAHcU4Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1607
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com, david@redhat.com,
 dri-devel@lists.freedesktop.org, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Felix Kuehling <felix.kuehling@amd.com> writes:

> Am 2022-03-10 um 14:25 schrieb Matthew Wilcox:
>> On Thu, Mar 10, 2022 at 11:26:31AM -0600, Alex Sierra wrote:
>>> @@ -606,7 +606,7 @@ static void print_bad_pte(struct vm_area_struct *vm=
a, unsigned long addr,
>>>    * PFNMAP mappings in order to support COWable mappings.
>>>    *
>>>    */
>>> -struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long =
addr,
>>> +struct page *vm_normal_any_page(struct vm_area_struct *vma, unsigned l=
ong addr,
>>>   			    pte_t pte)
>>>   {
>>>   	unsigned long pfn =3D pte_pfn(pte);
>>> @@ -620,8 +620,6 @@ struct page *vm_normal_page(struct vm_area_struct *=
vma, unsigned long addr,
>>>   			return NULL;
>>>   		if (is_zero_pfn(pfn))
>>>   			return NULL;
>>> -		if (pte_devmap(pte))
>>> -			return NULL;
>>>     		print_bad_pte(vma, addr, pte, NULL);
>>>   		return NULL;
>> ... what?
>>
>> Haven't you just made it so that a devmap page always prints a bad PTE
>> message, and then returns NULL anyway?
>
> Yeah, that was stupid. :/=C2=A0 I think the long-term goal was to get rid=
 of
> pte_devmap. But for now, as long as we have pte_special with pte_devmap,
> we'll need a special case to handle that like a normal page.
>
> I only see the PFN_DEV|PFN_MAP flags set in a few places: drivers/dax/dev=
ice.c,
> drivers/nvdimm/pmem.c, fs/fuse/virtio_fs.c. I guess we need to test at le=
ast one
> of them for this patch series to make sure we're not breaking them.
>
>
>>
>> Surely this should be:
>>
>> 		if (pte_devmap(pte))
>> -			return NULL;
>> +			return pfn_to_page(pfn);
>>
>> or maybe
>>
>> +			goto check_pfn;
>>
>> But I don't know about that highest_memmap_pfn check.
>
> Looks to me like it should work. highest_memmap_pfn gets updated in
> memremap_pages -> pagemap_range -> move_pfn_range_to_zone ->
> memmap_init_range.

FWIW the previous version of this feature which was removed in 25b2995a35b6
("mm: remove MEMORY_DEVICE_PUBLIC support") had a similar comparison with
highest_memmap_pfn:

if (likely(pfn <=3D highest_memmap_pfn)) {
        struct page *page =3D pfn_to_page(pfn);

        if (is_device_public_page(page)) {
                if (with_public_device)
                        return page;
                return NULL;
        }
}

> Regards,
> =C2=A0 Felix
>
>
>>
>>> @@ -661,6 +659,22 @@ struct page *vm_normal_page(struct vm_area_struct =
*vma, unsigned long addr,
>>>   	return pfn_to_page(pfn);
>>>   }
>>>   +/*
>>> + * vm_normal_lru_page -- This function gets the "struct page" associat=
ed
>>> + * with a pte only for page cache and anon page. These pages are LRU h=
andled.
>>> + */
>>> +struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned l=
ong addr,
>>> +			    pte_t pte)
>> It seems a shame to add a new function without proper kernel-doc.
>>

--=-=-=--
