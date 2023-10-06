Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57A7BB209
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D2410E206;
	Fri,  6 Oct 2023 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9530C10E206
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBeUJvxNsq51mEXB3rKbqSe8Dq8gzxRzlHCVr+GBctlT9JV5jG92UxfMnXFrVaMm33YgC/U1jtmj48Q4Ly4YhIDm1f/+O+m+/OOoG1xwgLrI8j/jA4UfYUiOtxlu2q/5Sk3IcBnlZa+RltCISf4Sk1YFEmOvB3ud/65oil5pxG30Tb8dQkuB7b7VBZqsn421iXbLd4L2tXc1ezrffKCDMwQlB0Bf0Gtyc5EgiVibjfNB+QBd4/aTfmyKrQ2fe9mu/8LaYzXu+z++dv2xh3Rp9mNrm2YLO8mPM0xMR+F7eunMdMSuZTAsUkBcclMMBBztTBkFof30oyGMapuqPIaXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOVgUUnKDbNtaPdO6biJE5TCJ+T5ebayzCZD330ko0Q=;
 b=BkY3v7FLY1vnYGBOYD9Pb/2BcZ7QnI6ISqEkC84RcSVRDkBUthegoaFRXCKJD2Q53qaNOv9xu/DUnkV2k/Pyojc5FbL8hmObJh2AVejeOBx8Kxpe4H7+rejHA0/Ed1RLgs4AMrx0fHlhuQP2oST72VyfMazkW3w2TmTF8nutij8LF0f08wNCJ02/VncaWOqklDa5HZuu5aGXJGfELV1oYmcqSjftdNN+UxxfFowfdycxxEaEmJ8kiBMdfEfvYBhjIc0XgRYHjuwnRGTQAlGzs+AXD8pJJ715stkWTY3xreQ59F1BLAKq8nGfZAXCzNSJcXzVdlhBOtjQi9iKMNfHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOVgUUnKDbNtaPdO6biJE5TCJ+T5ebayzCZD330ko0Q=;
 b=46idRTpj+OUlEZuH7pNKbWFwGGqHAqpYcJbfmrS9p12VRAkesU+16yL+vNmryt8snlZRQ4Khn+jXs+X7sC9nGN4KYaQCrcoXgN8QWuvysjHH07CBv4aPxu9bsxiy3pXGwgwLPQVeeKfNm1iaX3K5WDst4xhwdgi+uQETQVnoi+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 07:12:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 07:12:22 +0000
