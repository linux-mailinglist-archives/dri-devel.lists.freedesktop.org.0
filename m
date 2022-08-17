Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86D596D9B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 13:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505DB8D6F2;
	Wed, 17 Aug 2022 11:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5689614A109;
 Wed, 17 Aug 2022 11:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfnrD5dwC/HDC/KNcrL9eBTR39M2LnXChF2Nivt45pWl4n2JXOhDZcHgwbLv0m6uOw/aN/gafy60aDoach91QlModegVQMI62cwSWM+O5PwdBlUKXXQhSAIPM3RoL5oC00wCJwLWdpYejZ8a4w/u2AgMNXTnG/uhWSSpw4z2ukk80QPvCkUwqSvKuZPRLUf0E64GigCX+01cV4yqIVM/WCR03X/OMMkTE1Kilyx2rSNNXRtfvuX0Jw5cWXBwVFCMnOSyzFC3DnBzGkkIaz7y1AFgZoeeUAklw8pvaxt33IHwB1gUCDzvFC8BUJO1TiA1c/FHyHh+LA0NPgLRMI+7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1kBHE31rpl7iLqb0SVQ0uhqvNjSAxM+eJGLPSx7dpg=;
 b=AOC2zaeUZ+FzP4u5N4wNziDW/L7VV10iGKvVKuNYpzJtDWl5oUp6kgCltMIuFTc8Hx13CEEq86/tuP0HsSlPF4JLEFFLEpcs+Xqi1caPso0ZfVyv9qX2gYvQQotk0dBGh9Qg+4KpSYWXL0ZIBZSUKYhcvPnUAQjmXLTf8QKP3eqCnEn9e1mr4WLTWX76nd//2bj/HS8qEsjsb+eC9L46WBpoRYWtVS9Ln31sgsP9M9kBeOGD8GJcFV+1Oh9C1mkNeiWPD4xqgGYbSy59SlYNB7lO6wrxf48sKme12KuuUG+ZjpDBaxjgK5m966LDwjmLEOyII3anjxq9XQgwrPvi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1kBHE31rpl7iLqb0SVQ0uhqvNjSAxM+eJGLPSx7dpg=;
 b=M6AA83bfZIiurze2og2Mlhg94nCgSI4SUESjvVP8TYi5O4J25cSz+1RiOOUPkzagzwW86MwZF+qZ0irrUcWLIZ3pNcJiAJUf1MnE4OT/ZrEM2m3heugE5jyy4iISbpbIDBzYYh0SaThev4xXsCFkymwMz7Az5IM5kBqMwSXWjrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 11:40:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Wed, 17 Aug 2022
 11:40:36 +0000
Message-ID: <cc30a694-c784-f42c-bab6-b45c70202c56@amd.com>
Date: Wed, 17 Aug 2022 13:40:32 +0200
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
 <c3c1310b-5e84-e4e9-0df9-3f45c976a508@amd.com>
 <2f38b94b-0965-80f2-5bae-840765ffc4da@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2f38b94b-0965-80f2-5bae-840765ffc4da@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a1a935c-5908-4b39-f59c-08da80454d62
