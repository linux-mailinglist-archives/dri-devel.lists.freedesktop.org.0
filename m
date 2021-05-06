Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFB375869
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 18:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508116E7D9;
	Thu,  6 May 2021 16:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79186E7D1;
 Thu,  6 May 2021 16:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T70zbZUy3rUjDXq68lShrXmk9BcAEMKTTjHR/yPNWO+a8voDsJMKzHNU303iifwET/4uhuc0aaQ4pjNvwlIeRJXH7MDDpy+6EGku7l8fT2KteoHpNOO+RPCZXR/dpseCsBZBejseMEw8Ujtm2ht2i1NDj97WKFl2yVYfSuT+Lma4IzpuTzpVxr/D3yZr5Hjpihsz6SukExiH3poZz8Jb3YtntSIOYZt897U3K0cJX85sru/aW/n9XhzjNFNYoEjjUO7GI3sp5W8aYwiZ0COHMg8Mu8YSYRBGftdoB2qIzeV7OV3uf6fZyduQqiEcdNCjGa2jC00j3vfxbNMufPBi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mngtYEkOTSYXQW9LyEldnxC/jPep3aariBmcCoLewoU=;
 b=l7Tz6bw39yAGIWHGLD5e88+WOUOJIngr2jVbyBZ4G+vX1oh3O5aliKgxqKnEN5RH4azpv8+9K9nHb71toUU7nLe7QgtZ+Ed3UxZYGsbdrk31eaqhaa3Kz99VxZcKljbafb/9m4fW6XeSqyX5ez/Q3Ix9YrozxasQ+E3Uc0ftxLJKhw2LhD1u5kngAgf98IWY9cbWiVzV/uE6vie1j/ky1i6C4gSdnS48aErQo+Lef2QTjq8t5QVBMO899dmLtiXVxzF3TqJt53Q9uUDIU2N5s3Msa6ojY455w6ZLBZu0mXOZiv72a8n9RL6GvobjvTvDDovaIAJPrm/mzlZ3r0293g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mngtYEkOTSYXQW9LyEldnxC/jPep3aariBmcCoLewoU=;
 b=m+BNLgYmo1Z15fLhjuGY6mCbLay+jPQVKvH/HDX9vXsJdzDMfM70UuA3XtX9EqGcaHJcFpQful+pOpOluRu5zAjemfOzYrDbJFg9Z8E41szNs1eh5XK4xTYTTVZqixjLnlIYXLFWBpA8GS29rrRpBt/JCN6CVgyD2mm0svWYvKY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Thu, 6 May
 2021 16:25:09 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 16:25:09 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
 <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
 <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
 <b6d0c32c-cf90-6118-5c60-238b6f4a0aaa@amd.com>
 <YJO5jBaNj1XCTFXE@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d398c3fd-badd-e9da-a74b-00231ad958a5@amd.com>
Date: Thu, 6 May 2021 12:25:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YJO5jBaNj1XCTFXE@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:3577:c921:d8e7:7be6]
X-ClientProxiedBy: YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::43) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3577:c921:d8e7:7be6]
 (2607:fea8:3edf:49b0:3577:c921:d8e7:7be6) by
 YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.39 via Frontend Transport; Thu, 6 May 2021 16:25:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3449da0-ee09-481e-40bc-08d910ab83d7
