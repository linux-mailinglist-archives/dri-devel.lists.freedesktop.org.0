Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA75EA32C43
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C38510E935;
	Wed, 12 Feb 2025 16:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="c+GisFkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3A10E935
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:47:34 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-439585a0544so6992945e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1739378853; x=1739983653;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qa3lHlvYdLNFaksRYkAdLaRy9lcsKO0x9V6FGVIyLMI=;
 b=c+GisFktjzg+hoOZcsBLyfOoLKsQlylmPOTm8ez7ltrisPaGiPaU0Th0v2UlOEiQjI
 aS2VwVDoWJZaydjGrkGEjRuP9d0J9wlacvmEhrBV0S75JsnMqDemqEhB+TsptBVU1mir
 rN1+Tb92/+T1i6auO3VuXc4gL1z8awFhjn5dU5oZdAMHOb0SUXY1XDhGgqdr7oeTVzX8
 dx5+J5CL1NIK3b5mH/wCTNSgND7jd8nJcU3QNXe05JXt2vadbpCKgpB7McU3C8N31mEu
 2xB7zdE7gVEUXgiaoeh0+ALY3UmElzvHXYrQTNJU2exLzcV7f+5T4P+jPNkVoxkaY3tN
 rjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739378853; x=1739983653;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qa3lHlvYdLNFaksRYkAdLaRy9lcsKO0x9V6FGVIyLMI=;
 b=UGKGt5MOfTHfZqw2h4BMttGx4BCem/CGDNDaT1cKbvTa1/loFNLf99TktKYoPurGWH
 LK+1PCexBdmHjNBcvVnY4DDpaD7hCUmWYlZyeVYfXkN88vfhCiptP8q5Ol9otyh6D0X6
 +h0Kq8nVrSB8bHam8J1we6grkmDt6bVo3NdlAeRAFJEb42/MG6sVbEi4NYyymqH1l3GO
 GnaJvgCeBmOHeGqkx2MIymkedAhUD1uSgjQf58VB/GM9QW2Hg3Fb5p7hid1K+h23JRGW
 TbRWzrXyvsFO34/UekuGvi9M2f3xAB4VjHuvBdPQhBKUEVYc+nXjIlh8YwZKzDshUfTD
 hbvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvhkwJQ/RL/gHp5Qgx0PvmAPj1rOXqJpPURew9La57q0eUcSS/UgLKa9ZlFLmvj+ey03NCjnSzWcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp62ckrGovMOwUrIBwlE2Zd+0Uez/Qr474JhVQKQzuC/ddaOqS
 D0iiML3lLAE9Vq/XtDniPIWlX/FbAxD8cOFzx35XMy9eZyGvo2WRXZIzVcVnbqU=
X-Gm-Gg: ASbGnct/7WncAXThmoDjVJ3HYOWyO4Med8FQdN6o/0vAT6kqLVZvbrBYnjkox8NP9pB
 EipQpPonXOHGpkVbyLWnyCJN+08t/f+Z9+Hmj934kW01kuYTwLHDGHVitAd/1df3DR4sHjpi3l1
 r6Egp0A4aFercgYaCguuETeoSNW/qr/JG0x7MWZ8nzPYlZsw8t50OtGERa+ZDRZgEetiSbwJyMY
 EZ9wKJ6VfTVcfLPduNNj8HRE+yKra5IBOIIBVJb0PonIvV5vAWjdnUwJiHxhWkZf6kcsm7bJqyf
 82uu+qow+NtMXBw+b+MaCgyz6IOWnGw=
X-Google-Smtp-Source: AGHT+IEwx8ygIaZZRDY7oazT3QtnE2fMAh2TiojaLr2hVucu7dTdzOo+MVxVHndyN6Fo+KGkJ8h68w==
X-Received: by 2002:a05:600c:3505:b0:434:fdbc:5cf7 with SMTP id
 5b1f17b1804b1-43959a930b2mr29548845e9.27.1739378852618; 
 Wed, 12 Feb 2025 08:47:32 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc3a10fffsm17117045f8f.12.2025.02.12.08.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 08:47:32 -0800 (PST)
Message-ID: <b0664a84-6bef-44b6-90bd-7c60e9875933@ursulin.net>
Date: Wed, 12 Feb 2025 16:47:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
 <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
 <ddnsckbpr2fcxby4i2o5xyrt3pdhornzbrvlbivuvzlyhgg66q@ejhkiz33sewn>
 <7ee0205a-6522-465b-8795-3d7b867e2d97@ursulin.net>
 <20250212173356.10f47318@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250212173356.10f47318@collabora.com>
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


On 12/02/2025 16:33, Boris Brezillon wrote:
> On Tue, 11 Feb 2025 11:39:49 +0000
> Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> 
>> On 10/02/2025 16:08, Adrián Larumbe wrote:
>>> Hi Tvrtko,
>>
>> Thanks!
>>
>>> [18153.770244] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:562
>>> [18153.771059] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 203412, name: cat
>>> [18153.771757] preempt_count: 1, expected: 0
>>> [18153.772164] RCU nest depth: 0, expected: 0
>>> [18153.772538] INFO: lockdep is turned off.
>>> [18153.772898] CPU: 4 UID: 0 PID: 203412 Comm: cat Tainted: G        W          6.14.0-rc1-panthor-next-rk3588-fdinfo+ #1
>>> [18153.772906] Tainted: [W]=WARN
>>> [18153.772908] Hardware name: Radxa ROCK 5B (DT)
>>> [18153.772911] Call trace:
>>> [18153.772913]  show_stack+0x24/0x38 (C)
>>> [18153.772927]  dump_stack_lvl+0x3c/0x98
>>> [18153.772935]  dump_stack+0x18/0x24
>>> [18153.772941]  __might_resched+0x298/0x2b0
>>> [18153.772948]  __might_sleep+0x6c/0xb0
>>> [18153.772953]  __mutex_lock_common+0x7c/0x1950
>>> [18153.772962]  mutex_lock_nested+0x38/0x50
>>> [18153.772969]  panthor_fdinfo_gather_group_samples+0x80/0x138 [panthor]
>>> [18153.773042]  panthor_show_fdinfo+0x80/0x228 [panthor]
>>> [18153.773109]  drm_show_fdinfo+0x1a4/0x1e0 [drm]
>>> [18153.773397]  seq_show+0x274/0x358
>>> [18153.773404]  seq_read_iter+0x1d4/0x630
>>
>> There is a mutex_lock literally in seq_read_iter.
>>
>> So colour me confused. What created the atomic context between then and
>> Panthor code?! I just don't see it.
> 
> It's actually the xa_lock() we take when gathering fdinfo data that
> puts us in this atomic context. In other words, the fix is correct, but
> the explanation is wrong :-).

Huh I did not spot that when glancing over it yesterday or so, but 
anyway, excellent you figured it out! Now the commit message can be 
fixed and not mislead someone in the future to think mutexes cannot be 
used in fdinfo. Thanks for taking time to check it!

Regards,

Tvrtko

