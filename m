Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A044B7AB5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 23:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17110E19E;
	Tue, 15 Feb 2022 22:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318510E19E;
 Tue, 15 Feb 2022 22:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWKAl8HrgiGS4buWuNZB4EeiP8ZcFdOqJZmyizAH8ExZITmTW1qz2Lsy09G9xZMsKvwavtgv+5sLdcWXFYp5ZxBqEV+bmKUjn39R7N9rAvyGrdG07XGKdYQyp5ACUn7P+Xk2WeCCnUSO9i+wBoWS4xKZHl/iYbS9Jy3rQc6ajvRqLWXzY3dHIvQJUYYeuOegjpf8f3+jaOXz7HxAnnBQOGU1RvhkxuQZKmBkBh92yDWNAuCpXbgq1V010D19Kf1gFNbMyvJv+sbQ4i/lb4qNTk89Rq+WJj9ys7QGMTW705WRAiX4vYA67OIMU5BMLxlUH6eeH9bgg9kcdkzXUaUZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxQqcjeTNJ1DxXGrdeaKjRBWD5N68Ihv4lMyx+YamCE=;
 b=fsldmieB2UsLBE6cr6IbYuXIQGQ/R9a7XWm7islB/XxNHOQlx4wiPKAjvnUpyRxZ8c9vROSeunu8ga58JaqBw0BbWgquC6eUe2V97ZsPVTg+cnKRdFGgrPWXKAJedbE6Z0Pu9P7C4pJgUA7oKAAtym3WsQ1HNCSSpIDBuJz7FaeH6xaLWaA7L8p3gRKQ78efode0HIh6lqvrs/wO7iscJTxNejztlxfEhq2DEeqb0t1QvwKgrAyVGr16HFuocXfQpAqDHYEnKYW7+u4csqXZ5Zib6723YUQBO7LIgZQT7SxGjiwXdzFxiAqUfAEBBwEFt9H36i/awJwvyYAJX6zxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxQqcjeTNJ1DxXGrdeaKjRBWD5N68Ihv4lMyx+YamCE=;
 b=qHpUIg6E5eryaK+Gv0NZGefPqs1DTltl9V/0Eo2Xmy55V2JaPzHcwIH55gNYlbAzyUCV3qvoSGDwfXdqSzCHFV85TrN/BbJRo/epCFpPGSGebCw+0bfeEzjHslU/yBckiU8L9amgN5mWpOtBCeJhVDm3ksME/+h2le29i/53QCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 22:49:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 22:49:09 +0000
