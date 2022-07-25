Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DC57FB50
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45EB8B45A;
	Mon, 25 Jul 2022 08:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C668B45A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658737706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0zkbJ5uNAZ6w7D7/5OYFzAHqKlYGpthK36jvgeNFPo=;
 b=c3RBz3IyZNN7Z1yQ0Xj5ilVkEMYISV1ibCUUu9A6S6Ql7psaXdxjZzwuy+DnKqt1V3nEem
 zorCmB+6eO6Fxda80mgTMvuJCnJde2CKw/ZrwK1yZIkFHT7dfZwJwbRb7n+VCt3AhwcDBf
 aV71Ut97497SLINodfzU4VYypVWuIcs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-dX9_hVkmOaKd0xDhni8udQ-1; Mon, 25 Jul 2022 04:28:25 -0400
X-MC-Unique: dX9_hVkmOaKd0xDhni8udQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x17-20020a05600c21d100b003a32dda6577so3738776wmj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q0zkbJ5uNAZ6w7D7/5OYFzAHqKlYGpthK36jvgeNFPo=;
 b=qxR1OtrVII7oomlrK3Xq1XIXqO/3BPCowi2J4dHAHZ2C/GWcd7wxmuuOQQjL60xmkg
 A6EY/g0Gt6P8Uo/xmC8hir2q6s7yjpllo71UQrzGAuTjxLuDGmHUvOVOqPhkFdqUx4mw
 kFOXMaP4bbMMdKLf7gx9379uvTNX9HDKbsbTXSu+mfHBMUwSTlW1Pu64X2T/JGO1ro8T
 bK0buGiw8f7Tng1n4iB+f4LZ0d/OA7+vO+1QGTkrqsFSjDQzujd/GQSWSPOG8BObN5FC
 KAa5ACk61DtPIabBYQEUokcZv4Bc8ohIatcEUZIaJXZmd1AmfFWCi/QCXDbnWT1EUFPG
 snog==
X-Gm-Message-State: AJIora9DA9k95OOQhcnbf4nD9AejD1YAYmI18okGlVAqNMLEc2Lq3Jzw
 Paw0F8Y3MUBru5aCjndZJPZvzzew2xUMx854Xu4dKGoolxmI6pvypVIvpNPvgnxTJPXdnbiFoym
 TkWtbr1PqD4eHnpSoz5L9yxMlt+Za
X-Received: by 2002:adf:e192:0:b0:21d:62ee:ef10 with SMTP id
 az18-20020adfe192000000b0021d62eeef10mr7207309wrb.693.1658737703703; 
 Mon, 25 Jul 2022 01:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoN91rvLbJedbrTLSwvBLDyo0gKUbnjAGj7duL3XBeKxQ4Q1NJg3fx4ct+nGNsBga5Tzi9fA==
X-Received: by 2002:adf:e192:0:b0:21d:62ee:ef10 with SMTP id
 az18-20020adfe192000000b0021d62eeef10mr7207290wrb.693.1658737703269; 
 Mon, 25 Jul 2022 01:28:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 be13-20020a05600c1e8d00b003a340fb163csm10661071wmb.8.2022.07.25.01.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 01:28:22 -0700 (PDT)
Message-ID: <34162536-6a57-6ff0-e6ab-bfd5fee14451@redhat.com>
Date: Mon, 25 Jul 2022 10:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220724123741.1268536-1-javierm@redhat.com>
 <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
 <38128880-5b47-7ba0-54f3-97c4d6e04028@redhat.com>
 <e66bc2ab-6495-044f-7e37-892de076095a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e66bc2ab-6495-044f-7e37-892de076095a@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/25/22 09:12, Thomas Zimmermann wrote:

[...]