X-MS-TrafficTypeDiagnostic: BY5PR12MB4257:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0i3Tr4L4LvBDW0ZF2kK8Cu4h+/ysrLmZELXc9PBTl6GAI392VvKFtr8ToDlySs+pptpnDoDm0wR+AIL3X4YNkQt9XopP/oEkxcw7E7Nqhsol+YQrJDFJHCo6d9ztEQcMRmuUOzmwT897fpqpaRx9Ak57WFXTIpMdKg8Jz1hJy70usb9uj0OLmfvEltnDtJ9NcqlUj7r7J+x5YxdkFMNCA7H3AFmFPbBGk2fKyYwADqFMkD3N3ZUFQN+BueVNk/c8QsrJ1zIBHsrTPi68GMBts5r9i7rULJX5GEZb8qOfQJHsR7D1hpYxWxwnDuI0KOik2ZoZ958KkmJSAL8g9xQtojRZSs1deddnYAVEfXQlIWjuVBtQ3046zmEgW7WjJfT+Xy9nC/y8elbmf7lOjaW+Y/TXkdeCTC0f4YzUV9oidSJj3T2K9U0JFlJ9jabdMxxUP+usN8o7QzxhUSDuPrRrCcOgctkUjsQg1RN1uBM7OyFaMEZPSA9uhB/uYtSHwuiKWtBFL0nz28beXB6gC961OI0qS+raOrrBJ1CpL7+aypvcRQ2f5MrBwSDUTRltkQOt4nlz5CYcYaZiGOrJEoKJH4WkJO1PE6HoV2FwbVM64CT1hOltOo+H6qT2XN3PYqW6ItijuibyWo/9YGYli3HYdHSKJw+ej/JxKVxYU+IHJEDsFRyV3xriEZXZuuzoh4PUxVkx1NTMR/w/qhVVzrvQP00R04Zs4eUyoOwOjUCi9zzmU2xP4fOUahLBkQp2q245/NvKxEl2l/wIUQTA17xqYFH3cWUd1x8sBKK2KzK5eMaX36VE+NfC/SQ2px+MD16mPcOOIeb6NWbHgGXDtJEjsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(66574015)(83380400001)(186003)(2616005)(6486002)(478600001)(38100700002)(316002)(41300700001)(66556008)(6666004)(54906003)(6506007)(6636002)(5660300002)(2906002)(8936002)(66946007)(26005)(31686004)(31696002)(110136005)(6512007)(8676002)(66476007)(36756003)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNwMHZGWlFWVjlxUUR5R2Fud0FJVFM1RzMyRWo2a2o4UzVmTUNobmwwSDJw?=
 =?utf-8?B?ZmRDK3F3WGhWT0tmU3h5RHhFMlVGeHJqOWg1MkZjM3BaM3UzbzZsSXRhZTFt?=
 =?utf-8?B?N0gxQ3A1QVRqV2N0cE1XWEExQ3o3WHlFTjVtcEZ5V0xSQm92bFdqOGZXd0ly?=
 =?utf-8?B?OCtQZ3hGYWorMkgrdGM2aEk4STVOVUdEWVdsd204MDJvQVZqTEhGSGxlTE5D?=
 =?utf-8?B?bVFnQzFPSWJvVjdEamRPRDZObWhJNy9IV0t4WG1wM0V1L2J1S3RSWWQyR3VJ?=
 =?utf-8?B?UmhhSEtyOWFjSE9kZVpNeDc3L1Z4b2sxSm90OFZSUnRvcUhpQ0RxdVZlV3BK?=
 =?utf-8?B?YUViakZHZStvL0grbXZQTjRodUltMEdTQ2JweWppbVEvU3FYSU4weU5Jek53?=
 =?utf-8?B?YjkzTC9tS285VVRzVlVYd2JlSlpGU3lxQ1ByZElvY1hzOVRIN0hQcjM2Z2Ny?=
 =?utf-8?B?S0RLUW5yT0JsWmZsRWJZTnhrcWRuaVRBZlFHaVFzYzNGMkQ4V3FpSmFtWlNj?=
 =?utf-8?B?bkt1WmF3c3oyVkpRWC9qcnRSMklJTTZjVUJxdEhHVlFtU0pNcGt6TnBFSjJQ?=
 =?utf-8?B?eldzVUY0aFUzeEUwOEJxd0YyWERSVW9PaVV3bU96Qld6SjB4RG1oT3RJZEFN?=
 =?utf-8?B?MHR2SDlkOU5OVDRhdlV0YzgrblhHdVBibTV2L3Bydkl4OWpLMStXZU1qMU8y?=
 =?utf-8?B?YTBpU1FpWjdGeS9iM0JzQmZPNStwY3lxNmlnMGhJekJsWGg3R1MvRTVxVEhZ?=
 =?utf-8?B?c0MxRWY5Yzl2OENreEVzZ2JGd29GcElDSUt4Q1pyMVI0NnF6dVFYQWxpSzQw?=
 =?utf-8?B?Z1FzQlJMclo4TTVoYWFkaDN5dDFTanhqV0hQTmJDTENsRWJVODBxMjk0OU5I?=
 =?utf-8?B?K3RXMDZzWEpuRXNpSUx6RUVLekNneWRtUGRSRWl5cHdQeE1McW94T29xVGRG?=
 =?utf-8?B?QTd6K1I4ZGdzMEcwN0hBSm1nTHZncXp5Mk00Nlc1QWJvZW5jbzBXcTQ4WWFG?=
 =?utf-8?B?VkFlZHVjNTAvbGs5VXE2dldvZW5lbkpzeE5zemdvV1BsTllOMitrUUxYakw1?=
 =?utf-8?B?VVk3YXRhbXlGVERZb3IrT1ZsUlFCRnp3ekxlWE1lNTR1UVdwbVJhZFlicG8y?=
 =?utf-8?B?eldIbDdsSXZ4UE5nalRBbDh4WlpUSzJaeGZzdGRpeDNOZWl6UHdyeHpDTFgy?=
 =?utf-8?B?aWkxVjV2RUxnVGxzdFBVd2NFV0d0MHNZUFNGbXJ3WnRYeDlMUGxQVzk3Ujd6?=
 =?utf-8?B?TGV0YytYVTdqMDJOQmpDZUpUUktVNHJLd0MxQ3VnVDdmZEIxT2ViSTFFaCtE?=
 =?utf-8?B?VmJoaGYxUWd6MU9FbExyWXFzdVNreWV4Yk5MK2I5ZWVZNlhoZGVSbC9jRjli?=
 =?utf-8?B?bzdnNnB4bzFlSm9JejJ4cEpBZFA2WXQ0cU1BVk5DOEZ2YmF6T1lCS0V0VTd0?=
 =?utf-8?B?bVpFTHp4RDMvdWF6d3RuWXZldDBvWTRPN2NpR1dLemFWWitoV0tXSVZCRHk2?=
 =?utf-8?B?ZmhqYWszOTFmaFhDVHRkdXNzdy80aFl3K3RqWU9Wa3hORHIrY0pFbGMvY0RY?=
 =?utf-8?B?cmdQR1NKNHBmYWRwbzJyQ242ZVFDMjJVMC9xQVpqYWprUEJiQTh5NUJxNi9h?=
 =?utf-8?B?LzlEdFdvUEYrWFlKV0J2VzIvWUg1ODdIYkpLTjMyVkhHR3plK3QvZk9Za3RY?=
 =?utf-8?B?ZWNxMDVUSFI4Zm9peFU3b2lZRUQvbnFFWVdGKzNpZkZiR05ISTYwdUtneUJK?=
 =?utf-8?B?UDlSVXNFUE16UE1RSHZqVy9OZzBQanhRRmVlQW93d1ljOG42cXRTSCt4Y21x?=
 =?utf-8?B?c24vTUJ2eVZvaXhKSmFzQk1BZEdPZHdzeWZHcmZROFFVUk0yTkc5V3JuY0xN?=
 =?utf-8?B?TUNQSHRGRCt5VDkweTB6amlpaWFHaWZxNTk1TG9HdUM1a0JlWFdJT3ZUMEhR?=
 =?utf-8?B?cVJhbDlUL1ZCNHJwMUZ6WEszR25sOGlsMEJ5dU91b1liK2xvUHc3T3QxRWxP?=
 =?utf-8?B?aGRUWHpWa05BeFBZRGJBZjFtVnNlZEJScDljd3VpWnphVmdhTStNNUp3MVc3?=
 =?utf-8?B?V1R3ZXp6a2NBNGEvZmdZYWNSMFdSS3poM3BSWjlGRnpTNHRzR3RWRFhOOEdF?=
 =?utf-8?Q?UvPmkBPA1ynXm5Ox4ehxMZaFA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1a935c-5908-4b39-f59c-08da80454d62
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 11:40:36.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y16OZnmPnkoxrzpKbh4THFwM209AKZcwm1EXWBKH3OanimyBchM6Xzc9mZBfZ3hP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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

