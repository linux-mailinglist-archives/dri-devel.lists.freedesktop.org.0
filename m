Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC904607E4B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 20:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6C10E632;
	Fri, 21 Oct 2022 18:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CB210E608
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 18:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT8VGto4YwT4gpf1PpxSXLBEniBq8dMZ5IsIO2q7QxKUsIEwbGPu69atimezs+DU94YJJwxbNmu9CeN8rkRyileJSwYuJao98B9IDChYA1P4i91JuGs5EWFs3PPmpfFe+jFImO4v373hw6BJdLECNvhQ51aIEDvlmH8CL1gZnps3A5CQSgila1HIkIgUd3Efsi8/x/PVN4Wl3f0DgOhaSYj580amvBG8zEAPdzYtjmO/jO9+uxs0uRRIMBL8BcF4myUFLwMz0U40tscNB71MuZJgTP03BzRVsHD7vij8isdBU+jUIP9arT0X5qNd1bbrXqLyv6GkNQmZbksJUwkwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gF3KZUVGhdVUkFStA13lEbV89DjTOMMfsEystW+MxQ=;
 b=KflEWaH3+CqCORBpTFRPHSF48VpxjyVdPDV03QI5VrTM7oMdM7GkIyFbY6KJnXVUzXpx6o6C2rBChZuZSFb3zr6OGh4GtYdcjkP5EJw4eahBjBC9bpjcpzQfuvfwFmHuaktonj7rD/S2PvzrAAuyMIr8pUK0Ri6YtSGAVxvgKRsTaJCnqKEDbyWzUF5SyryxzDFQUUJYb+kL7eVp/M/aiooVDuHLVvLg9EcSd3XBqemsDhl+xt30lPgSm92TU3OhdYyr96y/7KR2ZDEPJbqBYNI2ItBOK4f0wJJi7piezT9KYxsEyZTW3lum10630u6Ix6XhpOIRB7k8ImKQFVC5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gF3KZUVGhdVUkFStA13lEbV89DjTOMMfsEystW+MxQ=;
 b=MpAPxsQD3jOoflqoIjFblvJ94oWAd/9j2DkfjGvjRzHgGAHShUTk/8oFIPxJGpefjwpdeVuT+lLmiMY+mIH02PTxi9hDk4ADxgbkcpJAhk388Q5St2RYgHJHnPRuy8EeG1zCBRX1wXQJo9jY96xnvAh3kExr6Roqy9Axupse5Uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 18:32:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be%6]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 18:32:03 +0000
Message-ID: <0d2efd01-956c-3e61-6bd0-81e449fad4f9@amd.com>
Date: Fri, 21 Oct 2022 14:31:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using pgmap
 offsets
