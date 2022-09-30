Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA45F0F1D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999F610ED61;
	Fri, 30 Sep 2022 15:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF2710ED61
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:40:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFoJWbKDOWbEOJhD59uof2AjQTiG4gwMDgKf9T3B0Ag5sBSvqtC4X5X9q6ZWo+DEF80NhMbsJ24a5+BQ6arXQdx/uv5xM3UVXU64AoPog8Ssb2ctkSN/cwNaiDAo0TZOrcBqY7zpndgOarZg95DbnigTEqXp6GmUpIM58NFnm6zbyxkSHGoqrmiHoxOz3KfC3Xrzszn9cdWUqvjKZEm/hRfzQVElaQ3+98/leRE7dvJEeENg6/l6z3NqWBTqqfJWOdyHSlBgJNEDDU3WYvKisYJgpH3ZvKEruTRjyvPSReZur1klH4C08Xiy2B8hJ5fxnMkL+5Ed/IUZ3XU6qW3EYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ5VSDMCYvaF/M9RVpi7AIbLLlwVviNnMU/zknLh0qk=;
 b=m9beKkGNmdKqCo5XBBg9BdDj2TF1ldohlvVgmx1NwZMfnfE0mNjSIB+dYOocMlRZzHVfTghOzOudV2ym2UOiTWmzj0IPozPhtTU4sT3eApIpLY57Yt1aJWGRlO48bULl3i9QBWiJWi/vKevTYBmR/ejC/DdLMyZqEInB4ZidSMNWC7Brc/2SV6hyOCvQywqS38C0tvWmoTY5CNCvbBwffvk76UgF0k1f5dwOd2LazEPnwo+9q2mZ55Mozy2a/ohpwNHbIAFv0VAjojDuYkqg0qxwMWCcgNwJYSMRtUaqQcGEjeLK0CpAUGVn3r2TeUZIGJD3dHZRHoXleK0dpw4bqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ5VSDMCYvaF/M9RVpi7AIbLLlwVviNnMU/zknLh0qk=;
 b=EKoxHAX9aWNQDb8O8Ozn8H4qK4x3O04l5uQunLk9Kmy4Odc5mDZ4xDjyNmN7y7GI1nuUVoZoZ78VBbQ7/rTmd8D4UU+50Q6Y0Eo3J7YeviksDoDsSIHJU7/10sV6iwfylZRTKnH45KyxHU+YhjdR3pXizwO5ekGEI1Fdv4k4/EQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.18; Fri, 30 Sep
 2022 15:40:09 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::9ef8:a10e:6fe:1933]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::9ef8:a10e:6fe:1933%6]) with mapi id 15.20.5654.024; Fri, 30 Sep 2022
 15:40:09 +0000
