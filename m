Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD07AC0382
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C28714AE62;
	Thu, 22 May 2025 04:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="eFFKcUEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E2E97549
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 04:31:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a36abf5df9so3027205f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 21:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747888266; x=1748493066;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gc9/xpX5KkhptHF6kK121wkQdt5R6g+YnU0EK0U87Bs=;
 b=eFFKcUEd/A5KpIywR2iATfEKKlni9U71/4FLxmgHlEX5RUq0A2S4mxuZlOpKmY5HC0
 uyM10WSJY1mMOHUmSJafLcdhlBwPXuxEozt7onpUrBADK2fFtMxnf6ZfK2pSGPdhI2FU
 Z0GM4hB7mXXbgJ54LF0O7e1K7Ol3mhWu8ZoFWgM7sCr7cENk+v9WP4vUwEP6HINUFqMZ
 AXSLKMQgWTSKqH9lL+6gii4J0RcT2OraTNzwPhNeWQ3k3GlKuosWLIYDisY9hGETFMTe
 TRzCwFKT4Jofakp1O2slgGDNguh5WbhAis8B7QOZZ9Q6O41SYYCj9OgJGf7a/tBidfSr
 ogHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747888266; x=1748493066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gc9/xpX5KkhptHF6kK121wkQdt5R6g+YnU0EK0U87Bs=;
 b=RrCEyevlZ8WRldEqgaOlXqdOYJFFWS4lQ+IcBFrl072fyfARm3D7BpHRks1CAzMPCb
 aGOmdhrixAs5kc53IKdqtBrSSs2K0qf3MR2QHzVJCQsKrjkYMzXPNuVjKangta5JhqXq
 n9aXtuVa5Rv9vTZ2qJHRcYap9kBGKg9g132Zf2npRxoYD25clbVrW3sSvqI+7aCI8O7q
 hkXyMMRsTgVWIK+kxrrdjf45fCm33VWUE4U3Z8rviUR5KULD5hAUSbks0qHXEPK7cpTb
 vfIpXCu6NGCUnaISgmehUwqA1ZI32j8UddO+ptSTGugPO0//CKfJzJsx0TapQT2lYUtf
 tX9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8e/pH8xwQwPl/nunAeQz+mI+3ZkghIIM5JhQbVY71aN8M0Rli9mBj7QbmYM/IWptnMVqwRaBDm2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvXtwMT5ptXaQ5ay8v9bPHJUGyzyVuPU/WEbaYGP7uNXhH3FC5
 bfnlfruTQRpV2lDya3VtiBDWGKwRclvhnzbyi5qYLqaiM3Q9zlp1OBTdV4e1/D+vYgw=
X-Gm-Gg: ASbGnctsA8LBBjvWN47xZZGgihKvh+PyqTKXOgyFfJld+kR3RFGRY+KI6W+HQH5jXaF
 cb/cA3PR36gVrGsdkGMNY+u3kKFpJo8Xy06i5vtfa+QrOQWg/3FbdGjjwLvd/8sh1d8K9px/cS+
 gHFpSDeYqVT7MmRU86T8QwhpQQC+keLLLN/FDyPT8NXvRT/tAC2KiZrpKzCb3EJCWjxDA2oPujX
 XLCBGzM3ysv4HdVyAvG+tw4NiAT9HgJDwXR1vp9lZ/V/cjcRL+8/EvBotQ4RkWcd0RYyJuqoUjn
 38Y42WckJX4akVjTv80DdglCzD57bsoueXBd+GslrwpTJiLhoalQFz3zjV8yaNZu9Q==
X-Google-Smtp-Source: AGHT+IGJk41DYbyx8AXXhjnVTYlHow7wrH3TjqCb5Qj7uOKMZaDByvu8EuHKLek0V9zOUrrfYAzWpw==
X-Received: by 2002:a05:6000:2911:b0:3a3:6bff:9735 with SMTP id
 ffacd0b85a97d-3a36bff9995mr12946580f8f.10.1747888265715; 
 Wed, 21 May 2025 21:31:05 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23c07bfsm90925115e9.23.2025.05.21.21.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 21:31:05 -0700 (PDT)
Message-ID: <b1b652c5-199c-4908-af25-ca5006d2bda3@ursulin.net>
Date: Thu, 22 May 2025 05:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <174775327260.81385.8059929394366685323@jlahtine-mobl>
 <b88bb6af-2215-4f1c-8e48-05f36957c6ab@ursulin.net>
 <jdtdaeyiqkgr2uztzo5slfixmnhwf7swa3zjntg5cnn4eb475f@rf346gvalbot>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <jdtdaeyiqkgr2uztzo5slfixmnhwf7swa3zjntg5cnn4eb475f@rf346gvalbot>
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


