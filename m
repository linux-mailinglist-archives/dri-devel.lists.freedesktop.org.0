Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01A310630
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65316F400;
	Fri,  5 Feb 2021 08:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093ED6F3F9;
 Fri,  5 Feb 2021 08:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccsR30c9mh806hq8iyhQmzLpFd52rqzlis6Ca9CX3qI8D5YGejerO8k3MZsNm/QIGq+kjWWHwnLsKZY/RH0b+cAn+jW24QZ7clPM0QAq28h3OD9BzAgkyy/0feOmrg8FzT3qmpRUZr6jNQBjyuDtKjz1BvwYRFOT35EUPK7s41nEsTWP+1oC/XrcwDb4NdJHdLdERn3M3cEe89kzMcHb65z0aYGSGQS9xhYTmKC358j8UNNDpulZSp+Gu2Vq247wsEkPT1TgVzBFdVY2cXxwmw6r8tSOiFN27LnfvsJEPm5ay52VJjUcm1OeIC5AAL8ZYu/BucX9P+eR7/G5he5EIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoJ/xwtY1C7gUbACDNAwK09L3m6Tafnh79HAKAyDpk4=;
 b=gj2LBeF6r26wipSOtFogSn5QU03RyEW95TWEYc9e4+WhB0sJHg0qr1DNZF98a9yCWNcyLa9pGc3AO3zRpxVecqm9/sA/+DbPyOk+dWPB9MO47bQRT3jEFoqEuLYRSaqebnaSe1K+XBqltSpD3Z5MBYZiLJ8ISv3nVe5EU/BFtPyBcCw0kBL18MV30tq8CH2H8BUqucEyqMJDEDTVz8a0jUDcLq7jF9ZvW6KecJTP573oB8cBy2txYmwwO3EmSmyLNsuHYFZwgDB8r0c+R6TwlblC642IGpi4NGE4FjQqKvDP/5TqtEVRzmy/7Uef5zbYL2/qRKAl27GmjQI/bvrNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoJ/xwtY1C7gUbACDNAwK09L3m6Tafnh79HAKAyDpk4=;
 b=IKdjN6P2IX4mYC5rqZECs+PGckLiBaLkVrN/ew1610aQt2jKux1A0WF/zD11X1e4EecTgT2Uv/V+tNl3NQO2h8TkERTTQnD2TwsmQTiy6uRVg2w4b9Jf6afeDWvM/u9MCgROu4kn9tg+NnCL6+TtWH5Arcemween+8H6AoQC5UY=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 08:05:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 08:05:42 +0000
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8e1de27f-9200-8748-730e-4bd7b94444b3@amd.com>
Date: Fri, 5 Feb 2021 09:05:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210204183808.GY4718@ziepe.ca>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0171.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Fri, 5 Feb 2021 08:05:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 674b2bbf-eb18-451b-44e5-08d8c9acd558
X-MS-TrafficTypeDiagnostic: MN2PR12MB4343:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4343C9CC268A548D920D843983B29@MN2PR12MB4343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQ3wn6xDeOuwF7aSqdlAZbOZ/suqZ8EyzRujaFTWmAb8PzyLJrk1p+1peJfU+BZ8gNUWe0NhaEg1trajLJeczSXon4twESE8Y5AGhgMZpWd2HzjX0Jtjep5ANqsgPT9pPC2Kxf1UPsETyljyHpmC8PW4qhZv2wv6nLUVsT5od5MUwylTxWsbN6HhSAq68Aol2gjrmvNq5gGX7tFZ/l76d+CfX1CR95A/0EBkLQkzOtsx2m2l12fjKvLU7S7HLNyY4AQzJslkZwSbuSPWh/z0BRv8FEbqYwEvuazHA59i1GPL4HIwN5yPnmSY90Li7WJY7ZTmhNFhURcl9X0yqcyPevnTZ7A9PCxLL8bwywUoaMXQhQszoTdK+2qAAelbMSMWXHwR8LDNvtT9132cw1SHca8ichf9ns4zrNzHyL2KIrMG4fL0U/XLfv3qkpn5BgIDDIsr1xhWoU4IaQoUJ8twr0ocAzYUKRvnajrVKC5wvnZmZbATYCR44wrNon0Ewqnv9zqyPmWxIQE+ecz7SvaraRqfPPXaZ+JO2ymnChczaYsQdXHtBacYcE93Y0X17875c6W06DALGpXi4XTYWO3RqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(186003)(6666004)(2906002)(86362001)(16526019)(6486002)(7416002)(2616005)(31696002)(31686004)(83380400001)(8676002)(53546011)(8936002)(36756003)(478600001)(66556008)(316002)(5660300002)(54906003)(110136005)(52116002)(66946007)(66476007)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjNUWksvTDdTVnhPY3RqM3p5dXdubEFKQklGMUZDU2JlcFdELzI0REx5OEVa?=
 =?utf-8?B?Z2krNENUYmcyeUc1WHptOGJiYkVIWVJZSkFJNGFQdUpOSVlUb01pbGdGY2ZP?=
 =?utf-8?B?TkJsOU1ubjhyQUsveG5ORng4NXh6MGJmLzAyL0JFUlpkYzNwR2EzRktxanRq?=
 =?utf-8?B?S1FEZEdGckNwTkF6SVdXT2ZpZlNoTmEzSmdkTldYTTRLSGo4YVdjNWk1Y1gy?=
 =?utf-8?B?QzhqczViZ2oveTlpV05McDJSbUdlTnkrZHpkYUNIcG5TS2htbjJsU2JUWmpy?=
 =?utf-8?B?SlhCVFRFWVY3T2NvM2pheUE5YlEzY29CS1hra1BtTHBPQlZsR3k0cUgyTTIv?=
 =?utf-8?B?N25PUTZZenZFWkRmc3hYSUVULzhoN2FIdFFrS29odkdqeEZFd3kvcDZTbWsw?=
 =?utf-8?B?NVcrNjdNYmFidTNpWENpY0dZRDd2MWRyUzFkWllkK3JRMGFBVzhYUnB6ZitB?=
 =?utf-8?B?blFqN3lHVUVqT0RxZVFxd0pLb3l5ckZSZlZ4T0pEeVBuTkgyaU5uZlA0L0pK?=
 =?utf-8?B?QVp3WFNuaWF4WUowNkQ0K2ZtTUIyejhCeGxrVGwrREFtTDlKUnBUYXdUZ0xq?=
 =?utf-8?B?RlR1MlBzTTVYcDNCanN1eEFKR1NRR0JVRXpGYTJsUytQZDlZYTNiWEpOT3ZC?=
 =?utf-8?B?Sy9YMlloMmJ3Y1RVMzdnQ1dQeHRiOGQ5cmhKRWZvSi9CZFFvaEV0UkZuZkJr?=
 =?utf-8?B?U2tmTzlrT3VvUlQvL3c1a0Y5enhuTXF0czYxUDFCTVlGZjJrc25VK1RCQXl6?=
 =?utf-8?B?Mms0azRHM2hGV0luQk43cURHdnhBUXlaakpSM01QL1AzSXczb3NtNGdYSURI?=
 =?utf-8?B?dDIrYnVzRXdiWkJNWDhWK1UwSjZvMXVmZS9NRXBBaEFhckg5eTZBRWVmdVJi?=
 =?utf-8?B?cmMvMTVmdDdSQVc4M0l3cW9QaXhDeGVXZ3dpRWxGbkEzK3JmWnBqeTZ3eEl5?=
 =?utf-8?B?UmFRVDMxRUhSSWJvWTlibHhyTjlkQ0EyUWNyUUcyVDV0ZWFVSnJ2S2V3QmEz?=
 =?utf-8?B?ckhQajNiNkVBUlVYakhRNHVCeWFGRFFiU3doY1dtb3VFZlJCNWZMRmpoeHdS?=
 =?utf-8?B?Y3VxTC9kenk1b2xlSERjZkErVGdLSHFZUmZKV256cWNWcWZPWlFrak5OdlFv?=
 =?utf-8?B?NllrVFB6UVU3ZHJzT1lvZG9kRFVhb2hYYjg2bElXanRtMHFObWJBam1iL016?=
 =?utf-8?B?cktYOURSVGRYTGtzcU1HV0JsdVowRXMyc1I2TTNhK3pDVzY0L1NqSktWZURV?=
 =?utf-8?B?MGRySmluUjFLb3pnUko0aHNPYmlsOW01czdaNzRmcXdzSE8zeWd5VjIxaVRH?=
 =?utf-8?B?UlhVdjVJUkw1cVlWRG92WlFGemlGN0xXQzZ4b0R4Y3ZleVFJMkhnbnN1UEJz?=
 =?utf-8?B?OWMvV1pXN0cyK2h6VlRDZm9EUUprRHh6dkdWZExrOWxCVlF0UVlMYXdhSkpp?=
 =?utf-8?B?cHN1RUhINk1SS0kyTDd0bVlVK1NBZlFrZUxERG93OFVSZ2swQ25xbkJCdFRU?=
 =?utf-8?B?SUJGRVlNWjE2dEV2Z0FYejR6dzNnOFVKQ2hhMml6a0ZSeHNsNWNRb1JCRDNZ?=
 =?utf-8?B?OHN2SUpOUGxiMlhrZHY2dklacFI5REs1QUFEUXgyTm9vcGRkeWVMRkJiVkU5?=
 =?utf-8?B?ci95UjByUVZ0MkFTbldma3ordTM1eklYTHRyMjc2VjNNNDJvNkdEc0ZkYXBH?=
 =?utf-8?B?dWNHTHplWEdQVTY2UnM2VEtXMG8rREh4UW5wRWgwSXg0STBFVWlRUWx0Y09P?=
 =?utf-8?B?MjdhWi9kUUduK212SHE3c0h4VDRyTGtTTGdzRXNJR0dBdTRwMzVIODJOVmlq?=
 =?utf-8?B?M3lOc0p1UEFjV0JJUHpzZ1YxZ2RlUk44QWd2ZWxYREh5UlBkczRzWXA0d1Nw?=
 =?utf-8?Q?WRW44iI6PkeF9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674b2bbf-eb18-451b-44e5-08d8c9acd558
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:05:42.8732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbdRAz0bszEhKM6J5A8SwXAT3ZKejnozVxX8mn3G8AB1OSqRVrPShYh2McvwImBg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.02.21 um 19:38 schrieb Jason Gunthorpe:
> On Thu, Feb 04, 2021 at 06:16:27PM +0100, Daniel Vetter wrote:
>> On Thu, Feb 4, 2021 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>> On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
>>>> tldr; DMA buffers aren't normal memory, expecting that you can use
>>>> them like that (like calling get_user_pages works, or that they're
>>>> accounting like any other normal memory) cannot be guaranteed.
>>>>
>>>> Since some userspace only runs on integrated devices, where all
>>>> buffers are actually all resident system memory, there's a huge
>>>> temptation to assume that a struct page is always present and useable
>>>> like for any more pagecache backed mmap. This has the potential to
>>>> result in a uapi nightmare.
>>>>
>>>> To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
>>>> blocks get_user_pages and all the other struct page based
>>>> infrastructure for everyone. In spirit this is the uapi counterpart to
>>>> the kernel-internal CONFIG_DMABUF_DEBUG.
>>> Fast gup needs the special flag set on the PTE as well.. Feels weird
>>> to have a special VMA without also having special PTEs?
>> There's kinda no convenient & cheap way to check for the pte_special
>> flag. This here should at least catch accidental misuse, people
>> building their own ptes we can't stop. Maybe we should exclude
>> VM_MIXEDMAP to catch vm_insert_page in one of these.
>>
>> Hm looking at code I think we need to require VM_PFNMAP here to stop
>> vm_insert_page. And looking at the various functions, that seems to be
>> required (and I guess VM_IO is more for really funky architectures
>> where io-space is somewhere else?). I guess I should check for
>> VM_PFNMAP instead of VM_SPECIAL?
> Well, you said the goal was to block GUP usage, that won't happen
> without the PTE special flag, at least on x86

When is that special flag being set?

> So, really, what you are saying is all dmabuf users should always use
> vmf_insert_pfn_prot() or something similar - and never insert_page/etc?

Exactly, yes.

Christian.

> It might make sense to check the vma flags in all the insert paths, eg
> vm_insert_page() can't work with VMAs that should not have struct
> pages in them (eg VM_SPECIAl, VM_PFNMAP, !VM_MIXEMAP if I understand
> it right)
>
> At least as some VM debug option
>
> Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
