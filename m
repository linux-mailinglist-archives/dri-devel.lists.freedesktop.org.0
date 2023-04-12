Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E133A6E0066
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81F10E98F;
	Wed, 12 Apr 2023 21:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B0110E989
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681333459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p0bMZvsE0YPLZTGS16xnH5Lejha4qtBtyQdG3KbiVSs=;
 b=YxucbKKFGhveqg7ETknpsLR/I4Km5QUdJr0kn6888g/AVuYrZ6+3bBdP9hNS0zsGOp7svY
 mTJeg2nYPcJ0FOA/NvPGFvASLIHF+pV/6JxWpruxATS1HYq1I2El/PfFCzoDqxPZgd0fl1
 EHYP6F72lybFfa+THpS8SVKHtdPGsOI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-VgghQjlNNYiARMfcFbNczQ-1; Wed, 12 Apr 2023 17:04:18 -0400
X-MC-Unique: VgghQjlNNYiARMfcFbNczQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q1-20020adfb181000000b002d716fc080fso2156410wra.22
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333457; x=1683925457;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p0bMZvsE0YPLZTGS16xnH5Lejha4qtBtyQdG3KbiVSs=;
 b=GoefI5F/lacBq89YJkUgnroOXQ5CTMVzetlxdtnVQyQI5aNl4NTdJEPeEI9fcejFmW
 Pc3/tlzOV6VtLuTu6ehZeUa2kDfEQFNfB2m/hQKztWj83izo3qFd7BbwH9gHpeS73Apz
 5H/pDrG/tS5oCKs4f1j/+TdDQI2QZH/FUfLUv00qKjwuICzElz4IbNZbdsxRiL4wLHFv
 nKHSaUqNOuqe076efuLTUq/GjIYjoCe0sJCNmMXCJKcat+2+lRaMZ109HxuyI+zZ8zLY
 9jwqXG7XPOUd0tBtNSkzZUoC0IRgDLnBUaYDvbcDE+o6HkfvpHL4tRjCxl+Kt2uSldms
 ZpDg==
X-Gm-Message-State: AAQBX9fyzVYts7mmZvx4XLhXfyQEO8S7LgKzbc2srDxuKmeYE/9btSN8
 OBWv+WRvqXjkzdTzUW8A+kYIyCiBQx0nNS+kG6N8Io/aYB0W1VuWORrNKzdinf25mSKxDeauoHy
 tHFjLfeJGXwOjNo4g6KyejGWKUVfB
X-Received: by 2002:a7b:cb49:0:b0:3eb:3104:efec with SMTP id
 v9-20020a7bcb49000000b003eb3104efecmr76069wmj.16.1681333457422; 
 Wed, 12 Apr 2023 14:04:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350YjRcE/zRqnHDiEsrN2JH7uxueKk3X88weqqIILukDbFDl5GuAcq0iOc8eQT5UTTwngdY48nw==
X-Received: by 2002:a7b:cb49:0:b0:3eb:3104:efec with SMTP id
 v9-20020a7bcb49000000b003eb3104efecmr76061wmj.16.1681333457103; 
 Wed, 12 Apr 2023 14:04:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c228600b003ed2c0a0f37sm3535032wmf.35.2023.04.12.14.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 14:04:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
Date: Wed, 12 Apr 2023 23:04:15 +0200
Message-ID: <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

>> And can you share the "linelength=" print out from simplefb ?
>
> Okay.  Three cases, see below.
>
> Your patch tries to fix the stride, but what if it's the _depth_
> that's wrong ?  Grub sets the mode, the pre-regression kernel picks this:
>     format=x8r8g8b8, mode=1024x768x32, linelength=4096
>

Yes, it seems the VBE mode set by GRUB is x8r8g8b8. And the line length
calculation is also correct: 1024 * (32 / 8) = 4096.

