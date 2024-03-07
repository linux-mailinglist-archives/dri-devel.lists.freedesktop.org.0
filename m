Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684B874708
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 05:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697951123C8;
	Thu,  7 Mar 2024 04:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZikMWSJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D0A112266;
 Thu,  7 Mar 2024 04:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QExdnBkmfi94jEawnGsAPx5nVODYud8sktSmIHE0Uzl07tkpPWD12laIcQEEsFrtE2a/EAe1x7ytSdy4XlrFbSaCo4A7Y0GP+5ab+Bq8uj7Bi42x++0VPgfilsHOlm7+I06vZRf3gZzEGVowqXjoroaA1RXzZpisuK0maFVNnOjFMneapNczARqDPSQCukgCh5N4GwuB1O1510DthbKRDapzOxt3tLqfLLDX8We6N9nDGYNo+mCTR8TAsY0Iwtu6/slucg4QydQ3ELR6M5CHdVCvKpiyw9mLsjx1QNQ3i8gILvx1jkq5Y6c/5FcSOdKe5hnEX2nWe3BKtuZDAA/clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRdkz3yry0KIb+j2rSJ28hddbSuTZpbRbs6hqEs5tLE=;
 b=oKbsO37sg58/qCmAwgtb9OGzyQCKIvxpiye0aVOzoIv+9kzS7P7zISKtYZiMSXtMHUtK6sngWbsKH70/9D/9HD5KnitJsFV+WI9EbmN70ZcZGJqDDxcqTE8qw8okY7RU2jsANRI7ctjk+y/LyPfgjN3miiMntOhxZThSkKhElOwbnYIYhVYvAZoP2hO7o87+XXCXH/xB6i0s+bQhAZ+jP5UWtjfbVp0uGfKWuRwmRJnYvQ8bJ92lpL5JV1cFEjBnB3i7OmdlJ6eSQRy3Hb5ZgbHEhrZgc0RIgsegB5QZCpH56wK4bT/YX2d2T2+H/t+wKbhAatEuHmnw/aIZqHDaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRdkz3yry0KIb+j2rSJ28hddbSuTZpbRbs6hqEs5tLE=;
 b=ZikMWSJjKt2/kdEImitEsKTsAQK1zKdE0iX4i/Sob/225kU/WMqerwwBiLNEZbxOzjMmiiVE/0SqpnV15UGU6MDCovo7v2VPBqM/6Ic3Ba1PpWkLqA9IzzM2dUEj4c5Sp5Uv749S5Cn6svAjSbJdfGBsLORpzx2//3W5/AG1aTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 04:02:16 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 04:02:16 +0000
