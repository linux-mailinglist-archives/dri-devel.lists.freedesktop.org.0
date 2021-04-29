Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA936EDD2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49166F39F;
	Thu, 29 Apr 2021 16:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1B26F39F;
 Thu, 29 Apr 2021 16:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2rKIDdzXK1EZ5naDZw0KsRkHRPyIBAN0EfJaI1F+0irfkOdqSEHL28rASdLwUFvemZqopEbJril71Huc4bXDYkIaWXxr1BeiVD/R5c80T2jMvdEozzozR6DzQbYL5trcmTWg1c2VlGNkGlyanoPh8B+aOvneqetKkLUcwUb15UbeDulTMkgv4ruIF7wmJ6AAQfGkb2TxbPMkShRyQkeFnn6US9z3IiLvHV3PwKzzN3JmaAKGRH7HUXvkMGEpQI6hra23D8iV9kAX1k3ZvkSZDsA1+P5XHADeT6pLrPs6y3aWqhqY4DiLtGU3KOPcKVhNBjxRKSgc4gW/nJNKnG+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ+j4UIezz4CxorOlYO4JzR7qL7cqsVhLO5LcLeFtuk=;
 b=jOrcq+jEkXHYyLtlb34CN1v4dTOjVZtnZ8nAvjnG4MNLwxvStXNraiRy0JAHDVGvypIVmVHTvAmT9yVQR9cOkUIpRNAmxaa0LPedsAoPY7WD2jVnBvNdvy/by8nLaJoSTLslQOoxT8HiOx1ekADbP8nHOOdmbVHXwP9p3xLdBJmGiRKXcKDsj61gZuB6CmgDrTwkF6+hVMiEIW8R+uqvwOU0dX3ZOKZJ5KgbAbXqzGbYJuV+6uP8SLQhiyXph0iQOpVtmYFMdYaQ4ofSZN/Bv2iC0Dgs3uUqb4X0URBeDYXbvr5QPXu4W9WxKgOCK3MjYMiAQdHWkhEldqBajsUPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ+j4UIezz4CxorOlYO4JzR7qL7cqsVhLO5LcLeFtuk=;
 b=uo9FiMroJPxSCQPXO2Fb+sAClJGshBPPtIaAH4GybOnq/YQ82kwnQQ5gmbgqkmZRwnn9pVhaSezHkpDafG3cb7j17ucH/vAw1TfapUxp3D5ACtY5bK3mSoldgxEdqmpAYHUYU2AU6fPrTLxHAsPlzQ+SkRDfzoou5Wp8CVtXKNE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 16:04:37 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 16:04:37 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
