Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0555B3A8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 20:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E181410E160;
	Sun, 26 Jun 2022 18:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045710E160
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 18:54:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id cw10so14792807ejb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lFVUiMK8367I4tCKgM57m0mtqed/o+uPQT3BEO7ky08=;
 b=R492Zjh+q38rM4qIEoyPnAa3NRueOnjdDl4MNW+ScG+ZEs6CgqgoPU4KtgGmupFrUM
 ggaEkvz2f1LnqTxIdj28hN7PhBVAecATC4m4vO6U5foweG7xx6fIC/6EpDMeHGAlqmm4
 FikOwuJ0ZonoK2aTejYiS9gWXr4OFNZmvScf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lFVUiMK8367I4tCKgM57m0mtqed/o+uPQT3BEO7ky08=;
 b=2snxYzTUikLXHqtE2XEw1XMZlwnDnOkmZ/6g2p4rU2M6K+pU5qMuiTbFWij5cW80bN
 nAd4KSSamNUYppI74Di+qAQGS88eWrctCVthMjdRBVHS+p24Kx5rDF9fMri9F0dvLSkn
 QPm6kNqaMt1QSzZu8zC7AeN9iXCb9ak/e3v/6Xf4xdbSE3JaF7eYuPbV9RFrUtcb6XBC
 iqEeZJXtPvw298xGkNeqnOCKrFttZehoVZxmWkf6pUrvc8BxfwRddGz9IlqPm8nXsdy1
 LzGXFxfXJi1c0yS3U1t8U2tR42oESFWKsR/l0O3sIrXRGm4CWAtzEU96MAolm458Qb6p
 ZclQ==
X-Gm-Message-State: AJIora8ClnKf4TuO+yLozjr+693D+tS6RNT+wjNU481udHcBhZGu+u33
 Dn6UrudQhl5yKWdDEcrbB7Q1oTmC4/W4v0Zl
X-Google-Smtp-Source: AGRyM1vzQswQw8gp8mHJeyJVSWDkxcWtfiX5HBg0eypXCEA5/Km/Q0Tk6lDhv2wZLAPP8LyqJW7Xwg==
X-Received: by 2002:a17:906:519b:b0:722:e854:dfc2 with SMTP id
 y27-20020a170906519b00b00722e854dfc2mr9281216ejk.331.1656269683310; 
 Sun, 26 Jun 2022 11:54:43 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 a18-20020a170906671200b00718e4e64b7bsm4066371ejp.79.2022.06.26.11.54.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 11:54:42 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id m184so4143190wme.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:54:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4ec9:b0:39c:69c7:715d with SMTP id
 g9-20020a05600c4ec900b0039c69c7715dmr15902172wmq.154.1656269682131; Sun, 26
 Jun 2022 11:54:42 -0700 (PDT)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 26 Jun 2022 11:54:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
Message-ID: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
Subject: Annoying AMDGPU boot-time warning due to simplefb / amdgpu resource
 clash
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>, 
 Hans de Goede <hdegoede@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So this has been going on for a while, and it's quite annoying.

At bootup, my main desktop (Threadripper 3970X with radeon graphics)
now complains about

  resource sanity check: requesting [mem 0xd0000000-0xdfffffff], which
spans more than BOOTFB [mem 0xd0000000-0xd02fffff]

and then gives me a nasty callchain that is basically the amdgpu probe
sequence ending in amdgpu_bo_init() doing the
arch_io_reserve_memtype_wc() which is then what complains.

That "BOOTFB" resource is from sysfb_simplefb.c, and I think what
started triggering this is commit c96898342c38 ("drivers/firmware:
Don't mark as busy the simple-framebuffer IO resource").

Because it turns out that that removed the IORESOURCE_BUSY, which in
turn is what makes the resource conflict code complain about it now,
because

                /*
                 * if a resource is "BUSY", it's not a hardware resource
                 * but a driver mapping of such a resource; we don't want
                 * to warn for those; some drivers legitimately map only
                 * partial hardware resources. (example: vesafb)
                 */

so the issue is that now the resource code - correctly - says "hey,
you have *two* conflicting driver mappings".

And that commit claims it did it because "which can lead to drivers
requesting the same memory resource to fail", but - once again - the
link in the commit that might actually tell more is just one of those
useless patch submission links again.

So who knows why that commit was actually done, but it's causing annoyance.

If simplefb is actually still using that frame buffer, it's a problem.
If it isn't, then maybe that resource should have been released?

I really think that commit c96898342c38 is buggy. It talks about "let
drivers to request it as busy instead", but then it registers a
resource that isn't actually a proper real resource. It's just a
random incomplete chunk of the actual real thing, so it will still
interfere with resource allocation, and in fact now interferes even
with that "set memtype" because of this valid warning.

             Linus
