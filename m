Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E692693AD66
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F8810E3A8;
	Wed, 24 Jul 2024 07:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="2yV0AozY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25A110E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:48:21 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so56179605e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1721807300; x=1722412100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=krtFy5Mi1BGgzBjcFadwjlZluEt4OAciNF2RWrAZwwg=;
 b=2yV0AozYAtq2bzU/V5DcjZUwmlIefPN9K7On/mRJiwRzEvk+yyIZEEcQght/XD2LE4
 8IQhMf3ngRYa4r2/r3QkN1LYDIJP3KIT51rBm8zhfj5Rqp8Y6nYiz/UtqLoB9MReedlk
 A9MzSA9fungaygsaOreSi3mjuYEVkcN4poNNF1UoqkQGEyOVeRoAibUe0cbb/PMO6r0x
 wnMoQISBUqShXtMzKoRiEiVXgA0tgeIdrLHrsJ21EOqvoJUpwPDriFFoIxjaNAM3sM44
 OlUcYzo+EpLrQwJh6C5DAq0Mm2sa2Sor3yIQfC3f2b6d+uVLXBlmn3LcMkwdASkoWwwd
 bvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721807300; x=1722412100;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=krtFy5Mi1BGgzBjcFadwjlZluEt4OAciNF2RWrAZwwg=;
 b=s/LIBheAJbz4htjrkkKkTlcd/oA1pfMVfXak/OTSldDvHvMh4klukzXQvCjNqCCFYQ
 OQnKPCarCtVxD4smGWVq5Thew/GwZhn2Y6gTymPM/WTowpkXNiS1da+FQal1rvKr9s+t
 o8+NYykh1/voBQ+r4VhhJwPe+Li+9W9BFlKlju/8waz7TMc90tbgyRCHRPFwEvkKUSxm
 Buze1oO9+wpTXVL+EXXwSuqgUEhUOcL8X08Pc/ZM0CsruuSAmeD+ERqbIfx0HYwOG8wv
 5GYjUw3rkfE9sn8/gZEC4s2qeNvI7A87iP37yO/BHwrXfaap10OtTHGJJhlIGVH6fVLJ
 j1zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7TV1u27ATpS7PP9ImcZRpDz7FWP+4g8fDUTM6yelFOBBwvdhBkuQnckTVPsh7JyXKdcNr6DbuTjII4xKwnVTKR3bMrAJ3/sGkdJ4DgrMe
X-Gm-Message-State: AOJu0Yw/myFZCpdSdSHqZdcMAdkAfKrFlXOxFP/gvchcoMtY0mIB0YZt
 Pecz/DohA4Sl8Fvv+n4/K2ghZCVBio5I+CpfA0T7Mtof2nGmgPTNIFEUOhjMy/U=
X-Google-Smtp-Source: AGHT+IHJYQKmvGS93G2a3BT112cIQewhqjoeTVHdu6Fi/DuqndkssZhc6yIX5rxIS/1BJpp+wY8/Zg==
X-Received: by 2002:a5d:6684:0:b0:368:3ef7:3929 with SMTP id
 ffacd0b85a97d-369f09bcef7mr1642716f8f.22.1721807299800; 
 Wed, 24 Jul 2024 00:48:19 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f935dd55sm16759555e9.8.2024.07.24.00.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:48:19 -0700 (PDT)
Message-ID: <4dac0c08-8bd7-44d2-967e-3491d9dd953c@ursulin.net>
Date: Wed, 24 Jul 2024 08:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/i915/pmu: Lazy unregister
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-7-lucas.demarchi@intel.com>
 <be3871bd-fc25-482e-b4d4-91afc4d5b5a5@ursulin.net>
 <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
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


On 23/07/2024 16:30, Lucas De Marchi wrote:
> On Tue, Jul 23, 2024 at 09:03:25AM GMT, Tvrtko Ursulin wrote:
>>
>> On 22/07/2024 22:06, Lucas De Marchi wrote:
>>> Instead of calling perf_pmu_unregister() when unbinding, defer that to
>>> the destruction of i915 object. Since perf itself holds a reference in
>>> the event, this only happens when all events are gone, which guarantees
>>> i915 is not unregistering the pmu with live events.
>>>
>>> Previously, running the following sequence would crash the system after
>>> ~2 tries:
>>>
>>>     1) bind device to i915
>>>     2) wait events to show up on sysfs
>>>     3) start perf  stat -I 1000 -e i915/rcs0-busy/
>>>     4) unbind driver
>>>     5) kill perf
>>>
>>> Most of the time this crashes in perf_pmu_disable() while accessing the
>>> percpu pmu_disable_count. This happens because perf_pmu_unregister()
>>> destroys it with free_percpu(pmu->pmu_disable_count).
>>>
>>> With a lazy unbind, the pmu is only unregistered after (5) as opposed to
>>> after (4). The downside is that if a new bind operation is attempted for
>>> the same device/driver without killing the perf process, i915 will fail
>>> to register the pmu (but still load successfully). This seems better
>>> than completely crashing the system.
>>
>> So effectively allows unbind to succeed without fully unbinding the 
>> driver from the device? That sounds like a significant drawback and if 
>> so, I wonder if a more complicated solution wouldn't be better after 
>> all. Or is there precedence for allowing userspace keeping their paws 
>> on unbound devices in this way?
> 
> keeping the resources alive but "unplunged" while the hardware
> disappeared is a common thing to do... it's the whole point of the
> drmm-managed resource for example. If you bind the driver and then
> unbind it while userspace is holding a ref, next time you try to bind it
> will come up with a different card number. A similar thing that could be
> done is to adjust the name of the event - currently we add the mangled
> pci slot.

