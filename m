Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B997862F317
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362D610E233;
	Fri, 18 Nov 2022 10:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B17210E233
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668769099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2T5qd6feq3zDZNlT/UGmyIZ8zzHN1ErfKlpUTQ0WNcE=;
 b=bJzkkTZGurswbtFDQfDTdu4qres4Lb723sCik0yqPVfYNx7+RfQlck0/mc7hkJphnwUv7d
 zWFh63rsUxIvTeg4TtcCCQtmwaCcJMtw2l2RBwzWlzdZkhOEgVR6ZbEANVsZ5sh+v3t/Hz
 PwLDsI0Wa+JzF7vfi/dPLjIDR8XPFzQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-gW8W530YPlu-b984PYaTQw-1; Fri, 18 Nov 2022 05:58:17 -0500
X-MC-Unique: gW8W530YPlu-b984PYaTQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso1434619wrb.18
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 02:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2T5qd6feq3zDZNlT/UGmyIZ8zzHN1ErfKlpUTQ0WNcE=;
 b=vRzgJ19F/gIhGJCoR1g28KvoXjeKxDqloEPep6LvT47ZXyk6hF3j5iYNEbuWcOky0M
 STQXkypgMtdz23Q4yIaF3YuG+o4KbRGRubyDABWK2AJVyhCs5Woty9Nkb4hSKD6vlDsA
 ZqKHL6E28/kAy4wvISPj/WLwBNgSzrM0rAOytDIeyFEWjh6DU0aE4YrQ7z5mGKQKc9Fv
 HqqVlvQtrhe1QsPGOzJp2pUXe/zmFhX5iZaM/vPvB8kutrCsZj0XaVsu6d8paJqY/pN3
 +TdeD3dXrv9FyDxnFLfcSM6dagnIGZXQ1QPsjrqPISy/7ty5EE2CIt97OuUYBoDu67Mo
 5d/w==
X-Gm-Message-State: ANoB5pks5S0/gUhZALoHUMpnj4RNWPELyCgWNCU+3Pi2Fg/oN5YM80L6
 8Sw94c2U69krFYaabV+UBLI1/Nw4KlwTqHyEkrpZZZfLzHY4E3h0Lb+AYDugZYdcXxuwnf4mY6f
 /xACMwQROGfzvgC8R1dlpmpiu7l1E
X-Received: by 2002:a05:600c:3d8f:b0:3cf:6a4c:af8b with SMTP id
 bi15-20020a05600c3d8f00b003cf6a4caf8bmr8387189wmb.115.1668769096401; 
 Fri, 18 Nov 2022 02:58:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EX1ezokQ/xV2/vooDpAF544GPsminjekyndTqx1XMBevmyEmo0eOdVIcwrh9ArNhlB9ScOA==
X-Received: by 2002:a05:600c:3d8f:b0:3cf:6a4c:af8b with SMTP id
 bi15-20020a05600c3d8f00b003cf6a4caf8bmr8387171wmb.115.1668769096148; 
 Fri, 18 Nov 2022 02:58:16 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 23-20020a05600c229700b003cf75213bb9sm8275081wmf.8.2022.11.18.02.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:58:15 -0800 (PST)
