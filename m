Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C932A602B9C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 14:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0E10ECD1;
	Tue, 18 Oct 2022 12:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480F310E83C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 12:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsVxrVeDTTEwA1Hfviu1n6Cch1RWTn6k6spiT+4CYcjCq3jZpjX8cxfz/OhV20ZoW7ZAlPpsZC2CZQg2puplOxCx9ZDqRS2iAtpb2/bEBXnEWIZv/EXHZ7t6EmOzybgDj9M2XpX78jNdM5YeS88QKELdGpQ9b5/QwIw8Pfxj0OozUwho4Hs36El4HVZZKPhKCQ3PCB5TtseDDxg6umtQr/E6v0d27vAREAlOlM5HCBhZEHT/3hviP+5gjYs8bAHvZRQnUSHCXfi1ucLyqGCAyKfbSD+Hx2u3tdl4fCYl0z41i5TfaQ+Hrddo6UslqA3I5nQ4KA9jqpyORq4XoBQmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy0yCbzpuBBUASlOkmHeheTbL5gyODBXkawVkcNWK/o=;
 b=IGAotEHRrK3YnGcqNDIMQ8ClY2Z1ToC6HtO5hKdBhccEBQBoD9eMwnkNLEIV/fxv3NTRni61d1Wg/ZfpKqIiU3VINV4Ho8NI13j5jB3kClVKDrLZ0EvNu5d8V5wFkuzoD5N/pji4LruzBeuu+otSPdnR56EB2Ng6V15e1dwPursp7OMju0hU38Vl33oRH8X1EB1oP7Nf+HAsPmhUGZELpySKCn54xbPQEiECoufS0WlXLsqX4IAJrkhvyuFEgNJg2vUHM0pDkeonb3j0iiDZ9H75qL5IEPqepdg8leIS978C+aBFjTLHYRJ8O7bTNqm5Dj/Hs5pwgxtc5xOIZW3OVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy0yCbzpuBBUASlOkmHeheTbL5gyODBXkawVkcNWK/o=;
 b=0mSqMyFYSb3VyBwhC2ZLTsXnrykStliHdEAHjn/EPOLXd+wTBiof4kTN2UjqZTCK3rm/WwtcAkVx0oKh8YzYw6gEQ3mACQghCXUNG73g8AfGsL15zrWf052qd6lmxPlxMFsgKZDjoZht/fLMbRUgJWhMPCkzqB/vUX7cWec8mKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 12:20:36 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f8ad:96ef:844a:73c6]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f8ad:96ef:844a:73c6%2]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 12:20:36 +0000
