Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B855D84BD0D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 19:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551F3112D55;
	Tue,  6 Feb 2024 18:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g690Ef4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358510FD65;
 Tue,  6 Feb 2024 18:42:56 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33b40208735so1519601f8f.3; 
 Tue, 06 Feb 2024 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707244975; x=1707849775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JcYd3aRpfgCUSG1LIYQnSsuSSC3YGgnUABVKV+senFA=;
 b=g690Ef4zq3rRroGfEhL2OOMWFuFRVXFM37mPAa5usOSRoAQmhzOvsk1GNgrY88x4vg
 +3Sp0TsqSKrhiac0oHnB841MtDod741JQbLmUl8Rv78MbFt1CuXMHVv/dRB69OoJGHgM
 4sAzFASDDWb/K8BCzDrEBh/ie/Ca/BzuNrZCsr8V7i3Qstz4mEKjVaU31f5qJlX4Ro5W
 4hf+savFDnyacCtl//xJJM/KuyEa87RSIrxNo9D2z3TMSbIOQlD1EKY+2MKT9oHWWwZL
 AFBMJlNjdUh+1lmKadbYj9vyMLxv1lMhWsxzgcjKHSBSGfdC0TadlgNK2ABzyOC0sXFI
 1oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707244975; x=1707849775;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JcYd3aRpfgCUSG1LIYQnSsuSSC3YGgnUABVKV+senFA=;
 b=u96fa/ARwZXq1HSsqOn13htYVQEpVbFVeVdo+wjYP/fOYFFnqi4kFDsWzPSZjAvfG4
 rDGtjy1kpcCE7cpOBqIo857uS76mASD3e2+GTNzebgrsR5BogCUkN9w0ooyGqoI1njeL
 NCF35En9dp/A3mbqD9f6b6Ocz9LNe69Np5aWIvUbqf+BqSboiwJRQM7BMdMHYSQwz0QZ
 PPZFnxU8ACF0SLUriRkKuvKJA8TR8s4rFIkVnJvaRKU2kCYpeZOcrEA8HxlwAEE9J7fz
 LHjXMJEND36etAozCCAOGSSMaerMgwK3iFixRdcfRZ4HxamF7KoD0+w4m3opuS0mzmb5
 4pMQ==
X-Gm-Message-State: AOJu0YzwzV6Z7rqMW9mQUK9IxX8+bdqeraGnnQchA72/Zypl1ICnYIeY
 Ai/B9+WNkr0q2gLotKzZ6cwus7abJ/t3+So3P0WZiaqrqe1LfQjlMuAQcXtm
X-Google-Smtp-Source: AGHT+IFtMiHNSHvx8KI/0xWb8L1QJIfX69P8hOKwZtnEAwxcw9gDu8J/XoZUlF6EE2Dq1ZZ0UKJL+A==
X-Received: by 2002:adf:e9c2:0:b0:33b:1494:e4cd with SMTP id
 l2-20020adfe9c2000000b0033b1494e4cdmr1923628wrn.3.1707244974770; 
 Tue, 06 Feb 2024 10:42:54 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXF70vsTfTExShWiaK8oLQuWyCr/fKtj89R5eL2A4ujeldZ9kz/oaFGgySfBaS4vKgSg0p4m3+Rh8Q8Z7doJWNT8KpGs1T5B+6GQt6YXezuphuC++2lmKZaqhzB6cPzvPtwvYV5J+XAzWUVqIWwwHJ9ZHxNETOK8qobyvt4z8TAJis0/NIH9Nw9qOZc2Wao0ceTTDtrIyWcAXu5TRlo8lIyL4Pb/LoQEydAvMwVFHFopActFvRy79coIjeh/wWFnq9HyLVe+yUyby9zZ8GIq8hZ/9UsswTLzMmYl3LMcwbgNodGAyRteb85nXvXMaGpTS+Ok2N6J6Xg/eAuF2GpLekpMbmzMZkPu8kn39Xaps6IugWFjStek33DfPpW72MWhRROMSnbAAeXRvkQ4pwBsHC/cz6VzI96EppEhaJif+If/85PT2i/V8z9tyvi0HFNUYNMix8ZSeY47cyaY3vKiaKgnvqElbmJtvrjsVdStTa0MWdyj05RfklUJtuVW4eTE9rLb0MvIHvx11lx91LKScadS8PSgraft4mIeESMXrT358eE2uGGgwKyIkPUlspHSARdsWYvN3ns7metDHICypAKroZsbRmMwN97zokrjn6sBEVkNn/bWAd1dbKZN2eDGxV+BPmHyOyJ5SZnTf65q6TuKWUGICMno0HhksgDckTH0d4qbR/DeO667ldbpPCWugFKbMf+rR/7dR57ItMbhBqPTF2Eb+omDk+KE5/A3UfBxbE0dSjOckRYgKEsHrvWY2xvCq+6OOfChfk+GGc=
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a5d514f000000b0033afe6968bfsm2704594wrt.64.2024.02.06.10.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 10:42:54 -0800 (PST)
Message-ID: <051a3088-048e-4613-9f22-8ea17f1b9736@gmail.com>
Date: Tue, 6 Feb 2024 19:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: wire up the can_remove() callback
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Shi <alexs@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
 <20240202222603.141240-3-hamza.mahfooz@amd.com>
 <2024020225-faceless-even-e3f8@gregkh> <ZcJCLkNoV-pVU8oy@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZcJCLkNoV-pVU8oy@phenom.ffwll.local>
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

Am 06.02.24 um 15:29 schrieb Daniel Vetter:
> On Fri, Feb 02, 2024 at 03:40:03PM -0800, Greg Kroah-Hartman wrote:
>> On Fri, Feb 02, 2024 at 05:25:56PM -0500, Hamza Mahfooz wrote:
>>> Removing an amdgpu device that still has user space references allocated
>>> to it causes undefined behaviour.
>> Then fix that please.  There should not be anything special about your
>> hardware that all of the tens of thousands of other devices can't handle
>> today.
>>
>> What happens when I yank your device out of a system with a pci hotplug
>> bus?  You can't prevent that either, so this should not be any different
>> at all.
>>
>> sorry, but please, just fix your driver.
> fwiw Christian König from amd already rejected this too, I have no idea
> why this was submitted

Well that was my fault.

I commented on an internal bug tracker that when sysfs bind/undbind is a 
different code path from PCI remove/re-scan we could try to reject it.

Turned out it isn't a different code path.

>   since the very elaborate plan I developed with a
> bunch of amd folks was to fix the various lifetime lolz we still have in
> drm. We unfortunately export the world of internal objects to userspace as
> uabi objects with dma_buf, dma_fence and everything else, but it's all
> fixable and we have the plan even documented:
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#device-hot-unplug
>
> So yeah anything that isn't that plan of record is very much no-go for drm
> drivers. Unless we change that plan of course, but that needs a
> documentation patch first and a big discussion.
>
> Aside from an absolute massive pile of kernel-internal refcounting bugs
> the really big one we agreed on after a lot of discussion is that SIGBUS
> on dma-buf mmaps is no-go for drm drivers, because it would break way too
> much userspace in ways which are simply not fixable (since sig handlers
> are shared in a process, which means the gl/vk driver cannot use it).
>
> Otherwise it's bog standard "fix the kernel bugs" work, just a lot of it.

Ignoring a few memory leaks because of messed up refcounting we actually 
got that working quite nicely.

At least hot unplug / hot add seems to be working rather reliable in our 
internal testing.

So it can't be that messed up.

Regards,
Christian.

>
> Cheers, Sima

