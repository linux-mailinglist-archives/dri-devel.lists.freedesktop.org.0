Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2FF36FF7F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 19:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE8D6F57C;
	Fri, 30 Apr 2021 17:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BB06F57B;
 Fri, 30 Apr 2021 17:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STSisBVuWA7mCtdqf4FwNvCm8yEf6z+eVpGyIzIiPPrsT0ytKtMjR9P/dSMjuMo3UVp/KjTkVx78934UIeCH+2CFnbraSIh3QUqrt5BNRMjXD+6En9U+2R+7LeynzHphlx0Nsgngc74bzMwttxsYcdZHqboWtZgudZJ7CvSx9jLzrJdPsX1R+jEuXSrLenrXLxtY4ZyFE7Kf8GmpPQs7qHK5nyS7FXF7cDjHiwkGwbXGqnlwfK0KKY6DE/SDZ112yxNCE2w956NJAqx2HR0jeVZZWyJCDzG91y6TDzf1W72FhE/NRYEf3SEHwjpVxikPMuz+TlkBBke+py+x8UTcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRCTUJ7ydZ/tFGl34wSkfJo2dXWwKIXV/nsehVzhouQ=;
 b=kz17mdfDM35g2/IjHk7Tgwd1a7Af+zQ1aawOKe4cgFNnhcQY5vhLkR6iiqY+lxWVQMa3VkE/YIh6+NqPPl9kpm/8uWwfdupBeQ43Sd/lvTv28vKaNEH7T+5XzOqE38mgCVo4kZvp5MEPNWFY/r7LRl2BvzRkkvN9AIMX1glMCoVXWJ0WPmqdr69vUiHSPxNTL8AZPlY/I0IrUKYtRbRluvalyBLfwAQWd3VVS++zFml+LZXUPuc1sfuu2PVQQrVRMgAxq2s5NhBrUle6eeEjrJBL0f5wQvXbpFN3zWOHNskOm1J6Dg+4u9iPUI9fLy+9PcFeYCfZ40szlcybkRPA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRCTUJ7ydZ/tFGl34wSkfJo2dXWwKIXV/nsehVzhouQ=;
 b=q4ew8lZsYpt9kPAsPngiB7puKJ7yJBBg0aktLPGxJobdFZUd4hxugLjl8xYQl33Qr1y02WL6Mf8ZWDOkQESHnBTYI0KdO4sM41B9uhq0SBf6/n/Ohg0gGZF4t257ffVvaAAJu55SbPDX5d4xzGntgNCe1OeU19JLK7sA5fTbTK4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 30 Apr
 2021 17:27:40 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.033; Fri, 30 Apr 2021
 17:27:40 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
 <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
 <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b6d0c32c-cf90-6118-5c60-238b6f4a0aaa@amd.com>
Date: Fri, 30 Apr 2021 13:27:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:28bc:ce08:83b6:6c00]
X-ClientProxiedBy: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:28bc:ce08:83b6:6c00]
 (2607:fea8:3edf:49b0:28bc:ce08:83b6:6c00) by
 YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Fri, 30 Apr 2021 17:27:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93fd120d-b555-4d54-5b53-08d90bfd41a1