On 21/05/2025 18:10, Krzysztof Niemiec wrote:
> On 2025-05-21 at 09:06:43 GMT, Tvrtko Ursulin wrote:
>>
>> On 20/05/2025 16:01, Joonas Lahtinen wrote:
>>> (+ Tvrtko, Rodrigo and Jani)
>>>
>>> Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
>>>> Hi,
>>>>
>>>> This series introduces a way for applications to read local memory
>>>> information via files in the sysfs. So far the only way to do this was
>>>> via i915_query ioctl. This is slightly less handy than sysfs for
>>>> external users. Additionally, the ioctl has a capability check which
>>>> limits which users of a system might use it to get information.
>>>>
>>>> The goals of this series are:
>>>>
>>>>           1) Introduce a simpler interface to access lmem information,
>>>>           2) Lift the CAP_PERFMON check on that information, OR provide
>>>>              the administrator with a way to optionally lift it.
>>>>
>>>> The first patch introduces the general mechanism without protections.
>>>> This will effectively lift a capability check on obtaining the memory
>>>> information. The second patch introduces that check back inside the
>>>> _show() functions, but also adds a sysctl parameter allowing to override
>>>> the checks, if an administrator so decides.
>>>>
>>>> I'm sending this as RFC because I have a feeling that there's no
>>>> consensus whether memory information exposed in the patch should be
>>>> protected or not. Showing it to any user is strictly speaking an info
>>>> leak, but the severity thereof might be considered not that high, so I'd
>>>> rather leave it up to discussion first.
>>>>
>>>> If we decide for lifting the check, the first patch is sufficient.
>>>
>>> Nack on that.
>>>
>>> CPU memory footprint and GPU memory footprint have a very different
>>> nature. This was discussed to quite a length, please refer to mailing
>>> list archives.
>>>
>>>> If we
>>>> decide against it, the second patch protects the information by default,
>>>> but with a way to expose it as a conscious decision of the admin. I find
>>>> it a decent compromise.
>>>
>>> No need for the added complexity if we were to add a sysfs.
>>>
>>> If a sysfs is added, it can be made root readable by default but system
>>> admin is free to chown or chmod the file for more relaxed access. Back
>>> in the original discussion time, this was omitted for lack of users.
>>
>> Agreed, no need to complicate with redundant access controls in the kernel.
>>
>>> Even now, userspace/sysadmin could already essentially use setuid helper
>>> process that will only report the memory statistics.
>>>
>>> So I'm not really fully convinced this is needed at all.
>>>
>>> And if it is to be added for the convenience of usersppace, it should
>>> probably then be considered to be a standard interface across DRM drivers
>>> ala fdinfo or cgroups.
>>
>> Cgroup visibility for device memory exists in principle although i915 hasn't
>> been wired up to it.
>>
>> For system memory (integrated GPUs) there is some work in progress around
>> memcg accounting, although I am unsure if i915 would be automatically
>> covered or not.
>>
>> Also going a step back, from MangoHUDs point of view, I don't really see why
>> total GPU memory is very interesting? I would have thought it is more
>> interesting to know how much the monitored client is using, which is already
>> available via fdinfo. Total memory sounds like something which it could
>> leave to interpretation by the entity looking at the traces. (If the
>> monitored client is running alone then total_free =~ total - client, and if
>> it isn't running alone then it doesn't matter, no?)
>>
> 
> They use it to plot the VRAM usage so you have a rough idea of how much
> of the total the client is using. [1]
> 
> [1] https://github.com/flightlessmango/MangoHud/blob/master/src/hud_elements.cpp#L1471-L1485

I get what it does, I just don't see the huge value in plotting the 
total. Nevertheless it is available from the memory query, that part is 
not privileged.

If the query is too cumbersome, for some reason, I could be convinced 
for a total in sysfs but the rest looks too much.

Regards,

Tvrtko

>>>> This change has been requested in these parallel issues for i915 and Xe:
>>>>
>>>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
>>>>
>>>> Thanks
>>>> Krzysztof
>>>>
>>>> Krzysztof Niemiec (2):
>>>>     drm/i915: Expose local memory information via sysfs
>>>>     drm/i915: Add protections to sysfs local memory information
>>>>
>>>>    drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
>>>>    drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
>>>>    drivers/gpu/drm/i915/intel_memory_region.h |   3 +
>>>>    3 files changed, 145 insertions(+)
>>>>
>>>> -- 
>>>> 2.45.2
>>>> _
>>

