Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24B4C2984
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 11:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070F010F984;
	Thu, 24 Feb 2022 10:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6FF10F986
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 10:31:21 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id k9so923216vki.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 02:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzF5Z4LDpBkqJKt4eS3U3l/YdcZIcNkjKgx++j7ZDZg=;
 b=ROfZ+MOyyqdQeqcoWMB/Ml0s3FfSrveIqgC7oTHHX37xep8s7X22RcqEaooIJ+Rrda
 RcwonzwrFcsgo1YMCrnCV9+JRP6EwHBuP0S9xY765bOhgDSu2oOcKtyd7+i/hThMdGU1
 jdJc+JQp3t59s28aHk9yM0+y95bzi285YzLMsgNwxLx5jWv+zIJAgkJMLk/uTi8gUrE7
 7IaRcolLisbvkkdlut9X4NGxfWQg/bHwe/gh5a08uHDgpj9jC11jvi6EsFY46F5oVfqS
 OPN0nJA5lPddIjkFkTIDfp4re2FVoQQ/oqkKoCkVOxeNJu6L6s1gMKZf5PDBa2izB3j3
 yusA==
X-Gm-Message-State: AOAM5322Pgse/6Mh6DIHHx/c5CvNNqSvej8SKpbalHFqa09V57HVOUJD
 aC54HYPuwVEUWvNtT4P8koNUf+sLIbeNfQ==
X-Google-Smtp-Source: ABdhPJy0iMsils5mFAEHiYFoVHNhHiHlsjRacgtgN2v0q3DBVrm7jK56C7gm64khao5oGLk/UNkguQ==
X-Received: by 2002:a05:6122:e28:b0:331:42:794d with SMTP id
 bk40-20020a0561220e2800b003310042794dmr714361vkb.10.1645698680015; 
 Thu, 24 Feb 2022 02:31:20 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id g9sm332345vkg.28.2022.02.24.02.31.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 02:31:19 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id d26so1663501vsh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 02:31:19 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr705807vsl.68.1645698678993; Thu, 24 Feb
 2022 02:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
 <YhaYSeyYIwqur2hy@ravnborg.org>
 <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
In-Reply-To: <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Feb 2022 11:31:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBVPTT30fKxVzBYCFcrxhVdqZuwJZXU5M-vGyjLQXzQw@mail.gmail.com>
Message-ID: <CAMuHMdUBVPTT30fKxVzBYCFcrxhVdqZuwJZXU5M-vGyjLQXzQw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Feb 24, 2022 at 10:03 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 2/23/22 21:25, Sam Ravnborg wrote:
> > Question: What is cfb an abbreviation for anyway?
> > Not related to the patch - but if I have known the memory is lost..
>
> I was curious so I dug on this. It seems CFB stands for Color Frame Buffer.
> Doing a `git grep "(CFB)"` in the linux history repo [0], I get this:

The naming actually comes from X11.
"mfb" is a monochrome frame buffer (bpp = 1).
"cfb" is a color frame buffer (bpp > 1), which uses a chunky format.

> Probably the helpers are called like this because they were for any fbdev
> driver but assumed that the framebuffer was always in I/O memory. Later some
> drivers were allocating the framebuffer in system memory and still using the
> helpers, that were using I/O memory accessors and it's ilegal on some arches.

Yep.  Graphics memory used to be on a graphics card.
On systems (usually non-x86) where it was part of main memory, usually
it didn't matter at all whether you used I/O memory or plain memory
accessors anyway.

Then x86 got unified memory...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
