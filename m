Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255049AE63
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C7910E8C7;
	Tue, 25 Jan 2022 08:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA1A10E173
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:34:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id o12so20954946eju.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CHqIugJrPLFsukTue/TinKnkB8E3nJprHe9YzWx1/9c=;
 b=B05VsIY0rE+hqu9HCcnW0X0Q/zbZkzqIamBRPgdYPOPSTMAmsHDzUFFrOMxfU49Rau
 m2UziChm9BP785ufsJ+s4fCzNeIRYkWXCC9Qz3uXmm5eaFQHpVB0oyxQ2VK+zdiik2+t
 rs7iPUWYiKg97K/SUEQ72AYpyagudt9INdN7JJx13w4h30s462/7UE3G8GPcLHaFAz+V
 /SXjYanaWpRYXyexxoJkkpi0/W0utGc4W53Jju2za1KGDCUzF8qQKQJdg85TBSzoYBPQ
 PeLhuijNVOdmPSSoWXuYk1eYqaHEytIo2XCaWQ6Nzax6joQWpQaPzBXUmhD2O5IOrLPV
 cjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CHqIugJrPLFsukTue/TinKnkB8E3nJprHe9YzWx1/9c=;
 b=3o40Cgq/Ty4jQGuNkB7nc86ZxgtYwkLV8/eLRW8XMNzU/uvf6QD1i+Vjm2fh0oLTOj
 cBqAl8Jkm+NznkV8IGUOQdOTCC+P6yLlteYX0kb4YNW/NDKquPaL+cgSeINo7VYoBFgU
 0O3w2plXSnSwKjmAmGYWdOfwQHjgqW27m5gwC8Q8x9VfzLQKENE59jnZvNvvioJ6NKn4
 VCqaSBJQbUv3tObN6HOysYWRyKFpmdE3Vnu+79rKQnj33qq9y18TGjjseH0jacNA0WAb
 kSIOwlzRXSGY2wcIu+WGUVZKfbSociRWI0yDXJ2QzDWqgl9c1BUZz7lppM/Jq0UP5+SA
 ZT+Q==
X-Gm-Message-State: AOAM532uAXmHd0se2C208spaMcbiaKBBh3yQ4Uw0Ma9HqaOxWM/DOZf2
 L0TgJtbWyJ30NYLihjT8rHqRG2MmJNTQHU+X00yIYZBysrI=
X-Google-Smtp-Source: ABdhPJxTcs1R/YHtjIijUkUCYzFaLvmXaMTtRwWZK6Z2FB4mO1m+OaWHGv0KRH9QvqNdOYAkT6wEKYRhAjm6Sjo70Z8=
X-Received: by 2002:a17:907:869e:: with SMTP id
 qa30mr12250838ejc.137.1643027645018; 
 Mon, 24 Jan 2022 04:34:05 -0800 (PST)
MIME-Version: 1.0
From: obiwac <obiwac@gmail.com>
Date: Mon, 24 Jan 2022 13:33:54 +0100
Message-ID: <CAN8-kNWW-tPUgNCt1+yEk5iEpP3hGCQBn13LUhvAaz6esY0Ydw@mail.gmail.com>
Subject: EGL: creating image from X11 pixmap (sometimes) very slow
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 25 Jan 2022 08:48:57 +0000
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

Hey!

Truly, idk if this is the right sort of place to ask, but it seems to
be the most appropriate (I was redirected here from the dead
dri-egl@lists.freedesktop.org mailing list). Feel free to point me
somewhere else if this isn't where I should be asking this question!

I'm working on an X11 compositor using EGL, and I'm creating an
EGLImage from a native pixmap something like this:

xcb_pixmap_t pixmap = xcb_generate_id(connection);
xcb_void_cookie_t cookie =
xcb_composite_name_window_pixmap_checked(connection, win, pixmap);

if (xcb_request_check(connection, cookie)) {
    goto error;
}

EGLImage image = eglCreateImageKHR(egl_display, EGL_NO_CONTEXT,
EGL_NATIVE_PIXMAP_KHR, (EGLClientBuffer) (intptr_t) pixmap, NULL);

(Using the EGL_KHR_image_pixmap extension:
https://www.khronos.org/registry/EGL/extensions/KHR/EGL_KHR_image_base.txt)

Which I'm then binding to a texture a little something like this:

GLuint texture;
glGenTextures(1, &texture);

glBindTexture(GL_TEXTURE_EXTERNAL_OES, texture);
glEGLImageTargetTexture2DOES(GL_TEXTURE_EXTERNAL_OES, image);

(Using the OES_EGL_image_external extension:
https://www.khronos.org/registry/OpenGL/extensions/OES/OES_EGL_image_external.txt)
(Naturally my actual code isn't actually generating a new texture each
time; I'm showing it as such in the interest of simplicity.)

I'm doing it with OES_EGL_image_external because
EGL_BIND_TO_TEXTURE_RGB(A) seems to have been deprecated by NVIDIA
(?): https://forums.developer.nvidia.com/t/egl-bind-to-texture-rgba-attribute-always-false/58676
This isn't reflected in the Khronos EGL registry for whatever reason
so I'm unsure.

Anyway, this all works fine & dandy, except that eglCreateImageKHR is
sometimes *really* slow.
Like, it works fine mostly, but with some windows (especially GLX
windows), there's often times a multi-frame delay.
Since AFAICT image creation can only be done on the main OpenGL
thread, it slows down all the other animations and whatnot of my
compositor, which is very much unideal.

I've tried churning my way through the source code of various
compositors (well, I couldn't really find many which used EGL
specifically, but GLX has a similar problem with glXBindTexImageEXT),
and, aside from the ones which are too opaque for me to understand, I
don't really see how they're doing things much differently.
Obviously however it's something I'm doing wrong/missing, because
those other compositors are perfectly speedy.

I'd be very grateful if somebody could shed a little light on this issue!
Have a wonderful day!