Message-ID: <7c337878-3218-4f73-8bc6-28a4df3e0094@amd.com>
Date: Thu, 7 Mar 2024 09:32:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Joshi, Mukul" <Mukul.Joshi@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
References: <20240306181937.3551648-1-sunil.khatri@amd.com>
 <20240306181937.3551648-2-sunil.khatri@amd.com>
 <BL1PR12MB514469F899DD38439EA66CB5F7212@BL1PR12MB5144.namprd12.prod.outlook.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <BL1PR12MB514469F899DD38439EA66CB5F7212@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|MN0PR12MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc7f28d-092b-4992-dd54-08dc3e5b605e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: df/JvsLBHvIlBS6zO3ukHa55vyZWZPPV9F+lJT+DsB5R+/5+dglX+mDEsY/LYp0zjPWD0kAdPqX0jVtwEzbkCB9xMyB7XSJQpc1w3qG+3bo/IaFYUmibj9YCS7XrwWI/oz/RSEFUoCl6o+Hxcw85J9DPNvrpcDlTQ/E0qqHBhmT699KpbM2xwQNz4EqbCM5mowhh8NVyzR1XjeNxB1cLA9LsxPf3FDzjJZ0q9M0Hk8G1l+NQ0OyBcGoSVDs6GfCiFvlrQCwymG2NnbnKdxizP2DwAOC0vbcfgCJC2HQA2yi+5QnF25AVAL/bnsygOXUBk5enD3kToRvyoFGmsFcksdgoM+sILOeXjYQYOPpz00X5Mhl+SI+DrJ5GukF84aKK1ZgLe1esgzVl1QrXl37HxzoRiOj2ibLS1iZeOzCT7l1m1YKNPe4NOxWAHhYgJ7aUTaI1ktYOoMv8fG+M+jRodMHw8HeDPanRzs27NyVDZDKFZv3UCybZ5JmmyPmmFqbWUMnMA80EqIc/0GAik/1xw3y1RnkP4Uq8hsS6aVpqEIp9IHrF+9Z9ZSakdkKcJfYq3/BoGltgBlZMEklxSBdWbTwFA61gIMo9FOFAfT90gPcxUG/KYw8vSNKXKm/7SZX3R9Di5EDv0CzxHqQ1bX+WJTN2w7RLy2RlqAkMrBsLVLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWFmZER5Wldyblk5TlZLcERoaC9nU1RjemFNL3JMa0VQOFF3QStuVzZ1eW9y?=
 =?utf-8?B?aDE2YzNoSFBhb2RCZkJUZjVTU1lDR0YyZ3FxRXAwNzF5aEI0ckpBWSs4a2xD?=
 =?utf-8?B?cENSaTRCR05iTVJLNzVTUVVuTmpSOERHbmRWNitpQWFOOHp3dEduZjNidlJD?=
 =?utf-8?B?K2ZmbVNxaTc1L3g5NzlLL1MxeTFQYXNGNFhvMTF4Tkp6WUtoblBqOFhQblhr?=
 =?utf-8?B?RnhhZy9RS1hNYkZsWExTcW1GbDFjNWg2cmpzdC9ZdmE0dlc0aUljY0VGZmtK?=
 =?utf-8?B?SlNGaWgzQ0ZJZFlVbTZZdUxsTUlJRnA5YWRBTnhZMHJzeGJuWlBnTnVRZFhD?=
 =?utf-8?B?a2JyR0ZXd3JyS1ltSVdHSTloU1IxOVZqUTluMTUzNU1GRjBPQnh2RXFKd2hW?=
 =?utf-8?B?d0JWVUpWWVFIT0F0WTVKNUE1T3hGempWT0IxNEpUU2h4WFNnR0hTRGQzbm9K?=
 =?utf-8?B?MWRVUERuU1Fza1JLMWlHb0ordUlBTThmMHl6OUFZbWlUM2JYT3ljTWxIQVdD?=
 =?utf-8?B?S2kxYWFnRjdsS2Y3THNRcG1LMkNiQnJKN1owTWszSEhZYWk3N3htbWRKd2Vz?=
 =?utf-8?B?ZURUOUs3dmJwSndVaUhteVVrOVppWmk1aFd5eWFGQnFwTGJ4V2k1VGNSS3pn?=
 =?utf-8?B?RitFbXRTb1hMUVVHY1JrbDV1b1N3emN2TnZpUmpWSFY0bUwvN2I3TUkzM1Nu?=
 =?utf-8?B?YU9IRDhMck9CNEg5aGRzRXhEMTlBdVJyRGdsbXYwV3BpWWl0Ty9uVEZPeUV2?=
 =?utf-8?B?R05MaEtXU2JGOTdNMjR2Zkk3ZEl3Y0pPM2Z3NS9ndkhWb0hKU2xuczNYNUVD?=
 =?utf-8?B?NXRNaXo0TGtpMFdXV3Q1V1dha1JjK2VnQ3JueWwvejluQkZESUFwNElmOXgx?=
 =?utf-8?B?ZzI0TUVucXcyT2M3UTRjNnpsMy9nMWwxb0Jkait6TWk3STBhbmozM0tldVBF?=
 =?utf-8?B?eXBvbEhXQkNlY212RTA0eFZzckdkQitGcHRabEgvS1c0NHdVV2gwMzQyYnF3?=
 =?utf-8?B?UTVBdlhqbS9Kb3hIa0luWW1od2x0c2tTd2VuMnFTM25CYStvVzdNaEtYcitG?=
 =?utf-8?B?dFoyUG9zZmFTZkdJSDZJckpxUzNSa3hWRTRRdlc5ZDhndytzMFpKVFFTUHBV?=
 =?utf-8?B?QXkyaG9FMWt6QWtuKzdLazVDV1Q3MWJUSXUzL3p0eWs2V2RJUTBockdDRHFT?=
 =?utf-8?B?dE9TTzBtUitsZkdjOFl3a2YvQlRpektYVm92ZDBqZ2JGUmkwZGIyTzhjUUov?=
 =?utf-8?B?ajduTVViVzZkZ2F3VXc2QUV6TmIwRmoxYW00Q1Jid2RWQTBybk1ubmp3VXhW?=
 =?utf-8?B?K0ZFTXhWLzVzM091Q1FnOVMwcGo4ajI1VjR4cWpHZGc4UXFHcFY2eFlybCtm?=
 =?utf-8?B?QUhZMWwrYkFDMjdueHNTVWs0RndPQ0huNktiTUJCR0pJYmZuWFY4UWJHdWEy?=
 =?utf-8?B?Qnl0KzMrb1dIbjZYRzVDYU5BazJ6bDh0Q2lNWUxvOUdDZUIzUzJjdFZOSWtE?=
 =?utf-8?B?amdzaVZ0WXF1RXpNQTJCelNBemhNOGVOdG83M2k5dGhvTkFUbDZCSVFEMGgx?=
 =?utf-8?B?UlM3VUFwRzArQzhnTStML0FQNDMzL3F2ZWppbi9NOFowcEtyYlNRakhncjZ3?=
 =?utf-8?B?SFNLQy84UWxGeGlBMTlHMHNKVndoV1R5T2Fna2Y3M1dOUkQwRkJReWw1MEF1?=
 =?utf-8?B?M09FaHhEdEJhcEljWkpYQXovMktSaDUyUm1NVkxzUmt2ZUw0bTFkeS82K2ZV?=
 =?utf-8?B?a0J1a3BWajQvdU5sOHlHcWxHV0J1bHliZ05kNEpKVUNHTkNuRExkM2IwYTlo?=
 =?utf-8?B?QnVTeituajBzOG03OG5paDFhWit3SkNrajRGOUhMNS91ZmpsTUovdkxVdFpT?=
 =?utf-8?B?c1NrSXFQMzhOZ0RMQ2s2TUtDblRZVHdYTEhqOFM3c2hCVmtUakxGcWxYd00v?=
 =?utf-8?B?WHVXL2M0bjYxWDI5N2daYkFlZXBzTFlrOHVYY1ZTNHdudnp3Y1k1NnRUYjJ1?=
 =?utf-8?B?cXlJNW9Hd3VRa0VQZ2pzUXdqdWxKalBsL01PdEZFakEvZU56Sm12bFl2KzNq?=
 =?utf-8?B?UklqNkFkY05lL090R2FRTm83bjJoQXNIMm5FbmdUcEhmTjcvZm9Delprc1pO?=
 =?utf-8?Q?rq110JysRk91LKMJEpY4+xJgC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc7f28d-092b-4992-dd54-08dc3e5b605e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 04:02:16.2987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8RtYYhjqZHp198rC0Wuc74qXGUpCN6Yc52U+zdbs7z9aBoMNUriTnPdVdYCQeqFEKPcbWEo+2baHZmypyyb3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978
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


