Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE834BC053
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 20:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2505610E18F;
	Fri, 18 Feb 2022 19:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F005810E167;
 Fri, 18 Feb 2022 19:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIRpaLvPmdSTFia4CP6K1KA4nPionoJwuLQMCV8qQPqv42ikZk8YB2FaO3FjaiHBt8+mEfcxABerpKet3bZm8P+bEXxqee1aGbF2tEmlLXZKIfvJbv4y9pAZx+HV5X5DtbkgEQ4nSaI7blfXxJhu3iRbqFlquvg9XbNziFjs1VfHl/LBHdr8URpGRAwTV9ICINs/kbvhjs0eQy1MJHKq2xihByREUC30tD1qpRQ/bGVJJLNCZrbQQEJIusR2R2aSTNZ4ux0ScpHhHOUMoD5tXhqFG3UPDQ45zzq+PyzNpf2EFZylW4N9FrMuNppbcquqcIOeOJj6Ps5r30cRtwD9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX4mMYS7dvbHjrsQloL6rDIudsTKokN/45NYk1VfLBQ=;
 b=WkhCjCWUEwdWdxsVUCTurBxLGBrvxyomfBFQezT2QFazLmYFWwoZEtUtDIpWbTW4NkhqDr6iEYw++pYL9cfAe6Y55zn9hUGezxc5Wyi9Sr2hMFefLnslqbK+APcMgkuWtVP6aVvM4U8CLkbJCFHey8a33Jcdw2xuhEucq3R0xLQVoLqKgrjw5/Y9N5KZXlUzzA3rDdixKJAM0hyzDwfrC2M/t8mQcNp0u2cGavL+pS82pZI8HGOSRp31N9HqBurbBiSGfd5z51fWDVtT3rdd2IC/npkE/UCYjOGC60sMQ438py5utUmIE6tL2UrIUQrYVvCKKW+dxoNHr/gK4r1NJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jX4mMYS7dvbHjrsQloL6rDIudsTKokN/45NYk1VfLBQ=;
 b=MKP/05o5xfKk2ElzqPaABBnA9gBPPOUqDNoNVuCJ+VJRTpg/MY6ksORHUi649w7vB9ZMe4eZ3aDNZ7Lq4jTO3Ax4TWVEcw5S/xf5kdD9XmoPMhRMADn3aFQkCtOQ42KKbqDuuU0DEaZTqehoif+zs8sHyTsOK1+NoCzSbW/ngns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Fri, 18 Feb
 2022 19:37:58 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 19:37:58 +0000
