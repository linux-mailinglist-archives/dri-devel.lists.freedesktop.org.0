Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB346097F4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 03:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0EC10E21E;
	Mon, 24 Oct 2022 01:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC1710E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 01:48:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKsYK8a/wnxRWyynpHSAfwSNIL1nEit5bxSxDi6jTFvzeCNPC2eo2rHq+3jlsXi5ysMkenET2LTCs/bTmYsU6zZjJCsfFNlqd7G0xPQPxNbSbwAwMKLLaziEzWxNL+cu+xK7cMtf4IUYV8tVCaAI/BKIByD1TWqTZWlp6FbX+1ycocUMKXERujbFExgWS5bw6KR2Iysdftq2bKi123bn7LGO59qBlsoAma/bZbbmAqQJDhE7E1zsgXPmamvwRPmb9sSPjpCjDXnbEW3VeoCdJ2GmCui9ng1wuNJAY05ti0/9MC6DtiCqSBsHPghPQdEQSyQfCMFynyf+Q4LlvdMZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsytFnsh7ofQTM+YuaLrSYjsEyzizBws5GSeHRuzYgc=;
 b=Plkgb7JA9I4fo3o8bCvkQgzmX8ObhNmViTm/mgubpQGhFonVhAdachKDriVdbGt0CGxRsWkgZu41sMXySwQ9YhqsCR1iE9dfOLGMkd+VyEoCQ+Y+UwBkp8DCnlCEdmZaCQWefg4QuqnHbOqUOoWOdPuK4M5lABLSqns/lJcD4kKzpA/aAgqjKBa8OK1LLoo1Uv2RElc+e4dctxoQnjExd1KeM8cYzfWGPHt1bfE8Cvv/WWy1tanSnkAcoT6w0mVGr8/iHMdxteDmvOKjr6nTW60tcFbJdp7z4OntDPFq+hVCn/cfCk2DzkvaC18kxE0lcckz2Fi7Vl9QmHfpXPKHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsytFnsh7ofQTM+YuaLrSYjsEyzizBws5GSeHRuzYgc=;
 b=Bs5sogEXU/OlRNxnEQyzYwZeLUB9V8sSWwg+VNwmuOjVOiaTyZbnzu/sO3Ev+VNqD1D0ZoBxWXMNPeorZopTaMkdNnIWEGMkaN30uc3ixa2V1G+khHu+skyB2DDhFfBq9ENJvCeNt073UHDikDdZkNbciFegJ7El+Ibg4ZMTelB622vPte7CNni3Jwwl4f12tqGEHX/sGxP5SR9hvbjCskCFtevAZtCk+EmtAlO7tNFyCK6A4Uo79SIlvWPPeZJizHxWmjWZnq5WAuMiDolu7ms4i/rMVqp+vlwUe6nwzoeKduuqGKrzQP9UqqrGbiiVLgY9zxWkRNxvxFoEYbXZjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY5PR12MB6057.namprd12.prod.outlook.com (2603:10b6:930:2e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36; Mon, 24 Oct
 2022 01:48:00 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6ed5:b1a6:b935:a4d8]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6ed5:b1a6:b935:a4d8%7]) with mapi id 15.20.5723.034; Mon, 24 Oct 2022
 01:48:00 +0000
References: <166630293549.1017198.3833687373550679565.stgit@dwillia2-xfh.jf.intel.com>
 <cbc23eba-990f-688e-d22b-0c0d103172cb@amd.com>
 <6351d7105fe92_4da329467@dwillia2-xfh.jf.intel.com.notmuch>
 <0d2efd01-956c-3e61-6bd0-81e449fad4f9@amd.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH] mm/memremap: Introduce pgmap_request_folio() using
 pgmap offsets