X-MS-TrafficTypeDiagnostic: SN6PR12MB2800:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB280030215EC6A795B967B33AEA589@SN6PR12MB2800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftenKloriwUu1pKGHV003iWdzPLkqbVuHbEgXYTJehFB5igrZCqT5u4pW+Q/RQW4ZCfZwhhCp/KV+4ydTj0tHr8dJD0qy5O0gx+i4C5Fy3aDZK/P0M6WSieQALecznNEDSNK9/SfO+xURpPKX7rxm57/RF64gsXS31vyJcsC//LIxxApmOybOTkGoRAN193cB8l7V//BF3A9OChyUHVNkgGbROoUSuk9kVh0jJReg8atu3MNYy/gkpB/HwlnMwJVQ8Uh88NqFXfzawVcSA5Bv/cO9m+NwJaL44chhEZ1ftPZ0MlAca8BJhdj+PWvq1Qn9A8XLei79uYNXds8bN5rVOsXbEpzddV7RSKQeHhDpZYPQJcG0kqhOGo2PWruM4X1rB4BlaukVp/niusUM4dYodrlQ0NaPEyhbtANPvg8OcJHiUVjX/hmKX79X06n8orPkVEnp+dGYSVFsbUKQni9gKswvUtwadRyryZ1oQXMU9MLF46TXhMJrR4dyqWhJPUyvvIaZlHQBeGBdeGZ+n5aaAyEcvBZfDIdTZcvKEObRU1xdwZgzQ3jBapMxAP2KmPM5mGzAf96oan4+gwLfQMgm+inyZst2qqjLVsxZ42vk+hre/QO95fZINK1nrWDkwj05NH+p0m4PACmzyo0IYb0hgPr4SGjwI4KSjNoAgILE6+ovlUjUv2iN7HlnV3gWU7lkZKifBkE3+MGS33L4uXBCoUCfD/SuGzCyiUFKHxfNYA4QunpYtdU3g9W2vLRejjpcuMgWvp4Q9tXx1DkrQDKew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6486002)(31696002)(2616005)(45080400002)(5660300002)(86362001)(36756003)(30864003)(66556008)(53546011)(316002)(52116002)(31686004)(2906002)(8676002)(16526019)(83380400001)(966005)(66476007)(66946007)(44832011)(478600001)(38100700002)(186003)(6916009)(8936002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEZQdU5PTW4xaStCK2NIa1FkeXdtMlZERnFyR0dPd2dFVTNZY2pWY0FGdWJT?=
 =?utf-8?B?N01rNEJ5NVVBUmZ0S0hKeWZYUC8zNmloYThtb1ZsUERpUEZqL2FCODIvRXR5?=
 =?utf-8?B?cU0xK3JBcGpNckRFY0VkMENQU0RaZ0grbHZjQTZUdlo1di9vV2hRYUsyRHl5?=
 =?utf-8?B?RmVTZ0t0WWdCQy9WTTVUemN5KzV5RXpIQmFYSTZYcWVQN0tXTytwZ242NGtT?=
 =?utf-8?B?ckcxTUpuS1RUQ1J0UzZaU2RuMHZIVUc3cisxT2lRd1B5Y3lvbjlqNW53M0l5?=
 =?utf-8?B?U0UweGtwTTVydkRXYlZZN3UweXBZdjlQVDB3bVlaZWJVeFA1YnpSTEpKc1N4?=
 =?utf-8?B?SXZNeDdMWUtTTklGTk8zOG5Rc3RNWUFDQVVUMkVtYVdaS3diL2laZ1AyYWNM?=
 =?utf-8?B?RHVXVUdKNG9KcWVjaTF2YTF4alpCcUx5VmVwUGVWWjJ1U3V1bTc0d2tVUEcv?=
 =?utf-8?B?cGh6NmZXZlMyY3BXazVXVnlKaVpFc2tUZk5GMUoremlHQTdzNkRjUkFiSFhm?=
 =?utf-8?B?dnIyZndLaDhOYUdKSlM4TXFTMTJmSFRoakZ0alFrZEt5YzhPMHhNKzlUeWxU?=
 =?utf-8?B?SjRzRWJ1d2xEZDE0cW56TTArRG90SWRVN05iZm1aM2N2bTRkby9VV1hGMFVG?=
 =?utf-8?B?RDVad3crV1hRREl0c2VBcFZvZitWS2VjUlhVTEJMWG1TZ1ZDS2x2azNOc1dY?=
 =?utf-8?B?by9oT2pSdVZGSFdGZUV5K1hXT3F0VEUvMHBWcEVISmliY0FydEIreWJGWGdZ?=
 =?utf-8?B?d2ZaWU02ZnVRWUhmM2tVVzY0ZXl6RENYREJWZW9DTDlMWGxpOGJGeFpoTHBa?=
 =?utf-8?B?a2FqTGhFOXhOQzR4Um5ZNEJWYUdKTDZqbjl4L3VxbXRxSW5JUVN1YzhjNUFs?=
 =?utf-8?B?c0RGWSszNjEvT1FwOWVvQ0ZMcFVvZS82NVhuaEF5Nmd4SzJaaGpGL0dsNDRP?=
 =?utf-8?B?UFhxanMwUFBoV3ZndEdneFNEYkdJV3BOMFdaN01RTnBlcTFVYUNZdjNjSFcv?=
 =?utf-8?B?SXBSWDBabUZ1b2k4eStrTFd3SS9xY1M2VXNpUnBuUmhzS1JDYXFsMmN2TzVW?=
 =?utf-8?B?ZzBoYVlRS3cwQVJvM1ViYXdJVkFlalhZU3hCRW5NOFdmWW15QnkwWDZNOCt4?=
 =?utf-8?B?UWlxN2tZcDIrc1Y2OGpnTVJxMktZNXBoYktDZGdHbkptUHA1TTVJSGRYUzBa?=
 =?utf-8?B?QWZOOWFuaHVOWEZvUHdqdjZuZVAyMnJHV2NhRjl0QnFQVm40c0IwT255R2Vi?=
 =?utf-8?B?N1dVTVJMRmRoeHhOMkFqb0tCRWQ1N29QR1hKY1c0Mlc2ajk3NnA0LzVUaC8z?=
 =?utf-8?B?ZHUrQ0NzUXluTUdqYXZEaE1yZE84VkRMSzNjbVJRVkRVSmliRkhSUlVFcnpS?=
 =?utf-8?B?bDdLQmlaR0NFVlNEL2hncUE5Zmh2ZlVJbjZ5ajNoOFVXN0E5QnNXTWN5ZmRo?=
 =?utf-8?B?YXdzcGRIZVJRWHBSZ1pPZllpTS9nNlRIWTkyT1pHWUJjUzNNYlJLMUNhUFRq?=
 =?utf-8?B?dWNZdC91UDFCT2R5VGhEKzgwMFYrT2ViRGhHUkpFMjRFbnhidkdZUXY4UWZI?=
 =?utf-8?B?enRGRGhPMXR2dGVoemRGWEtUaTdGcGdGU3o3Q1NveSsxUFdRNkMxMzRaZGRh?=
 =?utf-8?B?ZnlRVzhuNDhETXNDb3hIaUtwZ3Q1MmFaa0NzSkI2ZVNyaTgzRU9OVnJ0VTlT?=
 =?utf-8?B?SmRGK2ZYdHcvdW8waW5venlFUDBJZXZBUEZQRzA3UWhrR2RpRXR1YnFLOWpy?=
 =?utf-8?B?cldGdWNTanA0YTVyRmozWHNPWnNZU2VSTFVqK2ErYTFlTnFRaFNmY3pNRklM?=
 =?utf-8?B?UTZyNkdPREozVmhuazJ0NkJoRTFyNHRidWxzRnI4ZE1sUkdZaWRPVkJxWTkz?=
 =?utf-8?Q?Kc03spCvOfwTL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3449da0-ee09-481e-40bc-08d910ab83d7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 16:25:08.9388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5o/M+2I5Z1Zk280jPlbu7yJlMAPmqiyfcEoRvuJZAlXPBYisHCTfW/JTQTEkISIY5hoEI+7BGwBKn5xuUi2AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2800
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-06 5:40 a.m., Daniel Vetter wrote:
> On Fri, Apr 30, 2021 at 01:27:37PM -0400, Andrey Grodzovsky wrote:
>>
>>
>> On 2021-04-30 6:25 a.m., Daniel Vetter wrote:
>>> On Thu, Apr 29, 2021 at 04:34:55PM -0400, Andrey Grodzovsky wrote:
>>>>
>>>>
>>>> On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
>>>>> On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
>>>>>>
>>>>>>
>>>>>> On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
>>>>>>> On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
>>>>>>>> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
>>>>>>>>> With this calling drm_dev_unplug will flush and block
>>>>>>>>> all in flight IOCTLs
>>>>>>>>>
>>>>>>>>> Also, add feature such that if device supports graceful unplug
>>>>>>>>> we enclose entire IOCTL in SRCU critical section.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>
>>>>>>>> Nope.
>>>>>>>>
>>>>>>>> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
>>>>>>
>>>>>> Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca0ca5bdab20a4533491c08d91072fe2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637558908355926609%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SESZFWQEcQUHGGek8d1cNi9Iwo9XOmXqxg9MieRkxNU%3D&amp;reserved=0
>>>>>> currently in code ?
>>>>>
>>>>> I forgot about this one, again. Thanks for reminding.
>>>>>
>>>>>>>> Especially not with an opt-in flag so that it could be shrugged of as a
>>>>>>>> driver hack. Most of these ioctls should have absolutely no problem
>>>>>>>> working after hotunplug.
>>>>>>>>
>>>>>>>> Also, doing this defeats the point since it pretty much guarantees
>>>>>>>> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
>>>>>>>> is that only execbuf (and even that only when userspace has indicated
>>>>>>>> support for non-recoverable hw ctx) is allowed to fail. Anything else
>>>>>>>> might crash userspace.
>>>>>>
>>>>>> Given that as I pointed above we already fail any IOCTls with -ENODEV
>>>>>> when device is unplugged, it seems those crashes don't happen that
>>>>>> often ? Also, in all my testing I don't think I saw a user space crash
>>>>>> I could attribute to this.
>>>>>
>>>>> I guess it should be ok.
>>>>
>>>> What should be ok ?
>>>
>>> Your approach, but not your patch. If we go with this let's just lift it
>>> to drm_ioctl() as the default behavior. No driver opt-in flag, because
>>> that's definitely worse than any other approach because we really need to
>>> get rid of driver specific behaviour for generic ioctls, especially
>>> anything a compositor will use directly.
>>>
>>>>> My reasons for making this work is both less trouble for userspace (did
>>>>> you test with various wayland compositors out there, not just amdgpu x86
>>>>
>>>> I didn't - will give it a try.
>>
>> Weston worked without crashes, run the egl tester cube there.
>>
>>>>
>>>>> driver?), but also testing.
>>>>>
>>>>> We still need a bunch of these checks in various places or you'll wait a
>>>>> very long time for a pending modeset or similar to complete. Being able to
>>>>> run that code easily after hotunplug has completed should help a lot with
>>>>> testing.
>>>>>
>>>>> Plus various drivers already acquired drm_dev_enter/exit and now I wonder
>>>>> whether that was properly tested or not ...
>>>>>
>>>>> I guess maybe we need a drm module option to disable this check, so that
>>>>> we can exercise the code as if the ioctl has raced with hotunplug at the
>>>>> worst possible moment.
>>>>>
>>>>> Also atomic is really tricky here: I assume your testing has just done
>>>>> normal synchronous commits, but anything that goes through atomic can be
>>>>> done nonblocking in a separate thread. Which the ioctl catch-all here wont
>>>>> capture.
>>>>
>>>> Yes, async commit was on my mind and thanks for reminding me. Indeed
>>>> I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
>>>> drm_dev_enter/exit. Note that i have a bunch of patches, all name's
>>>> starting with 'Scope....' that just methodically put all the background
>>>> work items and timers the drivers schedules in drm_dev_enter/exit scope.
>>>> This was supposed to be part of the 'Scope Display code' patch.
>>>
>>> That's too much. You still have to arrange that the flip completion event
>>> gets sent out. So it's a bit tricky.
>>>
>>> In other places the same problem applies, e.g. probe functions need to
>>> make sure they report "disconnected".
>>
>> I see, well, this is all part of KMS support which I defer for now
>> anyway. Will tackle it then.
>>
>>>
>>>>>>>> You probably need similar (and very precisely defined) rules for amdgpu.
>>>>>>>> And those must definitely exclude any shard ioctls from randomly failing
>>>>>>>> with EIO, because that just kills the box and defeats the point of trying
>>>>>>>> to gracefully handling hotunplug and making sure userspace has a chance of
>>>>>>>> survival. E.g. for atomic everything should continue, including flip
>>>>>>>> completion, but we set all outputs to "disconnected" and send out the
>>>>>>>> uevent. Maybe crtc enabling can fail too, but that can also be handled
>>>>>>>> through the async status we're using to signal DP link failures to
>>>>>>>> userspace.
>>>>>>
>>>>>> As I pointed before, because of the complexity of the topic I prefer to
>>>>>> take it step by step and solve first for secondary device use case, not
>>>>>> for primary, display attached device.
>>>>>
>>>>> Yeah makes sense. But then I think the right patch is to roll this out for
>>>>> all drivers, properly justified with existing code. Not behind a driver
>>>>> flag, because with all these different compositors the last thing we want
>>>>> is a proliferation of driver-specific behaviour. That's imo the worst
>>>>> option of all of them and needs to be avoided.
>>>>
>>>> So this kind of patch would be acceptable to you if I unconditionally
>>>> scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
>>>> I am worried to break other drivers with this, see patch https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Ddrm-misc-next%26id%3Df0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca0ca5bdab20a4533491c08d91072fe2a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637558908355926609%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=62f4gdl3lQH0ap58HTyv47zxALjaa5Td%2BysskR83rig%3D&amp;reserved=0
>>>> Before setting drm_dev_unplug I go through a whole process of signalling
>>>> all possible fences in the system which some one some where might be
>>>> waiting on. My concern is that in the absence of HW those fences won't
>>>> signal and so unless I signal them myself srcu_synchrionize in
>>>> drm_dev_unplug will hang waiting for any such code scoped by
>>>> drm_dev_enter/exit.
>>>
>>> Uh right. I forgot about this.
>>>
>>> Which would kinda mean the top level scope is maybe not the best idea, and
>>> perhaps we should indeed drill it down. But then the testing issue
>>> definitely gets a lot worse.
>>>
>>> So what if we'd push that drm_dev_is_unplugged check down into ioctls?
>>> Then we can make a case-by case decision whether it should be converted to
>>> drm_dev_enter/exit, needs to be pushed down further into drivers (due to
>>> fence wait issues) or other concerns?
>>>
>>> Also I guess we need to have a subsystem wide rule on whether you need to
>>> force complete all fences before you call drm_dev_unplug, or afterwards.
>>
>> I don't see how you can handle it afterwards. If a thread is stuck in
>> dma_fence_wait in non interruptible wait (any kernel thread) and with no
>> timeout there is nothing you can do to stop the wait. Any such code
>> scopped with drm_dev_enter/exit will cause a hang in drm_dev_unplug.
>> The only way then is to preemptively force signal all such fences before
>> calling drm_dev_unplug - as I do in the above mentioned patch.
> 
> Yeah, which is why I don't think top-level drm_dev_enter/exit is a good
> idea.
> 
>>> If we have mixed behaviour on this there will be disappointment. And since
>>> hotunplug and dma_fence completion are both userspace visible that
>>> inconsistency might have bigger impact.
>>>
>>> This is all very tricky indeed :-/
>>>
>>> btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
>>> with that: We could do the same trick we've done for DRM_UNLOCKED:
>>> - drm_dev_enter/exit is called for any ioctl that has not set the
>>>     DRM_HOTUNPLUG_SAFE flag
>>> - for drm core ioctls we push them into all ioctls and decide how to
>>>     handle/where (with the aim to have the least amount of code flow
>>>     different during hotunplug vs after hotunplug has finished, to reduce
>>>     testing scope)
>>> - then we make DRM_HOTUNPLUG_SAFE the implied default
>>>
>>> This would have us left with render ioctls, and I think the defensive
>>> assumption there is that they're all hotunplug safe. We might hang on a
>>> fence wait, but that's fixable, and it's better than blowing up on a
>>> use-after-free security bug.
>>>
>>> Thoughts?
>>
>> I don't fully see a difference between the approach described above and
>> the full drill down to each driver and even within the driver, to the HW
>> back-ends - what criteria I would use to decide if for a given IOCTL i
>> scope with drm_dev_enter/exit at the highest level while for another
>> i go all the way down ? If we would agree that signaling the fences
>> preemptively before engaging drm_dev_unplug is generically the right
>> approach maybe we can then scope drm_ioctl unconditionally with
>> drm_dev_enter/exit and then for each driver go through the same process
>> I do for amdgpu - writing driver specific function which takes care of
>> all the fences. We could then just create a drm callback which would
>> be called from drm_ioctl before drm_dev_unplug is called.
> 
> So I see the appeal of just nuking all the fences, but I'm not sure that's
> a good plan. We've done this in the old i915 gpu reset code too, and the
> issue is it's defacto inverting the locking. But also the hw is truly
> gone, so it also makes sense.
> 
> The problem is a bit roll-out, if we state that dma_fence_wait is allowed
> with a drm_dev_enter/exit, then all drivers need to force-retire their
> fences.
> 
> The other option would be that we require that dma_fence_wait is _not_
> allowed in drm_dev_enter/exit, and that therefore these areas must be
> marked up more fine-grained to avoid deadlocks. I like this more from the
> testing aspect (it makes it easier to be reasonable sure your code handles
> concurrent hotunplug), but also it's pretty easy to validate with the
> dma_fence lockdep annotations we have I think.

