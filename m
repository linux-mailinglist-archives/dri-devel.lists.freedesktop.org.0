Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070A43CAB9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD2089FF6;
	Wed, 27 Oct 2021 13:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401C89FF6;
 Wed, 27 Oct 2021 13:33:05 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id 3so2940038ilq.7;
 Wed, 27 Oct 2021 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nZXycHElx2PvePSgfI8q1PAKzVhVZLWU+GWvzXGtf+8=;
 b=DYJlq8deziZIZJjqh4x3V7jJEU6eO+sS5sDmopsCFiuS7lFXanCQKm7N0VRVGZlg6g
 onIelYweU690jMcik5iRC2TwHiHzAg7ona9I/tBh4bR9r6PTVG3y3R88wq0wvbA4ZmFA
 secTWT0tynWT0EMD5Q/u6K4Q+1uEDddm6/DHXTYIovSHWX4PJk8WLq3SQtNB7YKX6ScW
 LEGlCgLH4REMcno9uWkwRwU2/awOTKygiKVLSA0wbAAlgggE01wcuTPUnLR9inBRF8QH
 CYdFu/YGwFIlpCL0Titjt6e00yi5B9+i8jJxrbggP2QfS6BYQjGyIGbOK0pqzGHQzNPu
 7wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZXycHElx2PvePSgfI8q1PAKzVhVZLWU+GWvzXGtf+8=;
 b=hj9wqL+uPgHoqZbh/C2tng0UHrN0NnlA6UB8x0GjaHHKZWskln8/59qgYVOYRxI5+T
 IHIbFbeZXhhiQ25aezpy9VDKB6OgPpkiWB0J+efLWUp3WG/S7dVjafHKwLknmmq5YqH8
 z3jv6RsGh5xsrUtmOqMIjRDYeHKH46D/TEmJv2HG/jubArWJxHd5KlOC4uPESrxrLiN+
 MhwJHRGy8St9e9cJb+lq5HbOAVcYWW4hSNTguzWFNsXBG7IoP8aPUkd2J3CJX2l3MGM0
 EXUFbNXulKuN1WxkP9PRxzLpdfT/NJ1EBjLJp3NZLvhOAJ6aZOqwBvgzXwJ76+OzQXOB
 DVAQ==
X-Gm-Message-State: AOAM5315LSCVtMTQBiKQV5S32u03563orQjueGe+Tk4ViBJW/AwAzFNC
 unNqTBwGmJyTA6JjIXhyeiX50emHmpvVzEGsvwA=
X-Google-Smtp-Source: ABdhPJyQM7nv4/L/+ZrHrxaFQWe4enGNCZfglV+MKpcO6gFgxgurDRXlVA2+RN1ozDoYfDM5GaAxiy3o0wvCISrJVMk=
X-Received: by 2002:a92:d08a:: with SMTP id h10mr17035457ilh.321.1635341585283; 
 Wed, 27 Oct 2021 06:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211027132732.3993279-1-arnd@kernel.org>
 <20211027132732.3993279-2-arnd@kernel.org>
In-Reply-To: <20211027132732.3993279-2-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Oct 2021 15:32:54 +0200
Message-ID: <CANiq72=fkx0BNz0oPuvVA_uEcE1BF92reKtsCbK1fv-fwx2yNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] fbdev: rework backlight dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jens Frederich <jfrederich@gmail.com>, Jon Nettleton <jon.nettleton@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Lars Poeschel <poeschel@lemonage.de>,
 Robin van der Gracht <robin@protonic.nl>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Oct 27, 2021 at 3:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> make any driver that needs it have a dependency on the class device
> being available, to prevent circular dependencies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
