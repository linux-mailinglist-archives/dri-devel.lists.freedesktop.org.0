Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B1892E51
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 04:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3510E950;
	Sun, 31 Mar 2024 02:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZ9D70uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C7510E950
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 02:34:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3703660A05
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 02:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91934C43394
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 02:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711852444;
 bh=+9xtEveTESmqEmgqfqi/AHy+l/CY7o7HoCu99ORDDcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PZ9D70uVOm8Q1eV7TepfO1FkN+1k1kWNkT6Ku6f/2s6iTAOV7tZxn2zhkvPsVyaFX
 RPw7j/3dyOXbWPTqh7GDBBmESHoa0/CSjp3BgTh7gbx5KJ1tdiDym07g+AY4FzPgQS
 DKX7tgoR9K9mHdV/+tGZPsttPaEAScJJhqA81HNprVN9Fu9EJ0XTEzkGTvbaVJb6Hx
 Qzks5PLB5vorWVg53klblNq3phtjvnvFZqLRpBY/lb0TuCBuxS4GgeeCTYGb+VI6ok
 zfc1qtwfOHsXCTucSL4Xb61hPPubFgtHkxN2eCV1J182QybCpwgfTt0/4sSb25g/FL
 PUk6ZaAAFbN5g==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d4886a1cb4so38152571fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 19:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXf4g3gVgY2aR/8OHFjYeJ/giJh+8nh+oaLkHaLjbMfGVa8Y4FcZFAfoUB85K8ZHtVjUxg0ohil5wNZNK5Vuan10bzNjkfpmqfXxFhKPXf0
X-Gm-Message-State: AOJu0Yy/8FwiY8q6yxlhAjx3F+RKZABZfD+ypCCKxJYGx5a3kg4tG4ma
 OoqlTJ4IGr3L1X5cPzIAmxkDTWrJjuVi3OSCpHNWa9aBKzX314NabekXYV7o+tSMf84CwhdpYhI
 MvxdXgL/Te2R7mo424oR8BCsRCoA=
X-Google-Smtp-Source: AGHT+IGpEQPL0v7g3+p+5E8g7HGnWQKzlMop6CryhqCRVmhK61t313PDdp5vf1ukKDWFXpyLX2tmge1Ix/vKXAwQ4u4=
X-Received: by 2002:a2e:9914:0:b0:2d4:6aba:f1a9 with SMTP id
 v20-20020a2e9914000000b002d46abaf1a9mr4254960lji.40.1711852443253; Sat, 30
 Mar 2024 19:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org>
 <87jzlohhbc.fsf@intel.com>
 <cb853762-06d4-401c-a1c8-07a0c031b499@app.fastmail.com>
 <87edbwglle.fsf@intel.com>
 <07c604d1-6304-4ff8-844b-03c3d5c727ad@app.fastmail.com>
In-Reply-To: <07c604d1-6304-4ff8-844b-03c3d5c727ad@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 31 Mar 2024 11:33:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmABUDDTFtp_HCqKid7=8011wk0HMgHYGHWOLunhpxXA@mail.gmail.com>
Message-ID: <CAK7LNARmABUDDTFtp_HCqKid7=8011wk0HMgHYGHWOLunhpxXA@mail.gmail.com>
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-kbuild@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mm@kvack.org, llvm@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 27, 2024 at 6:23=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Mar 27, 2024, at 08:50, Jani Nikula wrote:
> > On Tue, 26 Mar 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> >> On Tue, Mar 26, 2024, at 21:24, Jani Nikula wrote:
> >>> On Tue, 26 Mar 2024, Arnd Bergmann <arnd@kernel.org> wrote:
> >>
> >> It works now.
> >>
> >> The original __diag_ignore_all() only did it for gcc-8 and above
> >> because that was initially needed to suppress warnings that
> >> got added in that version, but this was always a mistake.
> >>
> >> 689b097a06ba ("compiler-gcc: Suppress -Wmissing-prototypes
> >> warning for all supported GCC") made it work correctly.
> >
> > Oh, nice! Then I think we'd like to go back to __diag_ignore_all() in
> > i915 and xe.
> >
> > The diff is below. I'm fine with you squashing it to your patch, or if
> > you want me to turn it into a proper patch for you to pick up in your
> > series, that's fine too. Just let me know.
>
> I think I'd prefer to keep my patch simpler for the moment and
> get that merged through the kbuild tree, it already touches
> too many places at once.
>
> It may be better for me to just drop the drivers/gpu/ part of
> my patch so you can just just take your patch through the
> drm tree. I actually have a similar patch for the amdgpu driver
> that I can send if you like this option better.
>
>     Arnd
>



Applied to linux-kbuild/fixes.
Thanks.

--=20
Best Regards
Masahiro Yamada
