Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C112274E851
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900910E32B;
	Tue, 11 Jul 2023 07:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB10C10E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjOTEOs77A0APk2DOpZEqWGbhI2MzDr2aoBM9UmywkwUn6us5vz9ghMrWce6GePkALLasZCNUv53DhzlK5STxkDhh1WHGyq+n7mCUsB6fJFDQasYiLL6iD/U/GfsxP9xDyViAKy1ly9T4eGiSqju46yfgLVIiy1H/y4QPTcyUOCut5pFQrUB/BRe5Y6TL10t9vYL9mMvNHLyGWPKJrKwc/CdmM76j/9sutLDod2LUje9m0G34voGBn/yIy3XRWRjMfXcZmFOba/0oHzjGxTxJ0yk60xj9bi/CMcOOgvL6OxSqQYLN8x1ezNL51RNAIGosjMm7q5yFgTcqzoSimd2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8LW+siAm8IOGtqsWmSXdh4k15lvWGp/CPYLi47ORXs=;
 b=j2HkyGGqlzdUqDPqaTLPgySNxHLTCN0zmexeUCvLNwufq43bEnu00ryQBa99MtmVETmS5ihprFtYLZ4IRZvel9uxOFCMs24m/4jPm0aVK+LR76hkNgY7wgiN+rgCfPhIx+XYZgdKeyyLvFb795qqCpsxWiV6qBZTvu2TQfwr5VLeNsAeEJCwBqKrEL1VyvJmpNQzSONjj+CIMMQQBKgExOzW7RRJ+CtHlFkKLtPCPDgs36lR30M/2ndgfEUNy4qoqlHzNNGR1Oe7M5Asy3e6E4a1KGCzwDiqJFj+KEy7DFvMGdwmz1VCy2WTrMCv6U4g3oo/+ff80Dvolja8z3jwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8LW+siAm8IOGtqsWmSXdh4k15lvWGp/CPYLi47ORXs=;
 b=YKLYwcceGL6RZGbrUrCMR2TULVkeTHgM3DRusSuP6m34LC9klcLdTVIWlgjeJBbNHOFrk8nwEmf92PaNsLNYpxWONcupWh/p0+IsQu9uiRudadCorH/pkAw0L97osmD/TVu8LFCkAWHT+WzYA1O+of0k5uYYELg5YwNC5EGxjD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 07:46:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 07:46:45 +0000