On 3/7/2024 12:51 AM, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: Sunil Khatri <sunil.khatri@amd.com>
>> Sent: Wednesday, March 6, 2024 1:20 PM
>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Sharma, Shashank
>> <Shashank.Sharma@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org; Joshi, Mukul <Mukul.Joshi@amd.com>; Paneer
>> Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; Khatri, Sunil
>> <Sunil.Khatri@amd.com>
>> Subject: [PATCH] drm/amdgpu: add vm fault information to devcoredump
>>
>> Add page fault information to the devcoredump.
>>
>> Output of devcoredump:
>> **** AMDGPU Device Coredump ****
>> version: 1
>> kernel: 6.7.0-amd-staging-drm-next
>> module: amdgpu
>> time: 29.725011811
>> process_name: soft_recovery_p PID: 1720
>>
>> Ring timed out details
>> IP Type: 0 Ring Name: gfx_0.0.0
>>
>> [gfxhub] Page fault observed for GPU family:143 Faulty page starting at
> I think we should add a separate section for the GPU identification information (family, PCI ids, IP versions, etc.).  For this patch, I think fine to just print the fault address and status.

Noted

Regards
Sunil

> Alex
>
>> address 0x0000000000000000 Protection fault status register:0x301031
>>
>> VRAM is lost due to GPU reset!
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 ++++++++++++++-
>> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 147100c27c2d..d7fea6cdf2f9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t
>> offset, size_t count,
>>                           coredump->ring->name);
>>        }
>>
>> +     if (coredump->fault_info.status) {
>> +             struct amdgpu_vm_fault_info *fault_info = &coredump-
>>> fault_info;
>> +
>> +             drm_printf(&p, "\n[%s] Page fault observed for GPU
>> family:%d\n",
>> +                        fault_info->vmhub ? "mmhub" : "gfxhub",
>> +                        coredump->adev->family);
>> +             drm_printf(&p, "Faulty page starting at address 0x%016llx\n",
>> +                        fault_info->addr);
>> +             drm_printf(&p, "Protection fault status register:0x%x\n",
>> +                        fault_info->status);
>> +     }
>> +
>>        if (coredump->reset_vram_lost)
>> -             drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>> +             drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>>        if (coredump->adev->reset_info.num_regs) {
>>                drm_printf(&p, "AMDGPU register dumps:\nOffset:
>> Value:\n");
>>
>> @@ -253,6 +265,7 @@ void amdgpu_coredump(struct amdgpu_device
>> *adev, bool vram_lost,
>>        if (job) {
>>                s_job = &job->base;
>>                coredump->ring = to_amdgpu_ring(s_job->sched);
>> +             coredump->fault_info = job->vm->fault_info;
>>        }
>>
>>        coredump->adev = adev;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> index 60522963aaca..3197955264f9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> @@ -98,6 +98,7 @@ struct amdgpu_coredump_info {
>>        struct timespec64               reset_time;
>>        bool                            reset_vram_lost;
>>        struct amdgpu_ring                      *ring;
>> +     struct amdgpu_vm_fault_info     fault_info;
>>   };
>>   #endif
>>
>> --
>> 2.34.1