Message-ID: <e4aeea32-4ed8-c1db-e826-32ce278f61c4@amd.com>
Date: Fri, 30 Sep 2022 21:09:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/sched: Fix kernel NULL pointer dereference error
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 steven.price@arm.com
References: <20220930084810.4639-1-Arvind.Yadav@amd.com>
 <38ef1813-030c-8315-249d-349d69b81c52@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <38ef1813-030c-8315-249d-349d69b81c52@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 392522b4-0074-49ce-581b-08daa2fa0e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m03rKrfeGjD2EVCR3iMiKRheQBfSj+izGT/X2T+3k8uMHvvk1WP4Ajl3UfjA0IgGMDr53Q6BMJhrYytYxI3dOAtPBWZFPhCfhxZ17bbXevw4NHF4SDGNAR0hseJmZF80A7UNE6UinuAP3c8g7yATTzgLJqSX/flInTTVxcjJU19XNAu+SouJcnjw4jG5zuhUE6MJfZ00tq4vRMJQMpYs74igag/zqvqedNGgDUCqJy8Tnk3N3B6cRgstYIwjixX9t7mhoQembQbHSo1bA2KT+U+zLm0WjEdL5o25pNegOaaVzGOiczBfemOP5Ka3YgfzhdIc5EnGMWclFBgjxbiYMniyXpbbn4NEA3zU2BAwE88sOPI38BDWqY/EicDtKr8Yol5ZQReOiC6lXtINLtzrobSnbOzDo8c8et0J6Fqs0hNQ3B5OdTHJo5R168wQL6k8M82q2hUD0oLbE6ctFKfNy1cngbdutsxY8CiXMdJMHZMjUa4vitqWn7OXiQ8sWrdKtbciV1xFzDbPdKRCH7ZErpOcHoQoXPD6fVKroMMZ7ZKuyFIQkQeC9jLe2O+kw/aVaEka+y5f8lE4NTG0iuEZ6aft56I2ZMC81aaWLNhWsHxw9dfQ07N8QO/E00sW0Q5QEQhMWALxfXcbssaFAUwTxxzFNPRAToSiLk7AUw7oCQxcpd76BJ13DXZ5U9pF+cti16tU2eGIC4T2B+uMPolXtvYwJcG61+4qkRIFIWMEU1vHD9I8tJcwKraMJ+VzG8VjGkA2KoapIbQVBLkHOfw3z3OeIOuRotLtvTpYT+h7+Y5tbmC8VmX0ykfdBuxQR1Uzqpdls0GV6uJO11D9ulZG1QMHuwF0/4vcVpv5DKua84I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199015)(186003)(36756003)(110136005)(31696002)(31686004)(6512007)(5660300002)(2616005)(921005)(66574015)(2906002)(38100700002)(83380400001)(6666004)(26005)(6506007)(53546011)(478600001)(316002)(8676002)(66556008)(66476007)(66946007)(6486002)(8936002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVgyaW0rQU92VUtWSlFlNUZiSHFhV2lDQ0l6N2NPZFk5Y3A5cVBPbnZ5OXFF?=
 =?utf-8?B?TEE1L2xCbzgwNXBIL2VYRTZQeitUVDZRNno5Nll1WHNWMGJhcERxZkN1Q3h0?=
 =?utf-8?B?QzU0MnJzNmVLOHNEekNvSHROVG9jbVV0RkRqeGJIU0J4NG9TREZyelFLYlFH?=
 =?utf-8?B?bzlVeGpDUmVwODNHVy8wSWh4UXIwYWRKWXI4bUV1VzNRZzMybVZlVDQzcUVE?=
 =?utf-8?B?SDBrcjdaOG8wMlE1K0gzQ1BCNUVxcGdaSi9ydmZ1N1kzM2FlZnhZNW1jcEN3?=
 =?utf-8?B?ZC95ajRoSURGRVZURndqNjB6YS9WaVYvZ05jNGFKSmM4QmdGNVQ5ODhSZzFa?=
 =?utf-8?B?MTRBOE9ya3k3WlRYd010SzlodVorZ0pjTTNQWlQ0RTZHenpxdXNHV0Fnd2dj?=
 =?utf-8?B?UlQ2NTJOeDJFVzVmdGVRUVEvKzF2MUJJZldTWEw3Zno0Nk0xRUM1YWZXeU43?=
 =?utf-8?B?ZkdySElaOGJmd3hDR3BIM210TjIxeFFyT3RTRHNLU3pxbkpnMjlvRE5wTU00?=
 =?utf-8?B?REVIWURnZmtXMitNL3U2dkNwTkNxMk1BVUhFV3FVcmhoSU1CeHltc0RLU05i?=
 =?utf-8?B?YlJxSXhYbG5FTUI1MG9lRVNBbUorcU4zQ2dlUnVtVnVZaE1weTRYNXNQV1dE?=
 =?utf-8?B?RUtyKzFtVnRPYnRQTUIwbzBXcEMvbU1NeDloMDdtZ2hrcm9Xb1V5cHBIMHlN?=
 =?utf-8?B?VFhwSWt3THNUNFd2NXNVY0lTbVF3cFNlK081YTQ5c1Fhd3B4czFHR0Zzb3RZ?=
 =?utf-8?B?VVI5UldxKzIrK2EyUHp5TEtEWXZjdzM0anY5SjJkZWp1aEJqZlBGS2dZYncw?=
 =?utf-8?B?alNpL05XLzFtM0ZDcEhuNzVzaE41MEhsSWxJOE15dkJHV0tUa1lpTXZYTVYz?=
 =?utf-8?B?WnpvUG03VkNkU3pyTHpzVlBMei91T1lSK0FhU0JBaWE3Z1YwNFMvdkhvT0ZY?=
 =?utf-8?B?eis5VXFGR2RkZmtDZmJYNkFDVklqSWZsbTk2OW5takQveFhxZHpFZ2hDTEI2?=
 =?utf-8?B?Y0FtZjcxK2thRC8zQWZteHpXY3NMbU5jSTYwdUVjQmowZmswUHYrMnpGS0pq?=
 =?utf-8?B?OUc4QUFjR01DUXdXVG9la05IT1NZSXVJNXhSU3BrcjEwanF0V0dCYXdCSHdu?=
 =?utf-8?B?Qnk3cDJyb2o5dUdoNjdkd1dPWkJNWHhMd0g3eG9VbG51Ri8rL0trUDllUmVX?=
 =?utf-8?B?UE9NdjdiOW10UCtzNnh2djR6cUxGY3g3M25JZTRUeWgzOGpTOFcvSmI3QkVk?=
 =?utf-8?B?Mmd0SVVnd2I5VE1WT0doTW5zem55TFd6OFpKQnNLWFp2cE1XaERtVGpqanNW?=
 =?utf-8?B?K0NnRzlZaE9PdXB2ZVBDZ3k2N3ozbDNWL2J5NWxNU2dSYk9SS0cvUlV5eTky?=
 =?utf-8?B?alY3d3crNVMrcEVoa3l0bk00Wk52K0h4b0tGb29UbDFUMzJscWJhTHlUK01v?=
 =?utf-8?B?WVBRVzNCQXR1Z1YzMnN3d0l6dXZiaklWNWZ3MkVuWWhKZGMxMFZsRFp5WnFh?=
 =?utf-8?B?UEdLNXJmVmI3OWN2Wjd1SktJTkw2TWVKRzl2UCt1NFc1M0d2MkhZUzJETWw2?=
 =?utf-8?B?OVdIZHhuT1hlV05TZkJkc2hMUjNhVXBBZlN1LzI2TXJDczNOZFRpb1N2aUla?=
 =?utf-8?B?MTBYUEh0MC85S0NIZVJPUU1CNks1Wld1bDBOLzRzckp1UW5JSlFmN3hlK0hs?=
 =?utf-8?B?V0oxVGxvYWMzOGgzeUZnandvSFRkbGN1bEh2OUh1Y3JscU9oODQ2bFNhdTll?=
 =?utf-8?B?WS9sbnoyQjVlUld1UGxFZ0Zid2w4WFVyWDdhUFoxTktsUEhQeWdKNFNqSEZj?=
 =?utf-8?B?VUdQQWU5clNXOGl3V2ZLMmlnTEJHbmZMZHI4YWtxUGJsbnFpT3F6Y3l3WlBa?=
 =?utf-8?B?OG9BOUZrM3EzSmM3RnIwQ0c4ejkwYjk1eVIwRVdBdVdnYmZrM3prdEFGbWNG?=
 =?utf-8?B?WUZhaUsxcnVJZ1BRblFUNGJNenVoQWVxbHE1NmMvVTVILzhrdmpyYTNvMmlO?=
 =?utf-8?B?U3ljZzJSdmdIMGVWWjIraTBDWU0vVjlJQTA4TUpQUWRtR0tTRWNTYU9tcWMr?=
 =?utf-8?B?OC90cDRMMkxCNCttWmJXRDNCZWtWOCtHeEdRbXU5QWUweEd6MW5jbjZxeWhQ?=
 =?utf-8?Q?MarIxU2A/LzBC8GF5PYiEbKwH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392522b4-0074-49ce-581b-08daa2fa0e48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:40:09.8053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEw29m+zPNwTdanwcxy3+Q1XoBaI2jEhOnbYrdbSzQA1tQXA9HklnPAW1Ex4u4SMNwQ5Ly3VG2Dw9N8z5QHREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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


On 9/30/2022 4:56 PM, Christian König wrote:
> Am 30.09.22 um 10:48 schrieb Arvind Yadav:
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
>
> How is this triggered any why haven't we seen it before?

IGT has few 'amdgpu' specific testcases which is not related  to fence.

while running those test cases I have got this crash but this crash is 
not always reproducible.

~Arvind

> Christian
>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 6684d88463b4..390272f6b126 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -172,7 +172,12 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>   static void drm_sched_job_done(struct drm_sched_job *s_job)
>>   {
>>       struct drm_sched_fence *s_fence = s_job->s_fence;
>> -    struct drm_gpu_scheduler *sched = s_fence->sched;
>> +    struct drm_gpu_scheduler *sched;
>> +
>> +    if (!s_fence)
>> +        return;
>> +
>> +    sched = s_fence->sched;
>>         atomic_dec(&sched->hw_rq_count);
>>       atomic_dec(sched->score);
>
