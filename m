Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24078267B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30C110E21D;
	Mon, 21 Aug 2023 09:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BE410E21D;
 Mon, 21 Aug 2023 09:48:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d71c3a32e1aso3025334276.3; 
 Mon, 21 Aug 2023 02:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692611327; x=1693216127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=no9p+B7oDPokffxcX8RBtqzmO6q5O0GYwd0gNXSjVBA=;
 b=Ms15s/VeetL88i+p2/Y7DlrbskCw+Ay2FyiVl7j0/3zoQtK6/xRRoHNAv2aPbr+aAs
 rBVK19+T+/n6WAeLVv6G3tPTZvRTQx+JcVS3l43AwrYhgzQVQjkPAh4coPDBKn2q3/IL
 u/cjSiHqANcp57mJa1WSVUVzlVuhZY2PtuQP/F6zQXmE+fk7RBF7tEwAbY9cc2xF7rQs
 bW8AfXS/V7PdTb9Zi7lHq00QedqGYEKBQipUvVBS7ISuDZz63yOHbcBz/tBp375x3LOY
 7qPpdCnAnyNoakaOFiLTs7ysJehdAqouRbGUNDYzNi/cb5wEQyrF+58p1X572FycE7Fg
 856A==
X-Gm-Message-State: AOJu0YxfYwiPetab/qyX9twEH0IISTldeeDrdFIvIhKmh8nezgyuCdd9
 rJXZPj/vHXqPoBLweQUFsfKRRftxZ1B6KQ==
X-Google-Smtp-Source: AGHT+IETDgZrKHduPbLYGIUTTWhS3DRgf5FRdc+wvqiaANkUOahhfN2VbGQvIGmlHr/3b7sUyXiEZw==
X-Received: by 2002:a25:ace5:0:b0:d04:caf3:261e with SMTP id
 x37-20020a25ace5000000b00d04caf3261emr6548114ybd.53.1692611327301; 
 Mon, 21 Aug 2023 02:48:47 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 o131-20020a257389000000b00d749efa85a1sm751333ybc.41.2023.08.21.02.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 02:48:47 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-579de633419so36151907b3.3; 
 Mon, 21 Aug 2023 02:48:47 -0700 (PDT)
X-Received: by 2002:a25:e00f:0:b0:d4f:f231:78be with SMTP id
 x15-20020a25e00f000000b00d4ff23178bemr6368153ybg.6.1692611326741; Mon, 21 Aug
 2023 02:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
 <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
 <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
 <CAMuHMdUzqTF9hfe91QN2woV=ycUjLJ-WsODYG8_jH5ABkNk8mQ@mail.gmail.com>
 <d16bf538-f4f8-50ec-e0e9-5a194b113db4@amd.com>
In-Reply-To: <d16bf538-f4f8-50ec-e0e9-5a194b113db4@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Aug 2023 11:48:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0ckw=Bm5-HAy54UPaAEW_zyZLeC8r3K=iBMUZerCjYw@mail.gmail.com>
Message-ID: <CAMuHMdV0ckw=Bm5-HAy54UPaAEW_zyZLeC8r3K=iBMUZerCjYw@mail.gmail.com>
Subject: Re: [PATCH libdrm v2] amdgpu: Use PRI?64 to format uint64_t
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Mon, Aug 21, 2023 at 11:34=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 21.08.23 um 11:14 schrieb Geert Uytterhoeven:
> > On Fri, Jul 7, 2023 at 9:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> >> On Fri, Jul 7, 2023 at 2:06=E2=80=AFPM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>> Am 06.07.23 um 10:36 schrieb Geert Uytterhoeven:
> >>>> On 32-bit:
> >>>>
> >>>>       ../tests/amdgpu/amdgpu_stress.c: In function =E2=80=98alloc_bo=
=E2=80=99:
> >>>>       ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format =E2=80=
=98%lx=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 4 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long =
long unsigned int=E2=80=99} [-Wformat=3D]
> >>>>         fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%=
x, size %lu\n",
> >>>>                                                      ~~^
> >>>>                                                      %llx
> >>>>          num_buffers++, addr, domain, size);
> >>>>                         ~~~~
> >> [...]
> >>
> >>>> Fix this by using the proper "PRI?64" format specifiers.
> >>>>
> >>>> Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
> >>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> Well generally good patch, but libdrm changes are now reviewed by mer=
ge
> >>> request and not on the mailing list any more.
> >> I heard such a rumor, too ;-)
> >>
> >> Unfortunately one year later, that process is still not documented in
> >> https://gitlab.freedesktop.org/mesa/drm/-/blob/main/CONTRIBUTING.rst
> >> which still instructs me (a casual drive-by developer) to just submit
> >> my patches to the mailing list...
> > So a few weeks ago I created gitlab PRs for all my pending libdrm
> > patch series, and I rebased them regularly when needed.
> > What needs to be done to get them merged?
>
> You need to ping the userspace maintainers for this. Like Marek,
> Pierre-Eric etc..

Thanks, I assume (from "git shortlog") you mean Marek Ol=C5=A1=C3=A1k and
Pierre-Eric Pelloux-Prayer?
How do I find out the maintainers for non-amd parts?

Looks like this thread is becoming a "what is missing in
CONTRIBUTING.rst?" list ;-)

Thanks again!

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