They key question as I see it - is it ok for a device to be unplugged
while it's driver has anywhere in it's code a dma_fence_wait
waiting for work completion from this device. The answers seems to me
is no, the HW is gone, this fence will never signal and so you will be
left with indefinitely hanged code thread with all it's unreleased
resources. If i am correct in the above statement then avoiding scoping
code with drm_dev_enter/exit because a dma_fence_wait might be there in 
the middle
just hides the problem. Also, then the only solution for each driver
wanting to support hot-unplug is to force retire all it's HW
fences once it's notified of device removal.

> 
> A third reasons for not requiring force-retiring of dma_fence before
> drm_dev_unplug is the races: Before drm_dev_unplug you haven't stopped new
> fences from happening, but until you've stopped new fences it's hard to
> guarantee they're all retired. How do you solve this currently.

See amdgpu_finilize_device_fences in 
https://patchwork.ozlabs.org/project/linux-pci/patch/20210428151207.1212258-20-andrey.grodzovsky@amd.com/ 
I think the steps described there answer your
concern here.

> 
> Finally there's still hangcheck and all that, so if we go with forbidding
> dma_fence_wait from within drm_dev_enter/exit sections, then drivers don't
> need to have additional tricky code to force-retire fences. TDR will take
> care already (albeit with maybe a slightly annoying long timeout, which
> we can shorten to "time out everything immediately" after drm_dev_unplug).

