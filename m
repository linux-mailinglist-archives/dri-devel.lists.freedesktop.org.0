Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98491EFC1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAF710E14A;
	Tue,  2 Jul 2024 07:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cFN+hWzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82AA10E0F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 07:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVodtl0vRhgEoh+JjFBsDc6BrNsGnnq1yBbYOn497QmZ1SewAphbOb+FowhSEbDsoqTlpJuMx/Iam0eWbLk2hfrkHYgH9QZ4lB6/auRNegsAhltP4yDfWCztqRIhxPQzUu8wB4CmM0l6GNo4j2wUXfcID7OCH0wXIw67GVWvMHgYPcKNP8cwCA+YL65l3zbmpDAzaTbl4G0fc5zPPFps1nsDIBPR2QO85MrpMXeF6N6mXOaKsRfIDzvpwawJgC5IbyBvnXO+kHwqrAf6LcySoVOW6LkmBkCBIYPl9BFXpuTRQT3UkPpEzIIaZfdiFcV6OEkL3nTHg+zoA0yPsNFP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LUDaiKG7j/5IBW3BfnNj6QTlwClXzkhrvc8DQG5zhM=;
 b=S8s0GzuStUUlBL3Z2YlWzXNlMVNMaPX+J9RWXOyeSwuNsyXp3SUJT8eFQ0i1Chw2pUXZsxPNTFLnsHmm73PUxu3HDpzEug7R8jMJvYPhlIqJXOaxAplJhqTz1pMrmXTZeJr3gip8JW7aMAEhbNQx9kxNkeqTHZIhL6nYqtuzBy9sE5EmPaGb0/M830XUAdRbMhpIYHRmrjTzJrRJh5n105hxIABGCVpQJb3UkeVxcJLmsc8DHWEH/CUIX1YitE9MGlATD5wUBWFbBLm+LVn6WZOxa3iuUBdUyCjC44bQyCkt/RscJPNHBdroDZEccf1cuJ3XzU0tzRst8QAgqLOujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LUDaiKG7j/5IBW3BfnNj6QTlwClXzkhrvc8DQG5zhM=;
 b=cFN+hWzMGvHKYWvnMJdrVNOhtmyaoUx6KXaLFkHZivU/rqy/VR2hXFyuOsThhLtpKpC27AuZ2bLnr614C3NwnoLgNVx8O9yoeKDrtV2K17dMyYBAcIDF3j6QduQ47o/X30EQJa1GiYdJZciu2dimf0pXL5foelGJqxjBAZIQgrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 07:13:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 07:13:41 +0000
