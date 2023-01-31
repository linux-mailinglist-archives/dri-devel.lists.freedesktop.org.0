Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E6682AFB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 11:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37FC10E16C;
	Tue, 31 Jan 2023 10:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBD810E336;
 Tue, 31 Jan 2023 10:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNjlF19j/JhtVWE4NnawRleEthxWRK9jpqBS1YGxnqsvyX51MGPU+eEpo0XzRihYWlUCC/yOR7kotC3IK+wcWYoIzgAFxC7B59IxTiMI+rwrlBUptzXtJfTsSwsQlzNng0qUDZHuEzoMZB8r5xaPhXVBFYuIPE1y/nKeyxlVdHBtYwtDn7NH7ggR3obpWiyHxh7EMqZJid6OnV/MsT7xEQ2lZtdMtiDk8hEfk4kucttZ+AdC3VK/03bkMlLIXn16sqpSOSe7TdfX4/gFieqf8W/4QRNoj9O+IMMrRtr2obX4Ak9UcsfBPpefDn+qKV6VSmtsNuwDb6IbyVDuUg2w+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qy6QdKdl6K2NLCVSAwT7QG/LQ60LSLq+0bRi+LGzJcI=;
 b=gV75RrVXFi6wrMJMzXoCZoCp1yD//hfIF2UX0qe/pGrNU9VAXl2dRf/X8AwsmrZZfOatkNjRB0/yHsFSLy1ZNYdSx5SeYG6ATP5iEiCvCFN65O2i8dfOp0sfy5ri1pqDNyRyjWNua/nkXPP7Kl406nrAvZXT1xPxj7exoStWglJ3JaT56F21/4kTtUAR2XhOqKqr/ql5FkEJsBJuRzro01lXQTZWslLNtQ2MR6zyhBzeBKFNA3Z0UUth+5G1d/iZ9JiqLK9dcum5TlwMbz++0R6mnmvoffBLpfrWKgtjxwBBYQA6N2Guqsyd731U/pjbuFDduje+Pk/USDU9ZTKJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy6QdKdl6K2NLCVSAwT7QG/LQ60LSLq+0bRi+LGzJcI=;
 b=WQLs37npcXNrQAOSGoLIp6JM5xR7LyAEyVKShTg8d2yFL2C2RDnZcGf49/gj6k25NZuQ47IYvFJhILTVMdN7oKkPwrePg7j1Yvey6/LbzMzZCL8ALmOltYfTa57FFvuTodAnOmfFAwKo8azgUFZy1HZEoTKwgq8cw9/RzkGXKH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:58:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.030; Tue, 31 Jan 2023
 10:58:41 +0000
