Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58196C1C5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 17:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0153B10E6B6;
	Wed,  4 Sep 2024 15:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="OGg3PQ0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD7610E706
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 15:08:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso904143a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1725462533; x=1726067333;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xt7/dumBakT417b0oXYBQmu9BLkkHEF7YXnAg70DjBk=;
 b=OGg3PQ0gN7o+ILeY5OMfEYnP5QWM/CkwcTTsNPGGZZmX/f64bK22Mf52YMyolX06tq
 A7jRMBbQezymgFf9yRhnvXIXZ3X8QA7TiOxofeP0I6A0dBNErZ1wnlZ51mLnsM6joDBs
 X6PYCMSTa8KguYecH1CoZd+8AVx/4TY418ot+qYFAWe4BNuLHNvHDzTWraE6gKOmiTNv
 HNxu7iARVfNH1Oo2D3CEu5xxC/M7sZrlXQD/D35lpMebBT1bopu/cJO9WNQd+beFjIsW
 0C2dZHSTbS9q5EaUk1b69ZBKWfFdc+HpoXL973wf6oRAp0MklW8IuUB8XpZ1bzcam7ef
 wH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725462533; x=1726067333;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xt7/dumBakT417b0oXYBQmu9BLkkHEF7YXnAg70DjBk=;
 b=ZfpYfZClbU+frHCSJpU+8y6nPCvG5WwoK6k5e/7+/C8RTeAZHfxORG6FHRdyKndO2R
 ny80hHESbI5ox+JHYMm+ci0Z06Ckzx2N+24S/K9SyPW2218UTOXvOIEcALbMOxfThkee
 vzxBj+TzlYegqmxG4if5oSIbRxMrSYavUDWut3qT/Mwe0GYlsX3cgxk92bmUN4ZpSbNV
 80yG0bcXJwbavoltnkbHK11R1ZOJrv7v6KRRnEmPEBX8WhUKK+16iZdHcOYztHvQpVW0
 ZpXsu3+9rrlFkPdgizbD9AixBNLgWeNKYeXhgMu6twevbDU5VAcgrs6hkimtsTCLI49A
 HL0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh9tHx2oJYvXjSnuXo8WNwOBxpcsXQZ7krYCXHFtmpkoxdGlmEjJ4WnimWDTJaBj07NlQz30zmHEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrgpMXrc6Z0LfpdlWmYcPhswGptT8KytG+SEsEwhPhR8ZKvz5d
 /6JWjkfqWyIuR8jfTpp6gNDRXYhtxdGUDjKAHL3VAOYPpDItkx1r+9k1qtnExj8=
X-Google-Smtp-Source: AGHT+IG5tr1wxXURxI8qCJ381tO0rAbvgD+tCDpRQIpbo1EYpxQmTZ5b9TH+iMZQYAg6bl2PFOOTqA==
X-Received: by 2002:a05:6402:2742:b0:5c2:70a2:5e41 with SMTP id
 4fb4d7f45d1cf-5c270a25e94mr3643331a12.28.1725462532110; 
 Wed, 04 Sep 2024 08:08:52 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:74:3d01:c8:aa24:3895:878f?
 ([2a0a:ef40:74:3d01:c8:aa24:3895:878f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a69efsm23830a12.96.2024.09.04.08.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 08:08:51 -0700 (PDT)
Message-ID: <df587dc8-4967-4349-bedc-738fa6941bce@ursulin.net>
Date: Wed, 4 Sep 2024 16:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local> <ZtheoXODm_6AFgcV@ashyti-mobl2.lan>
 <87y147qygt.fsf@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <87y147qygt.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 04/09/2024 15:34, Jani Nikula wrote:
> On Wed, 04 Sep 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>> Hi Sima,
>>
>> On Tue, Aug 27, 2024 at 07:05:05PM +0200, Daniel Vetter wrote:
>>> On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
>>>> The i915 driver generates sysfs entries for each engine of the
>>>> GPU in /sys/class/drm/cardX/engines/.
>>>>
>>>> The process is straightforward: we loop over the UABI engines and
>>>> for each one, we:
>>>>
>>>>   - Create the object.
>>>>   - Create basic files.
>>>>   - If the engine supports timeslicing, create timeslice duration files.
>>>>   - If the engine supports preemption, create preemption-related files.
>>>>   - Create default value files.
>>>>
>>>> Currently, if any of these steps fail, the process stops, and no
>>>> further sysfs files are created.
>>>>
>>>> However, it's not necessary to stop the process on failure.
>>>> Instead, we can continue creating the remaining sysfs files for
>>>> the other engines. Even if some files fail to be created, the
>>>> list of engines can still be retrieved by querying i915.
>>>>
>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>
>>> Uh, sysfs is uapi. Either we need it, and it _must_ be there, or it's not
>>> needed, and we should delete those files probably.
>>>
>>> This is different from debugfs, where failures are consistently ignored
>>> because that's the conscious design choice Greg made and wants supported.
>>> Because debugfs is optional.
>>>
>>> So please make sure we correctly fail driver load if these don't register.
>>> Even better would be if sysfs files are registered atomically as attribute
>>> blocks, but that's an entire different can of worms. But that would really
>>> clean up this code and essentially put any failure handling onto core
>>> driver model and sysfs code.
>>
>> This comment came after I merged the patch. So far, we have been
>> keeping the driver going even if sysfs fails to create, with the
>> idea of "if there is something wrong let it go as far as it can
>> and fail on its own".
>>
>> This change is just setting the behavior to what the rest of the
>> interfaces are doing, so that either we change them all to fail
>> the driver's probe or we have them behaving consistently as they
>> are.
>>
>> Tvrtko, Chris, Rodrigo any opinion from your side? Shall we bail
>> out as Sima is suggesting?
> 
> Are there any causes for sysfs creation errors that would be acceptable
> to ignore? I didn't see any examples. Or is this just speculative?

I think it is speculative and that the reason for "carry on on failure" 
was probably simply because there aren't any real world reasons any 
would ever fail. Either a programming error or kernel out of memory on 
driver load, and neither of those sounds interesting.

I suspect historically it was probably deemed simpler not to bother with 
any unwind or such, and that is the only reason i915_setup_sysfs() 
returns void.

In this context I don't see a big ROI in making someone work on 
implementing a driver load abort here, but also don't think it would harm.

IMO it would be fine to tie the decision with the fate of dynamic CCS 
engines. If that will go in then it definitely more than makes sense to 
propagate all errors to the entity doing the sysfs write.

Regards,

Tvrtko

> IMO fail fast and loud. We get enough bug reports where there's some big
> backtrace splash copy-pasted on the bug, but the root cause happened
> much earlier and was ignored.
> 
> BR,
> Jani.
> 
> 
