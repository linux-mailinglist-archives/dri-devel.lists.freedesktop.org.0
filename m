Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016436F109
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 22:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FF86F4B8;
	Thu, 29 Apr 2021 20:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722246E2B4;
 Thu, 29 Apr 2021 20:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1Kc9bitG3R4pjdzr7SpM0toMJ9qYn+HIo8uYO9+LN8bupndvH8CfdIjQcomxn82a+4Oi4fUdvNdix1FS+KBg0sIPxSXENJYqCK6zUj/t5Qva9DtnILONn5HSK2Kc+BS4vyGGDuUEImzpQTm/MpWT6PAd5eK2J8KuTaeqanrPKucL+FJNlvYtSAEvW8aYAW5mZrN+cOaANoGlWAgomyvLUHiJITuFXFsmnj6B91aRm1816yartFbl3PpmVTx0J82HFT/BqE0i49o9DwJAu4mlSSWZk0Lj8ovMDYWtQrcd0N5whXc7aXhaxGsVkXEHLDrOPDvtcgMnN0Ni0JdUcriuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyaDJAns1oPoekvhFrSnlY9L9pEb9Pi/QnDhag6eKw4=;
 b=D3EfaZ17zFqZRGuZXboOm+MDMz4HVytonAK/lMIl1aozBzwIqD+bc/UC1Oskpu86jSjkrMf8spnLy07KSxZsYgh+BQ5vp5tYjKv8/EvSiw8Ruz9RaE7DZf3c+yMKfXdlmPOcyghTbxOGl67iIOQfwArDYpONPoVhYodDmTYuJiKf+2+4JyT6A39kjA1oCR2UMMtz8N1ngz9HID5JfXRhhxMnNcfYoU5oacCQlSBxgr9kaSMSm2hSqt1B7oQ3yvZwhyAj1y2ySblIv+h1NMl6N8lT/RTkjXfYoaf7xY9DTkTM14tsvMpEAp5tD5/qAZN6ZftFD3A2kdty24AVvbVHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyaDJAns1oPoekvhFrSnlY9L9pEb9Pi/QnDhag6eKw4=;
 b=cBOXYd6I/qcF9/wKfz2tv85fYN4hyzZWn3o/V/1m4345CresHJfHr6MUfnxU+frDvE85wEcTpZ/Of0pn/qP1QtskfqHxrTE/15orYk8isxsXkxd+XfhNy6n/wzXrkLUEsT9FVlCog3aXEJprL1E8vFj4Hi0Vjkd0VVOLUY8OHvA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2816.namprd12.prod.outlook.com (2603:10b6:805:75::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 29 Apr
 2021 20:34:58 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 20:34:58 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
Date: Thu, 29 Apr 2021 16:34:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 20:34:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d1ea42-0177-47d4-7021-08d90b4e419c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2816:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2816A930A621B6B58A39D4A6EA5F9@SN6PR12MB2816.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PS9zAqgxKWkJ6QJiAX2TbZTkccy7kz3+yyWqffu9JVQ0mnqet47o1Jct69qA6av/mOsTh6RVYBRlOW0Itcfbk97GMNPPIwMSSHN8UmgWJY9aVfmkAArXgdnwku0Gq81C+V/OBoLp7F3FN23ONYJNOtAK+u3ZW+FUEoo7URcEHgjsjte2GvWmH7GGiDp1einXkKlvlAydx5wNy4i8pdBGRPbNDf6GqZv6dwduhYTp8jrIss2C8QGn/z/XiMbj7GCZYV9abjF1s5FvtHO1MHlt/16hzn9v3Q5dNqYikIhwR8DmfceKb36n3MCM7UPS6KU7RaqZFjrGT0NE6GSyaqi4dkGJyuGhv/kUQLaXfneLeHlhzwSWvU+vMva3MpRuDyFkfN83Rdo6o9GGeb08Air2+WCGQ5uyPYvZ4olxIkhYyEsNtvqeaXHk8rDnruEIvicew1rHtgnOHGfdazl7SobvpSUVI5ATv6S9ofRFuOROW01AEi3IRD2TV5Pbt38Bk1i/84k+v5ZuM0TMLGGcj7cSrTBo35TtxIIFsK9wOl6iYdLShB9yPDeaoqE/1pqd5IjfzNK4uf/I1Fk5bw5yGoUNwZUp25Ul9kQ7bhByFoq6GPi46uztUBzenkIU77F0eEHLDjkuf4Sijb2mzd4DaYn3hW1/Z/BrIZWgew3cUAi3lpTEyCeMnmbBGRCmC7A93X43z/sKrfIdkWOcySL9MvIeOBt7XLuAle6EcWhjww+KfJmusm78E+hgj7pCLCgL8B1JG1LNK/EwXotgdrAoHo3ghw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(31696002)(6486002)(6916009)(36756003)(38100700002)(31686004)(2906002)(2616005)(316002)(52116002)(4326008)(53546011)(83380400001)(478600001)(966005)(186003)(66556008)(44832011)(8936002)(66946007)(5660300002)(86362001)(66476007)(8676002)(45080400002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WHNCdURsNm42RVBkWVJaSmljTEsvNk9lWUpZK040Tm5zOEViZzdINFliOE5m?=
 =?utf-8?B?VTVkL2dvMU9lTkJzREZZbXF5TmtLWFR2c1NtOGNzNDNmSXBscllIUGt4Q1Vx?=
 =?utf-8?B?ODRoQndGSkNpTnBkaXdSSERrb3VQV09teFZvRWkwWUwxNkdjZVBXdnprcUZs?=
 =?utf-8?B?cHZ3cXgrQjBtQTZsR0FGWnh0VEd0aWZYcDJDNFB3WVN6MWI1bWhBNmxsUklO?=
 =?utf-8?B?NGR0VDQ1TFhsVThKTllKK2ZkZ1VHYkJSbXVCblJqQ0F5Y3kyOXhsT1hST1hX?=
 =?utf-8?B?dWNnTjJldjM2ZXp0TDYwaEx1VDIyNTk2a3ZVUTE0YlVVZ2U5RUZCVXdNL2hr?=
 =?utf-8?B?TTBVck5GQlJqR1RYNm04ekk3eFNvYTlsSTVXeU04Y1gwekxqRTVZMkd5czhU?=
 =?utf-8?B?VXNseGFqM2tTdGQ2SUhrZUVHMWk1dlRiNUJEdHI1b2I3NGNwbStmcmQxem9G?=
 =?utf-8?B?YXNvc1N4RHpUaTQxdEFPRHlrQ2lETDEwKzkraC8zK0NuMjl6dzNQZ3g1Y3pO?=
 =?utf-8?B?K1FuWTAxd09ud0orcHU0c2tGVTFuQitadUVyaXduKzNsY3l5VEVmNlNQUVJm?=
 =?utf-8?B?bW1JMVp1Tzc2NVAvM3NuRzdCOGV6SEJEckNuMDNwQkVhejR5a3MwRXhzZ1p1?=
 =?utf-8?B?VUFkT3ZOOVhoZG5GMjQrOTZaMS8vT0hvaEpJWDFUNVZ3Q1N4L3NXRzNpUW9h?=
 =?utf-8?B?VDlpNVk1bVlHNC92TllBUWdvcnhSUzVOU2NKQTdjUTZ3b1JZNTFTYTBka1Zn?=
 =?utf-8?B?YldQcUptc0Yya21pOExubXhzRmYydlkxaysySjlabzkxNUVpN3RSWUNmTkdI?=
 =?utf-8?B?QzlNYnp6a0U0K1VZSGFSNG1FZVV2YWhqNjJsRnlVTE9RUUtDOUV2dWZVK2w1?=
 =?utf-8?B?am5aU2pQUWpRemduWGtQdmlKN2cyMnhCeG1kbFgyU2tBTFppekh4QU1yVHpm?=
 =?utf-8?B?ZzBDL0c3b0pUSGVPSmlWcU9KNVlFY3FlUzdUUGcxRXVlKzdubjNBWWJRMGNx?=
 =?utf-8?B?czJQUTZpbGk2V29oL1pTeWUxOFFyb3dLZTNUc0NuZWttVU5FVDhlZzNoaWFm?=
 =?utf-8?B?TEt1bndQOVgyOTh3ZEpHcXZrZ2kyNlZRVzBjdlFzejVRRHN6bm1GVm9pMDBY?=
 =?utf-8?B?RUtOandRNy83RW9DMm9OSnRVVVVMOUFtak0vYXZ1WEl0OVd3d2hiRDFxcVJ5?=
 =?utf-8?B?ZGJjOXd3YjQyMldSQjBjbkltNjZweU5PV2g1VWM3eElYR2ozdXR0T3lzTDNp?=
 =?utf-8?B?b3drVTJkb1ZiRko0NnVZK2dhSXBuRE5vYmIxMGl4OW5vMEkyaU51QlR2TldE?=
 =?utf-8?B?YnVlRTk2aWFIVmVhL0Q3MU5Fek5yQjA4MGw4YzBOdmExU09YeWgwS1pzamI4?=
 =?utf-8?B?WWY3SU1iMVg2T1hST3JPK0hjU0NpZXNGOFA0WUdiam9TTU84di85L0hSbHY0?=
 =?utf-8?B?OTZnN09PbFBRNDZVZ293Y2NNNWRkeGdqdHppbVErZWZGanFLRVpmekJ6VEVC?=
 =?utf-8?B?TmtlbG5ETUlIRlR6RldpNGd3aVZyNzU4UzhudWpXNmJ4YkJiUCtQN1lXcDhz?=
 =?utf-8?B?czR5YkpBTGVqZWVPeWhaNjd6S05ZeDNFeklHZmc3VWJKdHlzWFgyaFY2SGNm?=
 =?utf-8?B?M1haSTQ0WTkwYXlaei9lM2RCcHcvaWhHZHErWUJ0ZzgzQ21tblRUWnNSQTVY?=
 =?utf-8?B?SjBFemtPUHJHaS9ZQVl5aUtiSmJxVEZDd1M5dEw2RGowdkhrc0lZdkVGNkdH?=
 =?utf-8?B?QTczWU8rMGhhTnZXeWl1TTFvK1ROZnc2Y2I4Sys4VmdlZVpZMG9sb0Z0eFdn?=
 =?utf-8?B?NXNEK3pMU29uNGpYNFFDQmY3N1hsdCtINm9OenRmaDFtRjVzRlhZNVpOUFly?=
 =?utf-8?Q?LSjK/TV4nNsAF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d1ea42-0177-47d4-7021-08d90b4e419c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 20:34:58.8150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6dS/DtsDn3OgLPwugfKU/DH4n/gXXr+oaBLPWHablEmF/eAH6mzO39sekp5T6P6WI9iXmZ3YQYfu43UYJvPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2816
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



On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
>>
>>
>> On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
>>> On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
>>>> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
>>>>> With this calling drm_dev_unplug will flush and block
>>>>> all in flight IOCTLs
>>>>>
>>>>> Also, add feature such that if device supports graceful unplug
>>>>> we enclose entire IOCTL in SRCU critical section.
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>
>>>> Nope.
>>>>
>>>> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
>>
>> Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C1821a19173a84ebae31108d90b41b2fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553199084555468%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=d6kXadWHv4CEDgODsm%2FOzIIjIDA9rZDLUuV11MmEU3A%3D&amp;reserved=0
>> currently in code ?
> 
> I forgot about this one, again. Thanks for reminding.
> 
>>>> Especially not with an opt-in flag so that it could be shrugged of as a
>>>> driver hack. Most of these ioctls should have absolutely no problem
>>>> working after hotunplug.
>>>>
>>>> Also, doing this defeats the point since it pretty much guarantees
>>>> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
>>>> is that only execbuf (and even that only when userspace has indicated
>>>> support for non-recoverable hw ctx) is allowed to fail. Anything else
>>>> might crash userspace.
>>
>> Given that as I pointed above we already fail any IOCTls with -ENODEV
>> when device is unplugged, it seems those crashes don't happen that
>> often ? Also, in all my testing I don't think I saw a user space crash
>> I could attribute to this.
> 
> I guess it should be ok.

What should be ok ?
> 
> My reasons for making this work is both less trouble for userspace (did
> you test with various wayland compositors out there, not just amdgpu x86

I didn't - will give it a try.

> driver?), but also testing.
> 
> We still need a bunch of these checks in various places or you'll wait a
> very long time for a pending modeset or similar to complete. Being able to
> run that code easily after hotunplug has completed should help a lot with
> testing.
> 
> Plus various drivers already acquired drm_dev_enter/exit and now I wonder
> whether that was properly tested or not ...
> 
> I guess maybe we need a drm module option to disable this check, so that
> we can exercise the code as if the ioctl has raced with hotunplug at the
> worst possible moment.
> 
> Also atomic is really tricky here: I assume your testing has just done
> normal synchronous commits, but anything that goes through atomic can be
> done nonblocking in a separate thread. Which the ioctl catch-all here wont
> capture.

Yes, async commit was on my mind and thanks for reminding me. Indeed
I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
drm_dev_enter/exit. Note that i have a bunch of patches, all name's
starting with 'Scope....' that just methodically put all the background
work items and timers the drivers schedules in drm_dev_enter/exit scope.
This was supposed to be part of the 'Scope Display code' patch.

> 
>>>> You probably need similar (and very precisely defined) rules for amdgpu.
>>>> And those must definitely exclude any shard ioctls from randomly failing
>>>> with EIO, because that just kills the box and defeats the point of trying
>>>> to gracefully handling hotunplug and making sure userspace has a chance of
>>>> survival. E.g. for atomic everything should continue, including flip
>>>> completion, but we set all outputs to "disconnected" and send out the
>>>> uevent. Maybe crtc enabling can fail too, but that can also be handled
>>>> through the async status we're using to signal DP link failures to
>>>> userspace.
>>
>> As I pointed before, because of the complexity of the topic I prefer to
>> take it step by step and solve first for secondary device use case, not
>> for primary, display attached device.
> 
> Yeah makes sense. But then I think the right patch is to roll this out for
> all drivers, properly justified with existing code. Not behind a driver
> flag, because with all these different compositors the last thing we want
> is a proliferation of driver-specific behaviour. That's imo the worst
> option of all of them and needs to be avoided.

So this kind of patch would be acceptable to you if I unconditionally
scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
I am worried to break other drivers with this, see patch 
https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=drm-misc-next&id=f0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6
Before setting drm_dev_unplug I go through a whole process of signalling
all possible fences in the system which some one some where might be
waiting on. My concern is that in the absence of HW those fences won't
signal and so unless I signal them myself srcu_synchrionize in
drm_dev_unplug will hang waiting for any such code scoped by
drm_dev_enter/exit.

Andrey

> 
> Cheers, Daniel
> 
> 
>>
>>>>
>>>> I guess we should clarify this in the hotunplug doc?
>>
>> Agree
>>
>>>
>>> To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
>>> really make no sense, and where we're rather confident that all properly
>>> implemented userspace will gracefully handle failures. Like a modeset, or
>>> opening a device, or trying to import a dma-buf or stuff like that which
>>> can already fail in normal operation for any kind of reason.
>>>
>>> But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
>>> after hotunplug.
>>
>> As I pointed above, this a bit confuses me given that we already do
>> blanker rejection of IOCTLs if device is unplugged.
> 
> Well I'm confused about this too :-/
> 
>>> And then there's the middle ground, like doing a pageflip or buffer flush,
>>> which I guess some userspace might handle, but risky to inflict those
>>> consequences on them. atomic modeset is especially fun since depending
>>> what you're doing it can be both "failures expected" and "failures not
>>> really expected in normal operation".
>>>
>>> Also, this really should be consistent across drivers, not solved with a
>>> driver flag for every possible combination.
>>>
>>> If you look at the current hotunplug kms drivers, they have
>>> drm_dev_enter/exit sprinkled in specific hw callback functions because of
>>> the above problems. But maybe it makes sense to change things in a few
>>> cases. But then we should do it across the board.
>>
>> So as I understand your preferred approach is that I scope any back_end, HW
>> specific function with drm_dev_enter/exit because that where MMIO
>> access takes place. But besides explicit MMIO access thorough
>> register accessors in the HW back-end there is also indirect MMIO access
>> taking place throughout the code in the driver because of various VRAM
>> BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
>> access is spread all over in the driver and even in mid-layers such as
>> TTM and not limited to HW back-end functions. It means it's much harder
>> to spot such places to surgically scope them with drm_dev_enter/exit and
>> also that any new such code introduced will immediately break hot unplug
>> because the developers can't be expected to remember making their code
>> robust to this specific use case. That why when we discussed internally
>> what approach to take to protecting code with drm_dev_enter/exit we
>> opted for using the widest available scope.
> 
> The thing is, you kinda have to anyway. There's enormous amounts of
> asynchronous processing going on. E.g. nonblocking atomic commits also do
> ttm unpinning and fun stuff like that, which if you sync things wrong can
> happen way late. So the door for bad fallout is wide open :-(
> 
> I'm not sure where the right tradeoff is to make sure we catch them all,
> and can make sure with testing that we've indeed caught them all.
> -Daniel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