Date: Thu, 29 Apr 2021 12:04:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::17) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24 via Frontend
 Transport; Thu, 29 Apr 2021 16:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4245ecbf-c57a-4df1-7f56-08d90b287cb2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB457668B264295AB8A45232CEEA5F9@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yIS7ehdfQQh8q+UyWBzPkjU5zkavCsVlkx6PSpTTbWK/phYqQm0ee0HQgaRRypsbY/6e+wQMW1A3vb1P4kW1dTiMoX9wMPmQvsOGk9cEZkVo7bXP4QeSPlmknbzC67YVlwsAkuLnLe8RIHZ6CdX2idikiD23vVCyfR8bfudgp+sraZWdAMrxLhN/oCaiqdIT+lKqdx0MkxmSK4bxQ4zqvPjrxjsYT+hfy14jJ9U2dQfoiBlg7ksEEefuScZpShFs+aGPW1+s64umrcL5nJiClg6jUV6FmSNKLeJ4zHAAMDQNW6W9IzWS/CNrhXfA+dsxo3RjR0H2SaVaiZoCbH1RkKYK4+0h+WPUdR/LGvPY4+l4Mgpd4hXKPC7s57auQWFOz8AZg231wVFk+d+WZmtyJXJLAhobNMCCajpVv0FkomvftCuld2zHOIDcxJAWQhKI9Ue4DdRJuylIDCNNTnW7M4tuRzfYn+s9IytRyk9Nq+13cBaXvy4yWeQe4A2ll1VMRCKQX3aCVlkQjGVrWxmRQsaKtv4A/o3C4WCrfCl169d4pHkc1vdJ9X2vT/vgoW1KgKjbhAas6pq/emSBJi3Wo0mca4RPFkuLEyAtXFUfN7PiSKyXjNhuidn+LSWhdm8TA1XOkAt8zM8JqKpRPJkaTgz54gz+lS3vUlyMqkh+iUiw7L11zvzny5VYuEMXHd9fiiH9y5AL80mm4kW7eSpNTs3/unusOppL1wmy4aJfbdQPc1Bvzb9jTQpEacYAXhcXGRDhrDW9PnFiJ5LfiUamnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(86362001)(52116002)(66556008)(8676002)(5660300002)(316002)(478600001)(8936002)(66946007)(966005)(66476007)(31686004)(4326008)(6486002)(2616005)(53546011)(44832011)(6916009)(186003)(16526019)(38100700002)(83380400001)(31696002)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnVOWmVMd1pBNmhoS0tLV0twYjdOdkY0bGVuM1NVd1hJNFJ3L3dMVStscHd6?=
 =?utf-8?B?YjM3Qlp3emlpLzNqY3MwT3BVb3M5R3doayt2eGhHVWxGTUtRZmswVTFEWW1s?=
 =?utf-8?B?WVNqcFBhNDJiVjduaEYwQ2FaWVQ2YTNwbmNJby9LNnF2UU5OT2lwc0toSGQr?=
 =?utf-8?B?MWNXV0lIcmEyNm8xbFoxRlk3T0tOUmlzdmVLSDhLbzBNaHN3dE83S3FFc1ln?=
 =?utf-8?B?di9zUndVaGdheWtSWXl2S2hCbllqWGdJb1gvQmdwZW9ZNFhtMFB6ajhmU2lU?=
 =?utf-8?B?ODNyWUF0Vk5kYTVMZ0Y5R0VjOWFtS0RJSEtKcittTlo3ZUNPVG1qZmxKSVpU?=
 =?utf-8?B?QlJmMENEM2RVUllCR3JFcm5RSEZ0MGwzbUQ4dDJRUVo4bDFGV0w5VGxHamtr?=
 =?utf-8?B?SHk5bmpnVDFwY29zNlJaeHJ3aXVjWGhidk8yUDc2VmR5YVgrNU90ak4rZ1VQ?=
 =?utf-8?B?VTc0R0RIWlI0WmxWNHZHeWN3WXFNUmVQODFHa2xoTTR5akJ4Y3NCamF0eTg5?=
 =?utf-8?B?SmUrTlFiU1FkRjhnd0JHWmxmcWE3Y1d2eUxiOUpkekoyR2hnVVU4VFdFd3My?=
 =?utf-8?B?SldJU3hGdzgxaGpta2JLcThTeThLNTRLMkMxMDZiNnVOd3lQdUVJTWNLOXVt?=
 =?utf-8?B?VTJOSFBzOWlaWUd2Vk9PTlNqUUVSeEhHQ2lIUUNNVUJaNnFYVERvVWp5YVlh?=
 =?utf-8?B?Y2pJMytiR2NoREhvVU4yWk1PT2tiTUx2My9Xb3BXbWNlMXlEaG00VHRDdHNq?=
 =?utf-8?B?MVN6OU53R3BZN1NldU9qc2ZEdG1SbkgzSHpQS0VmOFQ4K25ET3lZV0NqUjhG?=
 =?utf-8?B?UnV1QlUwYmxQeUppdkxaT2xKdVJWQ21qa091dmNqQXJ6SWVEQ3lqa1ZhbE9q?=
 =?utf-8?B?eS9WOVNwTW5uRURLdU9FdkZ5OElYWEptRk4yZXJRQjdqNDJMbzJWUjBQc3g4?=
 =?utf-8?B?bm5zQU05WmZ3Y0JxZDVBNGRDQTNXTldPaGlSQms4eUdDVzFyNWNKUVc1SmdG?=
 =?utf-8?B?U1A2WU4ydDRPOGhwNENObkpDakxYWDJKNWg0SjNjdUI2cnQwNmcvWXFXT1ZZ?=
 =?utf-8?B?WWRVQW9WSXVmWXJsZVViZFdrWU1zb1FLdnQzeVh2WHZqbms3ejVLTk1zUE9a?=
 =?utf-8?B?L0R2dWJLWC9ubEczWEo3SXdUSWI1cjRxZCs1R1dJdHdlNERhMnBoNlhHTmIw?=
 =?utf-8?B?a1NBZmt3S3QvQ0hCWCtobUVIc3RadXhZMm9DTlRUaG1WMERHRjR0ZDF6YnV3?=
 =?utf-8?B?UnBOUm4xMWZid1BsSGRHcVc1Sk16dFJPU3hUL2JNa2UzR0hZNWZzQzZxT2Zp?=
 =?utf-8?B?N2ErdTJ2ZXNnNm50N0haNUdTc3pnRTBzWHhIMWI2RVIzMDJBd0xncGpTcGF6?=
 =?utf-8?B?MVVjTkVIVU1pRlIwT3ZwbFp4UGZ3YlNab1hXT0JVMHloc1hRVEM2aDh5OGVL?=
 =?utf-8?B?clp1WkJIMUZnYlZHRDd5d2ZwSnVoYW5aNGJ6VGtyZXJaUTh6aVJpSEtwUmpr?=
 =?utf-8?B?aWpBa2t4dkR1UENFUlIwSExSMWswM2dqaFgvNDdmcjkzZXdhUXlZMGRpM3FX?=
 =?utf-8?B?QnJybTlaU051YkZYWnJDek5uS2FFeGcwOUNWVEZEY0NucDhwZ29UcU81akxh?=
 =?utf-8?B?N2YrZDFnZGhTTDIyYldiY3NIY0JkREZWaW5DWTRzSXphdkFQeDArWUZ6S1BO?=
 =?utf-8?B?L3MwYllWYnQrVWlCSTZCNStLa0pFcmFCaW1DZWFZSVo5bzBJU0xsR2xJTStQ?=
 =?utf-8?B?cm1GYkkwbHQwVXpiakpzWFJQV3lmMW4wSHR5bUZxcFZUV1d4Mk1wMmRoVytm?=
 =?utf-8?B?OGRCQmpqKzNkRE1JUWFhazlkaU0rQkRjNjZHWW14a0F2d2ZrQmE3UTVmT0w3?=
 =?utf-8?Q?4iMPoqv4TnMCq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4245ecbf-c57a-4df1-7f56-08d90b287cb2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:04:36.9935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vh5rjMYZY3Lcqp0vWGNFJt3zKDbGNUL4rUtXUWe3Ad01CNFd72Tb6Av5hhJJMcNv7wqaV3OqnOK7wj8vab3Rug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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



