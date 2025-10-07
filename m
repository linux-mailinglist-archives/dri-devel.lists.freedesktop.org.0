Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC5BC2B3A
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 22:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862C10E6FE;
	Tue,  7 Oct 2025 20:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CE0S4v0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAB610E38D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 20:52:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57E274055B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 20:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF78C4CEFE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759870355;
 bh=y8/GMUldGG3w+0pZPoxpukYxq6AmGwZnw9wcgcC5hw8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CE0S4v0eb4SvIu9cYkNeO8SZpv/02gbFtSP5tQebsDHrs+6NT5zYnwT7b6iUWHLho
 W55kL+t1f/pqDC8H8A8ZenEzpty98DQMItE0PHI3JSswbh/m0ntC1qTchisqbwFT0j
 3qHSo4wbFIgWjmhN5Y038PWu6Wo9CWnfqAZqB75gcnk+V4f+QByD+1awtZjXEv35A3
 9B0zpylF53vJwCgtcqSfp5vhTjSk+Kk9DA6S0+wC8057ZRgSCt9fMuzpKZJ0LxBSqK
 Eji0VOEnXpDhwZtdGv/8Phf7pp/BW3SxxhL78lhIsMn50+ZZChgM6221ON9zmMptt9
 qzgm+rXyDbL1w==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57f0aa38aadso7373349e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 13:52:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWF775mCf4XsOXDe60RwSEm7X4tuoh6DGNnAhG1LhwiA3FQJidftOAqGvdtAgxC0l5QY6bhrLVMWCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZypOVlLba42Y7k6GVvaSjz1FL3w74nutCintu3ShhrdLmDLx5
 mYe3vxy0mqBq8PybuaEt5waejKVaJ5qx7o9WTR7ofTWMgUZAsDNjsKjbgDBFPAuBnb9BV4EIRXq
 3XrG8unFekbIoPRdv+VGjB8MWK82uayI=
X-Google-Smtp-Source: AGHT+IFWqLgtXiTrJW6mGp3mRySogk1jb7z6qNnqnVCTlvVrrsiW7mc/3XsIbu+BF3mk4txNgZWky6Zv0V7pXdHDgXU=
X-Received: by 2002:a2e:bd16:0:b0:338:8b9:293a with SMTP id
 38308e7fff4ca-37609d72b5emr2423171fa.13.1759870353542; Tue, 07 Oct 2025
 13:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251002210044.1726731-2-ardb+git@google.com>
 <5824c012-dcb2-4312-9b16-810656290831@amd.com>
 <CAMj1kXHUjL7=CPz0viSBvfeX=BKNYuUkrpTizn9H1ZgJecB6cQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHUjL7=CPz0viSBvfeX=BKNYuUkrpTizn9H1ZgJecB6cQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 7 Oct 2025 13:52:22 -0700
X-Gmail-Original-Message-ID: <CAMj1kXEzNPJOE_-gndNcFmE9CjLpsFCjfytaXbvm-1Khu62XRA@mail.gmail.com>
X-Gm-Features: AS18NWCUcEc5v5iNbYwR-ag_-_0hSbWa3FKTC6RSEE69o8OM0SeSucBijz0KzNY
Message-ID: <CAMj1kXEzNPJOE_-gndNcFmE9CjLpsFCjfytaXbvm-1Khu62XRA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, will@kernel.org, 
 catalin.marinas@arm.com, mark.rutland@arm.com, broonie@kernel.org, 
 Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Mon, 6 Oct 2025 at 12:59, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 6 Oct 2025 at 19:42, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> >
> > On 02.10.25 23:00, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > The point of isolating code that uses kernel mode FPU in separate
> > > compilation units is to ensure that even implicit uses of, e.g., SIMD
> > > registers for spilling occur only in a context where this is permitte=
d,
> > > i.e., from inside a kernel_fpu_begin/end block.
> > >
> > > This is important on arm64, which uses -mgeneral-regs-only to build a=
ll
> > > kernel code, with the exception of such compilation units where FP or
> > > SIMD registers are expected to be used. Given that the compiler may
> > > invent uses of FP/SIMD anywhere in such a unit, none of its code may =
be
> > > accessible from outside a kernel_fpu_begin/end block.
> > >
> > > This means that all callers into such compilation units must use the
> > > DC_FP start/end macros, which must not occur there themselves. For
> > > robustness, all functions with external linkage that reside there sho=
uld
> > > call dc_assert_fp_enabled() to assert that the FPU context was set up
> > > correctly.
> >
> > Thanks a lot for that, I've pointed out this restriction before as well=
.
> >
> > Since we had that issue multiple times now would it be somehow possible=
 to automate rejecting new code getting this wrong?
> >
> > E.g. adding something to the DC_FP_START()/DC_FP_END() or kernel_fpu_be=
gin/end macros to make sure that they fail to compile on compolation units =
where FP use is enabled?
> >
>
> Something like the below perhaps?
>

Never mind, that doesn't work. dc_fpu_begin() is an out-of-line
function, and so it is the DC_FP_START() macro that evaluates to
something that includes an arch-provided assert. I'll code something
and send it out.
