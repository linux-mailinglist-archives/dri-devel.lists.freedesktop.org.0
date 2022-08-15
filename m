Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E05592F80
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 15:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E7BC5E4A;
	Mon, 15 Aug 2022 13:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE25C5D31;
 Mon, 15 Aug 2022 13:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xx/+yFx62zwolwPhBtsJ3EhFv7dJF1bi1mmscGGN+hlnI1pAxF8ptfolkTvetRS3QQtRW7B13ZRKxMf6tWLUXhGVGiRnf3ZPLK0vnXsPBS0HXdMh8KB+52gCfjTBlsXzsmphPX8Ped2L/mB8tV51mEpRpa493470MrgAPdl/USUv5xXlyi7DIXWBLfoH3V5kSfOaxXLoEyT8jPN8xmM+kIU3Hh9U1ppWL0cdpk5ROhcaH811056WI9Or3UsaEyczM9Dx8zcpLmmJ0V9LVRWgd+3BbF2ezHIYp28LHROIFT4fFAjbiNwA+mC2ZrsZZIjXfRptmtwYfwOt0htjBY/C1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQSq4wxA2nuQU5tz6eTzbLn6+CgrZlpIzvYwJd8vOlA=;
 b=jpAQq08coj/3h9obVZ1TCJe0KFBhW3jFDMZoZXTeucf+dIOY3EvCt/glegABbHFstmHBarXl1XFPiWzu1Za7DyHv+j6Y3msUTMgk+D0n4Tbw4j3lq7HzYfuvwEqsfMbHTdlUGxjlJryyUd+ei7qt6S/tCRm0s7VjyEHPPa6ta3M4NRwbT7SNERcB3T2LwRoiyq5IHYHk6O/P5jTuZbB+u9dPyWraEUXNXHCWvbAzg08etilj76Mr8ju826uQFZjBV7YPJCA+14m9AVWbRKmBkdzsJ5DFg8Hl4bfJLMH4Fg8ozhMP8JpShjdPTwp9nYaP9MFmPpb/OO7BcAyrjxjYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQSq4wxA2nuQU5tz6eTzbLn6+CgrZlpIzvYwJd8vOlA=;
 b=43fLkNUyBHsWUtnkWbnNKsVcLCtTxDrhyWdIlUTebVxD73L1tMNjstMqP+NFpc6VWoCaxqEe4XdbTtGisnthzg+C2bVwHqtgB7MZiNQWKF378jxZFCPXFgogJlTOVmwSfARrnmxzADzk7DQXvZbPCDkZfOTH+HDtRjcsI2assA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1788.namprd12.prod.outlook.com (2603:10b6:3:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 13:12:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 13:12:23 +0000
Message-ID: <c3c1310b-5e84-e4e9-0df9-3f45c976a508@amd.com>
Date: Mon, 15 Aug 2022 15:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/radeon: add a force flush to delay work when radeon
Content-Language: en-US
To: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220811072540.964309-1-lizhenneng@kylinos.cn>
 <b23e4037-2030-32d0-d626-b5a846fcafeb@gmail.com>
 <db2a43da-256d-402e-882b-c05436d4e83b@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <db2a43da-256d-402e-882b-c05436d4e83b@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10d7949-8940-425f-b7ab-08da7ebfca84
X-MS-TrafficTypeDiagnostic: DM5PR12MB1788:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J9Vl4qKqMYlExBJ063GhvRSSe2Fz65yfUaEzQZP/wiWANyq+TBfD5roQoY8qtR61J8PAVlRWBM1VuR4bVVBDod6dnu++aDgUHfmtAIzBLxahlVuaMNlWNfUsNqcs3KNsliMvNz5agDjeT5VfK6B9LzNaTcA7kYise2qYSBOx4CywXJHbKsMgLRo8uqMdPkAZU8EaipiY/LhhYIcHuLymiuuAZRLjOoSb8T4z9ArmA7WhEsM6VjmOE3CbbJ+PTnGRF6vuqX4PpqOC8Aa2ERiQxzVJIuV6J2/VdpQTONvhv0Qjp4ZdVLpRKx+WDZXTgMHvbSmGlSsbRsf42CgckPsGuJb5P/TVIpjmcGJ5vQMLr12ifj3Jr7ftNNeFRElXoB//zXDCcYGbcIh3DxUunGRE5L5wbYMO2naXLs8sGuA0/4LmENWO/1kmRPtrj75c9J03S2ONRJZkZ8l7WZ043G8V4dVNPTG2AVW1kb8UseNfKbryRjDuV3MeG6grrsXBWP4IOSXUHFyFaEN6ceS688FMeC+RSvXEBYAx8n5d8XSaB3gI1QK3Qv+zG0a+FsfvZjtry3HUfixJXFPw5gzdpeQt3Z5SrR8AevrcL6VnWxZjAG/Su9EQLsxmpO92Pt4K/5F4/Sa/W2Ome2OP+xBT2P5+fr4yRY31c5FwYOUEzIrM7cLWlyXv3oJx1+Ah13kjemvc4z+SZAjjnq3uTZnOo6xyCTxe3ID6yZlDMU37pJlRujDi0/5e6CM32eLVqyLB5EkAY9L5oTJYLPvpsrUNENzGFmEEX1bx2fQLt4hSU3pE1J48HI0eAs6h1oh5NjDbBhli7hyI8g/ssXWvm8O6Dtamtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(54906003)(41300700001)(2616005)(6666004)(86362001)(6506007)(186003)(36756003)(6512007)(66574015)(83380400001)(316002)(6636002)(110136005)(31696002)(4326008)(66946007)(66476007)(2906002)(66556008)(6486002)(5660300002)(478600001)(31686004)(8676002)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJzS3hUWU5BclNyQ0lhWDJZbFdZL2haSGdzZXNVZU5CYzZta2hUMmZ4N2pz?=
 =?utf-8?B?Y1llL2VaNk5xK21idWJBcTBvQ0RWcG5iNEpZd2xVK05UOG56anVGRVZoQzZm?=
 =?utf-8?B?ZDkvTzdqM1NURlNWQ3Z0d0Y3bzArVnhuVmxDNUNnVlI2c3BpZW5WcUJ6WVpx?=
 =?utf-8?B?WlVXeUQ2L3dJTkVIY2RrYmducXZoU1QvdERCZjRsUVNWdGkxcEkrT3RoWUF5?=
 =?utf-8?B?VW85MnU3RmhiRU4rRU5UOElOeGFjTDhvNEI5d3QzOFh1Y1BEbUJEbGRuV2Rv?=
 =?utf-8?B?ZW1laEd0S0Vma0twVkxLS2M0cS9NUVByVEFiQjY0UWJXblRMVkljVkVkYzlq?=
 =?utf-8?B?dHc5d2FDc0ZnMWpVdHIxYmFEaHkzZ2FHb0pCeEY4aysxc2VJcVNrczBRT1Vz?=
 =?utf-8?B?UWJheXFnVUt4cmpYWnJWV2pnOHJFYTRhSEwyVjExVkMydGZISTgzQWFzYmQ0?=
 =?utf-8?B?N1M3YVJSZjM1dlJtMjA1YnByeTd4Nm5za3BWWlIvWHgvUUdScGFmaUR4VHJm?=
 =?utf-8?B?RTh2T2ZnbHhxMmpodVRVOFhiakwzOWVXYUFGT0RhUUtESnZSUlZ2VGdnRHk2?=
 =?utf-8?B?MnBtZ00xcEMvemE1WFhpWTdJTWN0ekFCbmIxZms2NlV2YmpManp0eXdyRjJ5?=
 =?utf-8?B?NHJTdlBseUxjS2VnRC9VSS9SU0wyV09YLzVWSWpPcEMxd1R6UTE3YTZxOGtB?=
 =?utf-8?B?b2JTaXUxTEhubEpleWd5Y3FGdGtibUlGM0NrWVJXNWxnVW94anRIVUN0S1h4?=
 =?utf-8?B?Q3kwdkU5U25WelpjRmRkNFFOTUFjb0FRMTZPNzVXMG5Lb2VIcGVVTXFaaEFm?=
 =?utf-8?B?c2t3djc0c2s0RlRPUyt2NFZ2RTBzOFNyZDlSLzU0NlJNUlgydVRPS0FKcXpI?=
 =?utf-8?B?STAwaGkrM05PaTJGYkRqaWVZRW1uK0h5aWxoaDdxVDlkUGk3aS9IN0ZhbmYv?=
 =?utf-8?B?dG9wbjVGVlI4Tk5uSHJnZi9FUENEd080aFMvTW0wblh3QnlHS2hEYlI2VGtO?=
 =?utf-8?B?cms0czM0eFp1L0lnZjhic0ZObUdNaXRzeHpPS3dVcEpEYmpxaHZQaEVDdW54?=
 =?utf-8?B?T1NyeGZZRzhScmpVeENabDdraFljVHp5R2FOaEV1VkFUK1dHVmNIVml3OFNN?=
 =?utf-8?B?QVdIMzZFSEt2enVOS0N4MjVrR2hhMUJSTG5RTjU1LythY0VEQXRzclFlMkE1?=
 =?utf-8?B?Z0hueHBYK2E1RVVmS1NHNzEvc0oya3RMNnlVbUp1U1BCcTNsRm9qUDE4bGRV?=
 =?utf-8?B?UnVXcjFrVW84L3d4MTM3UzUwTmVaNGNIT2Y5VVRoRHlRMW9lYTY2Rjg1UXdQ?=
 =?utf-8?B?eFh5QlJkTGg3ZXFlcFFDREtQKzVydDRTTmRZNXdwclhWZ3FveVd0MkhoRTN1?=
 =?utf-8?B?eVJNa3Q4eUg5K3JzWTdWdHloVDFvMFRScEExYW5jMEVJamtnV0VuTDN0cU5N?=
 =?utf-8?B?TGVFdjJ3SnRHc3A2Um54cGlDMHdqOUxEYUdWanR4ak9vbDQwcDBwKzN2Qm1V?=
 =?utf-8?B?SUR6MmRlQW5RSUh0MW4rc1o3aWZhdmZINjhQZ0hRSjB3VXNYckJtMFlKTXpk?=
 =?utf-8?B?VGxpNXJRQUxQTStaakN6UlhFQ2JLdGJRemxOUTEzWmNuWElXREFlUFkrMWQv?=
 =?utf-8?B?a1VDOVozTHA0M3hmRStFdjdtZG1BVDlwOTZDNlp5VlNZS0RramVYU1NrdWRT?=
 =?utf-8?B?cFh5ZW5hMXZpKzdKNGFEYjVRZWVsTFFQOHlyazlyU2Z4VU1ZV2laVXdHcGk1?=
 =?utf-8?B?OWgzK3JLWXlXSU50RVNyd2wreTZKRFlUVlRiNlFsNjdWOVJpN09GWGpNUHl1?=
 =?utf-8?B?TzkyTmtPbVRrNTNpTUl4OFFxejhsZVlnUWVYYktjWnBxOGEyZ0ZpM2VqelRn?=
 =?utf-8?B?MkpvT3Q0cE9NYTRtbXI3R0dncDNETk5aNFkvSkIxQVhHL0JDZ3hQbmppVWtL?=
 =?utf-8?B?a2FzNXlnanAzeTJFOWVnVDdYa2dqWjBRT3VWeDd0TmQ5SXJBSUc1SVdZK2E4?=
 =?utf-8?B?QU8xL0ViNy9pd21leHJWbVcyMmx2bjdRQmlPRmcwaDNvTk1LWGJTWXVlQmVK?=
 =?utf-8?B?ekJ0OTFtNHErYTJQcWg2KytyZVJmWGFkeURjNExrald2bWI3ZFp1Znh6dXpN?=
 =?utf-8?B?bFAwOWJJeUdNdVI0blp6TUFXMWxXQTBHYlErUGpHRG5nSVl1Vmg4TU5LTWFG?=
 =?utf-8?Q?d4FIWckU8NvOdzejuGrqjfYIRKtcbhzEUYurMGSU0QP0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10d7949-8940-425f-b7ab-08da7ebfca84
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 13:12:23.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahszCX0VXaEKbSLxK4/KuT/XWGjYguRSi2uyU442aUmPDzrWus+TJcJKUPjLdBNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1788
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
Cc: David Airlie <airlied@linux.ie>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 09:34 schrieb 李真能:
>
> 在 2022/8/12 18:55, Christian König 写道:
>> Am 11.08.22 um 09:25 schrieb Zhenneng Li:
>>> Although radeon card fence and wait for gpu to finish processing 
>>> current batch rings,
>>> there is still a corner case that radeon lockup work queue may not 
>>> be fully flushed,
>>> and meanwhile the radeon_suspend_kms() function has called 
>>> pci_set_power_state() to
>>> put device in D3hot state.
>>
>> If I'm not completely mistaken the reset worker uses the 
>> suspend/resume functionality as well to get the hardware into a 
>> working state again.
>>
>> So if I'm not completely mistaken this here would lead to a deadlock, 
>> please double check that.
>
> We have tested many times, there are no deadlock.

Testing doesn't tells you anything, you need to audit the call paths.

> In which situation, there would lead to a deadlock?

GPU resets.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
>>>> Configuration and Message requests are the only TLPs accepted by a 
>>>> Function in
>>>> the D3hot state. All other received Requests must be handled as 
>>>> Unsupported Requests,
>>>> and all received Completions may optionally be handled as 
>>>> Unexpected Completions.
>>> This issue will happen in following logs:
>>> Unable to handle kernel paging request at virtual address 
>>> 00008800e0008010
>>> CPU 0 kworker/0:3(131): Oops 0
>>> pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 
>>> Tainted: G        W
>>> pc is at si_gpu_check_soft_reset+0x3c/0x240
>>> ra is at si_dma_is_lockup+0x34/0xd0
>>> v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
>>> t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
>>> t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
>>> s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
>>> s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
>>> s6 = fff00007ef07bd98
>>> a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
>>> a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
>>> t8 = 0000000000000275  t9 = ffffffff809b66f8  t10 = ff6769c5d964b800
>>> t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
>>> gp = ffffffff81d89690  sp = 00000000aa814126
>>> Disabling lock debugging due to kernel taint
>>> Trace:
>>> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
>>> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
>>> [<ffffffff80977010>] process_one_work+0x280/0x550
>>> [<ffffffff80977350>] worker_thread+0x70/0x7c0
>>> [<ffffffff80977410>] worker_thread+0x130/0x7c0
>>> [<ffffffff80982040>] kthread+0x200/0x210
>>> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
>>> [<ffffffff80981f8c>] kthread+0x14c/0x210
>>> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
>>> [<ffffffff80981e40>] kthread+0x0/0x210
>>>   Code: ad3e0008  43f0074a  ad7e0018  ad9e0020  8c3001e8 40230101
>>>   <88210000> 4821ed21
>>> So force lockup work queue flush to fix this problem.
>>>
>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
>>> b/drivers/gpu/drm/radeon/radeon_device.c
>>> index 15692cb241fc..e608ca26780a 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>>> @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct drm_device *dev, 
>>> bool suspend,
>>>           if (r) {
>>>               /* delay GPU reset to resume */
>>>               radeon_fence_driver_force_completion(rdev, i);
>>> +        } else {
>>> +            /* finish executing delayed work */
>>> + flush_delayed_work(&rdev->fence_drv[i].lockup_work);
>>>           }
>>>       }
>>

