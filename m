Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975DE6B0397
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594A710E661;
	Wed,  8 Mar 2023 10:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DD910E661
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 10:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxILmI+8/G+VyBEeJC5YYo//c8ziAHU40/RhZVr63pUGQy0YH5pA5H7T7vg2bSnTb66+lcWEDIhNc5paVszi63RGbS0AT9uNcMKqYZjdvJ2LuaZwNugzLxMEDR6B2JXuHqov3uV/1PlvZc+SNak9wsxAzhwRgivERtBYVEyWGnpFL4AC8hafSl/hXwQ3/5ZxqMcXlL7MadDPyVxsVYfYi8b0W5/oI7G9vNekwPdrpgypC79N+TQJnpMUGnyTOyfiS3iGvhNZCSkFsb7L3Nwt0OyuFvzEKiNbZKuOUrjH7rQpv8AjrimBHom+zdze2UQzWRNhqje5uCBiGN5Xqj2QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3SWSuItj0/YT9siycK/+X3qSxIvFMt5r3pqvM07iFo=;
 b=MX86YE0qfyWwFyvw1y/SwdmQAVhMkUhpm5FoA2CFU1caZiz+OKdS2GHTVUO+AqLxYC2aFtt5R7uumgBRh36RXEEWH88cLAFbLMDwFZtsk5hjjbXu8Ip8hg7UNszxIrzGL1EyCu/lLbGOW3JrEGzttOBe2YybPock62aGi5IXQSyugbV7pBFUSD5L58qCz7BGil1G5Z2JW5oib06lT0fZ4YmdJLXgv1mbTKS10y/fUiFLmFeu3Wykh4Vco1wakXRGhX534UO3YiiirE/QU0tQTFNrUOUF9XfbmhtM/n2RgxvF/j1oi4rRlzSzvqjB92I5Jeo08rpbqYjzxD+sLY+Q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3SWSuItj0/YT9siycK/+X3qSxIvFMt5r3pqvM07iFo=;
 b=QkVl4DtBGra658QWfFxaDKLFxNCAUFuzvs59XIh+LXFjX4TjhauysZNRJte3poBPemuqroIY+VGqh8z7q0u01dHEDo+I6R0R+jncPE9Uwck2C9VHiAHZzRJIgB7fcfxQKXgxSH4iCdJMkL3iiN4WLMpBuA/XXaozqyzVkHhCZbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 10:01:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 10:01:01 +0000