Message-ID: <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
Date: Tue, 2 Jul 2024 09:13:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Blum <thorsten.blum@toblux.com>, jack@suse.cz,
 surenb@google.com, linux-kernel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
 <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
 <20240702064017.GA24838@lst.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240702064017.GA24838@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb5a221-ac92-4c5b-8943-08dc9a668082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGpWalRWNnQ4a3gya1BqK2dxY2RJZlZtV0M5RkJwYnk1djlzZGIrQmNtWkN0?=
 =?utf-8?B?MzVpTnJTVXNzYUZJVkFFTjF0OXBwMTFrOCsyTzg1bFJyUDUvTUpxT2pNc1Iy?=
 =?utf-8?B?dzN0d09BZ0JkT3ZLRU9JaVNPQlRkbG1nNmJGZnAvb2RPN1BPQnpVV200bG1K?=
 =?utf-8?B?bTVyS0J0UkhWVG5vOVkzZ0RrVjArZzEwdUd3RWV1TEhFYmQ0SlhPNmltVXVK?=
 =?utf-8?B?ejYwamx2N1luWitTYVJTMEptOGtBblFuSmpHOFRIZGRmamNlVlZKaW9tZWpP?=
 =?utf-8?B?WXdReS9LTGo1N05heWV5U3dFekY5TjVRSDZ0M0ZCNzlZb3Fzd1BBZ0kvcWFF?=
 =?utf-8?B?VnJnYzRSTUdrY3p5VHRaQWJYQ1c5VVlpZFU4c1Q1aGNaaFREaHB5UkoyZmc1?=
 =?utf-8?B?Q1RQWEU2MXVyV3VDVUdySHV2aXQ4RG5Ndm1pNlZOOUExek5nQnpwVUtrdTAw?=
 =?utf-8?B?NTRUMVY5VW8rYzFOSlI1RWhZN1k5NzdpbGtVUnlhc3p6QjhOQlFnSCtqUlh5?=
 =?utf-8?B?eFJKaGFmSXdzaDZyTXFOYjlNQU8wUGtxSHE0cUJjZFRCSmVlQmZMZWYwSnR6?=
 =?utf-8?B?VDFQdkdSOHBzUnh1ZndrMmQ1SnQ1ZXVFWFFRUGpTdTQxeHQwVXZURGpZZElw?=
 =?utf-8?B?Uld3dFZ1WlRlSXFzT1ljcHRJT1NlZ0ZDZm5PMko4ME44VWxwWHdSWkdiU3hh?=
 =?utf-8?B?S2FxNG0xOEJVWVJwNTcxWUV5UFpUV1I3ZGZ0WWxEZjJjVHZCSnY3S2taVmVE?=
 =?utf-8?B?Y2IrYm1lMjhaNjdHZHorUFBFckJmKzhqeFE0WXRDVm5mUXVvRThveWptbWRK?=
 =?utf-8?B?V2ZkUnZYK0dIQmxzQkxoM1lzeFQyQWNwRjA2Nkg2NWdNZ0kyRitFdU1Lcm1j?=
 =?utf-8?B?MDg3N3VyZk52a0RCU1ozd2dNa2IrNnZyS3ZWOWkrWSswOHNQOC9IYTFkV3Uv?=
 =?utf-8?B?NkNta3dDZWVVcjI1aU01SEI5WjBvQ2xrVmpvYTEwdks1Und0a3ptOTZvNFlF?=
 =?utf-8?B?b3BORFI0aHljdDhmSGd3TGVQaG5NNkZRVzUxUWlKekQwWnY4VEt4N0ZVWU9o?=
 =?utf-8?B?VCtKTktic3Z4SS9HVGNTb25kdjN2VlZUTmI5U0g4RUYxTGpudlFON09RU2tJ?=
 =?utf-8?B?Q05KYjFUOWJTZTR4NExxWHlNSVZjNEoyc1VhTmZUYVFIYzIwMEpiMVFVbUFq?=
 =?utf-8?B?M0RHeTh5emhFUTlPdEt5MTZ3T0tjNzJqY2x3WlpickpjSHpMNGN5UndRMGRu?=
 =?utf-8?B?eTRZU05KdnA1T2tpS0YwUXFFYXVBWkFycXhhazlXZ0lCZ1NGQTNUUEdDZjg1?=
 =?utf-8?B?MFRMeUpWMHBPdWJwV2hiOVNYbEYvYmtTZ2orNTFtU0ZmeXBGMmVtamM0azhT?=
 =?utf-8?B?S0VncXBtbW1Gd3pIay8zcWYwdjZaM3dTM2RCWFVrVlVsN1A3OG9nL2hpbXlo?=
 =?utf-8?B?bEN2Ky9JT3JWL3dudkFhWnVrNXNXTnNLbnYwa3M2cjdScEEvSnhzelp6OFR6?=
 =?utf-8?B?TjRnb2RqSDFRNTBka1IwR2xEam5BekYxRlpZRVNtUExkeVdJaTE1MmE4WXd3?=
 =?utf-8?B?ZitRaEhoUWpXeFNYcVltZjE2V3ZWTUdlZHZVZG5ZSW5EQWh2K2ozN0g0c1FW?=
 =?utf-8?B?WUZDZWRNQVFhazZmNjB5YWxzNjUvY01Vb0ZpTUkwZTlwN01lWUUrZWJtcnZx?=
 =?utf-8?B?QVh6c09CYWFSd1BLYzFlVjRhZEkxQlI4L0RnT21xNWE5ZWlCSlRZVzRlQWdW?=
 =?utf-8?B?SGFmTWxZbWdLWFRzZFpUQU1RV0I4TVM4eUxMV05ac0RZKytmekhCTSs5eE16?=
 =?utf-8?B?Y2RhYWlpeWg4VXg0MHVqZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBYSDdBcmVrak56RWFqakljRGhTdC9jeTJUUjRWMFpiQjVzb3ZBRkZDaFZR?=
 =?utf-8?B?WncvR1cwUWNhS2o3ZUN1ZDZ6ZC9SVm1IQWRvWDd1NGZ2Q1NOU0k0U045WFRH?=
 =?utf-8?B?UUduaWNXNC9QNGlvTkF3cGhtY0w1aFpuazhZNHRKcnErUHlzZHBVbE1Jc0Jr?=
 =?utf-8?B?UFB5WVNDV3JPcW81ZWJFdFJyVEl6ZTJLRmxxQkYrSnJra1QyRjlwRzJrd2dj?=
 =?utf-8?B?a0cvM2tDYzgrZnRwZzRSUzIvRUp6TjBRRFJqWDR2WC93ek9SMUtqZnV0K3Nv?=
 =?utf-8?B?eHpiVjNMcjZ5VlNRWDQ2d054bWI1WHdCcWRNUlpFQ3IwSXZlMyt2WlZSdkdU?=
 =?utf-8?B?bnJ0eW1MUHc4ODcva1VKUkc2VW5Ob1VjRU1VNXpWMTk3bnpFS0JVemtKNjQ1?=
 =?utf-8?B?M3M1d21yK2FFZTdPVEdsMEg3d25EUHNUUmNMaEJYMERaU1I1cGswdEd6dmlj?=
 =?utf-8?B?M3hKR0RoNHh6TVFqZDk1ZUhvSHlVRVJlQzZuM2pSbkJMVGdaeCtaRjJnZWlE?=
 =?utf-8?B?eTVTT01kcndLR21pRmQ0b0gyaXdDNXUvUENMSmNOL2JDOWRvSmxHRVlmUEtX?=
 =?utf-8?B?Uzl0aHU2cTZlclZLNXJCMURDU093ck9qYXc0Skhsc0I1NnVpaGF5VkxUZG1C?=
 =?utf-8?B?cGRPQjBaVGV3MHh3TmQ3bjVkT1ZySWxDdFFUcEdRbzFickordHV1cDNhbHF5?=
 =?utf-8?B?ZkRTSzJVUEJLMEp2WGpGWjJRS1V3bVFDcDlINTErZmExVmVWVGZRN1labnB3?=
 =?utf-8?B?VVo4Y0ZvTzhmTkRCL21ROFY1aVVsUys0NVdLb1NZRWNRVS9vWnFmL1I1YTd5?=
 =?utf-8?B?VmMxU3NPQWJBcVNSRlhaTXVSa2Z0UzJxN2VOeUluMU02Znd0T0JSM0NVdndh?=
 =?utf-8?B?WnhadUZrNUcxTkNoQTBuc3RFYWl4UFlLVkxkaUNuYWUwQVl4ZUFBaFdmbXN2?=
 =?utf-8?B?YUgwS2Q4a0czNzc1MzdsdFlkbEhmMDNSN091VERET1h1VDIzdHBXNG1rblZr?=
 =?utf-8?B?NkwrKzZNK2cvb3F2Sk44ejVHRWVxZUNIdHpQeDJXUms3Vk12VjM4UHBWaDhU?=
 =?utf-8?B?LzI3bUQ0RG1JTy81bVRHVXp3ZlV1K3VBUTBMVEdyS1cxNEtDWDlpUmkxalN0?=
 =?utf-8?B?TlZvTmVkMlV2c1RnNmszM0pNQnRrQU9YNENyZjNMM0ZwczcrRFBZT3hYY3pQ?=
 =?utf-8?B?KzVCeW1relNLS0kyRDQvVEZweTd1eEE3bDRyeEpjTlUvY2M0dkRwQjJOR2tN?=
 =?utf-8?B?emNwQ2JQbHJNaVVJNUQ5ejd4YUJaTmdzMGN4NlFwaTJFREl3QkNsdkZqZmJI?=
 =?utf-8?B?TFU2YWlKWm1Ga3FJSllrY1lYTkdGTEVPMlR1bkJYUmRtSXJqbE01M3ArSnRr?=
 =?utf-8?B?VStwRWtrcTN4SG55VU8vcFZ6b1JWcVljYnJjVjZCeXdEQkJ0OHR4Q0VnQ1NF?=
 =?utf-8?B?RVBpV1N5bmpjdTM4NGRPcnBOWjNtclhzbHhYOFd4c21nSVAxWjJhRnlrdGZl?=
 =?utf-8?B?b0ZLSXlIcGdJRkJQZ3hqaHpEajlKTEhCc2NjRE45K20rczNPL21zdm5rekNR?=
 =?utf-8?B?a1NmSk5VSkJzcTExNWNreGdUUXZVOURpMVRRVU91ZyttMyszZzd5aGRUZyt2?=
 =?utf-8?B?NTBCcTFUVWFXd2hxZTJ4VnlYcFFadDlYeFpsN2tXeVhlZWNTVGFkVENtYlky?=
 =?utf-8?B?Mk85dkpaSXJFZGxLMDRsYU5PQkd0RWNabkpDOGJRbWE0YkZvL0p5WnV6a0dU?=
 =?utf-8?B?WFNUc3FTYnZVSDlqclJpN1kyRXFRVW1Tc2J6TFdCTE4vSk9YUEgwLzZBU1dw?=
 =?utf-8?B?MHhSd1FpU0h5bTBOY3AvWFJCdDA0S1M3N2szT1FPVUZHaElua1VkWEdhYkxu?=
 =?utf-8?B?LzI0VHN6RXF2N09vb21lMXFKQ3M5VGx0ZTZCTWlSVXZaQlMyb2kyMlZNUVBR?=
 =?utf-8?B?YnllcEV6WmRSSWxPRGxKYllrVHd1UXVzZ3dsVTVMZUV2ODRKTkpTdEh1T1hJ?=
 =?utf-8?B?MzVrWGtMa0ptY0xWSHRSQ0R2SW8zZVRnYzM2bUFsQ2k1akZmNWNtbGFGUm1p?=
 =?utf-8?B?aG5kWnhINENCemJVVnR3dXFBZmFQZkxnckZFcFZhbWk4NEozbERETlE4VUpq?=
 =?utf-8?Q?wnigScyQFqC+ujfrgJMjZ3uTE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb5a221-ac92-4c5b-8943-08dc9a668082
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 07:13:41.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Urgvvs61714O5auQ4WSMBxcvnGj0PrWiogVHKKot6lZLvosytHza3xB+p+t+nQbd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708
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

