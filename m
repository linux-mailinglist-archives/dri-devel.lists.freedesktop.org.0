Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BaoODx0qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:17:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C6211735
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A406410E282;
	Thu,  5 Mar 2026 12:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LqirZZMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945F10E282
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0SBH/uAY5lLaSVagWr5FezR6Hdtnxxs+R6JraoOV+9U=; b=LqirZZMmWRWkTGcbTw2hCVWJIS
 Qjk5MxNgHvf5cp3GOytohN7v4g5ReUuspYbsVLLCifSnndjP9OgpNk6EiADBeJmwtLi5ZeQWqZj3l
 S9y1pf8EuGKfAHCbxFXBNYmMlm0FmVl48rYuQ+g8ih7SGNqw+mJbKv240xxVyWJ9R+b+S5tSZcUX4
 fO8jRqUfOQ8yJ+Q9cGH06rJpDdYLEN/8iXRjfwhM6DtS4z0r9KO/iqtPdXH0kKOfAlkMia9FsUtst
 rTYKcZaUgZ6JTro2SSnw2ah4piRluTeSQE6vMN162gYlUlbuFQONAVeCQjCG2IxkFTi1dQuGKsXUj
 /FV4c4ow==;
Received: from [189.7.87.203] (helo=[192.168.0.2])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vy7dI-009M18-Ce; Thu, 05 Mar 2026 13:16:48 +0100
Message-ID: <973825be-0a26-45ac-b855-f16a47c9ae7e@igalia.com>
Date: Thu, 5 Mar 2026 09:16:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/v3d: Attach per-fd reset counters to v3d_stats
To: Iago Toral <itoral@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
 <20260217-v3d-reset-locking-improv-v1-5-0db848016869@igalia.com>
 <3c27ff4ab7e18c7d2d3208a46f18ced2d2ca6957.camel@igalia.com>
 <73c11615-a459-40a4-be5d-8535040753d5@igalia.com>
 <052f80f50c0f6e57f5b3b5c3494fb70651ef22bf.camel@igalia.com>
 <e7c2447d-d19c-4e67-a4e5-eec6ced0fbda@igalia.com>
 <b61de2d523fc2b981eb969f50abc9174c0a17c03.camel@igalia.com>
 <5de3b3a5-2467-41a4-9865-1d939bbae831@igalia.com>
 <37df79b2681f4e503bdd8a94f8836b653d0bd749.camel@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <37df79b2681f4e503bdd8a94f8836b653d0bd749.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 4A4C6211735
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:itoral@igalia.com,m:tvrtko.ursulin@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.948];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

Hi Iago and Tvrtko,

Thanks for the reviews!

