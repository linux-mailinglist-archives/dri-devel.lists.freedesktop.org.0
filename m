Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3188449856
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590EF89F3B;
	Mon,  8 Nov 2021 15:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2067.outbound.protection.outlook.com [40.107.100.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D289F61;
 Mon,  8 Nov 2021 15:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Att/Jnyh7ykIpGUuOPKWIYXcfFOUW/DcHPXnME/DAwfbsiJOpdT8rNUtYGxqer3WI2R52adffroXoCy8aSXWUEfHFMzmqv8xHT6ngcYAZfbQML+AuUse8RRj98HvTOUlAxLR6vAWZKSklBqwa57Dldz9sUCYujXMj/p9eUNaLXON2b4YWpCkTg1XXlUrCYfEnj5YNAT7kK4f8TRGDGJ+epSun1H79UnfEA7PGdBJ+WZXQEiz+Y78WMBcvbijJcmDdXnnaBKKys2HF3VAFvcei+wY9BX/a1rVJm6mjTgZMn1ontMBf9j1qNZS3ZOE0WfSFcn0qrbr9qaHeXjonqwh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py5easDkfg+py64ESWbVjEZjqBjftO+r7HD0mkznFkQ=;
 b=jbYJ5lkXtiGVhqt7/zHqlkIPZWH9loGDnI0k4zC2XESeAUsAJWuRyFl6MdcTw3Z0lila5xX2QbgovYtREcGt3nz8+IciJajrjcq3nHGcj/mZk5NJ7ZSOnpXsCkYkM+6ZJSMAaXzSfofyhUdpa2JB9SrnlZxBrL2FRqVSMAAUmvG/V1FJpsSKOfCWAHrMW9bmGNeBjRM4Bf1nEC3iFNH00Wb39RPBRoKsDd6va3GlWIAmj+W/5+GDT+0vKtYjJl7xjAFWZceIAk0kgGlGM3ID9YU3dRa7e/4qNUox8Oo/v+JipU5ByXRCARdVeP6QWUTNdj0qpycRc2eOFUBWRV3oCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py5easDkfg+py64ESWbVjEZjqBjftO+r7HD0mkznFkQ=;
 b=JewVIwTLJMlwofTKojsAgcXIaEH9yIMkaHfyQcw/zEe0yZmwcR8Dse28lBVEz7TJUvzbVHJUrZ3r2bqCv7G5gs1WPCFgkGS+eOZacKIkarNx31/VwcO4Y7u+qzbW1IszyXk2PaG2vUWDEneP8BHQq0Jf198uy3+3Vb/gaIHsFY0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by DM8PR12MB5462.namprd12.prod.outlook.com (2603:10b6:8:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 15:32:13 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::3c90:18ad:1198:48c3]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::3c90:18ad:1198:48c3%8]) with mapi id 15.20.4669.011; Mon, 8 Nov 2021
 15:32:13 +0000
Message-ID: <825e0cab-f1e0-4911-09aa-f340b9aa6fc2@amd.com>
Date: Mon, 8 Nov 2021 10:32:04 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
 <f94cd203-b0a6-bb41-8768-c64d68aac483@amd.com>
 <YYk9My2TFufdsgym@phenom.ffwll.local>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
In-Reply-To: <YYk9My2TFufdsgym@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::7) To DM4PR12MB5182.namprd12.prod.outlook.com
 (2603:10b6:5:395::24)
MIME-Version: 1.0
Received: from [172.31.16.161] (165.204.54.211) by
 PAZP264CA0148.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 15:32:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee1b0288-e46e-43dc-9c53-08d9a2ccef9c
