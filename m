Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9822753B13
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E11D10E882;
	Fri, 14 Jul 2023 12:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC07810E882
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689338113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1Zd/JVb3INpcm5Suw1qo0GVcXGE20luaGYc4chBP6I=;
 b=dF0hRcdmQdQ5PAyayiz0JzJh7Jx0K6lRGjTf0uPqbF8zmNjp8sgKAWaxIkLpWraLy/xz/g
 k7jxeHKq+GKyImPHP53UN1nr3D7/5ZuflQHOwPKYSeg/OE24xcNCsml9ndNz72Qup4jnlJ
 /1aOixhAzXBEuJBcp2sQJAdOOx8/dew=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-M3IHZxprNpKHBnxiXLxP6g-1; Fri, 14 Jul 2023 08:35:12 -0400
X-MC-Unique: M3IHZxprNpKHBnxiXLxP6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fc0627eafbso8395215e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689338111; x=1691930111;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4YYFQeFF+tmW56W+2YbpK+12pRE5g3fji817lOXKvo=;
 b=MC2SyYEFvP6GEVTkfi9XlotH8HZnGKMtilcUk1ehTA+Uqju5/JGKttGgbLXd3LBROX
 7mN78rmx2XEZDE4Niw8XY6mVdzo2TmJD6Iu+sq0PtLv/l7cB8mhFEV6woNRFADRI7RY6
 4MMbplgSfZpZQcpe2iBPS+DeOFUTrIUWDAC7cF0rEnwQafDtHwu/+2gMLk0YIV/p0r1S
 hrRuCbXhhxixYbT3ykJrY3/c41ZSVeoAWq3Mm3vV7wiyZXVZDJ4MdnQ2qlhBBkD8GanK
 XZqLcaSfpXERnzCC01arhAMyMlTuMyTWgqUKn1l93qUZymnvs7IsFi0hMAFmwydz82yj
 ZifQ==
X-Gm-Message-State: ABy/qLaBZP36GEnP4WMkI9ANOSdLYlRuVbKPWWdLH5MZJWgeCIFla0jn
 nTnET1vo+JxcM6vpquwsTAiiDBqulPVOvl8E4x7QRqyvzHV1iPJnS3ySQkuWcvG4epZnonqpKvY
 NNL14tDQBcZXzSwSvBMah6WGHeGoY
X-Received: by 2002:a05:600c:3c82:b0:3fa:821e:1fb5 with SMTP id
 bg2-20020a05600c3c8200b003fa821e1fb5mr2350935wmb.5.1689338111128; 
 Fri, 14 Jul 2023 05:35:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH9jx6L5IrTf9LzMzlaRmSACtru8z+t6WqE3jtnwWMGELxmr4yY71Dv3BxD0LDKeBPRdZryjQ==
X-Received: by 2002:a05:600c:3c82:b0:3fa:821e:1fb5 with SMTP id
 bg2-20020a05600c3c8200b003fa821e1fb5mr2350920wmb.5.1689338110820; 
 Fri, 14 Jul 2023 05:35:10 -0700 (PDT)
Received: from localhost (208.red-88-2-40.staticip.rima-tde.net. [88.2.40.208])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b003fb225d414fsm1326015wmi.21.2023.07.14.05.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 05:35:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <CAMuHMdV1MXexXuRuvW2ap5KA51q_3h9X8jXdYXtFb2RF-BBLnw@mail.gmail.com>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
 <87ilamu7e3.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV1MXexXuRuvW2ap5KA51q_3h9X8jXdYXtFb2RF-BBLnw@mail.gmail.com>
Date: Fri, 14 Jul 2023 14:35:09 +0200
Message-ID: <875y6macxu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Fri, Jul 14, 2023 at 12:14=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> Thanks a lot for your patch, this has been on my TODO for some time!
>>
>> > The native display format is monochrome light-on-dark (R1).
>> > Hence add support for R1, so monochrome applications can avoid the
>> > overhead of back-and-forth conversions between R1 and XR24.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> > ---
>> > This work interfered with commit 49d7d581ceaf4cf8 ("drm/ssd130x: Don't
>> > allocate buffers on each plane update") in drm-misc/for-linux-next,
>> > which always allocates the buffer upfront, while it is no longer neede=
d
>> > when never using XR24.
>>
>> you mean R1 here, right ?
>
> I did mean R1. I think you missed the double negation.
>

I did indeed. As a non-native english speaker, I find it very hard to
parse double negations :)

>> It's still used in ssd130x_clear_screen() though.
>
> I guess it became worthwhile to make ssd130x_clear_screen()
> do memset(data_array, 0, ...) and call ssd130x_write_data() directly,
> avoiding the pointless reshuffling of black pixels in
> ssd130x_update_rect()?
>

I think so, yeah.

>> > Probably ssd130x->buffer should be allocated on first use.
>>
>> Yes, that makes sense.
>>
>> > And why not allocate the buffers using devm_kcalloc()?
>>
>> I think there are some lifetimes discrepancies between struct device and
>> struct drm_device objects. But we could use drm_device managed resources
>> helpers, i.e: drmm_kzalloc().
>
> The display should not be updated after .remove(), so I think plain
> devm_kcalloc() should be fine.
>

That was precisely my point, that there could be atomic commits even after
the driver has been removed (e.g: if using DRM fbdev emulation, user-space
can keep the /dev/fb0 opened and continue updating the framebuffer. That's
not released until the fd is closed and struct fb_ops .fb_destroy called.

But that's a general rule in DRM, any user-visible resource must not be
allocated using device managed resources and instead use the drm_device
managed resources helpers. To make sure that are not released until the
last call to drm_dev_put():

https://docs.kernel.org/gpu/drm-internals.html#device-instance-and-driver-h=
andling

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