On 05/03/26 08:21, Iago Toral wrote:
> El jue, 05-03-2026 a las 10:50 +0000, Tvrtko Ursulin escribió:
>>
>> On 05/03/2026 10:35, Iago Toral wrote:
>>> El jue, 05-03-2026 a las 10:25 +0000, Tvrtko Ursulin escribió:
>>>>
>>>> On 05/03/2026 10:18, Iago Toral wrote:
>>>>> El jue, 05-03-2026 a las 09:34 +0000, Tvrtko Ursulin escribió:
>>>>>>
>>>>>> On 05/03/2026 09:15, Iago Toral wrote:
>>>>>>> El mar, 17-02-2026 a las 09:18 -0300, Maíra Canal escribió:
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>>
>>>>>>>> To remove the file_priv NULL-ing dance needed to check if
>>>>>>>> the
>>>>>>>> file
>>>>>>>> descriptor is open, move the per-fd reset counter into
>>>>>>>> v3d_stats,
>>>>>>>> which
>>>>>>>> is heap-allocated and refcounted, outliving the fd as
>>>>>>>> long as
>>>>>>>> jobs
>>>>>>>> reference it.
>>>>>>>>
>>>>>>>> This change allows the removal of the last `queue_lock`
>>>>>>>> usage
>>>>>>>> to
>>>>>>>> protect
>>>>>>>> `job->file_priv` and avoids possible NULL ptr dereference
>>>>>>>> issues
>>>>>>>> due
>>>>>>>> to
>>>>>>>> lifetime mismatches.
>>>>>>>>
>>>>>>>> Also, to simplify locking, replace both the global and
>>>>>>>> per-fd
>>>>>>>> locked
>>>>>>>> reset counters with atomics.
>>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>> Co-developed-by: Maíra Canal <mcanal@igalia.com>
>>>>>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/v3d/v3d_drv.c   | 20 ++++------------
>>>>>>>> ----
>>>>>>>>      drivers/gpu/drm/v3d/v3d_drv.h   | 14 ++++----------
>>>>>>>>      drivers/gpu/drm/v3d/v3d_sched.c |  9 ++-------
>>>>>>>>      3 files changed, 10 insertions(+), 33 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
>>>>>>>> b/drivers/gpu/drm/v3d/v3d_drv.c
>>>>>>>> index
>>>>>>>> aafb402c6ac3118a57df9fc0a0d21d35d48e3b2c..4e77f4808145df2
>>>>>>>> 1746
>>>>>>>> ff4b
>>>>>>>> 7058
>>>>>>>> 089d0d161e3fc 100644
>>>>>>>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>>>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>>>>>>>> @@ -110,13 +110,13 @@ static int
>>>>>>>> v3d_get_param_ioctl(struct
>>>>>>>> drm_device *dev, void *data,
>>>>>>>>      		args->value =
>>>>>>>> !!drm_gem_get_huge_mnt(dev);
>>>>>>>>      		return 0;
>>>>>>>>      	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
>>>>>>>> -		mutex_lock(&v3d->reset_lock);
>>>>>>>> -		args->value = v3d->reset_counter;
>>>>>>>> -		mutex_unlock(&v3d->reset_lock);
>>>>>>>> +		args->value = atomic_read(&v3d-
>>>>>>>>> reset_counter);
>>>>>>>
>>>>>>> Don't we still need to take the reset lock here? Otherwise
>>>>>>> there
>>>>>>> would
>>>>>>> be a chance that we read the counter while a reset is in
>>>>>>> flight,
>>>>>>> no?
>>>>>>
>>>>>> I don't see that it would make a difference but maybe I am
>>>>>> not
>>>>>> seeing
>>>>>> your concern. It uses atomic_t so the increment versus read
>>>>>> is
>>>>>> fine.
>>>>>> Are
>>>>>> you maybe saying the v3d ABI guarantees reset is 100% done
>>>>>> (so
>>>>>> not in
>>>>>> progress, for some definition of progress, because hardware
>>>>>> reset
>>>>>> is
>>>>>> done by then, only re-submit and re-start of the software
>>>>>> state
>>>>>> is
>>>>>> poending) if userspace observes an increased global reset
>>>>>> counter?
>>>>>> That
>>>>>> would be surprising and I don't see how it could make a
>>>>>> practical
>>>>>> difference, but perhaps could be mitigated by moving the
>>>>>> atomic_inc
>>>>>> to
>>>>>> the end of v3d_gpu_reset_for_timeout(). Or still taking the
>>>>>> lock
>>>>>> as
>>>>>> you say.
>>>>>
>>>>> My concern is just that it is possible for the query and the
>>>>> reset
>>>>> to
>>>>> race and that I think it would make sense for the counter query
>>>>> to
>>>>> include in-flight resets (since what apps really care about is
>>>>> whether
>>>>> a GPU reset happened not if it completed the reset process).
>>>>
>>>> Then there is no problem I think. Mutex lock or not, in both
>>>> cases it
>>>> is
>>>> not guaranteed reset either is not in progress at the time of the
>>>> ioctl.
>>>> Even if the ioctl does not return an increased counter perhaps
>>>> the
>>>> reset
>>>> handler is running but hasn't grabbed the mutex yet.
>>>>
>>>>
>>>
>>> That's true, but then I wonder: what is the rationale for still
>>> taking
>>> the lock when resolving the DRM_V3D_PARAM_CONTEXT_RESET_COUNTER
>>> query?
>>
>> Good question and I asked myself the same this morning. For full
>> disclosure I wrote this patch back in Sep'25.. so between then and
>> now I
>> forgot a thing or two.
>>
>> In the latest local branch that I can find I had it without the mutex
>> even for DRM_V3D_PARAM_CONTEXT_RESET_COUNTER. Maira, was there a
>> newer
>> version somewhere which I forgot about?
>>
>> Mutex would make sense if there was any chance for paired jobs across
>> two engines to get reset at the same time. I think Maira was
>> explaining
>> to me that could be a possibility, maybe with some future rework.
>> Unless
>> I am confusing things.
>>
>> In any case, in the current upstream v3d it indeed looks to be safe
>> with
>> no mutex.
> 
> Ok, thanks for checking the history here! Let's see if Maíra has
> anything to add to this so we have the full picture and then we can
> decide if we can also drop the remaining lock (and I guess in that case
> the reset mutex too).

Initially, I was trying to make sure we had some consistency between
queues, so that the result for the user is a reliable snapshot from all
queues. So, for example, let's say we are iterating the loop and we
reached q=3 (CSD) and the BIN queue reset counter is incremented. In
such scenario, the user would get an outdated information.

If we take the lock, this scenario wouldn't happen, as the timeout hook
wouldn't be able to take the lock. Feel free to correct me if this train
of thought is mistaken (or if you believe this level of consistency is
not needed).

About removing the reset mutex, I don't believe it's possible, as we
need it to make sure that two queues are not resetting at the same time.
Also, I'll use this mutex (and the reset counter) in a future patch to
address redundant resets that happens when two queues are competing for
the `reset_lock`.

Best regards,
- Maíra


