Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834CA601188
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 16:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252E10E2B8;
	Mon, 17 Oct 2022 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4080A10E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 14:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkfHFJDwQ7tu+K3QjGhs0rxNZoSTvGQYfHv2qgf61EfME0dTIZ6YwlOhmtAlPw+u8oTZU5Lr0lA5L6SGczZtMh4V2pdwb1RtgYdCYeY/JA9zmn5wC4jTzy8vHozbdWnybeAO78w+f2rqSucS1HRGFThvTAP1Q1MfcHjGpVXk6CviHbVTo+dVZOaQXVU3xbu5J2QSh89rKRsAgY9jvKsC4b0lj4OIJ3u4+mD3FggGEy+lsamZ/K6hwg3dByjctczYTvOOqE1KOEmSAoQiAhIc1o0/M9bSA+2bIxL86hKM/z2aGqwFttGOD921dYC16xgJgnre95Cucrco/16Tj1abGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAYgC2VQeV0vA8Zrc6toZCKECgJxWOZrY/hrg1OApqI=;
 b=KQuqWuH1IRoY0Aet1T3tt7UCi0Hn/Vut+gTnzd0EqFvSHWnRtmeBkAS3HDYuEJb2pgYN9tUPi/yt9z7+ATuh4YqJUpdOUIZ+t1K8UqD+dLm/WQ2m3XZElNi0H+yMZyJUvoZXF3QAU0KWBcUwtQ0KNuBHGZInMHfgTsuAzHQqLRGz57OyBUIKnYx0rGlrD9+6Y8v7xvpnQi7qXvRFEgQdzcrH3Fwwr1OlzWCKya8s9T/cLyWUrHpkTwIaBv5u/DdS94WzlAVQJ5NAcISwB88qsevXnjx1JBmF7009P7R+wNhFLeGKfpndabdFcxLyi8Z9bsPqF9EGiSPeOXRtMDPmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAYgC2VQeV0vA8Zrc6toZCKECgJxWOZrY/hrg1OApqI=;
 b=PUNfIoFIufG4T1XN6LyLr9Fpt1x0ys4jMkflJYwRf73hp3pMhbr+9XqmUnxpY3dGKDDhtzNePU6IRBHjmBhPTNpZ6YKWhWo3RyPJVKNQj0tpw8+xefMzX7pbB6ahFdTwJXx5fhZhWqBlOXwDxeNeiLSZTSJL/WVCd7RmSgr5BK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 14:50:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 14:50:46 +0000