> ========== Good ======================================================
> grub: gfxpayload=1024x768x24
> [    0.003333] Console: colour dummy device 128x48
> [    0.003333] printk: console [tty0] enabled
> [    0.417054] fbcon: Taking over console
> [    0.513399] pci 0000:01:05.0: vgaarb: setting as boot VGA device
> [    0.513431] pci 0000:01:05.0: vgaarb: bridge control possible
> [    0.513455] pci 0000:01:05.0: vgaarb: VGA device added:
> decodes=io+mem,owns=io+mem,locks=none
> [    0.513490] vgaarb: loaded
> [    3.337529] simple-framebuffer simple-framebuffer.0: framebuffer at
> 0xd8000000, 0x240000 bytes
> [    3.337567] simple-framebuffer simple-framebuffer.0: format=r8g8b8,
> mode=1024x768x24, linelength=3072

This is also correct when GRUB sets it to r8g8b8, since the line length
is: 1024 * (24 / 8) = 3072.

> [    3.338000] Console: switching to colour frame buffer device 128x48
> [    3.566490] simple-framebuffer simple-framebuffer.0: fb0: simplefb
> registered!
>
> ========== Bad after patch, typing blind to log in !==================
> grub: gfxpayload=keep
> [    0.003333] Console: colour dummy device 128x48
> [    0.003333] printk: console [tty0] enabled
> [    0.423925] fbcon: Taking over console
> [    0.520030] pci 0000:01:05.0: vgaarb: setting as boot VGA device
> [    0.520061] pci 0000:01:05.0: vgaarb: bridge control possible
> [    0.520085] pci 0000:01:05.0: vgaarb: VGA device added:
> decodes=io+mem,owns=io+mem,locks=none
> [    0.520120] vgaarb: loaded
> [    3.290444] simple-framebuffer simple-framebuffer.0: framebuffer at
> 0xd8000000, 0x240000 bytes
> [    3.290483] simple-framebuffer simple-framebuffer.0: format=r8g8b8,
> mode=1024x768x24, linelength=3072

Now, this is the part where things start to break I believe. Because you
mentioned before that gfxpayload=keep used to set the format to xr8g8b8
but now after my patch (and also after the original commit f35cd3fa7729)
it is set to r8g8b8 instead.

That *shouldn't* be an issue because it only means that the alpha channel
is discarded but maybe it is an issue for your display controller?

By the way, in https://www.panix.com/~pa/linux-6.3-simplefb/selected-modes
that you shared before the gfxpayload=keep GRUB option used to also led to
the pixel format being set to r8g8b8 instead of xr8g8b8. The difference is
that in that output the line lenght didn't match the pixel format and size:

[    3.290596] simple-framebuffer simple-framebuffer.0: format=r8g8b8, mode=1024x768x24, linelength=4096

but after my patch you mentioned that is:

[    3.290483] simple-framebuffer simple-framebuffer.0: format=r8g8b8, mode=1024x768x24, linelength=3072

which at least matches, so in a way is an improvement (even when it still
doesn't work).

> [    3.290916] Console: switching to colour frame buffer device 128x48
> [    3.519523] simple-framebuffer simple-framebuffer.0: fb0: simplefb
> registered!
>
> ========== Good, earlier kernel before regression ====================
> grub: gfxpayload=keep
> [    0.226675] Console: colour dummy device 128x48
> [    0.228643] printk: console [tty0] enabled
> [    0.429214] fbcon: Taking over console
> [    0.524994] pci 0000:01:05.0: vgaarb: setting as boot VGA device
> [    0.525025] pci 0000:01:05.0: vgaarb: bridge control possible
> [    0.525049] pci 0000:01:05.0: vgaarb: VGA device added:
> decodes=io+mem,owns=io+mem,locks=none
> [    0.525082] vgaarb: loaded
> [    3.320474] simple-framebuffer simple-framebuffer.0: framebuffer at
> 0xd8000000, 0x300000 bytes
> [    3.320513] simple-framebuffer simple-framebuffer.0: format=x8r8g8b8,
> mode=1024x768x32, linelength=4096

Yes, and it works because is the correct mode it seems but for some reason
after commit f35cd3fa7729 the pixel format is calculated incorrectly. We
can see that the total framebuffer size is 0x300000 bytes, which matches a
1024x768x34 mode framebuffer: 1024 * 768 * (34 / 8) = 3342336 = 0x300000.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