Message-ID: <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
Date: Tue, 31 Jan 2023 11:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c40eedf-9992-414c-7f9c-08db037a1cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V887ZgWfmKWsBgcs/NBo/Gv3M/96wcXTOuqKLCJyRCzd23e8YJOVG90pIZ4Cbxp10ReJuAYdgQJWgAuzSTqU+dAQu0nXMY9IhE0Hba1E84IY+fakh/8J8MgHNVT1bZyWYulBUEXaTojNnwNyEv74bnEQCR7Ve2AfQnx6J7IpQ1cwqJTZb+tAYnL3wJGsf6z6hpgjOB+qua3c2JmI5Uvs7P184Fah+xKzjB6vbKDi3N97XK3fNyqBv7ByNZ0t65g4i9Dg0oS+orYvuCDUWdyi52sbKY17HmVxdZwZXHajvL2Zz/3yxx45Tpb0YBZ+XHWvrg9DYbwEBLdQRVXcepYCTKicxYktGkeIia5A6DlkmxRJbTXc62OvEp4eHx/9sw/ROerJrNrgbaavdYVKaXC2yYmeNXQiKIZaHqL32jq6BzGjoKwwsf2JYT/fCJc27gl4j/Whi0KsiNeGOrbhqtNacGzCu/kYes5poaXSgE+4V3eOlXthbzalCrtH3Xp2AGWh6UzgmRaBOaz2bHDyODOdnQa3LZgo38c72zfNQsoANpFbOEFUaqen3qTOHGYU6sv8OrQpVkx/qFJ+IqgmjGpOabPN/F69wdcYLhXevfeFgVt+utUgnI8D17Yb7HSkAtS1me4tp2UBwJ+yL+p3uhLl3VOHuewqrJA9Kw7QlOgcjFLcWkZKeX7/IyF1wLZHNTqxm1d3UMNPY7KXlHXnc/B2GdKl7BcuVKrWXsouLd9oOac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(31686004)(2616005)(186003)(66556008)(66946007)(8676002)(4326008)(66476007)(26005)(6512007)(53546011)(86362001)(2906002)(36756003)(31696002)(41300700001)(8936002)(83380400001)(66899018)(478600001)(54906003)(6486002)(316002)(6506007)(38100700002)(110136005)(6666004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29GVDlmb0YvVUJmMDliWDViZ0hDSHFLeTkxMU5jTnQ5NkdKRTZ1d2ZvV2o3?=
 =?utf-8?B?WFIyb2tVbDdCUEg0YmpWSUpJV3E0TklYWTZwSkwwWTJGYUQ1WFl5OUcwYTkw?=
 =?utf-8?B?Rko1RVhpZSsrenhYWkUwYUtTRzZXUUtnTDErQVJ5TlZxZzBmWnplSCsyTnpZ?=
 =?utf-8?B?QkRORkY0ZUdBNUp2Nk9qV0dqRjJDWjEzeGJIdmo5bmU2Z01hUmhIS0dYK3dy?=
 =?utf-8?B?Qko1VG1yTTlCK2FzTjc3NkNJYjJIMFJFOC9CMFN1MjB3eWYyZHJsU1NOdENN?=
 =?utf-8?B?eU1mRUhNdUFhUkUreDE5RndFa1Mrek96cFRDSWZzenNhSnJ2UG1SQXJ1dGY2?=
 =?utf-8?B?TytmUTFuWFU3UEZOdVZQYWxDcnp6eHoyRTZ1QVBoV2p6cUI0R3owaE9tVGIw?=
 =?utf-8?B?MmUzeTczWWZXZ3dDYU16WDZ3MW9adEg3a2VHb3Q2a09jcDdxeGhKZUkxODFr?=
 =?utf-8?B?QytGSTBqWmZCcjBhT1A2QTdueSt1WGNWL0hwRDdoVnJqQ1RMU2dkOW5jTUxk?=
 =?utf-8?B?bTdLbXdHZDQvbEpZM1ZFZjBQVm1NZFZsR21DM3FpRXpuRzd2V2hoOFhOUWIv?=
 =?utf-8?B?dWZzMS85T2lDekJnaVhDS0N1Y3FLOWIvNDhFTDVvRmU2VG1seFVmRC9ua0Rq?=
 =?utf-8?B?WUJZR2hSaUlJQ3hNVkduTzFrbko3ZVlTaUZzdzV2VHlBRTF3QW8rd1dXeHpj?=
 =?utf-8?B?aDVsN1MwM3ErdlovTGRqMUtseHpDWFJVUThnNmdTNlVoQ0VsNk93ZHZTcGg3?=
 =?utf-8?B?dlBSWk4zRWQ1R01oNjRmbmJTOERYT2JWWVQySVUzMzU5WW03UEliMCtEelda?=
 =?utf-8?B?VHdDVEtnMDFtbkQ2Z3hOKzhhVTc4bkt2SUJDSE1jRWNZUGh2K1JldjVrWGg5?=
 =?utf-8?B?OFAzRTd5SmFUZldFYWg0ZVFkeUQzVnNzcEhmRjBzMnFyYWk5NXF1MzV4QUxk?=
 =?utf-8?B?eitJcU9FZW0wdVU3L055aU1ZZ1lLcVRBeElWTktNdG5yTExzV1FldDZBWDY2?=
 =?utf-8?B?TUY3Q1pjeGg5a2UybDVTRFRvb2VFWmlBalRNRzB6R2h5blBEK295VFVsd0VK?=
 =?utf-8?B?QWZlaTZSK3NHOEx1dTRSZWNpajRWNmEyRGFEeXc3UHNuRGxjMDVlNWlSekdM?=
 =?utf-8?B?alI4cXBIVzBkeUVRelFKV29paGRuT1NGekVBM0JJVHg2NFF4NGFvNFBVRng0?=
 =?utf-8?B?Z1dud3hIa3lRTkxZOGk2ZUZTN1p3bFpHdzUrSVR2RWZFQkxmdFExZ3VzRURL?=
 =?utf-8?B?dUxiRnFSemtjbWh6c2Mrd0ZQU1ZrbUxKRFBpa01OdnlYR1V1SzVqVzUrTDVx?=
 =?utf-8?B?TTJZcnRDcndrWlhTTi9ZMXV6aUcyMldrenJTNzIrZEhYc3cvS3hESmx0alRB?=
 =?utf-8?B?eG5NSm1iWGdmYS9OL1k5TjUyUG5zZGthWW9pOFhkNWw4YmRleG9obzVCVEhD?=
 =?utf-8?B?MW54OHBrYlVvK0dOYkhsTkloVU51WjJJWEgwcnZacjhqek9VdmZwQmlyMnlr?=
 =?utf-8?B?NVI5M1hiVzVKcnk2Y1Rtb3dqandsN3dxM0o1MGV0aTRNNnU4VzZvTWhGNEor?=
 =?utf-8?B?blpKdHZWbmRvdUtDN0s4V1Y2OWtnaWtzK21xY1hEWHovNmU1eVlQRjdMU3hS?=
 =?utf-8?B?SVZ4a2U2bnF3dXB4UGIrUitpNEJNd1k0aWExR3M5OEZKMDQ0eDFwVzNQZlQ2?=
 =?utf-8?B?RlJERXNjUFV2V01YR3VaT0xra2JqVFhodDlKQTV5OFpXbUhJdFNSd05tTHY0?=
 =?utf-8?B?TFB3eGE1bTFUKy9SVWFPSzBzRTJIem40dmJVSDUrMEttbkMyTE1UYlppR1ZV?=
 =?utf-8?B?WUtjenFEbUNPd2d3WjhYS0Y2UVJvVTA1TmV0cS9RMVczRFU0cjlJUnZWMy82?=
 =?utf-8?B?NmxvQTg2RUdZaXU0dkNZOWEzRVovSlEwdGF6T3VFNHg1WE9MMGFCWXBpSysr?=
 =?utf-8?B?Wk9GMDNLbm91RXBXQWZYaWtPZG83SFEvbngrNnp1MG1ycTF5bVcvY1htYXYy?=
 =?utf-8?B?VHIzL2hyZmhnWkdLbU9CdVBqLzFKVXlUL3g0MVBXRGViSVpnTUxkc240alRh?=
 =?utf-8?B?M1BDZ3JJYy9iZ1o3TGZyTVNmVGVQWFkxZWtUeHhrUEV4LzVPRVY1ZGUzdjJR?=
 =?utf-8?Q?nf4RAvC6UVdDZlLp4J5C4/+Wm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c40eedf-9992-414c-7f9c-08db037a1cdc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:58:40.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2rvVRClDQi8L+snnmfryJ9dQ906a9fL8+Mp/6V8HdPpSXG7BgvxXGjNQtzJcD+z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.01.23 um 10:17 schrieb Chen, Guchun:
> Hi Piccoli,
>
> Please ignore my request of full dmesg log. I can reproduce the issue and get the same failure callstack by returning early with an error code prior to amdgpu_device_init_schedulers.
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Chen, Guchun
> Sent: Tuesday, January 31, 2023 2:37 PM
> To: Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli <gpiccoli@igalia.com>
> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: RE: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
>
> Hi Piccoli,
>
> I agree with Alex's point, using ring->sched.name for such check is not a good way. BTW, can you please attach a full dmesg long in bad case to help me understand more?
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Tuesday, January 31, 2023 6:30 AM
> To: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Chen, Guchun <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
>
> On Mon, Jan 30, 2023 at 4:51 PM Guilherme G. Piccoli <gpiccoli@igalia.com> wrote:
>> + Luben
>>
>> (sorry, missed that in the first submission).
>>
>> On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
>>> Currently amdgpu calls drm_sched_fini() from the fence driver sw
>>> fini routine - such function is expected to be called only after the
>>> respective init function - drm_sched_init() - was executed successfully.
>>>
>>> Happens that we faced a driver probe failure in the Steam Deck
>>> recently, and the function drm_sched_fini() was called even without
>>> its counter-part had been previously called, causing the following oops:
>>>
>>> amdgpu: probe of 0000:04:00.0 failed with error -110
>>> BUG: kernel NULL pointer dereference, address: 0000000000000090 PGD
>>> 0 P4D 0
>>> Oops: 0002 [#1] PREEMPT SMP NOPTI
>>> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli
>>> #338 Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
>>> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched] [...] Call Trace:
>>>   <TASK>
>>>   amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>>>   amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>>>   amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>>>   devm_drm_dev_init_release+0x49/0x70
>>>   [...]
>>>
>>> To prevent that, check if the drm_sched was properly initialized for
>>> a given ring before calling its fini counter-part.
>>>
>>> Notice ideally we'd use sched.ready for that; such field is set as
>>> the latest thing on drm_sched_init(). But amdgpu seems to "override"
>>> the meaning of such field - in the above oops for example, it was a
>>> GFX ring causing the crash, and the sched.ready field was set to
>>> true in the ring init routine, regardless of the state of the DRM scheduler. Hence, we ended-up using another sched field.
>>>>> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence
>>>>> driver fini in s3 test (v2)")
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Guchun Chen <guchun.chen@amd.com>
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>> ---
>>>
>>>
>>> Hi folks, first of all thanks in advance for reviews / comments!
>>> Notice that I've used the Fixes tag more in the sense to bring it to
>>> stable, I didn't find a good patch candidate that added the call to
>>> drm_sched_fini(), was reaching way too old commits...so
>>> 067f44c8b459 seems a good candidate - or maybe not?
>>>
>>> Now, with regards sched.ready, spent a bit of time to figure what
>>> was happening...would be feasible maybe to stop using that to mark
>>> some kind ring status? I think it should be possible to add a flag
>>> to the ring structure for that, and free sched.ready from being
>>> manipulate by the amdgpu driver, what's your thoughts on that?
> It's been a while, but IIRC, we used to have a ring->ready field in the driver which at some point got migrated out of the driver into the GPU scheduler and the driver side code never got cleaned up.  I think we should probably just drop the driver messing with that field and leave it up to the drm scheduler.

To use ring->ready is not a good idea since this doesn't specify if the 
scheduler was initialized, but rather if bringup of the engine worked.

It's perfectly possible that the scheduler was initialized, but then the 
IB test failed later on.

I strongly suggest to use scheduler->ops instead since those are set 
during init and mandatory for correct operation.

Christian.

>
> Alex
>
>
>>> I could try myself, but first of course I'd like to raise the
>>> "temperature" on this topic and check if somebody is already working
>>> on that.
>>>
>>> Cheers,
>>>
>>> Guilherme
>>>
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index 00444203220d..e154eb8241fb 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>                if (!ring || !ring->fence_drv.initialized)
>>>                        continue;
>>>
>>> -             if (!ring->no_scheduler)
>>> +             /*
>>> +              * Notice we check for sched.name since there's some
>>> +              * override on the meaning of sched.ready by amdgpu.
>>> +              * The natural check would be sched.ready, which is
>>> +              * set as drm_sched_init() finishes...
>>> +              */
>>> +             if (!ring->no_scheduler && ring->sched.name)
>>>                        drm_sched_fini(&ring->sched);
>>>
>>>                for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)