Message-ID: <fa20d3e3-0943-f336-db01-54367f8e2c1e@amd.com>
Date: Fri, 18 Feb 2022 14:37:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
 <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
 <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
 <20220218001935.GN4160@nvidia.com>
 <2f2569d5-df0d-7975-7f4a-2d85ceaf29ef@amd.com>
 <20220218192640.GV4160@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220218192640.GV4160@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01ebe554-015f-4151-a586-08d9f3162ab6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB188217BD60095061AA5D0E7692379@DM5PR12MB1882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3tMXzlQA0uDWarat2N85yLufrMuVzXrisMBR2eoJmX+r2rj12+4NiSxRBZYqOcQKqpd8A1/YDTvAUKH+oXd8G/sBt5jbhPUT9AnyXFwaCoVcBf24+BhrpdCMkvwLnFV4ZX3w1Kv27A8d70mAe22rGezjESOBtHGzxUabcRo0qQPP2P0Do0450womrrI/JRWxgttOQ3qH9g/juTOOcs9bTjS/0Gquc/rr0n/wQnfogDCgnjH7yV/z8kK5Y2eeFD9qk7tlfgMLAzprG6wsoO8Rm0uWs3xuhkhLIhD++b8z9G3ltb0k/Ych+HycA/ecOrvgIvEA/AUPkHqeHqBqYcgwPBQ6yCErKu2O46I54LU62z8fy7WzO3HY+d6brRs8Ne4sVKf6njUQzS8WsJNEmKgIEzEEMppblsYzLH+ScnC1sSnCNKWom6fMr5aSJXS2QQWyjfPMrrqimCUJAX7RW/lpH51cQ9PGMZ/tdhYUDAKfNbDyVtcL1VSG73VfRLrB7+kB9e0i5tWUzXL46Gr2K7IjBFGf7BDcHet1SAEmAoYto4BBf7jv7widLKisoyXMOL6PZvyM3WOR+mOhMzuZP3YueMgzx6iD+e+NWCgk7P8twPDPZRabZjAVCRdcz1a2SnE1I/gJ67wM4TIFRK6t+i7+drVvknYOn/VUam1XgTEHSBZFBbzlKsgfibFuU0cRpoE3mtvtk+6b1orb3jLWBww6OSd2pRymLh5xIU76FpnjPHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(6666004)(38100700002)(66946007)(508600001)(31686004)(316002)(4326008)(8676002)(6512007)(6506007)(2616005)(86362001)(5660300002)(2906002)(7416002)(36756003)(44832011)(54906003)(31696002)(6916009)(6486002)(186003)(26005)(66476007)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnNNTUlPSXZ5VEdjMnQxYkpiZnhWT1lmZnFCSDl6a2tRc2NtRUxsUTZ5bkxr?=
 =?utf-8?B?cjdVK0lkZ0tqZ0ZURGZXR0ZyVFg4T1BHU09RTVc3Mjg1NG03NUtDRXJxSmRx?=
 =?utf-8?B?RXFYVlUrV3JtRTZnQitHZi9mUFV5RStuMlNyZnUwV3BtbUNlYnM3QU5qaWdF?=
 =?utf-8?B?ZkxWZjBPNW5zM2ZqclFCVFMvN0JJbUFCV2hEWFRFUUc4eFZaM2ZMa3JBcFZX?=
 =?utf-8?B?UURpcGtLNHh5R05IdVFPaThzd1RKN25GUlVUNml5b1ZoWWpoeDNZczMza25H?=
 =?utf-8?B?Q2ZNbzRlckd0K3JET0F5K1dtR0c3T0Q2L2F3bk11K3RiK2tLQVdmZTQrSWVR?=
 =?utf-8?B?aTNtcEgvNWpmbU1HM1NpekFMbU5SRzVBbnFjaDV0WmhIYWY0dkxzVXhybkJX?=
 =?utf-8?B?QklZYmVCMDJ0azQ1c3hqbXRLenJwZklZaUxxME9sME56dkRySUk3UGZYNjZq?=
 =?utf-8?B?WVJMOEY3eTlaUkVkbmFvd1I0VWx2U2pCK2VLTk9ZMk9BY0JSRUlRMWpRVE5l?=
 =?utf-8?B?S0hPRHVva3BiMXVUVkswcTdFWUV3TzloSEpYZ25xdDk5Z1orL251NjZuUCtz?=
 =?utf-8?B?WEFPQ0ZpdkpJMlkzb0cwbFhEckM0U04vV1dZS1M0RzVBWTZORDhDTklZT2RL?=
 =?utf-8?B?bzFzaDlVWEFFc1pkTUZYMnAwMUh2amhXdmQwRmNaTk14TlRKdW45VC9lN2xq?=
 =?utf-8?B?cWw5eEZJcDZQMmdncGRFRFVjMDlpdkVKaGNzL3hOT0FvMTJUVWEydURjWlIx?=
 =?utf-8?B?eXRHek1PSklVb1EwV1FHMXZtdXprY3RXMXlCRmY3cnY5RVVoMkUvbFc3ZDRZ?=
 =?utf-8?B?eHNkcGZxTm5NWkxiZm1GcGlOSzhmcFptT1lsckU3MGpqcGRkWXlqMnFwMkx2?=
 =?utf-8?B?T0pHa3lmZldsa0JFTkEzNFM4VXdEdHRNL0Vid3dRZW1ZeWdTVTU1ckZBN1lG?=
 =?utf-8?B?eHVCRVNqS3laMWJRamNtUHcvQkwyWDlGc0l5OGJObmVLMTEwOEdpZURJdmV4?=
 =?utf-8?B?aDdERU5WTFdacGtETnJJNzRrTWVLeW9pdzI3dTNtQnduOXhEUUlsbkIwaHNp?=
 =?utf-8?B?V1ltai9IdlVXNVZ0TEtWbmlnRHpCalI1VVZ3ZzNGamdsUWpMeG1aR0ZQT0JY?=
 =?utf-8?B?WDBQKzFJcE43TnF3cVFwN0txbDJBcnV4SkQ2UEtxLzNpVlkxaURVRUxFK29Y?=
 =?utf-8?B?VUZZUXFkS1RNR0Fvb0xEdVhybGtpZkhCU0RzQzBhUG5ZMk5lTCtjVWhiY3FR?=
 =?utf-8?B?VzlKKzZHemVZSWNJRmRkWFp6U1dZWnlSYUdvVnplYkZENzNiaWJHZ25LVUlX?=
 =?utf-8?B?b0d1ZlRFcFByNi9BQnFjaW42NWpqWENSYkI1VzNCL3pTODhzOFR4ODFTOUl4?=
 =?utf-8?B?Uk9JVmJqRkVudFFBZHZJMWJBRm9pS1ArcS9wVjRtYmU3d3UzSVNnRjhwTkww?=
 =?utf-8?B?QTZLWis2QUhxTThiV05MU25LN0VYekhScFk1YkJzK0RROXphZVRuU3k5bmc4?=
 =?utf-8?B?OE55dDZYT0duejhmbFpKL1NmWnVwT1FuSXlPM3Vuc0Z5WHlUUExqMGZwd0N6?=
 =?utf-8?B?ME1pSU9nSmRBMXA3NjVVaG43NnllTjlMbVVWbWdWdUdoTnpEVzYyWDU4MzEz?=
 =?utf-8?B?NUg0Ykg0RVlkY05tU2hRYUhaZ0dyY3l1TXBrYi9NdXh0dFhBNkVHeW1MOTgv?=
 =?utf-8?B?S2JPSUUvakFHb1lUdlAvK0xOWWZFeVk2N2Zod0h5bE1UWjhPNjc2bzdnekli?=
 =?utf-8?B?ckZUVTdldnMyNXc0SzhVSHRhZDB5WDZjU1RucDRwRk8wVmcwVzFyZ1ZSTTJG?=
 =?utf-8?B?TU5wdisyT2l4QmFFVC9wdENNWlYrd3Z2UG5EZWFORGdJTitaaWlxU0pjaUtG?=
 =?utf-8?B?S3VDeDN0U2x2ajJvVFdRWStQdjVySFhpaEF4bkl1b3EyazUyZllzcDI2UDFE?=
 =?utf-8?B?NkFLWk85VlVTZ2tDMVkvVXp6eG9wa0t3djgzZklLZkxzV0tHVXRKWER0KzVh?=
 =?utf-8?B?V0NaU3VUNmdYcllMS1Q5aURVa0ZRVHdNNm5RZ3RyL3AvV2ltVndsUysrSGJo?=
 =?utf-8?B?N1oyK01pem5uU1hyT3hEdGxsZnEwMHZpb3BNY0hPU2RzWEY1QXcxT0g4SktB?=
 =?utf-8?B?T3Fpc2pIUzhVOVRFZW1hRnh1RzRsM1JnMFhpbUxjYkNUNEhIek1icldQV29P?=
 =?utf-8?Q?FD2TRP13nAQgpjQuwJ6vIFo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ebe554-015f-4151-a586-08d9f3162ab6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 19:37:58.2172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmhhXmpNyLAMuC+eKMKRqkT4Bo5rtz44DoVM6QtZReQ9lqcGfhuAseeViKyiltK8rdEiaAW0sfcPk35esxZDDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-02-18 um 14:26 schrieb Jason Gunthorpe:
> On Fri, Feb 18, 2022 at 02:20:45PM -0500, Felix Kuehling wrote:
>> Am 2022-02-17 um 19:19 schrieb Jason Gunthorpe:
>>> On Thu, Feb 17, 2022 at 04:12:20PM -0500, Felix Kuehling wrote:
>>>
>>>> I'm thinking of a more theoretical approach: Instead of auditing all users,
>>>> I'd ask, what are the invariants that a vm_normal_page should have. Then
>>>> check, whether our DEVICE_COHERENT pages satisfy them. But maybe the concept
>>>> of a vm_normal_page isn't defined clearly enough for that.
>>> I would say the expectation is that only 'page cache and anon' pages
>>> are returned - ie the first union in struct page
>>>
>>> This is because the first file in your list I looked at:
>>>
>>> static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>>> 				unsigned long addr, unsigned long end,
>>> 				struct mm_walk *walk)
>>>
>>> {
>>> 		page = vm_normal_page(vma, addr, ptent);
>>> [..]
>>> 		if (pageout) {
>>> 			if (!isolate_lru_page(page)) {
>>>
>>> Uses the LRU field, so this is incompatible with all the other page
>>> types.
>>>
>>> One mitigation of this might be to formally make vm_normal_page() ==
>>> 'pte to page cache and anon page' and add a new function that is 'pte
>>> to any struct page'
>>>
>>> Then go through and sort callers as appropriate.
>>>
>>> The 'pte to page cache and anon page' can detect ZONE_DEVICE by
>>> calling is_zone_device_page() insted of pte_devmap() and then continue
>>> to return NULL. This same trick will fix GUP_fast.
>> Sounds good to me. What about vm_normal_page_pmd? Should we remove the
>> pmd_devmap check from that function as well. I'm not even sure what a huge
>> zone_device page would look like, but maybe that's a worthwhile future
>> optimization for our driver.
> IIRC there are other problems here as PMDs are currently wired to THPs
> and not general at all..
>
> We have huge zone_device pages, it is just any compound page of
> contiguous pfns - you should be aggregating any contiguous string of
> logical PFNs together into a folio for performance. If the folio is
> stuffed into a PMD or not is a different question..
>
>> I'd propose the function names vm_normal_page and vm_normal_or_device_page
>> for the two functions you described.
> I wouldn't say device_page, it should be any type of page - though
> device_page is the only other option ATM, AFIAK.

Ok, then how about vm_normal_lru_page and vm_normal_any_page?

Regards,
   Felix


>
>> current vm_normal_page with the pte_devmap check removed. vm_normal_page
>> could be implemented as a wrapper around vm_normal_or_device_page, which
>> just adds the !is_zone_device_page() check.
> Yes
>
> Jason
