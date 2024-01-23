Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623B837982
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CD410F1CB;
	Tue, 23 Jan 2024 00:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCE410F1CB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ds43cNcJihz07oOKRGlH1Vf0T80HGr6QAJF3NDNXjQ8nxFkguEOZYccpLZaVDtZ03FP1q6MdbCIRW6BT4PgeqH1boCOAyw0hfKGLB+0BDwBRC36mEGAFCL1j8XuthSSTCPHElqeNbbJ9IQKfqvAmwrL/u5fEn/n/TVompIrHkFW9HtZRiQxlP6ZvIoWQTyP8roQ2nP7LlHtXgdNgPys7oT0hUdAahsbACXu7/LKL4pVAHqogLjVvUldnyzFNsQC1V1b5NPfp1626jsnxHAEhKNTb3+SKFiz/8r8ey0NTZe6bw9J/NcvUqrMszXqK4IuVdQCNBWG/i+gjN7Slu0o6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XNWQUH0q3S6BqBbFnLXZbIJu1oWaO4j0D+r4N27AyU=;
 b=iQbwrqccR8puoZUOOcXqJDn17IIPCFJ9iJiPtEhH/zfj+sR2hlI36y7S4eCWod2zNuXj49IgYdCxrinj3gI7Q9/yqq4GM6NIHIR9WasH4EWKXB6/7LD2MDt+GwBu7eqSXJjZw+nODIv75Wut8JLa9/8baSYdJoHM7EyCoydzCqd9HYG8p17Z4Wwvqr/srYzmBHtO0DQ8UKxiD3Q+zdLZiqfFr0ywUI1QTVY+cz7ymcCBFGMVLpXGi/WXZwNaKCwgjn2H3VkzeCExI8XLz23m2+bpf6q9Bl3KaOnGku+vN55HpRr4wpDspHjW/F8UI42TqOPEnVWUJhYHXqI3qCMpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XNWQUH0q3S6BqBbFnLXZbIJu1oWaO4j0D+r4N27AyU=;
 b=Ce8lweJnmXVuGtHQ3cmRntL8vH/LXmfZuVkvdhsuEgjOGDLeSPuCO+T8pyI68hcxs7WEIUAmWXCsEjGk0akzmxJFn4iUAkqSg8D2lCOL6xdDZcfrSlPzRxEycX7ctxwK/isyOtZ6l0TJ/VRy3XpjHoW2247xsn1++ALEkpsWcq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 00:40:18 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 00:40:18 +0000
