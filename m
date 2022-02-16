Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E104B8EA6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 17:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0677C10E64F;
	Wed, 16 Feb 2022 16:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663D310E649;
 Wed, 16 Feb 2022 16:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PARwtzBHpw71gd88b7eMhRRRMl7EFEgLBiaUghQNQ+CZHDvHTB3MjJxJ/25gtQNAN62SLVBZCn2w20P8HYjK6kwFo0qtr7PoMZ+1OSNyObATl1Mn4GbCoMfnxUKwA3rMyBQKa/rlildU2TGuP3wp7gTlsN3RimjHue4+ZQDqf8aixaoUbhRztk+BvoOmqWlDPqFe+9P2EkZ2JTziRw3ifBBBTXFCWYkZPW4AcR2wgaTPKAoyELnqQS+0tRoyaKtfJzCBDlAd42ObB4+xlTs/RhFYGHUFsiyORKWOVXvtbAfYDOqnnxoGBk3piAbD80bry3JB64UN02PRbKLINheYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hWFbG3vbl8TgBT8Z4DbUpAOIIH2ow8JRMteTkSIXSg=;
 b=m3526gzBI55Ki/JABXUbZCWa01gq8GiYh3/0ca/Kdbvx4IlvMgIOC++1LbpV7rAleI1PGAQK1HtcL3jZEITzY7Ikly6OLitqbq+1cjl3UveIkB1Zb+gRn1MzLXfBWvJuu2ex2K8bVqNqd0pfKZcEd63zzLPC6B8/J4LcuKAJ1fGYqaZv4bXGghLNB3gNpxeDYTeY3q0leAwTtVobXC0X2CP/h92kDI7IG78/Y/QfFuW/TJUCQkKGPcnmG3h05QldTaved7zWMyD7L/6red9vUKyLdmKg2B43nkUfk1T3d4HFIsPlIzHJ9qo8Hyp6dVsompLm3kcQmU6pnJpwrW5DWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hWFbG3vbl8TgBT8Z4DbUpAOIIH2ow8JRMteTkSIXSg=;
 b=TuXLgo7w6QQNMubsP96eB0evI6TQ0mugi1Kmnk3xXbMtdtyjNKOfZQvdRPHg/rAPu2rMGpM8R5o7VObvtdX1vkKYIHH/1dOEXCG/mcgOJPX8sgiE8ld8wzp4bhXSlXEZ9BADAnvRVO+PLSnmvGlXKgXSoBudP0AQ7xNb/qDuPf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN8PR12MB3459.namprd12.prod.outlook.com (2603:10b6:408:65::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 16:56:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 16:56:54 +0000
Message-ID: <4362b4ec-ceb5-a712-bd03-24b749d1d004@amd.com>
Date: Wed, 16 Feb 2022 11:56:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
 <20220215194107.GZ4160@nvidia.com>
 <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
 <20220215214749.GA4160@nvidia.com>
 <002ad572-4d32-7133-06f3-aa680c297be2@amd.com>
 <20220216020100.GC4160@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220216020100.GC4160@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9df28f19-e447-4e13-4ddd-08d9f16d5582
X-MS-TrafficTypeDiagnostic: BN8PR12MB3459:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3459A38C3A643701FBD1EC2292359@BN8PR12MB3459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jR3roYlZWZZIq8J05wUpFz2VdfUkOrLeLUcrqxIJpKglnr1XAGc0STlVmzvLdLtR9R8CkHT8meYzsSsrACSztqxlwYcdBje2Fwgl1v7iPKEwCxxEqdxWG51NewDhHDt9yiVFK/vfDie8/v9zf938nh0y+CTo18ZlBp1pD5CCywnSFKwbjDgLksHyAbutXa2zfso/4jdODQyIpoUFh3Fo7AzQqu4idmnM+kwlSfJloZ4XsFbTdvKcCdbw8W5GlDn3wffQyzkZRw7pigzb3IW6EA7zixM2o4mbyj+mX/aMVcYX6U1y+1a4rDeoH0OJtCvg1U5yaRNHBjf//yiPS2ZL0kx4uSnOD3KgJNj/7UaARjHYs13Bm0rOr74U6OSu3UzdEHORvd6sabSbSmnCCMrVTfZxHZZQ8E9ZMASGYJFdiigcg200sYQxxgxBThbG0ABDtjljvvH1Rw19/Kn8hwgxSa4Fwjkr8rmd+yNNH0MJObtQ7krePUP6iNeWqzLCQemyrwyarbOKTDzTa3zBRESZRWFrjII8fKVKNT8Fm5jwxLl4YRcPxi620nLerlCMZvlcLP0Lfy72wFmZ/ptYHwBxQ3jMbS2dJg1xEenQg5oKmcKp/UMyi4kAbQzYUile6tFN2KUkrhHzSrZNLR9B7EhmlBs9JBSU6Ps+2PgV7vFkn8TWvGk1xnPKDJGmkLCyjrGejLurCswtdvAagQnAs631kIIRP5rTeATzPn+MzpUStqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(2906002)(36756003)(2616005)(508600001)(6506007)(83380400001)(31696002)(26005)(186003)(7416002)(66556008)(4326008)(8676002)(8936002)(66476007)(66946007)(5660300002)(38100700002)(316002)(6916009)(54906003)(6666004)(6512007)(6486002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFKeWhSRk11cnFIK2F0MXN4ek1hZWZxaWN0VHdPS1ZPLzF1R2U5QTFGMS84?=
 =?utf-8?B?WFp5Sm9mQ21LaG9uN1luM1AwY0RHcUYyTitaZzRKb3doWjl6clU3alJPdXNK?=
 =?utf-8?B?akY2cXRUTXNacitiaFhQTWNxaklZZ1doNzNoYnNDYmlSbXJYWHF2QXMvMmRv?=
 =?utf-8?B?bHhqRm1tRlIyMkVWMFJvdjFXQldKQlM4b3JzcWx1VnhBTHVvN1c1cVN4dEM3?=
 =?utf-8?B?OVJrd0FpcG9YSVBMbHZuZjN5ZDFVTHJKMnh0NytwRXlraTgwTEdhUmd4WG5j?=
 =?utf-8?B?VHhHVmcwOWdvQ25VckhyK0FMVWNYVlNEcEtEb3orZ3lMT2M3bUw3NXp1QUdw?=
 =?utf-8?B?T21nQWM3YkgwUWFhRkN0cnFDV2tCSkZ1eStzSDFMSGRCWG93VnlsUFdkQ2hl?=
 =?utf-8?B?ZUpPZE1JNC9DRUZmUVREcTM5Nm12TXBNelZZQ3dhQStYWU1pTklpd0cyeEdU?=
 =?utf-8?B?a2FjZmorY0tVd2JpZ3k1NGF1ZndsLzNDcm5zaTd3VSswSmNkdWVxcEtPNktE?=
 =?utf-8?B?MGdhNzhkMXlFRkJFSkkwMzNGTU9sT0UxSTNhVUJwVmQwREVHNmExRW5SdHNy?=
 =?utf-8?B?MnFMUGQycnhWTlhLTUxma2NSUTNjblRyYjFueTByb0p1TWQ5VkJSYzZQaERs?=
 =?utf-8?B?cVZSenpHcjN1aWJxamh0eklxWWhDWllHVFpwODYxMittaHJMcE5VODFhWFYy?=
 =?utf-8?B?UGk3Y3EzQWRlemk5cVNETjBGaS9SajVqTnhNWk45YjNUd0tpYnlnZkpnM1Z1?=
 =?utf-8?B?LzhSK1NqNHMxUVIzMVNJWm40ek5JaXRaK1lsSGpHbkFhM3VvdUV4bEdvRmNi?=
 =?utf-8?B?TDNBWmNUOFY2TTRvRGMxbHl3QlM5S1FrZ1dEVFRDNzBiSnNZSk9DdjkxZ0Js?=
 =?utf-8?B?ZXJ6eU4rbjgzaGhreXUrOWFMeHV2b2hLc3ZUVEF4RjhFa0JyQUdOejY4Vm5R?=
 =?utf-8?B?U1UrckIyUy8rVWxmbHJVV1l5NjJQU0hIQ2dZVEhGNU1hQmo4ZERHQm1XcXls?=
 =?utf-8?B?SnpGWG1aOE5aRWVHU1BMMVRLV0FHSVYzOVU2ZmlZdlpCTUxpNkRRT2tHSGJ1?=
 =?utf-8?B?ZG4zcVJHMFptbG9PQ0JKdzdiOG81bnVRNGhnSVh0cG5sYjVSZDdKMTh2b3pP?=
 =?utf-8?B?bjZmQ040SDhZVy94SDVvd3NjQzYyeERuRW4wUGVYRTNTR3ZuWHEvbWo3ZTMv?=
 =?utf-8?B?eWFMWXhXSlVwc1g0c0V0RDVUaWNvY2NBQmZ3TlVhMGJNWEhJenRSMGduU1Jq?=
 =?utf-8?B?YUdyMm5DV1g2S1BaWmpra3RDQjYwOUZRallZTjhBMGFXamU4Q3k0cEdTaGo4?=
 =?utf-8?B?QTc3ek9SaTEzWmltTmpmTGtUektKZENnREdiTU84UkJMQXByUEkzRTBFckNt?=
 =?utf-8?B?QVhwV1UxVW5HYXNLWExvamVYdEc4eVpoc0tYc2F4WjM2dklGa1dTeHBmQ0VM?=
 =?utf-8?B?TCtBQnYyVHBuTG55Sm00ajVLNTVYeDI3RnAvb3EydDA2em9NSTY0RWwvaUU0?=
 =?utf-8?B?dlI4OVlLemVTQ0VnenBhRFpvRWszRzVpMERvRHBORnFOZEhXY21lWVV2bmx5?=
 =?utf-8?B?QldKTG5VS21BTW9yQlBBSWkxVEYyc1ZYSFVzbDhvS1VCbFdHU1BNeFltY0Q3?=
 =?utf-8?B?N1dVWERkdXpDMGg1Z2FTVzcxVE5Pa29GZ0lVMFpKYmRGQmxNQkNiWTU4UlRZ?=
 =?utf-8?B?L1FPRVN1YWNNT1gvZ21PRm8zSUsvUFlHUFJjTkVQRjRCSklCaElJY1hjMlhQ?=
 =?utf-8?B?YmUzRUpUeXhBUXFCbVFNNmJiMjA3em1zRDhiNkZSZ2dIL0F1c3BEWXA0SG54?=
 =?utf-8?B?WUxJNitmVmV1a21QdnJVTlVBUHhGYWFiSVkvN3A3N3ZxdlplUWh6MFB1c1RO?=
 =?utf-8?B?NDQ1VXhuTkkwMXQzTDEzTjNyVnZSRVBBOThZZEdVY3I5M05jTURBZXBWQytJ?=
 =?utf-8?B?aExPZ3h4QU5rdFd2SUQwSjF5Z1ZhVlRzeFNsSCtMRXgzUHVoa0l2SzEvL2hm?=
 =?utf-8?B?K0RYcTJRb2ZzRll6VVk4UGYvVXRLNXhrZU1GSEFzdFBoVVBod05QL0tsQy9r?=
 =?utf-8?B?OVE1N3VYeXhwb3JmREt6UE9iTWpNOHlESWxFRWNEZTkrT1U1RUdUUUlzZkpT?=
 =?utf-8?B?QnVXb3lsbHZLcUNoUmhCVlR5U1NJazU4SzRIZG1CRjd6QldHY0J4S1h2RXA4?=
 =?utf-8?Q?HeGB2Y/GJ2MlGh5B9+InzHM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df28f19-e447-4e13-4ddd-08d9f16d5582
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:56:53.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtGAavjWFVbD9gQ3oqaiATJSGUFogjJ3mZrQF9t5MQfO0nwoTX4oAVXLHZyTHW3p41NgRWipTpogtm+K06yagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3459
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-02-15 um 21:01 schrieb Jason Gunthorpe:
> On Tue, Feb 15, 2022 at 05:49:07PM -0500, Felix Kuehling wrote:
>
>>> Userspace does
>>>    1) mmap(MAP_PRIVATE) to allocate anon memory
>>>    2) something to trigger migration to install a ZONE_DEVICE page
>>>    3) munmap()
>>>
>>> Who decrements the refcout on the munmap?
>>>
>>> When a ZONE_DEVICE page is installed in the PTE is supposed to be
>>> marked as pte_devmap and that disables all the normal page refcounting
>>> during munmap().
>>>
>>> fsdax makes this work by working the refcounts backwards, the page is
>>> refcounted while it exists in the driver, when the driver decides to
>>> remove it then unmap_mapping_range() is called to purge it from all
>>> PTEs and then refcount is decrd. munmap/fork/etc don't change the
>>> refcount.
>> Hmm, that just means, whether or not there are PTEs doesn't really
>> matter.
> Yes, that is the FSDAX model
>
>> It should work the same as it does for DEVICE_PRIVATE pages. I'm not sure
>> where DEVICE_PRIVATE page's refcounts are decremented on unmap, TBH. But I
>> can't find it in our driver, or in the test_hmm driver for that matter.
> It is not the same as DEVICE_PRIVATE because DEVICE_PRIVATE uses swap
> entries. The put_page for that case is here:
>
> static unsigned long zap_pte_range(struct mmu_gather *tlb,
> 				struct vm_area_struct *vma, pmd_t *pmd,
> 				unsigned long addr, unsigned long end,
> 				struct zap_details *details)
> {
> [..]
> 		if (is_device_private_entry(entry) ||
> 		    is_device_exclusive_entry(entry)) {
> 			struct page *page = pfn_swap_entry_to_page(entry);
>
> 			if (unlikely(zap_skip_check_mapping(details, page)))
> 				continue;
> 			pte_clear_not_present_full(mm, addr, pte, tlb->fullmm);
> 			rss[mm_counter(page)]--;
>
> 			if (is_device_private_entry(entry))
> 				page_remove_rmap(page, false);
>
> 			put_page(page);
>
> However the devmap case will return NULL from vm_normal_page() and won't
> do the put_page() embedded inside the __tlb_remove_page() in the
> pte_present() block in the same function.
>
> After reflecting for awhile, I think Christoph's idea is quite
> good. Just make it so you don't set pte_devmap() on your pages and
> then lets avoid pte_devmap for all refcount correct ZONE_DEVICE pages.

I'm not sure if pte_devmap is actually set for our DEVICE_COHERENT 
pages. As far as I can tell, this comes from a bit in the pfn:

    #define PFN_DEV (1ULL << (BITS_PER_LONG_LONG - 3))
    #define PFN_MAP (1ULL << (BITS_PER_LONG_LONG - 4))
    ...
    static inline bool pfn_t_devmap(pfn_t pfn)
    {
             const u64 flags = PFN_DEV|PFN_MAP;

             return (pfn.val & flags) == flags;
    }

In the case of DEVICE_COHERENT memory, the pfns correspond to real 
physical memory addresses. I don't think they have those PFN_DEV|PFN_MAP 
bits set.

Regards,
   Felix


>
> Jason
