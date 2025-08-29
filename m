Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF0B3BA21
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183D010EB8C;
	Fri, 29 Aug 2025 11:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F8FZV0lu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37FF10E210;
 Fri, 29 Aug 2025 11:47:10 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-772301f8ae2so386181b3a.0; 
 Fri, 29 Aug 2025 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756468030; x=1757072830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3aL9TyrDBD+41MxcNqNPswRRtMn2G5SQaDS6oW7qDA=;
 b=F8FZV0lu+UkpMUm3mfNybfyBCyb5iwi55hdbnbVvNSyjt4vBXi1o/gp/2Va63QsLqu
 sh0/igHR6xKPs7HNGbMLWKdl8E04LhOHBz8I+Fcwd2Zqho12Mu8wdIRg6lHz2tSsOAoh
 lClnTDOhFKQVxviLVJUMxP51eGNM2f7bT/3J+aqLuv+3FI0GFcK8rPYIEnztEUfaDCPq
 u9ZsFmO/Mw82fpohWAKg6rFDtgoaeh6NZNYtnn57iSOQ+Tej64mSpqg0qhd6iNWmVjkT
 m+nQ2VFHH8EivdDx4eKp90Ghof802OF7nppHwUMST7jgXi1HtVWf+/yxUiwuzg/Jwhom
 D9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756468030; x=1757072830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3aL9TyrDBD+41MxcNqNPswRRtMn2G5SQaDS6oW7qDA=;
 b=K+CMV+Ro6kqVL7sXPNkg9bowmwjp0+fFPfPgb0zHR5+zsbcFMGImOSf/X/K7A3KgdM
 zJhaskjUzgY1BDBkQExUHsPvGIaPQH9vgTKAc7jzR21GI/Fo9E3mvC52nWE4qakZ2+q0
 Q81Zduo6wpisd7OHhIjnbnOViedpmu7cq71vGdypXUNPwZrQxw6gLz8ml4PGYo3uoep6
 szT/s5Bv1IlOWnU4wmHquT9znEIAGqYoJWH5iAGEOdbvO55VbWdoz1U4hvYySNpxjGkL
 gAtjdD9ZvQ6Pb1k8E+91H117aA75AG7JEv1W0vsSDD0RvUYwANFhwB4Npsh+57tnQw4L
 GKow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDEUqOnyvdbp7xMH2dtMVZIK8kG4T+O6FeStXTMEG4Jqp503fZPSR39OCuHlc6MtmKKvNusJ0qy70=@lists.freedesktop.org,
 AJvYcCXG3utUKc5frH+ZhVPJgo1DpLDwvrU5xTDLcd37HS9mMSz+Fzg9FB4212a1Ozo7HUzXF4J8EzLaCalG@lists.freedesktop.org,
 AJvYcCXbiHaDV1441GgRqNtMB88MhmqUiji8ZvE8uxX+/VxDxzB1xKywi2KU5QN5ODNX65YwQKJGPB5cNA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHNWFsbbkDGDr5pl+J6l9IlMLBy+cN3nLmJzrYMhvriLdXbuTy
 9u636pl6Us8E/qJC9XDWI+qelpp+zBYJEk6wbEP+EQVu0HW9B5g8S0yshl6vKBTv5zb4EChE8Gu
 OgDWxCB81zioEzA/WIC6qNqpmbVSzmP4=
X-Gm-Gg: ASbGncu0wXdnhZ8a78f0gCgeo4Z/jE05VJs5oNFsf/FpfqAPDw1b/8qSDPjJgANrWnK
 4PyQ9pwud5lubVEuonJdAdQF939vTxsX+3eppKFIrAiQfhjQjEo4zS1Tz2iWDKhVGgetVjqloq6
 FpOLPs7t8/Tkfh7eKchzqNJsJsSAL9sI67utek1LtAbghUZsIE10AT6Ra9db145EuNvffkqXSJs
 wm9mZ/50tfvG2haNh+t
