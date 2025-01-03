Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6DA00818
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 11:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209710E86C;
	Fri,  3 Jan 2025 10:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="2PUS0w/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F1C10E86C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 10:50:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385df53e559so9545363f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 02:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1735901385; x=1736506185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNO7aKKRqXB9odYKaekoB8uFFpHAxVlhNSLA5z5NJrQ=;
 b=2PUS0w/jO4q7nBbyP1KVBffTwbm0H49+JXn/ojJitEbG4gqzwU4yx/UPwf/yYDYePj
 2UPpKj/tMpgKAO0pBD8rjf3q+nP/vqsFv2rnzTCGJrKKfmKPhZvPf6mCj9fCvm7zf5cK
 6BC0u8QX5IBgZkAsgSS64ihzkQsOIBULkjHIiYBKvgTnL0Ze91p3j45WL7geKvfhlGB7
 /UUviRwM7wHq22widdTWbGfor4PKEb5tTSFjR//SvmC9wycBowMtSB+R1BjeP4Ui8uCO
 KPnFwvPWOB+DEu7/3HuvrxIMH3x+zkZpbzjh19uE7QJr3FqlJEnW2IXTvhDdTrDXhSlG
 Z/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735901385; x=1736506185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GNO7aKKRqXB9odYKaekoB8uFFpHAxVlhNSLA5z5NJrQ=;
 b=aS17x/uEVrHf+nvZoBTu2EZB0QYRIRdAbqmNuJTDGXS80yDChFs8dWD0osJRpyhyFq
 5heh8wqQYme8o6LfFLrWFuY7qtN0Y+mQwSZfUWCW+yi6kjdwQLcXUeuV5IDsS6nB17cw
 GknnfN0exuF4stS88h2c/kBl8n5Si77PYAxCX/mKkgXkMIR8RDMIKJvOHKjHYv4idBQ+
 7aD3xRszYU60V1G+zbTz2BxtnLjJnHBL+ObLZgFxTCO4NZIKY8zDfyTgRRlKgl0Lf2p7
 eSiENlzY42eP0Nd9mYY0OhFegT6lK2xAmvQ2n/ZddtZAdhxXHdcVJIx5HsDfFmDFe1In
 5dTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo/EXK2kKb/jMhYCMH4RMz3YvRmteauePnq1Z2lhIs5reFLdEw2mhV3uTIGO0zmEvRn7i34ebgXBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUjsWzJXAe1VaEv9TiLkGXQOqELsqlj8pFaXBo96sizmV9+NLO
 xEDClr1zfmBGS0zEUjqPPyqYp1R/kvsAD9m01XG6lp/YAKRXhOlqo8sxsfMBhOg=
X-Gm-Gg: ASbGncsav2K/YBX2e/HbEIlgrmPBEJw7+vS3D0w2G6ivrl+ldWI3UdcnXJENnGsHuvP
 aPiyvHQzW30CW97XvARbeDFEpLksRM1vcaIxqrd7EoqAnxx4WRvJbABgdqw+J8bg6lroYvETokp
 KKu9whR8ITeo7dKjVUHahrOp7LnwjRv71uI8BICzfE3xwxXLMGKEKr8aE2am00C/Enw0H/80U07
 7pxiBRYcHSFoi9QV78F2EmL8alDJHb0rW1/oR+t0tHxaFWvig6+rZeSwtJU3un+/nIsczgN
X-Google-Smtp-Source: AGHT+IHDTyCOhNnU2/xtmn0I5eiTsC1dXR3CyZAFbua5HLlvBHPxD2jx2jZyDyZbNiLZZ5hPmWjYVA==
X-Received: by 2002:a05:6000:1564:b0:38a:624b:e7fe with SMTP id
 ffacd0b85a97d-38a624bee1bmr7006777f8f.7.1735901384474; 
 Fri, 03 Jan 2025 02:49:44 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea42esm487087135e9.9.2025.01.03.02.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 02:49:44 -0800 (PST)
