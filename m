Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D778FA06
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099C110E748;
	Fri,  1 Sep 2023 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C3510E1A5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:36:31 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-490cd6db592so91393e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 01:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693557390; x=1694162190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9In4nrX/GR/RCCX5fOoCIkv3k2tP/MwKkhXoJjcyrpw=;
 b=XMk6kNJsFgrCTlOcAPkLq8DkEDRs/lumwBoj0FE3GPoQHJh9MRNlIAmT/BSWbtMIzn
 zcZFQrty7lzAoo7xuzd0lewe3XM5uGXIF3ETxOfHbmWLu+bT3wiO+M3MZY7/z9oZLVxi
 q7yueogMP6ZE4H/hwzKiyzq1AZSvUqrQ3h0jZL1RUhoMU6I0OIpDMYws/3pMM8bsLTAm
 MPd62k6qQL8PMkoKmmcqNYKnb+ayRxjY6dnhMNCnUhr9DEPYj2utj1umo5gD+ktUe0Zd
 dqqnbyCSg//L5K39485hvUaIeiDV3XK0tFf+tNIAuhBUyHAsSo1AWe+1Vx6h5DcXkV/l
 /T6Q==
X-Gm-Message-State: AOJu0Yxgwgn6XEn511oPSKhLgi750FwiqebbAFZKTEdQmHXNbFOhiTGx
 YhFPJEVLS9yc/kpGHcXxjRdKCEONKPDurA==
X-Google-Smtp-Source: AGHT+IGtROSDUgZF/ESo/ajtcM0io4rcNrWoh4dvqHE5ILlDAybuJJPf45jGGp/GN+78BEHaEKOv+A==
X-Received: by 2002:a1f:c7c7:0:b0:48f:e0c4:1a1 with SMTP id
 x190-20020a1fc7c7000000b0048fe0c401a1mr2120600vkf.12.1693557389763; 
 Fri, 01 Sep 2023 01:36:29 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 p128-20020a1f2986000000b0048fcd6ee5dcsm554856vkp.39.2023.09.01.01.36.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 01:36:29 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-44d56d26c32so827097137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 01:36:29 -0700 (PDT)
X-Received: by 2002:a67:e951:0:b0:44d:4aa1:9d3a with SMTP id
 p17-20020a67e951000000b0044d4aa19d3amr2382924vso.32.1693557388788; Fri, 01
 Sep 2023 01:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230830062546.720679-1-javierm@redhat.com>
 <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
In-Reply-To: <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Sep 2023 10:36:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
Message-ID: <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Sep 1, 2023 at 10:22=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas wrote:
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
>
> I'd like to have numbers on that. It's a bit surprising to me that,
> given how many objects we already allocate during a commit, two small
> additional allocations affect performances so dramatically, even on a
> slow platform.

To be fair, I didn't benchmark that.  Perhaps it's just too slow due to
all these other allocations (and whatever else happens).

I just find it extremely silly to allocate a buffer over and over again,
while we know that buffer is needed for each and every display update.

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
