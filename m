Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E315606B49
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 00:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A8010E2A4;
	Thu, 20 Oct 2022 22:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0868B10E2A4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 22:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEnRzMA+2bpRRZ2OnH6KqAU1KiyJOSMUkfYke200Y9fZ81ZAngzXkolYrM2xw9gUEiCb/W6wqQOPdz8gsGDL9ihveuk8cukvNIzuIbHZ+/3MunjfHIV4dV0OYE/Xae8A8xpIizf+dqV6+eSNIC4J/n0uVUdTHL8vjIHNqaIOUx9BS0pvZhdyidrsh4oNmC6XQqI9Z3BLH+RC2YR51epxsHiDRPYw/JU82e/09P1s6NdT6OSzaXfpzdWmYGmjtoI4WI9wd2mC4fRISB06bTELKimu4lJT+K2O3EaCNwaXRmXP9huA1p6vpmJami8VW0AZgmRIKAYk7xRhL8HNqThOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a67zT/NQKwCBqnrE/wiF3KH4w7a1hp9d7IgbM9IIK7M=;
 b=Jcft87J0BRPdDa5gucSyeVC1ZCKDkWvj2u3Wz45gjOLHaRqLhd8GirEOoCcgP/YbmtpjCFGAWqAHPHVjKXIhXzdLjbfF1Z5V7jPRmS7fJqj8RsplBF561nK6cTL6F4le8FB9O0KnjjLRjCVZOB2nyxHPGQ3+E/4ErQc8hx9QZqj5jdvOWHQRFQ13SHaeDzAirS12epDLT2p7fpvACd/YoLeFOmF+nR7aD6Orx0qTHxi+hwrREIYLsN9BdcOv1hQvHC0LITZpD30MF8oi6vvbbNpapGNJWXbteQIbnO/QldqlWe2m3633AzTZ5s1fgt2IxV33Lse85QiWPCKiq9elNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a67zT/NQKwCBqnrE/wiF3KH4w7a1hp9d7IgbM9IIK7M=;
 b=spC0sejq4CwBeBZhFPdOxkzg0xH0VsiYG1FhPY1X3zqgRzwJGF5SuTPrr5ul1faQi01fMbvsdyYiHq000VA9nnF07KhNZdBYB1h+3kWbSrPGcg4AGfzh6fK+AAE1+Bu19b4FAj5TyN/ihJtm+UIlewRT1rSALK5MsNhBiPbfemE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH2PR12MB4295.namprd12.prod.outlook.com (2603:10b6:610:a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 22:32:25 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 22:32:25 +0000
Message-ID: <cbc23eba-990f-688e-d22b-0c0d103172cb@amd.com>
Date: Thu, 20 Oct 2022 18:32:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using pgmap
 offsets
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, akpm@linux-foundation.org
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH2PR12MB4295:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cec61e-07a8-4dd4-e0b7-08dab2eaf64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IeLjxvr6+hAvtDWOklbUHGmNXoSXh1LAqUUgaFrxp4i0tO55VdNKwIW7H7Nd71pxqDtODdJ/G1J1UqKnHylVvln9mNXBhJ0WkAmleJplxKXvuOJ9qarotxzDLPHuNvXQBbdhkLZy01DZzwblyUnWNwa6RdD8hSVOGGoetzfOWvWp4WQB1XUUAxUWKP7amZisatQ2gSx6+nl00+/PIYZRrrA2p/niXVKSY69qmqrMUpyauP4w6njQw37Q2PSIl+Zg4vKx+1MVmjAEYtGCQgsdaIDBMdHk/uhNsjKUdzOA5fpV7o5Hi4ffw9nARcVdkaHNbOpMy0Nwq31z5ILzrqeO9YnK/YNImMmFGs/nTjcp7r/p1sET4+eFAtG2AYbWzVd6K8Nkwd0QNP5g9gx9HcMKwRMR2RHKAhZRP/rgv9yCxW6oU8izRRQpXKL4cJPd6j13NGU2f5RS/yHoCoLIXbyDicWOOgijixJ24gigavoSo8LwkvzPEAGEKAd0atdy/TSzQulT/gf0ATIXNAKkWfBry4vJ2dRmroDrcKWVV8CltMopj/buI6UNRAF73HjpnxICW+HZG2YTy4PXeLMsFS5Z+LHv43NaCbSoK/qsaRqeQ2ib5muM0VwR8lzhMVylS2B1cjCHpJK4tE/Gek7Nimnuw9KcuSPV1D0d+fx5r2UmwjojzK/aiDw5RNyXBjRBP6rifu5Xfdkn7KpV9MTKM1U8R0KzBC28f6FiAX5G+EyY3D1i2FXLdvIx7rupR3spXdx+UUwXoBTQnmBxppFcEhN1g5okWE8IbGBhbfKWpyeebVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199015)(66574015)(31686004)(66899015)(83380400001)(4001150100001)(6506007)(86362001)(36756003)(2906002)(8936002)(5660300002)(6512007)(4326008)(41300700001)(26005)(478600001)(31696002)(7416002)(186003)(2616005)(44832011)(30864003)(8676002)(66556008)(66946007)(66476007)(54906003)(38100700002)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNXVmV5cWdzeVZKTzkvNnpGYXNHclFXZlphQ2FJd3dmQVNQQWxCM2dmdjdw?=
 =?utf-8?B?YmxRVGkzbFdLaEozaDhzY1BDcEtBTUt6ZFpRSU1BQjMyQktTd1ZDeXJCWGoy?=
 =?utf-8?B?ZFVCalU2Qy91QS93S3ExSjBFVkFTSFBsdjlSRElwTzZ3VVlCU2htd1ZmRkI5?=
 =?utf-8?B?YmRlcUpnWHJyb2pITzRvQldRc3lJQVBvU21WQnRsUmxKNzFNdTdMcThsVDE1?=
 =?utf-8?B?TkpLYjhqTEg5WHpNYWQxNkIyR3BZTUtTOXhhc2tLN0VkNVdPTzVKRWJYUFBl?=
 =?utf-8?B?UFRqTXMvVG5CckxDeDhTZEErZi9FOTJjT0FUMDhBeFlwMEpFY2xLeGxzZ21X?=
 =?utf-8?B?Y1JyQmFnQldBbzhPWDJLRUhLWm15cE1mc0I0NnBCOW1sNDBqdjdrKzFrWWJv?=
 =?utf-8?B?alp2YVo1Yy9QdWVEN1pRSjVKYVlhVVBIMGZXYmN2ejFaaU9Hbk5jalFzSjdH?=
 =?utf-8?B?bmlNUVFnS0Y4bG1VT1ovS3J3U1h2azVjZDV5UVlqbjUxenRyTHJRdFMvdlF6?=
 =?utf-8?B?RlhYSTROTm9pMmFxTWx2MDA1Qlg5QU5aeE5xRGVNVXlicWVuVm83VEFnVDYz?=
 =?utf-8?B?TjdpaERwaFl3TTNWVjhIM0xrMWZNemxha1BQVktJU0U3TFNrTTd3K3VqMG9I?=
 =?utf-8?B?ZUxRNy92amVOUGJvUDRsN3lhYTRlSjQ2OE51OWhwYXo2TEtXdmMyNjdHTXpZ?=
 =?utf-8?B?UzRiTExaWTcrTDJpTm16UE10RUYwK3B1dU1rWU9pQ0hsUnFwNFV6R3lYbkFr?=
 =?utf-8?B?VjZ1aVlSYmM4OWVoZmV0eHZKQndzZkkxbGdhVDdMbGNvMkZYTUFXVWcvaFhi?=
 =?utf-8?B?cm5jcnVwRFhTY0dHMWRsdWRaNWlDYWZXd1V2NXNCU0ZxY1FkaVVTQ1ByZVps?=
 =?utf-8?B?YjExT3BjdlJ2OW91U1hLYTcyM2RLblU1aHQvSVNFbG15T1E5V3NZZ1k4ZEZ0?=
 =?utf-8?B?NmRwZHRna3JhTHpnT2lKbTZrdkI0WXMvQk1ZVjc5V0dQSVUybmdRc1lyVEx2?=
 =?utf-8?B?L1luR3ZtYlo4TjlBWGR4NDVudERGSEJob3J3OUljRHFwa0ZWNE8rc1locXA4?=
 =?utf-8?B?UlE4V3lTTXhGQlNkTXFMS0x0a3hiVUZZMUNITXBEWHREd2lxM2dGbWNiUm9H?=
 =?utf-8?B?RkJQMi9VTmVOUGNHY3VyaVQ4V0JBRkl5YnNnM1VEUEhpRE1vV0hHbWhlb3RG?=
 =?utf-8?B?TkNOanI1SHMrUmFZVjJXSUFVVlBIaHhyejYwSW9lajA2ZnE1T0FxdzdXTGZZ?=
 =?utf-8?B?UmJkV1pqekxkbmdQSXFublFoUnU4T282YWgreExaTzZSQUk3SGFxenlyc3px?=
 =?utf-8?B?ZGdJS0hsTk85S25BbitqWGtrOCt1TzdPYTNqOVR1bE1odzlTUGx2Z0cxTUU4?=
 =?utf-8?B?dG1LUXJqV1c0RTJsbW1vVmE0cUJBLzdLUURFZytjV2pORHQ4d1RvT2lWRXdX?=
 =?utf-8?B?T3pxTWhjSzl0NGJhQXQ1aXVFMlRyelJyN09TRHU0dE5CVHREMGl5eTgzTkxF?=
 =?utf-8?B?Zm1kM1E5cE9LekFRZVI1aFY1bDVjOEhmcE1LV0hFQmZ0WFJMYmJoYkY3SVVl?=
 =?utf-8?B?YzY1WldOUG9DYnQ3R2VsaExzVWZEOTZXd3Rpc1VwN1ZqZnFLbGVhbEovQWxW?=
 =?utf-8?B?SXNzTzIxWk5yWHk0Y3N5bVYrb3NPNk1IM1FuL3Z2dkVKbGpGeXNiYUptRlR1?=
 =?utf-8?B?aWV1MG5lK1BVMm5IclZZZUxtejFZSG93R0Z6UHJYdVY5c3c4clRzTGczdExO?=
 =?utf-8?B?WTljUnFPTFlUZDFoOFMrM1FUVTFENTJjbmg3K2s5TnBvVjhEaEhLU1FnTGN2?=
 =?utf-8?B?V1RyeGUrZFhwZkQ0cCtycjVqcWxKK3RvbThzS1hQZ2dzalQydncyWUZiTXFE?=
 =?utf-8?B?RzRqc2d4azlSWlU5bXRpSmY2Nm4ydFJiS0RLRHdPWTZKVERNTnBtcnhsVzZk?=
 =?utf-8?B?ZWJIZmlZN01oaEI4VWhFMUFaWXgxQ0hyUXFBaFRoR0NWWGZ0S250SzdpNkFR?=
 =?utf-8?B?Q1pmS09FVVBsNkc1eWtqRk1WeWZJSXozVldXTDZRTXpEMWE1RFZmbUgzMloy?=
 =?utf-8?B?SG5DS0tMa01iWVVZT3dTNUhVM2VmN1VTR3FSTVA3cElvanRCZWJ3eEFSeDFx?=
 =?utf-8?Q?5lE5TW48YVruamuIY5rArSSM0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cec61e-07a8-4dd4-e0b7-08dab2eaf64d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 22:32:25.3080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UrV+AxCKvUSnpeCtvAxjHZGYtz9xBvi6lRPpMoJZrsbJPLd/jRJgv5B0nA57y5biUDB7pjU2ZEtxjHyIeAVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
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

