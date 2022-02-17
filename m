Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612234BA59E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A0510ECDD;
	Thu, 17 Feb 2022 16:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FAA10EC27
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:21:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a23so8544762eju.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DForfRnLwwnXduWv7pqOZNccFubmVw5bTqYdaZSmmMw=;
 b=Pb/AzPxSe22ghqMXbZYpZ5d+l2fDgDw3kNatdzvkFxy1fF4TmxetKp2MQIZIbo1zNX
 4YdvI0Lnd5YKvDRdrdwMW4S3YA/ntdNcQcqxphljojhS5nSiSECdGeran97F0wdpV760
 vAc2lJiPApvKXL4CM223ACwHfEpX0k6mLwwYAMHptQfLA6WyGEAaU/Yf+Q/E/lSFmffU
 LfrLQ/XxlsZR8m6SRQBgOULLYW5n56nEm2cpl3nK0+Vq/PFUirvBbuYusI6CN2aZXlHq
 6bS3/AC2XKz20pcRHgywtAihlk9f7auVCI5g9R5KRow+HgjpiR7Y2FW7Re26Wi5UaqKS
 UjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DForfRnLwwnXduWv7pqOZNccFubmVw5bTqYdaZSmmMw=;
 b=Rp0hwfMUHhQfBvx0mqppFXKdUPjcgx0P88aA8/1SeTb9PQJbgNXTIVKR4RMi3EVMW3
 lU37q3HHq6qL9qhNjv//vD2xZJGJ93KjHbT4msTsOvZ9XYYIZI7UXFo30F14uKCdvpRH
 RNwvRkh4pLeRc6TR8L0Qhb0+ucHl2zRV2z9nR+Zd0aCgSMSMc5MYfbuseBtGH4oUbLga
 TYCqGalmDSVzQcGT6x9v2WwmMcE4FKbWaoNtN+oJgpe01iiQVQkwa8dYYb9N3jsHnbVo
 Tx26Eqd871uF17Vm9NyPrrPG4TFddHkwaFmRHpeztGOEDJuNAph3meAOgzREWNiK1I7m
 DfQA==
X-Gm-Message-State: AOAM530sLcFi8uprdJeBmvGeBFsvsRkKwbbOFXOsWqgVV5bGCPQ2YIw4
 vYm6L2myLE3Ch4ON+qiegnE=
X-Google-Smtp-Source: ABdhPJyjU5pLyn9ipTJJsTm1EuSFYs/qledmzIu5jwnqn3cnCeqYY1Wn4HRuKjvE5OKo1D4DI7lHcw==
X-Received: by 2002:a17:907:3c7:b0:6cf:8e46:617c with SMTP id
 su7-20020a17090703c700b006cf8e46617cmr2883137ejb.557.1645114913546; 
 Thu, 17 Feb 2022 08:21:53 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id l12sm1303112edt.1.2022.02.17.08.21.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Feb 2022 08:21:53 -0800 (PST)
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, tomba@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <be4e1cd8-a994-303d-9424-14439ce1f7d4@ideasonboard.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <47dbc690-bff2-8839-f01f-9287403a7562@gmail.com>
Date: Thu, 17 Feb 2022 18:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <be4e1cd8-a994-303d-9424-14439ce1f7d4@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 17.02.22 г. 15:03 ч., Tomi Valkeinen wrote:
> Hi Ivaylo,
> 
> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
>> This patch series fixes excessive DMM or CMA usage of GEM buffers 
>> leading to
>> various runtime allocation failures. The series enables daily usage of 
>> devices
>> without exausting limited resources like CMA or DMM space if GPU 
>> rendering is
>> needed.
>>
>> The first patch doesn't bring any functional changes, it just moves some
>> TILER/DMM related code to a separate function, to simplify the review 
>> of the
>> next two patches.
>>
>> The second patch allows off-CPU rendering to non-scanout buffers. 
>> Without that
>> patch, it is basically impossible to use the driver allocated GEM 
>> buffers on
>> OMAP3 for anything else but a basic CPU rendered examples as if we 
>> want GPU
>> rendering, we must allocate buffers as scanout buffers, which are CMA 
>> allocated.
>> CMA soon gets fragmented and we start seeing allocation failures. Such 
>> failres
>> in Xorg cannot be handeled gracefully, so the system is basically 
>> unusable.
>>
>> Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
>> fragmented with time, leading to allocation failures.
> 
> I think this is just hacking around the problem. The problem is that 
> omapdrm is being used by some as a generic buffer allocator. Those users 

Well, the user of omap_bo interface I know is xf86-video-omap. Unless if 
by users you mean 'kernel users' which I know none.

I think that if 'we' are to teach xorg omap DDX (or any other user in 
that regard) to use GPU driver allocator for non-scanout buffers and 
omapdrm for scanout, it will become a mess. Not impossible though, just 
way more complicated than the $series. Also, why do omapdrm allow 
allocation of non-linear buffers and CPU (userspace) access to them, but 
refuses to export them to kernel drivers? Isn't that the whole point of 
DMABUF stuff? This is not consistent to me. The series fixes that 
inconsistency, nothing more.

> should be changed to use a their own allocator or a generic allocator. 

SGX driver/userspace has and uses its own allocator, however, I think 
there is more than that - what about TILER/VRFB? Do you say that SGX 
userspace shall be smart enough to requests TILER buffers from omapdrm 
when scanout buffer is requested and use its own allocator when not?

Actually I was thinking about something like that, and it is achievable 
now we have:

https://github.com/maemo-leste/sgx-ddk-um/blob/master/dbm/dbm.c (REed 
SGX 1.17 ddk gbm backend)

> And we could then drop the OMAP_BO_SCANOUT flag, as all buffers would be 
> scanout buffers.
> 

And what about OMAP_BO_TILED_XX stuff? To me this is even more of a 
hack, but it is what it is.

Do I get it correctly that you want to get rid of omap_bo_new/_tiled and 
have only dumb buffers available in omapdrm? TBH this would be great, 
however I still don't see how a TILER/VRFB buffer would be allocated, 
given that flags in drm_mode_create_dumb is not used anywhere in the 
kernel(AFAIK). Unless all scanout buffers are allocated through 
TILER/VRFB (which is a good idea IMO).

> Or do we have a regression in the driver? My understanding is that this 
> has never really worked.
> 

There are couple of patches in omapdrm that change around BO flags and 
their meaning so I think there is a regression, as the same 
userspace/DDX on linux 5.9 results in only 2 linear buffers being 
allocated, but as SGX driver has different version as well, I can't be 
100% sure without going through a lengthy assessment of SGX 
driver/omapdrm code and patches since 5.9. Which I am not going to do as 
I don't see what the benefit will be.

Please consider this patch series as a fix to an inconsistency, as it is 
merely that, it does not really bring any new functionality in terms of 
what is allocated.

Thanks and regards,
Ivo