Message-ID: <d3a98578-ff01-8487-60c3-86b14b41f514@redhat.com>
Date: Fri, 18 Nov 2022 11:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: DRM-managed resources / devm_drm_dev_alloc leaking resources
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20221117165311.vovrc7usy4efiytl@houat>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221117165311.vovrc7usy4efiytl@houat>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 11/17/22 17:53, Maxime Ripard wrote:
> Hi,
> 
> After trying to get more kunit tests for KMS, I found out that the
> recent kunit helpers we merged to create a DRM device [1] are broken and
> won't free their device-managed and DRM-managed resources.
> 
> With some help from Thomas, we've dug into this and it turns out that if
> we allocate a device with root_device_register, initialise our drm
> device with devm_drm_dev_alloc(), register it using drm_dev_register(),
> unregister it using drm_dev_unregister/drm_dev_unplug and then remove
> the parent device, neither the device managed nor the DRM managed
> actions are run.
> 
> root_device_register initializes the device by eventually calling
> device_initialize() which sets the initial reference count of the root
> device to 1 [2]. devm_drm_dev_alloc() then comes in, drm_dev_init() will
> increase the root device refcount [3] and initialize our DRM device to 1
> [4]. drm_dev_register(), through drm_minor_register() and device_add(),
> will increase the root device refcount [5].
> 
> When unrolling things, drm_dev_unregister(), through
> drm_minor_unregister() and device_del(), will give up its reference [6].
> root_device_unregister(), through device_unregister(), will also give up
> its own [7].
> 
> So we end up with this for the reference counts:
> 
> +------------------------+-------------+------------+
> |         funcs          | root device | DRM device |
> +------------------------+-------------+------------+
> | root_device_register   |           1 | N/A        |
> | devm_drm_dev_alloc     |           2 | 1          |
> | drm_dev_register       |           3 | 1          |
> | drm_dev_unregister     |           2 | 1          |
> | root_device_unregister |           1 | 1          |
> +------------------------+-------------+------------+
> 
> If we go back to the list of reference taken, the root device reference
> and the initial drm_device reference, both taken by devm_drm_dev_alloc()
> through drm_dev_init(), haven't been put back.
> 
> If we look at the drm_dev_init code(), we can see that it sets up a
> DRM-managed action [8] that will put back the device reference [9]. The
> DRM-managed code is executed by the drm_managed_cleanup() function, that
> is executed as part of a release hook [10] executed once we give up the
> final reference to the DRM device [11].
> 
> If we go back a little, the final reference to the DRM device is
> actually the initial one setup by devm_drm_dev_alloc(). This function
> has superseded drm_dev_alloc(), with the documentation that we do need a
> final drm_dev_put() to put back our final reference [12].
> 
> devm_drm_dev_alloc() is a more convenient variant that has been
> introduced explicitly to not require that drm_dev_put(), and states it
> as such in the documentation [13]. It does so by adding a device-managed
> action that will call drm_dev_put() [14].
> 
> Device-managed actions are ran as part devres_release_all() that is
> called by device_release() [15], itself being run when the last
> reference on the device is put back [16][17][18].
>

Thanks a lot for the write up. It was very informative and detailed.

> So if we sum things up, the DRM device will only give its last root
> device reference when the last DRM device reference will be put back,
> and the last DRM device reference will be put back when the last device
> reference will be put back, which sounds very circular to me, with both
> ending up in a deadlock scenario.
>

So my conclusion after looking at this is the same than your, that the
drivers would need to signal somehow to the DRM core when a DRM device
won't be used anymore and drop the final reference to the DRM device.

That is, I don't think we can get away of drivers not calling either
drm_dev_put().

I think that we should try to simplify the DRM register and release API
and make very clear in the documentation what should be used. Right now
for example as you mentioned we have both drm_dev_unregister() and
drm_dev_unplug() but AFAICT the only difference is that the latter does
a sync to protect critical sections during drm_dev_{enter,exit}().

The drawback is that the DRM device will be marked as unplugged before
drm_atomic_helper_shutdown(), but is this really a problem in practice?

Maybe we can just rename drm_dev_unplug() to drm_dev_unregister() and
drm_dev_unregister() to __drm_dev_unregister(). That way, the register
path could always be:

   devm_drm_dev_alloc()
   drm_dev_register()

and then in the release path:

   drm_dev_unregister()
   drm_dev_put()

making both DRM-managed and device-managed resources to always work.

> I've added two kunit tests that demonstrate the issue: we register a
> device, allocate and register a DRM device, register a DRM-managed
> action, remove the DRM device and the parent device, and wait for the
> action to execute. drm_register_unregister_with_devm_test() uses the
> broken(?) devm_drm_dev_alloc and is failing.
> drm_register_unregister_test uses the deprecated drm_dev_alloc() that
> requires an explicit call to drm_dev_put() which works fine.
>

Great. In my opinion we should add these Kunit tests even when they are
exposing an issue in the devm_drm_dev_alloc() helper.
 
> It's also worth noting that Thomas tested with simpledrm and it seems to
> work fine. Using a platform_device instead of the root_device doesn't
> change anything to the outcome in my tests, so there might be a more
> subtle behaviour involved.
>

That's strange because AFAICT simpledrm is basically doing the same than
your failing tests. I tried to look at the differences but couldn't spot
anything evident...
 
> Thanks,
> Maxime
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

