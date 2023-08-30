Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5978D3AD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383AB10E4CE;
	Wed, 30 Aug 2023 07:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAA010E4CC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:40:45 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-d73c595b558so5254496276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 00:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693381244; x=1693986044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjN8oiyAeak2OCfDHumBNxolaRdlghFzEQTJLAyrIjM=;
 b=Pgt/uRuWaI0jWBzW3gRjLdYDfP9u05vNZkocaaph7z8l+2vcZsqmaeJ29KMJrRkBkg
 +vfqzI+jjd13eWSNMC+dDPteHrOgxHW5914i9r13BJzGKEIoAgPX71/YbQEGlTE+6KWB
 h62Cvb+tenkzV/E/Vn4IetslLNG5KRUCJrZb/Xna8N/rJL25+GIgunA3Ff9ZAlCMG1NN
 PXx1Z7qkCK7hGQ91DPdXQ2k+77GuyNBea/9+wPQ4Bj/rfH5Fpnqhg8nRcOOHp1/IHsX6
 iAguZaGbzC+rDVJ5FrYa2EBbQPN1ShC4RgZaIhgNEXdX1vWaVk2HA9tbr2upijrIQnP+
 EcxQ==
X-Gm-Message-State: AOJu0YxF6ibJrP46II9s76Nzy3C+l0S5jH1AMBhuR0RfcQl/6SZqqVGx
 O03TSjcv43c2Txop6iIktQeC0k3hpQ3ctQ==
X-Google-Smtp-Source: AGHT+IG0nR3uELSyaiRe0lgUjRgII80U3/0E1uUXwVr3Tq369lhNBp78ku5WvCfGccVWw9yCVbzFVQ==
X-Received: by 2002:a25:c54f:0:b0:d78:1502:9330 with SMTP id
 v76-20020a25c54f000000b00d7815029330mr1334284ybe.7.1693381244115; 
 Wed, 30 Aug 2023 00:40:44 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 n188-20020a25dac5000000b00d7745e2bb19sm2593856ybf.29.2023.08.30.00.40.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 00:40:43 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d77ad095e5cso5268928276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 00:40:43 -0700 (PDT)
X-Received: by 2002:a25:e90f:0:b0:d7b:89af:d3d4 with SMTP id
 n15-20020a25e90f000000b00d7b89afd3d4mr1349702ybd.10.1693381243566; Wed, 30
 Aug 2023 00:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230830062546.720679-1-javierm@redhat.com>
 <6a43a18a-bdef-5595-e9f4-38f2d1eac12e@suse.de>
In-Reply-To: <6a43a18a-bdef-5595-e9f4-38f2d1eac12e@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Aug 2023 09:40:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpC6YajGOf7XzkFfs618-WyeMNdpmpDjGrSpG7egSW6Q@mail.gmail.com>
Message-ID: <CAMuHMdVpC6YajGOf7XzkFfs618-WyeMNdpmpDjGrSpG7egSW6Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Aug 30, 2023 at 9:08=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 30.08.23 um 08:25 schrieb Javier Martinez Canillas:
> > The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
> > .atomic_check() callback") moved the allocation of the intermediate and
> > HW buffers from the encoder's .atomic_enable callback to primary plane'=
s
> > .atomic_check callback.
> >
> > This was suggested by Maxime Ripard because drivers aren't allowed to f=
ail
> > after drm_atomic_helper_swap_state() has been called, and the encoder's
> > .atomic_enable happens after the new atomic state has been swapped.
> >
> > But that change caused a performance regression in very slow platforms,
> > since now the allocation happens for every plane's atomic state commit.
> > For example, Geert Uytterhoeven reports that is the case on a VexRiscV
> > softcore (RISC-V CPU implementation on an FPGA).
> >
> > To prevent that, move the move the buffers' allocation and free to the
>
> Double 'move the'
>
> And maybe buffer's rather than buffers'
>
> > CRTC's .atomic_check and .atomic_destroy_state callbacks, so that only
> > happens on a modeset. Since the intermediate buffer is only needed when
> > not using the controller native format (R1), doing the buffer allocatio=
n
> > at that CRTC's .atomic_check time would be enough.
> >
> > Fixes: 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's .atom=
ic_check() callback")
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Javier: thanks for your patch!

> Besides the pointers, the CRTC state can also store the primary plane
> format, which you update from the plane's atomic check. By doing so, you
> wont need to refer to the plane state from the CRTC's atomic_check. The
> plane's atomic_check runs before the CRTC's atomic_check. [1]

I haven't tested Javier's patch yet, but does this mean that his patch
won't help?

The problem I saw was that these buffers were allocated and freed
over and over again on each flash of the cursor of the text console
on top of the emulated frame buffer device.

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