Am 02.07.24 um 08:40 schrieb Christoph Hellwig:
> On Mon, Jul 01, 2024 at 11:26:34PM -0700, Andrew Morton wrote:
>> No, I do think the cast is useful:
>>
>> 	struct page *page = dma_fence_chain_alloc();
>>
>> will presently generate a warning.  We want this.  Your change will
>> remove that useful warning.
>>
>>
>> Unrelatedly: there is no earthly reason why this is implemented as a
>> macro.  A static inline function would be so much better.  Why do we
>> keep doing this.
> Agreed with all of the above.  Adding the dmabuf maintainers.

Thanks for adding me and I have to ask to be added on DMA-buf patches 
when initially sending them out.

First of all: Yes that cast is intentionally there and yes that is 
intentionally a define and not an inline function.

See this patch here which changed that:

commit 2c321f3f70bc284510598f712b702ce8d60c4d14
Author: Suren Baghdasaryan <surenb@google.com>
Date:   Sun Apr 14 19:07:31 2024 -0700

     mm: change inlined allocation helpers to account at the call site

     Main goal of memory allocation profiling patchset is to provide 
accounting
     that is cheap enough to run in production.  To achieve that we inject
     counters using codetags at the allocation call sites to account 
every time
     allocation is made.  This injection allows us to perform accounting
     efficiently because injected counters are immediately available as 
opposed
     to the alternative methods, such as using _RET_IP_, which would require
     counter lookup and appropriate locking that makes accounting much more
     expensive.  This method requires all allocation functions to inject
     separate counters at their call sites so that their callers can be
     individually accounted.  Counter injection is implemented by allocation
     hooks which should wrap all allocation functions.

     Inlined functions which perform allocations but do not use allocation
     hooks are directly charged for the allocations they perform.  In most
     cases these functions are just specialized allocation wrappers used 
from
     multiple places to allocate objects of a specific type.  It would 
be more
     useful to do the accounting at their call sites instead. Instrument 
these
     helpers to do accounting at the call site.  Simple inlined allocation
     wrappers are converted directly into macros.  More complex 
allocators or
     allocators with documentation are converted into _noprof versions and
     allocation hooks are added.  This allows memory allocation profiling
     mechanism to charge allocations to the callers of these functions.

Regards,
Christian.
