Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEA6EF6A4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B390D10E9AF;
	Wed, 26 Apr 2023 14:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205B410E9AF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:43:25 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-54fb8a8a597so86215677b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682520204; x=1685112204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rVbowk0MpNFFS0mWHjJ/lam3bouM7aV76q+/1YGj60=;
 b=GCcyjfGOSgvFqpARx963QpSL4f0Wo989SJ9TPl+Pm5vm6yJoBbRk83KujqOXbDSyRP
 TfFgfMWmnxkshg5y6ji1VU0I1MqdCxATKjnTkkDyOfSm9JICLEUrLC+NrTr0W5Ljau4N
 b5iSrsbSQRK1uYn2jmGsof60Oi7WAgSJQe/7QCaUW7HaymZaTz36UdX9bBTGQytoXcUk
 kaPLquxEXCzwuNsc0r/mAXa2N3zdrQYcBR3Z6U9zypUSEBEORfUbetFH85YDAhjLOWYN
 Kyds6KwU6m2coLqIqOXO9KUDeF4/krbASHcY42voCImtrcUEmls4f2xrdftnV8GLctZy
 WzHw==
X-Gm-Message-State: AAQBX9f3ZnH9d8miO8KRBJARlpfOZZ7Emf4hd5rXVtFiPOk945fhlPAp
 slDCy8/Popit7SnnoZ06X0KKmY1SjXRaBA==
X-Google-Smtp-Source: AKy350Y5W7WjjYjMFA1P8oR7uTv5xCEq6hTx34OcZx9xN4ekJnFcKMg6E8XzoeKhQSVhv2RWiZpdzQ==
X-Received: by 2002:a81:6d93:0:b0:54f:e2ae:21e1 with SMTP id
 i141-20020a816d93000000b0054fe2ae21e1mr12580463ywc.36.1682520203973; 
 Wed, 26 Apr 2023 07:43:23 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 f129-20020a816a87000000b00545a08184edsm4208664ywc.125.2023.04.26.07.43.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 07:43:23 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-b8f510fecf4so10802031276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:43:23 -0700 (PDT)
X-Received: by 2002:a81:5f83:0:b0:556:300c:d653 with SMTP id
 t125-20020a815f83000000b00556300cd653mr11680465ywb.40.1682520203320; Wed, 26
 Apr 2023 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-3-tzimmermann@suse.de>
 <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 16:43:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrtdHSKmJfT+RugX5Q=qVWC7XdFPaE+Y98dY=o0A9P-Q@mail.gmail.com>
Message-ID: <CAMuHMdWrtdHSKmJfT+RugX5Q=qVWC7XdFPaE+Y98dY=o0A9P-Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] fbdev: Use screen_buffer in fb_sys_{read,write}()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 deller@gmx.de, dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 6:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> > Use info->screen_buffer when reading and writing framebuffers in
> > system memory. It's the correct pointer for this address space.
> >
>
> Maybe can expand the explanation a little bit with something like this?
>
> "The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> Since the fb_sys_{read,write}() functions operate on the latter address
> space, it is wrong to use .screen_base and .screen_buffer must be used
> instead. This also get rids of all the casting needed due not using the

... due to not ...

> correct data type."

+1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
