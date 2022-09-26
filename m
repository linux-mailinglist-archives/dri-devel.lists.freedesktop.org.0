Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE55E9977
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 08:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773C10E510;
	Mon, 26 Sep 2022 06:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8711B10E510;
 Mon, 26 Sep 2022 06:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON/CpFDwOtvgDMD7PKNjwjSH4lUXqFj6JMQtokR10y4LchXfZ37pWEWHbHc5Ao6aT7bayBM1pO1wex0NwWAYRyZ7lVsGQrAFqq442yOkfYLyhSGkvzUo2Q5z04K30c8iQ8Zp7KBPz0skeWwbDIvUNmXAdPeDOAaed5nB5Gp2ozOgt2qQVXcu76gFvS17nLZQF4S0wzNe5b9KGme6kL+sqr+VF5xqsp6XiNYDX3Mr+B6YoQbJg0Q7wC5qbI6GRr77iW3g2KBZbBlOnp2bVAZE4M30+6Oih6spyajmexTWXlWdocnFBulJGKHr1JzIYxYzgRoZL8iA1M/DHR6GJWToxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCA+Zrx6QApKGfp58O9uWcoVDeAkWVuJAzVVLub88sc=;
 b=BU1ii6ZPueEFYxwB3Y885MB4FsFp1fmv/bNu9/bH2KBSKupW4ZN2cDvylYOt2hF0sther1XA2DFcKA6xzQ0NykCszPNrxK/3F3tT63DFxTZ8u3ku1pMhbX2rnCv4PVHxVcnI0TGSYipHy9ntd3iFnFagjZbML/sjjN83QNHQ04LsUvwT/Bz9HwThm91J3ogG7zX6FRDlu/1goMBB8RK+bE/LA3gRp6QqG+xKUdsasFjs1Xf88K9Go44Utkpi9EECrf8SiYfRVhpqnsDfUqd+FXLPXOS1kc+qNjg0gPjh1G9Rgevbr+txCJSGs1Ihoe69O9GNOdFyFd7nLrnaxaAXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCA+Zrx6QApKGfp58O9uWcoVDeAkWVuJAzVVLub88sc=;
 b=zysJKuqyQWuRlTjxELFjjr6y4qk+G3NPTWQqsreeKDn6GE/6o5vBK+crxKlSxZShM1Z/bXaPeh4EIAiV01TMqH5zIFElHqVXV4LoQx81P+ZRIWwx4h1Huw2vHXdu9K3u9uD7HILXHoautfo9ree/blYoSmFXCGeznWapZflmnU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5111.namprd12.prod.outlook.com (2603:10b6:208:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:30:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:30:02 +0000
Message-ID: <9f3bb60b-38da-1ac1-59bd-6f147309183c@amd.com>
Date: Mon, 26 Sep 2022 08:29:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: Fix mutex lock in dcn10
Content-Language: en-US
To: Daniel Gomez <daniel@qtec.com>
References: <b21aa2e6-1b47-cdc1-307c-21fb331d4afb@amd.com>
 <20220925215320.644169-1-daniel@qtec.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220925215320.644169-1-daniel@qtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3215b5eb-b871-41cd-de94-08da9f888b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfDfC0ecot60CU5PstzUJIYj2ZPZDeUPyxyoljILrGKRcItwxw6sPe+NLz/NlcdivbQYaspCUN0RnxO7konrkgrJEcuvAjaz4o48QJ/HGNoXjT89N/ST/DJo5CvxKxaF4K41dYbmRWFa274NCa4ODX8fWLYobUbAa36Fs+Us1dY/d1Njr7805+5s/eHVCT3IeTYhZyCBlyyp23TVDRz2+sgRDBpkc8YxULHDMq3f1Z2xqNdrH6yNBxGpL8Tvy/m3itgba8DLpSD7g08oFVFjND/OTkH1+8a6iXTnWypw4YLw0JQJo3raJH6ryLVcWCVq2XbT3uNrKIpLjJ8HfEA2Xi9k9eIAhY2CghEn6HCSWOQmdxN9OnBW6cc2yyuk1WgchXEs1UVh6e61RAgZKKadJayp2hy5PPQ4+AEYkm3EAmCMjLZvRKiehOoJmyKcHjoQRAIqh9s4YPyUX5m0icvhpEx0cWf+i4xIrtMQuen/OYwyLjAX2ZBnez5YftMtIuwAgFviFET8BUOnddgzXaYTGaKKm7uJLvZxTjWYU5V0YtrTM0MTDhj5Cjo6jT0X8Go5o4DsDLLNVCDSJrUWmR0sVQkg9ig3quMDjNn5UEqfnPsmbjKfNOkN67QsPETN24tznEqUmTcWruY8s88LdGZykUM/lpLSBbZ+wszLzceTMy6ApUv1LHcPnDMs0Med2m+mjn+qKu5fjKU2P6Tf5mNBZG9GFOlywv8h8Tdpztc4gt5tRwfVGfwpd6jY/pxoBNr9ZWbtBmSG3lBG5t9OS+idykWgJOHDk2FjVR2Brzd8krg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(54906003)(6916009)(316002)(6486002)(83380400001)(31686004)(478600001)(66946007)(66556008)(8676002)(4326008)(66476007)(41300700001)(6666004)(6506007)(36756003)(5660300002)(30864003)(6512007)(7416002)(8936002)(2906002)(2616005)(186003)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pHc0dzdE40U1IxTlBBQkFvRlhxZXAvMTFwd1k0RnN1c3BzWjJIbjBuUzRK?=
 =?utf-8?B?Q3gvSmJhT1l4K2pjQ3B3QWE4d3FLbVBnRXF2emJzdWlLRURXak5BL0FVOWYz?=
 =?utf-8?B?N3ZEYXNhMW5ZWVcwcXFsNlpINkhTQ1NmYjZjaGRYbUFrZlYzMVpxQ2Q2STFk?=
 =?utf-8?B?WFh0U3RkTkE1cElRZlhTdDdaY3gvcEc5eEcwcnRXb2pZSVpIK0JoYnNYaGZ1?=
 =?utf-8?B?UWMvODJialZNYlF0RnV5SlVWSGJzTUVXY2owVW9rdlAxVk9kKzRrMzl0TVRT?=
 =?utf-8?B?U29OQVJobDF2Smdlek1QR2FMSFNJc3ZhZkZzYnFRT2NOMUdUR1VETzc0ZHM2?=
 =?utf-8?B?bUxpRXhKQW1ZMW9pUjdITS9nOU1Wb2pQVGY5MkY4aTZGT1pYTjdCS0xCMGh4?=
 =?utf-8?B?UTh0L3Z2UEc0aFhGMmp6c2FWaEgxbUo4ZDYzWndpbHpwSzNWeE4vcFMxVE9j?=
 =?utf-8?B?M200QWV5emZWR2VUMWw0YUhBS3Bpc3VMQzJmVWQzTEFJMTFMdFB6MVpoRHIz?=
 =?utf-8?B?NDM5a2ZMaVIrVDMxOUtyYVBPYlQ4TG1FM0xvZnBiRzFCQVEwSEUxMURiTXBl?=
 =?utf-8?B?UWVwUXlZd2FWOUk4cFN6VTN5Um84SlUzUG1aVWVJb3NQWU1nbVJYdE9PQU01?=
 =?utf-8?B?Z21PT0ZPM0JmRDJab0xlNVgxS2luYksxZGZpY0hDRGRlRWNWR09kOWYxclF4?=
 =?utf-8?B?aFF5RU1QSVZXVDJwNXN5S05NdkNVQ2daK2N3WDJ5WU16bURIaDc0RlpoVjhD?=
 =?utf-8?B?UlpkM05QTUxVWi9DOU8wYkJjUDZHc2hlYkxSazFhZ2JxbGdLUysrcFlzTTE2?=
 =?utf-8?B?Ry8xL3lJcEdJYStQb1c5a0M3ZUt5QkFsYmFjTVAyZ3hxQVZBd1E3L1lHSkJr?=
 =?utf-8?B?ZmhXK1RMekIxTEtLaFkxL3RiRVEyZE9RaitSWmhmRDUya3ZNQklhNXRHUGtJ?=
 =?utf-8?B?SVkxV1FndHNqN1V6Tzd3bjdFL2FneHN0SWxPbkdlMW5IUlYwSS9sNDV6d29a?=
 =?utf-8?B?cUVWSjZPY1FJNmxhSDlLN3duOUJXaDgxRWcxMU9ZcjZZSlp5SVZHejlMcDJz?=
 =?utf-8?B?Qllhamgvb3lGd3dUdnZWbVVwWE5OOUY2RWZJUTM3RWxWWVdFbkhQLzNya0Qz?=
 =?utf-8?B?SUI3NFZNU3NXZnAvSW44Wk8wWWVOQ0hoOGNlbUVhWjZ5OURZZnJQQkZkTmQy?=
 =?utf-8?B?ODF0VGNFYW5wdkhMVmtxNGdGUEo4TWpwS0locXpJUThSa3NvMFpUWjd1SGRN?=
 =?utf-8?B?RzZoTldQYkdGdVFscC9OVUNUcnB2ajQ5M1hhY3BOeVB1a09qRjhCZE1NZWlX?=
 =?utf-8?B?NnY5MUwyZE1kMVpBdmN5RkJtdjJ0QlpNK1pSUnJBQUVVSHdlMG8xTEV6cEJi?=
 =?utf-8?B?OG4zREVVdXJnYW82Z1BNQVJYYTgzTTFWSmhrQmo2RVBhMGpvTE9wYmtnVmFB?=
 =?utf-8?B?Q0ZPWmQ1dGFwZy9VOGR2TW9kbk85bWplTUdLYW45UmgvR1ZHNmUyN0hNRlRB?=
 =?utf-8?B?N003YTRRMWxVL0RpdWsxOG13Mm53VVNBdXBVUzRFejJWQ2Npbm9qc1BTM3NG?=
 =?utf-8?B?ZVBUOTBoUVpIdnIrNm9pZTBxL1Q4d21uR1pldEFib0dYWWJVdTUwZ0hlMTdO?=
 =?utf-8?B?OFNWRHVuZTJMVXhVU0sxY2pXeHpyM2ZGSElMdElJZU9kMGVhNGZySlhzalZX?=
 =?utf-8?B?NlJETWF3WTI2Zmc4bHplSStMM2FXcTBpa1lLYm5Eek83Y1JiaTdCWDk3eW9u?=
 =?utf-8?B?b2tHcmJOcndlRkdraTQyclhhTFRMRzVOZ1JseWo4ZGlRWHpLMG1INlFPSGpu?=
 =?utf-8?B?U3dONlQ0N2l4WVRwcnU4bFhkZEI2UHhKL1UyRGNVcFloYjVOYUN4OW9kcjd1?=
 =?utf-8?B?MlpvZWlPR0tNUjkrMStBOVU3ZUJLN1FqQURhQTlNbzFRU1NaUUVGdjNwRHFo?=
 =?utf-8?B?UHUrOFgwcWVJNDhlRkFSeHZITHl0MmhHTGZxeHhuWXhYOWVOVFY2RHJYTDlM?=
 =?utf-8?B?bjVuc3dJZ2hVa2NydjNmN0JZWjIwNGNHTW9CMnk4WVpTT2NCNFFtVXBWWDdR?=
 =?utf-8?B?dldSZ3JiMmhOcHpsbGVVSW1BS3BjdmY1QVozWmF2Qk8zYmRoa1o5OE1sc1BQ?=
 =?utf-8?B?VHhjcWpHVDZIMjlhRm54V2w0V1ptOGdNbTdFeG9ZOUpacE13b0lnenl5c0Iw?=
 =?utf-8?Q?jWrnlYeT0YZdpHylgaqmasckmwIr9E0DZfRG3FU4cS32?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3215b5eb-b871-41cd-de94-08da9f888b0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:30:02.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZeNywEQ0GawhVu3iF7jFVK5Y+4Wq39ZKIuZyHbI1P/npRDTi5/+xzlAMqPPwze2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5111
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yi-Ling Chen <Yi-Ling.Chen2@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 Bernard Zhao <bernard@vivo.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Ahmad Othman <Ahmad.Othman@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Becle Lee <becle.lee@amd.com>,
 Duncan Ma <duncan.ma@amd.com>, Melissa Wen <mwen@igalia.com>, dagmcr@gmail.com,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>,
 Sung Joon Kim <Sungjoon.Kim@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 Roman Li <Roman.Li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.09.22 um 23:53 schrieb Daniel Gomez:
> Removal of DC_FP_* wrappers from dml (9696679bf7ac) provokes a mutex
> lock [2] on the amdgpu driver. Re-arrange the dcn10 code to avoid
> locking the mutex by placing the DC_FP_* wrappers around the proper
> functions.

Of hand that looks correct to me now, but our DC team needs to take a 
closer look.

Regards,
Christian.

>
> This fixes the following WARN/stacktrace:
>
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 227, name: systemd-udevd
> preempt_count: 1, expected: 0
> CPU: 4 PID: 227 Comm: systemd-udevd Not tainted 6.0.0-rc6-qtec-standard #2
> Hardware name: Qtechnology A/S QT5222/QT5221, BIOS v1.0.1 06/07/2021
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x33/0x42
>   __might_resched.cold.172+0xa5/0xb3
>   mutex_lock+0x1a/0x40
>   amdgpu_dpm_get_clock_by_type_with_voltage+0x38/0x70 [amdgpu]
>   dm_pp_get_clock_levels_by_type_with_voltage+0x64/0xa0 [amdgpu]
>   dcn_bw_update_from_pplib+0x70/0x340 [amdgpu]
>   dcn10_create_resource_pool+0x8c8/0xd20 [amdgpu]
>   ? __kmalloc+0x1c7/0x4a0
>   dc_create_resource_pool+0xe7/0x190 [amdgpu]
>   dc_create+0x212/0x5d0 [amdgpu]
>   amdgpu_dm_init+0x246/0x370 [amdgpu]
>   ? schedule_hrtimeout_range_clock+0x93/0x120
>   ? phm_wait_for_register_unequal.part.1+0x4a/0x80 [amdgpu]
>   dm_hw_init+0xe/0x20 [amdgpu]
>   amdgpu_device_init.cold.56+0x1324/0x1653 [amdgpu]
>   ? pci_bus_read_config_word+0x43/0x80
>   amdgpu_driver_load_kms+0x15/0x120 [amdgpu]
>   amdgpu_pci_probe+0x116/0x320 [amdgpu]
>   pci_device_probe+0x97/0x110
>   really_probe+0xdd/0x340
>   __driver_probe_device+0x80/0x170
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xdc/0x180
>   ? __device_attach_driver+0x100/0x100
>   ? __device_attach_driver+0x100/0x100
>   bus_for_each_dev+0x74/0xc0
>   bus_add_driver+0x19e/0x210
>   ? kset_find_obj+0x30/0xa0
>   ? 0xffffffffa0a5b000
>   driver_register+0x6b/0xc0
>   ? 0xffffffffa0a5b000
>   do_one_initcall+0x4a/0x1f0
>   ? __vunmap+0x28e/0x2f0
>   ? __cond_resched+0x15/0x30
>   ? kmem_cache_alloc_trace+0x3d/0x440
>   do_init_module+0x4a/0x1e0
>   load_module+0x1cba/0x1e10
>   ? __do_sys_finit_module+0xb7/0x120
>   __do_sys_finit_module+0xb7/0x120
>   do_syscall_64+0x3c/0x80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7ff2b5f5422d
> Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48
> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 ab 0e 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffc44ab28e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 0000555c566a9240 RCX: 00007ff2b5f5422d
> RDX: 0000000000000000 RSI: 00007ff2b60bb353 RDI: 0000000000000019
> RBP: 00007ff2b60bb353 R08: 0000000000000000 R09: 0000555c566a9240
> R10: 0000000000000019 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000020000 R14: 0000000000000000 R15: 0000000000000000
> </TASK>
>
> Fixes: 9696679bf7ac ("drm/amd/display: remove DC_FP_* wrapper from
> dml folder")
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  12 +-
>   .../drm/amd/display/dc/dcn10/dcn10_resource.c |  66 +++++++++-
>   .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 118 ++++++++----------
>   .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |  19 ++-
>   4 files changed, 138 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 5b5d952b2b8c..cb1e06d62841 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2994,6 +2994,7 @@ void dcn10_prepare_bandwidth(
>   {
>   	struct dce_hwseq *hws = dc->hwseq;
>   	struct hubbub *hubbub = dc->res_pool->hubbub;
> +	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
>   
>   	if (dc->debug.sanity_checks)
>   		hws->funcs.verify_allow_pstate_change_high(dc);
> @@ -3016,8 +3017,11 @@ void dcn10_prepare_bandwidth(
>   
>   	if (dc->debug.pplib_wm_report_mode == WM_REPORT_OVERRIDE) {
>   		DC_FP_START();
> -		dcn_bw_notify_pplib_of_wm_ranges(dc);
> +		dcn_get_soc_clks(
> +			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
>   		DC_FP_END();
> +		dcn_bw_notify_pplib_of_wm_ranges(
> +			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
>   	}
>   
>   	if (dc->debug.sanity_checks)
> @@ -3030,6 +3034,7 @@ void dcn10_optimize_bandwidth(
>   {
>   	struct dce_hwseq *hws = dc->hwseq;
>   	struct hubbub *hubbub = dc->res_pool->hubbub;
> +	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
>   
>   	if (dc->debug.sanity_checks)
>   		hws->funcs.verify_allow_pstate_change_high(dc);
> @@ -3053,8 +3058,11 @@ void dcn10_optimize_bandwidth(
>   
>   	if (dc->debug.pplib_wm_report_mode == WM_REPORT_OVERRIDE) {
>   		DC_FP_START();
> -		dcn_bw_notify_pplib_of_wm_ranges(dc);
> +		dcn_get_soc_clks(
> +			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
>   		DC_FP_END();
> +		dcn_bw_notify_pplib_of_wm_ranges(
> +			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
>   	}
>   
>   	if (dc->debug.sanity_checks)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index 174eebbe8b4f..a18a5b56ca7d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -1336,6 +1336,21 @@ static noinline void dcn10_resource_construct_fp(
>   	}
>   }
>   
> +static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clks)
> +{
> +	int i;
> +
> +	if (clks->num_levels == 0)
> +		return false;
> +
> +	for (i = 0; i < clks->num_levels; i++)
> +		/* Ensure that the result is sane */
> +		if (clks->data[i].clocks_in_khz == 0)
> +			return false;
> +
> +	return true;
> +}
> +
>   static bool dcn10_resource_construct(
>   	uint8_t num_virtual_links,
>   	struct dc *dc,
> @@ -1345,6 +1360,9 @@ static bool dcn10_resource_construct(
>   	int j;
>   	struct dc_context *ctx = dc->ctx;
>   	uint32_t pipe_fuses = read_pipe_fuses(ctx);
> +	struct dm_pp_clock_levels_with_voltage fclks = {0}, dcfclks = {0};
> +	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
> +	bool res;
>   
>   	ctx->dc_bios->regs = &bios_regs;
>   
> @@ -1505,15 +1523,53 @@ static bool dcn10_resource_construct(
>   			&& pool->base.pp_smu->rv_funcs.set_pme_wa_enable != NULL)
>   		dc->debug.az_endpoint_mute_only = false;
>   
> -	DC_FP_START();
> -	if (!dc->debug.disable_pplib_clock_request)
> -		dcn_bw_update_from_pplib(dc);
> +
> +	if (!dc->debug.disable_pplib_clock_request) {
> +		/*
> +		 * TODO: This is not the proper way to obtain
> +		 * fabric_and_dram_bandwidth, should be min(fclk, memclk).
> +		 */
> +		res = dm_pp_get_clock_levels_by_type_with_voltage(
> +				ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
> +
> +		DC_FP_START();
> +
> +		if (res)
> +			res = verify_clock_values(&fclks);
> +
> +		if (res)
> +			dcn_bw_update_from_pplib_fclks(dc, &fclks);
> +		else
> +			BREAK_TO_DEBUGGER();
> +
> +		DC_FP_END();
> +
> +		res = dm_pp_get_clock_levels_by_type_with_voltage(
> +			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
> +
> +		DC_FP_START();
> +
> +		if (res)
> +			res = verify_clock_values(&dcfclks);
> +
> +		if (res)
> +			dcn_bw_update_from_pplib_dcfclks(dc, &dcfclks);
> +		else
> +			BREAK_TO_DEBUGGER();
> +
> +		DC_FP_END();
> +	}
> +
>   	dcn_bw_sync_calcs_and_dml(dc);
>   	if (!dc->debug.disable_pplib_wm_range) {
>   		dc->res_pool = &pool->base;
> -		dcn_bw_notify_pplib_of_wm_ranges(dc);
> +		DC_FP_START();
> +		dcn_get_soc_clks(
> +			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
> +		DC_FP_END();
> +		dcn_bw_notify_pplib_of_wm_ranges(
> +			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
>   	}
> -	DC_FP_END();
>   
>   	{
>   		struct irq_service_init_data init_data;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> index db3b16b77034..7d3394470352 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> @@ -1464,81 +1464,67 @@ unsigned int dcn_find_dcfclk_suits_all(
>   	return dcf_clk;
>   }
>   
> -static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clks)
> +void dcn_bw_update_from_pplib_fclks(
> +	struct dc *dc,
> +	struct dm_pp_clock_levels_with_voltage *fclks)
>   {
> -	int i;
> -
> -	if (clks->num_levels == 0)
> -		return false;
> -
> -	for (i = 0; i < clks->num_levels; i++)
> -		/* Ensure that the result is sane */
> -		if (clks->data[i].clocks_in_khz == 0)
> -			return false;
> +	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
>   
> -	return true;
> +	ASSERT(fclks->num_levels);
> +
> +	vmin0p65_idx = 0;
> +	vmid0p72_idx = fclks->num_levels -
> +		(fclks->num_levels > 2 ? 3 : (fclks->num_levels > 1 ? 2 : 1));
> +	vnom0p8_idx = fclks->num_levels - (fclks->num_levels > 1 ? 2 : 1);
> +	vmax0p9_idx = fclks->num_levels - 1;
> +
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 =
> +		32 * (fclks->data[vmin0p65_idx].clocks_in_khz / 1000.0) / 1000.0;
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 =
> +		dc->dcn_soc->number_of_channels *
> +		(fclks->data[vmid0p72_idx].clocks_in_khz / 1000.0)
> +		* ddr4_dram_factor_single_Channel / 1000.0;
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 =
> +		dc->dcn_soc->number_of_channels *
> +		(fclks->data[vnom0p8_idx].clocks_in_khz / 1000.0)
> +		* ddr4_dram_factor_single_Channel / 1000.0;
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 =
> +		dc->dcn_soc->number_of_channels *
> +		(fclks->data[vmax0p9_idx].clocks_in_khz / 1000.0)
> +		* ddr4_dram_factor_single_Channel / 1000.0;
>   }
>   
> -void dcn_bw_update_from_pplib(struct dc *dc)
> +void dcn_bw_update_from_pplib_dcfclks(
> +	struct dc *dc,
> +	struct dm_pp_clock_levels_with_voltage *dcfclks)
>   {
> -	struct dc_context *ctx = dc->ctx;
> -	struct dm_pp_clock_levels_with_voltage fclks = {0}, dcfclks = {0};
> -	bool res;
> -	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
> -
> -	/* TODO: This is not the proper way to obtain fabric_and_dram_bandwidth, should be min(fclk, memclk) */
> -	res = dm_pp_get_clock_levels_by_type_with_voltage(
> -			ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
> -
> -	if (res)
> -		res = verify_clock_values(&fclks);
> -
> -	if (res) {
> -		ASSERT(fclks.num_levels);
> -
> -		vmin0p65_idx = 0;
> -		vmid0p72_idx = fclks.num_levels -
> -			(fclks.num_levels > 2 ? 3 : (fclks.num_levels > 1 ? 2 : 1));
> -		vnom0p8_idx = fclks.num_levels - (fclks.num_levels > 1 ? 2 : 1);
> -		vmax0p9_idx = fclks.num_levels - 1;
> -
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 =
> -			32 * (fclks.data[vmin0p65_idx].clocks_in_khz / 1000.0) / 1000.0;
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 =
> -			dc->dcn_soc->number_of_channels *
> -			(fclks.data[vmid0p72_idx].clocks_in_khz / 1000.0)
> -			* ddr4_dram_factor_single_Channel / 1000.0;
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 =
> -			dc->dcn_soc->number_of_channels *
> -			(fclks.data[vnom0p8_idx].clocks_in_khz / 1000.0)
> -			* ddr4_dram_factor_single_Channel / 1000.0;
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 =
> -			dc->dcn_soc->number_of_channels *
> -			(fclks.data[vmax0p9_idx].clocks_in_khz / 1000.0)
> -			* ddr4_dram_factor_single_Channel / 1000.0;
> -	} else
> -		BREAK_TO_DEBUGGER();
> -
> -	res = dm_pp_get_clock_levels_by_type_with_voltage(
> -			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
> -
> -	if (res)
> -		res = verify_clock_values(&dcfclks);
> +	if (dcfclks->num_levels >= 3) {
> +		dc->dcn_soc->dcfclkv_min0p65 = dcfclks->data[0].clocks_in_khz / 1000.0;
> +		dc->dcn_soc->dcfclkv_mid0p72 = dcfclks->data[dcfclks->num_levels - 3].clocks_in_khz / 1000.0;
> +		dc->dcn_soc->dcfclkv_nom0p8 = dcfclks->data[dcfclks->num_levels - 2].clocks_in_khz / 1000.0;
> +		dc->dcn_soc->dcfclkv_max0p9 = dcfclks->data[dcfclks->num_levels - 1].clocks_in_khz / 1000.0;
> +	}
> +}
>   
> -	if (res && dcfclks.num_levels >= 3) {
> -		dc->dcn_soc->dcfclkv_min0p65 = dcfclks.data[0].clocks_in_khz / 1000.0;
> -		dc->dcn_soc->dcfclkv_mid0p72 = dcfclks.data[dcfclks.num_levels - 3].clocks_in_khz / 1000.0;
> -		dc->dcn_soc->dcfclkv_nom0p8 = dcfclks.data[dcfclks.num_levels - 2].clocks_in_khz / 1000.0;
> -		dc->dcn_soc->dcfclkv_max0p9 = dcfclks.data[dcfclks.num_levels - 1].clocks_in_khz / 1000.0;
> -	} else
> -		BREAK_TO_DEBUGGER();
> +void dcn_get_soc_clks(
> +	struct dc *dc,
> +	int *min_fclk_khz,
> +	int *min_dcfclk_khz,
> +	int *socclk_khz)
> +{
> +	*min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
> +	*min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
> +	*socclk_khz = dc->dcn_soc->socclk * 1000;
>   }
>   
> -void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
> +void dcn_bw_notify_pplib_of_wm_ranges(
> +	struct dc *dc,
> +	int min_fclk_khz,
> +	int min_dcfclk_khz,
> +	int socclk_khz)
>   {
>   	struct pp_smu_funcs_rv *pp = NULL;
>   	struct pp_smu_wm_range_sets ranges = {0};
> -	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
>   	const int overdrive = 5000000; /* 5 GHz to cover Overdrive */
>   
>   	if (dc->res_pool->pp_smu)
> @@ -1546,10 +1532,6 @@ void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
>   	if (!pp || !pp->set_wm_ranges)
>   		return;
>   
> -	min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
> -	min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
> -	socclk_khz = dc->dcn_soc->socclk * 1000;
> -
>   	/* Now notify PPLib/SMU about which Watermarks sets they should select
>   	 * depending on DPM state they are in. And update BW MGR GFX Engine and
>   	 * Memory clock member variables for Watermarks calculations for each
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> index 806f3041db14..9e4ddc985240 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> @@ -628,8 +628,23 @@ unsigned int dcn_find_dcfclk_suits_all(
>   	const struct dc *dc,
>   	struct dc_clocks *clocks);
>   
> -void dcn_bw_update_from_pplib(struct dc *dc);
> -void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc);
> +void dcn_get_soc_clks(
> +		struct dc *dc,
> +		int *min_fclk_khz,
> +		int *min_dcfclk_khz,
> +		int *socclk_khz);
> +
> +void dcn_bw_update_from_pplib_fclks(
> +		struct dc *dc,
> +		struct dm_pp_clock_levels_with_voltage *fclks);
> +void dcn_bw_update_from_pplib_dcfclks(
> +		struct dc *dc,
> +		struct dm_pp_clock_levels_with_voltage *dcfclks);
> +void dcn_bw_notify_pplib_of_wm_ranges(
> +		struct dc *dc,
> +		int min_fclk_khz,
> +		int min_dcfclk_khz,
> +		int socclk_khz);
>   void dcn_bw_sync_calcs_and_dml(struct dc *dc);
>   
>   enum source_macro_tile_size swizzle_mode_to_macro_tile_size(enum swizzle_mode_values sw_mode);