>>>>
>>>> Let make the DRM core more robust and prevent this to happen, by marking a
>>>> struct drm_mode_config as initialized during drmm_mode_config_init(). that
>>>> way helpers can check for it and not attempt to grab uninitialized mutexes.
>>>
>>> I disagree. This patch looks like cargo-cult programming and entirely
>>> arbitrary.  The solution here is to fix drivers.  The actual test to
>>> perform is to instrument the mutex implementation to detect
>>> uninitialized mutexes.
>>>
>>
>> While I do agree that drivers should be fixed, IMO we should try to make it
>> hard for the kernel to crash. We already have checks in other DRM helpers to
>> avoid accessing uninitialized data, so I don't see why we couldn't do the
>> same here.
> 
> Code should stand on its own merits, instead of doing something because 
> something else does it. The latter is what is referred to as cargo-cult 
> programming.
>

Yes, I'm familiar with the concept but was thinking about a different paradigm
when writing this patch that is defensive programming. The question is whether
makes sense for the DRM core to defense from buggy drivers. My opinion is that
if possible it should and we should prevent kernel panics at all costs.

Otherwise, let's say a reboot may crash and never finish unless you have a HW
watchdog or something to bring the system again into a functional state.

But I agree that this particular patch is not nice and in fact I considered to
post it as a RFC at the beginning. 
 
> Doing sanity checks on values is not a problem, but putting flag 
> variables throughout the code to question other code's state is. That's 
> not 'The Way of the C.' There's also the problem that a good part of 
> struct drm_mode_config's initialization is open-coded in drivers. So the 
> meaning of is_initialized is somewhat fuzzy.
>

That is true. It is meant to signal that at least drm_mode_config_init() was
called by the driver.

>>
>> I wrote this patch after fixing a bug in the drm/msm driver [0]. By looking
>> at how other drivers handled this case, I'm pretty sure that they have the
>> same problem. A warning is much better than a kernel crash during shutdown.
>>
>> [0]: https://patchwork.kernel.org/project/dri-devel/patch/20220724111327.1195693-1-javierm@redhat.com/
> 
> I see. I wasn't aware that missing mode_config_init() is a problem. From 
> the linked URL, I cannot really understand how it's related. msm appears 
> to be calling drm_mode_config_init(), right? The idiomatic solution 
> would be to convert msm to managed code. But that's an entirely 
> different patchset, of course. (I only took a brief look at the link TBH.)
> 

The problem as mentioned is that drivers could call the modeset helpers even
when that init function was never called. In this case due the .bind callback
not being executed because a probe failed for a driver of a expected sub-device
failed.

The .shutdown callback is registered when the platform_driver is registered
and that happens at module_init(), so the shutdown would be executed regardless
of the probe (or bind) doing a proper initialization.

I think we need some way to signal drivers about that. Even better we could use
it in the core helpers to not attempt to access struct drm_device data if the
DRM device was not properly initialized.

Maybe the drm_device .registered field is enough and we could reuse that ?

> Here's a suggestion on how to construct the mode-config code in order to 
> make it hard to misuse:  Driver currently open-code the initialization 
> of many fields in drm_mode_config. Expand the arguments of 
> drm_mode_config_init() to take the pointer to the drm_mode_config_funcs. 
> These functions are essential to do anything, so it's a good candidate 
> for an argument. Drivers are easily converted the the new interface 
> AFAICT.  After the conversion, add a test to drm_mode_config_reset() 
> that tests for the funcs to be set.  drm_mode_config_reset() is also 
> essential during initialization or the driver will fail immediately on 
> the first modeset operation. That gives a test for an initialized 
> mode_config without adding extra fields.
>

I agree that all these are nice things to do but I can't see how it could help
in this case. If all these are still done in the .bind callback then it might
never be executed and the .shutdown callback would still happily call to the
drm_atomic_helper_shutdown() which will try to grab uninitialized mutexes and
crash the kernel.

Yes, I already posted a patch for msm/drm to prevent this but as mentioned a
lot of drivers still have that issue. We could audit all drivers and fix them
but I think we need to make the core more robust.

> As a bit of a sidenote: we should consider making 
> drm_mode_config_reset() and the reset callbacks return errors. The reset 
> functions allocate memory for states and if this fails, we have no way 
> of reporting the failure.
>

Yes, agreed.
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

