Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC74D8E80
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 21:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E17C10E1B6;
	Mon, 14 Mar 2022 20:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524D10E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 20:56:59 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id a14so14278740qtx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmG2yYfE0o7/L9fLZmp2P49FR3lsd0GCX3VrEQxdEUg=;
 b=RHb92V8cw2EevhOWlJ/YaSkvRlFXFfpi3S41PtCpux6svUpky/OCuv5zm+Jn8Z6Kpv
 DAKmiYdoDV2jKZUqU6J4cehK5VD3UfJjZ0TgTtfkzu4aN/aYxkiG0WuprFiY8Un3SQSn
 c4YNyVIcqn+RPQ6U5ZgStNWcY0cb6VRNC9xt2GXfrkZ2/asArteJ5AHgkyTiWcIWJ7mK
 1JPY2GjgaX80FI6wGD/XFZZZyFRUPrd/XI96GqxyBZomk9qE+jzi/cRj3gQC7FT/Guso
 zhrx9uHz0/q60URGXkQQPGJIwXh6QWyrXloLgatkv2V40tfpp6dWzB0q+enZgvLTn50Y
 wGEA==
X-Gm-Message-State: AOAM532Mr02ukprmJiIzW4ANomT5WWAoyCSPtJ0XfNHd4MXccAvU1z3Q
 ybKqVrB1mxjeDMN1mRwNUyTu10KoKPURQA==
X-Google-Smtp-Source: ABdhPJymmxRUBhfodbUJ7nD7W4iRvcmn3hC9NtX7QurSU9wIoy8aDRjE50s+Z8wBrtosaqvumilm5g==
X-Received: by 2002:ac8:5b15:0:b0:2e1:d84f:1151 with SMTP id
 m21-20020ac85b15000000b002e1d84f1151mr3044825qtw.364.1647291418728; 
 Mon, 14 Mar 2022 13:56:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05622a148e00b002e0657e20basm11560148qtx.1.2022.03.14.13.56.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 13:56:57 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id o5so4441774ybe.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:56:57 -0700 (PDT)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr19641831ybn.6.1647291417430; Mon, 14
 Mar 2022 13:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220313192952.12058-1-tzimmermann@suse.de>
 <20220313192952.12058-2-tzimmermann@suse.de>
In-Reply-To: <20220313192952.12058-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 21:56:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqZ3HgUe1b3bpjWmFLKm4dTrfAioD2Hk8H5iDaY4C-yw@mail.gmail.com>
Message-ID: <CAMuHMdWqZ3HgUe1b3bpjWmFLKm4dTrfAioD2Hk8H5iDaY4C-yw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fbdev: Fix sys_imageblit() for arbitrary image widths
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Sun, Mar 13, 2022 at 8:29 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Commit 6f29e04938bf ("fbdev: Improve performance of sys_imageblit()")
> broke sys_imageblit() for image width that are not aligned to 8-bit
> boundaries. Fix this by handling the trailing pixels on each line
> separately. The performance improvements in the original commit do not
> regress by this change.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for fixing! This was very valuable for hammering the bugs
out of ssd130xdrm and the xrgb888-to-mono conversion...

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
