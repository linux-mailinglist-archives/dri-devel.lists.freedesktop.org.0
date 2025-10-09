Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5FBCAEC8
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 23:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3875C10EB1E;
	Thu,  9 Oct 2025 21:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YaUSiFvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDB010E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 21:27:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B918D62422
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 21:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4DFC4AF0B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 21:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760045261;
 bh=4loDIqhblCjJ30GBRu0k7u8qIz2dPxyVOru+CGKtJ74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YaUSiFvVHVUtoMbaMFXZECh1Ue/nAlF7ytJcjfdOBeUZ5qKjrmG4Vw4ZQV3Ab6/o0
 8oGRq2w0ekpTSCJuSDfKPzp3ylv9u3fDE5hKK6xoJQh44VL8D2XNG02kUCqrRGhGSA
 9q9R5MidL2Uoio3BihyomjeV9rCOfM2a9q8pyVj5fDn/I1FxIq4pRmjRsaLiWtAqh9
 ESrpzXme7KEHLYul0nVhvk0eVXvBJX0insfF9UFSLR05ft9rZ5PZy0+WcynhkLqA4i
 W5V76/vMCSX72cgCNwUFm5+5lBcL60I6Jykh8MY6aJj+Z0YV1FUhsj34rgK17XeEQr
 tqi/cR5jFxMTA==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-58b025fce96so1250770e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 14:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIgfLBT6cxVkRx6eRWixIz8kH2ODCbuQi41UhUEpHeADB/8MFk2nWL9E37noVuLE/1p7kA0Fe24LI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbfnG/NO0c50vMfxep2XRwiDVXmg20d9lYeB+KBysEnYcUpaB4
 F4Puy6rbTdG4hqx+WcaewBkOoPNk0DnLzOugKFNuKdlxKkmfwvJdcrV2OfVUcEiZJbbzhuf3oQ7
 dOEErEa2t7ArCni332sqswEYxP8yxA3Y=
X-Google-Smtp-Source: AGHT+IER/TjSS/ftsXuN+vL0Qr19tffVlZEETaCj2FrKKovdy0RneNyLm8hMt38oGA2BPK1mfYI7btUasVrhpusvupY=
X-Received: by 2002:a05:6512:3ca8:b0:57d:92ec:67de with SMTP id
 2adb3069b0e04-5906daeb7b6mr2786494e87.57.1760045259802; Thu, 09 Oct 2025
 14:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251009150621.3886079-2-ardb+git@google.com>
 <bbc089aa-934d-4dd3-825a-53f8e98dfd3f@amd.com>
 <15d5b9dc-8452-411c-9957-ba759d307223@amd.com>
In-Reply-To: <15d5b9dc-8452-411c-9957-ba759d307223@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 9 Oct 2025 14:27:27 -0700
X-Gmail-Original-Message-ID: <CAMj1kXGLdNDJRgQg2Hr9YM4Ke6Sb6KLr8Ws-QY+umR4NpXjg4w@mail.gmail.com>
X-Gm-Features: AS18NWBLRyAo4AK5pdIQjAzn4UZLNTXw2YS4IciwUevqRyoiy4COy88E11E6XIM
Message-ID: <CAMj1kXGLdNDJRgQg2Hr9YM4Ke6Sb6KLr8Ws-QY+umR4NpXjg4w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP
 compilation units
To: Harry Wentland <harry.wentland@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Austin Zheng <austin.zheng@amd.com>, 
 Jun Lei <jun.lei@amd.com>, Leo Li <sunpeng.li@amd.com>, 
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

On Thu, 9 Oct 2025 at 13:41, Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2025-10-09 12:19, Christian K=C3=B6nig wrote:
> > On 09.10.25 17:06, Ard Biesheuvel wrote:
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> Test the existing CPP macro _LINUX_FPU_COMPILATION_UNIT, which is set
> >> when building source files that are permitted to use floating point,
> >> in the implementation of DC_FP_START/END so that those are only usable
> >> in non-FP code. This is a requirement of the generic kernel mode FPU
> >> API, as some architectures (i.e., arm64) cannot safely enable FP codeg=
en
> >> in arbitrary code.
> >
> > If I'm not completely mistaken that is actually an issue on basically a=
ll architectures, at least x86 is affected as well if I'm not completely mi=
staken.
> >
> >> Cc: Austin Zheng <austin.zheng@amd.com>
> >> Cc: Jun Lei <jun.lei@amd.com>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Leo Li <sunpeng.li@amd.com>
> >> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Anyway, patch looks sane to me but I'm not so deep in the DC code to fu=
lly judge.
> >
> > Fell free to add Acked-by: Christian K=C3=B6nig <christian.koenig@amd.c=
om>, but Harry and Leo need to take a look.
> >
>
> Thanks. Good safe-guard. Flags a bunch of issues in the
> current code. Let me fix them before merging it.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>

Thanks.

I already fixed a bunch here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Dddbfac152830e38d488ff8e45ab7eaf5d72f8527
