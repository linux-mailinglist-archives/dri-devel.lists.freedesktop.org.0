Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3A4B7475
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 19:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7F10E45B;
	Tue, 15 Feb 2022 18:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D376C10E45B;
 Tue, 15 Feb 2022 18:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKd6+iX+JcY3ZiOYVqH5AUK2xl55mnJiulFyZNHTqFEvAWDsco5fo/bE5XUMO/d74Yvd3MZ0R2qOtmRk6kvel5Iu9hyVZdo0Wj7lFpMc+30QhTW2shIbj4uipgysenEA+76zcZHdIa5f8gp6d3o6Z8VA16KG/LZps3qQPYFvTXWpZB3iVZF1fb5dvwF20VpDItn711WCeEh+TqaJ8Gy1swJqNDdTDuZsfrtUGeKtmhS/3gA3JQSASKUPSG9K2/qbkYtmoDtsgCc89mhJahXPSc97Gif5SwHKt9AneFYEW/Wnc46cIodxBitvGusR0MXa428j6bl53BcVWy4VMT3o4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGsmsONNz21ge3Ex7WGlfwEhUJjJu4ov8jAd8oTov+E=;
 b=ld1qI3JL3aOx0yj1oS7h3nZzI0Ld9RZ6XpHZuPFNDBGfyFoaj0MSyYNt2zgqXXBwLS5nwVpRa2L55IWyLK2KetXe49XZCuHnPlDa1jA0XWKI2M+YGTWATJbIu2sponB53smetq/aZEGwXHMMc4e3ksrhUtz5CsA4PiJjG+2uQsQuRTyfTXTedUlgp06yuY7WszcvTB57ukCynzFukakoUcfDX8KNzm0TPV12BcQrakXmHhEgIhLbNaO/GQgFABtHJQ5G8eF9ZVZqADR0VcJ64sZPurFcQhGxUn0SdI7rvN9RNiJnNO7+Z8J2Rfw2UccVdpJMymNGzbYxGV50a98Z2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGsmsONNz21ge3Ex7WGlfwEhUJjJu4ov8jAd8oTov+E=;
 b=FP+7Z2gSBS6KD6z4EoLCNR6akheQRpHfcc/CzCgZPQG9Ow1QAni6g1GTxsNndItBswV2OQhWJHOAyw5J48K0/UWCZ+ep2WpNKo3rIJ/aPh5Dn1TzOxWjkTOsaTqh1XE1NNnHANXn+4Fj1UulJ7tZIXAKMMVKxRDy9RR6rHeKlQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4910.namprd12.prod.outlook.com (2603:10b6:5:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 18:52:38 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 18:52:38 +0000
Message-ID: <7ab81ae3-d2c1-d633-5050-3562e9923771@amd.com>
Date: Tue, 15 Feb 2022 13:52:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <20220211164537.GO4160@nvidia.com>
 <6a8df47e-96d0-ffaf-247a-acc504e2532b@redhat.com>
 <20220211165624.GP4160@nvidia.com>
 <7b830dc4-37bc-fb7b-c094-16595bd2a128@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <7b830dc4-37bc-fb7b-c094-16595bd2a128@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:610:4e::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac95cb4-537b-4735-4ca9-08d9f0b45601
X-MS-TrafficTypeDiagnostic: DM6PR12MB4910:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB491082976058E150BD236BC892349@DM6PR12MB4910.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vNlMFk+NoIkR5VHfAI4LiIVzvEsh9IYLQcWDmmVXD+0zBEMek+lKmqUK16GiHH/LEwi+O1CS3FFjcJL4bC74Qq/H8jFpTodKNhG/+w3Bm2bw31RIGR3TsFcj+yMpfiliVigNFHaWigrMTZMuqk7MEzDDa+98tyHBJ8nKXbyJGcipaHlyFNPPvqO9zklpRRv3YziuKuDb3yIb5LRYX35Ng0egCVkndNrZlLyNZ+ohPv2tu3hXUFZKgKT294P90ou8+x1fCJjZVaVgLdjjyVzE87GjtB/xO42ugP6Zm6lLM2rc/UlSj5LpirGVolG5Dbac+ZA31vDiyQxNbzcl62oQOiwdzp1Q8PAlH8hupHKZA+xy6KnYpRsh5e4TR9L5aueLrOc9BuYJ+Xdh29b7Cq7YxUBkWCpRfzHWP/29pIl/m6T17XmWPlGCXuICuksU2LOBNB2iL9ikbGZFNt1dn1zWeZ7yXcZA8yZZUkds9mgZNmGP1B87LP5whsG1V5+IEFAr61Brv2DaUG8LP+mzYzVXeJ5r26VGQWdsxM4AuaGd5zJEqm5oxAYuhamGtq9SKLfRZ6sAOuJXuVuDT0YFgj/jEZIMZFIgNdpj9j2LFa6JMNMQQUP9FJdItAENasHa3Uztylv+kv4GjcbQ8zE7OEdFHKeERk7dGvtXGceJ7MI/5C+2cjxgfjduAWnSmD2r9u52MmfhKukggqkq0rjng1zBSX0C2KGeSfdwlN79AuOWtx6YkKU9RNMXcKp/bPkxHAwI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(26005)(186003)(8936002)(316002)(31696002)(44832011)(36916002)(110136005)(53546011)(6506007)(83380400001)(86362001)(6486002)(7416002)(38100700002)(6666004)(36756003)(508600001)(66556008)(66946007)(8676002)(66476007)(4326008)(31686004)(2906002)(2616005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUlONXlTTWllc0ZQd0NOODU1Y3ZYM1lOcTBISURrMkRNekJqZDUvR1JwUTZ0?=
 =?utf-8?B?U0Y2L1VKMm1HZjlWdXFXd1Z5WHZSQjk1MWZmVStTb0JqVE5XRS9xUzY5NUx2?=
 =?utf-8?B?RFhUZjdYektnZEJmVG1DeHlrRnh3SHBaREE5SUZwN2Y0cHpaTVNpbkZxaDMr?=
 =?utf-8?B?YnROb1FWR0dQWDkwRlJHdGlhMWdzMFVRTkJSRzFMTTF2UTRRY0NRVUxSRWhj?=
 =?utf-8?B?bGdkOHdlV25zVjc5dDJ6T3d5Ukt0aDZHZm8yWFJUMzlYUHRkbk1IN2d1MER4?=
 =?utf-8?B?RW1jR2dJRE8vZE9hUDlZeWhjdE9nT0JMRk5VZnh2cEFBSFpNcEpXLzBHcEJr?=
 =?utf-8?B?WTZSRU9rb0lWMmNBeWJFRXFUSWFpRFFnSGxINkx1eEZGbkxPRlhBZ3VVRW1L?=
 =?utf-8?B?NUFmZGRKT1RpWWtYSW9NU0lyVHhoSUNvaFpmeXBTSjlXeDJIZ0JPOCtHS0Mr?=
 =?utf-8?B?TWZmQjJOc1l6Z0xmOC9tMXlYOXM4a0xGVFpDazJPMnd2cDNNQmxJaWdESDhh?=
 =?utf-8?B?cForYTZYYjFHSFBZUTRWcDZmYVo5RGhtYTZsT0ZiYUlDZFBiUlU4YjRZQmZC?=
 =?utf-8?B?ajdBeXB2L0VBc3l0SUNZbkQrZmp0NTY3MkJ0aUlMMmk2a2ppeGFZeUoxMDlT?=
 =?utf-8?B?MDBUMnBnVm9kUkxzZGZWZm5yM2VsRUZHZFhiNGpjdi90bFRQaXZKNmFsanhS?=
 =?utf-8?B?OHhKbTlzK2N5WkpsUE5ReEo4QjA5WXN3dmd2T1FwN2ZaVTFUZGJRbWdsczFi?=
 =?utf-8?B?RzBzdGlOelYza05PNko0Tmh4VU1oRXQxczc3ajAvV1lBUTFIUFRrTmQ4Z1F6?=
 =?utf-8?B?cllqcWlKSW1FcHUzaHVaRE41dWJ2SzRRQW1pUG1QNGlRUVM2Vk5vMmI0eVBV?=
 =?utf-8?B?ekhpRHovd0RtRnE4U0pXTEVRbmZFZkh4MWdHdlRIUFA2cDRnZlM0a1ZBMnlK?=
 =?utf-8?B?MWtIamVTQWUySHZoWXAwNjN2TjhSM2t4cDVPMFZwQ3RsdzRLR3BnNjBvLzlo?=
 =?utf-8?B?WUVpSEtnWmsyUnRUUnZSZTBSZ1lXVEJOR00zbi9UeXdyNXpSLzdGOVQ3cTBF?=
 =?utf-8?B?dHp1d3UwMHVDYWk5WSsvdmFWeFFLMHZiSFZOLzFlZzJmK01jMnNzY1g1Y2ZF?=
 =?utf-8?B?T0t3U2NyZGJzQkNMdG43eStVV1M5c015MUZHaTlYYkozRDF0eUljUW9TVnNm?=
 =?utf-8?B?ajhIYUwvdHB2TUhYKy9rNWF0L3RrcXM0SnZUNEZFLzlyVS9yQ3VlTHd6UnZR?=
 =?utf-8?B?bVgvRERJb0d6WUNRTnJGWnQwRTBYWUxMYURFRmtvREEwWEVudGxpYXcraEdU?=
 =?utf-8?B?cjBhUGk5c0JXRU9lWGM2d08rYlNCcEVXelJhdHhWNXoyUTRjNHVadmVNTDJN?=
 =?utf-8?B?R3ZaRTRwdG5BMlNTenIyWVNpRE9FbW1PUzlGT05nNHUvUk1UMDVjUFNraENo?=
 =?utf-8?B?TDlKUFRUc0lNNW1kUG1JQkRqbUhWWjRsNWxzd2lteFd5QVlCeHErQXNlemF4?=
 =?utf-8?B?VHVSL2tCL01qRUhsR01aMUpMeWJ3ZmJYWkMvRi9NRXg3NkZDaStleG9SQkMz?=
 =?utf-8?B?RGRKZHROcG1hdUhycnk0d083RWU2Z3FKOG1yc24wcWFvMHlHZEtLMjR3NXhr?=
 =?utf-8?B?cEplWUNTMEhmWTUxNWxlMHNCT2VFQVJpbXU4b0JWeWZJd0VwYVY3VlRLUmtG?=
 =?utf-8?B?b2IzU01UbitwcSt0dW9SaUJuNzd5UjIxc0dhZjZ1YnRnVGp6SjBtb2JsRFJK?=
 =?utf-8?B?MHdyQVdPSDkyZnJJVVp1cEJycEl1RlJ0V2pSYm44ZnNSeERINDh3Z3VtQll6?=
 =?utf-8?B?R2ZreGczQmdNRGEzUE9CbXROZThNSk9JY2c4YzRNVC9kS3FlZytXL3ZVZ0lG?=
 =?utf-8?B?YWNuMnFnN1llbmI3dEwrWjg0cWpuTXIrbld2eUtMMkNoeUZwWCtIdEFyQWZI?=
 =?utf-8?B?RFplQXRlYTBZWkgyQkF0Rkg2bVMzcTNPRmZ5SXNUMXlOazVDZ3dPSkNoU2RW?=
 =?utf-8?B?K1Bua0ZINXpzK3RraS9pRmozL0ppWU93cWs5R3F4SWpJM014eXRNRW9TZHdn?=
 =?utf-8?B?b3JKdGkra2IwQzNESC9nUnl5MjA0Tm9NaFh0ZFk4U1VSSk9BemR4RmNPSitK?=
 =?utf-8?B?UVhmbzJwQy81T0xkWmpWNmxUK3FhTldPZWJhVjRtdFhhV0UyZ21pTkRIWmJK?=
 =?utf-8?Q?h6onjWFy2dIQBZZnM8DtVpU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac95cb4-537b-4735-4ca9-08d9f0b45601
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 18:52:37.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQarD/fMTx0oySYgRCBq+ErUopWxrLb+2PvxeJMzSgF1hbuhc3xYGVZOdAdQmazXtWvQQitFkztXd8UgZcdAQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4910
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
 willy@infradead.org, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-15 07:15, David Hildenbrand wrote:
> On 11.02.22 17:56, Jason Gunthorpe wrote:
>> On Fri, Feb 11, 2022 at 05:49:08PM +0100, David Hildenbrand wrote:
>>> On 11.02.22 17:45, Jason Gunthorpe wrote:
>>>> On Fri, Feb 11, 2022 at 05:15:25PM +0100, David Hildenbrand wrote:
>>>>
>>>>> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages
>>>> Currently the only way to get a DEVICE_PRIVATE page out of the page
>>>> tables is via hmm_range_fault() and that doesn't manipulate any ref
>>>> counts.
>>> Thanks for clarifying Jason! ... and AFAIU, device exclusive entries are
>>> essentially just pointers at ordinary PageAnon() pages. So with DEVICE
>>> COHERENT we'll have the first PageAnon() ZONE_DEVICE pages mapped as
>>> present in the page tables where GUP could FOLL_PIN them.
>> This is my understanding
>>
>> Though you probably understand what PageAnon means alot better than I
>> do.. I wonder if it really makes sense to talk about that together
>> with ZONE_DEVICE which has alot in common with filesystem originated
>> pages too.
> For me, PageAnon() means that modifications are visible only to the
> modifying process. On actual CoW, the underlying page will get replaced
> -- in the world of DEVICE_COHERENT that would mean that once you write
> to a DEVICE_COHERENT you could suddenly have a !DEVICE_COHERENT page.
>
> PageAnon() pages don't have a mapping, thus they can only be found in
> MAP_ANON VMAs or in MAP_SHARED VMAs with MAP_PRIVATE. They can only be
> found via a page table, and not looked up via the page cache (excluding
> the swap cache).
>
> So if we have PageAnon() pages on ZONE_DEVICE, they generally have the
> exact same semantics as !ZONE_DEVICE pages, but the way they "appear" in
> the page tables the allocation/freeing path differs -- I guess :)
>
> ... and as we want pinning semantics to be different we have to touch GUP.
>
>> I'm not sure what AMDs plan is here, is there an expecation that a GPU
>> driver will somehow stuff these pages into an existing anonymous
>> memory VMA or do they always come from a driver originated VMA?
> My understanding is that a driver can just decide to replace "ordinary"
> PageAnon() pages e.g., in a MAP_ANON VMA by these pages. Hopefully AMD
> can clarify.

Yes. DEVICE_COHERENT pages are very similar to DEVICE_PRIVATE. They are 
in normal anonymous VMAs (e.g. the application called mmap(..., 
MAP_ANONYMOUS, ...)). You get DEVICE_PRIVATE/COHERENT pages as a result 
of the driver migrating normal anonymous pages into device memory. The 
main difference is, that DEVICE_PRIVATE pages aren't host accessible, 
while DEVICE_COHERENT pages are host-accessible and can be mapped in the 
CPU page table or DMA-mapped by peer devices. That's why GUP needs to 
deal with them.

Regards,
   Felix


>
>