Message-ID: <c76881d9-e7e4-48b3-904c-439ab28d9782@ursulin.net>
Date: Fri, 3 Jan 2025 10:49:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
To: =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-3-adrian.larumbe@collabora.com>
 <1ef1d07b-bfa9-4e52-bfa0-20f569752701@ursulin.net>
 <2sb72aco2lc5hlvwn7hpc5k27naep7u2s64lc6qzk4ruy6jkhd@c2dfhvhe76yt>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <2sb72aco2lc5hlvwn7hpc5k27naep7u2s64lc6qzk4ruy6jkhd@c2dfhvhe76yt>
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


On 02/01/2025 22:18, Adrián Martínez Larumbe wrote:
> On 02.01.2025 21:59, Tvrtko Ursulin wrote:
>>
>> On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
>>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>
>>> A previous commit enabled display of driver-internal kernel BO sizes
>>> through the device file's fdinfo interface.
>>>
>>> Expand the description of the relevant driver-specific key:value pairs
>>> with the definitions of the new drm-*-internal ones.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
>>> ---
>>>    Documentation/gpu/panthor.rst | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
>>> index 3f8979fa2b86..23aa3d67c9d2 100644
>>> --- a/Documentation/gpu/panthor.rst
>>> +++ b/Documentation/gpu/panthor.rst
>>> @@ -26,6 +26,10 @@ the currently possible format options:
>>>         drm-cycles-panthor:     94439687187
>>>         drm-maxfreq-panthor:    1000000000 Hz
>>>         drm-curfreq-panthor:    1000000000 Hz
>>> +     drm-total-internal:     10396 KiB
>>> +     drm-shared-internal:    0
>>> +     drm-active-internal:    10396 KiB
>>> +     drm-resident-internal:  10396 KiB
>>>         drm-total-memory:       16480 KiB
>>>         drm-shared-memory:      0
>>>         drm-active-memory:      16200 KiB
>>> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>>>    Where `N` is a bit mask where cycle and timestamp sampling are respectively
>>>    enabled by the first and second bits.
>>> +
>>> +Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
>>> +These values convey the sizes of the internal driver-owned shmem BO's that
>>> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
>>> +sync object arrays and heap chunks. Because they are all allocated and pinned
>>> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
>>> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
>>> +VM's and groups currently being scheduled for execution by the GPU.
>>> +`drm-shared-internal` is unused at present, but in the future it might stand for
>>> +the size of executable FW regions, since they do not belong to an open file context.
>>
>> The description is way too specific, too tied to some of the implementations.
> 
> These are panthor-specific key:value pairs. I was in the belief that drivers
> could define their own when it suits their interest beyond the DRM-wide ones
> defined in the drm-fdinfo spec.
> 
>> I also don't remember that you ever explained why totting up the internal
>> objects into existing regions isn't good enough. I keep asking, you keep not
>> explaining. Or I missed your emails somehow.
> 
> It's not that it's not good enough, but rather that it cannot be done in the
> current state of affairs. drm_show_memory_stats() defines its own
> drm_memory_stats struct as an automatic variable so we don't have access to it
> from anywhere else in the driver. In a previous revision of the patch series I
> had come up with a workaround that would let drivers pass a function pointer to
> drm_show_memory_stats() which would gather those numbers in a driver-specific
> way, but it didn't seem to get any traction.

Side note - i915 and amdgpu manage to do it so it is not that it is not 
possible.

>> And you keep not copying me on the thread. Copying people who expressed
>> interest, gave past feedback, etc should be the norm.
> 
> I did not CC you on this series because these are all panthor-specific changes
> which do not touch on any DRM fdinfo-wide code, and also because I didn't think
> that driver-specific key:value pairs needed the approval of the drm-fdinfo core
> maintainers.

Ah my bad.. sorry! I saw drm-internal-* and did not spot it is actually 
*in* panthor.rst. So I think you just need to rename those to panthor- 
prefix. Same as amdgpu has its own private keys amd-evicted-vram etc.

Regards,

Tvrtko

>> Until we can clarify the above points I don't think this can go in.
>>
>> Regards,
>>
>> Tvrtko
> 
> Adrian Larumbe