Message-ID: <32e4b5d7-940d-cc46-69e5-74f42baed160@amd.com>
Date: Tue, 18 Oct 2022 17:50:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] drm/sched: Fix kernel NULL pointer dereference error
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 steven.price@arm.com
References: <20221017143006.2419-1-Arvind.Yadav@amd.com>
 <f03c1b59-e024-40d8-5fee-02d8d660a058@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <f03c1b59-e024-40d8-5fee-02d8d660a058@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::14) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|BL1PR12MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b8604c-b5e6-473a-364f-08dab103290a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ye4oeKWOIBCpq/lZX7jVOtuGSnqNk+HZ8o6TqefhMz8COe28Q1vZ+beph8vU5zIaLKR+X6mmyvLUPl104gM2RDkSFzSBnUQ+k5Vw3JhxnPAIC2Miur94/X2zeR2ful33lv+kAzmXAHV33F10v0Qi31gkUtg8R72nC7kbvb0Z1krj6V35quNIORDvv4ntz7u2s4LuOS60URRHjy0a/G3jyyZWdiXQ+3V5iWXR7jgHoXo0MxR2UdElHCKk7thNGeV+gE8Y6skkFK9T1ARoWjgzR0opsApd3R1Y0eKobulyrMwd8K2BrreMx5SSI3I5BTIw+lkW/t+1c4tVlwagI2VnjYKWNXpQKny1pAnejCxFLX6ngc6zL8JMe/KAdGIgGvtsB+BrdyRKPLUodB7dbZqwXlULtO3rPkLeHdLLnXaBcjrU1m7qOYuZTihnLIJXjKXOwpC42IUpP0SrMqdztO7O5z0xuU9ifsJ1M1LZK6RhLXYwVWehySWb+yeJvPwpiePY3AM468WH2LXoJ5/K5uxoqHW7DZ8Phxj8fAIo5akVjjCSWTlzViZ6xdP+L5mPAifAyntReWc3l438HFP7VVmFyd+lcN8QyPSwkel9CYA3+oFqdG6Tr6+/Rflu71xQCPiBqNz/f9Za+RCosSOhrUJAsA/zDH3kkXnWayvZvaUyvrNg/td7L42QCWDOkwxGXYZaZ2HSudHsCeN5phzKVVGOsiRmT8cKd5SIUQ4L2k1cPoxHDluKCMgkIgYpEzA4Ww+pI47YolDDVvVtFprFcL4r/zeQaks7c+gAPxcAx5+3og/pQo3uwPYe9kkN4IYOqAHf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199015)(83380400001)(2906002)(2616005)(186003)(66574015)(8936002)(66946007)(5660300002)(38100700002)(41300700001)(8676002)(66476007)(66556008)(921005)(316002)(31696002)(30864003)(110136005)(31686004)(6666004)(6512007)(26005)(36756003)(6506007)(478600001)(6486002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dElmUk4zVUc1eXNHZ3lONVRhVXk1YXNTQ211M1YxUzVHT1MrTHNOY3BPa2JP?=
 =?utf-8?B?UlhOdHdmTkZRdTJ1T3FBU21kZjczaWpWR2N3UWR1U0cwc0VQVlY3R2ZxL1ly?=
 =?utf-8?B?bEpUOVlld09acWpPUU9hQ2dFUm85ejJ5SUJBelBXUy91M0FrK1JTVEY4NmtZ?=
 =?utf-8?B?bEY4c3dLOWFtbHh2WHMybTlJQWtKbTFuTGVjNEErUkk2NENMWWRaMll6TnZ2?=
 =?utf-8?B?emd3Ym9Kb1FaZnJ2WUh2M3ZDM3pERDVGbzJFdFBYZnVCRm5udXNuS2ZBMXFN?=
 =?utf-8?B?OUhRbEpRbUtlaXNvNnJ1STlOVmxaeitWbElCTUV3UzNhYllYNzIyTmZJaXVY?=
 =?utf-8?B?L2Rka3dLTUYxd2gwdktnSWc1Y2dkQnd1ZmkzeGZhOFdiYTRsVHhoQ3pXbFJY?=
 =?utf-8?B?aGZ5ZzB5TWNMKzZRTzErUloxNERrZkxrZlNPZHhjbzgxR0pCcDZEMG50bEY1?=
 =?utf-8?B?OVZwMTRYSEFNUm1TSEtIcEcrank3YW9aTnNmaUJDR1hEb21BQ1dLVkpZQXBT?=
 =?utf-8?B?Q3NKWlZBUEVhaURZU0N2RTIwTG5ZL3FBOU1Oc09vRjZPMmxKci9za3FpODhT?=
 =?utf-8?B?MUM2T1ZNMFlsM2hmWG8vOEY0Z2FvZXFJbkxwa2VlUXBhUjVsUU5RdS9WQkYw?=
 =?utf-8?B?Y2xoQkVUWWtDb0d2RHlrS0xqQ0ZGYm5OSHR0dVNKWVU1UXdrbnVrSkZ2VHU3?=
 =?utf-8?B?ajZ6OUpVT0VKMVZkaWxVU2hoWWwyS2ozVTZnWE9CSHRuSklNSFA5elNiQTFp?=
 =?utf-8?B?dFFkdUxLZzQ5c0w5QjAzYklzY2gvRGQ4dVNYc0E3NTVjK0ZQTnJYY01rU3dP?=
 =?utf-8?B?MkZKMGt5bTN2TzhYbUlGdDVMK3hZM1Q1cElhL2dKVTNtQnJiWHdIQjNIT1Qw?=
 =?utf-8?B?YWJ2L2QwV3NEYVptYmdBelY5eW13dUZYekdoaXdIaksrZy9DckcrVkFwRW80?=
 =?utf-8?B?OEYxcEJ0d0lMYzJSbU16djVXaHJyNFNkaENnZmhmVythTkd4ck9Ca2Nqdmdy?=
 =?utf-8?B?TzREelpacDdVcVdNcllWVzA1eU81RllTU01XTkE5aEc1YkpCbzJiZGlnTDkz?=
 =?utf-8?B?ZVdEam5FYW0rUEs1UEg4STE3U09rRFlVOXdmekhVM3VZSEhiNnoxdXBsNEVx?=
 =?utf-8?B?NTgycEUrNVRjMmVEQURhTEczVXlWeUFBeE1LWmZRcElJNlJydit4OUdXSFZZ?=
 =?utf-8?B?dlVkQUo1cXBvOUdxcG9qbnRwdG5wcG85TXBNZnpGQUJsMDh6TEROVXEyRDZT?=
 =?utf-8?B?SEVVcXNWZTVTQ1lUR2tKYVNaVlMwdVJxbVNsaFhSdHgzQytEbEMxR1ErQVEr?=
 =?utf-8?B?a3c0RmNsQXdxNzFTNktaLzV5UUh1QytMN1VmTkRpUlh5YjVyeGtwSExSSHRt?=
 =?utf-8?B?bUNFYks3UXhkUkg1bHJKV3Q2ZFd6UURaWXRvQUExWk1HOEZlWVc2M0NWSXdu?=
 =?utf-8?B?Q2dZQWN6ellZZEtIZFI0bTUvTEVJOUFiRzJFbFhBVnlZa0xxcTlOSHhwK3lS?=
 =?utf-8?B?eVFZdUwwM2hKRmE4WjFMb3pWZktDYStxVk9GMTk4SDYyTzN2WWJTZ2FUSGlF?=
 =?utf-8?B?ZEJ1bExrZVoyaHdEc0V5UlhaWDZkcTNTK1JCTmlsUm5CbWZTTlR3M0gvUWFC?=
 =?utf-8?B?dTdnQWU2ekVLN1NFWkw0ZW13WmVNbklLZUZwK1l0ZVlhNS8vdklaOW16eVdx?=
 =?utf-8?B?WXJxaXg2TVZyclFUTW0zbEwvY1B3TWhOZ0F3S2FqanlGU09DSmc3VDlMTWFP?=
 =?utf-8?B?dGx4NUpQMjZseEtkaXNkTFhXOHh1Ny83clh1SXlPcitEMnc4UzRqVXVWYVpy?=
 =?utf-8?B?NTdjR25BcnhyMjZGdC9aaGREb3dPZEFaTElwdmYwQWhTRWJjS0tqT0lBSTBp?=
 =?utf-8?B?RnpCMjlmeWhlK2MyajUxeUhSdmg5MUlUcXNybFdYakx4WWt6RVlCUFhKS2dq?=
 =?utf-8?B?WVdYT3ovZUpmbEF3a3Fzb09RaWozb1pnSS9JelRQcWlJL3lIaDlTcnBIV25R?=
 =?utf-8?B?aXRQU2VrMHFpUlQ3Ti9vT0cwVG1HNnhVd0xBZGtKQXpKbTBPdWxJUFA2WGZ0?=
 =?utf-8?B?NnRmdHFsaHVvcTlndGJVTU1RV0drelVpVFh5Y0ZlcVMvWkZTY25sQVRYVTQ0?=
 =?utf-8?Q?Egmm3Mw8MSa88wRUtBJoCZnki?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8604c-b5e6-473a-364f-08dab103290a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 12:20:36.1974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j03veCrVu0zOm4yOjsZnY7SCZEqZlD+BIQqKfqnswqfa3sFEK+Fdg3FWakV3TlqPnazIyFZdWMVx/UEolLjcUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378
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


On 10/17/2022 8:20 PM, Christian König wrote:
> Am 17.10.22 um 16:30 schrieb Arvind Yadav:
>> -This is purely a timing issue. Here, sometimes Job free
>> is happening before the job is done.
>> To fix this issue moving 'dma_fence_cb' callback from
>> job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).
>>
>> - Added drm_sched_fence_set_parent() function(and others *_parent_cb)
>> in sched_fence.c. Moved parent fence intilization and callback
>> installation into this (this just cleanup).
>>
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000088
>>   #PF: supervisor read access in kernel mode
>>   #PF: error_code(0x0000) - not-present page
>>   PGD 0 P4D 0
>>   Oops: 0000 [#1] PREEMPT SMP NOPTI
>>   CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
>>   Arvind : [dma_fence_default_wait _START] timeout = -1
>>   Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
>>   RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
>>   Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66 
>> 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 
>> <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
>>   RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
>>   RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
>>   RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
>>   RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
>>   R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>>   R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
>>   FS:  0000000000000000(0000) GS:ffff8a48a0a80000(0000) 
>> knlGS:0000000000000000
>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>   CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
>>   Call Trace:
>>    <IRQ>
>>    drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>    dma_fence_signal_timestamp_locked+0x7e/0x110
>>    dma_fence_signal+0x31/0x60
>>    amdgpu_fence_process+0xc4/0x140 [amdgpu]
>>    gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
>>    amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
>>    amdgpu_ih_process+0x86/0x100 [amdgpu]
>>    amdgpu_irq_handler+0x24/0x60 [amdgpu]
>>    __handle_irq_event_percpu+0x4b/0x190
>>    handle_irq_event_percpu+0x15/0x50
>>    handle_irq_event+0x39/0x60
>>    handle_edge_irq+0xaf/0x210
>>    __common_interrupt+0x6e/0x110
>>    common_interrupt+0xc1/0xe0
>>    </IRQ>
>>    <TASK>
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>
>> Changes in v2: Moving 'dma_fence_cb' callback from
>> job(struct drm_sched_job) to scheduler fence(struct drm_sched_fence)
>> instead of adding NULL check for s_fence.
>>
>> Changes in v3: Added drm_sched_fence_set_parent() function(and others 
>> *_parent_cb)
>> in sched_fence.c. Moved parent fence intilization and callback
>> installation into this (this just cleanup).
>>
>> ---
>>   drivers/gpu/drm/scheduler/sched_fence.c | 53 +++++++++++++++++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c  | 38 +++++-------------
>>   include/drm/gpu_scheduler.h             | 12 +++++-
>>   3 files changed, 72 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c 
>> b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 7fd869520ef2..f6808f363261 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -77,6 +77,59 @@ static void drm_sched_fence_free_rcu(struct 
>> rcu_head *rcu)
>>       if (!WARN_ON_ONCE(!fence))
>>           kmem_cache_free(sched_fence_slab, fence);
>>   }
>
> Please add an empty line here.
I will fix in the next version of patch.
>
>> +/**
>> + * drm_sched_job_done_cb - the callback for a done job
>> + * @f: fence
>> + * @cb: fence callbacks
>> + */
>> +static void drm_sched_job_done_cb(struct dma_fence *f, struct 
>> dma_fence_cb *cb)
>
> Probably best to rename this to something like 
> drm_sched_fence_parent_cb().
>
I will rename in the next version of patch.
>> +{
>> +    struct drm_sched_fence *s_fence = container_of(cb, struct 
>> drm_sched_fence,
>> +                               cb);
>> +    struct drm_gpu_scheduler *sched = s_fence->sched;
>> +
>> +    atomic_dec(&sched->hw_rq_count);
>> +    atomic_dec(sched->score);
>> +
>> +    dma_fence_get(&s_fence->finished);
>
> We should probably make sure that this reference is taken before 
> installing the callback.

Here, we are signaling the finished fence and dma_fence_signal is 
checking the reference.

So we do not need to check here.

>
>> +    drm_sched_fence_finished(s_fence);
>> +    dma_fence_put(&s_fence->finished);
>> +    wake_up_interruptible(&sched->wake_up_worker);
>> +}
>> +
>> +int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
>> +                  struct drm_sched_fence *s_fence)
>> +{
>> +    return dma_fence_add_callback(fence, &s_fence->cb,
>> +                      drm_sched_job_done_cb);
>> +}
>> +
>> +bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence)
>> +{
>> +    return dma_fence_remove_callback(s_fence->parent,
>> +                     &s_fence->cb);
>> +}
>
> Do we really need separate functions for that?
>
We can use  'drm_sched_fence_set_parent' but we need to add extra NULL 
check before

