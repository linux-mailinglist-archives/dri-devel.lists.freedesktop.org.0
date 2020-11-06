Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5C2A914E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33B6E199;
	Fri,  6 Nov 2020 08:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7E56E199
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 08:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7BDGHu4tnLHsyVFOD7my7VkPVjPTNAb3JQFxyq5P9wZx8YxCAfrIYvRlZfi+OLOzdXe9yjZOHL+hVVeCCa9kLfE4yDoRKrs7rKj122F9aEHgP153TV6zsGmM6yq/U2HPJCwQ6LGegkW8aEbaFgg8YGN9M42OVyavPeag4fLEm6NxAvslo1y8kyby2mQDei+M+E0CbbuX2kg8WppPTY4084AxNUr0cF6SLAGRjDdjjTQTgNIGOzkm5U0zcKsBjM6hiHxLymHfdGHmVR2dsgG0zKp8y8D/M4n1dYhPd5mCXXW27JtsVuTL/kMPHC6Yu2b0jALn75yPOXKOJl47WtxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1WsieQNWUcqB+znIVAFC0I5oYtBSQWSN1XbenWed7A=;
 b=ihaCEFrhqoGVre8arZwKWL9gEtA1HU+01NgI0PufSEEQsmA5g6Qk4wQW5NRWFaqEq4ZUgE02KDYjghUPHPjlOW7RtckJmgJH8gzIxyLFQJTNzrCBBSECahc8xO4EeUkiR1jjeoctGhtxzlym+WRylcEhv0kateGjD01oB/mBCChiAOxe7xu826rjPQ81ag8VvKDIJOKUjLHeWbCfE5eTeAONidJPhsLRDfCkayXzKV9C5sdC4LyZ4q3K4uNn8TjMHOLBa6BOYMeeZ5BUhOTLcjla1hAL/6yI7JwI6duhLWw4XM5f+UneLR4wTPyn1Bs+xco3kei4N8Pg9f2p72MT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1WsieQNWUcqB+znIVAFC0I5oYtBSQWSN1XbenWed7A=;
 b=BoMjqB3x/LIR81HbqgUk4AQycBD3hF3zVYB3h9hioxEoy617XkkG7RqtUFf8aTggGfWfHEGCvCjg+7yoDPbenK13lMYa4ILnGWmpDXo/Kp530mdoKpf8Wxt3AZq1MpAskjDHgZDTcVo8MwpKO31z6Uc69IIgKx/KMm6itk3g5W0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 08:30:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 08:30:24 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
 <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
 <20201105125009.GV401619@phenom.ffwll.local>
 <614b3893-b735-7ba4-4f0a-55891adbdc8d@amd.com>
 <20201105132016.GY401619@phenom.ffwll.local>
 <d15fa2da-fdc7-f7c8-195c-53f9ca505d80@amd.com>
 <CAKMK7uFUUP5Kj4jBh66yHyMMdo_pm=EqybxyhyDkkCROPhD68Q@mail.gmail.com>
 <CAKMK7uHt8Wxxn0LGKQbTOG0q-uTyJ0ob3BSrWoMkm0UA7zsNFg@mail.gmail.com>
 <c04b4710-7b37-bfd4-0bad-859592e9ba33@amd.com>
 <CAKMK7uEUuHSMYH5rSbb4c3_fLidbn-fiRGxV+sy6HbhSnWDhtg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eb149c81-3c7c-c9db-2c90-4cc2a032c8f4@amd.com>
