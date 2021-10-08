Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1E426A98
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 14:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F976E0DC;
	Fri,  8 Oct 2021 12:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2046E0DC;
 Fri,  8 Oct 2021 12:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbXvFAWYMcbfV57OTq3B1ohZUfhWc752erIPg0tlWpn1fXROVgD6EVILl8FBrvmPI4I7yVE7lhjc0yEbg4MPFKK/TGULsD/bSqT6NxjZrKWfXaeb0cccu8z3v/86HNvWX3kaW9SWVsZ841b2thUN0gBrsAf0IfUETNSreyeXnF/6DI3op1M42rDPsZl8uk614BExkcwwst6N/eRf9kLZltzttlNMJ8SY69JASYbVWAoW/6pN1TS93N3SF4RSEcOFIMJq2+uuq8Jxom7fGNEJ4rKAnQ7Ml3+t3f23vi8pApS9RkUIFggC9wdVLdHVafKlRvifrOexgpZzvnSMoLv93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX5MuWXnnzyayzwyW609MgbvzV6ytEW4o8xUcuZHuDA=;
 b=jf58PjQrQv+0La5pCdVnZGtKJRMG7l+AsDru7sItb4Rfa4a3X8mvMNlO/532s/dx7ygrMjsMlOquW715s//dezQ+B+88dDU1ygDUh7DcFvi8dn+3oymOckuG0ikhWQKLi5NsaB7TQtBDDWg89k9+wbBdWSDZfH55wes7oM40fASmCvQqF53Daj/ylv6Rs88zSCWMNjc0/ZDs2EUB5K0De0TxzYToDWL6bDLI7q9P7ZJ5KQAwhi3XNst3Ab1d5p86eRHx6CNRu6WXnCjTHE6mTE6MXZhBaTsL/LfoIzw/25aRh8JT9al11BBK26kcOU/ORBQVz6ZKnrC8rmeuHVbSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX5MuWXnnzyayzwyW609MgbvzV6ytEW4o8xUcuZHuDA=;
 b=obmeV30cnw5eoicc79RXPO5AT1DBEbQF69Y6qcns/6j1dQqwc1SOzAlL9U379v6uEjU7Nmc77lOb4bWogsa3hhPtjZbWfQ4+IWMEdNTKIyKgD3CPJICrm8gZPZyDrZOmrgAggBFjNXQYWh3DlQE2WIJtA1QBuTdGu75qHKGW5VQ=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1279.namprd12.prod.outlook.com
 (2603:10b6:300:d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 12:20:05 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 12:20:04 +0000
Subject: Re: [PATCH] dma-resv: Fix dma_resv_get_fences and
 dma_resv_copy_fences after conversion
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
 <9eca89ab-f954-8b2a-7af5-b4a63b90eed0@amd.com>
 <67f413c4-b654-c7ea-bc4f-6b42418c7486@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <85489b72-6001-98d8-d66a-395e05cd3d01@amd.com>
Date: Fri, 8 Oct 2021 14:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <67f413c4-b654-c7ea-bc4f-6b42418c7486@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0095.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::36) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AM6P192CA0095.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 8 Oct 2021 12:20:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e602628a-0893-412d-c1f0-08d98a55f572
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12793FFC9F55AF399C9CDBE883B29@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJmnkm+i+bkhcMiJ3tWJshWyn0QRxkutfYGTauE1kk4pKTB+QRu3t3l+vyFPYyW8We/sHEZFuZlQvt+ZzMupuIe2utMhCtuertKVBDYdIaksH1a/W8FiXd705GI+oOmclAZePjfg0rbKXEAwGjPoKhDXLRKK+Yc7eOldpP0r8t9jvaHtULalk/H4GUWV7UALJ5ST2lV7I0jERnH2PGkRCrAx60kGp+9RPK/PIXMswuoRX3A1rKgL2U4ipNcMbrwxRLwUzVYNylMhETNeTkmXjd610Dxd9inzQWNxsobRWLh9FUnOTfKrfLw1uMunyW9mVg394aOrq4/OdXyXgszyka9eoKC6LJGHVwpawxd4B9i0CvJuHmvjnYBuCmysxvWlwoqBWhJbs/ghRu4d8VebvFJ6t0LyOYv3WmSaKJNzkXSvM8Tnxu7Ov4ze/awKzARihZal5zD2i/VpXn6y9rhGUyoHuyl3FR+Ii+BlPtCxj1OrwhawgM/iyNP3OjrDQ492REJth68/DgrwZcVjIdzgymRDa9Jq4CAz93g5ZYwPuAGtCevyWogPW0E9hoj+1Yi1oC5Vmqv9yvsLgGiUYusPYLLrpWbJjmcvbeVolUL5C72DgpPtjU2hDBqb5Oa8TLMMKRJaeVb51e1jCATU+UgYs8SAKQnnD/Jq3HwgmvOtHqcaGwDjm7rvn1JQjfpg2DetlKTJ3tBdn7luMR3ZYHy8rS2U8dsHIj9rDAS6Jti5tFGL1K6wtBLP8go/vk09ibG8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(316002)(54906003)(6666004)(66476007)(31686004)(66574015)(186003)(66946007)(36756003)(66556008)(53546011)(8676002)(6486002)(45080400002)(86362001)(966005)(5660300002)(2616005)(508600001)(38100700002)(4326008)(31696002)(2906002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVBSUisxOU9xN1cxdTU2ZGFFeU1mQWNoaVdhSHhuYmdHSVAvWVMrUThFSWNs?=
 =?utf-8?B?UENveCtKRjlvMmhwazJoTkYydXFXUmpQOTlZWjJWVjVmUG9seGJFSUdQSjhp?=
 =?utf-8?B?dU41OEVOVlF1UHVNVThEaEcyQUNEaEdTRWV0clFoQlhCOGJUVWVPZ1p2dVM0?=
 =?utf-8?B?M1hMTVJIU2k5QTFUbnNIYWF1UzFNZUt5QVp4eWRBQytvV0xKeko2TlhET3JV?=
 =?utf-8?B?bTdCLzJWNW5ZTmhlRzVyRVBiVjFKVDBwMy9tT0VyL21Qd1d4UVZvMnJzSGM0?=
 =?utf-8?B?Y0ZFVTl5N01BWGY0OTRpNUtHTjBvWEt1NWg2VksybFJsYVo0STE4L0FOU1B6?=
 =?utf-8?B?Z2swbkNMejlFd2JjYWRmWVNGT1ROVVlxa0ZWTDBFR21IaUNOWWxIQXh2S01B?=
 =?utf-8?B?WUg2VWdlWG9CZCtBQWN6UVpHcHFPWGhRanZQb1FqamVkTmhLUWVJdU9wbGl6?=
 =?utf-8?B?ZzhhcEd4OU90Q2VITTZxQUNQZkYzdXM4amN3TVRqVFQrMXVLNlZXcXE4UW13?=
 =?utf-8?B?aTNlRkZhOVNPcW9vUVRuYUpKeEVaWlhBZU03QVFhd1crT1A2ZURWTytRYzYx?=
 =?utf-8?B?ZXo5WVR6NGN2YUliWnlVYitUQlZQV2VKQzNDMDNTOUVzR3dJZkMvQ3FlU1Bn?=
 =?utf-8?B?ekFrb0dHd3g3TmpkN0ZJc0NIR2JXVHJIYUhYWEREMDhxdHZwSktkV0JHQURN?=
 =?utf-8?B?SUNVekYzV2ZFb0plR0NCaXo4R1E1R3RORlVtelhSdVB1QmdSL1kwZnlGbXFT?=
 =?utf-8?B?bTF2bzRKYlNtQ1RKS3lRTUNVc1RjbFdiODZudklVNXhBNGM2S1plR3hOb2Ew?=
 =?utf-8?B?N3JmR0hlV296REtyT0cyNFRvQlBtRjlaQXljVmtUcnRhRkpDMUhyOFdGYXJi?=
 =?utf-8?B?dGVZcmtOSmZRVmZWRkw1UjUvVUNFRi9Qcy8vWTlTV0hMOXNzd2F3UzU4L0pK?=
 =?utf-8?B?NG0xcWF0Q0JkcktuTW45eDZDWHN6ZXp6QUl1RjYyWFpVTmxoYVdRTVVodlc5?=
 =?utf-8?B?VEx6cERMT1A0T01CalY3RVZWQ09IUE4yTXVHZ3hBU1R5NVlSSFZzWFR3L05K?=
 =?utf-8?B?WndVa0ZEQmpMNlowNmhqUVc1M1RNRjJyeVExbjJDckVCaUtKTGFQSWZBajJz?=
 =?utf-8?B?elBOcnNXMGRuNmhyeEc0MDRYUHczRTEzaUs5S1U2MjUrcThSaVc5bkFJUHNZ?=
 =?utf-8?B?L3dFSlZxZWYwMGdJSGViR1BpWVNqVzF2V3ZCdU50QVM4RUliaVJENi93K1RK?=
 =?utf-8?B?d1N4Uk9pQk5aQkdpREVTaXBqVE94WHhORlg5cWhnS09WQkhBdFRBNzlJMHJv?=
 =?utf-8?B?bjQwZ3hjZURqR3ZDdmc4SjhNYTV0ck9aZ0xuaXhHWTI3d3pxY25hWXFRRkd3?=
 =?utf-8?B?b2lLa1kyZE93ZzBNc2ZRZE13K0pYZlhQTmNhbXcvVlBqRVhaeWZVdDg1S3FJ?=
 =?utf-8?B?VjVJejY0K2Y5NlVJQ1JidzhVWWlQQXBnMXJyT0JhUnVoN0xUd24xUVVBckMz?=
 =?utf-8?B?bzRibmZqY2NoM21seWNUNkxCYjV3WDhxZU5hVW1xNUV3NEhHd2E4S2ZnNFZB?=
 =?utf-8?B?S09wbkRCbU1QbzduWTVUNzAwWU9MKytUKzU1aUVIUFRScjZ5K08vVmxScjZI?=
 =?utf-8?B?SEhxSTBHN1JLQWVIY3ZTbkgyL3lhOXZKRGVMZTdOc3FNazA5UUp1cTN3RmdW?=
 =?utf-8?B?QTJQbHFaTk92cW9lbG9pTXRGS2E1dnphdkd5L3ovdGN0MngvWDB6MFR3aUlo?=
 =?utf-8?B?c3EveFRxQXYrZDFIOEo4cFBUTXpEUTRSNGFzUllBV3J1THpZR1ZoaWlYbnlZ?=
 =?utf-8?B?eXZmait1UDRFblpBMHJON01ZeEJmVEY3akczUGtsa05QdXR0NjVKY05pa2wv?=
 =?utf-8?Q?yAvioFPIj1oKh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e602628a-0893-412d-c1f0-08d98a55f572
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 12:20:04.7446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYO0kUpQbcjZEk0YH31a0uyl/2FKT2iYJ7ZclMiaaBHkhS3tIfQYONDleViKdpky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
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

Am 08.10.21 um 12:49 schrieb Tvrtko Ursulin:
>
> On 08/10/2021 11:21, Christian König wrote:
>> Am 08.10.21 um 11:50 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Cache the count of shared fences in the iterator to avoid dereferencing
>>> the dma_resv_object outside the RCU protection. Otherwise iterator 
>>> and its
>>> users can observe an incosistent state which makes it impossible to use
>>> safely.
>>
>> Ah, of course! I've been staring at the code the whole morning and 
>> couldn't see it.
>>
>> Going to write a testcase to cover that.
>>
>>> Such as:
>>>
>>> <6> [187.517041] [IGT] gem_sync: executing
>>> <7> [187.536343] i915 0000:00:02.0: 
>>> [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
>>> <7> [187.536793] i915 0000:00:02.0: 
>>> [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
>>> <6> [187.551235] [IGT] gem_sync: starting subtest basic-many-each
>>> <1> [188.935462] BUG: kernel NULL pointer dereference, address: 
>>> 0000000000000010
>>> <1> [188.935485] #PF: supervisor write access in kernel mode
>>> <1> [188.935495] #PF: error_code(0x0002) - not-present page
>>> <6> [188.935504] PGD 0 P4D 0
>>> <4> [188.935512] Oops: 0002 [#1] PREEMPT SMP NOPTI
>>> <4> [188.935521] CPU: 2 PID: 1467 Comm: gem_sync Not tainted 
>>> 5.15.0-rc4-CI-Patchwork_21264+ #1
>>> <4> [188.935535] Hardware name:  /NUC6CAYB, BIOS 
>>> AYAPLCEL.86A.0049.2018.0508.1356 05/08/2018
>>> <4> [188.935546] RIP: 0010:dma_resv_get_fences+0x116/0x2d0
>>> <4> [188.935560] Code: 10 85 c0 7f c9 be 03 00 00 00 e8 15 8b df ff 
>>> eb bd e8 8e c6 ff ff eb b6 41 8b 04 24 49 8b 55 00 48 89 e7 8d 48 01 
>>> 41 89 0c 24 <4c> 89 34 c2 e8 41 f2 ff ff 49 89 c6 48 85 c0 75 8c 48 
>>> 8b 44 24 10
>>> <4> [188.935583] RSP: 0018:ffffc900011dbcc8 EFLAGS: 00010202
>>> <4> [188.935593] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 
>>> 0000000000000001
>>> <4> [188.935603] RDX: 0000000000000010 RSI: ffffffff822e343c RDI: 
>>> ffffc900011dbcc8
>>> <4> [188.935613] RBP: ffffc900011dbd48 R08: ffff88812d255bb8 R09: 
>>> 00000000fffffffe
>>> <4> [188.935623] R10: 0000000000000001 R11: 0000000000000000 R12: 
>>> ffffc900011dbd44
>>> <4> [188.935633] R13: ffffc900011dbd50 R14: ffff888113d29cc0 R15: 
>>> 0000000000000000
>>> <4> [188.935643] FS:  00007f68d17e9700(0000) 
>>> GS:ffff888277900000(0000) knlGS:0000000000000000
>>> <4> [188.935655] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> <4> [188.935665] CR2: 0000000000000010 CR3: 000000012d0a4000 CR4: 
>>> 00000000003506e0
>>> <4> [188.935676] Call Trace:
>>> <4> [188.935685]  i915_gem_object_wait+0x1ff/0x410 [i915]
>>> <4> [188.935988]  i915_gem_wait_ioctl+0xf2/0x2a0 [i915]
>>> <4> [188.936272]  ? i915_gem_object_wait+0x410/0x410 [i915]
>>> <4> [188.936533]  drm_ioctl_kernel+0xae/0x140
>>> <4> [188.936546]  drm_ioctl+0x201/0x3d0
>>> <4> [188.936555]  ? i915_gem_object_wait+0x410/0x410 [i915]
>>> <4> [188.936820]  ? __fget_files+0xc2/0x1c0
>>> <4> [188.936830]  ? __fget_files+0xda/0x1c0
>>> <4> [188.936839]  __x64_sys_ioctl+0x6d/0xa0
>>> <4> [188.936848]  do_syscall_64+0x3a/0xb0
>>> <4> [188.936859] entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>
>>> If the shared object has changed during the RCU unlocked period
>>> callers will correctly handle the restart on the next iteration.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Fixes: 96601e8a4755 ("dma-buf: use new iterator in 
>>> dma_resv_copy_fences")
>>> Fixes: d3c80698c9f5 ("dma-buf: use new iterator in 
>>> dma_resv_get_fences v3")
>>> Closes: 
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F4274&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc22feea06a3f4285cdac08d98a495984%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637692870805160909%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6oPR30sWnJe04I4GlhhvJWX3QvwKFIOMW1uOIyWZFOE%3D&amp;reserved=0 
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>
>> Maybe we should remove cursor->fences altogether, but either way the 
>> patch is Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Please push to drm-misc-next ASAP.
>
> Not sure I can or if my push permissions are limited to Intel 
> branches. I can try once CI gives a green light.

If it doesn't work just ping me and I will push it.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>   drivers/dma-buf/dma-resv.c | 18 ++++++++++--------
>>>   include/linux/dma-resv.h   |  5 ++++-
>>>   2 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>> index a480af9581bd..7b6d881c8904 100644
>>> --- a/drivers/dma-buf/dma-resv.c
>>> +++ b/drivers/dma-buf/dma-resv.c
>>> @@ -333,10 +333,14 @@ static void 
>>> dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>>>   {
>>>       cursor->seq = read_seqcount_begin(&cursor->obj->seq);
>>>       cursor->index = -1;
>>> -    if (cursor->all_fences)
>>> +    cursor->shared_count = 0;
>>> +    if (cursor->all_fences) {
>>>           cursor->fences = dma_resv_shared_list(cursor->obj);
>>> -    else
>>> +        if (cursor->fences)
>>> +            cursor->shared_count = cursor->fences->shared_count;
>>> +    } else {
>>>           cursor->fences = NULL;
>>> +    }
>>>       cursor->is_restarted = true;
>>>   }
>>> @@ -363,7 +367,7 @@ static void dma_resv_iter_walk_unlocked(struct 
>>> dma_resv_iter *cursor)
>>>                   continue;
>>>           } else if (!cursor->fences ||
>>> -               cursor->index >= cursor->fences->shared_count) {
>>> +               cursor->index >= cursor->shared_count) {
>>>               cursor->fence = NULL;
>>>               break;
>>> @@ -448,10 +452,8 @@ int dma_resv_copy_fences(struct dma_resv *dst, 
>>> struct dma_resv *src)
>>>               dma_resv_list_free(list);
>>>               dma_fence_put(excl);
>>> -            if (cursor.fences) {
>>> -                unsigned int cnt = cursor.fences->shared_count;
>>> -
>>> -                list = dma_resv_list_alloc(cnt);
>>> +            if (cursor.shared_count) {
>>> +                list = dma_resv_list_alloc(cursor.shared_count);
>>>                   if (!list) {
>>>                       dma_resv_iter_end(&cursor);
>>>                       return -ENOMEM;
>>> @@ -522,7 +524,7 @@ int dma_resv_get_fences(struct dma_resv *obj, 
>>> struct dma_fence **fence_excl,
>>>               if (fence_excl)
>>>                   dma_fence_put(*fence_excl);
>>> -            count = cursor.fences ? cursor.fences->shared_count : 0;
>>> +            count = cursor.shared_count;
>>>               count += fence_excl ? 0 : 1;
>>>               /* Eventually re-allocate the array */
>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>> index 8b6c20636a79..3e1bff147428 100644
>>> --- a/include/linux/dma-resv.h
>>> +++ b/include/linux/dma-resv.h
>>> @@ -170,9 +170,12 @@ struct dma_resv_iter {
>>>       /** @index: index into the shared fences */
>>>       unsigned int index;
>>> -    /** @fences: the shared fences */
>>> +    /** @fences: the shared fences; private, *MUST* not 
>>> dereference  */
>>>       struct dma_resv_list *fences;
>>> +    /** @shared_count: number of shared fences */
>>> +    unsigned int shared_count;
>>> +
>>>       /** @is_restarted: true if this is the first returned fence */
>>>       bool is_restarted;
>>>   };
>>