X-Google-Smtp-Source: AGHT+IHvLfek31VXf7RngwyFnxOVxPeCuu8/YY+9uf3uNNAEcN03jZtmPXYQXY7xNfrxkPQC7UE+3DIaqUxDQvhJ/Yc=
X-Received: by 2002:a17:902:db08:b0:248:cd0b:343f with SMTP id
 d9443c01a7336-248cd0b3962mr96820715ad.11.1756468030097; Fri, 29 Aug 2025
 04:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
In-Reply-To: <20250828130402.2549948-1-daniel.almeida@collabora.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 29 Aug 2025 14:46:59 +0300
X-Gm-Features: Ac12FXwaEVqYONkg3YUKibVhpsS_uDH9AZfIuHLnqOHOD4zbpBW7RbhIJaSCUXI
Message-ID: <CAJ=qYWRt8jdVRtXJxdF2aMg=D48E_r4JSwZcnT_ypzprwDp3eA@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/4] Add initial Panthor tests
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com, 
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com, karthik.b.s@intel.com, 
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com, 
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Hi Daniel,

I was taking a brief look at your patches. I didn't spot anything
terribly wrong, and as I figure this is new platform you will build
into igt and nothing current seems to be broken from your patches so
all look ok. Still, few comments I did come up with.

On lib new public functions there's been expectation for them to
include the comment block. Those small detail 'nitpicking', people
have been favoring c style comments instead of c++ that is /* */
instead of //. For subtests there's supposing to be igt_describe(..)
before the test. As for that absence of checkpatch, we've been using
just the version from kernel.

Changes on those meson scripts I hope Kamil notice and could take
quick look, I think Kamil knows best the life of those build scripts.
Generally I think it would be good if on the last patch you could
separate changes in lib and tests to different patches. Imo it would
be easier to deal with, ie if there come some wishes from someone for
some changes in test (like you now got some comments), lib could
anyway be merged if they're not in the same patch. For overall how the
tests otherwise look like I have zero comment since I don't know
anything about Panthor. Would be good idea to add comment block for
subtests to tell what the subtest attempt to test at least when it's
not obvious.

/Juha-Pekka

On Thu, Aug 28, 2025 at 4:04=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
> This series adds basic Panthor tests. In particular, these are being
> used to test both Panthor and Tyr, i.e.: the new Rust GPU driver that
> implements Panthor's uAPI. Most of the initial tests were chosen in
> order to have something to test Tyr with, but this series lays the
> groundwork so that more interesting tests can be added to test more of
> Panthor itself.
>
> Also, please note that this is my first IGT patch, so apologies in
> advance in case I forgot to follow any IGT-specific workflow when
> submitting this. I don't see a checkpatch.pl equivalent, so there was
> nothing to check this submission with as far as I am aware.
>
> Daniel Almeida (4):
>   lib: add support for opening Panthor devices
>   tests: panthor: add initial infrastructure
>   lib: initial panthor infrastructure
>   tests/panthor: add panthor tests
>
>  lib/drmtest.c                 |   1 +
>  lib/drmtest.h                 |   1 +
>  lib/igt_panthor.c             | 150 +++++++++++++++++++
>  lib/igt_panthor.h             |  28 ++++
>  lib/meson.build               |   1 +
>  meson.build                   |   8 ++
>  tests/meson.build             |   2 +
>  tests/panthor/meson.build     |  15 ++
>  tests/panthor/panthor_gem.c   |  59 ++++++++
>  tests/panthor/panthor_group.c | 264 ++++++++++++++++++++++++++++++++++
>  tests/panthor/panthor_query.c |  25 ++++
>  tests/panthor/panthor_vm.c    |  73 ++++++++++
>  12 files changed, 627 insertions(+)
>  create mode 100644 lib/igt_panthor.c
>  create mode 100644 lib/igt_panthor.h
>  create mode 100644 tests/panthor/meson.build
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_query.c
>  create mode 100644 tests/panthor/panthor_vm.c
>
> --
> 2.50.1
>
