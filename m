Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F77B9CD0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79C610E3DC;
	Thu,  5 Oct 2023 11:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156CC10E3D8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:51:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ewiy/F6crUYxHBIb6fpX/Ovg7/F71QEsmNSiN7ypWbmv762YXSBgx47IFMOYcrVEos4RLCqyqS04WPV6uBQMdt6TILRgueKHSUaRO1mxuU1FbKEd0CZyDJBCYX/CYVdpfAAWFqYcqgPMAb463qYbeWrjAlfhYdgpP9tZTuSjKZdivGKPXoAQwtJBcnSac5Cv4Jh+95WmQ3Jp7ukDRXodXnK6GTLoUSIGp9L7rAeJo+QogOK4zMHNS0Zvrsg3yqR6ixcPZ6NjBFeB9HuI3q9TYPJ82AUfCP4NnSUTaWK9A1FTbtFiS8/5iMYab4g79yIWj5bpIboA7ZDVVm7Zq5sozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK77UjuZ6DK1hyD9oWL+471NbxO7ixS0g37cQE7W2fM=;
 b=mHcC70/P8U3csj7aAmTP16DRqySu2zpq8DYKwqXyKp/2Q65HGLdeZ5eN495G6KN0s9sYI6ekeQy5Fz6UC44EU+dHZTJakCIpiEbdgtwVr5jP9+Dn6RKuIbtJ0dURiCpJ8CRLaeNDP767y/nR+GXn6sTFrh+x9H2VTypJyjQLNN/QlV1PXVnRHjV4ZIFcfs4DAX//WZWbKHqW4vLEtmBY2HGRvnXy9KPs3JYE6koi3k1Nre3vNAIRAsyvtSvKfi16W9L9GPMne2sI4M4x+OQFdhR+dmj2sxM3Xb6aZEL8L5gHGtaUVvDFeLfAphVEEEpUDjlUACIasj7A/0hT5YoJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OK77UjuZ6DK1hyD9oWL+471NbxO7ixS0g37cQE7W2fM=;
 b=hal3jTFInoxqKb2zzxtmdQwx7AdLE2LrwY2r4frbuSdx+s0xJeq1/wYhsBJEiQ5TKXd5VFKgbwJAvTq58jaJ2CgC0hUBWzU7EeKlBZIjuRimpkPZe7WIDBqJbDwEftsV/q7csbSMfYsM+0156y/p5wc4nAaj4Jf7vPICoCsrCPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8756.namprd12.prod.outlook.com (2603:10b6:610:17f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 11:51:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.027; Thu, 5 Oct 2023
 11:51:35 +0000
Message-ID: <29825574-858f-44e5-9814-e76452b7f06c@amd.com>
Date: Thu, 5 Oct 2023 13:51:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: addd0537-0913-4d25-52ae-08dbc5996d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0gJOe1Dxo1ycGuYfkdejWZmRIkF6v7Hq15M9HgbrbA6ztlv2o3zDDjx8VR+lq2e3oclYTH3mWZ3JlR/L2J8Dxb9a/AVu/ELrec2Pv9ShVY2i+jLZQAmmLXrMEuZCgY8g4n/a5USJWzvIhcVH7LW2dT+mgmiSo7/sNzx6IVxGfWZ1eBhf1jvN/SKQ5RFyRco6CH6oBvPT5w31HegO0pZLE6nNU5q4BhdIMplFRIKAcOTQAvUbySrhYsLF+CM/twSUesEmsOlluYhbAiiBXSm4VpyFosJ9M5BGXjs2CFKCS1ZIywbWk5Y4VUdrMIl9oU3unzxiKxv377GZyG2zjKCol0EBuyLMKyE69f9k+5S3lTGc+W62ENCbQV7dtDKmtJbvTErum3vXWBJADdzDpOs20VzVdzUKjbgIavxZ1NQ1CIdKKEARcYy8MQ9ftXSu8nSZD7BkA3TsXU2OpAnSo4c6nsm9CwzXTakafnh7YtvH7B6Q7WmU9Cyo13gQoXdH4oMPRYpS/jkTvhsOj58LIza4FoaQC7c3BAbz4UzsHAfK8mdSkz9JFNd+/6DI8U5PGkjxcFzRGWE2jTdo4lcla521RZF0vT+nYW6Ss/MYFQY9GAvXVAmdzrip7inBW4+HRK3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6506007)(478600001)(6486002)(6512007)(6666004)(966005)(5660300002)(83380400001)(26005)(66574015)(2616005)(2906002)(110136005)(4326008)(66556008)(41300700001)(66946007)(8936002)(8676002)(316002)(36756003)(38100700002)(86362001)(31696002)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFJHcWNaN1BKa1o5ZFBYbnF1ZWxBa0lQUm9OWDZxREZnVDEvclVWN1dFclVl?=
 =?utf-8?B?REhxdForZ0M2K0MzQ1BMQnF6Mmc3OEUxbldhTTJWQnhqdEZ5b0NNV0JycXZ1?=
 =?utf-8?B?eHcrcUxoTFd5WnZ1bGpBcDZOZTRKcjhGRjhjcVZHTHkrc2RqRUxrNkQ5cGRo?=
 =?utf-8?B?YWlSUHF0eVNBMDVYWlRyN1BhUFhGZW55N0pHQW5NOW9hTzBsbkJGd014R2xy?=
 =?utf-8?B?NHNmSmJGMSs1RWNxc1NnTVZ3Nnk0Sk1oRU9JNStTenN6NzVDaGZ6c2NUc1ov?=
 =?utf-8?B?bTRIendjb3BIR1NsRDV1QytFbUFsd1c0QU4yVXRZcHVNM0pzc2VJNy9sSjkw?=
 =?utf-8?B?V1lERVZ1dHJSRnpyeDEvNThUTmd1QzJXMk5xR1VFNnBYM09nVkpHcG0xclFv?=
 =?utf-8?B?aVlVbm5YQU5jZVZOcnROWXhVall0Z2ZZd2I0Q2d6S3N1SXloaCs0aXJRUmVL?=
 =?utf-8?B?NzcrVjNLekxLaHhUVE5oaE1hM0hLbVNuSHJndWpGSWwrNnZldGNPSXF5eWJI?=
 =?utf-8?B?OGdqWWxTQ3lqWUNvTGFuMXBGWDcrMUcxMUkyRFlMUGFQdDVZN0sxUVdVRDNX?=
 =?utf-8?B?THJENEFJZEJHamVWOWREazVIUm8vQmt0a3FHSGJTcGQ1RVVCMDMvNkZSUTlW?=
 =?utf-8?B?eWZQNzBUMy9IR2EwajZ5WFYvNFl6Y2pOTkRvSFVLUHdEWWlqQTdtQmhvQU9R?=
 =?utf-8?B?ZVRQWUE5OW5hMGR5Wk56OVA3RW1ub1dMMUl6bklEcWQzeUN5elZTYnBBY3hv?=
 =?utf-8?B?Vnk5dEk3blMrMVZDMlN5Y0FGV0JnNHNsR0ZPQ2M5bXJZcXpYZ1oyTUsyV1lX?=
 =?utf-8?B?TTZOb0pERGgwV01GNGU1eG0wNWh0eDI0dzVrZk4yZXR0TUdZdmlmUzBaalpl?=
 =?utf-8?B?RnEzelBVN1hjbkRqY21FK2F1dGIreVRRdDZDQjJTdzY3M2RobmwvbTM5UXRD?=
 =?utf-8?B?OU5zeUtUTmxLMno1MkhSUCtRT1hJWnR3OG91NlEySHhieUxReUhUN2w4UlZZ?=
 =?utf-8?B?ZXBjcFlYa1BaTVh0UE9PQU1sZEZtT2FMMG5UTDNtWEIxSzlEMW1HamZNRjRG?=
 =?utf-8?B?OHJ4NnNNdTd2bnZWZ2FDdG0wdFhldjYwTUpVaWg0UjVlTnBxbHdjN0dKUFRk?=
 =?utf-8?B?K05CUWd5c1dFT1JDQkdoVWRONXdHSEZXdWl5YTc5YVlFYUthWGdaRE8zdnZW?=
 =?utf-8?B?blg2MkxEcVNWVkpCNEhuWmZ5eE5ERm5BdzBPcVpVRGxCaGFyNDZDVHU0OG9l?=
 =?utf-8?B?Y2VOQkxaajUzNVpGQ3NTZlNGNGZPeUlvdUNLNUEvU09TR1BaZEVYMldzVUJh?=
 =?utf-8?B?RzY2WHp5TUNMVGV1MWgzTVpQVkVVRTF4bXdOanlubCtSSWpPQ0tZY0dMWVVY?=
 =?utf-8?B?dTZLaFpkaTZzMzV2MEVsNzc4eW0wQ2dRc0VKU2JnL0dsQjlwRmVYV0FxeGJq?=
 =?utf-8?B?SWdEczFaUkVFMU5mUS9xeFdIZENYMHpIYVdmUjB5dzRaaWV6NWE0dDQ0WWFZ?=
 =?utf-8?B?WWRhd0diUk8rR29Nc254eFRpL3BDZ3hib3dIZzVVMTBiK3ZWdERabGhsSVBP?=
 =?utf-8?B?c0V2aTVvQ0FMVVRTb1FBejZRemIydG51OHdDcVFBV0daQzRiMll3cEJpNE1z?=
 =?utf-8?B?NlV0SVZuZkMyeWRBRERsbTRUUllDUHVVbG9zVEJaOXp6YjRpVGZZVEJwOEFy?=
 =?utf-8?B?dU0rZTRzc21RaXJlNkpkbDF5QVJjVFRhL0Rvd0FqM3JHd1Z6STNDdFFzamxu?=
 =?utf-8?B?RVBFRXdZd1hXaXJBdkVhYnY1MVFWWHNiVEZtRXBJNHVQUWppTERYTmhzZmhz?=
 =?utf-8?B?bDU1Zk9tQVNKMFg0cWZmQlhiK09BbmpNMWdIVndYZURLYi9Fc2JkbWRtV3dP?=
 =?utf-8?B?dVg5dWJ4REM4Z2FXcGJENlBQNnBqMHpRa3JHK1dnejBoZlpUNmhXUWtIdEZG?=
 =?utf-8?B?TTRXQkRGV1JqUThhRDVJY0pZZkZ5a2dIbEdsV2x3STZNcjZhVGsyWG96K3JW?=
 =?utf-8?B?NDBwOVVJRk80QXo3OEVtemU5c1dJVDhrZFEyZDJFZjY3ZmYwTitlV2FZZVBQ?=
 =?utf-8?B?YkxJVnprOTdFRXFDYWNiZnNHZkl1Q2VNSEF5MGFSWGZZTEU5UnFFWXVKK0Zx?=
 =?utf-8?Q?5LGNfpxLz74BOK1jTYRDxC9Ay?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: addd0537-0913-4d25-52ae-08dbc5996d2f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 11:51:35.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nxq+H61EHhB3RrvbXYLf08j7p8FzV4mnSxRMefwmrGeIb9iC33BiHvgbbW7nq7Eb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8756
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
Cc: Ray Strode <rstrode@redhat.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, mdaenzer@redhat.com,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.10.23 um 11:57 schrieb Daniel Vetter:
> On Tue, Sep 26, 2023 at 01:05:49PM -0400, Ray Strode wrote:
>> From: Ray Strode <rstrode@redhat.com>
>>
>> A drm atomic commit can be quite slow on some hardware. It can lead
>> to a lengthy queue of commands that need to get processed and waited
>> on before control can go back to user space.
>>
>> If user space is a real-time thread, that delay can have severe
>> consequences, leading to the process getting killed for exceeding
>> rlimits.
>>
>> This commit addresses the problem by always running the slow part of
>> a commit on a workqueue, separated from the task initiating the
>> commit.
>>
>> This change makes the nonblocking and blocking paths work in the same way,
>> and as a result allows the task to sleep and not use up its
>> RLIMIT_RTTIME allocation.
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
>> Signed-off-by: Ray Strode <rstrode@redhat.com>
> So imo the trouble with this is that we suddenly start to make
> realtime/cpu usage guarantees in the atomic ioctl. That's a _huge_ uapi
> change, because even limited to the case of !ALLOW_MODESET we do best
> effort guarantees at best. And some drivers (again amd's dc) spend a ton
> of cpu time recomputing state even for pure plane changes without any crtc
> changes like dpms on/off (at least I remember some bug reports about
> that). And that state recomputation has to happen synchronously, because
> it always influences the ioctl errno return value.
>
> My take is that you're papering over a performance problem here of the
> "the driver is too slow/wastes too much cpu time". We should fix the
> driver, if that's possible.
>
> Another option would be if userspace drops realtime priorities for these
> known-slow operations. And right now _all_ kms operations are potentially
> cpu and real-time wasters, the entire uapi is best effort.
>
> We can also try to change the atomic uapi to give some hard real-time
> guarantees so that running compositors as SCHED_RT is possible, but that
> - means a very serious stream of bugs to fix all over
> - therefore needs some very wide buy-in from drivers that they're willing
>    to make this guarantee
> - probably needs some really carefully carved out limitations, because
>    there's imo flat-out no way we'll make all atomic ioctl hard time limit
>    bound

Well, we actually have a pending request to support some real time use 
cases with the amdgpu driver.

And as I already said to Alex internally this is not a pile, but a 
mountain of work even when we exclude DC.

Fixing DC to not busy wait for events which raise an interrupt is still 
something we should absolutely do anyway, but that is an ongoing process.

> Also, as König has pointed out, you can roll this duct-tape out in
> userspace by making the commit non-blocking and immediately waiting for
> the fences.

Oh, please don't use my last name like this. It reminds me of my 
military time :)

