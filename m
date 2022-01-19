Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AA4936A4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 09:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7E310E151;
	Wed, 19 Jan 2022 08:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BB110E151
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:55:34 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id d189so1083094vkg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=f3GQA/yWddcSt+mV1d0z/WtZsk+EibBZa5EQxJfaZGU=;
 b=DONxNiK1UWGWatK8mwHBgX+zEByY4sRhpIqAZj5rt/8wG4FxJ3HR66LWIqHHHIS6It
 1aN7KSmPwFx3uui5RZ3pSUnicltWYUPdlUNh8Ur2Z1HGB0sVAd2wfj9xdEhG97eSLlea
 A99zr9TnAHZWy2YqeoS8vTU0Qo/NOp6B8LQLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=f3GQA/yWddcSt+mV1d0z/WtZsk+EibBZa5EQxJfaZGU=;
 b=0JgcIk71FAOmYeglfpZxJko2UZ1NP1O72ZgNW8D3tND7wwRDywnZLjTDfE5HC532Vw
 Mgpe5Ziki/SVZo/BrLkKNtaPRL2+PofgO79ZREA4spz87cnS5Or47Zv3YYoVG48Qtpua
 XpRgjciDddCGSDzNg3XdjJpDHnJhpitX4QilAJHPMAT+g5YnLBQKbuU8FZ140pT+eyVL
 SJLrD8Ou9Xeve4lSfCgdH9c+iknGsqMb9KQoKBnvDo+HzwluouUdM9TrG+wlG6NR8CKy
 NYww8pv47S2HFCOhbOPCIVU1+T2ygywR0pj2wHdinVnD8pN4WmReT4SmIg02EHZ6KEEH
 2z+Q==
X-Gm-Message-State: AOAM533q3p53GnEdGf4Kz3TV+SLhB0dIncqmVh7c+LrHupZiY1NMUjRf
 +0ufuSw2llfHORR2UeUVQTP2exslrXsSKHZIfSVNzVRUS8/OFA==
X-Google-Smtp-Source: ABdhPJwGYQVjGFatpV8tqDJZCFGcOjlZpSUNld6ZNcf9u4EEQtyrWaQzMQ9uRE8jScwAhzWldvHI8yBX9jVzdV1qzEA=
X-Received: by 2002:a1f:a6cc:: with SMTP id p195mr12348176vke.41.1642582533060; 
 Wed, 19 Jan 2022 00:55:33 -0800 (PST)
MIME-Version: 1.0
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 19 Jan 2022 17:55:22 +0900
Message-ID: <CAFr9PXnig9YfnwSzMg5UPm3UtAsEAQT_xVheBbLppiU45mc_QQ@mail.gmail.com>
Subject: [RFC] How to add hardware rotation, scaling etc to a DRM/KMS driver
To: dri-devel@lists.freedesktop.org
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've copied and pasted my way to mostly working DRM/KMS driver for a
low cost ARM SoC (Sigmastar SSD202D). The hardware is 2D only.

One of the devices that uses this SoC has the screen upside down so it
needs the screen rotated.
The hardware doesn't have bits that change the scan out direction from
what I can tell (so it can't mirror/flip while feeding it to the
screen) but it does have a 2D blitter style block that can take a
framebuffer and flip/mirror/scale/convert the colour space into
another buffer.

My idea was to create a buffer for the rotated image when allocating
the framebuffer and trigger the hardware to do the conversion each
vblank or something.

While reading the discussion about maintaining fbdev I realised maybe
I should ask instead of wasting too much time on something that's
wrong.

I got the feeling that maybe I should just provide an interface to the
blitter from userspace and userspace should be doing the rotation. I'd
like to do it in the kernel so stuff like SDL1 apps just work but
maybe that isn't possible?

Cheers,

Daniel