Message-ID: <501a3dd6-d313-a03c-4bd1-74f4d27d0487@amd.com>
Date: Tue, 11 Jul 2023 09:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/scheduler: Add missing RCU flag to fence slab
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230710205625.130664-1-robdclark@gmail.com>
 <3bcebac5-81d8-79a5-cdfb-48db782ec206@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3bcebac5-81d8-79a5-cdfb-48db782ec206@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 39aba24b-90f4-4300-7902-08db81e2f94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7K2ZZMICbdjBvsiCBM4pP+Y/QssNo/G1Qovq+OrDv6k3s7zNNoniFUJDKGXV+Ccn1yAEM8MRn89bMbP7QaATI5cJJ2C7itfqaMTNs7/KuYE/DB9Z9iPupgBAKhvE9R0sXBIk8T0HWC3DVZJ4xBYhljj4jqVkYE6IsInCSOfEjBDayZTkvasQ1TGRegxDZch1nZmIcwP/zur6ra6xAXWqfd47QiAv/WZARNwKxm/K7Hy+qTJ35wqlby/EDj3DFiaQVDgJqMYNshBxXDVp5u0zzI86fgo4DeKvy8wHHHeGbfa8pNFT+r4SZuHuRlxj2D8r49tedr1T/++bFu2bmADVVzn9IjQwnNOmMA5ibgSnAOifcGdt3CXLJYk0GPr7ngy774yfKb/twBAFve+LsENvUdftkYqfUFjlJduBeUmypT6o0Pn7uR7WOqMX8KNFjaM7qkYxKDgKgcrWfMQsRWaZtlUOjTUn2WutW/HcAV8gWiOLULW3wgyk2d/hmThDIU98Ple6Ie00RVkSAdP9KCnuxgPfGg3XSJIQwIZbNmWAR5jDlVammIPUnmHpO0qLTX1/bnqwwE760HdCGHC5LA5CrhtxgWlC8iBkWCB8tRajkp6QO4R7waCz6TFyHCw4kNlFMWsxY433FsuBSJt3I4pBQzqqQufco2KRL5bEo1dDjvwpUP6hl2K6yngTKHfINTUG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6666004)(6486002)(54906003)(110136005)(6506007)(186003)(6512007)(53546011)(2616005)(5660300002)(66556008)(316002)(2906002)(66946007)(8936002)(8676002)(66476007)(83380400001)(4326008)(478600001)(41300700001)(45980500001)(43740500002)(505234007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU1JV2VkV0J2Wmw4RVNCNjVvZW1ZOEVWK3krc29GMUJQaEI1dFZkRy9BWkM1?=
 =?utf-8?B?UWw5UGV6ZWplZzZqOTFjLzRMNFdKZmEzenI5Zy9ZNlQwb3MzczhaSEYyTWVa?=
 =?utf-8?B?WEtwZEp3VFBRYTdWOE5acHlvOWNIUWFYQnllYkZpaDVnOEdqRnN2YXB2WFAv?=
 =?utf-8?B?M0lxY2VhdkNJOSthUzhKUDVnaEFWVE1xYXFjVk5hdVlldmYyR0lROTRLS0N5?=
 =?utf-8?B?b0dva3QrSXZzbzNVRWhVRzI1TE5HREFmT0tvbUcxbDZONXQ5a21jWGJIWHA4?=
 =?utf-8?B?VVBuaDBxUkl3bDlNYm4zL2ZqNm8xbUY0MEFEa0N1d1NLVDVKOEQrMEtlRzBM?=
 =?utf-8?B?bCtpR2tKSkpCVUcvLzhIOGtiSjg4K1p3TTZqb1haNnVRZjhWMHd3SnE3NEk4?=
 =?utf-8?B?dklOdkJSUHU4OFRBR1hjemRLTmdsUFhQMDRSd0tPZ1VZYlBxcDVLOG5DVzNy?=
 =?utf-8?B?Qy9NeVpKYXVwcEl1V1R1eGQxT1pjejUrNVN4NlYva1RPTW1SRUxUWTBrRm04?=
 =?utf-8?B?RXRGWWJqNi92VFdxWnpta3dwTGdRUzkzeVppZ3kyTkFmWmhNQWFNdzJ5SDEv?=
 =?utf-8?B?eXBMTHFMQnpJaDVTODVBVnFzU0J4RFRkVWJ4T3VkZzRpUkZTQ25NSDFydkI2?=
 =?utf-8?B?dVlIUExocFVMVHRLQ1ZvcVNRaDJYQXJRTUh6L0s0L1hob09pZ3pZendmQ2J6?=
 =?utf-8?B?OGxaSXFXOU5lejRXZGZOUktCS1JiSmZiVVJBN1MwOWpacXFGU1lDNDZhcW1n?=
 =?utf-8?B?NjhzSU1LT1dNKzd6bEd3enhuVjh2eUxyY01uYzhjelRVRTJDZk9HTG5ESWtj?=
 =?utf-8?B?dVpiSXFuWnY3bjZRUHB4bmh2ODNXbjd6RlVEZ29PV3dQZzJ4WGwyVFd1WlVJ?=
 =?utf-8?B?S3pzNUhWQ21LMGR1eEZzVFh5SEpwejFoQ0hCbHkzam5QRVVIMkl3OUNkSjV1?=
 =?utf-8?B?cWFmeUFlYXY5N0lTZXBNZFBZSWdQTVZmUmwwb1lIdzNpV1dUZjVaeThERVFJ?=
 =?utf-8?B?bmVkQnRQYlF1cExjTktHdVZjMVpSenF5ek9RMzV2S2JtaEFyVWVkYWM5TmR2?=
 =?utf-8?B?enJnK2ZYTkl0c2pFY1EraW41czB6cWpGaTBzMEQwSG9KbXlFaG54dDNyTytu?=
 =?utf-8?B?UHlEdExENWt6Wkp1YURDZzJOWXEyNEc1elZYbnczd3hiV2pQWWhNd2RZR08y?=
 =?utf-8?B?MFJQZ1hETTI1QUxoa2RFRS92WmVITnFxTDJtLy9JN3dFU1ZxQmpWQXBaQWww?=
 =?utf-8?B?MzRNS2c1bDBmUHBWcVZLMVBUWFlINDhYYWpEY3hmTFlBZXcvTU9PQk8wNENS?=
 =?utf-8?B?cnRPZ0pna0phR2diZW5Ga042ME5aUnVNMUM2V09ja2FIZnRFSjFzNCs3SlRB?=
 =?utf-8?B?ZWRYVWZBNUZwaGh1QW1LTXhuZUM0WnFpLzZoNkxsaVk5UXgwS0tpUzR0V3Nm?=
 =?utf-8?B?eUNoQXErWHd3VXJVMnE1aFVsVnZMUDFDYkZnNDlqTHJLYnNXbDlld3NuN2J1?=
 =?utf-8?B?c3R6eU14SVhUUnIrL2hoMUYyZW9oZ2hjT2pUTW5iRzNwelV2MzBLcjMzbmdN?=
 =?utf-8?B?MWZrbkwxb3lwL2NEY25JVjMvdHNyYXlOdCt1VlBDSFRxY09TVmYySFd6T0Zs?=
 =?utf-8?B?MWFvdXRlSGpFZnloOU5sV2h0cHVCZUQrV1JXYlJUY2xUVkpaK1hsTXpiQmdH?=
 =?utf-8?B?RHNDbmI4Sll5aTdVdm50ekZaTWxRYU80SHlzZTB3UmFqTWI3ZnFjQ2pTbm1o?=
 =?utf-8?B?VnBJL1B1eTdGWnFwSnBTeUtaZWNUSUl3eG9ra2l1RWhTalR2V2piUU1YQTZN?=
 =?utf-8?B?Q2NscTNYVzFSeUhnRXhRRytST3lNcWNXWjIvUkpPcnMvaHA0bVE4aHkxT1B4?=
 =?utf-8?B?SW5xZmZEUjM0Z3NnWGRxakd3QTBPNlNMZ1F0cXJIY25rL2NXR2hCMW9UdEN5?=
 =?utf-8?B?cGs4Q2xodU9IVEhkZWVoQUVyb2xwRW1WRXpiNmwwSUt5elIrUGhaekNwaW96?=
 =?utf-8?B?ODFscE5UNzdQZzdEMy9wQmxXTGtvS1pTN1cxZzVMZnZpazVjcUc5bGJNQ1l6?=
 =?utf-8?B?aEVxU1Q3VGFUVDJpQXVwRm5rUFpRWjBNNm9TYUFrNEVJMm90Tlc0WmF4SEVE?=
 =?utf-8?B?TU5pdDlrV3B6S21mNGU2Rk9iQ0s0MlorajlEMjBkRVdyQmRaMDVQSm1Yejdx?=
 =?utf-8?Q?f20fzHvtFM9VXkiXzhpLfpCup0zl17VCNWgtoh21hmfU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aba24b-90f4-4300-7902-08db81e2f94c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 07:46:45.0047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vNz2pZclEBacMkvG+Y3xujfNj2J3WQYwrS9BzPI5kQSGF1SODU4YgiEZSkySg2T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
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
Cc: Rob Clark <robdclark@chromium.org>, Alexander Potapenko <glider@google.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.07.23 um 23:15 schrieb Luben Tuikov:
> On 2023-07-10 16:56, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Fixes the KASAN splat:
>>
>>     ==================================================================
>>     BUG: KASAN: use-after-free in msm_ioctl_wait_fence+0x31c/0x7b0
>>     Read of size 4 at addr ffffff808cb7c2f8 by task syz-executor/12236
>>     CPU: 6 PID: 12236 Comm: syz-executor Tainted: G        W         5.15.119-lockdep-19932-g4a017c53fe63 #1 b15455e5b94c63032dd99eb0190c27e582b357ed
>>     Hardware name: Google Homestar (rev3) (DT)
>>     Call trace:
>>      dump_backtrace+0x0/0x4e8
>>      show_stack+0x34/0x50
>>      dump_stack_lvl+0xdc/0x11c
>>      print_address_description+0x30/0x2d8
>>      kasan_report+0x178/0x1e4
>>      kasan_check_range+0x1b0/0x1b8
>>      __kasan_check_read+0x44/0x54
>>      msm_ioctl_wait_fence+0x31c/0x7b0
>>      drm_ioctl_kernel+0x214/0x418
>>      drm_ioctl+0x524/0xbe8
>>      __arm64_sys_ioctl+0x154/0x1d0
>>      invoke_syscall+0x98/0x278
>>      el0_svc_common+0x214/0x274
>>      do_el0_svc+0x9c/0x19c
>>      el0_svc+0x5c/0xc0
>>      el0t_64_sync_handler+0x78/0x108
>>      el0t_64_sync+0x1a4/0x1a8
>>     Allocated by task 12224:
>>      kasan_save_stack+0x38/0x68
>>      __kasan_slab_alloc+0x6c/0x88
>>      kmem_cache_alloc+0x1b8/0x428
>>      drm_sched_fence_alloc+0x30/0x94
>>      drm_sched_job_init+0x7c/0x178
>>      msm_ioctl_gem_submit+0x2b8/0x5ac4
>>      drm_ioctl_kernel+0x214/0x418
>>      drm_ioctl+0x524/0xbe8
>>      __arm64_sys_ioctl+0x154/0x1d0
>>      invoke_syscall+0x98/0x278
>>      el0_svc_common+0x214/0x274
>>      do_el0_svc+0x9c/0x19c
>>      el0_svc+0x5c/0xc0
>>      el0t_64_sync_handler+0x78/0x108
>>      el0t_64_sync+0x1a4/0x1a8
>>     Freed by task 32:
>>      kasan_save_stack+0x38/0x68
>>      kasan_set_track+0x28/0x3c
>>      kasan_set_free_info+0x28/0x4c
>>      ____kasan_slab_free+0x110/0x164
>>      __kasan_slab_free+0x18/0x28
>>      kmem_cache_free+0x1e0/0x904
>>      drm_sched_fence_free_rcu+0x80/0x9c
>>      rcu_do_batch+0x318/0xcf0
>>      rcu_nocb_cb_kthread+0x1a0/0xc4c
>>      kthread+0x2e4/0x3a0
>>      ret_from_fork+0x10/0x20
>>     Last potentially related work creation:
>>      kasan_save_stack+0x38/0x68
>>      kasan_record_aux_stack+0xd4/0x114
>>      __call_rcu_common+0xd4/0x1478
>>      call_rcu+0x1c/0x28
>>      drm_sched_fence_release_scheduled+0x108/0x158
>>      dma_fence_release+0x178/0x564
>>      drm_sched_fence_release_finished+0xb4/0x124
>>      dma_fence_release+0x178/0x564
>>      __msm_gem_submit_destroy+0x150/0x488
>>      msm_job_free+0x9c/0xdc
>>      drm_sched_main+0xec/0x9ac
>>      kthread+0x2e4/0x3a0
>>      ret_from_fork+0x10/0x20
>>     Second to last potentially related work creation:
>>      kasan_save_stack+0x38/0x68
>>      kasan_record_aux_stack+0xd4/0x114
>>      __call_rcu_common+0xd4/0x1478
>>      call_rcu+0x1c/0x28
>>      drm_sched_fence_release_scheduled+0x108/0x158
>>      dma_fence_release+0x178/0x564
>>      drm_sched_fence_release_finished+0xb4/0x124
>>      dma_fence_release+0x178/0x564
>>      drm_sched_entity_fini+0x170/0x238
>>      drm_sched_entity_destroy+0x34/0x44
>>      __msm_file_private_destroy+0x60/0x118
>>      msm_submitqueue_destroy+0xd0/0x110
>>      __msm_gem_submit_destroy+0x384/0x488
>>      retire_submits+0x6a8/0xa14
>>      recover_worker+0x764/0xa50
>>      kthread_worker_fn+0x3f4/0x9ec
>>      kthread+0x2e4/0x3a0
>>      ret_from_fork+0x10/0x20
>>     The buggy address belongs to the object at ffffff808cb7c280
>>     The buggy address is located 120 bytes inside of
>>     The buggy address belongs to the page:
>>     page:000000008b01d27d refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10cb7c
>>     head:000000008b01d27d order:1 compound_mapcount:0
>>     flags: 0x8000000000010200(slab|head|zone=2)
>>     raw: 8000000000010200 fffffffe06844d80 0000000300000003 ffffff80860dca00
>>     raw: 0000000000000000 0000000000190019 00000001ffffffff 0000000000000000
>>     page dumped because: kasan: bad access detected
>>     Memory state around the buggy address:
>>      ffffff808cb7c180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>      ffffff808cb7c200: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
>>     >ffffff808cb7c280: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                                                                     ^
>>      ffffff808cb7c300: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
>>      ffffff808cb7c380: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
>>     ==================================================================
>>
>> Suggested-by: Alexander Potapenko <glider@google.com>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index ef120475e7c6..b624711c6e03 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -35,7 +35,7 @@ static int __init drm_sched_fence_slab_init(void)
>>   {
>>   	sched_fence_slab = kmem_cache_create(
>>   		"drm_sched_fence", sizeof(struct drm_sched_fence), 0,
>> -		SLAB_HWCACHE_ALIGN, NULL);
>> +		SLAB_HWCACHE_ALIGN | SLAB_TYPESAFE_BY_RCU, NULL);
>>   	if (!sched_fence_slab)
>>   		return -ENOMEM;
>>   
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>
> But let it simmer for 24 hours so Christian can see it too (CC-ed).

Well that won't work like this, using the the SLAB_TYPESAFE_BY_RCU flag 
was suggested before and is not allowed for dma_fence objects.

The flag SLAB_TYPESAFE_BY_RCU can only be used if the objects in the 
slab can't be reused within an RCU time period or if that reuse doesn't 
matter for the logic. And exactly that is not guaranteed for dma_fence 
objects.

It should also not be necessary because the scheduler fences are 
released using call_rcu:

static void drm_sched_fence_release_scheduled(struct dma_fence *f)
{
         struct drm_sched_fence *fence = to_drm_sched_fence(f);

         dma_fence_put(fence->parent);
         call_rcu(&fence->finished.rcu, drm_sched_fence_free_rcu);
}

That looks more like you have a reference count problem in MSM.

Regards,
Christian.