Message-ID: <002ad572-4d32-7133-06f3-aa680c297be2@amd.com>
Date: Tue, 15 Feb 2022 17:49:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
 <20220215194107.GZ4160@nvidia.com>
 <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
 <20220215214749.GA4160@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220215214749.GA4160@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0039.namprd15.prod.outlook.com
 (2603:10b6:208:237::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77273886-dc0e-45d2-32f4-08d9f0d560a1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254F666721E955A7CE6FACA92349@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQ7dHjjPzmuySfkGAtoE2W7xsD51RoV81aAQaCucYLUwfnExYZBZ7BboNCJXZTVY4ltOUT1VRziu6XP2cFXxF7CJqeLZEsTOsIPNgkylRriQ19NVqXbbD1nTn8i2nuNKZHjcsLjlgaYx4zoXu6TI9g8A2O/LS0SPMsXm119n+NTWImFbjloZ8kEM0bblqichDbQ82KkKJWf1/aQbBhH4EdWT+xCpAckfmo0Fp7/vnqbDSZzbfkHXtqS4PuVbkuA6Zmv6ONl2WvSXwhD/XiFNoCUgDpQQ04IlsAT61LvXCZqxXqF923/Lqas//i+j+h3fakzsQKdyej47Sa6cQx/lfQeJIjIyUqn0QZp6YpUAhMcXZLsHtcB80F75Zl4m+O666GX/RSI6+4MR19pQMNQDA8h3BpDJ30DeKL68nhMxfo3jkcm4jpSy2cTqTvod/hbEIY08seJ0JiyydlN2jHmSVvtkMCT0BLpryZqXqbNzlHmESoAk/yW8oWeE6ly8g0P7A1DmTSfC/s6wBRdQwyJgey6mYc7fdMUwL3TWmxLhN2OxVNOZRf5X477Hsgs857YLp0DnDn8jN2J6pXLx6ZDnlgY8VNr8bveLShlj8zRhuaeGU8I0oM5DPLI7RoNkl1z8Uh2+KrqRmhKX4AxZ+qQ68QFv7AqMfmCf3nHf0I0GeEJkC5R7BsLQQcbfiKCLEhYq3pgV7wZ3PIjGTcddoOBbAt5NPk9F6wnHt34NCN0+I4VLzVrS9RCU82qOspB4c4p2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(508600001)(31686004)(6512007)(53546011)(2616005)(6506007)(6486002)(36916002)(316002)(36756003)(54906003)(5660300002)(6916009)(44832011)(186003)(7416002)(4326008)(31696002)(38100700002)(2906002)(66556008)(66476007)(66946007)(86362001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtPb2RxbEo4Q3l0eG1FQ09oVktYOGxyZkI1NW9XSzlJNnVTUFBYNkZIc2RX?=
 =?utf-8?B?djNSTFVpQUs1TDcwNGZsUDFNZG83K1h4NGdId0l1ajNGUW1OU3NHdXJCTmxt?=
 =?utf-8?B?RGhoSlBvVFFVUW04bllhZFN5M3g3MWU0L3BqSVZkdzlNMStRSTdlMGJYUCt6?=
 =?utf-8?B?SXl4RU0zTXYrVC9qSENqVnRRczhyaDdKejFnUU8vZkJ4STJrbEYzMkxCZkEz?=
 =?utf-8?B?SUZtUmZFWUYwdFdnSmk1N1IyYjJncklvR29GUCtvWElmTzl0OGZSbWg1ZGFM?=
 =?utf-8?B?VFM3MkszbTkyTnhCMTlZeTROKy9IN3NLUVVOU0hELzVYWmYzUXQyRlZLcXgy?=
 =?utf-8?B?UFJPYTVVaXJzVHZXR05NV2RvdEhSZ1dtQmVHRy80NWd3RU5xaGRUbzY3M010?=
 =?utf-8?B?cHRsK2J4blRhTk51amg5Nm01K1h6eTR4elBMRFJocEpvZ1NkN1l2cURWZ2tC?=
 =?utf-8?B?Y1orWDR6QTdLWitQMVdrMUV1dWQ3ckYzeWNKM0FQcnRjaDNlc3BXcEtzOTdq?=
 =?utf-8?B?RjMwQlpmOEVLZzYwZFI5WnFlb3ovY3owZ0FyeVlySDFjY2dBQUE0WXdYZ1FP?=
 =?utf-8?B?eU9QNmpHTUJEUU54Z0tqZEIyNURJdFNnQkRVa2NUMG5HUTdmZDJsKzJYcXlH?=
 =?utf-8?B?RGViT3h5dnVHTk10M1lUMlJVblloRDdvTW03UHU1VG1BNmlEUHR4WmZCSUwx?=
 =?utf-8?B?NndOQ3lsOGVxN1BkVTVhbGpTVGlYSGJuTVBvcmV0RGl5eE0waWxGOWRzdGlZ?=
 =?utf-8?B?SlVjV3RXN3dxMmR1Yk1TWW1ZSWxHOWNWbVVFVVd3TGV1dzBjVlR1RHMyT0pP?=
 =?utf-8?B?UnZncXMxbzBCeTFPTzZoaG0yQmQyRUYzQ0VyYzF2YzQ1dGlDTGVCaGhyUm5t?=
 =?utf-8?B?RkdBYUx4eEZtTlphanFSb1Mwa0dXc2RhU2hNSGpnTUlLY1R1VHg2QVhLeGlX?=
 =?utf-8?B?ODN0UE5iRjVhV0RKcEtqZFhQSkcrbnZoSS83bERFQ01HSDRBNzk0bEw5VlND?=
 =?utf-8?B?QnV2YmdZanB0Umw4S1F6MVh2V1h1ZUFJRDR4SnJxWUZQQTBXRFR3L2FGNlZj?=
 =?utf-8?B?Q2p6cTNUdGJYZzJldVllbXNpa1VXN0Z0djQrcG02ZUZ2ZFYvTkZ3T2lkV0Rp?=
 =?utf-8?B?djQ3MTlUZ0pzS2gvSGtUSUJjTjBubzNvWVVSYVROdFc2Q2pTWTlHdmFQaFhz?=
 =?utf-8?B?dU1qeU9qK0VLRVhUOHR1MjBXZHdkR0dIYkZIVEFNbU9Gc1JWaXNhYlAxdFdY?=
 =?utf-8?B?dU5BVnE0TEtPNWk1bWFacUNNeUtmdmgwcFduRHdxR05yVXltR3ZYTGR6MWNQ?=
 =?utf-8?B?dzJNUGJ5dWlpbkJLVG9sNjRPd3BmbzllOFMrd2lKc1hkOW05dGluTkxSMDBX?=
 =?utf-8?B?UXNiTVBvQnlxMEZxTmZwdWhtaHdqRDNYVDVRbUVqWXExRFNVYTR0bVVKM0pI?=
 =?utf-8?B?eWJKZjJ2bFVvaENuSWlKSHlrWFVsOFdXZTd3S3FkZWFNVGd4TVp3OHBKYkdj?=
 =?utf-8?B?cjlPZW9HUDNReDJLTlZTRTJ4UEN2QVRxbXBSQ01aY2JBUjJMdnI0aDNTZEVm?=
 =?utf-8?B?bDdtRGcyTGx0SGptNGU5TklJYkYwOC9wdXJiYmlOa3RvSjI1TlZWTklZendt?=
 =?utf-8?B?c1dzMGVJaTVnam9Eb3FDRE5nSko2eUQ5SGtxdU04anhOSytCRjRkQ0RaeW5t?=
 =?utf-8?B?UW5zMmxLZjhmb05ySXBZR1NMQlBOTzEwUUhCRnUwbXNSajdSRC9ZVWtWdm82?=
 =?utf-8?B?d3JvVFZJNW43bHd2eDFMU1ZJMVRMS2cvYnQ1TklXLyt6bURsWVB0Tzd3RlFJ?=
 =?utf-8?B?R0s1N1V6QmNRU3UzckQ0MjdkMnc1REp5RGtmUjNwbXhRTDJmeFpJa0QrZDBq?=
 =?utf-8?B?NDM5NWd0cXVFZHBzWVd2UytYOVc5ZGRxYjZseFBMVVd4elFvbmJnRWlMVkRH?=
 =?utf-8?B?N3RQRTVBMDFIN2RCWkJTc1JzVXJSY0tWVCtvMlF4bVA3ZmlWYk5JUk9QSzZJ?=
 =?utf-8?B?bFFiU0tLZFFxeVZodzZNMlcrSGQ3QkhuOXZQNmxFaEFDUXQvcTZwRCtNRDF2?=
 =?utf-8?B?aG5sdDVnbUpVU2VkK2FpRGUrMDFFT2dsSHRoNnN6aHpRTmI1UWtsYzFTdEJI?=
 =?utf-8?B?all3a3RIdHVIL3pzQUIyUmMwRURvdGZUczhoVXVPZktHN043VjQ0aitVNjNK?=
 =?utf-8?Q?mFNip+ddCxkKXH8Z0iLcvRE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77273886-dc0e-45d2-32f4-08d9f0d560a1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 22:49:09.2637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QONoPdzKWv3FanV2/r5pa94Ql8HjBuoFdOTpYjpAcz3JcHbdqgmrnbTATbiWUPOIVqHhoYfBOBESMbgRrDXcDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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


On 2022-02-15 16:47, Jason Gunthorpe wrote:
> On Tue, Feb 15, 2022 at 04:35:56PM -0500, Felix Kuehling wrote:
>> On 2022-02-15 14:41, Jason Gunthorpe wrote:
>>> On Tue, Feb 15, 2022 at 07:32:09PM +0100, Christoph Hellwig wrote:
>>>> On Tue, Feb 15, 2022 at 10:45:24AM -0400, Jason Gunthorpe wrote:
>>>>>> Do you know if DEVICE_GENERIC pages would end up as PageAnon()? My
>>>>>> assumption was that they would be part of a special mapping.
>>>>> We need to stop using the special PTEs and VMAs for things that have a
>>>>> struct page. This is a mistake DAX created that must be undone.
>>>> Yes, we'll get to it.  Maybe we can do it for the non-DAX devmap
>>>> ptes first given that DAX is more complicated.
>>> Probably, I think we can check the page->pgmap type to tell the
>>> difference.
>>>
>>> I'm not sure how the DEVICE_GENERIC can work without this, as DAX was
>>> made safe by using the unmap_mapping_range(), which won't work
>>> here. Is there some other trick being used to keep track of references
>>> inside the AMD driver?
>> Not sure I'm following all the discussion about VMAs and DAX. So I may be
>> answering the wrong question: We treat each ZONE_DEVICE page as a reference
>> to the BO (buffer object) that backs the page. We increment the BO refcount
>> for each page we migrate into it. In the dev_pagemap_ops.page_free callback
>> we drop that reference. Once all pages backed by a BO are freed, the BO
>> refcount reaches 0 [*] and we can free the BO allocation.
> Userspace does
>   1) mmap(MAP_PRIVATE) to allocate anon memory
>   2) something to trigger migration to install a ZONE_DEVICE page
>   3) munmap()
>
> Who decrements the refcout on the munmap?
>
> When a ZONE_DEVICE page is installed in the PTE is supposed to be
> marked as pte_devmap and that disables all the normal page refcounting
> during munmap().
>
> fsdax makes this work by working the refcounts backwards, the page is
> refcounted while it exists in the driver, when the driver decides to
> remove it then unmap_mapping_range() is called to purge it from all
> PTEs and then refcount is decrd. munmap/fork/etc don't change the
> refcount.

Hmm, that just means, whether or not there are PTEs doesn't really 
matter. It should work the same as it does for DEVICE_PRIVATE pages. I'm 
not sure where DEVICE_PRIVATE page's refcounts are decremented on unmap, 
TBH. But I can't find it in our driver, or in the test_hmm driver for 
that matter.

Regards,
   Felix

>
> Jason
