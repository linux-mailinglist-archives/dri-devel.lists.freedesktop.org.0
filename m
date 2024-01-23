Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF783838DBF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 12:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187510E755;
	Tue, 23 Jan 2024 11:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635010E18C;
 Tue, 23 Jan 2024 11:44:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbnweH8naOzl3Ddon6RlJ08hliGKfT/kkeLjgyqmWVvQmcqTCHN9yA24SisQqpdn8gOv1VO7jHL+mMrADj0/fE7s2W6zwYvdoFhf88WoNHCKjets5yHqsBwkUwe1SlDnFuaNltTBd6V4HmzLXlpIg456rt+e7iDBiZ73Iww2AD8QQejZNyA64H0VkQwkdot/o/c5U9Atocb8F0bPT7/vo7QpoQ4k/eEjdLA9jhsqT2xJ+2H0Uo7qM2Pl1XhjP/53yJcO2btT16bSjCy/6kS5vCWbo4JgbikLUdlS+6xI+8FsCsF4lL9vdGX6bjku1T2voFwJbL7NxP5tyU38QQU+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXLw24YHGk9OEVjiUGd6jTOy3s33QBVcSD/gLo8ffTI=;
 b=Fpxw6CZz6iE4qez15iGBB1wWDmzlsKHpMZbzGucxdkfIlgw7bg7Rv5nfhGqIX9QoE4UMcxHsdq4BWw4BB9+1Qzczqt6YjdEc+ZuYTd0YdwdgljWT13vUbvS/6gS7jy+GDlV6egoKk6hCYIbOy9hrudoDRj2WOEf1AL+2oYSi88KECYysXSt+yKdyDlQop6W1p6SojU4uFyDcRmq+Zv9frWpZozDxQ8jvqKNepM9JOSnFlqDz7GMlIXHEY0Lt9gJFvujASXrPCrw/e/mSKziXKjZ7d8JpTQ4E6QizMjLALXrLLMUENiLfByvT7Umk7PlYtmZormzxKeTTJUjHtrYBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXLw24YHGk9OEVjiUGd6jTOy3s33QBVcSD/gLo8ffTI=;
 b=w+0nof/4hFXmP4uXQc+wjnyyVAGj0/gnrVcTC0cAljb/IwYqEgdWvk+UrnLgg0zgJPsnCD+proFO0PG5QsV5BZv6cGrrPQqEfvDCw7abCf5coVgqEufTd2KxU0vM8VJFthmbDBhq2vEAwQz3NysxiU0W8QVfxG+tlFMY1rx5U3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB7088.namprd12.prod.outlook.com (2603:10b6:303:238::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 11:44:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 11:44:45 +0000
Message-ID: <76c3658d-2256-49c6-8e4c-49555c0a350a@amd.com>
Date: Tue, 23 Jan 2024 12:44:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Remove double faults once write a device pfn
Content-Language: en-US
To: "Zhou, Xianrong" <Xianrong.Zhou@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240122033210.713530-1-Xianrong.Zhou@amd.com>
 <5ed7d46b-ae26-43f2-81e0-91e3cfc0218a@amd.com>
 <MN2PR12MB4302C529B9F231F85539628EF1742@MN2PR12MB4302.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <MN2PR12MB4302C529B9F231F85539628EF1742@MN2PR12MB4302.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4236e5d1-0589-423d-9fbb-08dc1c08b1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFJJvuX1QpCMaevy2o9Fb2Y1EPFWInzL5LAv98Q5zgvco7vKy6LPuPQk4z6mRwdomOtBEQzs3NaERkDqFtA7JhCAPtpx1ny6pLJqop0FMtrRfaJkOnPInE+zmIEMGS2IM+I/AD2Bb3EOlEMaW9wcaz0N1r28HTge2hvXGfIpfAHesLsKbD/RsYL37hayc/qSB8wf9f3oFIjWNRWD1rA5K/RD/b1HExkR5K4ciCevMHS20GU5rb8gq8DmK6BZiO6C8ftF62p7upMnrYOZqEJdE0VFGigno8/Ggu2y9FmzW9jopVyTzlx9I2HutOP7td6pb3EB1XFqR5ss/MCGP/TgquI4gnzg4vbeNYMYk1tZJUaCTPc5P3RX6+y/qsu05Y1atojI7DXWiGIb2Y9YqZp0IF6EIVLUDWNeB+KNObjZS0oZZctz8ohJwbu+G2zaKUu6q/eQ918q8dtXkBYTh/51MBp2Tc2auBV2KUY6Bjr8aL9Fh2UKrNm3ALoz2hRJk99JZK7SqXbx7/jfeR8wICGvrtn6H/bWbfSHbx7UGn+dCVM8iub5OQDqc2L1f4EV3VVO9IoHH+YvnvlEBCRr9MO8TDHmIfnLtjPnPpfZEC1J6FMuFQTpz3O8/Ml4sAtpdWopivYYacHt7yVP1NmtBQPfqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(2616005)(26005)(6506007)(6512007)(2906002)(83380400001)(5660300002)(478600001)(30864003)(7406005)(7416002)(41300700001)(66556008)(66946007)(6486002)(4326008)(110136005)(8676002)(316002)(66476007)(54906003)(8936002)(86362001)(36756003)(31696002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ZhVE85clE4SmMvQnBUNHIvYlh6UFdkOStRTE8yVUJWRzRNbE9ITGJxaGpG?=
 =?utf-8?B?KzJzcmZGMGF2YnF2S0EzUnNUMFVYZnpRdkw4TUJNOGlNL0hXNWFBYXVoaUQ1?=
 =?utf-8?B?UFUyK2wyY1R3VHVCekFUSjRRL2hHV2xnbGFEYmhZNW1KUjNNZ3owK3pEWlF1?=
 =?utf-8?B?Qm9VTEpWU2w0cEF6ZWcyRGR2SkROQWNtclJsczByK1d6bVQyWDR5QkZDaGV3?=
 =?utf-8?B?NFhJSzBhaDBVYk95dUhNMkxhZXY2ZWk5OVZlc2JjMEVDQ1h6Z25LVzZiL0ha?=
 =?utf-8?B?SUFmRHBoV0NyeGlHOTVHd2liVVovdmMybHVUa0piMjN3OGIyeEtETHBiV0Nn?=
 =?utf-8?B?NFdPWEdVYlZRVUVRTjZ6eDByK3Zwa0VwWHErNGxabzBRSmlSVGlLQTNMRnUz?=
 =?utf-8?B?Z1lFVlhwVmVjZUF3bUt4MThtNDd5dmt5Q3RHODNId3QzUnpFMGNEdjBJaXQ2?=
 =?utf-8?B?YkxHaDYvZkxDNUhPNDJjWGVNRk11WjUzSHpCV21WYzlwMkdRKzVXa0NJQ3V1?=
 =?utf-8?B?czFGclBYbk11bzQvREMwSHQ3MWs3Qk1YbGRMcnZVMEJRVy9OdXV4VC96WnpB?=
 =?utf-8?B?bi9uekZyN0FPeE9DeEkyV090eGQwc2RuVlg5UnludGRCc0p4bkdpZnRWOUFN?=
 =?utf-8?B?TC90MUJrekhIQ3dqL0ZhcWZIU1J5WTZzQUZHOE16QXhQQzhjbWxvMWJhL0dW?=
 =?utf-8?B?bVd5VGZrUlU1QkdPcFREbnJ1REVtUE0vUG8zOVRBb3NtRW1JQ20rcEY2NFNW?=
 =?utf-8?B?TmM4NFRTWUZmcUE2VlFkcEV3SE9YNk9oczRCR2RUR2tHS2RSczRxbkJkWGs3?=
 =?utf-8?B?SkZtOHRnK3QxMTRjSHYvY1kzTDBydXZsZ1hJT1J2Uy9oS2V2bW1STlBmTWxx?=
 =?utf-8?B?aGJpQVFFdXVPblZFOGR4MEZ0SlhzUzdsdkFWc2FjMC9pMnJJcGhKV3RMWWdJ?=
 =?utf-8?B?UTljRDVpMzNweWlmWWp1RlNiSWVSS2hMYjBCU1BsdENYVlI5WWM2ekZiVGp0?=
 =?utf-8?B?SVN0ajlmVkJBM0VPMXAwZmY0a1JGazBENmlrL09HeXhnUVVxRzBHSkZEWVRj?=
 =?utf-8?B?N2hkMjl5Yy9wL1Z1Z1F1aTlCOTVZVThMeXBBZTU4VE1DYzg4OUgyYit4Vm5U?=
 =?utf-8?B?Umlqb0hmR3B1bXZWTTVVVUs3amg1MGI5ajdoR3JRRExjZzdiVXA4QnI0ZFhW?=
 =?utf-8?B?cXN6QXQ4ZG1Wa1JJV1BiTmdnT25vL3VUbFlyaVorWksyV2ZhczdaRDhuMjU0?=
 =?utf-8?B?ZE5MMis0OEE2OGNrVGZPU05OR1pPcjU5M2NuMVpqRy81ekVuL1R1TGYzZnRz?=
 =?utf-8?B?SFJVMWdrZXkzRGE5SHczMHpQQ2pYK0k2ZjcxdDlJYVJEWUdoNmRVSmJlU3NC?=
 =?utf-8?B?QjNmZzBPMlFXYUNpajVpVHhRay9FMkJ1NThwT1VoWERCWDgrcElnUjRMU1hn?=
 =?utf-8?B?azViL3pIeEZrc3dadDkxWk9DVHYwa0F1V3M2NVQwTkhudU1yNVhyblhvYjl1?=
 =?utf-8?B?MnB6dkZZYWsrVU5LMmdaQW9UVE5HdldCQ2EvdVZtMjcvN2NrY1lkRXBtUHB2?=
 =?utf-8?B?Z2ltMG8wY0hrZnRKb2VzWjNwRTVDTW03SmFXRDJvQ0JGZjRTKzRmR05rNm1U?=
 =?utf-8?B?TGZ4WDI0YndsTjdXc0lPMkhkUVhQOExRQmVhNHNNV3MvWm9RTUZnRlRNd0FZ?=
 =?utf-8?B?NmVqWWQ1bTF1YkFEK0dDVk5zb295V0NMNWQyVG5TRVhLRjZYWi9OYXZRRk81?=
 =?utf-8?B?cGN3dVJUeThmMXFBRk04N3RVeUt4V0pjUjhNWExjaWg1Y1VaUGt3MEd0ZDJT?=
 =?utf-8?B?cnJRMVdHSW1MUUl5alBQNkdxQ1VRNDdSaVdaaHZwTHgzVXlEVm8zbk9JUXZU?=
 =?utf-8?B?aFdOcW9DdEV3U1kzNUVaeFVoNEpBcHhiNlpUR24vdlFPZWlQMzRCQkh2aGEv?=
 =?utf-8?B?STdSVWNnYlN0VUdqcjlWQlIzcVlCdHBJd0Z6SFg0NDBmV0lmTGluaU1nSnZO?=
 =?utf-8?B?ZVlDVk9kcFo3eFBEUkpFNjM0STB3eE9Hb0d5d2g4K0dRa2ZuTzBQSmZQQzZv?=
 =?utf-8?B?ZjFhZWRHNXVUTXhDV2xQNHRWdzQrbkFRZzd4d0NtSkZncGp2RlRLemZxcndz?=
 =?utf-8?Q?IYccV0hgDa7rhFrSa2ttCfhyY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4236e5d1-0589-423d-9fbb-08dc1c08b1cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 11:44:45.0473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JvcjUpR5N3ml5qZZB0+Gr6sE34/vLPcPoL/5LEzafB9b4aqqqLz1X2cXbdall9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7088
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
Cc: "lee@kernel.org" <lee@kernel.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Zhang,
 GuoQing \(Sam\)" <GuoQing.Zhang@amd.com>, "Li, Huazeng" <Huazeng.Li@amd.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Xu,
 Colin" <Colin.Xu@amd.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "Yang, Philip" <Philip.Yang@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "bp@alien8.de" <bp@alien8.de>, "mripard@kernel.org" <mripard@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "Zhu, James" <James.Zhu@amd.com>,
 "surenb@google.com" <surenb@google.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "SHANMUGAM,
 SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "nirmoy.das@intel.com" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.01.24 um 09:33 schrieb Zhou, Xianrong:
> [AMD Official Use Only - General]
>
>>> The vmf_insert_pfn_prot could cause unnecessary double faults on a
>>> device pfn. Because currently the vmf_insert_pfn_prot does not make
>>> the pfn writable so the pte entry is normally read-only or dirty
>>> catching.
>> What? How do you got to this conclusion?
> Sorry. I did not mention that this problem only exists on arm64 platform.

Ok, that makes at least a little bit more sense.

> Because on arm64 platform the PTE_RDONLY is automatically attached to
> the userspace pte entries even through VM_WRITE + VM_SHARE.
> The  PTE_RDONLY needs to be cleared in vmf_insert_pfn_prot. However
> vmf_insert_pfn_prot do not make the pte writable passing false @mkwrite
> to insert_pfn.

Question is why is arm64 doing this? As far as I can see they must have 
some hardware reason for that.

The mkwrite parameter to insert_pfn() was added by commit b2770da642540 
to make insert_pfn() look more like insert_pfn_pmd() so that the DAX 
code can insert PTEs which are writable and dirty at the same time.

This is a completely different use case to what you try to use it here 
for and that looks extremely fishy to me.

Regards,
Christian.

>
>>> The first fault only sets up the pte entry which actually is dirty
>>> catching. And the second immediate fault to the pfn due to first dirty
>>> catching when the cpu re-execute the store instruction.
>> It could be that this is done to work around some hw behavior, but not
>> because of dirty catching.
>>
>>> Normally if the drivers call vmf_insert_pfn_prot and also supply
>>> 'pfn_mkwrite' callback within vm_operations_struct which requires the
>>> pte to be dirty catching then the vmf_insert_pfn_prot and the double
>>> fault are reasonable. It is not a problem.
>> Well, as far as I can see that behavior absolutely doesn't make sense.
>>
>> When pfn_mkwrite is requested then the driver should use PAGE_COPY, which
>> is exactly what VMWGFX (the only driver using dirty tracking) is doing.
>>
>> Everybody else uses PAGE_SHARED which should make the pte writeable
>> immediately.
>>
>> Regards,
>> Christian.
>>
>>> However the most of drivers calling vmf_insert_pfn_prot do not supply
>>> the 'pfn_mkwrite' callback so that the second fault is unnecessary.
>>>
>>> So just like vmf_insert_mixed and vmf_insert_mixed_mkwrite pair, we
>>> should also supply vmf_insert_pfn_mkwrite for drivers as well.
>>>
>>> Signed-off-by: Xianrong Zhou <Xianrong.Zhou@amd.com>
>>> ---
>>>    arch/x86/entry/vdso/vma.c                  |  3 ++-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c            |  8 +++++---
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 +++++---
>>>    include/drm/ttm/ttm_bo.h                   |  3 ++-
>>>    include/linux/mm.h                         |  2 +-
>>>    mm/memory.c                                | 14 +++++++++++---
>>>    10 files changed, 30 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
>>> index 7645730dc228..dd2431c2975f 100644
>>> --- a/arch/x86/entry/vdso/vma.c
>>> +++ b/arch/x86/entry/vdso/vma.c
>>> @@ -185,7 +185,8 @@ static vm_fault_t vvar_fault(const struct
>> vm_special_mapping *sm,
>>>              if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
>> {
>>>                      return vmf_insert_pfn_prot(vma, vmf->address,
>>>                                      __pa(pvti) >> PAGE_SHIFT,
>>> -                                   pgprot_decrypted(vma-
>>> vm_page_prot));
>>> +                                   pgprot_decrypted(vma-
>>> vm_page_prot),
>>> +                                   true);
>>>              }
>>>      } else if (sym_offset == image->sym_hvclock_page) {
>>>              pfn = hv_get_tsc_pfn();
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 49a5f1c73b3e..adcb20d9e624 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -64,7 +64,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault
>> *vmf)
>>>              }
>>>
>>>              ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>>> vm_page_prot,
>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>> true);
>>>              drm_dev_exit(idx);
>>>      } else {
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 9227f8146a58..c6f13ae6c308 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -1114,7 +1114,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault
>>> *vmf)
>>>
>>>      if (drm_dev_enter(dev, &idx)) {
>>>              ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
>>> vm_page_prot,
>>> -                                          TTM_BO_VM_NUM_PREFAULT);
>>> +                                          TTM_BO_VM_NUM_PREFAULT,
>> true);
>>>              drm_dev_exit(idx);
>>>      } else {
>>>              ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
>>> vm_page_prot); diff
>>> --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index 49c2bcbef129..7e1453762ec9 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault
>>> *vmf)
>>>
>>>      nouveau_bo_del_io_reserve_lru(bo);
>>>      prot = vm_get_page_prot(vma->vm_flags);
>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>> TTM_BO_VM_NUM_PREFAULT);
>>> +   ret = ttm_bo_vm_fault_reserved(vmf, prot,
>> TTM_BO_VM_NUM_PREFAULT,
>>> +true);
>>>      nouveau_bo_add_io_reserve_lru(bo);
>>>      if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> FAULT_FLAG_RETRY_NOWAIT))
>>>              return ret;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 3fec3acdaf28..b21cf00ae162 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -62,7 +62,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault
>> *vmf)
>>>              goto unlock_resv;
>>>
>>>      ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>>> -                                  TTM_BO_VM_NUM_PREFAULT);
>>> +                                  TTM_BO_VM_NUM_PREFAULT, true);
>>>      if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> FAULT_FLAG_RETRY_NOWAIT))
>>>              goto unlock_mclk;
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c index
>> 4212b8c91dd4..7d14a7d267aa
>>> 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -167,6 +167,7 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>     * @num_prefault: Maximum number of prefault pages. The caller may
>> want to
>>>     * specify this based on madvice settings and the size of the GPU object
>>>     * backed by the memory.
>>> + * @mkwrite: make the pfn or page writable
>>>     *
>>>     * This function inserts one or more page table entries pointing to the
>>>     * memory backing the buffer object, and then returns a return code
>>> @@ -180,7 +181,8 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>>     */
>>>    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>                                  pgprot_t prot,
>>> -                               pgoff_t num_prefault)
>>> +                               pgoff_t num_prefault,
>>> +                               bool mkwrite)
>>>    {
>>>      struct vm_area_struct *vma = vmf->vma;
>>>      struct ttm_buffer_object *bo = vma->vm_private_data; @@ -263,7
>>> +265,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>               * at arbitrary times while the data is mmap'ed.
>>>               * See vmf_insert_pfn_prot() for a discussion.
>>>               */
>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot, mkwrite);
>>>
>>>              /* Never error on prefaulted PTEs */
>>>              if (unlikely((ret & VM_FAULT_ERROR))) { @@ -312,7 +314,7
>> @@
>>> vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
>>>      /* Prefault the entire VMA range right away to avoid further faults */
>>>      for (address = vma->vm_start; address < vma->vm_end;
>>>           address += PAGE_SIZE)
>>> -           ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>> +           ret = vmf_insert_pfn_prot(vma, address, pfn, prot, true);
>>>
>>>      return ret;
>>>    }
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> index 74ff2812d66a..bb8e4b641681 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>>> @@ -452,12 +452,14 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault
>> *vmf)
>>>       * sure the page protection is write-enabled so we don't get
>>>       * a lot of unnecessary write faults.
>>>       */
>>> -   if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
>>> +   if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
>> {
>>>              prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>>> -   else
>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault,
>> false);
>>> +   } else {
>>>              prot = vm_get_page_prot(vma->vm_flags);
>>> +           ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault,
>> true);
>>> +   }
>>>
>>> -   ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>>>      if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> FAULT_FLAG_RETRY_NOWAIT))
>>>              return ret;
>>>
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h index
>>> 0223a41a64b2..66e293db69ee 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -386,7 +386,8 @@ vm_fault_t ttm_bo_vm_reserve(struct
>> ttm_buffer_object *bo,
>>>                           struct vm_fault *vmf);
>>>    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>                                  pgprot_t prot,
>>> -                               pgoff_t num_prefault);
>>> +                               pgoff_t num_prefault,
>>> +                               bool mkwrite);
>>>    vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>>>    void ttm_bo_vm_open(struct vm_area_struct *vma);
>>>    void ttm_bo_vm_close(struct vm_area_struct *vma); diff --git
>>> a/include/linux/mm.h b/include/linux/mm.h index
>>> f5a97dec5169..f8868e28ea04 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -3553,7 +3553,7 @@ int vm_map_pages_zero(struct vm_area_struct
>> *vma, struct page **pages,
>>>    vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long
>> addr,
>>>                      unsigned long pfn);
>>>    vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned
>> long addr,
>>> -                   unsigned long pfn, pgprot_t pgprot);
>>> +                   unsigned long pfn, pgprot_t pgprot, bool mkwrite);
>>>    vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long
>> addr,
>>>                      pfn_t pfn);
>>>    vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma, diff
>>> --git a/mm/memory.c b/mm/memory.c index 7e1f4849463a..2c28f1a349ff
>>> 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -2195,6 +2195,7 @@ static vm_fault_t insert_pfn(struct
>> vm_area_struct *vma, unsigned long addr,
>>>     * @addr: target user address of this page
>>>     * @pfn: source kernel pfn
>>>     * @pgprot: pgprot flags for the inserted page
>>> + * @mkwrite: make the pfn writable
>>>     *
>>>     * This is exactly like vmf_insert_pfn(), except that it allows drivers
>>>     * to override pgprot on a per-page basis.
>>> @@ -2223,7 +2224,7 @@ static vm_fault_t insert_pfn(struct
>> vm_area_struct *vma, unsigned long addr,
>>>     * Return: vm_fault_t value.
>>>     */
>>>    vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned
>> long addr,
>>> -                   unsigned long pfn, pgprot_t pgprot)
>>> +                   unsigned long pfn, pgprot_t pgprot, bool mkwrite)
>>>    {
>>>      /*
>>>       * Technically, architectures with pte_special can avoid all these
>>> @@ -2246,7 +2247,7 @@ vm_fault_t vmf_insert_pfn_prot(struct
>> vm_area_struct *vma, unsigned long addr,
>>>      track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
>>>
>>>      return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
>>> -                   false);
>>> +                   mkwrite);
>>>    }
>>>    EXPORT_SYMBOL(vmf_insert_pfn_prot);
>>>
>>> @@ -2273,10 +2274,17 @@ EXPORT_SYMBOL(vmf_insert_pfn_prot);
>>>    vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long
>> addr,
>>>                      unsigned long pfn)
>>>    {
>>> -   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot);
>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>>> +false);
>>>    }
>>>    EXPORT_SYMBOL(vmf_insert_pfn);
>>>
>>> +vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma, unsigned
>> long addr,
>>> +                   unsigned long pfn)
>>> +{
>>> +   return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot,
>> true);
>>> +} EXPORT_SYMBOL(vmf_insert_pfn_mkwrite);
>>> +
>>>    static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
>>>    {
>>>      /* these checks mirror the abort conditions in vm_normal_page */

