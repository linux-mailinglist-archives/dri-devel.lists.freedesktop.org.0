Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B55D797100
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3485310E797;
	Thu,  7 Sep 2023 08:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA96E10E09B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694076472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kF37Os6pT1PJ2aRTeP1aQHaXwH+prUD3dlnj+MQOFCE=;
 b=VTFkYo+Tqe0czB10FF8c0TkQL2PfTPCk1gAJhwDhGFjVFZtA6hfIIVUFDQqjZwvLU5LghO
 eleDZ0c6DqrRaG3ELTQfr4/u2emb9Qf7h4VS1BhWmD1fKQ6W4Qvu3020XQ/ASvmLy0dq5u
 GHgJpfoOo2kewCVstJQ7SrGGoZS96PE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-xE4T9eZDPfGzB_3mOPxovg-1; Thu, 07 Sep 2023 04:47:51 -0400
X-MC-Unique: xE4T9eZDPfGzB_3mOPxovg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31f3eaa5c5eso501178f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694076470; x=1694681270;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kF37Os6pT1PJ2aRTeP1aQHaXwH+prUD3dlnj+MQOFCE=;
 b=DW5gmg/3ZtVDJsuZ13Q7bPtwxcDc1gQgtnwNUZt7/VyMC7npETyfano3G3ylJk25Zp
 SqTD2/qnyKCb0rBnBAY+J+diofdnoQkfbAna7G4xPvNT0xn9mIsjvzOMEoVEcwi10Zs/
 gcLdXaiIkSt73Ro9q4+yKon2ioSiIDammDnNJQrlYKcjzdiywxUm1s/Cp5c+moEqJ5s+
 oFZqN0n4rvRAlWKMz0Ns9IN5MmCe48M7T0yoTEdb+tiWgSpXSNWwp2SqT3f3wk7/jUVj
 B2vxo0Mfog/V7k/h73+HmLKnXZtV4dFrhmiYLUVED1d7mB9vVNaTPxJe59gDN9VHiaFp
 Vg3Q==
X-Gm-Message-State: AOJu0YwvmbfrLd+caypx+nmjnZ21xA2sIDIfvmjX9aBL7mq9JlJeCv2X
 EdEkYuxKoZhVUMyJJ14o3vWiZmK7DgC8Z259ogifTmzWvhFKY3L8kJlLb/fWeImc+mvDszVccHJ
 bpF2nQj+STHyeLLpV6WOQXGIZbeyE
X-Received: by 2002:a5d:4f0a:0:b0:31a:d7fc:28f with SMTP id
 c10-20020a5d4f0a000000b0031ad7fc028fmr4236735wru.19.1694076470446; 
 Thu, 07 Sep 2023 01:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaR5bvde5g0wWiq6Fboo20IBKUE4ldGPwfZnLzZV0LVIQJIY8kyRGcYcYOIxdDbryuK0GDog==
X-Received: by 2002:a5d:4f0a:0:b0:31a:d7fc:28f with SMTP id
 c10-20020a5d4f0a000000b0031ad7fc028fmr4236720wru.19.1694076470110; 
 Thu, 07 Sep 2023 01:47:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6844000000b003197b85bad2sm22782849wrw.79.2023.09.07.01.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 01:47:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding
 <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <dd898338-813f-df63-4255-986903aa7cb6@suse.de>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
 <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
 <ZPmD5WNZzz279qZ7@orome> <dd898338-813f-df63-4255-986903aa7cb6@suse.de>
Date: Thu, 07 Sep 2023 10:47:49 +0200
Message-ID: <87tts62wui.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>> That's a good point. However I recall from earlier attempts at doing
>> something like this in Nouveau (although this is now very long ago) that
>> it's not very easy. The problem, as I recall, is that the driver is a
>> singleton, so we would essentially be supporting either modesetting or
>> not, for any device in the system.
>
> Take a look at struct drm_device.driver_features. It let's you clear the 
> flags that your device doesn't support.
>
> https://elixir.bootlin.com/linux/v6.5/source/include/drm/drm_device.h#L128
>

That sounds indeed as the best approach and I see that at least i915 does it:

https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/i915/intel_device_info.c#L418

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