Am 2022-10-20 um 17:56 schrieb Dan Williams:
> A 'struct dev_pagemap' (pgmap) represents a collection of ZONE_DEVICE
> pages. The pgmap is a reference counted object that serves a similar
> role as a 'struct request_queue'. Live references are obtained for each
> in flight request / page, and once a page's reference count drops to
> zero the associated pin of the pgmap is dropped as well. While a page is
> idle nothing should be accessing it because that is effectively a
> use-after-free situation. Unfortunately, all current ZONE_DEVICE
> implementations deploy a layering violation to manage requests to
> activate pages owned by a pgmap. Specifically, they take steps like walk
> the pfns that were previously assigned at memremap_pages() time and use
> pfn_to_page() to recall metadata like page->pgmap, or make use of other
> data like page->zone_device_data.
>
> The first step towards correcting that situation is to provide a
> API to get access to a pgmap page that does not require the caller to
> know the pfn, nor access any fields of an idle page. Ideally this API
> would be able to support dynamic page creation instead of the current
> status quo of pre-allocating and initializing pages.

If I understand it correctly, the current code works because the struct 
pages are pre-allocated. Is the end-goal here to make the struct page 
allocation for ZONE_DEVICE pages dynamic.


>
> On a prompt from Jason, introduce pgmap_request_folio() that operates on
> an offset into a pgmap.

