Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385A3312D64
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 10:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54ED6E463;
	Mon,  8 Feb 2021 09:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8F36E44F;
 Mon,  8 Feb 2021 09:37:23 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y9so23474141ejp.10;
 Mon, 08 Feb 2021 01:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=h81giqyjbnN0Dtukym4bEFImyhTutcsZ70RU0hu+1zc=;
 b=Dzca006KlNc/HlY4DRVVmvo8kU9IWqgaBT1TwdDO+1d/uzDmcatme77X5SKfrbDbnU
 0yjV4QfrNlxEfaiu9omhHpNJipU/J/lQCql3Kn4TZzj/7jl6ZwtUzFYDYnEzj4EUCfYo
 PBY3CLPaTNCbipBMUk6Ry3wzmWRBUuRJEsWCgTPwEYzrR9FAjVobBuewm1rB90/ja5zQ
 87gQj3MMJiO0Gv9n9ijj0FXVZQTjYQwZZFq1PZBpEpaO4sR4toz+gy3z8d9Mt1Go7C3N
 5U8mOoV6JkRCKjk8LOyIkGBd0HJBiiegme8umZRqs5VAbx02ZtTGR9XMQ3DVSdUrYGTE
 NxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=h81giqyjbnN0Dtukym4bEFImyhTutcsZ70RU0hu+1zc=;
 b=pXULTkupyQMJVF1v0D+iPjXC5U4WMNnsT0xZse0t/o3NdbfzJs4ZbmkzPGiUdILZw9
 V4gql5ioYKdId4kppr7qnuSDB+/yIKs3CQhhTq+doFtc4wbJ8CSsM8n1wVSNepe1Yu73
 fT0ZOBEVQmrb23uuHtZgyI9PUZ/VcTapS7Xn4tkl09YKs3B64gM/4yOqTmeMg41nUKvN
 ZNJJqozQEoESNipy5maa2kS28swA08nE3bxmnhEMszbbVDXMD+jk6gOYe4EqD7B6YelZ
 wlhTyYpNz5FK2chIF3ul8NmyMPsUh8yDAoZjmBRJhRVCM8Y+yXPlPkPQV2c+kIzetFtc
 LA4A==
X-Gm-Message-State: AOAM533dcnQBI74uZ5SU8m1/qosf7oAF82WJ7hFsgso49qcyWe/r1InC
 2fPkW33OW/2c2TbxFRcGi6U=
X-Google-Smtp-Source: ABdhPJyKaDf3z/f2+eyYLjlwTkAz7ZdH2phX2JtU0ObDaAV2+oRy5Lt5POyzt26fTLawkDtvVxu2yw==
X-Received: by 2002:a17:906:4dc3:: with SMTP id
 f3mr15982951ejw.233.1612777041632; 
 Mon, 08 Feb 2021 01:37:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u23sm9101799edt.87.2021.02.08.01.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 01:37:20 -0800 (PST)
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
Date: Mon, 8 Feb 2021 10:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.02.21 um 22:50 schrieb Daniel Vetter:
> [SNIP]
>> Clarification - as far as I know there are no page fault handlers for kernel
>> mappings. And we are talking about kernel mappings here, right ?  If there were
>> I could solve all those issues the same as I do for user mappings, by
>> invalidating all existing mappings in the kernel (both kmaps and ioreamps)and
>> insert dummy zero or ~0 filled page instead.
>> Also, I assume forcefully remapping the IO BAR to ~0 filled page would involve
>> ioremap API and it's not something that I think can be easily done according to
>> am answer i got to a related topic a few weeks ago
>> https://www.spinics.net/lists/linux-pci/msg103396.html (that was the only reply
>> i got)
> mmiotrace can, but only for debug, and only on x86 platforms:
>
> https://www.kernel.org/doc/html/latest/trace/mmiotrace.html
>
> Should be feasible (but maybe not worth the effort) to extend this to
> support fake unplug.

Mhm, interesting idea you guys brought up here.

We don't need a page fault for this to work, all we need to do is to 
insert dummy PTEs into the kernels page table at the place where 
previously the MMIO mapping has been.

>>> But ugh ...
>>>
>>> Otoh validating an entire driver like amdgpu without such a trick
>>> against 0xff reads is practically impossible. So maybe you need to add
>>> this as one of the tasks here?
>> Or I could just for validation purposes return ~0 from all reg reads in the code
>> and ignore writes if drm_dev_unplugged, this could already easily validate a big
>> portion of the code flow under such scenario.
> Hm yeah if your really wrap them all, that should work too. Since
> iommappings have __iomem pointer type, as long as amdgpu is sparse
> warning free, should be doable to guarantee this.

Problem is that ~0 is not always a valid register value.

You would need to audit every register read that it doesn't use the 
returned value blindly as index or similar. That is quite a bit of work.

Regards,
Christian.

> -Daniel
>
>> Andrey
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