Am 17.08.22 um 09:31 schrieb 李真能:
>
> 在 2022/8/15 21:12, Christian König 写道:
>> Am 15.08.22 um 09:34 schrieb 李真能:
>>>
>>> 在 2022/8/12 18:55, Christian König 写道:
>>>> Am 11.08.22 um 09:25 schrieb Zhenneng Li:
>>>>> Although radeon card fence and wait for gpu to finish processing 
>>>>> current batch rings,
>>>>> there is still a corner case that radeon lockup work queue may not 
>>>>> be fully flushed,
>>>>> and meanwhile the radeon_suspend_kms() function has called 
>>>>> pci_set_power_state() to
>>>>> put device in D3hot state.
>>>>
>>>> If I'm not completely mistaken the reset worker uses the 
>>>> suspend/resume functionality as well to get the hardware into a 
>>>> working state again.
>>>>
>>>> So if I'm not completely mistaken this here would lead to a 
>>>> deadlock, please double check that.
>>>
>>> We have tested many times, there are no deadlock.
>>
>> Testing doesn't tells you anything, you need to audit the call paths.
>>
>>> In which situation, there would lead to a deadlock?
>>
>> GPU resets.
>
> Although flush_delayed_work(&rdev->fence_drv[i].lockup_work) will wait 
> for a lockup_work to finish executing the last queueing,  but this 
> kernel func haven't get any lock, and lockup_work will run in another 
> kernel thread, so I think flush_delayed_work could not lead to a 
> deadlock.
>
> Therefor if radeon_gpu_reset is called in another thread when 
> radeon_suspend_kms is blocked on flush_delayed_work, there could not 
> lead to a deadlock.

