Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE24BA2B1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8D10E8D7;
	Thu, 17 Feb 2022 14:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000DA10E37C;
 Thu, 17 Feb 2022 14:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc4jcjQFs1sakwGwpW3Ecw0pvCdBTL8AEwbNg4DGt1EzjmYZ0rIJYr8XhegdfyUea5FZB9NZBYuJ07tzNVFRIisbFqguH5H6X04gfM+9UxYUr7OsMQfCe3qmTHjFYZKFMuz/MOIqEnhRhny2JdAR5J+ytMIsTY7YciGnuMadYid8y66ryIJHSJ+I3b/RJ26ByKEI6jvoaDrHpy6JuHe54Hp6iWm9XhPv/HeZub8Rx7h05gRJLUbGcPmuC9XZxtIa+d18rnFBN0z/D2bBmizW41nEnxj62911J8RyOBGYRTjJ1xX/T9Cwq4jrRszbd8QoedFb5ZLlj/t87SXTt8OdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAHlx3D6uAN4+2G8WUeXLGrJCXNlHCZ1imJZdkEZgjA=;
 b=AZK6BvxfYZpIKz/UInorJCRCz+2e1BJtUbgvb8hY7cjK6dawAF/07tnQmYF58Q0Z+yUkWdwo95gZqocIywYhmm9GCGyIzB+JfTWBQ8b0H889gvmxXFX6FeorNQonjsNjxzkwfJXR+K2T7BeBQc/7Qr+821Ji1ykgvkZXuwEyY1kGVZu8zWidFKsK9XO4nmZC2ZnxZkcNPfequIDZZANWq0QXlPIGw3J5ftTptCB36m8Fy9XZJ14ywtAqN6Db1zNqrnXUXkdKOR0baIQz7VQGpjirDIG/RYfF4txQ2lJXLxRWzSuMNOvTm6bRwnDIxsk+FLG3ITOo6zWVJtVDH9+GqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAHlx3D6uAN4+2G8WUeXLGrJCXNlHCZ1imJZdkEZgjA=;
 b=qd2aSy0DqRcvq3wsefuD2uRA7gVTMcmErbtPXVlIdUWL6im84xoqZlTgHei6ehL6bZts4l+JiyVwp64YNK1nstSYXKmDVAz8HfyVBkp+2IJQokU/wBFFfz5pG3jqFiHAuvWb12TaJe0bLPYRzzbWgvAe4Chy9wCdxWO2ELFiNX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1702.namprd12.prod.outlook.com (2603:10b6:903:11f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 14:14:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.018; Thu, 17 Feb 2022
 14:14:53 +0000
Message-ID: <adb7334e-9f6d-05b5-0840-91efad0d6419@amd.com>
Date: Thu, 17 Feb 2022 15:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/ttm: fixup the mock_bo
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220216173703.1750589-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220216173703.1750589-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6636857-9086-4f3b-e31c-08d9f21fddc6
X-MS-TrafficTypeDiagnostic: CY4PR12MB1702:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB170251F2585DA5AC0B78CCD383369@CY4PR12MB1702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +57/HB4jNFCVpIAsnAAL9aDUdl7MaHJ5HQs6Zh+Gemc3GUJ97bsT1R45JOPceUSxoJjeuiZ0KaJkXw8y3sHoIfnNMXmcvKttTLMMVYGjGDc4tfRZj24Y+wHzK60/58qRFZBiZzCQQwrl7wmUDNOK00YtOy/h3/etyQw3qff0ilIgBMSwOEfjRUzuX22ppvwD7WdwsiKFi4CharZO+XK84bNiT9bdyYo0SHCURQ5iMIt0CuDxleyVL7k+uDbhiUNqdz5siB+3cwsOE3erzKWIlvgm5qL5/6DUwBpZd8QJKJwU6srkd8g1Ms7GYfGUS7IJs9bigT/c/MzOO2T/Bpd3DJx9O3UEbdb7PB6V5O3JUsZy4cqvF8WH4KvL/FnrrK15aSy1jiL5+AycVD/CTZfdW8Oq6iIqnG47E1iIzhyaqSNUUxgcWNNtMTl2djt98Hdgq5WyrO883TahQhGXUh/szq6AbDdGxAdjcVK2jcjq72ewdUOTMFvcnmndqdXUDczilIBYp0jnTg8iYLs+lUCIVy5rIXYpRWhLZVHx0h4Olrb8+duC2+JY1DBC6BHFL8uSAxWcbbKkJ3clrpXtHQe8CMoG3etbiQBV4VEAj5GmX+a1xTxeD3FneNBUyS9spEl8JpjkPMkfQxPWunOhUG4Iu56/5AJDswJ0Bi913ar+yYOgh3QTD5hNFjJqQIbx0THPePDwCh/OQ2dzakkligQnhdVt9kpMdxGzxZEy5+l86pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6506007)(2616005)(186003)(6486002)(966005)(508600001)(38100700002)(45080400002)(5660300002)(31696002)(4326008)(66574015)(31686004)(6512007)(316002)(86362001)(83380400001)(2906002)(36756003)(66946007)(8676002)(8936002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmlxejd1b2ZKY2poR2xQaVlRZ3p4TFM0MmVjenlUV3QxMXAwWS83SVExZWt1?=
 =?utf-8?B?TVZ0dExXYzcveFFpd3p3RnIxaGhmaWRhUE1DMks1NU4xTStXS08ybk16UmVI?=
 =?utf-8?B?ZkxYMWhnSzhOVThMaW5menJoSVpOY2dVRkxudFpXUlZOVWZjMFBGbW9HVzd6?=
 =?utf-8?B?eWU3SlB0azBOY3lvbDdPdEdnMDJMRTFnNEVQR0d3ZHNSa0xvV3NTU21FUmVx?=
 =?utf-8?B?NmdsR1FVSVBvQ3l1TUpQWU5aNXViMXBacmZBejBsNkprdU1KOTBJRHcwVG9X?=
 =?utf-8?B?MDRhWG5temUvWTh0MklhbkNlWS8vMjdZQnJjbmdWUDMrSE1XalNPajNMNGpr?=
 =?utf-8?B?clFIZFZuZVZiWVhWdWwrVHdsWVlvRDVRM0paVGk1OWtSbnBhWUtDdFU4dkJl?=
 =?utf-8?B?cFZMUXRGTFlycm1TWnArZUZGMmQ1eG43Z3hERVorZnhucG5xY1hZalQ0QmNN?=
 =?utf-8?B?d2Y3YmNXd0xaZFgyRG1WL2IwRTZFbEhvWk9LRDZTc2F1eGVXWDBhd093eEVS?=
 =?utf-8?B?eHdObVcrOVYvYVNrV0lWZ003ZWZwSk93emdTKzh2NnFMMUV1aFh0N3FUTmR2?=
 =?utf-8?B?UkFQZEJaT2U3UU54ZVFXbjhsQUwyZ0RsSGNTcWdzZ3l5RjUzWGQxVVVvTDRP?=
 =?utf-8?B?VW5hOHRPSEVlNzFseFVtSDVpa3lvcGI5WTJxZCtMY0NuaEpISzdrNTJNS0o3?=
 =?utf-8?B?N2hpYnpmMWhTWTdDK05GaHF3eVdKRGp4Z0lyQXA1bmlrS3oyaVZIM1NLL2Ni?=
 =?utf-8?B?eDR1MWdTZlpYRVZkVWNLbEVIV3AxNVRkVC9QY3dJU1NKNnN2cnNJaTlSSDJT?=
 =?utf-8?B?eUUwaWxyQ1B4eE11TUpIZU0wOWlZQUlyckM0WS9lYkpZYm14dlE4SzZ5WG9N?=
 =?utf-8?B?UTlQbEhoRTlJRjVNZVp5Mmlma0hqN2krUTJnbEhndEJVY3E4NEY0TzlPOHBX?=
 =?utf-8?B?dmpMKzN3VHlmdW5KYU1LQTQxcnNSOUpLaVNSVXJHdS8xc1hmYlFNZWJLQ3J1?=
 =?utf-8?B?ZTRkZzBDaVJ4TFQ0MUZ5MGM3UDZ0WHJySk5JOXR5cTRuQnVMWjFCT2srWlhB?=
 =?utf-8?B?QUd6cHM0djJuMDRCM2I0ZkFVL2xlcGZBTkJ5NS9LWVljb0dnTDgrcVcwTTNu?=
 =?utf-8?B?TE5LS1Y2WFBjbmh4QzN0byt5WlJDTXo0dG5mVHpveWU0L25QSlBCMzh2bllD?=
 =?utf-8?B?Y3VxYlpiOUdSZkxYOEtyRWtjY2hCSk0xSE1tV2V1bHM3VHh0R2JyRjgxeEhM?=
 =?utf-8?B?VExOd3hGWTgxaFJ1NDRxR2cvWEhCVkJQd0xmc2Q0eWFVRXFIeEdMdTRSRkJk?=
 =?utf-8?B?WnZSa3drbTNJU0E4WUFEMC9lUmdpV1Fxa1Y4R29DckVWTWI2M0tvNTNNejFV?=
 =?utf-8?B?WXFCV0lDck1Vd0pJcFc0dkJXaUhSSmxmaFVxVFVCL1h2TlplU0NXSFVLaXRD?=
 =?utf-8?B?VUtQci95VmRLQndRZTYvYlBKTmE3ZXRqUWpuN0hoZnRnTlFTN2JlcFJibUhH?=
 =?utf-8?B?Zm9aajNzSEVqZzNMcU94a3dHdnkxV2NnVEdFTktNejVueHpCUDBJS1JIME9Y?=
 =?utf-8?B?R2JFTTNuZHBsTVlET0h0RC9zdUhOeDlGa3pDb2s5ZEpNSklQT3lHMHk0QmZw?=
 =?utf-8?B?K0U3S1JQT1NuZStHeXI3Q1JLNm50TUVxcWhSR0dpKzYyaWtaeWp2V3JUNXJ0?=
 =?utf-8?B?T1pwSEtwQVRabTBJN0laeG5rRVFyRExqUGlia2E3NnhyOVZFMFU2allsL3J3?=
 =?utf-8?B?cVQrQVFNN1A3alBTcHFLSkVsV1RkMlprcE4xK3dYNUtudk13RTVZRXhtbzBZ?=
 =?utf-8?B?Q1hmYUcydmo0WDNoSms2QlZkV1ZGMC9hbXh2M1JRRE1LZ0hZbFNMNUM1cG9E?=
 =?utf-8?B?NCt6OTd1ckJIc04zR3BTY1k0eTdlalRFUDMwRTE0cjdMeUQzN1dsVk9SdXd6?=
 =?utf-8?B?T1dUbWRqc0lWL0xjaWdRK3dPdWhOdTJCRzFtSEVDLzBWdUpuTDE4RllkcUk5?=
 =?utf-8?B?VWczS2VHQ1JwMjJBUi9CS1NzYlhNTm1wanl3dzVETCs3Y0dxdk5CekxicFkr?=
 =?utf-8?B?RDN2dHZiTGhCZHNhREJ1Z1BvOGhaeDdqZGltMTZoc1Zjb0p5L0dKUDRHK3Rx?=
 =?utf-8?B?eHdzR1VoUmJSeUxnZFlEdUtHUXBxUllFVXRMajJLc0wzSWtIajhYbkdZcUM5?=
 =?utf-8?Q?aBTjwzwaqrcKQEdggP86DAY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6636857-9086-4f3b-e31c-08d9f21fddc6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 14:14:53.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyEqGQm5wU+9oo/Wl+rAYx4XFZsAVhiw8qXeG0uBoIshTKP5wPEOuIPdBDwFDDth
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1702
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.22 um 18:37 schrieb Matthew Auld:
> When running the mock selftests we currently blow up with:
>
> <6> [299.836278] i915: Running i915_gem_huge_page_mock_selftests/igt_mock_memory_region_huge_pages
> <1> [299.836356] BUG: kernel NULL pointer dereference, address: 00000000000000c8
> <1> [299.836361] #PF: supervisor read access in kernel mode
> <1> [299.836364] #PF: error_code(0x0000) - not-present page
> <6> [299.836367] PGD 0 P4D 0
> <4> [299.836369] Oops: 0000 [#1] PREEMPT SMP NOPTI
> <4> [299.836372] CPU: 1 PID: 1429 Comm: i915_selftest Tainted: G     U            5.17.0-rc4-CI-CI_DRM_11227+ #1
> <4> [299.836376] Hardware name: Intel(R) Client Systems NUC11TNHi5/NUC11TNBi5, BIOS TNTGL357.0042.2020.1221.1743 12/21/2020
> <4> [299.836380] RIP: 0010:ttm_resource_init+0x57/0x90 [ttm]
> <4> [299.836392] RSP: 0018:ffffc90001e4f680 EFLAGS: 00010203
> <4> [299.836395] RAX: 0000000000000000 RBX: ffffc90001e4f708 RCX: 0000000000000000
> <4> [299.836398] RDX: ffff888116172528 RSI: ffffc90001e4f6f8 RDI: 0000000000000000
> <4> [299.836401] RBP: ffffc90001e4f6f8 R08: 00000000000001b0 R09: ffff888116172528
> <4> [299.836403] R10: 0000000000000001 R11: 00000000a4cb2e51 R12: ffffc90001e4fa90
> <4> [299.836406] R13: ffff888116172528 R14: ffff888130d7f4b0 R15: ffff888130d7f400
> <4> [299.836409] FS:  00007ff241684500(0000) GS:ffff88849fe80000(0000) knlGS:0000000000000000
> <4> [299.836412] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4> [299.836416] CR2: 00000000000000c8 CR3: 0000000107b80001 CR4: 0000000000770ee0
> <4> [299.836418] PKRU: 55555554
> <4> [299.836420] Call Trace:
> <4> [299.836422]  <TASK>
> <4> [299.836423]  i915_ttm_buddy_man_alloc+0x68/0x240 [i915]
>
> ttm_resource_init() now needs to access the bo->bdev, and also wants to
> store the bo reference. Try to keep both working. The mock_bo is a hack
> so we can interface directly with the ttm managers alloc() and free() hooks for
> our mock testing, without invoking other TTM features like eviction,
> moves, etc.
>
> Closes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F5123&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C034a31c4ed17484f6b3808d9f172fde2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637806298469865348%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=hi%2B2uh3643ecQHjVz0FV22Eg8wPjNOrSkVQ0EDyaXtU%3D&amp;reserved=0
> Fixes: 0e05fc49c358 ("drm/ttm: add common accounting to the resource mgr v3")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/i915/intel_region_ttm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index f2b888c16958..30c7e0d1624c 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -200,11 +200,13 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
>   	int ret;
>   
>   	mock_bo.base.size = size;
> +	mock_bo.bdev = &mem->i915->bdev;
>   	place.flags = flags;
>   
>   	ret = man->func->alloc(man, &mock_bo, &place, &res);
>   	if (ret == -ENOSPC)
>   		ret = -ENXIO;
> +	res->bo = NULL; /* Rather blow up, then some uaf */
>   	return ret ? ERR_PTR(ret) : res;
>   }
>   
> @@ -219,6 +221,11 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
>   				    struct ttm_resource *res)
>   {
>   	struct ttm_resource_manager *man = mem->region_private;
> +	struct ttm_buffer_object mock_bo = {};
> +
> +	mock_bo.base.size = res->num_pages << PAGE_SHIFT;
> +	mock_bo.bdev = &mem->i915->bdev;
> +	res->bo = &mock_bo;
>   
>   	man->func->free(man, res);
>   }