Date: Fri, 6 Nov 2020 09:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEUuHSMYH5rSbb4c3_fLidbn-fiRGxV+sy6HbhSnWDhtg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:205:1::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:205:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.13 via Frontend Transport; Fri, 6 Nov 2020 08:30:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e33f115b-28c8-41cf-ca63-08d8822e34a4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935C950A5019D227AECA78D83ED0@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVRbhxdk0kR/IgVuxsLqoL8EfAo6KiZDBIg6ktaWeTs7H6/SGKvyeKofxGdM5kBp/M46JyPofXFVB6oGNd5voAs7RQEHO7kxPqd0ntGc+jU2PtEBzPjPaxIUjlmlG/BwWf0DFs9nOhEEQoDoSplToRFdJvgEpZXnQkzzO0ZFFyi6mwRZbRsSxiZAkFsZrvgXBxvaruCRsIy5yciABAw1pXbZEB6i5wbJ05NNKDxGpsLbvlkX1BVxUFIY6cKZKJDwsLHNjnllFf6uizmX9m8EIo0MvIEW4RTRzWB6evZpBNmd+E6rx272OeaIjM/P3F549FjfJPt9X1kqaJByLgGh70krKy5/yPxfhgmb0VvaHHBU2SgdLqM4ZPWaEPCTNLHQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(31696002)(2616005)(31686004)(52116002)(8936002)(478600001)(16526019)(6666004)(8676002)(54906003)(186003)(4326008)(5660300002)(36756003)(6916009)(316002)(2906002)(86362001)(66476007)(6486002)(66946007)(83380400001)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0e/I3KbIj1Wrwv2aaTK3FY+xgRlodz1cjSS/P9LJvXnnKhHvwPvEbVt6t1UAfCJG0G9cITGMT893elEy+U4ifb8e6PNur4jdwWU/UZfj8NOUKAr3HvwbpDkgTY0jbDceXQKV9zpWdZnG0srzNoL0vwJbSXU6idlmgXEjhWSHHaM773kNVsIiNMBXrqLgPKz2aobv79vIOeNIvwl4znQWJTXuCGRbHHc3Hwlv7PaF4jQwEOHyiAW4Ihp3RbGdl6IsXq7rYMwB2wYuyOWmvrU8GlyBJ1UjKyiXfNGgIO9DIsS7PlhYsoCjfubSxw6i4VGUl22VCESYsvgtHjzui1vToqqB3WkeJQrQoUlg+hZFmyGAkYm86PTiZI4Z8FnprzxORe5oD1zF9TSewQOC4ogP/tzeN3MHn/6k8Hsx0PIDActjZeD/nfjcr3dsmVwYclZlowLPRKhQLhUk5xfvcoj1y2hHf+UTJC+R4aMf4/WGa+I7zSjREqF7jXs+/mm1o5mLWd/jt5ev9SSiOIELfAsg2j5/epV7xVlrzGv5W5e+cxC1hyxZiz6OmL67/t9BqKL7HgZ35z2aGwuyMGctr7CYNhzPHu9apUxt4THrnPz+uDWZmeVbAvzSG7qgLQc4N/pmiy/2t2JRk3HguLazKU4s9+DHhzwhgOu0o8mf7jmLmkN7wRWXvY3PHbS41DeNTmyHIzh9O3flzeO8xqerPiN9PA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33f115b-28c8-41cf-ca63-08d8822e34a4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 08:30:24.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJV8w3cAFZwE7Hz4/M2djXG45n/QiUe9EPKZXlhyd6qW1CYBr8muSCwm8zkLLilU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.11.20 um 17:37 schrieb Daniel Vetter:
> [SNIP]
>>>>>>>>>>> NAK, we use this to determine if a pages belongs to the driver or not in
>>>>>>>>>>> amdgpu for example.
>>>>>>>>>>>
>>>>>>>>>>> Mostly used for debugging, but I would really like to keep that.
>>>>>>>>>> Can you pls point me at that code? A quick grep hasn't really found much at all.
>>>>>>>>> See amdgpu_iomem_read() for an example:
>>>>>>>> Why do you reject this?
>>>>>>> When IOMMU is disabled or uses an 1 to 1 mapping we would otherwise give the
>>>>>>> same access as /dev/mem to system memory and that is forbidden. But as I
>>>>>>> noted this is just for the debugfs file.
>>>>>> Ah, there's a config option for that. Plus it's debugfs, anything goes in
>>>>>> debugfs, but if you're worried about that hole we should just disable the
>>>>>> entire debugfs file for CONFIG_STRICT_DEVMEM. I can perhaps throw that on
>>>>>> top, that follow_pfn patch series I'm baking is all about this kind of
>>>>>> fun.
>>>>> And exactly that would get a NAK from us.
>>>>>
>>>>> We have specially created that debugfs file as an alternative when
>>>>> CONFIG_STRICT_DEVMEM is set.
>>>> Uh that doesn't work if you work around core restrictions with your
>>>> own debugfs paths.
>> That's why we have the restriction to check the mapping of the pages.
>>
>> This way we only expose the memory which was allocated by our driver and
>> don't allow any uncontrolled access to the whole system memory.
>>
>> We have something similar for radeon as well, but there we have a global
>> GART table which we can use for validating stuff.
> The check doesn't take any locks over the check and copy*user, I don't
> think it's protecting anything really against somewhat adverse
> userspace.

You mean that it's racing with freeing the pages? Yes that is an obvious 
problem, but we already had the same issue for radeon as well.

On the other hand we could easily prevent that with a lock.

> I mean fundamentally locking down stuff like STRICT_DEVMEM or all the
> others makes debugging harder, that's kinda the expected tradeoff.

Well we just wanted to have the same debugging functionality we had for 
radeon.

As you said debugfs is a rabbit hole regarding attack vectors anyway.

If you are root you can just go to /sys and start reprogramming the 
hardware to do what you want to do.

Regards,
Christian.

>
>>>>    Maybe you can do fun like this in your dkms, but
>>>> not in upstream. Like if this was specifically created to work around
>>>> CONFIG_STRICT_DEVMEM (and it sounds like that) then I think this
>>>> should never have landed in upstream to begin with.
>>> I'm also kinda confused that there's distros with CONFIG_STRICT_DEVMEM
>>> which allow debugfs. debugfs is a pretty bad root hole all around, or
>>> at least that's been the assumption all the time.
>> Yeah, completely agree :) But that's not my problem.
> I guess I'll do another rfc series and poke a pile of people ... seems
> to be a habit I'm developing :-)
> -Daniel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