X-MS-TrafficTypeDiagnostic: DM8PR12MB5462:
X-Microsoft-Antispam-PRVS: <DM8PR12MB54627FA1FAF74870B5C9C69BEC919@DM8PR12MB5462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAda8dIbtIeDtc/Pk3cTsNe+qN21pK0khurpy6H3SZYFxP0vgiyKtR0D71OaRNjxbzFHcZMhk862nw58b0e26l/HCmprptQZaTIZcKvo9UG1q41ZJAliK9bUf92RFp1Lh+jXfuzDmuQxhUMBzhf5wEcwwLJvIeJ8lkqwS1jYQRBa34IKH4XzARpglq9Vo47I8+OkG6jddj332gIKz+KfodWN6oYRPfetiZaqiIG7hDXMgbFC9bqtcJ+Waqf6NEYVun0xWyJzgwYqStUma5s3T+YQ/GabmpQ3+nc8oKDzoaKVb4zf1C/cj3weVK+9W5U/WvSBjhGUe9pzAMsZLc87PaIMQB9oQtKf5vkyc6XDLX0/7Fbhjw3Q0IZMEK5xVjVPz9aeb1ZmxNsQWZm0IN+18c1zf9rCciFctGCqMGCohNwEkPTxI8p/qRyKCHM9Ee8JkvgLy6F4UJuzF3lxmtbuMsCwYSIZcEfR6PBhWP/lSWBErrv8JgD+u4xMjFm4Y16rjPXTiHL/mCC6zNTrMlmfztjsQaI9XBqRt+gLx2G7qXbI8p7vn3qMSWWRfGvY+iqqgutRSP0z/Y4Pek1UC4AHmZ/XD7EEb9mFKjXIh1199LnJhmJtcPB7xWebGikjb6zIbgvQ0LtrN9mokH2Tz8oyJk0IUFtd9dbL2JQUSPaOvrwl8rYTOtA8NB4v7+eNJjOPtu60nsN9SE1IBcdcaCuW63SCiohekjofAcymboN9Hcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5182.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(6916009)(26005)(53546011)(956004)(6666004)(4326008)(2616005)(31696002)(30864003)(5660300002)(66574015)(508600001)(186003)(45080400002)(66946007)(8676002)(36756003)(966005)(54906003)(66556008)(6486002)(66476007)(31686004)(38100700002)(8936002)(316002)(16576012)(2906002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk0xTFVRTGRFSG1CSWVyUHhpRWV2OWs5Qkx4TytyTUVpZWhzUVRMbVcwY2Fq?=
 =?utf-8?B?Q3hWS1pKUURmdEF3OGpMYldxN1RiVjA3Sk9HWWUrRm9hTDNKenBBem5qSUJ2?=
 =?utf-8?B?enBGUGtaZWppbTI0NExaLzVZWmFDaFNVMWRNcXljM1JxZ2FuM1cva21MOTZQ?=
 =?utf-8?B?RzdxcE5XbS9CS0IydWtad0MzN0FGTnJST0I4NG05Tk42QWY1TDdXOEVab1NN?=
 =?utf-8?B?c0h0ME10Wkc4dVkwQ1VYT0pEOEdyZERhaDUyTE5yTk1EYTliWmxIeFFQblhJ?=
 =?utf-8?B?SzBwMlEzeGxTZ3FuQmdxTnlpMVNYRDAycHhkWmhOc3NoSHl2RzB2Zm5PVmJH?=
 =?utf-8?B?ckcxTXVjR05uM01sZk5SQTVUN3I2Y1J6aW5GV0FoUkp3azgwQWhtUXZEdFpl?=
 =?utf-8?B?aWxWSWI4YUMvam8zbVJId2xLWkFYamZXUnVZemtiQjRacXVEVjdkTDQzMEpB?=
 =?utf-8?B?TUxRMWFtUy9HTWU0Y1lqcktTa2xrMlFiMGVJYW9hRjNFTmU3dWozbVl4aS9s?=
 =?utf-8?B?a1JDMVhyTUZGSFp5bitkZlE5NlBFcUFJVGhhS2NoaE5nSFR4WFFZeTMzY1BH?=
 =?utf-8?B?R2wxNm1KTkdiNlFTQlFUWUY1a3dGOXE1dGZmeGZrWUJLcmZoLzBrZU80WkFJ?=
 =?utf-8?B?eUtEb0g5ZVJJZitMWS9aSHIvSHFCUk1BZlpTVEhwaEhoU0RtZXRvcWlxMld3?=
 =?utf-8?B?K3RIR0hwbzFSMXdoM3NwSHV1YWE4MmxSZkVuT0hvekw2Lyt3NXFpdnArQlhh?=
 =?utf-8?B?R0phNmlSU29rR3JJSHFoRkJUUHk2T09oSFFGaERSZUtJRmMrbGVwRy9wR1ky?=
 =?utf-8?B?TVltcGE1ZmJ0QkNjVjZ2V1o4K1pIOEp4em1GM3JnYld6ZTkza1J4MnR2bllt?=
 =?utf-8?B?dVZ5QUk0TFNKZThzU3dBZkliV09BUUI1WXhhMXhnQkRKYlZxUk9JMk5QL3RS?=
 =?utf-8?B?NG1pUXRxTFhoUnczYjZWTmpMWXczUUt0a1BuMmpEVnF3QlBYWDhwQjk4ZUEy?=
 =?utf-8?B?SWx3YTdjQkgwMEpMQkY4Sy9ianlzM2JOblp4WDNvL2l3cXFpZFhhYStUVG9M?=
 =?utf-8?B?VTgyQVhCSER3cVdBS25vbmJDcFN0SmwzZUtka2xEb0JFck9KT3gyNHBwOTJT?=
 =?utf-8?B?blJCckl6TU1ZbGcxVHY3SlIySUpmeU1uVEtFeDYxN2wyc2txVzgrTW1GcUpP?=
 =?utf-8?B?dlpGTEp5SDJnbkVWelFwQTcwcktQcklldnN2cU40RVNIQit0WHp4ZS9iSSth?=
 =?utf-8?B?S1IvL3VubHIzK085Y1h6ZVkwWUM5WFZYWmhmSDVKWFRvWm9jblpESlBmNWV0?=
 =?utf-8?B?U0Y2SE4yUkpEZHZ3WVJ6VUpBcVRRNXpRV2pyU0tSZ200QnRuUEhXT2IzOTcr?=
 =?utf-8?B?NjE3b25tSHlOU0RsYlZaQnBsL0VyRTFUNTZEU21SblVLcXlRRis0eWErVVg2?=
 =?utf-8?B?TmVvZWdaMjY4SHBzSVhMSXZVZHR0YUdyRmdZVkVlUGxlWVB5TzZyUVZySkRC?=
 =?utf-8?B?R3E2cTAreEVzSkptK1JHTllxRExxMGM2SG1Bc0w4M2tjZ2ZEWXFPL3IwelNN?=
 =?utf-8?B?RjI5VDlaYmNSOFppanVVSUlRZnExbURXZnJBcWFDcVgwYjZPeXBraGZiS2Ns?=
 =?utf-8?B?YVh5V0hUcEpLUTN1R0g2UktqTUR4V1FEQjRmazZNci92SlgxMnh6N1dEKzV2?=
 =?utf-8?B?M21oMkM1TlRaQTh1N254MVQ4SzU5TVo3VWZCSW5wR1F1bDRkU25GUjVFNzYz?=
 =?utf-8?B?cUNqWlk0Y0RsREg2c2JJZEpHU3NZRkk4UlJQV1Ira05UcU5VM3Q5bW4wZnYr?=
 =?utf-8?B?S2IwYWFMTkpmejZ0dVRsNE94cjlSUE9RamlpRllmMmFDaXJpUThLZDJoUjR3?=
 =?utf-8?B?cFZySUFVUUhmekdGUTlaV3pVbVQrWTdMK08xYmMzL1U0SGNkV1NONFJYT1Vw?=
 =?utf-8?B?TXIzczdwQ2I2eUh1SHBjS29ldzBhUDRWMEsvV1Q4L3ZxL20rRVRyM0haL1BW?=
 =?utf-8?B?dTJNTVhxcE1MNWVSSUR3OXZuZTJxYmxCYmlaY0wyTXpmWk9ZMWIydDFWYWky?=
 =?utf-8?B?ZFp1MmJycWxOeUxQTTliRlZ5bXNud1NNaWx3U0Jrd1FXZGJOTjZTNkZHbUdk?=
 =?utf-8?B?L3BRbVV3WFZna0xuSlQ2M0krQU9IMlVtcXVhNHV0bUs3Z1Rnb216cFczNUZi?=
 =?utf-8?Q?TJ26ANl+gazNxUy3omyvJAc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1b0288-e46e-43dc-9c53-08d9a2ccef9c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:32:12.9997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0Va+sSgO9kcxjqdnwWPcsgHYYFA4wdRSdtRLcEsHVDZNejXpJcJiGCIgW0f+hYcqHpS3L/uHR7VX817jsLyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5462
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-08 10:07 a.m., Daniel Vetter wrote:
> On Fri, Nov 05, 2021 at 04:47:29PM -0400, Kazlauskas, Nicholas wrote:
>> Hi Daniel,
>>
>> Just got bitten by this warning when trying to do some refactoring in amdgpu
>> for trying to get rid of the DRM private object we use for our DC state.
>>
>>  From a userspace perspective I understand that we want to avoid judder,
>> -EBUSY and other issues affecting the compositor from kernel having to drag
>> these CRTCs (or their planes) into the atomic state.
>>
>> For bandwidth validation we need to understand the state of all CRTCs and
>> planes in use. Existing driver code maintains this as part of a global state
>> object in a DRM private atomic state. We have stalls in atomic check (bad)
>> to avoid freeing this state or modifying it at the wrong times which avoid
>> hitting this warning but essentially cause the same judder issue.
>>
>> While most hardware has independent pipes, I think almost all hardware ends
>> up having the memory interface/bandwidth as a global shared resource that
>> software state can't really abstract around.
>>
>> There are cases where we know that there will be no (or minimal) impact to
>> the overall memory requirements for particular DRM updates. Our validation
>> already "over-allocates" for common display changes - page flips, some
>> format changes, cursor enable/disable. But for most cases outside of that we
>> do want to pull in _all_ the CRTCs and planes.
>>
>> On our HW you won't get a blankout unless you're actually modifying a stream
>> timing itself so I think the ALLOW_MODESET flag is overkill here.
>>
>> Rejecting the commit when the flag isn't set also ends up breaking userspace
>> in the process since it expects commits like pageflips between different
>> tiling modes to succeed with the legacy IOCTLs.
>>
>> Any ideas about this? I missed the IRC discussion regarding this before so
>> I'm not sure if we have any alternatives that were dropped in favor of this.
> 
> We have, I while ago I had a lengthy discussion with I think Maxime about
> how this is done properly. I think Maxime volunteered to type up some docs
> even. tldr;
> 
> - Have some global state for this stuff (using the private state helper
>    stuff ideally, handrolling very much not adviced, might even make sense
>    to put some of your dc state/structs in there)

This is what we do today, but DRM private objects have no 
synchronization like CRTCs do. Any time a commit modifies our bandwidth 
calculations we need to propagate those changes back up to the global state.

Read only access to the global state can be concurrent, but as soon as 
anything needs to write and update it then we need to force ordering.

The bug we had before was that competing commits could complete in a 
different order than they would be programmed to HW if they were 
non-blocking.

> 
> - Both the crtc/plane and the global state hold copies of your limits. The
>    global state in addition also holds the current settings for your
>    derived values (like clocks or allocations or whatever you have).
There are per pipe limits but there are also global limits on the whole 
system.

For example, you may pass validation for a configuration applied to a 
single CRTC and plane alone. But if you were to run 4 CRTCs using that 
same valid configuration it would fail.

The resource in question here isn't a pipe, an encoder, or something of 
that nature - it's just the memory bandwidth available on the system.

On an APU you wouldn't have enough memory bandwidth to drive multiple 
CRTCs at "extreme" resolutions or refresh rates.

It also doesn't seem right to block the user from running any display at 
these modes just because you can't enable 4 identical displays at the 
same time.

> 
> - Rules are that only grabbing the global state is enough to read all your
>    crtc/plane requirements (since you have a read-only copy of that in your
>    global state). Only for changing them do you also have to have the
>    corresponding crtc/plane state. Furthermore you _only_ grab the global
>    objects if the commit reasonably changes your local requirements (i.e.
>    more planes or whatever).
> 
> - You might need to have a cascade here (plane -> crtc and crct -> global
>    state), and/or maybe multiple different global states. Don't try to put
>    everything into one, it's better to have a separate private state
>    handling for each separate thing, at least generally.
> 
> - No more "we have to take all objects all the time, always", so no more
>    over-locking and over-sync.
> 
> - Integrating this into DC is probably going to be "fun". Could be that
>    you first need to convert a pile of the dc_ structs into driver private
>    state stuff, similar in spirit to the refactor we've done for plane/crtc
>    state before DC was landed.

...so while we can do CRTC and plane validation it doesn't seem like 
there's a good place for that global system level validation that we 
need to happen.

> 
> Pls check with Maxime that this is documented somewhere as implementation
> pattern (it's really common, and your aproach of "grab all crtc/plane" is
> the really common wrong approach). And ofc happy to discuss how to best
> solve this for DC, but maybe irc is better for that.
> 
> Cheers, Daniel

I can try and hop on IRC sometime to chat about this with you and the 
others.

Thanks for the response!

Regards,
Nicholas Kazlauskas

> 
>>
>> Regards,
>> Nicholas Kazlauskas
>>
>> On 2020-09-25 4:46 a.m., Daniel Vetter wrote:
>>> When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
>>> pull in arbitrary other resources, including CRTCs (e.g. when
>>> reconfiguring global resources).
>>>
>>> But in nonblocking mode userspace has then no idea this happened,
>>> which can lead to spurious EBUSY calls, both:
>>> - when that other CRTC is currently busy doing a page_flip the
>>>     ALLOW_MODESET commit can fail with an EBUSY
>>> - on the other CRTC a normal atomic flip can fail with EBUSY because
>>>     of the additional commit inserted by the kernel without userspace's
>>>     knowledge
>>>
>>> For blocking commits this isn't a problem, because everyone else will
>>> just block until all the CRTC are reconfigured. Only thing userspace
>>> can notice is the dropped frames without any reason for why frames got
>>> dropped.
>>>
>>> Consensus is that we need new uapi to handle this properly, but no one
>>> has any idea what exactly the new uapi should look like. Since this
>>> has been shipping for years already compositors need to deal no matter
>>> what, so as a first step just try to enforce this across drivers
>>> better with some checks.
>>>
>>> v2: Add comments and a WARN_ON to enforce this only when allowed - we
>>> don't want to silently convert page flips into blocking plane updates
>>> just because the driver is buggy.
>>>
>>> v3: Fix inverted WARN_ON (Pekka).
>>>
>>> v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
>>> rules for drivers.
>>>
>>> v5: Make the WARNING more informative (Daniel)
>>>
>>> v6: Add unconditional debug output for compositor hackers to figure
>>> out what's going on when they get an EBUSY (Daniel)
>>>
>>> v7: Fix up old/new_crtc_state confusion for real (Pekka/Ville)
>>>
>>> References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2018-July%2F182281.html&amp;data=04%7C01%7Cnicholas.kazlauskas%40amd.com%7C1b07173e73194ee6563a08d9a2c97eef%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719808574816469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zmfJd7M5ZnI5if%2FHM%2FYnBQdoLsWtfjwQW%2BaX0R6Hrj0%3D&amp;reserved=0
>>> Bugzilla: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fwayland%2Fweston%2F-%2Fissues%2F24%23note_9568&amp;data=04%7C01%7Cnicholas.kazlauskas%40amd.com%7C1b07173e73194ee6563a08d9a2c97eef%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719808574816469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ynHonfkaMn%2BC%2BsykK1prK%2BAXi9eg3CbIO1vbG8eNjT0%3D&amp;reserved=0
>>> Cc: Daniel Stone <daniel@fooishbar.org>
>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
>>> Cc: Simon Ser <contact@emersion.fr>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
>>>    1 file changed, 29 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>>> index 58527f151984..aac9122f1da2 100644
>>> --- a/drivers/gpu/drm/drm_atomic.c
>>> +++ b/drivers/gpu/drm/drm_atomic.c
>>> @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
>>>     * needed. It will also grab the relevant CRTC lock to make sure that the state
>>>     * is consistent.
>>>     *
>>> + * WARNING: Drivers may only add new CRTC states to a @state if
>>> + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal commit
>>> + * not created by userspace through an IOCTL call.
>>> + *
>>>     * Returns:
>>>     *
>>>     * Either the allocated state or the error code encoded into the pointer. When
>>> @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>>    	struct drm_crtc_state *new_crtc_state;
>>>    	struct drm_connector *conn;
>>>    	struct drm_connector_state *conn_state;
>>> +	unsigned requested_crtc = 0;
>>> +	unsigned affected_crtc = 0;
>>>    	int i, ret = 0;
>>>    	DRM_DEBUG_ATOMIC("checking %p\n", state);
>>> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>>> +		requested_crtc |= drm_crtc_mask(crtc);
>>> +
>>>    	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>>>    		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
>>>    		if (ret) {
>>> @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>>>    		}
>>>    	}
>>> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>>> +		affected_crtc |= drm_crtc_mask(crtc);
>>> +
>>> +	/*
>>> +	 * For commits that allow modesets drivers can add other CRTCs to the
>>> +	 * atomic commit, e.g. when they need to reallocate global resources.
>>> +	 * This can cause spurious EBUSY, which robs compositors of a very
>>> +	 * effective sanity check for their drawing loop. Therefor only allow
>>> +	 * drivers to add unrelated CRTC states for modeset commits.
>>> +	 *
>>> +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
>>> +	 * so compositors know what's going on.
>>> +	 */
>>> +	if (affected_crtc != requested_crtc) {
>>> +		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
>>> +				 requested_crtc, affected_crtc);
>>> +		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
>>> +		     requested_crtc, affected_crtc);
>>> +	}
>>> +
>>>    	return 0;
>>>    }
>>>    EXPORT_SYMBOL(drm_atomic_check_only);
>>>
>>
> 

