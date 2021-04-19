Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733A363D19
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7FD6E1ED;
	Mon, 19 Apr 2021 08:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFA36E204
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:01:08 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id z23so9499744uan.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 01:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUpGwjpEu/4vLb0RdqZG1KLsDpmabVtYAByt0suTszU=;
 b=Hk6rRU9i1SuyXFisKG4pgFnJrKLZyNKwWEtEYvXULmTC1R4FUrZ1X+/KOjqjjz14Ci
 TqEZbYugkL+RnEUrWmZAgHlSF31G+WsvsYS+uJQkHhwb/znsCc+CrwLx4s1Rqa4A9yQT
 3Pa7lj0xBUM8y5rLX172VgMjDRoUbEBFRKwOKTWB7zNv31fEO6JfnEZYNgPpWkzUybZZ
 e6O5/4umpt/5Ek5MbHdIAukQcRaT4Qv0i13OVuJsgoa1+yps1oB7cuNqk5xJRXEecQXm
 jA4+DKZkxFQxNzGaNasc1en+7VvZ5C4umBiBmHo0Nk30JY8MGGTijbWAW1mCs683Ls25
 ugig==
X-Gm-Message-State: AOAM530ZU1Uc9HxazXk8NCJGnPncF/8SRvBEyjaK+mn8PLMbniVuWG/t
 SsFod5KX7h4M6p6Ylg2QIVMHqzeJhABszu4C9gk=
X-Google-Smtp-Source: ABdhPJxWhSqaSXDdtxTrt8N0QC9ouc95t3YD202R1UAd81UELN2SUsFdr7jUmXmQOOF/DBgt7DAQOC6q/DvsGEPBMvg=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr6342516uar.100.1618819267298; 
 Mon, 19 Apr 2021 01:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de>
In-Reply-To: <20210416090048.11492-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 10:00:56 +0200
Message-ID: <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg KH <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> This patchset adds support for simple-framebuffer platform devices and
> a handover mechanism for native drivers to take-over control of the
> hardware.
>
> The new driver, called simpledrm, binds to a simple-frambuffer platform
> device. The kernel's boot code creates such devices for firmware-provided
> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> loader sets up the framebuffers. Description via device tree is also an
> option.

I guess this can be used as a replacement for offb, too...

> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During

.... if support for 8-bit frame buffers would be added?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