Message-ID: <713eaa19-33b9-40fe-a3a5-69e45d671399@amd.com>
Date: Mon, 22 Jan 2024 19:40:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
References: <20240122180605.28daf23a@gandalf.local.home>
 <918ddc13-1cf8-4199-b5be-5719a023de42@amd.com>
 <20240122193453.6096d45f@gandalf.local.home>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <20240122193453.6096d45f@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0016.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::29) To DS7PR12MB5933.namprd12.prod.outlook.com
 (2603:10b6:8:7c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7893d0-9e87-454b-6eec-08dc1babdf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhhXeINChPjxjiUJg1uVjk9QOGGdT75je8PSM8SM1KiaGEfXGzmRhgrWI9jbhUCYELH50ZdMBg2VR76KyaOY7EF97vVH1Eb80Xz17/18n907gSZks8Y+vkZkLIftn1AyQHK/6d/t5KKPqYK4BFlVlOZ9eXo1Q1/M8QFFzKe+aOg6aHRdubAYu+QXBqAwS1U3roW7SDn7Gs3o1f0AuYusvWzGjjL9/z746MleHUc4zM+TP9478M3clVRBL5BwzhBx9dZseua8EplJ9yhbb14fzW3we0BeEMt9mI8L1VqLlYqt430x/C/j5DI3bN1vKeJCfNjKMr+5KdNi1Whr3ioQtgtXWCZNx0zlC69q/6WcH04mpTz9VViYUco97UmwYMO4qAaYpOkKYnoE7tZFarnX91QMlXIgpVQN3TXQfm9ZNkeYHD/zS7UiFFNa5Qw43ySkAlzrg3orVMB/Sy/GSKg5FK5C09yIpSzyz2HBMhDgH9LCaxPWIpPHP6Ad0oMVT/Tcra/j2GFD2wDEJUb20Jf6NUIlOKGtWx2D/6uIbQIpG2R9Lqo1ki/siGYjQx3mtNUTXydFBvFiUhwqJ0NuJqwlWgN0wB5DD0lRoTCnE7fYYZvyCyCqsrTPM2kVOS5cKEr3aW2tIhFiU5xe8tHRfHLHQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(26005)(6666004)(6512007)(2616005)(6506007)(53546011)(5660300002)(8676002)(4326008)(41300700001)(2906002)(8936002)(66556008)(6916009)(316002)(66946007)(83380400001)(478600001)(54906003)(66476007)(6486002)(38100700002)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzl6bXg5am1mMWMrU0t4dS9FaFNpUzdHNXgyMUViUVorcVlJRW1mU0pjZmRM?=
 =?utf-8?B?ODZGbE5HcnlmV3c2NnlldGVzRlZCUmo4a1FKdllPdC9tTHR4S0ZwWUo5alU3?=
 =?utf-8?B?WHFac2tPaWgrZHJIeUZFWXBGbDZEWmJzTldZWnFBUDRDdWNDaDZtSVNWSEhQ?=
 =?utf-8?B?R0RXbEpRdUhIWlFXd0N1Q3Z5M3FDMC9kVjcyenJjUUlFTEdEUmJYU2lQSnY2?=
 =?utf-8?B?enUveDlzOFVRalpYNk56Q1U5OXpUTlpaR0ZNcGJiZ1RCN25XZXMyVkVDa2RY?=
 =?utf-8?B?U2RyUFkxZVpSSm5mRjJlSFRWNUhMYnpyL3daSXVEZ3FBa1hBRmg1SDNpdEV5?=
 =?utf-8?B?TURFNE9hVEltOG1nZFN0OEdzbzJCN0Z4RDZJV0daaVJJYWozSUhyRDI3d0tR?=
 =?utf-8?B?WmRBVEVibVJwT1Jya0tSeWMvbHNJcWNsOUtmeGNLQXRNQWQ5Vmg5alN5WERz?=
 =?utf-8?B?NjVBSi9ON210WXcxd1EyeTJtWFVjL041bXZCRHJvUGJmODhHbEh4WHdxajdn?=
 =?utf-8?B?Vk5JZGpRcXpHVDFSTXd0dFJSa1NJREhyMFY5T2lMZWhpOGFYbXlnTmRnd3p1?=
 =?utf-8?B?SmY5Z1h4U09QbmYwVXRQRkxaMHc2TW9PeTliRU5nMVNvUi9mRTNGZERsQUdQ?=
 =?utf-8?B?V0NOZjZQOFp4elNTUXB0bEFWNzFuaWtHV2dTaG8xbitHMWxQYlVFOWZWMDR1?=
 =?utf-8?B?a1pOSitTbHErYkx3bGgrUVZUUVNkK2ZONlhiYUhPYTVrL0svY3A3S2lTc21j?=
 =?utf-8?B?TVFnMm81bnRrT1FDRVpZbFN5TWhNQ0NZSEx1TG5qZVFXZWkvcmcxcjFzTlNl?=
 =?utf-8?B?UC9lQjBHK2NTNDlHZ1g2d0E0RXFYZTlGZm9zS0ZzM2lRVmF2bFA3WVNQci9r?=
 =?utf-8?B?bE9OeHpLSjhpWlRPaG9tRVFPSUFtMXNsLzNDNkR2MU1SSGRKdW1UcVBMUWUv?=
 =?utf-8?B?cVcwb3ZjcnJmTEYvYTlNRUNzcUR1MlZXb01vUU5IaC9HcmUrSDQ2Uk96VFJw?=
 =?utf-8?B?cTArME4rVFZjN1N1TmdYV0pRWW9tY0EydnJTOFd6eGRIMFJYNjR2b3NCb1JT?=
 =?utf-8?B?L2ZQMytFY2M0bzVmeXFSMklrYVJDK1ltU2dFSzRVTGozSXJmSXZDZWYyV2Q3?=
 =?utf-8?B?eUJ2RjA3WHNCTUswWW1JcEdNZXZqZE13R0xVZWpTSzR2Mm5hVkhGWE9qNC83?=
 =?utf-8?B?Qm1QVE1DMk4wdnJ2SGlJM1l1L0dyZjZuZkJwYmhzTDVSSWptdzl6bFlvZG9q?=
 =?utf-8?B?R2F0WS9ERDROSGFRZzFxUmNZdFJUbUdmRUZoSmk1eTczbVFFb1B1RGhCRTY3?=
 =?utf-8?B?Rm9mRml1NXJQWFYxNUMwSkFQUkFKb3l1amNjekdNT043TDBpeG5PYkJGdkk3?=
 =?utf-8?B?M20wZmlNNkl0YTdzNU1SNDdhZzRZK0FwcGxuNXJMRmxGUzNJR0s2K0NYcVgy?=
 =?utf-8?B?SUVxVTl5aUN0NlFrL1BaUHd6SDhCL3EzQ1hvQmlMa3ZSY3BJWW01NXlvQThL?=
 =?utf-8?B?NWRacW01RFVyN1ZwbHMybGcrMkZzbTM5TWFnWVpzVXZWV3Y0WnQvU1BwYktQ?=
 =?utf-8?B?eUtxUWpxd0J0SDZZU2piU1JsOCtBQ3dodk9kWkphRmhCOE5YcTVuTGxXb3ht?=
 =?utf-8?B?dlFqSjRCaFJpaDhveTZveE9kR2FaWlBOLzRXUUpXMzJGNTRmc0xObXNkL09V?=
 =?utf-8?B?QW40UEF1UzZTbHU5REppMnNlNWF4WXMxUnJ1NklNcnd4YW1EMkdzeExHelJW?=
 =?utf-8?B?WUdyYzV0OVNOTCtaT3YrNzE2eTNOK0FkMlFKNW5kWVhpNHNFSnkzcHVYdkZw?=
 =?utf-8?B?RHY0SDFCVVZ2TzBqUUh4dmIrb0xDNWt6S2hQZEJWOWd4QXF0SC8yZUUrNGFi?=
 =?utf-8?B?QnZuTUdhSnJCdjA5T0x1Q0o3RENraDZZLzg0VmtFZHFQWm5GQlJOV0U5MVdP?=
 =?utf-8?B?eDNuSUpYeDNSNG0yR3hYZG92OXFqS2FVaUtWWUJDTWdHSjNHdjNDUTM2SlNu?=
 =?utf-8?B?SnpsUVdDdVptSzZCTjhFcTFrN0VlTno5MktQa0FnZDN6cmRsVEozRkpIZHk2?=
 =?utf-8?B?NUV3cnJBSDl0MEZlcUo2Vmg2akU4VVViMWF1RW44dy9XZTE0aW9vbHU2bjNW?=
 =?utf-8?Q?K1RtHvSbkYlc/0sAXBGBTcSa9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7893d0-9e87-454b-6eec-08dc1babdf62
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:40:18.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18efQUroYKi7belIjIAfLdRrJI8vxy5bl/XOuSVXIrExvMEHBQjuiJ1wHZAlYyp1syX7kUgma5Fast08luoEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/22/2024 7:34 PM, Steven Rostedt wrote:
> On Mon, 22 Jan 2024 19:29:41 -0500
> "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com> wrote:
>
>> In one of my previous revisions of this patch when I was experimenting,
>> I used something like below. Wonder if that could work in your case
>> and/or in general.
>>
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>> b/drivers/gpu/drm/ttm/ttm_device.c
>>
>> index 43e27ab77f95..4c3902b94be4 100644
>>
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>
>> @@ -195,6 +195,7 @@ int ttm_device_init(struct ttm_device *bdev, struct
>> ttm_device_funcs *funcs,
>>
>> bool use_dma_alloc, bool use_dma32){
>>
>> struct ttm_global *glob = &ttm_glob;
>>
>> +bool node_has_cpu = false;
>>
>> int ret;
>>
>> if (WARN_ON(vma_manager == NULL))
>>
>> @@ -213,7 +214,12 @@ int ttm_device_init(struct ttm_device *bdev, struct
>> ttm_device_funcs *funcs,
>>
>> bdev->funcs = funcs;
>>
>> ttm_sys_man_init(bdev);
>>
>> -ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
>>
>> +
>>
>> +node_has_cpu = node_state(dev->numa_node, N_CPU);
> Considering that qxl_ttm_init() passes in dev = NULL, the above would blow
> up just the same.


I agree, I think we need something like you suggested i.e.

+	ttm_pool_init(&bdev->pool, dev, dev ? dev_to_node(dev) : NUMA_NO_NODE,
+		      use_dma_alloc, use_dma32);


I am not quite sure if the above node_has_cpu change will be a better 
solution in general, along with the NULL pointer check as you suggested. 
If you prefer that, then I can send a fix otherwise, your fix looks good 
to me.


>
> -- Steve
>
>
>> +if (node_has_cpu)
>>
>> +ttm_pool_init(&bdev->pool, dev, dev->numa_node, use_dma_alloc, use_dma32);
>>
>> +else
>>
>> +ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc,
>>
>> +use_dma32);
>>
>> bdev->vma_manager = vma_manager;
>>
>> spin_lock_init(&bdev->lru_lock);
>>
>>
>>> -- Steve
