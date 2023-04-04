Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA806D5E59
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D3C10E1C7;
	Tue,  4 Apr 2023 10:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91110E1C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680605760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Svw1oSeBp4w881PZdb3WIJds4gAfMl/RKNvjWtrEHsQ=;
 b=E8/8e54mIPQpSTETrzEgep00WZ19GEQannglJJHEVszvp4lJ3vtilUJlpD8Wguf9ygfzdw
 W86Us1mni5rwJjWUClAkhiXsjkI76gN7jhbSgc7hmpboaIPUODWXmsZKpJ1v4GO5gOYyq5
 L8hyahG6Rmd7MV6P41bDzrBOqMXSjNo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-Oa-PuRB9POmnPYLYtBfv3g-1; Tue, 04 Apr 2023 06:55:59 -0400
X-MC-Unique: Oa-PuRB9POmnPYLYtBfv3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg33-20020a05600c3ca100b003ef6d684105so13321047wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 03:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680605758;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Svw1oSeBp4w881PZdb3WIJds4gAfMl/RKNvjWtrEHsQ=;
 b=1nqlx+caVUnBMuyemIh+kY1xvlf2NeyzOzJhFknAnFOG2NkgVFT7A7B6lmmnn16Pgn
 /S4mdqeHiamgd9cpopxOCIUzA7vyfUYxSHqPed/PrGYWINOE60MgdB6G5VPJ1PvbrwtL
 kZDj20T7g1Wlz2DMmCtPiZi/gAFb1l3C+YzgMedNgTV9s01p6I78p78rQGQeG4ZUWOki
 RderJCs4j7CfXJeFf/6LnWMPgLzYD+aE41Do0tyY3C/t92jCy26oWJXypvsFwQnH6j+G
 DBuJAh3Fd8EdcRIEe38Krs7MxeQx1zVH9/A9KgcDw3quEIcTYHQS/10L8rGuNLq/FMx1
 zL3Q==
X-Gm-Message-State: AAQBX9dHFXCm7Vlt6Ps1DJKdKLnRh+gDKvqTMSyzoJPJrwz6mOxoBe0w
 k2xvKSp2ngWAhhE+7a2MFWD4yYypgPOc/a2N32QSCn3BcWhOMvrW/7MuCLXlYGMFfqM2dhHh9N8
 /enwLWo8EeVi0kynFV/k7g4eO8/+L
X-Received: by 2002:a7b:c34a:0:b0:3ef:f26b:a187 with SMTP id
 l10-20020a7bc34a000000b003eff26ba187mr1803038wmj.0.1680605757952; 
 Tue, 04 Apr 2023 03:55:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350aO5CpFV+bAcevH7SdL+jF+TQBPO6ggaFH+XkVa4CVmRTVGSJzkhKwKtdhIvG0qMI9dIVjz3Q==
X-Received: by 2002:a7b:c34a:0:b0:3ef:f26b:a187 with SMTP id
 l10-20020a7bc34a000000b003eff26ba187mr1803018wmj.0.1680605757670; 
 Tue, 04 Apr 2023 03:55:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003ee9f396dcesm22183101wmq.30.2023.04.04.03.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 03:55:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Maxime Ripard <mripard@kernel.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Li Yi
 <liyi@loongson.cn>, Christian Koenig <christian.koenig@amd.com>, Helge
 Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] video/aperture: fix typos
In-Reply-To: <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
Date: Tue, 04 Apr 2023 12:55:56 +0200
Message-ID: <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Sorry, I just applied this patch and didn't see your email before...

> Hi
>
> Am 04.04.23 um 06:01 schrieb Sui Jingfeng:
>>   EFI FB, VESA FB or VGA FB etc are belong to firmware based framebuffer
>>   driver.
>
> No whitespaces at the beginning of the lines.
>

I fixed that before applying, also removed the "are" in the sentence
above, since it sounded off and repharsed subject line as "Fix typos
in comments".

[...]

>>   	/*
>>   	 * Remove the device from the device hierarchy. This is the right thing
>> -	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
>> +	 * to do for firmware-based fb drivers, such as EFI, VESA or VGA. After
>
> That sentences is not well phrased. Maybe say 'This is required for 
> firmware-provided graphics, such as EFI, VESA or VGA.'
>

Graphic drivers or display drivers would indeed be more accurate here. But
I think that "fb drivers" is still well pharsed since the are other places
where either fbdev or DRM drivers for firmware-provided framebuffers are
named like that.

For example, in the sysfb platform code and Kconfig symbol help text.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