Date: Mon, 24 Oct 2022 12:44:34 +1100
In-reply-to: <0d2efd01-956c-3e61-6bd0-81e449fad4f9@amd.com>
Message-ID: <87tu3uq9fa.fsf@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: SYXPR01CA0100.ausprd01.prod.outlook.com
 (2603:10c6:0:2e::33) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CY5PR12MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b578c5-d880-4886-e376-08dab561c841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHRoHIc20J9M9xhfz6kMvcYOVoH5c0SvMJVnQ9U2Dw3H6ZMg4bTPhmjowrNYOUPOPX9ttqZ3wS47gs5GwDh1RanYx3gcwzHmQ43T2XPDsHabGeuhjOcLzdw2lVg8OTxRSoE4rQ1gZQ5p5NTGCHnTD9TxQUsWd1l7cIFd5Z4GrOC8bDyc11NaMWjnagUvXh9oH6uRFSm8h9ULWTCd0r0hHX8EP3QI2wxJQDTICVicf6k+HuYkWbn6w5rcsHijzdARdXqpNQjwbG+gc14koN4vIx8xMJ4JvLE3a0X4hUKoxgQ+BPlc/SsiwnvO3A2hNVkEdm4EcBEjUv9xubQCGKtDV2pcS9IzTUeOiMyycqJD3znjicwoOGB9U39y87laW7oKK3Ft3DrNarTLrXBi/H+vdeP+IbfZA/x4QRZKLfhElcS7+cjPMv/wWHUFpKsynrSPsElqU2qGPbAsdy2dLe2TodbPJEqOEat/QHvA7lexBI/OBUsHTGpVcjcj19C0+gOXQRzu4Cx+02oiggwk2lsmq+pC8FF90Yga5WPs2bkLBUaXgJ/t4gikxmTGcjfhGfet0GEbY/np0UtUMRvauXp4j5ZFJqL63QI+wGD6x69rDuuPJrYv613DEe3VyZz4TSOUz874DJ2DumaJJSLxPwd4YtVUmw0XSdGuTFOx3CvjI7B4Zo7qJHNaHBvrouLz8N59G2UMFzDzup4FMIvXomblqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(36756003)(4326008)(38100700002)(6486002)(41300700001)(66476007)(66556008)(86362001)(83380400001)(2616005)(186003)(53546011)(478600001)(2906002)(6666004)(4001150100001)(316002)(7416002)(6916009)(6512007)(5660300002)(66946007)(6506007)(8676002)(54906003)(26005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wUcV9rK1g3gZRHfhhSH6sJxlfPsxf+bxy8OUC8JOQHoFuvGQc3OxRaofOfB6?=
 =?us-ascii?Q?678ifFIDeMvyasQm5jshgadm77A0FqdBKmlzH8EyARJEFUEgizwzaT6MuhzT?=
 =?us-ascii?Q?U/aG98ebSXfX5yfPZ19II8KJHO95LWdUkHQaCjeAMJBDAoMX+bPKWr///yxM?=
 =?us-ascii?Q?9mY+h0B9DyRkxsHI0iBLSLqo3+N4A3tIU/nvOtYyt2E4t/5h/Fi8sogbirlC?=
 =?us-ascii?Q?VZWt7NU/3Bj0lGZK7h3risnMRti24aGAeyu8aBIJ70bJ7h6DwpQZnWZKlsNQ?=
 =?us-ascii?Q?w8SjBOzths9dAyoutem1mw/p2st7KzvpFxkJ9NiOcLbzB8J9f5I23CiujysK?=
 =?us-ascii?Q?vgbkTFULTk4+9M8qYg75Aj2F2tVwj6X+ztfPgCkW3z2SWP0HSHxngdJEwaOc?=
 =?us-ascii?Q?mu/6czAgl+GAxZAmXWGPW93+pyqhS9hNPJpdcrSdRAdchuFnToOIvOzVmFuU?=
 =?us-ascii?Q?jaH/bmDymzF/t9iLqhiGbnDZb05+rAC0VZB5oSlDtcJej0YsorNuvTtxfuwT?=
 =?us-ascii?Q?oGSDuc1eQImoj2yj+xEqKfZexnCfClo4Szq0iOwvS2aSAnda3TDNeicsC2Ah?=
 =?us-ascii?Q?kSNnDVdRTYGaWNQ8bwFFBwSY5F6T39IDqMbH9Yb1/7HGlKw/tiBol/pYduZO?=
 =?us-ascii?Q?UuabO1LXON0RAvC5CJu+0UQEu2UUailhhm9FodfBttHnFrKZob/kd/OxNexy?=
 =?us-ascii?Q?Z32ZWcKEGstepjv5Z3WB7Qz8Ol2vow2vuVlbLbfmndlSxwlzt8jnxGooyUib?=
 =?us-ascii?Q?1OqQEvNZwSQnp1mRAOb0WV0nKcWbGtYEfoijF2OdgD7MsU12L4sTsJxoNitR?=
 =?us-ascii?Q?ztKBZ5/FeoscWi1O9ltmJBMeKoW/BGC8yheGHKh80B6KfAq8ed6Ue4SJiHxk?=
 =?us-ascii?Q?pGX3P5nWcstR6E2CZLbLeT53k2l/2K7jqWfazt8Vu/haP0jp7zkp5ukEOsBX?=
 =?us-ascii?Q?6UdAZbludzzI//P+LMkBgHIZyNHXFEPkcJK+nlgeWfjy1/b4I6ISZPe0mUz/?=
 =?us-ascii?Q?pW+mYb0ckZ3kdzyrmM3MwyhBixi/rBanISJn/l2AdMfbmrkva2Hff/CmIp7d?=
 =?us-ascii?Q?XaA3kfK7/CHm7Ta/qSTYTcxLhgu7XNZALnsE7kymGjwsxIufkDdhDWSaptoh?=
 =?us-ascii?Q?iGFdciHC86Oi+4dr4XZe9NkOEZSpN4hFJzxzvmML8aJc1TZfxvZFC/iOYBKw?=
 =?us-ascii?Q?RHju7wnRlNOsKZtB/d9N3wKaBPQ3U6zeIvdI7z2sLWQvE+0FWc+YP9zWFoFZ?=
 =?us-ascii?Q?GgJHiJpb21+Bm/k1tnXMOHqCbvMRkc9gNFAxfE4S77OH4ypFslI66q405n3X?=
 =?us-ascii?Q?pGGvD3si+PIaHO0iIWpqTa7M5yjZ77O/GRlbzmKrITojoAXw9yo7DadfuFIO?=
 =?us-ascii?Q?5bPLqYg5dmSw4ncPTdM3qbeBw5kgwki2d9BAYLgVYhUKP1J6aosdUBTJhEFL?=
 =?us-ascii?Q?lc7Cap+EpjClIsLTaVsqLdnvwv0Io4Q0nMVPefwHvvpfJu6Lvghj/RB1e/vw?=
 =?us-ascii?Q?aq+r3Dn5VW4nZXnG3s4BNhm18AhN6vMWfzyYfHXCaNiFKP5XzE/diXmG8GRg?=
 =?us-ascii?Q?7WlgtbJY9gfLQzq5mwjnN3T5y0WMBh5i0zdjw7HY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b578c5-d880-4886-e376-08dab561c841
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 01:48:00.4750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: My0vc+obwHjeNT9U9oDqMXKpwZLN9BmMS6OnQHxJRaWFdmRTN8q0Uc7LgkVHUgeiO/aSnPEbl0yoFNJ4MFy30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6057
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
Cc: nvdimm@lists.linux.dev, Jan Kara <jack@suse.cz>,
 Jason Gunthorpe <jgg@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, "Darrick J.
 Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Felix Kuehling <felix.kuehling@amd.com> writes:

> On 2022-10-20 19:17, Dan Williams wrote:
>> Felix Kuehling wrote:
>>> Am 2022-10-20 um 17:56 schrieb Dan Williams:
>>>>
>>>> For now this only converts the callers to lookup the pgmap and generate
>>>> the pgmap offset, but it does not do the deeper cleanup of teaching
>>>> those call sites to generate those arguments without walking the page
>>>> metadata. For next steps it appears the DEVICE_PRIVATE implementations
>>>> could plumb the pgmap into the necessary callsites and switch to using
>>>> gen_pool_alloc() to track which offsets of a pgmap are allocated.

That's an interesting idea. I might take a look at converting hmm-tests
to do this (and probably by extension Nouveau as the allocator is
basically the same).

Feel free to also add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

For the memremap/nouveau/hmm-test parts.

>>> Wouldn't that duplicate whatever device memory allocator we already have
>>> in our driver? Couldn't I just take the memory allocation from our TTM
>>> allocator and make necessary pgmap_request_folio calls to allocate the
>>> corresponding pages from the pgmap?
>> I think you could, as long as the output from that allocator is a
>> pgmap_offset rather than a pfn.
>>
>>> Or does the pgmap allocation need a finer granularity than the device
>>> memory allocation?
>> I would say the pgmap *allocation* happens at memremap_pages() time.
>> pgmap_request_folio() is a request to put a pgmap page into service.
>>
>> So, yes, I think you can bring your own allocator for what offsets are
>> in/out of service in pgmap space.
>
> Thank you for the explanation. The patch is
>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