Ok sounds like you didn't go what I wanted to say.

The key problem is that radeon_gpu_reset() calls radeon_suspend() which 
in turn calls rdev->asic->suspend().

And this function in turn could end up in radeon_suspend_kms() again, 
but I'm not 100% sure about that.

Just double check the order of function called here (e.g. if 
radeon_suspend_kms() call radeon_suspend() or the other way around).  
Apart from that your patch looks correct to me as well.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
>>>>>> Configuration and Message requests are the only TLPs accepted by 
>>>>>> a Function in
>>>>>> the D3hot state. All other received Requests must be handled as 
>>>>>> Unsupported Requests,
>>>>>> and all received Completions may optionally be handled as 
>>>>>> Unexpected Completions.
>>>>> This issue will happen in following logs:
>>>>> Unable to handle kernel paging request at virtual address 
>>>>> 00008800e0008010
>>>>> CPU 0 kworker/0:3(131): Oops 0
>>>>> pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 
>>>>> Tainted: G        W
>>>>> pc is at si_gpu_check_soft_reset+0x3c/0x240
>>>>> ra is at si_dma_is_lockup+0x34/0xd0
>>>>> v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
>>>>> t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
>>>>> t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
>>>>> s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
>>>>> s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
>>>>> s6 = fff00007ef07bd98
>>>>> a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
>>>>> a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
>>>>> t8 = 0000000000000275  t9 = ffffffff809b66f8  t10 = ff6769c5d964b800
>>>>> t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
>>>>> gp = ffffffff81d89690  sp = 00000000aa814126
>>>>> Disabling lock debugging due to kernel taint
>>>>> Trace:
>>>>> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
>>>>> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
>>>>> [<ffffffff80977010>] process_one_work+0x280/0x550
>>>>> [<ffffffff80977350>] worker_thread+0x70/0x7c0
>>>>> [<ffffffff80977410>] worker_thread+0x130/0x7c0
>>>>> [<ffffffff80982040>] kthread+0x200/0x210
>>>>> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
>>>>> [<ffffffff80981f8c>] kthread+0x14c/0x210
>>>>> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
>>>>> [<ffffffff80981e40>] kthread+0x0/0x210
>>>>>   Code: ad3e0008  43f0074a  ad7e0018  ad9e0020  8c3001e8 40230101
>>>>>   <88210000> 4821ed21
>>>>> So force lockup work queue flush to fix this problem.
>>>>>
>>>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>>>> ---
>>>>>   drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
>>>>> b/drivers/gpu/drm/radeon/radeon_device.c
>>>>> index 15692cb241fc..e608ca26780a 100644
>>>>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>>>>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>>>>> @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct drm_device 
>>>>> *dev, bool suspend,
>>>>>           if (r) {
>>>>>               /* delay GPU reset to resume */
>>>>>               radeon_fence_driver_force_completion(rdev, i);
>>>>> +        } else {
>>>>> +            /* finish executing delayed work */
>>>>> + flush_delayed_work(&rdev->fence_drv[i].lockup_work);
>>>>>           }
>>>>>       }
>>>>
>>