To: Dan Williams <dan.j.williams@intel.com>, akpm@linux-foundation.org
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
 <cbc23eba-990f-688e-d22b-0c0d103172cb@amd.com>
 <6351d7105fe92_4da329467@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <6351d7105fe92_4da329467@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:610:54::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1698ce-a699-46e5-14ad-08dab3928bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PxY4JjPBKoIxdTbeTfhOwv73iXmfibo7PVbVStDTcN9elEsdfJBl0asysFiZ9UUfUIMgbjqkOO3rLCo6IPvVTV8kNF8GvibN09+8QyrSw/pCkFgZzyWgo6HtugODWTtQ29Wo+hIVn7+Pf+ghZhaS7c4p7hRU3nAbr/Ri8RFB88CekNVedP8VXNMhKudX4JaqjEg4YD9hTiQDfGet3QTq8hamkz9J3kcH34Dyos2AscfszhIyy/nT/AO4s4cCkGOKz2wjyn3GMC4zXTisgk5weBKQHlQFbnI3KcnqP6GFJFeeu/Wot/Qf3KREc/aMOSJuxlsvpanJjhBxv9dbiaGGgpaeSVq3Cd4s0Vw9czE/AFgpijKGV0dAUf6Cs9gK3aJcx0UMKgJGG+8d2NuZ9Xmvk/IlNCjTnwVByWqb6JJw6fiVCZfvPK+8U36wUAx+6oz4XqwuQcMD6Oi6BrCtiy8d5kst7X5mT3gOfmy8LZwysHMYnfn62VTrJUgKP0LfysPVfxDRvdaUfKYoFpup19jxbqewjmBLsLqjyaq/HAdFVQI/uY2ux2du2CuScnYidxT5R2dhnkyNKZl2jTM3E4YbIISGhwQ9nNADgeLx7wzDjF6pmXlxyFTAEpuwqa0rirWyw9es2cbHBoQamXIyDMjqAQ/hOBF89Pj8FTcnemLhBk8VJDlLkwtVxk+x7B3c5fJikWAvr3LwHgxCadJDD/Kmykws34jRYh7RnODRenQcET6vdkV4WsN4GiTe887DnuzHjpO5o2eCyur+Eas9R3RsPy7UmVuFPa6EzrYVpufMh6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(66476007)(7416002)(5660300002)(44832011)(31686004)(66556008)(66899015)(54906003)(316002)(66946007)(8676002)(4326008)(36916002)(6512007)(478600001)(26005)(6486002)(41300700001)(186003)(8936002)(2906002)(4001150100001)(2616005)(53546011)(6506007)(83380400001)(36756003)(38100700002)(6666004)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkpkdi9TNFlJK3VaRUptY056QjJ2N0hEQnBMM1VaS1JGekkzcDJ2S3hZWDdy?=
 =?utf-8?B?cStGbmk5OGtyVWc4NkVkaHNIVVBvN1FsSis3djN4TWFpWEY4MDdPVGRhZmFv?=
 =?utf-8?B?VGtHejg1TFNLM0xlWDRnRmU5TncwczQwNWRKMFJwc0J2UGZ6b2hDZVpHT2NE?=
 =?utf-8?B?b1d6N3lyODErMld3NU9Fd0ZSRkJoMWtWQmZzMWc1OERnS1huU1NRa05qY1hk?=
 =?utf-8?B?bzRQaFI4Q2JJald6UC9tZzUwa1krTlRnRkdwY09NR0NMM2RYcVhqbWdXdmIz?=
 =?utf-8?B?NXFRdUZJWFA0VDlaN3FHNTNJenJleFZsSzNVYkQwYkdsRStSd0JCYkVUTEVO?=
 =?utf-8?B?dUtUTllaYks0R2M5bzZxWjVGUTdCSmx0WC9peTlnY2hrbzdTWC9sMXdicDFT?=
 =?utf-8?B?YW43UjVwTk53elpoZ1B2TFVnK3p2NGs5VUpSd0JKamcvdnR4SFMrUmZMekly?=
 =?utf-8?B?L29kVjBSWVFETVhTN1c2Slk2bEE0YWVOanpkczQ3MmFIdmpQZ1B0T3NFVGhU?=
 =?utf-8?B?c0JYNHF2YzgzVmFoamM3eWRhaENHNWJWOTRtMUl2Rnh4VkxMODdDNDBlYkJW?=
 =?utf-8?B?OUI1MW42ZUxRaGg0R3pXV2tFMm1jOWpNOXgzU3d2VWZLeFVURUszSFFFSGRU?=
 =?utf-8?B?bUxhZXFqdnJpcFZOVXRLVDlvUmpNQVBxT2o3UmJBbHlLL2hNVENpOExVazIy?=
 =?utf-8?B?U1VKZERBS0dOdW00c3JQNEtvT3JSbTJBUTBYaFQ1VVFJeElRcnlzc1JUai8w?=
 =?utf-8?B?YXA1dlE2enN1dnp2QzVLL0J5S1dFOVlraUZNYUFOd09IT21vUXFCL1hzcGZK?=
 =?utf-8?B?RitCdXZhUWRDdVRVQ0xqR0N4d2I3VE53MkdEamJHVGw1SzVTbmRYU3dsWm1D?=
 =?utf-8?B?UU5wbC8zeGUxZnhIVmowdmpZZytqeFBBd3dUUnFrQTdIUDhqNEVKQnQyaXJ6?=
 =?utf-8?B?S0NGaW5PQlJubk0yNWZUc0V3REZBV1RuelJ1NlhlVlcrRHdRbTQyeXprSkdG?=
 =?utf-8?B?Nit6OXN6NFhIZW15Mi9QYnJjTHp4VmFIYThnYVJudm9kL20rUE5hOG56Q3Fu?=
 =?utf-8?B?RjNFRk1XeVpqd1EwZWZUZEQyZWcrSnRWVUgxc0M1SmxWbCtZeUVBdG50TllN?=
 =?utf-8?B?T0VxYUV5STRmUTY1dVY2K1owaFd6NWlFaG0zcGxySnJFMTNocWphK0JuQ0NX?=
 =?utf-8?B?NGJzTlBxSlc3UTl2M2xTMmE1c1FZUnlLZGFFd0VJbVZralEvVlZBZ2xiaXox?=
 =?utf-8?B?Y3lVMUdlaE1iMG9oL0FDeGZpZGt4Z0NXeHFZdmdvelNwb0drMFZ2Q056ZTI3?=
 =?utf-8?B?c3Fwc1JpL1lpSFc0Nm5uYnNJZ1BOYk45WkxZVVhWZmNoMjRlcytrcVk1NXd3?=
 =?utf-8?B?a2VsZmJkT3pSNkt4YnZoWGZ6SGVyZm1pSWh3c3NHL0tTMEdYMU5BUkovUE02?=
 =?utf-8?B?Z0RCN2dRVDdIZzRKYi9OaGEvdFZrRXlEK3REdjNncWEwTGtuVytOU1JUcVZi?=
 =?utf-8?B?cGVEZVIyTDUxVnFwUWtBY09aYUh6b3k5U2IrZDFzZWkwZjJ6a2tqMnZVK0R3?=
 =?utf-8?B?Z2NuUWpQQ2ljRUE0QXJKM1MzeFROK015ckRXanFoc2ZhNVViU1dicTI0SW05?=
 =?utf-8?B?OElXdVRBUENTNWd2UW9WN05MVEtnUWFPS0RzTktGYkRXK3hwYlZ4NS8wZ1NY?=
 =?utf-8?B?dWIvMGFaZVFONzYvSksrK2ZaQWFsR2YyUmkwZjVIWUNHb2dRVVNqd29tVWtj?=
 =?utf-8?B?bW4rcEZpODFWUWdQby96RDMyZVk3S0tocm8rT3VrTTFYSEJ2TUNLMnNmcGYz?=
 =?utf-8?B?cUlUcEVWTHV6RGZjZmsrU3huMmN2RmlqeUF4TWo0WkdtUncydGxxa3dlRTRM?=
 =?utf-8?B?UHArQ3NDZFplUWJsZnJyL3ZDN1NWTmV1SGQ5T0lJRmNtQXNMaVEyUWdVYS9U?=
 =?utf-8?B?d3loQk01NGYrcU1HalJOUmZBZEFwTWZCWW41L2t0bjZjMjNEdTFrcEVCUEZp?=
 =?utf-8?B?ZUVXWUhWalAwNU5QRnZJUkR4aFVlQjRrRnRiY2dQSE5kTGxuaXFwYWY0ZjFF?=
 =?utf-8?B?WFVTRHZQOENHVWsvUUtITm83ZEFya3ZtSU03QWM0Z2g3eDFxaWU0RmNtbmpD?=
 =?utf-8?Q?bApgX8+naIwPehhZm89ch5FxQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1698ce-a699-46e5-14ad-08dab3928bfe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 18:32:03.1313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOFijDiH/tTdfdMa/s1cUF4X7SuNUk1N+z8JxNKSlWYiojbyTEKVz+uAshAvrsyzbSeSxKzhj+/awl9CeUpYmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889
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
Cc: nvdimm@lists.linux.dev, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-10-20 19:17, Dan Williams wrote:
> Felix Kuehling wrote:
>> Am 2022-10-20 um 17:56 schrieb Dan Williams:
>>> A 'struct dev_pagemap' (pgmap) represents a collection of ZONE_DEVICE
>>> pages. The pgmap is a reference counted object that serves a similar
>>> role as a 'struct request_queue'. Live references are obtained for each
>>> in flight request / page, and once a page's reference count drops to
>>> zero the associated pin of the pgmap is dropped as well. While a page is
>>> idle nothing should be accessing it because that is effectively a
>>> use-after-free situation. Unfortunately, all current ZONE_DEVICE
>>> implementations deploy a layering violation to manage requests to
>>> activate pages owned by a pgmap. Specifically, they take steps like walk
>>> the pfns that were previously assigned at memremap_pages() time and use
>>> pfn_to_page() to recall metadata like page->pgmap, or make use of other
>>> data like page->zone_device_data.
>>>
>>> The first step towards correcting that situation is to provide a
>>> API to get access to a pgmap page that does not require the caller to
>>> know the pfn, nor access any fields of an idle page. Ideally this API
>>> would be able to support dynamic page creation instead of the current
>>> status quo of pre-allocating and initializing pages.
>> If I understand it correctly, the current code works because the struct
>> pages are pre-allocated. Is the end-goal here to make the struct page
>> allocation for ZONE_DEVICE pages dynamic.
> Some DEVICE_PRIVATE users have already open-coded their own coarse
> grained dynamic ZONE_DEVICE pages by waiting to allocate chunks on
> demand.
>
> The users that would benefit from a general dynamic ZONE_DEVICE facility
> are cases like VMs backed by device-dax instances. Unless the VM calls
> for bare metal services there is no need to map pages for the device-dax
> instance in the hypervisor.
>
> So, the end goal here is to just add some sanity to ZONE_DEVICE page
> reference counting to allow for requiring an arbitration for page access
> rather than just pfn_to_page() and assuming the page is already there.
> Dynamic ZONE_DEVICE becomes something that is possible once that sanity
> is in place.
>
>>> On a prompt from Jason, introduce pgmap_request_folio() that operates on
>>> an offset into a pgmap.
>> This looks like it would make it fairly easy to request larger (higher
>> order) folios for physically contiguous device memory allocations in the
>> future.
>>
>>
>>>    It replaces the shortlived
>>> pgmap_request_folios() that was continuing the layering violation of
>>> assuming pages are available to be consulted before asking the pgmap to
>>> make them available.
>>>
>>> For now this only converts the callers to lookup the pgmap and generate
>>> the pgmap offset, but it does not do the deeper cleanup of teaching
>>> those call sites to generate those arguments without walking the page
>>> metadata. For next steps it appears the DEVICE_PRIVATE implementations
>>> could plumb the pgmap into the necessary callsites and switch to using
>>> gen_pool_alloc() to track which offsets of a pgmap are allocated.
>> Wouldn't that duplicate whatever device memory allocator we already have
>> in our driver? Couldn't I just take the memory allocation from our TTM
>> allocator and make necessary pgmap_request_folio calls to allocate the
>> corresponding pages from the pgmap?
> I think you could, as long as the output from that allocator is a
> pgmap_offset rather than a pfn.
>
>> Or does the pgmap allocation need a finer granularity than the device
>> memory allocation?
> I would say the pgmap *allocation* happens at memremap_pages() time.
> pgmap_request_folio() is a request to put a pgmap page into service.
>
> So, yes, I think you can bring your own allocator for what offsets are
> in/out of service in pgmap space.

Thank you for the explanation. The patch is

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>