This looks like it would make it fairly easy to request larger (higher 
order) folios for physically contiguous device memory allocations in the 
future.


>   It replaces the shortlived
> pgmap_request_folios() that was continuing the layering violation of
> assuming pages are available to be consulted before asking the pgmap to
> make them available.
>
> For now this only converts the callers to lookup the pgmap and generate
> the pgmap offset, but it does not do the deeper cleanup of teaching
> those call sites to generate those arguments without walking the page
> metadata. For next steps it appears the DEVICE_PRIVATE implementations
> could plumb the pgmap into the necessary callsites and switch to using
> gen_pool_alloc() to track which offsets of a pgmap are allocated.

Wouldn't that duplicate whatever device memory allocator we already have 
in our driver? Couldn't I just take the memory allocation from our TTM 
allocator and make necessary pgmap_request_folio calls to allocate the 
corresponding pages from the pgmap? Or does the pgmap allocation need a 
finer granularity than the device memory allocation?

Regards,
   Felix


>   For
> DAX, dax_direct_access() could switch from returning pfns to returning
> the associated @pgmap and @pgmap_offset. Those changes are saved for
> follow-on work.
>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: "Darrick J. Wong" <djwong@kernel.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: "Jérôme Glisse" <jglisse@redhat.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> This builds on the dax reference counting reworks in mm-unstable.
>
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |   11 ++--
>   drivers/dax/mapping.c                    |   10 +++
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   14 +++--
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |   13 +++-
>   include/linux/memremap.h                 |   35 ++++++++---
>   lib/test_hmm.c                           |    9 +++
>   mm/memremap.c                            |   92 ++++++++++++------------------
>   7 files changed, 106 insertions(+), 78 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 884ec112ad43..2ea59396f608 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -689,12 +689,14 @@ unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
>    */
>   static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>   {
> -	struct page *dpage = NULL;
> +	struct dev_pagemap *pgmap = &kvmppc_uvmem_pgmap;
>   	unsigned long bit, uvmem_pfn;
>   	struct kvmppc_uvmem_page_pvt *pvt;
>   	unsigned long pfn_last, pfn_first;
> +	struct folio *folio;
> +	struct page *dpage;
>   
> -	pfn_first = kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT;
> +	pfn_first = pgmap->range.start >> PAGE_SHIFT;
>   	pfn_last = pfn_first +
>   		   (range_len(&kvmppc_uvmem_pgmap.range) >> PAGE_SHIFT);
>   
> @@ -716,9 +718,10 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>   	pvt->gpa = gpa;
>   	pvt->kvm = kvm;
>   
> -	dpage = pfn_to_page(uvmem_pfn);
> +	folio = pgmap_request_folio(pgmap,
> +				    pfn_to_pgmap_offset(pgmap, uvmem_pfn), 0);
> +	dpage = &folio->page;
>   	dpage->zone_device_data = pvt;
> -	pgmap_request_folios(dpage->pgmap, page_folio(dpage), 1);
>   	lock_page(dpage);
>   	return dpage;
>   out_clear:
> diff --git a/drivers/dax/mapping.c b/drivers/dax/mapping.c
> index ca06f2515644..b885c75e2dfb 100644
> --- a/drivers/dax/mapping.c
> +++ b/drivers/dax/mapping.c
> @@ -376,8 +376,14 @@ static vm_fault_t dax_associate_entry(void *entry,
>   		if (flags & DAX_COW) {
>   			dax_mapping_set_cow(folio);
>   		} else {
> +			struct dev_pagemap *pgmap = folio_pgmap(folio);
> +			unsigned long pfn = page_to_pfn(&folio->page);
> +
>   			WARN_ON_ONCE(folio->mapping);
> -			if (!pgmap_request_folios(folio_pgmap(folio), folio, 1))
> +			if (folio !=
> +			    pgmap_request_folio(pgmap,
> +						pfn_to_pgmap_offset(pgmap, pfn),
> +						folio_order(folio)))
>   				return VM_FAULT_SIGBUS;
>   			folio->mapping = mapping;
>   			folio->index = index + i;
> @@ -691,7 +697,7 @@ static struct page *dax_zap_pages(struct xa_state *xas, void *entry)
>   
>   	dax_for_each_folio(entry, folio, i) {
>   		if (zap)
> -			pgmap_release_folios(folio, 1);
> +			folio_put(folio);
>   		if (!ret && !dax_folio_idle(folio))
>   			ret = folio_page(folio, 0);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 8cf97060122b..1cecee358a9e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -215,15 +215,17 @@ svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
>   	return (addr + adev->kfd.dev->pgmap.range.start) >> PAGE_SHIFT;
>   }
>   
> -static void
> -svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> +static void svm_migrate_get_vram_page(struct dev_pagemap *pgmap,
> +				      struct svm_range *prange,
> +				      unsigned long pfn)
>   {
> +	struct folio *folio;
>   	struct page *page;
>   
> -	page = pfn_to_page(pfn);
> +	folio = pgmap_request_folio(pgmap, pfn_to_pgmap_offset(pgmap, pfn), 0);
> +	page = &folio->page;
>   	svm_range_bo_ref(prange->svm_bo);
>   	page->zone_device_data = prange->svm_bo;
> -	pgmap_request_folios(page->pgmap, page_folio(page), 1);
>   	lock_page(page);
>   }
>   
> @@ -298,6 +300,7 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>   			 struct migrate_vma *migrate, struct dma_fence **mfence,
>   			 dma_addr_t *scratch)
>   {
> +	struct kfd_dev *kfddev = adev->kfd.dev;
>   	uint64_t npages = migrate->npages;
>   	struct device *dev = adev->dev;
>   	struct amdgpu_res_cursor cursor;
> @@ -327,7 +330,8 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>   		if (spage && !is_zone_device_page(spage)) {
>   			dst[i] = cursor.start + (j << PAGE_SHIFT);
>   			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
> -			svm_migrate_get_vram_page(prange, migrate->dst[i]);
> +			svm_migrate_get_vram_page(&kfddev->pgmap, prange,
> +						  migrate->dst[i]);
>   			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
>   			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
>   					      DMA_TO_DEVICE);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 1482533c7ca0..24208a1d7441 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -307,6 +307,9 @@ static struct page *
>   nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>   {
>   	struct nouveau_dmem_chunk *chunk;
> +	struct dev_pagemap *pgmap;
> +	struct folio *folio;
> +	unsigned long pfn;
>   	struct page *page = NULL;
>   	int ret;
>   
> @@ -316,17 +319,21 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>   		drm->dmem->free_pages = page->zone_device_data;
>   		chunk = nouveau_page_to_chunk(page);
>   		chunk->callocated++;
> +		pfn = page_to_pfn(page);
>   		spin_unlock(&drm->dmem->lock);
>   	} else {
>   		spin_unlock(&drm->dmem->lock);
>   		ret = nouveau_dmem_chunk_alloc(drm, &page);
>   		if (ret)
>   			return NULL;
> +		chunk = nouveau_page_to_chunk(page);
> +		pfn = page_to_pfn(page);
>   	}
>   
> -	pgmap_request_folios(page->pgmap, page_folio(page), 1);
> -	lock_page(page);
> -	return page;
> +	pgmap = &chunk->pagemap;
> +	folio = pgmap_request_folio(pgmap, pfn_to_pgmap_offset(pgmap, pfn), 0);
> +	lock_page(&folio->page);
> +	return &folio->page;
>   }
>   
>   static void
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index ddb196ae0696..f11f827883bb 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -139,6 +139,28 @@ struct dev_pagemap {
>   	};
>   };
>   
> +/*
> + * Do not use this in new code, this is a transitional helper on the
> + * path to convert all ZONE_DEVICE users to operate in terms of pgmap
> + * offsets rather than pfn and pfn_to_page() to put ZONE_DEVICE pages
> + * into use.
> + */
> +static inline pgoff_t pfn_to_pgmap_offset(struct dev_pagemap *pgmap, unsigned long pfn)
> +{
> +	u64 phys = PFN_PHYS(pfn), sum = 0;
> +	int i;
> +
> +	for (i = 0; i < pgmap->nr_range; i++) {
> +		struct range *range = &pgmap->ranges[i];
> +
> +		if (phys >= range->start && phys <= range->end)
> +			return PHYS_PFN(phys - range->start + sum);
> +		sum += range_len(range);
> +	}
> +
> +	return -1;
> +}
> +
>   static inline bool pgmap_has_memory_failure(struct dev_pagemap *pgmap)
>   {
>   	return pgmap->ops && pgmap->ops->memory_failure;
> @@ -193,9 +215,8 @@ void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>   void devm_memunmap_pages(struct device *dev, struct dev_pagemap *pgmap);
>   struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>   				    struct dev_pagemap *pgmap);
> -bool pgmap_request_folios(struct dev_pagemap *pgmap, struct folio *folio,
> -			  int nr_folios);
> -void pgmap_release_folios(struct folio *folio, int nr_folios);
> +struct folio *pgmap_request_folio(struct dev_pagemap *pgmap,
> +				  pgoff_t pgmap_offset, int order);
>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>   
>   unsigned long vmem_altmap_offset(struct vmem_altmap *altmap);
> @@ -231,16 +252,12 @@ static inline struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>   	return NULL;
>   }
>   
> -static inline bool pgmap_request_folios(struct dev_pagemap *pgmap,
> -					struct folio *folio, int nr_folios)
> +static inline struct folio *pgmap_request_folio(struct dev_pagemap *pgmap,
> +						pgoff_t pgmap_offset, int order)
>   {
>   	return false;
>   }
>   
> -static inline void pgmap_release_folios(struct folio *folio, int nr_folios)
> -{
> -}
> -
>   static inline bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn)
>   {
>   	return false;
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index e4f7219ae3bb..1f7e00ae62d5 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -605,8 +605,11 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>   
>   static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>   {
> +	struct dev_pagemap *pgmap;
>   	struct page *dpage = NULL;
>   	struct page *rpage = NULL;
> +	struct folio *folio;
> +	unsigned long pfn;
>   
>   	/*
>   	 * For ZONE_DEVICE private type, this is a fake device so we allocate
> @@ -632,7 +635,11 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>   			goto error;
>   	}
>   
> -	pgmap_request_folios(dpage->pgmap, page_folio(dpage), 1);
> +	/* FIXME: Rework allocator to be pgmap offset based */
> +	pgmap = dpage->pgmap;
> +	pfn = page_to_pfn(dpage);
> +	folio = pgmap_request_folio(pgmap, pfn_to_pgmap_offset(pgmap, pfn), 0);
> +	WARN_ON_ONCE(dpage != &folio->page);
>   	lock_page(dpage);
>   	dpage->zone_device_data = rpage;
>   	return dpage;
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 02b796749b72..09b20a337db9 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -492,76 +492,60 @@ void free_zone_device_page(struct page *page)
>   	put_dev_pagemap(page->pgmap);
>   }
>   
> -static __maybe_unused bool folio_span_valid(struct dev_pagemap *pgmap,
> -					    struct folio *folio,
> -					    int nr_folios)
> +static unsigned long pgmap_offset_to_pfn(struct dev_pagemap *pgmap,
> +					 pgoff_t pgmap_offset)
>   {
> -	unsigned long pfn_start, pfn_end;
> -
> -	pfn_start = page_to_pfn(folio_page(folio, 0));
> -	pfn_end = pfn_start + (1 << folio_order(folio)) * nr_folios - 1;
> +	u64 sum = 0, offset = PFN_PHYS(pgmap_offset);
> +	int i;
>   
> -	if (pgmap != xa_load(&pgmap_array, pfn_start))
> -		return false;
> +	for (i = 0; i < pgmap->nr_range; i++) {
> +		struct range *range = &pgmap->ranges[i];
>   
> -	if (pfn_end > pfn_start && pgmap != xa_load(&pgmap_array, pfn_end))
> -		return false;
> +		if (offset >= sum && offset < (sum + range_len(range)))
> +			return PHYS_PFN(range->start + offset - sum);
> +		sum += range_len(range);
> +	}
>   
> -	return true;
> +	return -1;
>   }
>   
>   /**
> - * pgmap_request_folios - activate an contiguous span of folios in @pgmap
> - * @pgmap: host page map for the folio array
> - * @folio: start of the folio list, all subsequent folios have same folio_size()
> + * pgmap_request_folio - activate a folio of a given order in @pgmap
> + * @pgmap: host page map of the folio to activate
> + * @pgmap_offset: page-offset into the pgmap to request
> + * @order: expected folio_order() of the folio
>    *
>    * Caller is responsible for @pgmap remaining live for the duration of
> - * this call. Caller is also responsible for not racing requests for the
> - * same folios.
> + * this call. The order (size) of the folios in the pgmap are assumed
> + * stable before this call.
>    */
> -bool pgmap_request_folios(struct dev_pagemap *pgmap, struct folio *folio,
> -			  int nr_folios)
> +struct folio *pgmap_request_folio(struct dev_pagemap *pgmap,
> +				  pgoff_t pgmap_offset, int order)
>   {
> -	struct folio *iter;
> -	int i;
> +	unsigned long pfn = pgmap_offset_to_pfn(pgmap, pgmap_offset);
> +	struct page *page = pfn_to_page(pfn);
> +	struct folio *folio;
> +	int v;
>   
> -	/*
> -	 * All of the WARNs below are for catching bugs in future
> -	 * development that changes the assumptions of:
> -	 * 1/ uniform folios in @pgmap
> -	 * 2/ @pgmap death does not race this routine.
> -	 */
> -	VM_WARN_ON_ONCE(!folio_span_valid(pgmap, folio, nr_folios));
> +	if (WARN_ON_ONCE(page->pgmap != pgmap))
> +		return NULL;
>   
>   	if (WARN_ON_ONCE(percpu_ref_is_dying(&pgmap->ref)))
> -		return false;
> +		return NULL;
>   
> -	for (iter = folio_next(folio), i = 1; i < nr_folios;
> -	     iter = folio_next(folio), i++)
> -		if (WARN_ON_ONCE(folio_order(iter) != folio_order(folio)))
> -			return false;
> +	folio = page_folio(page);
> +	if (WARN_ON_ONCE(folio_order(folio) != order))
> +		return NULL;
>   
> -	for (iter = folio, i = 0; i < nr_folios; iter = folio_next(iter), i++) {
> -		folio_ref_inc(iter);
> -		if (folio_ref_count(iter) == 1)
> -			percpu_ref_tryget(&pgmap->ref);
> -	}
> -
> -	return true;
> -}
> -EXPORT_SYMBOL_GPL(pgmap_request_folios);
> +	v = folio_ref_inc_return(folio);
> +	if (v > 1)
> +		return folio;
>   
> -/*
> - * A symmetric helper to undo the page references acquired by
> - * pgmap_request_folios(), but the caller can also just arrange
> - * folio_put() on all the folios it acquired previously for the same
> - * effect.
> - */
> -void pgmap_release_folios(struct folio *folio, int nr_folios)
> -{
> -	struct folio *iter;
> -	int i;
> +	if (WARN_ON_ONCE(!percpu_ref_tryget(&pgmap->ref))) {
> +		folio_put(folio);
> +		return NULL;
> +	}
>   
> -	for (iter = folio, i = 0; i < nr_folios; iter = folio_next(folio), i++)
> -		folio_put(iter);
> +	return folio;
>   }
> +EXPORT_SYMBOL_GPL(pgmap_request_folio);
>