Message-ID: <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
Date: Fri, 6 Oct 2023 09:12:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Ray Strode <halfline@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 451b4c41-91cc-425e-893d-08dbc63b9576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ue4wwNfCEVx87BEgBr1b4H2PTobZwiIvRMj69gHV6FbK1x4YqZToWq5AHglFgOYfl5E3BktTPLgzZxE5x9PrIF0U+x+rVkKzuiyh7EmKxj7ZYaqCZWOJiC65S/Ae9I2zIarA40HruZ76pdRRC3jZlXdxwQ1K0/tstU3TzoQ2+NNhoqmYpq+CfPVep4T/kRW9uyiF8rkNF3uHb8hpmMlhYEmqG9H+XFNdthGTrnR23fcBq7uYVK3RF61ghQZcimUj32ayzXFxgS7QRbbAFbzxIfPcAf1Nbgv2OM2/2P4AMW1O/6XDu+N4l9GyW6puA658d4O2DzEi2T/GMmDIkop6rM2FIDN6P2U+kDLCb/8Lx/GoyADc3hpubp1quOBpw069cYKY+FfYlO0QJ1mZWU8JbhmYFawDxUNN43ZuArwcv5ywB0QGAjCz2XPNNfAsiPQZAcbO4NWqZIKoX6ik1cCTaVYCaRHUgMGXmYK+jXZC+2rf8nbeV3Fuw9+khrdM8DSlv78o0q6PiyFW0M0YaabK+AtlmbnJB8bUq7MmmXmuEYOb63NzWTTDkITaCz4QQMb2tCfv2fG8nPgDs2rh/hykWiv2mgOIylCMoxQlgrEg421LLFXgNJ2JeknMUI560fh9lv/kyTG7DE5G6nAt8k7NWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(451199024)(186009)(1800799009)(31686004)(66574015)(83380400001)(4326008)(8676002)(38100700002)(5660300002)(86362001)(31696002)(36756003)(66476007)(66556008)(508600001)(66946007)(8936002)(2906002)(6486002)(53546011)(6506007)(6512007)(26005)(110136005)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2R4TUlvWStESEkxdWhlbkFYMGxsT0Nvc0F4UjN3OE1ZQ0w0TVVORU04MFd3?=
 =?utf-8?B?eWhKeERiZERxYWRTN1BPTnFsZVErK2E2MHh3VmU1Z1JpZzFvV2l6NFd6Q1M2?=
 =?utf-8?B?TTdrK2x5TVdVU1FZdVVtUVVYVXBmS0NZZlpzS2FuVnRzdjBXYTFQNnBZanQz?=
 =?utf-8?B?QjFaQnUyVnlGN216ektqcFdjRytVTkpSNElCTmZ0cW0ydzl5NGZmam5OQnJz?=
 =?utf-8?B?T2Fzbkl6Vk5lU2o5UXFUVUJoU1FSM1creFA1UVU1WGMzNTREVVBBL2FDOEFk?=
 =?utf-8?B?RDVIamM2RXMydnJiU21GS2RRU0dPaXE3UmRUZWdwa2VEdFJ2TkwrU3VoVHpI?=
 =?utf-8?B?N0RWK1l0R2JHZGR6LzR2bzcxd3NaQW8zMG5lc3huMldjcXZEbHo1VkVqaHUz?=
 =?utf-8?B?dXBFNU5SREt5YjlOeElRQkZvWkJLc3BBaE96cVVqc2dRcy90TVNLTHdIZkdl?=
 =?utf-8?B?anlQV3U4dlVLVG43WWlMTHptTnoxMGoxTEdPODhqT3BoRFJpRUFPV2c5WTZR?=
 =?utf-8?B?TStPL1NnWXFHS1p0d083eGpTU0tPZndqK2tNS3pZcENRWllrMU5VRkx6dHU5?=
 =?utf-8?B?dU9NejdXZS9lRVVsRDU3dXA5bEhCQXhSemViZ0lyVTM5YzhWZkN3ZzkxeTZI?=
 =?utf-8?B?MnluQjhid1Qzb1ZSTWsyMEdMZk1iL21MRHlTK2ZTTHZ4STB5V2k3RVNYWFJj?=
 =?utf-8?B?UWEwRk9odDZqN1c0NWNjd0JSVDZ6TGVjYTdpSVUwUEhLNUtVSlI2eGpuckpQ?=
 =?utf-8?B?NmVScFh5RXN4OUo3VXlucUVvM3ZBMGE5eWxXWjRHLzVveE1rZDhidTlBL0ZL?=
 =?utf-8?B?dzNzWkRNSjFrUWNobFFtV0J1eUJseDh6aGVkbjR4RUdLbnREbThqbmNreWQz?=
 =?utf-8?B?SzQ0TktVd0Rxc2t4Vk9wVHFtcURIVEtRbnE0dmZBMjk0cDlORmpLLys4TGFR?=
 =?utf-8?B?QkJER1RjaHgrekR5SzFLdXpDOUJYVXJrTVZXNVZQTkVtMVlnZGQ5MmRmRXZ4?=
 =?utf-8?B?N0RhUGYzQXpQd3hlak1FTTZueVVINTNnZHlqTnpwUUdKdjJSN3dVbzBjcGEy?=
 =?utf-8?B?dDlBRW02d0JmaVk1WThRbDlhbjY4Q0ZkaVhOczVKbnVqOUF1emwxZDVKbzBJ?=
 =?utf-8?B?Ly8rajVEOGJaQzlmeEVjbFdkRjY3T3JGU1RMdTBJZ051REtUZlAxbk1qVVlt?=
 =?utf-8?B?OFlObEszTzlPSUI5ODNMeHB0dG1JY29idHF5dFJ5OStHVmNueVE2SDNWeWJW?=
 =?utf-8?B?U1FpSXRpN3A4dnd5dVhuRHNGVG9RSUF0dStiRHJoL3RSb1p6M21QdVMrY2pV?=
 =?utf-8?B?c1hKWE1lZjE2eFFJek9JR0h5MFVoa2Ryc2M5ZGJFR01Qcml3dDEvR1dlZ0dG?=
 =?utf-8?B?TUtKRG1nOWlnVUxNdWlFZ0VWYlpFbTlGRkMyQnI2ZEF0THg4dDU5UGtkL042?=
 =?utf-8?B?WlI4RG9PYjhxTi9VUWJ1UGcrTkYvRG1tWVNUNzN6c05ENHlYeHo4VEJYYllj?=
 =?utf-8?B?RXpmY3kyOEZXSzE4SlFKQVRaQnFScHgrbFcwWHdvelhNR0FJdGRvelNMci9G?=
 =?utf-8?B?UnV5U3BzTC9CNGRBNUd1NjVqK09jL1p3cXpYRVBOeTdxd0JJZnVqb3hMcVR2?=
 =?utf-8?B?bUUzV2dmWG9LMzFEeGNuN2UrQ25Ea3pRbE5WZTZaQVJwN20rTmFNUG05WWV6?=
 =?utf-8?B?alRmSStPeG9IUzZUTy9DTlBLVXJ5a0dueTUxSWVLNWZMMi9WUDVHc21xeUNL?=
 =?utf-8?B?MDBwVCtkRS9aUW8xNit6MWdwMXo0T0tzdTV5ZUFLYVhna2dKTVo5VVA1TUl1?=
 =?utf-8?B?YjJqbytBODJHMm1kY1RpZG1jUVY1RzNjUXF5VUlPaC81VXJZK055MDMzK2NQ?=
 =?utf-8?B?YllpRGw2QkJQZ0owd1JnSUx3d3ZnbmpXTWcxWWY5NVpmMDh4aWRBZjZJVlRa?=
 =?utf-8?B?ajRhaS9QdFdES20vRTFXbjUzcVFMU2RIcUtEK0tnM3hpTDZtSGNVd2ZNdjg1?=
 =?utf-8?B?NUcxcyt4WEp4U0xva3RrTmd2YmpGdW5IWVNmc3lKR2hwVlNOdFZaQktmK2Fq?=
 =?utf-8?B?K3RGVWhsUmowMEpBYlJzbDVxRmVlVkgzQkErVjhCd2xQdzFteWNIa1FxaXRF?=
 =?utf-8?Q?/Qp4WcBSI0aYG3gr3Xf0lUvY7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451b4c41-91cc-425e-893d-08dbc63b9576
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:12:21.8031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XokD3jY5fEXK2SVw4Ae2HbV4DtDDXxMp1tKmNJRa+s+JPpvFIJ84oe3rKxUWgigW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.10.23 um 23:04 schrieb Ray Strode:
> Hi,
>
> On Thu, Oct 5, 2023 at 5:57 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> So imo the trouble with this is that we suddenly start to make
>> realtime/cpu usage guarantees in the atomic ioctl. That's a _huge_ uapi
>> change, because even limited to the case of !ALLOW_MODESET we do best
>> effort guarantees at best.
> So you're saying there's a best effort to not use up process CPU time,
> but Christian was trying to argue nearly the opposite, that any needed
> CPU time for the operation should get accounted toward the process.