Message-ID: <f03c1b59-e024-40d8-5fee-02d8d660a058@amd.com>
Date: Mon, 17 Oct 2022 16:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/sched: Fix kernel NULL pointer dereference error
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 steven.price@arm.com
References: <20221017143006.2419-1-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221017143006.2419-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0361.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4b0ef2-1f68-41af-7758-08dab04ef953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gXxCTSxZe8kDAQPlAj0c6DqzLT3ttkl4gkvGAQXz7Jf4Q4oR+muldJa2aXSak5A2uzKGjnfQMkeBIa42fGWrjarOQhTZ/nnVHOHuVDgPkAuhw/cDcvXJ0Uzkq8eLZqZH9/u1h3H3pblx24xAUSflrURhLv5zQLDgG6xxTuTB7+Cwo9c9dDLqlehbfRcTajoDRRXxMCqERsL0dE/bObLyrA/+O8vA0j8y7D5nKLowl24hPdb9MKmRXcfCGx/r3mY+YeIHPWwzZUG7vhFu7oWYRpNvUiPIUkWQN3OxKHem7wAnH1CWhn9Jhl+52+qakpFdO2vPk1LCTMH2xleTlAap0oZXMO3nC/QqqXAk7xt/UzxjEYNyJjBNfamIGrWqTzjZ/JMBsYzqoEX/+ns2XWVPPGnALn8mOvqqlHB2SAUTjdCvvF7EAYJ69ndB+ipklybzvAVAiZYV6KVoPqGjbz4hhb4IXqX1o8idlRS85qXWSqusvO2QUHybsgikLjnR591FOCKAKzskmWgoD96rZk9YbMM4pU1j2U2BNHk8zkdS4CI+ZKVh4q9WUktkRdaNM9tuTlmY/MrCIofgikaB10gJbh01DSdyMzIIJBDOZsf+9NaGRF1nMg3ZU4+GeMypr/NtrMjEvEbj6Ap4HOO406EKm/MMvmPoilFpA1wOrKR1cmriYURNO/gnNstnARUjI9QkK/KVRNxTZUkd2omIhyPBVSDPkylrE1AiUAetwFK00xULrk+JVlnf19GbvwKMNC7YErL6rNCoSAClRKdaxXCs7PmiQiMpUYCbaVhSeXIAkzro4/vkw/7S04phv1TxrTNx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199015)(921005)(36756003)(86362001)(31696002)(38100700002)(6666004)(83380400001)(66946007)(66556008)(316002)(31686004)(8676002)(30864003)(5660300002)(6486002)(186003)(2906002)(66476007)(2616005)(8936002)(6506007)(478600001)(6512007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFKdnMxRGg1UWtyVlRVcFM1NHpRWk83azNvd0dSelpBdVlPME4vQjlneVgy?=
 =?utf-8?B?R01BV3B0ZW8xRWMxYXRXcUUyYktZNTIvZXYvRHhuRGRsREF1dVFML2xwSGRB?=
 =?utf-8?B?T255M3p1TWVUcmswc2FSNDcxYlE0R0RXeDUrYnRNMWlaUFJPdThZUS9zYW1o?=
 =?utf-8?B?WjNDTG1Mczc5cVhwL2FIQWtsbEhzZ1hxMTB6OE9ick9yblZLQ0pMZitnWW9B?=
 =?utf-8?B?YzhwQUZVdENncFlBNmQvd3RhT3d0dkVnWmN0U2lMZkxjbHZhNk80QytwR2Mr?=
 =?utf-8?B?Rk90QWVIOXY5M3JuTnNZTWRDYVlvNk9USzlzSmJDNUIzcFFzVTV2a2UzNStG?=
 =?utf-8?B?SHRHK2dBTWlwbFlGc3hlZFdNdjcvTXNtT3pHSkdjVUswZzVuSDVQNzl3d01m?=
 =?utf-8?B?Z3RFMitEVWNjSThFaDBJUUtDUFo0bEE0SWhUalppT1pNSjkvZ05KM1FrcjA2?=
 =?utf-8?B?UEJ5amFMbVRTbGJoRjZFT2pGYzBsTDJJT3hTMVVERFAwc1Q5RnRlbWxkMDFP?=
 =?utf-8?B?R3J3ZzR4aVpuV1o4RW1Ca3NGaHl0SlBTMUNhWEs0bEgweE1sZHlib3JGMElD?=
 =?utf-8?B?QVRWeWNVdmFnTnlGdUkzdWdTTis2YTR0eDk3OGpBbXZma2Y0dDYwQ1o0eXhH?=
 =?utf-8?B?NzFtTms3YSsrSlpNbjBEZHhhc3B2VEhUYjJZZG9Hbm5qWWkzajRxZVlGVytB?=
 =?utf-8?B?emY4NjUySWVIcHFTMmZ4WjQzWXMyWU4wM3NBZGZROWROZk9WM3JYWXJOa0Ns?=
 =?utf-8?B?UTVrMGJMemVIWVRWV2xVcDNkMm9TTWF6ZlkwUHZJMjBkRlBJeG9aRENMOENz?=
 =?utf-8?B?ODU4RmQ4U2Fnc25BaFZwWFoxTWJuakdEM1liM3pWTExtRVB1RVY1N2pXOTFx?=
 =?utf-8?B?K28rYkxqNUk5bDVHb2xBdW5CU01QUnlzWm02eGpES2dtaTBxMEcvdE83UTlP?=
 =?utf-8?B?RVlFQ1NpOEdVNVZaVklqaDVxUGIwa1NOWVpkQW5PWHp0NTdZK0ZoL0RyZE1v?=
 =?utf-8?B?Z1JQWVo5N0wyTjgyYldDbHdvbGJxMk5HRHEwV1V1MXQ3ZDdsQkNtRVlJWjg1?=
 =?utf-8?B?Yk9LRlZmbEFrSS9jZEdqbi9lWXI5VCthK0pZS0RMQjNhSC9VdWwxeVhEanRj?=
 =?utf-8?B?MXJvVTVVNkN4cmJZSmZtR1BueTgyN0NRNEhCT0V3SHpOM1lZNnpTT2crVnlB?=
 =?utf-8?B?UE9ySkRVc05zUDhIdlg1SnhCSnFWRHlPU3M5MExjZXFYdmZiL3NZZm5zQUZS?=
 =?utf-8?B?aFdVZFBRclpwYjNpVUFld2xmeUxRclpSTW9rZnYydklIbTdiUlVEY1FucE55?=
 =?utf-8?B?TU84NEhoQ0hFbG9Tay9ZcTBLRzN1K0Qxck5GYjVVd0pXM1pOalovQXBUcCtk?=
 =?utf-8?B?b3RPcGRjemxibkYycm5ZeGZOd2U4Y3dwMVNoMElWV3g4WmtnT2h3WklBWjlR?=
 =?utf-8?B?L1BFOTQxWFBYbXpJazI1RWFiNm9iQUtrOHc3QkNaMUNUdFlWT2VXOFdzc1ph?=
 =?utf-8?B?c1JyUFdLWlh1eEJtcXpOZkIvN3BBWDkvazNDQlR0UUY5WXdpTjFyVGRLV1li?=
 =?utf-8?B?UjAvK2tMNnRjVlZuMkNTeGJLb1lEeTlUVUd2cUJKc3VxVlFDdFZUMmpSYTls?=
 =?utf-8?B?SGprQm1qNXFrdmZ4eDNlRVM4SG1QWHNSQXBKUFBtdDNWNXR6VnBJTmJRNWVp?=
 =?utf-8?B?cUJZcGt1V2psK3Y0V25xYzFHRVlWeHRqWTl1bS9LMzYxL1g5TWhjYXc5MkZY?=
 =?utf-8?B?UVRBNXYxdG5sSlZhempnS2VEMjc0ZjR0cGo2OG0rYk5SVGZUVDJjb1dBcDVp?=
 =?utf-8?B?WkE0cWF1NUpvVFo2TFBZdUM1MmZrZXNrRXUvNVhjam1IUDNhR2JLc0VtQThi?=
 =?utf-8?B?K1BrSVFuRm12cSs4RkptL0NmTnkyV1Y1cFRpOVJoeW1DSnc5K3hjNW5WOFh3?=
 =?utf-8?B?cTN3QXlZRDBjeWRiUWlxZkRVWlp5QnpXaUQyZmVZMXpYUm1kSG5UcFNqWmY4?=
 =?utf-8?B?azdLdmdNL0JSdVI2NWt1UXJ5WmNZbFVKWlBJeXVKQmpxWmxmR214SzBQRVlX?=
 =?utf-8?B?enZHUTg0bFNxYVZSeXRPbWZwbWIxOEhyajVrNFpwZkRjMXJ0czc4KzNvcml1?=
 =?utf-8?B?blJTd0ZJWWw1WEdWckhQN2tFaGMzSTJmUytiUkdMUUg5TEIwNEJMR0I2RlJt?=
 =?utf-8?Q?OSkgLLPMYevvdorWos+lsV58BRj39GBnKtjWQxBbRHE/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4b0ef2-1f68-41af-7758-08dab04ef953
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 14:50:46.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnOx5HYS+MHOPmuTJ7b1YjLvhJu2Q+XCw7NxL1jF7DTa8XHtHVUmC4J9pjzvKWXh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Am 17.10.22 um 16:30 schrieb Arvind Yadav:
> -This is purely a timing issue. Here, sometimes Job free
> is happening before the job is done.
> To fix this issue moving 'dma_fence_cb' callback from
> job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).
>
> - Added drm_sched_fence_set_parent() function(and others *_parent_cb)
> in sched_fence.c. Moved parent fence intilization and callback
> installation into this (this just cleanup).
>
>
> BUG: kernel NULL pointer dereference, address: 0000000000000088
>   #PF: supervisor read access in kernel mode
>   #PF: error_code(0x0000) - not-present page
>   PGD 0 P4D 0
>   Oops: 0000 [#1] PREEMPT SMP NOPTI
>   CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
>   Arvind : [dma_fence_default_wait _START] timeout = -1
>   Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
>   RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
>   Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
>   RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
>   RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
>   RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
>   RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
>   R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>   R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
>   FS:  0000000000000000(0000) GS:ffff8a48a0a80000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
>   Call Trace:
>    <IRQ>
>    drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>    dma_fence_signal_timestamp_locked+0x7e/0x110
>    dma_fence_signal+0x31/0x60
>    amdgpu_fence_process+0xc4/0x140 [amdgpu]
>    gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
>    amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
>    amdgpu_ih_process+0x86/0x100 [amdgpu]
>    amdgpu_irq_handler+0x24/0x60 [amdgpu]
>    __handle_irq_event_percpu+0x4b/0x190
>    handle_irq_event_percpu+0x15/0x50
>    handle_irq_event+0x39/0x60
>    handle_edge_irq+0xaf/0x210
>    __common_interrupt+0x6e/0x110
>    common_interrupt+0xc1/0xe0
>    </IRQ>
>    <TASK>
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>
> Changes in v2: Moving 'dma_fence_cb' callback from
> job(struct drm_sched_job) to scheduler fence(struct drm_sched_fence)
> instead of adding NULL check for s_fence.
>
> Changes in v3: Added drm_sched_fence_set_parent() function(and others *_parent_cb)
> in sched_fence.c. Moved parent fence intilization and callback
> installation into this (this just cleanup).
>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 53 +++++++++++++++++++++++++
>   drivers/gpu/drm/scheduler/sched_main.c  | 38 +++++-------------
>   include/drm/gpu_scheduler.h             | 12 +++++-
>   3 files changed, 72 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 7fd869520ef2..f6808f363261 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -77,6 +77,59 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>   	if (!WARN_ON_ONCE(!fence))
>   		kmem_cache_free(sched_fence_slab, fence);
>   }