On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
>> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
>>> With this calling drm_dev_unplug will flush and block
>>> all in flight IOCTLs
>>>
>>> Also, add feature such that if device supports graceful unplug
>>> we enclose entire IOCTL in SRCU critical section.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>
>> Nope.
>>
>> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.

Then I am confused why we have 
https://elixir.bootlin.com/linux/v5.12/source/drivers/gpu/drm/drm_ioctl.c#L826
currently in code ?

>>
>> Especially not with an opt-in flag so that it could be shrugged of as a
>> driver hack. Most of these ioctls should have absolutely no problem
>> working after hotunplug.
>>
>> Also, doing this defeats the point since it pretty much guarantees
>> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
>> is that only execbuf (and even that only when userspace has indicated
>> support for non-recoverable hw ctx) is allowed to fail. Anything else
>> might crash userspace.

Given that as I pointed above we already fail any IOCTls with -ENODEV
when device is unplugged, it seems those crashes don't happen that
often ? Also, in all my testing I don't think I saw a user space crash
I could attribute to this.

>>
>> You probably need similar (and very precisely defined) rules for amdgpu.
>> And those must definitely exclude any shard ioctls from randomly failing
>> with EIO, because that just kills the box and defeats the point of trying
>> to gracefully handling hotunplug and making sure userspace has a chance of
>> survival. E.g. for atomic everything should continue, including flip
>> completion, but we set all outputs to "disconnected" and send out the
>> uevent. Maybe crtc enabling can fail too, but that can also be handled
>> through the async status we're using to signal DP link failures to
>> userspace.

As I pointed before, because of the complexity of the topic I prefer to
take it step by step and solve first for secondary device use case, not
for primary, display attached device.

>>
>> I guess we should clarify this in the hotunplug doc?

Agree

> 
> To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
> really make no sense, and where we're rather confident that all properly
> implemented userspace will gracefully handle failures. Like a modeset, or
> opening a device, or trying to import a dma-buf or stuff like that which
> can already fail in normal operation for any kind of reason.
> 
> But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
> after hotunplug.

As I pointed above, this a bit confuses me given that we already do
blanker rejection of IOCTLs if device is unplugged.


> 
> And then there's the middle ground, like doing a pageflip or buffer flush,
> which I guess some userspace might handle, but risky to inflict those
> consequences on them. atomic modeset is especially fun since depending
> what you're doing it can be both "failures expected" and "failures not
> really expected in normal operation".
> 
> Also, this really should be consistent across drivers, not solved with a
> driver flag for every possible combination.
> 
> If you look at the current hotunplug kms drivers, they have
> drm_dev_enter/exit sprinkled in specific hw callback functions because of
> the above problems. But maybe it makes sense to change things in a few
> cases. But then we should do it across the board.

So as I understand your preferred approach is that I scope any back_end, 
HW specific function with drm_dev_enter/exit because that where MMIO
access takes place. But besides explicit MMIO access thorough
register accessors in the HW back-end there is also indirect MMIO access
taking place throughout the code in the driver because of various VRAM
BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
access is spread all over in the driver and even in mid-layers such as
TTM and not limited to HW back-end functions. It means it's much harder
to spot such places to surgically scope them with drm_dev_enter/exit and
also that any new such code introduced will immediately break hot unplug
because the developers can't be expected to remember making their code
robust to this specific use case. That why when we discussed internally
what approach to take to protecting code with drm_dev_enter/exit we
opted for using the widest available scope.

Andrey

> 
> Cheers, Daniel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