Well as far as I can see what Daniel and I say here perfectly matches.

When the operation busy waits then that *should* get accounted to the 
CPU time of the current process. When the operation sleeps and waits for 
some interrupt for example it should not get accounted.

What you suggest is to put the parts of the operation which busy wait 
into a background task and then sleep for that task to complete. This is 
not a solution to the problem, but just hides it.

Stuff like that is not a valid justification for the change. Ville 
changes on the other hand tried to prevent lock contention which is a 
valid goal here.

Regards,
Christian.

>
> What you're saying makes more sense to me and it tracks with what I'm
> getting skimming over the code. I see it potentially sleeps during
> blocking drmModeAtomicCommit() calls in several places:
>
> - copy_from_user when copying properties
> - fence and vblank event allocation
> - waiting on modeset locks
> - And even plane changes:
>
> for_each_new_plane_in_state(state, plane, new_plane_state, i) {•
> ...
> →       /*•
> →        * If waiting for fences pre-swap (ie: nonblock), userspace can•
> →        * still interrupt the operation. Instead of blocking until the•
> →        * timer expires, make the wait interruptible.•
> →        */•
> →       ret = dma_fence_wait(new_plane_state->fence, pre_swap);•
> ...
> }•
>
> (Ignore the typo where it says "nonblock" instead of "!nonblock",
> the point is while waiting on plane state changes it sleeps.)
>
> So, in general, the ioctl sleeps when it needs to. It's not trying
> to be some non-premptible RT task with a dedicated cpu budget that it
> strictly adheres to. That makes sense to me.
>
>> And that state recomputation has to happen synchronously, because
>> it always influences the ioctl errno return value.
> Not sure I'm following. The task doesn't have to stay in RUNNING the
> entire time the ioctl is getting carried out. It can get preempted,
> and rescheduled later, all before returning from the ioctl and
> delivering the errno back to userspace. What am I missing?
>
> The problem isn't that the ioctl blocks, the problem is that when it
> blocks it shouldn't be leaving the task state in RUNNING.
>
>> My take is that you're papering over a performance problem here of the
>> "the driver is too slow/wastes too much cpu time". We should fix the
>> driver, if that's possible.
> I think everyone agrees the amdgpu DC code doing several 100ms busy
> loops in a row with no break in between is buggy behavior, and getting
> that fixed is important.
>
> Also, there's no dispute that the impetus for my proposed change was
> that misbehavior in the driver code.
>
> Neither of those facts mean we shouldn't improve
> drm_atomic_helper_commit too. Making the change is a good idea. It was
> even independently proposed a year ago, for reasons unrelated to the
> current situation. It makes the nonblock and the
> !nonblock code paths behave closer to the same. it makes the userspace
> experience better in the face of driver bugs. You said best effort
> earlier, this change helps provide a best effort.
>
> Realistically, if it was done this way from the start, no one would be
> batting an eye, right? It just improves things all around. I think
> maybe you're worried about a slippery slope?
>
>> We can also try to change the atomic uapi to give some hard real-time
>> guarantees so that running compositors as SCHED_RT is possible, but that
>> - means a very serious stream of bugs to fix all over
>> - therefore needs some very wide buy-in from drivers that they're willing
>>    to make this guarantee
>> - probably needs some really carefully carved out limitations, because
>>    there's imo flat-out no way we'll make all atomic ioctl hard time limit
>>    bound
> We don't need a guarantee that reprogramming ast BMC framebuffer
> offsets or displayport link training (or whatever) takes less than
> 200ms.  If a driver has to sit and wait 32ms for vblank before
> twiddling things in hardware to keep crud from showing up on screen or
> something, that's fine.  But in none of these cases should the
> userspace process be kept in RUNNING while it does it!
>
> I take your point that there are a lot of drivers that may be doing
> slow things, but surely they should let the process nap while they do
> their work?
>
>> Also, as König has pointed out, you can roll this duct-tape out in
>> userspace by making the commit non-blocking and immediately waiting for
>> the fences.
> Sure, userspace can do that (even, it turns out, in the all crtc
> disabled case which was an open question earlier in the thread).
>
> That's not really an argument against fixing the !nonblock case
> though.
>
>> One thing I didn't see mention is that there's a very subtle uapi
>> difference between non-blocking and blocking:
>> - non-blocking is not allowed to get ahead of the previous commit, and
>>    will return EBUSY in that case. See the comment in
>>    drm_atomic_helper_commit()
>> - blocking otoh will just block until any previous pending commit has
>>    finished
>>
>> Not taking that into account in your patch here breaks uapi because
>> userspace will suddenly get EBUSY when they don't expect that.
> I don't think that's right, drm_atomic_helper_setup_commit has several
> chunks of code like this:
>
> →       →       if (nonblock && old_conn_state->commit &&•
> →       →
> !try_wait_for_completion(&old_conn_state->commit->flip_done)) {•
> ...
> →       →       →       return -EBUSY;•
> →       →       }•
>
> So it only returns EBUSY for DRM_MODE_ATOMIC_NONBLOCK cases.
>
> There's also this code earlier in the process:
>
> →       list_for_each_entry(commit, &crtc->commit_list, commit_entry) {•
> ...
> →       →       →       completed =
> try_wait_for_completion(&commit->flip_done);•
> ...
> →       →       →       if (!completed && nonblock) {•
> ...
> →       →       →       →       return -EBUSY;•
> →       →       →       }•
> ...
> →       }•
> ...
> →       ret = wait_for_completion_interruptible_timeout(&stall_commit->cleanup_done,
> →       →       →       →       →       →       →       10*HZ);•
> ...
>
> So it looks like it sleeps (not leaving the system in RUNNING state!) if
> there's an outstanding commit.
>
> --Ray