Message-ID: <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
Date: Wed, 8 Mar 2023 11:00:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bcb2c75-30c6-49c8-fdbf-08db1fbc05cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: enovnqP8+30LnLQx01JmIy/22NFO/n/mDOqvoVwSo1eKvutksVIv1kBNmx6ACCU+JNEgIE2Fjc60REVLV9bmB2KFukBb1evzIF4F6oMCwn4vGgCKFCqfL74xeRHTSerkVXYPnPcfTdlrurDuwOQN1D7RGKEJ9IMcPSeOBVao16+68A64NgIdiPYo69KCkyztZduIbETbt/pvxpdopVdlmuAgD+Ky2sGKOg9sUzUjAhk74flNpvruTkSfwCyh0E8O2YGQPztxOjZfZVdEsPaYYk4AJSheztyWY29AVsyr5R5L74IIrVgs+BiEkksBfo0TgTrbw1ocvX2kkrEkv6y3ceqoog/RFosiRPJuQt1DA5vXWeTkDzCyIbtSyALGhGDbR44X1WMYIuDXu3tqtkqYYOv3aeUzzCO7es/NOGiXrU4n0JMDqOH41QWKneME646tMtfxZqtDLtQ0uit0Mmr2XNohrolqJedXSA3/lpndcFF0HPbc5uakobqGBNDNm/GoLyS0Hemr5uXm+Eui3bbyGF7Z7ZWgQYaFeBIzokBg0V4asjW6dycAm0xX+yZDJxpGjspUVS2XfaFjtOWcHVx2O/kIly3ROh5DdwUwz5GjYG++sU5nKLV2qSNB+Qv8kbbOEFoqpwQdxcWZnUfPCX0Ucd5nOoM+6w+617IwDkG+pixjr4Esp/P696OxZP4XKOVorlknWJbMhLn+xq4KRqIs4mpn+zwDmppIv7vQ2wN+/06Ry+pRx6bzRpKZUn8ElPEI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199018)(6666004)(110136005)(31696002)(54906003)(66574015)(41300700001)(8676002)(86362001)(83380400001)(4326008)(36756003)(316002)(8936002)(66946007)(966005)(66476007)(478600001)(66556008)(7416002)(6486002)(5660300002)(186003)(921005)(2906002)(38100700002)(2616005)(31686004)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnpiSXJJZVl2eEdxQUJQdDJFaTFwMTlOaHJheXRpN05aZ2syNnFKeUtPM2ZH?=
 =?utf-8?B?QktPQVdEZVFJeEs1a0FyVWdoY01vU000eDc1NUZTeFdSNVZXSk02MXBGSHdN?=
 =?utf-8?B?bEhwL21vaHhGanphZkFac012dWtnSXNDcXhXdDRiZzVXY1UzMDBTRjR5aE4v?=
 =?utf-8?B?WlRqYndkQUpuSW83cWV6RzdSaEJHU1NPL0xhbUtselZnVmNTTlpWYThuNzBp?=
 =?utf-8?B?U2x4Nkl3R0NFK2VFYVZpUGo4aVJYODN6UUtGNVBtYUVJZ00xak5qWktCQ3R6?=
 =?utf-8?B?cVhaUmJjdzhQa0tJdmtOVmNVZUl2MmlqVWtKa2laVHgxdlR0cnd4TkxlRG1T?=
 =?utf-8?B?SG5Md0tiaGJST3F5MGFwdGtQcXRJL2hmSXBjMS80Mm5XNitGOWFVcDd5TVpG?=
 =?utf-8?B?am8wSGhJQThoV0ZCYi96Ni9iWldVbHRBVktiKzZCOW02QmJPSGFFWWRnNDJW?=
 =?utf-8?B?c1hhakw5NXhIUWlrN2xVSGRKY2Uxd2pSOW9HRGFQd3FFbCs1K3ArdlhUaEw4?=
 =?utf-8?B?dFYvdjltWnZjc3RDU0t1MkloYm1jRW9sWmoyeHMzYVhtaTFxL1laY05FNDZh?=
 =?utf-8?B?emtxNjcxZC9HcTdhT0NXeHg5T0YvYmovWGhFR3E5bUcvNDFsR0dUL1lTUXZ3?=
 =?utf-8?B?SlZpN0tRVkNwa0tBb0dQSEdLYmcrZDRRVnpnVFZqdGlnUDBwZndYMHF1TkhC?=
 =?utf-8?B?ajZNVXp4UDNueTc1STlBVUJNQzg4ZENDSUg0Zkw0eUZINElJNi9DMXpRSVlJ?=
 =?utf-8?B?eTRnSHZ2K0pmUlhCRnAvRFRnNjZvTXpTOUxSSTZ1Z3oxWEJTYmVxQ081UTlE?=
 =?utf-8?B?ZWRyNDZlNjNTc1JjTVNyTUxrUTZVemZTRXFiSUJXZWtsRVpqRi9UbExtVEw0?=
 =?utf-8?B?R0FPblloTi9vTTdEbVlCYU51dGRTZHgwdmkzODBuUXdSaXBsSWtBcXdTMlVX?=
 =?utf-8?B?MzgrbjA5ZGVxOTZjTkp4eTk1ZWEzWEZ3TnhQRjg5eG5MYmRmcEJEMlRhOTZO?=
 =?utf-8?B?ejUvTUF4NFRnZUJsWlVCcU9EWlFDU0hwNzd4YnFTbnJyRHdLQ3pJNDZYZ2du?=
 =?utf-8?B?Sy9ERkVKS3o0Qk1qcW5OLzYxN0Q1MFZDYWJUeUNFb2p6NkpvV0hFZEd1ZEJV?=
 =?utf-8?B?NDhiM3V3azRtU0xJU2FQMGJ6bm1TemJwa00xR3hONjV2MEMxL09NMW8zcE8v?=
 =?utf-8?B?U0RIa3ptSXJvSGZlTERLTGphK2UrSWJaNDZsVGtjbnM3K3I4NlhvcDY1WUNk?=
 =?utf-8?B?VTF0bTlwRU9sTE5tL0l4TXpaU25sbjQ3V0ZyTjRZNUJINE1ZVVNDeDZVcUty?=
 =?utf-8?B?UStPLy9WZEhEbG9DVjJpcDdtYnYwbXBpSENVNEFQaUxGcUw2UTFrWDBlODhL?=
 =?utf-8?B?Q0cvNE5oK1lxU3BSK2hVaWg2cFFYa2xScW9OdHFGMm9OVG1KOGhWeC9WMUhr?=
 =?utf-8?B?Y0xCbU5zalhuVzlyZm5XUEVsdVZmTmRpcXEyQmlPR0x3LzhJZE1WRzIrb3lX?=
 =?utf-8?B?YXFWdWcwdzdPUThQekc2Y2NRbmVobFVUenZ5RDJCaWFucHkzVTRvQjM1OVpB?=
 =?utf-8?B?QlAycDFZUnlRMHNTeFN1WG9PZWpvUS9MUlJteTVqbFFwOFZGOHQ4cHNlTGtU?=
 =?utf-8?B?anZGdmdRYlpkcnBZc09zQ3JCTVFuMmNYMlljekR0RlBjTmZDblJJbGltcTNC?=
 =?utf-8?B?VE80Lyt6ZVFySXRGMmdIRjJ3WnRGOUY4VG9hcWJGT2pZT1I4TElkSUNnMnJx?=
 =?utf-8?B?M3ZEUGlYMVRVbnBtNmE3Y1VkZnd2cWF4Y1g5bXJTUTlscFU0Z094MjFIUHNa?=
 =?utf-8?B?dlNoVlhGdXdScmloYkY0bzdDajVNNXdBanI0eHhlSWxDRlZFWlcxOTNwaUQ0?=
 =?utf-8?B?dHRxUE0wUWtzaWJrM1VITUJ1ZFBBRUloLzZHRHRlUUIxRzFCam56U2UyR01Z?=
 =?utf-8?B?b2xWSExZZEFWNm8zdDQ3NUYyaUdmQ2NwTklqNHhORTkyQVlUa2FGaFFpVEYv?=
 =?utf-8?B?blNGWEJIdCtZaTJpM1A4UE5jV04yNVhWU3BsTFNEcWZGR0lPb0dxRzNnYWtM?=
 =?utf-8?B?dGx2RWYxdjR5OTZEN0V5dERFK2liVWtHQ2E1RzBoN1ExMk50dHRROC9xdWdq?=
 =?utf-8?B?bW9QTEFvTC9iNlZ1b1RuZ1pPWWttTjIwMHNZT0N6MHdyOXNzWTJrM1JhR2tx?=
 =?utf-8?Q?vO8VX5TJ7Oebu6EOdcJYUXFUEKbZeJ9KQoJ1wwI2wus3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcb2c75-30c6-49c8-fdbf-08db1fbc05cb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 10:01:01.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ye4Y4F+gWQKYc2TSb/0izUB2OWVW5cpoqs32ymWr+xxOKbNRQ5qFsOOUIShMtpW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 10:41 schrieb Asahi Lina:
> On 08/03/2023 17.46, Christian König wrote:
>> Am 07.03.23 um 15:25 schrieb Asahi Lina:
>>> Some hardware may require more complex resource utilization accounting
>>> than the simple job count supported by drm_sched internally. Add a
>>> can_run_job callback to allow drivers to implement more logic before
>>> deciding whether to run a GPU job.
>> Well complete NAK.
>>
>> This is clearly going against the idea of having jobs only depend on
>> fences and nothing else which is mandatory for correct memory management.
>>
>> If the hw is busy with something you need to return the fence for this
>> from the prepare_job callback so that the scheduler can be notified when
>> the hw is available again.
> I think you misunderstood the intent here... This isn't about job
> dependencies, it's about in-flight resource limits.
>
> drm_sched already has a hw_submission_limit that specifies the number of
> submissions that can be in flight, but that doesn't work for us because
> each job from drm_sched's point of view consists of multiple commands
> split among 3 firmware queues. The firmware can only support up to 128
> work commands in flight per queue (barriers don't count), otherwise it
> overflows a fixed-size buffer.
>
> So we need more complex accounting of how many underlying commands are
> in flight per queue to determine whether it is safe to run a new job,
> and that is what this callback accomplishes. This has to happen even
> when individual jobs have no buffer/resource dependencies between them
> (which is what the fences would express).

Yeah, I already assumed that you have something like this.

And to make it clear this is unfortunately a complete NAK to this 
approach! You can't do this!

The background is that core memory management requires that signaling a 
fence only depends on signaling other fences and hardware progress and 
nothing else. Otherwise you immediately run into problems because of 
circle dependencies or what we call infinite fences.

Jason Ekstrand gave a create presentation on that problem a few years 
ago on LPC. I strongly suggest you google that one up.

> You can see the driver implementation of that callback in
> drivers/gpu/drm/asahi/queue/mod.rs (QueueJob::can_run()), which then
> calls into drivers/gpu/drm/asahi/workqueue.rs (Job::can_submit()) that
> does the actual available slot count checks.
>
> The can_run_job logic is written to mirror the hw_submission_limit logic
> (just a bit later in the sched main loop since we need to actually pick
> a job to do the check), and just like for that case, completion of any
> job in the same scheduler will cause another run of the main loop and
> another check (which is exactly what we want here).

Yeah and that hw_submission_limit is based on a fence signaling again.

When you have some firmware limitation that a job needs resources which 
are currently in use by other submissions then those other submissions 
have fences as well and you can return those in the prepare_job callback.

If those other submissions don't have fences, then you have a major 
design problem inside your driver and we need to get back to square one 
and talk about that dependency handling.

> This case (potentially scheduling more than the FW job limit) is rare
> but handling it is necessary, since otherwise the entire job
> completion/tracking logic gets screwed up on the firmware end and queues
> end up stuck (I've managed to trigger this before).

Actually that's a pretty normal use case. I've have rejected similar 
requirements like this before as well.

For an example how this can work see amdgpu_job_prepare_job(): 
https://elixir.bootlin.com/linux/v6.3-rc1/source/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c#L251

The gang submit gives and example of a global fence lock and the VMIDs 
are an example of a global shared firmware resource.

Regards,
Christian.

>
> ~~ Lina