Yes.. but what my point was this from your commit message:

"""
The downside is that if a new bind operation is attempted for
the same device/driver without killing the perf process, i915 will fail
to register the pmu (but still load successfully).
"""

So the subsequent bind does not "come up with a different card number". 
Statement is it will come up with an error if we look at the PMU subset 
of functionality. I was wondering if there was precedent for that kind 
of situation.

Mangling the PMU driver name probably also wouldn't be great.

> That said, I agree a better approach would be to allow
> perf_pmu_unregister() to do its job even when there are open events. On
> top of that (or as a way to help achieve that), make perf core replace
> the callbacks with stubs when pmu is unregistered - that would even kill
> the need for i915's checks on pmu->closed (and fix the lack thereof in
> other drivers).
> 
> It can be a can of worms though and may be pushed back by perf core
> maintainers, so it'd be good have their feedback.

Yeah definitely would be essential.

Regards,

Tvrtko

>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/i915_pmu.c | 24 +++++++++---------------
>>>  1 file changed, 9 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c 
>>> b/drivers/gpu/drm/i915/i915_pmu.c
>>> index 8708f905f4f4..df53a8fe53ec 100644
>>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>>> @@ -1158,18 +1158,21 @@ static void free_pmu(struct drm_device *dev, 
>>> void *res)
>>>      struct i915_pmu *pmu = res;
>>>      struct drm_i915_private *i915 = pmu_to_i915(pmu);
>>> +    perf_pmu_unregister(&pmu->base);
>>>      free_event_attributes(pmu);
>>>      kfree(pmu->base.attr_groups);
>>>      if (IS_DGFX(i915))
>>>          kfree(pmu->name);
>>> +
>>> +    /*
>>> +     * Make sure all currently running (but shortcut on pmu->closed) 
>>> are
>>> +     * gone before proceeding with free'ing the pmu object embedded 
>>> in i915.
>>> +     */
>>> +    synchronize_rcu();
>>>  }
>>>  static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node 
>>> *node)
>>>  {
>>> -    struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>>> cpuhp.node);
>>> -
>>> -    GEM_BUG_ON(!pmu->base.event_init);
>>> -
>>>      /* Select the first online CPU as a designated reader. */
>>>      if (cpumask_empty(&i915_pmu_cpumask))
>>>          cpumask_set_cpu(cpu, &i915_pmu_cpumask);
>>> @@ -1182,8 +1185,6 @@ static int i915_pmu_cpu_offline(unsigned int 
>>> cpu, struct hlist_node *node)
>>>      struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>>> cpuhp.node);
>>>      unsigned int target = i915_pmu_target_cpu;
>>> -    GEM_BUG_ON(!pmu->base.event_init);
>>> -
>>>      /*
>>>       * Unregistering an instance generates a CPU offline event which 
>>> we must
>>>       * ignore to avoid incorrectly modifying the shared 
>>> i915_pmu_cpumask.
>>> @@ -1337,21 +1338,14 @@ void i915_pmu_unregister(struct 
>>> drm_i915_private *i915)
>>>  {
>>>      struct i915_pmu *pmu = &i915->pmu;
>>> -    if (!pmu->base.event_init)
>>> -        return;
>>> -
>>>      /*
>>> -     * "Disconnect" the PMU callbacks - since all are atomic 
>>> synchronize_rcu
>>> -     * ensures all currently executing ones will have exited before we
>>> -     * proceed with unregistration.
>>> +     * "Disconnect" the PMU callbacks - unregistering the pmu will 
>>> be done
>>> +     * later when all currently open events are gone
>>>       */
>>>      pmu->closed = true;
>>> -    synchronize_rcu();
>>>      hrtimer_cancel(&pmu->timer);
>>> -
>>>      i915_pmu_unregister_cpuhp_state(pmu);
>>> -    perf_pmu_unregister(&pmu->base);
>>>      pmu->base.event_init = NULL;
>>>  }