Regards,
Christian.

>
> One thing I didn't see mention is that there's a very subtle uapi
> difference between non-blocking and blocking:
> - non-blocking is not allowed to get ahead of the previous commit, and
>    will return EBUSY in that case. See the comment in
>    drm_atomic_helper_commit()
> - blocking otoh will just block until any previous pending commit has
>    finished
>
> Not taking that into account in your patch here breaks uapi because
> userspace will suddenly get EBUSY when they don't expect that.
>
> Cheers, Sima
>
>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 292e38eb6218..1a1e68d98d38 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -2028,64 +2028,63 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>>   	 * This is the point of no return - everything below never fails except
>>   	 * when the hw goes bonghits. Which means we can commit the new state on
>>   	 * the software side now.
>>   	 */
>>   
>>   	ret = drm_atomic_helper_swap_state(state, true);
>>   	if (ret)
>>   		goto err;
>>   
>>   	/*
>>   	 * Everything below can be run asynchronously without the need to grab
>>   	 * any modeset locks at all under one condition: It must be guaranteed
>>   	 * that the asynchronous work has either been cancelled (if the driver
>>   	 * supports it, which at least requires that the framebuffers get
>>   	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
>>   	 * before the new state gets committed on the software side with
>>   	 * drm_atomic_helper_swap_state().
>>   	 *
>>   	 * This scheme allows new atomic state updates to be prepared and
>>   	 * checked in parallel to the asynchronous completion of the previous
>>   	 * update. Which is important since compositors need to figure out the
>>   	 * composition of the next frame right after having submitted the
>>   	 * current layout.
>>   	 *
>>   	 * NOTE: Commit work has multiple phases, first hardware commit, then
>>   	 * cleanup. We want them to overlap, hence need system_unbound_wq to
>>   	 * make sure work items don't artificially stall on each another.
>>   	 */
>>   
>>   	drm_atomic_state_get(state);
>> -	if (nonblock)
>> -		queue_work(system_unbound_wq, &state->commit_work);
>> -	else
>> -		commit_tail(state);
>> +	queue_work(system_unbound_wq, &state->commit_work);
>> +	if (!nonblock)
>> +		flush_work(&state->commit_work);
>>   
>>   	return 0;
>>   
>>   err:
>>   	drm_atomic_helper_cleanup_planes(dev, state);
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_atomic_helper_commit);
>>   
>>   /**
>>    * DOC: implementing nonblocking commit
>>    *
>>    * Nonblocking atomic commits should use struct &drm_crtc_commit to sequence
>>    * different operations against each another. Locks, especially struct
>>    * &drm_modeset_lock, should not be held in worker threads or any other
>>    * asynchronous context used to commit the hardware state.
>>    *
>>    * drm_atomic_helper_commit() implements the recommended sequence for
>>    * nonblocking commits, using drm_atomic_helper_setup_commit() internally:
>>    *
>>    * 1. Run drm_atomic_helper_prepare_planes(). Since this can fail and we
>>    * need to propagate out of memory/VRAM errors to userspace, it must be called
>>    * synchronously.
>>    *
>>    * 2. Synchronize with any outstanding nonblocking commit worker threads which
>>    * might be affected by the new state update. This is handled by
>>    * drm_atomic_helper_setup_commit().
>>    *
>>    * Asynchronous workers need to have sufficient parallelism to be able to run
>>    * different atomic commits on different CRTCs in parallel. The simplest way to
>> -- 
>> 2.41.0
>>

