Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC23A70CC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 22:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B706E175;
	Mon, 14 Jun 2021 20:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9736E175
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 20:55:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id r14so21846137ljd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BvFtMS7w82gJtCdW5tybxomJPOQ/in1K/R+2X7lqGwc=;
 b=aOU4CfEtgE0AJRaOgvdfvI+i7+GjiXA1efPBSI3gsFH8oJ+/jUvs8b0T05FOncV598
 TlI4ELeZF6XLY58dry8XxL/00YppNkPPvil9+YyNLQD8OWaP0VVImO44VKUwWxKvdcaK
 0WZPUnRsx3+sVuJmKE17E+vOvMtAReZ2fHs5ucGB/de598O4vCC/ZeCzzUExsgPFkl58
 lCwVq2e+lSO4oRJsqb/XHnf1gGduMoKWqKMF9znWpSfQqzHprp6K3+w0AIiG4nCP7uaH
 lNe0ucwcTFQAgFzOG8snO59iStXgyc9QcUKlsongrFAE/hHyOC8Xerc5p4ufGfDILNhc
 9/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BvFtMS7w82gJtCdW5tybxomJPOQ/in1K/R+2X7lqGwc=;
 b=jl8j5Xw2ItblzCGrQ1//zsw9LkTEPLri7UXdD9exlqRKnH0s0Vz+z2Lek1T1t+2iry
 jwm1f0PxhFm4Q7nLbwIl+j7FbgwzybnNLnWvZaC1EepvQJEkyYrcdBQvhraZwWWDsnTZ
 BziHgp2eGIiUUvIhkhpvODhjs/Wm1x/0Oc+p7miJB1tA3xf19/qIyxyAZaqJx0L1aGKe
 ewRl2rQm54DbdbgBiSSdx2Ul+9axTTfDKXyjt3NoN6a+3RiZxjWkCmUbr613RYCdmAA/
 GIFZpAqCVQj6j2Z9++JkLz9O5+lbyTZKmnT1VRVY+0QUaWsPWxq6CGvsFpLcnkilL+lo
 2Utg==
X-Gm-Message-State: AOAM5336RNerOYp5/2T5XFecPXw8BIs39pKF5FLmhmfdcnH9ffUWNMtT
 gSa+vGi7XdOo1lz98RC2KzmbgdIRl8MV5EF6Qpa+tw==
X-Google-Smtp-Source: ABdhPJyjEsr+Yr8+VjhoDjmd511744gJsiWWs7lM9rE8HK77bNvOImIo6GN8NhY96CjwrkFbIEyPSISaa7RuitNoGZ8=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr7075751lji.200.1623704099420; 
 Mon, 14 Jun 2021 13:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210329180120.27380-1-noralf@tronnes.org>
 <20210329180120.27380-2-noralf@tronnes.org>
In-Reply-To: <20210329180120.27380-2-noralf@tronnes.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Jun 2021 22:54:48 +0200
Message-ID: <CACRpkda6K59aVCDwKmy1AJ2z+nq2-pjvCWFFn8Yd1aUFAGfsgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/gud: Use scatter-gather USB bulk transfer
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Stuge <peter@stuge.se>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Mon, Mar 29, 2021 at 8:01 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:

> There'a limit to how big a kmalloc buffer can be, and as memory gets
> fragmented it becomes more difficult to get big buffers. The downside of
> smaller buffers is that the driver has to split the transfer up which
> hampers performance. Compression might also take a hit because of the
> splitting.
>
> Solve this by allocating the transfer buffer using vmalloc and create a
> SG table to be passed on to the USB subsystem. vmalloc_32() is used to
> avoid DMA bounce buffers on USB controllers that can only access 32-bit
> addresses.
>
> This also solves the problem that split transfers can give host side
> tearing since flushing is decoupled from rendering.
>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

> +       num_pages =3D PAGE_ALIGN(gdrm->bulk_len) >> PAGE_SHIFT;

Isn't it the same to write:

num_pages =3D round_up(gdrm->bulk_len, PAGE_SIZE)?

Slightly easier to read IMO.

> +       if (max_buffer_size > SZ_64M)
> +               max_buffer_size =3D SZ_64M; /* safeguard */

Explain this choice of max buffer in the commit message
or as a comment please because I don't get why this size
is the roof.

> +struct gud_usb_bulk_context {
> +       struct timer_list timer;
> +       struct usb_sg_request sgr;
> +};
> +
> +static void gud_usb_bulk_timeout(struct timer_list *t)
> +{
> +       struct gud_usb_bulk_context *timer =3D from_timer(timer, t, timer=
);
> +
> +       usb_sg_cancel(&timer->sgr);

Error message here? "Timeout on sg bulk transfer".

> +}
> +
> +static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
> +{
> +       struct gud_usb_bulk_context ctx;
> +       int ret;
> +
> +       ret =3D usb_sg_init(&ctx.sgr, gud_to_usb_device(gdrm), gdrm->bulk=
_pipe, 0,
> +                         gdrm->bulk_sgt.sgl, gdrm->bulk_sgt.nents, len, =
GFP_KERNEL);
> +       if (ret)
> +               return ret;
> +
> +       timer_setup_on_stack(&ctx.timer, gud_usb_bulk_timeout, 0);
> +       mod_timer(&ctx.timer, jiffies + msecs_to_jiffies(3000));
> +
> +       usb_sg_wait(&ctx.sgr);
> +
> +       if (!del_timer_sync(&ctx.timer))
> +               ret =3D -ETIMEDOUT;
> +       else if (ctx.sgr.status < 0)
> +               ret =3D ctx.sgr.status;
> +       else if (ctx.sgr.bytes !=3D len)
> +               ret =3D -EIO;
> +
> +       destroy_timer_on_stack(&ctx.timer);
> +
> +       return ret;
> +}

Mention in the commit message that sending USB bulk transfers with
an sglist could be unstable so you set up a timeout around
usb_sg_wait() (did this happen to you? then write that)

The other users of usb_sg_wait() in the kernel do not have these
timeout wrappers, I suspect the reasoning is something like
"it's graphics, not storage, so if we timeout and lose an update,
too bad but let's just continue hoping the lost graphics will be
less than noticeable" so then we should write that as a comment
about that in the code or something.

With these comments fixed up:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