X-MS-TrafficTypeDiagnostic: SA0PR12MB4461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4461D05CC24BF927101E16D0EA5E9@SA0PR12MB4461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jPLKS9maWci7qAjd+L8eg7vzZ5L/yK6mYf80MpQ6GIO46W50XdgjAjv3KMxhUKpCNPA+G3m9tpYUkGW3TkENvnyX/hdKet2EvSbHQDvWVOzYuWr9Q1A6yDfavrBOT2rTvjm7/NnRPypKyMtwbPvw7/bmhba3538CJeYT+Mku1Z2at96238jR8soH6ofIn9sQpKcS91npjiEG6bvXWQwwvAi0DitQqyMv8M2avDt4jCi+PZCNPMNKd+BPBvO4p3hDQ50o231p6jALeq4WvyRix8VfjqR/AJCyYOBDtouZH2SaKFZu/ZD+a0tXrYV9FVEQBmonP3gBGGIESI8Y9CAAs7q40W2gF7VMiLjfXGzD8dctflH1yLh3maYrM9uM+GHI0JRdaXhsPF8VSQDNUeV8Gpm3I56KWNE9Ga2azJJE887XHVCmHj3vYjaJzZ5pDWj6CZAj4pJmo41249WWVfFv8lE9rzVMnfrDS7jisCvSIBSmZBz80tFl7t8+/e4GRZY4/L3hwB4FHbPl4yaHS1C641+lH1yS82emIMfV88w56hmNsegS/SiQp6wNlTtExx59h/5vPcY1GasUvQ7NsS0CkRcxjn1Qhxm0tyjenFJ9GpEh3UbhhqYkG6E46oOj0I7dqJp3KqYMp7sS9GgMthFM04LRuhTMVmoIm2POdbshPtKk3rKSg1QAeTMpu3jIqE94AjAwfbx5/22mUvmKkbJHNOIArKMbxPyfsRw0g6GBZqfs0gwETn6q6asi+EA2SRYLUogDfOh3mBSzjuWeU45LjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(186003)(38100700002)(44832011)(30864003)(16526019)(5660300002)(2616005)(31686004)(53546011)(83380400001)(6916009)(6486002)(2906002)(36756003)(31696002)(86362001)(66476007)(966005)(66946007)(52116002)(8676002)(8936002)(316002)(66556008)(45080400002)(478600001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mlk3NXBNb29sNDNNWEovYUFXelJwOWhhdFUybkZnSzR5S0RJWTl5VHdDY1NR?=
 =?utf-8?B?UDJBaU9CL01mQThUYUVOZCtxK01ZaFBYY2JkMXZFOEhlQURLQTdVNVZzRW1U?=
 =?utf-8?B?V0g1RG8xQkN3WmN5dkQ0cEZXVXM3dENwaDg2clBzemZrRkc0Q01zN2ZrUmJh?=
 =?utf-8?B?WEtZcjNvUmZyRXZyR0E5Yk9xVUhCTGJZZGxkOGNiRkMzM2xYSDFhMlhDcDVx?=
 =?utf-8?B?YnRuV3ZSbjA1M1F3SUd2ejJCaXQ2VWlpSFRlbVVrTUVjR2FVd1E1VTQ3NWxF?=
 =?utf-8?B?NHdrSTY5cWoyVG9RbTdHQ2w5RUoySFVXbXZscm9XYmNBdjdVa1ZYWVh3b1g4?=
 =?utf-8?B?Wkc0SnY5RTcrM2hhc0FqN3dka08xNFI1T2pQTmtEZi9vSU5UMFhKM1NoRWFC?=
 =?utf-8?B?VTV6amNZOFoxbi9NUWxXcVdUZEtSUmZYOEUvM2JqYmsySnAvTnBSME0yd3BX?=
 =?utf-8?B?K2NYNlhYOWtmc0dUV3lOblc1cloxVU1LWjV5bWk1TjVBTWxBMXdxWW4vZVJn?=
 =?utf-8?B?SXMvUnhnRk9yT2NmdVFqNnRhR2ZZeTlFSG5lSDdpVW5hSlREZXpKaXFmakQ5?=
 =?utf-8?B?L3M1aU1zMUlxbUlSOWZLTlNkVkh0MDY5TzdOeWF6N3I2bGhlQlVUNjN0MVpr?=
 =?utf-8?B?TTNiSzdRY1o1ZlZEYkhoRWUvY3JEczVIcnR6NFpEeGcyQWR3dUJ6ei9jMVdv?=
 =?utf-8?B?cnN1cUdlcDBxY1VTd0Y5UEpPcjA4MjNHSjRGd29uZmFMM0M1dVNLZjcxZm4w?=
 =?utf-8?B?alZDQnNKd05Pa2ttM0QxS2M2U3RGbWNOcUN5U0l2TnZLYk41M0gzTnlQMzU2?=
 =?utf-8?B?WFlVY2MvYW9xWkZvRzJPZlk5RlNuUyswK3d0WmhScGwwKzIwREFWNkRYaHJS?=
 =?utf-8?B?ZzhJVVd1NHQ4RUVKeFd2ampiOEkvcXp3cnBpMXlaOUJNM0RmRFMybFNlNzlp?=
 =?utf-8?B?RTJYaUlmd2dBaW5sdWhKVm10bTJLTkVMN3VDM0dDZjZyNnRQMU0veVVFaEtl?=
 =?utf-8?B?azVsOFR6VVhpZnc3QTFVWHNobGRVVmNhemlEOURmd21zSElSb0RKREZ6c1dM?=
 =?utf-8?B?ZDRJbmluMzdZSlJwUVp2RjVGa1o0RkNjd1RyYllZNDc2M2poUGVramcyL2tC?=
 =?utf-8?B?ZzRjdHpncElmL25QZHZmb0E4UTQzMUt3Rjc0WjgwcjJ1dzNkOVh0Y2hTaE04?=
 =?utf-8?B?TmxOZnVJWHE4TGxFSHRwa2w0N2hvbkpsV0YxUXRkSVE4TEREZjFhMkp1YlVx?=
 =?utf-8?B?b2hPSnNucUtJNENGOWJ6SC95VWpJTklIRThRMlc5QW9iaS9PcEhCYnI0aGZh?=
 =?utf-8?B?emlqa3F0SUlEQi9BeFd3TkFyeDhQZUF0UlB5K2RVaHlNbXF0ZkRnOGpteXkv?=
 =?utf-8?B?bnd2Z1hmTi9sYklCL0V6c0FTdVZrQmJkNDYzVHZqeklCSWJNcmdWYjlGSnhP?=
 =?utf-8?B?d3B3SkIySmVDY0kzcThvUzN6djdqeWtPeHlIRjFwanFGRE5QNG9rV2pBZjMr?=
 =?utf-8?B?UVZuZXhuYXJQMGtRT3NYZDIycXpqYS9zV250dGRlelBkUnBuS043ak1qT3Ew?=
 =?utf-8?B?WDZhNENJdWZ6dXYyVWFzWjRIYXNpVWRua0F5bTZLZ1BFR2duY21FMmVaVlFn?=
 =?utf-8?B?dXZJaTYxM0g5SGlCZWxaaVNLYWhMN3pCY1k1NHFrVm0zdDh1eWE3QWNjS3gy?=
 =?utf-8?B?UDh6ZEpSbm9kM1pjckJ3TzIxaEhDWWdBaXRKTUZBUVhxRTRYRmNOK3pkOHB5?=
 =?utf-8?B?dWdDVWtsSE5JRTFTT1pDdlMzbG90NHRlN013dDROZThYRHpVTXVNMnhRT0hw?=
 =?utf-8?B?QzdEQ2JybTNnK0x2QzB0dzNxMGdSSTl5SjFOZkllUjloRTNOMUZpcENPQkFy?=
 =?utf-8?Q?TgqVP0160OAcj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fd120d-b555-4d54-5b53-08d90bfd41a1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 17:27:40.7879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6myV29kVT00+eFf7yx1BbuEicsuHeqfRov4CRQFIBKbOHirujHKoAH92BE19qgJtOZB6R7svIPookpHLjsg0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 helgaas@kernel.org, dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-30 6:25 a.m., Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 04:34:55PM -0400, Andrey Grodzovsky wrote:
>>
>>
>> On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
>>> On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
>>>>
>>>>
>>>> On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
>>>>> On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
>>>>>> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
>>>>>>> With this calling drm_dev_unplug will flush and block
>>>>>>> all in flight IOCTLs
>>>>>>>
>>>>>>> Also, add feature such that if device supports graceful unplug
>>>>>>> we enclose entire IOCTL in SRCU critical section.
>>>>>>>
>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>
>>>>>> Nope.
>>>>>>
>>>>>> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
>>>>
>>>> Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cf4c0568093cc462f625808d90bc23a3c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553751106596888%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PPKrQYBrgRMjpwlL0r8n5zenIhQMFWc6gniHgUTxTAY%3D&amp;reserved=0
>>>> currently in code ?
>>>
>>> I forgot about this one, again. Thanks for reminding.
>>>
>>>>>> Especially not with an opt-in flag so that it could be shrugged of as a
>>>>>> driver hack. Most of these ioctls should have absolutely no problem
>>>>>> working after hotunplug.
>>>>>>
>>>>>> Also, doing this defeats the point since it pretty much guarantees
>>>>>> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
>>>>>> is that only execbuf (and even that only when userspace has indicated
>>>>>> support for non-recoverable hw ctx) is allowed to fail. Anything else
>>>>>> might crash userspace.
>>>>
>>>> Given that as I pointed above we already fail any IOCTls with -ENODEV
>>>> when device is unplugged, it seems those crashes don't happen that
>>>> often ? Also, in all my testing I don't think I saw a user space crash
>>>> I could attribute to this.
>>>
>>> I guess it should be ok.
>>
>> What should be ok ?
> 
> Your approach, but not your patch. If we go with this let's just lift it
> to drm_ioctl() as the default behavior. No driver opt-in flag, because
> that's definitely worse than any other approach because we really need to
> get rid of driver specific behaviour for generic ioctls, especially
> anything a compositor will use directly.
> 
>>> My reasons for making this work is both less trouble for userspace (did
>>> you test with various wayland compositors out there, not just amdgpu x86
>>
>> I didn't - will give it a try.

Weston worked without crashes, run the egl tester cube there.

>>
>>> driver?), but also testing.
>>>
>>> We still need a bunch of these checks in various places or you'll wait a
>>> very long time for a pending modeset or similar to complete. Being able to
>>> run that code easily after hotunplug has completed should help a lot with
>>> testing.
>>>
>>> Plus various drivers already acquired drm_dev_enter/exit and now I wonder
>>> whether that was properly tested or not ...
>>>
>>> I guess maybe we need a drm module option to disable this check, so that
>>> we can exercise the code as if the ioctl has raced with hotunplug at the
>>> worst possible moment.
>>>
>>> Also atomic is really tricky here: I assume your testing has just done
>>> normal synchronous commits, but anything that goes through atomic can be
>>> done nonblocking in a separate thread. Which the ioctl catch-all here wont
>>> capture.
>>
>> Yes, async commit was on my mind and thanks for reminding me. Indeed
>> I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
>> drm_dev_enter/exit. Note that i have a bunch of patches, all name's
>> starting with 'Scope....' that just methodically put all the background
>> work items and timers the drivers schedules in drm_dev_enter/exit scope.
>> This was supposed to be part of the 'Scope Display code' patch.
> 
> That's too much. You still have to arrange that the flip completion event
> gets sent out. So it's a bit tricky.
> 
> In other places the same problem applies, e.g. probe functions need to
> make sure they report "disconnected".

I see, well, this is all part of KMS support which I defer for now
anyway. Will tackle it then.

> 
>>>>>> You probably need similar (and very precisely defined) rules for amdgpu.
>>>>>> And those must definitely exclude any shard ioctls from randomly failing
>>>>>> with EIO, because that just kills the box and defeats the point of trying
>>>>>> to gracefully handling hotunplug and making sure userspace has a chance of
>>>>>> survival. E.g. for atomic everything should continue, including flip
>>>>>> completion, but we set all outputs to "disconnected" and send out the
>>>>>> uevent. Maybe crtc enabling can fail too, but that can also be handled
>>>>>> through the async status we're using to signal DP link failures to
>>>>>> userspace.
>>>>
>>>> As I pointed before, because of the complexity of the topic I prefer to
>>>> take it step by step and solve first for secondary device use case, not
>>>> for primary, display attached device.
>>>
>>> Yeah makes sense. But then I think the right patch is to roll this out for
>>> all drivers, properly justified with existing code. Not behind a driver
>>> flag, because with all these different compositors the last thing we want
>>> is a proliferation of driver-specific behaviour. That's imo the worst
>>> option of all of them and needs to be avoided.
>>
>> So this kind of patch would be acceptable to you if I unconditionally
>> scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
>> I am worried to break other drivers with this, see patch https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Ddrm-misc-next%26id%3Df0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cf4c0568093cc462f625808d90bc23a3c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553751106596888%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F3Jq6SvTm%2BZX7AVpaxEepfOj0C3O7%2Bo2Wm3y0gxrmKI%3D&amp;reserved=0
>> Before setting drm_dev_unplug I go through a whole process of signalling
>> all possible fences in the system which some one some where might be
>> waiting on. My concern is that in the absence of HW those fences won't
>> signal and so unless I signal them myself srcu_synchrionize in
>> drm_dev_unplug will hang waiting for any such code scoped by
>> drm_dev_enter/exit.
> 
> Uh right. I forgot about this.
> 
> Which would kinda mean the top level scope is maybe not the best idea, and
> perhaps we should indeed drill it down. But then the testing issue
> definitely gets a lot worse.
> 
> So what if we'd push that drm_dev_is_unplugged check down into ioctls?
> Then we can make a case-by case decision whether it should be converted to
> drm_dev_enter/exit, needs to be pushed down further into drivers (due to
> fence wait issues) or other concerns?
> 
> Also I guess we need to have a subsystem wide rule on whether you need to
> force complete all fences before you call drm_dev_unplug, or afterwards.

I don't see how you can handle it afterwards. If a thread is stuck in
dma_fence_wait in non interruptible wait (any kernel thread) and with no
timeout there is nothing you can do to stop the wait. Any such code
scopped with drm_dev_enter/exit will cause a hang in drm_dev_unplug.
The only way then is to preemptively force signal all such fences before
calling drm_dev_unplug - as I do in the above mentioned patch.

> If we have mixed behaviour on this there will be disappointment. And since
> hotunplug and dma_fence completion are both userspace visible that
> inconsistency might have bigger impact.
> 
> This is all very tricky indeed :-/
> 
> btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
> with that: We could do the same trick we've done for DRM_UNLOCKED:
> - drm_dev_enter/exit is called for any ioctl that has not set the
>    DRM_HOTUNPLUG_SAFE flag
> - for drm core ioctls we push them into all ioctls and decide how to
>    handle/where (with the aim to have the least amount of code flow
>    different during hotunplug vs after hotunplug has finished, to reduce
>    testing scope)
> - then we make DRM_HOTUNPLUG_SAFE the implied default
> 
> This would have us left with render ioctls, and I think the defensive
> assumption there is that they're all hotunplug safe. We might hang on a
> fence wait, but that's fixable, and it's better than blowing up on a
> use-after-free security bug.
> 
> Thoughts?

I don't fully see a difference between the approach described above and
the full drill down to each driver and even within the driver, to the HW
back-ends - what criteria I would use to decide if for a given IOCTL i
scope with drm_dev_enter/exit at the highest level while for another
i go all the way down ? If we would agree that signaling the fences
preemptively before engaging drm_dev_unplug is generically the right
approach maybe we can then scope drm_ioctl unconditionally with
drm_dev_enter/exit and then for each driver go through the same process
I do for amdgpu - writing driver specific function which takes care of
all the fences. We could then just create a drm callback which would
be called from drm_ioctl before drm_dev_unplug is called.

Andrey

> 
> It is unfortunately even more work until we've reached the goal, but I
> think it's safest and most flexible approach overall.
> 
> Cheers, Daniel
> 
>>
>> Andrey
>>
>>>
>>> Cheers, Daniel
>>>
>>>
>>>>
>>>>>>
>>>>>> I guess we should clarify this in the hotunplug doc?
>>>>
>>>> Agree
>>>>
>>>>>
>>>>> To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
>>>>> really make no sense, and where we're rather confident that all properly
>>>>> implemented userspace will gracefully handle failures. Like a modeset, or
>>>>> opening a device, or trying to import a dma-buf or stuff like that which
>>>>> can already fail in normal operation for any kind of reason.
>>>>>
>>>>> But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
>>>>> after hotunplug.
>>>>
>>>> As I pointed above, this a bit confuses me given that we already do
>>>> blanker rejection of IOCTLs if device is unplugged.
>>>
>>> Well I'm confused about this too :-/
>>>
>>>>> And then there's the middle ground, like doing a pageflip or buffer flush,
>>>>> which I guess some userspace might handle, but risky to inflict those
>>>>> consequences on them. atomic modeset is especially fun since depending
>>>>> what you're doing it can be both "failures expected" and "failures not
>>>>> really expected in normal operation".
>>>>>
>>>>> Also, this really should be consistent across drivers, not solved with a
>>>>> driver flag for every possible combination.
>>>>>
>>>>> If you look at the current hotunplug kms drivers, they have
>>>>> drm_dev_enter/exit sprinkled in specific hw callback functions because of
>>>>> the above problems. But maybe it makes sense to change things in a few
>>>>> cases. But then we should do it across the board.
>>>>
>>>> So as I understand your preferred approach is that I scope any back_end, HW
>>>> specific function with drm_dev_enter/exit because that where MMIO
>>>> access takes place. But besides explicit MMIO access thorough
>>>> register accessors in the HW back-end there is also indirect MMIO access
>>>> taking place throughout the code in the driver because of various VRAM
>>>> BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
>>>> access is spread all over in the driver and even in mid-layers such as
>>>> TTM and not limited to HW back-end functions. It means it's much harder
>>>> to spot such places to surgically scope them with drm_dev_enter/exit and
>>>> also that any new such code introduced will immediately break hot unplug
>>>> because the developers can't be expected to remember making their code
>>>> robust to this specific use case. That why when we discussed internally
>>>> what approach to take to protecting code with drm_dev_enter/exit we
>>>> opted for using the widest available scope.
>>>
>>> The thing is, you kinda have to anyway. There's enormous amounts of
>>> asynchronous processing going on. E.g. nonblocking atomic commits also do
>>> ttm unpinning and fun stuff like that, which if you sync things wrong can
>>> happen way late. So the door for bad fallout is wide open :-(
>>>
>>> I'm not sure where the right tradeoff is to make sure we catch them all,
>>> and can make sure with testing that we've indeed caught them all.
>>> -Daniel
>>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
