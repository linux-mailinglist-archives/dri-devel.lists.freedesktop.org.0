Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B16490741
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 12:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0E110E1A7;
	Mon, 17 Jan 2022 11:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477C410E195;
 Mon, 17 Jan 2022 11:44:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso23672055wma.4; 
 Mon, 17 Jan 2022 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FrdG2cxNnrVEZM1xyC0l++b7Iisx+p0n7TjH+A9OIkc=;
 b=fxlRTJw3kfzZCGtZzsFtKyYjs5GRpEWNndaLbIo/RWWStK7ReebtTk7yqb3wKPPQfN
 WBO8xh9CVl5vh4fSaIWUrt15FbYdCqs8u4XniZZRKZh+VfTvBAcpbS+lvVZ9JTVfcMcP
 K19/PUA/tY5u4ruACCYlEkXOAMoHqBuN23iJev2tBU4yRGlLY81meJbfHoO4mvVPJQpO
 vec/XMsM6emqLDa4OexfIotrrIOnZfLUbzvY6Q7fVEu5ah9ZOPr/HMqcFWDnDXRlYORN
 cIxQmhXxgOLEPnHnqTIUkTOSBLvfU6i3Ev/JhCm7lpKjJc2NCev6/fNYJIOpJh0R3QDH
 S8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FrdG2cxNnrVEZM1xyC0l++b7Iisx+p0n7TjH+A9OIkc=;
 b=vXnGmAGjc+LWKLxXgcWjbWCtWd3nQG07/eM+0PsOd7embVui/CLT2kfD6OCTxlp86i
 NVL35cZMnzhMbV0LLBjK0yepynzcBxNEOSgtrctVo9yH1UBFoeKUHpW31nTirZXIXPvv
 efL5SNipjZli4A7gLECV5e4MH/dA5JaTstCxQ1jEvikpwCJr9PsJyk2lQwBl0BFb+JF7
 SJhMSP1C1PD1WbOfShg6Iq1Y+UR3dcfvI7ZumGKavIK7CFpdDCPvdhgn2o/435QvzC7F
 idco49/OeJmmfa1Hlps6uiSGxJ5T9sFvyq5WWnv9KImP3Pcex3lkNnopS+2mkA8RDHeN
 VXPg==
X-Gm-Message-State: AOAM532k9iuG50hY7XzgCZXXCko2gLxNpVrD000k3HjWe0naAqpWuqHp
 uQj78Nkq1Rt3GDZiLq1Gc94=
X-Google-Smtp-Source: ABdhPJz3s4P7yKCerwp5MLRzgIbL1cQc/QC6K79+cDzyAdU/52Kgf8eLPBlaRNjSu59Y0Xk+iJTIHQ==
X-Received: by 2002:a05:6000:1108:: with SMTP id
 z8mr18814124wrw.269.1642419851729; 
 Mon, 17 Jan 2022 03:44:11 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g13sm4288366wmq.22.2022.01.17.03.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 03:44:11 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
 <YeGoVhLgMDOJS15K@phenom.ffwll.local>
 <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
 <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <387a53c6-8ec0-ff6b-aaa2-34398f36a369@gmail.com>
Date: Mon, 17 Jan 2022 12:44:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: daniel.vetter@ffwll.ch, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, David Yat Sin <david.yatsin@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, airlied@redhat.com,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.22 um 18:40 schrieb Felix Kuehling:
> Am 2022-01-14 um 12:26 p.m. schrieb Christian König:
>> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
>>> Top post because I tried to catch up on the entire discussion here.
>>>
>>> So fundamentally I'm not opposed to just close this fork() hole once and
>>> for all. The thing that worries me from a upstream/platform pov is
>>> really
>>> only if we don't do it consistently across all drivers.
>>>
>>> So maybe as an idea:
>>> - Do the original patch, but not just for ttm but all gem rendernode
>>>     drivers at least (or maybe even all gem drivers, no idea), with the
>>>     below discussion cleaned up as justification.
>> I know of at least one use case which this will break.
>>
>> A couple of years back we had a discussion on the Mesa mailing list
>> because (IIRC) Marek introduced a background thread to push command
>> submissions to the kernel.
>>
>> That broke because some compositor used to initialize OpenGL and then
>> do a fork(). This indeed worked previously (no GPUVM at that time),
>> but with the addition of the backround thread obviously broke.
>>
>> The conclusion back then was that the compositor is broken and needs
>> fixing, but it still essentially means that there could be people out
>> there with really old userspace where this setting would just break
>> the desktop.
>>
>> I'm not really against that change either, but at least in theory we
>> could make fork() work perfectly fine even with VMs and background
>> threads.
> You may regret this if you ever try to build a shared virtual address
> space between GPU and CPU. Then you have two processes (parent and
> child) sharing the same render context and GPU VM address space. But the
> CPU address spaces are different. You can't maintain consistent shared
> virtual address spaces for both processes when the GPU address space is
> shared between them.

That's actually not much of a problem.

All you need to do is to use pthread_atfork() and do the appropriate 
action in parent/child to clean up your context: 
https://man7.org/linux/man-pages/man3/pthread_atfork.3.html

The rest is just to make sure that all shared and all private data are 
kept separate all the time. Sharing virtual memory is already done for 
decades this way, it's just that nobody ever did it with a statefull 
device like GPUs.

Regards,
Christian.

>
> Regards,
>    Felix
>

