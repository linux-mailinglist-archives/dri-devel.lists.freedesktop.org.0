Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB96A58B9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5410E4CC;
	Tue, 28 Feb 2023 11:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962AE10E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677585522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igXe/9x6jKu5rbYdkW8/4YE+XBhlQH3c260qTWOAdLI=;
 b=BpwUxtSvDWU/Wo7WFKopz5AeFBcw5R08IlKLl3DiyuM8T/icrbdkySbcbW2suS5ZCCCICR
 /x0qHB0qvZNytFKcshBZ3a0fi0pknrDCUVimc/+RwSie0PHlKMxeqjeNQ98c233cy3mXkc
 6nC0s4VoZlYdyar3OL5oFr/3+c9WbXo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-zb_V5yJDMqKOIi6-vmFACg-1; Tue, 28 Feb 2023 06:58:38 -0500
X-MC-Unique: zb_V5yJDMqKOIi6-vmFACg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso3532491wmi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677585518;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=igXe/9x6jKu5rbYdkW8/4YE+XBhlQH3c260qTWOAdLI=;
 b=Jyib8efXAZhjaDRzGFWukGY37DEMafTahLNEkH5xPE7Lyw4McueHpNVyr7mezfnIzY
 LPmMnMmrOxW9zhXf5NKJ/4v+ESpzQh0PUlQus9wXVZnD1VoCGFqN8rKgnL4x+P53qkvI
 8G5DszUinlvxNDVyVUEj0ux48YiiTlQSy+nEifeg/C+IO7zkZd6wfcLJI6nunSFdkCfR
 OQeuramNM22zAIMMMZgnQpdk9em/TowXb5VosizHLzlBTHEOr2WNsRw0TTbdNAePB4U5
 zRedrj9Em/Lmfh62k+owdbnXsElsUTMcBeIvm+r6UJYgA062X7f2+izZpNR6yJUGrBpw
 LRzg==
X-Gm-Message-State: AO0yUKVwudDyMt9UqR9kSbF22DB8s9bFLcgsnIqAIDIcMdS4c4MNIvKG
 nswY0w3w3ZPHLlyRj+pbR90JdA7PPYsrrK4PBC/evTZ2RgpPDm3HlD66fhrxu+h5wDg0fzzL/Vt
 dapqKstpXXu2svfWSLNXX9t06IsDc
X-Received: by 2002:a05:600c:30d3:b0:3eb:376e:2b9c with SMTP id
 h19-20020a05600c30d300b003eb376e2b9cmr1757791wmn.36.1677585517831; 
 Tue, 28 Feb 2023 03:58:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9vfqp+w/Fq0Ru6ZcWshr4cD9JM+oi0fjZfEmOzrz/RJhaLD8ynMHaAjx0sjRa2QEfWdI63KA==
X-Received: by 2002:a05:600c:30d3:b0:3eb:376e:2b9c with SMTP id
 h19-20020a05600c30d300b003eb376e2b9cmr1757776wmn.36.1677585517487; 
 Tue, 28 Feb 2023 03:58:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002c71dd1109fsm9582519wrn.47.2023.02.28.03.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:58:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann
 <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
In-Reply-To: <9631930e-3826-ded7-1a45-1d0a285c5195@suse.de>
References: <20230224180225.2477641-1-robdclark@gmail.com>
 <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
 <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
 <20230228062809.ccyzgnvizh6jidn4@sirius.home.kraxel.org>
 <87a60yywo0.fsf@minerva.mail-host-address-is-not-set>
 <9631930e-3826-ded7-1a45-1d0a285c5195@suse.de>
Date: Tue, 28 Feb 2023 12:58:36 +0100
Message-ID: <87pm9uxaqb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 28.02.23 um 10:19 schrieb Javier Martinez Canillas:
>> Gerd Hoffmann <kraxel@redhat.com> writes:
> [...]
>>>
>>> I think it is a bad idea to make that a compile time option, I'd suggest
>>> a runtime switch instead, for example a module parameter to ask the
>>> driver to ignore any scanouts.
>>>
>> 
>> I don't think there's a need for a new module parameter, there's already
>> the virtio-gpu 'modeset' module parameter to enable/disable modsetting
>> and the global 'nomodeset' kernel cmdline parameter to do it for all DRM
>> drivers.
>> 
>> Currently, many drivers just fail to probe when 'nomodeset' is present,
>> but others only disable modsetting but keep the rendering part. In fact,
>> most DRM only drivers just ignore the 'nomodeset' parameter.
>
> Do you have a list of these drivers? Maybe we need to adjust semantics 
> slightly. Please see my comment below.
>

AFAIK i915 and nouveau do this. But also on the rpi4 only the vc4 display
driver is disabled but the v3d driver used for rendering is not disabled.

So the 'nomodeset' semantics are not consistent across all DRM drivers.

[...]

>> -	if (virtio_gpu_modeset == 0)
>> -		return -EINVAL;
>> +	if ((drm_firmware_drivers_only() && virtio_gpu_modeset == -1) ||
>> +	    (virtio_gpu_modeset == 0))
>> +		driver.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
>
> The kernel-wide option 'nomodeset' affects system behavior. It's a 
> misnomer, as it actually means 'don't replace the firmware-provided 
> framebuffer.' So if you just set these flags here, virtio-gpu would 
> later remove the firmware driver via aperture helpers. Therefore, if 
> drm_formware_drivers_only() returns true, we should fail probing with 
> -ENODEV.
>

Right. Or the DRM aperture helper shouldn't attempt to remove the firmware
provided framebuffer if the DRM driver doesn't have the DRIVER_MODESET set.

> But we could try to repurpose the module's 'modeset' option. It's 
> already obsoleted by nomodeset anyway.  I'd try to make modeset it a 
> boolean that controls modesetting vs render-only. It will then be about 
> the driver's feature set, rather than system behavior.
>

Yes, that could work too. Dmitry mentioned that Rob wanted the compile-time
option to reduce the attack surface area. I don't have a strong opinion on
this, but just wanted to point out that there wasn't a need for a new param
and that the existing module's 'modeset' could be repurposed for this case.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