Please add an empty line here.

> +/**
> + * drm_sched_job_done_cb - the callback for a done job
> + * @f: fence
> + * @cb: fence callbacks
> + */
> +static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)

Probably best to rename this to something like drm_sched_fence_parent_cb().

> +{
> +	struct drm_sched_fence *s_fence = container_of(cb, struct drm_sched_fence,
> +						       cb);
> +	struct drm_gpu_scheduler *sched = s_fence->sched;
> +
> +	atomic_dec(&sched->hw_rq_count);
> +	atomic_dec(sched->score);
> +
> +	dma_fence_get(&s_fence->finished);

We should probably make sure that this reference is taken before 
installing the callback.

> +	drm_sched_fence_finished(s_fence);
> +	dma_fence_put(&s_fence->finished);
> +	wake_up_interruptible(&sched->wake_up_worker);
> +}
> +
> +int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
> +				  struct drm_sched_fence *s_fence)
> +{
> +	return dma_fence_add_callback(fence, &s_fence->cb,
> +				      drm_sched_job_done_cb);
> +}
> +
> +bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence)
> +{
> +	return dma_fence_remove_callback(s_fence->parent,
> +					 &s_fence->cb);
> +}

Do we really need separate functions for that?

> +
> +/**
> + * drm_sched_fence_set_parent - set the parent fence and add the callback
> + * fence: pointer to the hw fence
> + * @s_fence: pointer to the fence

Reverse the parameter order, s_fence is the object we work on.

> + *
> + * Set the parent fence and intall the callback for a done job.

You need to document that we take the reference of the parent fence.

> + */
> +int drm_sched_fence_set_parent(struct dma_fence *fence,
> +			       struct drm_sched_fence *s_fence)
> +{
> +	if (s_fence->parent &&
> +	   dma_fence_remove_callback(s_fence->parent, &s_fence->cb))
> +		dma_fence_put(s_fence->parent);
> +
> +	s_fence->parent = dma_fence_get(fence);
> +	/* Drop for original kref_init of the fence */
> +	dma_fence_put(fence);

This leaks the reference to the old parent and the get/put dance is not 
optimal either.

Better do something like this.

/* We keep the reference of the parent fence here. */
swap(s_fence->parent, fence);
dma_fence_put(fence);


> +	return dma_fence_add_callback(fence, &s_fence->cb,
> +				      drm_sched_job_done_cb);
> +}