adding in the callback otherwise add-callback will throw the warning 
message every time.

If I add NULL check then will never get any callback warning message for 
setting NULL parent fence.

So I have kept separate functions.
>> +/**
>> + * drm_sched_fence_set_parent - set the parent fence and add the 
>> callback
>> + * fence: pointer to the hw fence
>> + * @s_fence: pointer to the fence
>
> Reverse the parameter order, s_fence is the object we work on.
I will change order in next version of patch.
>
>> + *
>> + * Set the parent fence and intall the callback for a done job.
>
> You need to document that we take the reference of the parent fence.
>
>> + */
>> +int drm_sched_fence_set_parent(struct dma_fence *fence,
>> +                   struct drm_sched_fence *s_fence)
>> +{
>> +    if (s_fence->parent &&
>> +       dma_fence_remove_callback(s_fence->parent, &s_fence->cb))
>> +        dma_fence_put(s_fence->parent);
>> +
>> +    s_fence->parent = dma_fence_get(fence);
>> +    /* Drop for original kref_init of the fence */
>> +    dma_fence_put(fence);
>
> This leaks the reference to the old parent and the get/put dance is 
> not optimal either.
>
> Better do something like this.
>
> /* We keep the reference of the parent fence here. */
> swap(s_fence->parent, fence);
> dma_fence_put(fence);
>
>
I will change this in next version of patch.
>> +    return dma_fence_add_callback(fence, &s_fence->cb,
>> +                      drm_sched_job_done_cb);
>> +}
>
> When installing the callback fails we usually call the callback 
> function instead of returning the error.
>
>
I will call the drm_sched_job_done_cb(NULL, &s_fence->cb) callback.