I am not aware of TDR handlers  that do it today, at least we don't,
we don't check that if device is gone let's instead of resetting the device
and resubmit jobs just force retire all the HW fences. In any case, this
can and i think should be done in pci remove callback because this is
the place that supposed to handle device extraction. I for example in 
amdgpu_finilize_device_fences just block all TDRs from taking place as 
first step in the process. If other drivers want to force retire fences
in their TDR handlers they still need to block and wait for all such
TDRs in their pci_remove handler.

> 
> What we definitely can't have is half the drivers doing it one way, and
> the other half the other way. So your driver flag to wrap the ioctl
> optionally in a drm_dev_enter/exit path is a no-go still I think.
> 
> I guess my tldr; is: I definitely see how your current approach gives
> quicker results for amdgpu right now, but long term I'm seeing more
> positives on the other one. At least I expect less special cases due to
> hotunplug with that.

As i expressed my viewpoint above - seems to me any driver in need to
support hot-unplug must force retire it's fences because of need to
unblock all dma_fence waits and so it will not be a special case.

Andrey

> 
> Cheers, Daniel
> 
>>
>> Andrey
>>
>>>
>>> It is unfortunately even more work until we've reached the goal, but I
>>> think it's safest and most flexible approach overall.
>>>
>>> Cheers, Daniel
>>>
>>>>
>>>> Andrey
>>>>
>>>>>
>>>>> Cheers, Daniel
>>>>>
>>>>>
>>>>>>
>>>>>>>>
>>>>>>>> I guess we should clarify this in the hotunplug doc?
>>>>>>
>>>>>> Agree
>>>>>>
>>>>>>>
>>>>>>> To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
>>>>>>> really make no sense, and where we're rather confident that all properly
>>>>>>> implemented userspace will gracefully handle failures. Like a modeset, or
>>>>>>> opening a device, or trying to import a dma-buf or stuff like that which
>>>>>>> can already fail in normal operation for any kind of reason.
>>>>>>>
>>>>>>> But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
>>>>>>> after hotunplug.
>>>>>>
>>>>>> As I pointed above, this a bit confuses me given that we already do
>>>>>> blanker rejection of IOCTLs if device is unplugged.
>>>>>
>>>>> Well I'm confused about this too :-/
>>>>>
>>>>>>> And then there's the middle ground, like doing a pageflip or buffer flush,
>>>>>>> which I guess some userspace might handle, but risky to inflict those
>>>>>>> consequences on them. atomic modeset is especially fun since depending
>>>>>>> what you're doing it can be both "failures expected" and "failures not
>>>>>>> really expected in normal operation".
>>>>>>>
>>>>>>> Also, this really should be consistent across drivers, not solved with a
>>>>>>> driver flag for every possible combination.
>>>>>>>
>>>>>>> If you look at the current hotunplug kms drivers, they have
>>>>>>> drm_dev_enter/exit sprinkled in specific hw callback functions because of
>>>>>>> the above problems. But maybe it makes sense to change things in a few
>>>>>>> cases. But then we should do it across the board.
>>>>>>
>>>>>> So as I understand your preferred approach is that I scope any back_end, HW
>>>>>> specific function with drm_dev_enter/exit because that where MMIO
>>>>>> access takes place. But besides explicit MMIO access thorough
>>>>>> register accessors in the HW back-end there is also indirect MMIO access
>>>>>> taking place throughout the code in the driver because of various VRAM
>>>>>> BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
>>>>>> access is spread all over in the driver and even in mid-layers such as
>>>>>> TTM and not limited to HW back-end functions. It means it's much harder
>>>>>> to spot such places to surgically scope them with drm_dev_enter/exit and
>>>>>> also that any new such code introduced will immediately break hot unplug
>>>>>> because the developers can't be expected to remember making their code
>>>>>> robust to this specific use case. That why when we discussed internally
>>>>>> what approach to take to protecting code with drm_dev_enter/exit we
>>>>>> opted for using the widest available scope.
>>>>>
>>>>> The thing is, you kinda have to anyway. There's enormous amounts of
>>>>> asynchronous processing going on. E.g. nonblocking atomic commits also do
>>>>> ttm unpinning and fun stuff like that, which if you sync things wrong can
>>>>> happen way late. So the door for bad fallout is wide open :-(
>>>>>
>>>>> I'm not sure where the right tradeoff is to make sure we catch them all,
>>>>> and can make sure with testing that we've indeed caught them all.
>>>>> -Daniel
>>>>>
>>>
> 