When installing the callback fails we usually call the callback function 
instead of returning the error.



>   
>   /**
>    * drm_sched_fence_free - free up an uninitialized fence
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4cc59bae38dd..cfb52e15f5b0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -253,13 +253,12 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   
>   /**
>    * drm_sched_job_done - complete a job
> - * @s_job: pointer to the job which is done
> + * @s_fence: pointer to the fence of a done job
>    *
>    * Finish the job's fence and wake up the worker thread.
>    */
> -static void drm_sched_job_done(struct drm_sched_job *s_job)
> +static void drm_sched_job_done(struct drm_sched_fence *s_fence)
>   {
> -	struct drm_sched_fence *s_fence = s_job->s_fence;
>   	struct drm_gpu_scheduler *sched = s_fence->sched;
>   
>   	atomic_dec(&sched->hw_rq_count);
> @@ -273,18 +272,6 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
>   	wake_up_interruptible(&sched->wake_up_worker);
>   }
>   
> -/**
> - * drm_sched_job_done_cb - the callback for a done job
> - * @f: fence
> - * @cb: fence callbacks
> - */
> -static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
> -{
> -	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
> -
> -	drm_sched_job_done(s_job);
> -}
> -
>   /**
>    * drm_sched_dependency_optimized - test if the dependency can be optimized
>    *
> @@ -505,8 +492,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   	list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
>   					 list) {
>   		if (s_job->s_fence->parent &&
> -		    dma_fence_remove_callback(s_job->s_fence->parent,
> -					      &s_job->cb)) {
> +		    drm_sched_fence_remove_parent_cb(s_job->s_fence)) {
>   			dma_fence_put(s_job->s_fence->parent);
>   			s_job->s_fence->parent = NULL;

Better just call drm_sched_fence_set_parent() with NULL here to clear 
the currently installed parent.

This moves all this dance into the scheduler fence code.

>   			atomic_dec(&sched->hw_rq_count);
> @@ -576,15 +562,14 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			continue;
>   
>   		if (fence) {
> -			r = dma_fence_add_callback(fence, &s_job->cb,
> -						   drm_sched_job_done_cb);
> +			r = drm_sched_fence_add_parent_cb(fence, s_job->s_fence);
>   			if (r == -ENOENT)
> -				drm_sched_job_done(s_job);
> +				drm_sched_job_done(s_job->s_fence);
>   			else if (r)
>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",

Completely nuke that here. All of this should be done in the single 
drm_sched_fence_set_parent() function.

And an error message is completely superfluous. We just need to handle 
the case that the callback can't be installed because the fence is 
already signaled.

Regards,
Christian.

>   					  r);
>   		} else
> -			drm_sched_job_done(s_job);
> +			drm_sched_job_done(s_job->s_fence);
>   	}
>   
>   	if (full_recovery) {
> @@ -1049,14 +1034,9 @@ static int drm_sched_main(void *param)
>   		drm_sched_fence_scheduled(s_fence);
>   
>   		if (!IS_ERR_OR_NULL(fence)) {
> -			s_fence->parent = dma_fence_get(fence);
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> -
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> +			r = drm_sched_fence_set_parent(fence, s_fence);
>   			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job);
> +				drm_sched_job_done(s_fence);
>   			else if (r)
>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
> @@ -1064,7 +1044,7 @@ static int drm_sched_main(void *param)
>   			if (IS_ERR(fence))
>   				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
>   
> -			drm_sched_job_done(sched_job);
> +			drm_sched_job_done(s_fence);
>   		}
>   
>   		wake_up(&sched->job_scheduled);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1f7d9dd1a444..7258e2fa195f 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -281,6 +281,10 @@ struct drm_sched_fence {
>            * @owner: job owner for debugging
>            */
>   	void				*owner;
> +	/**
> +	 * @cb: callback
> +	 */
> +	struct dma_fence_cb cb;
>   };
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
> @@ -300,7 +304,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>    *         be scheduled further.
>    * @s_priority: the priority of the job.
>    * @entity: the entity to which this job belongs.
> - * @cb: the callback for the parent fence in s_fence.
>    *
>    * A job is created by the driver using drm_sched_job_init(), and
>    * should call drm_sched_entity_push_job() once it wants the scheduler
> @@ -325,7 +328,6 @@ struct drm_sched_job {
>   	atomic_t			karma;
>   	enum drm_sched_priority		s_priority;
>   	struct drm_sched_entity         *entity;
> -	struct dma_fence_cb		cb;
>   	/**
>   	 * @dependencies:
>   	 *
> @@ -559,6 +561,12 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>   void drm_sched_fence_finished(struct drm_sched_fence *fence);
>   
> +int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
> +				  struct drm_sched_fence *s_fence);
> +bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence);
> +int drm_sched_fence_set_parent(struct dma_fence *fence,
> +			       struct drm_sched_fence *s_fence);
> +
>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>   		                unsigned long remaining);