>
>>     /**
>>    * drm_sched_fence_free - free up an uninitialized fence
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4cc59bae38dd..cfb52e15f5b0 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -253,13 +253,12 @@ drm_sched_rq_select_entity_fifo(struct 
>> drm_sched_rq *rq)
>>     /**
>>    * drm_sched_job_done - complete a job
>> - * @s_job: pointer to the job which is done
>> + * @s_fence: pointer to the fence of a done job
>>    *
>>    * Finish the job's fence and wake up the worker thread.
>>    */
>> -static void drm_sched_job_done(struct drm_sched_job *s_job)
>> +static void drm_sched_job_done(struct drm_sched_fence *s_fence)
>>   {
>> -    struct drm_sched_fence *s_fence = s_job->s_fence;
>>       struct drm_gpu_scheduler *sched = s_fence->sched;
>>         atomic_dec(&sched->hw_rq_count);
>> @@ -273,18 +272,6 @@ static void drm_sched_job_done(struct 
>> drm_sched_job *s_job)
>>       wake_up_interruptible(&sched->wake_up_worker);
>>   }
>>   -/**
>> - * drm_sched_job_done_cb - the callback for a done job
>> - * @f: fence
>> - * @cb: fence callbacks
>> - */
>> -static void drm_sched_job_done_cb(struct dma_fence *f, struct 
>> dma_fence_cb *cb)
>> -{
>> -    struct drm_sched_job *s_job = container_of(cb, struct 
>> drm_sched_job, cb);
>> -
>> -    drm_sched_job_done(s_job);
>> -}
>> -
>>   /**
>>    * drm_sched_dependency_optimized - test if the dependency can be 
>> optimized
>>    *
>> @@ -505,8 +492,7 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>> *sched, struct drm_sched_job *bad)
>>       list_for_each_entry_safe_reverse(s_job, tmp, &sched->pending_list,
>>                        list) {
>>           if (s_job->s_fence->parent &&
>> - dma_fence_remove_callback(s_job->s_fence->parent,
>> -                          &s_job->cb)) {
>> + drm_sched_fence_remove_parent_cb(s_job->s_fence)) {
>>               dma_fence_put(s_job->s_fence->parent);
>>               s_job->s_fence->parent = NULL;
>
> Better just call drm_sched_fence_set_parent() with NULL here to clear 
> the currently installed parent.
>
> This moves all this dance into the scheduler fence code.
>
>> atomic_dec(&sched->hw_rq_count);
>> @@ -576,15 +562,14 @@ void drm_sched_start(struct drm_gpu_scheduler 
>> *sched, bool full_recovery)
>>               continue;
>>             if (fence) {
>> -            r = dma_fence_add_callback(fence, &s_job->cb,
>> -                           drm_sched_job_done_cb);
>> +            r = drm_sched_fence_add_parent_cb(fence, s_job->s_fence);
>>               if (r == -ENOENT)
>> -                drm_sched_job_done(s_job);
>> +                drm_sched_job_done(s_job->s_fence);
>>               else if (r)
>>                   DRM_DEV_ERROR(sched->dev, "fence add callback 
>> failed (%d)\n",
>
> Completely nuke that here. All of this should be done in the single 
> drm_sched_fence_set_parent() function.
>
> And an error message is completely superfluous. We just need to handle 
> the case that the callback can't be installed because the fence is 
> already signaled.
>
I will do the changes as per your review comments, Thank you for the review.

Thanks,

~Arvind

> Regards,
> Christian.
>
>>                         r);
>>           } else
>> -            drm_sched_job_done(s_job);
>> +            drm_sched_job_done(s_job->s_fence);
>>       }
>>         if (full_recovery) {
>> @@ -1049,14 +1034,9 @@ static int drm_sched_main(void *param)
>>           drm_sched_fence_scheduled(s_fence);
>>             if (!IS_ERR_OR_NULL(fence)) {
>> -            s_fence->parent = dma_fence_get(fence);
>> -            /* Drop for original kref_init of the fence */
>> -            dma_fence_put(fence);
>> -
>> -            r = dma_fence_add_callback(fence, &sched_job->cb,
>> -                           drm_sched_job_done_cb);
>> +            r = drm_sched_fence_set_parent(fence, s_fence);
>>               if (r == -ENOENT)
>> -                drm_sched_job_done(sched_job);
>> +                drm_sched_job_done(s_fence);
>>               else if (r)
>>                   DRM_DEV_ERROR(sched->dev, "fence add callback 
>> failed (%d)\n",
>>                         r);
>> @@ -1064,7 +1044,7 @@ static int drm_sched_main(void *param)
>>               if (IS_ERR(fence))
>>                   dma_fence_set_error(&s_fence->finished, 
>> PTR_ERR(fence));
>>   -            drm_sched_job_done(sched_job);
>> +            drm_sched_job_done(s_fence);
>>           }
>>             wake_up(&sched->job_scheduled);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 1f7d9dd1a444..7258e2fa195f 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -281,6 +281,10 @@ struct drm_sched_fence {
>>            * @owner: job owner for debugging
>>            */
>>       void                *owner;
>> +    /**
>> +     * @cb: callback
>> +     */
>> +    struct dma_fence_cb cb;
>>   };
>>     struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>> @@ -300,7 +304,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct 
>> dma_fence *f);
>>    *         be scheduled further.
>>    * @s_priority: the priority of the job.
>>    * @entity: the entity to which this job belongs.
>> - * @cb: the callback for the parent fence in s_fence.
>>    *
>>    * A job is created by the driver using drm_sched_job_init(), and
>>    * should call drm_sched_entity_push_job() once it wants the scheduler
>> @@ -325,7 +328,6 @@ struct drm_sched_job {
>>       atomic_t            karma;
>>       enum drm_sched_priority        s_priority;
>>       struct drm_sched_entity         *entity;
>> -    struct dma_fence_cb        cb;
>>       /**
>>        * @dependencies:
>>        *
>> @@ -559,6 +561,12 @@ void drm_sched_fence_free(struct drm_sched_fence 
>> *fence);
>>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>   void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>   +int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
>> +                  struct drm_sched_fence *s_fence);
>> +bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence);
>> +int drm_sched_fence_set_parent(struct dma_fence *fence,
>> +                   struct drm_sched_fence *s_fence);
>> +
>>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>> *sched);
>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>                           unsigned long remaining);
>
