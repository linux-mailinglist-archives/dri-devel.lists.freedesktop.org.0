Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF5765092
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 12:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845D210E06E;
	Thu, 27 Jul 2023 10:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994AA10E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:08:15 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4864b490e2dso282804e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690452494; x=1691057294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zcl6BwQRr5tucmG2DEZSo0kunSZ6siQNkNbMkfRPkVY=;
 b=JycG6n7pB2Sc4gu9itmnznIyAZyAdQIB07CNiP83m7hNl6udqjYylENv/mySowU910
 qRCdjGSpnRdz9zybYyllYUvG7uLY71hoFmSRW9B/7FdDM8eqlgvZpfYW87kkgcjqQchu
 ku3eAGzrBFUf8PfFTXxW4SCxeHStHNX23nhKp1c+Kmhoyy/V2AZF3GxE6uayejTpxdSh
 sd0HHoDo2cxHqGsA9aClc4E8DVw5NUOGmWR/6Dn8DVkUUjNlYLi1hJthWYqyWv54pIEU
 9q/pJxdiX5l1Lfabf6iXseMzPGBap3Uzt800tmGpGB39uWz8kV0wHn9NedIznGjVpTgI
 +RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690452494; x=1691057294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zcl6BwQRr5tucmG2DEZSo0kunSZ6siQNkNbMkfRPkVY=;
 b=ZYllXL3appOA7rqzM7IEY0Viz/ZeKVu9llLe+t/d9OPdOdEaofFIUGC6KPlVJcx6pz
 dsemeDALyhzm6wPd03jDMLItN9+ENMug7tuaZofKvT0tqMd4AS8Y2nffgzY2OEXoe468
 yPcGYDyFWsgCGml6UQc8b81fuVM8BDcpE6AYD6cFwpvJxwG2T/+JFkDa9fSmQvVxPDQK
 TRqJV79YB8H2ZaNBzKP1S6wFwyCdEufsOXplksGrUcjuqtsDSztZFqp0oBGjk2tJ1Sil
 oPGtxqYnTWtBb78+AQFKihks26I7zVARDBe9i0rfweTJtIhrrbKicMDcgoU1HiIvRkHP
 kMWw==
X-Gm-Message-State: ABy/qLZvNXWxk5JP5pkhY2JOP6+M2NX/zHtFqrfv4P/o4yiMeOWEZ6MX
 kjsyAIUxlMF5IPzmr2OLUF64x4M8H+mgS0U0lX9IDg==
X-Google-Smtp-Source: APBJJlHfFpoELAVK4ktLR6yeOkc2l8FGvVMK1919cwae7SwaJre72xp+rCBY5EOc7fMCZvRi0x4FP5bwzauhHaoJROw=
X-Received: by 2002:a1f:6058:0:b0:486:3e81:9b8a with SMTP id
 u85-20020a1f6058000000b004863e819b8amr243950vkb.13.1690452494531; Thu, 27 Jul
 2023 03:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230711133122.3710-1-christian.koenig@amd.com>
 <20230711133122.3710-2-christian.koenig@amd.com>
 <20230722220637.GA138486@dev-arch.thelio-3990X>
In-Reply-To: <20230722220637.GA138486@dev-arch.thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 27 Jul 2023 15:38:03 +0530
Message-ID: <CA+G9fYuEah=Kp9DzQf1xmG6XQCUY8f869C87MnDSQocGORV1JA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: execution context for GEM buffers v7
To: Nathan Chancellor <nathan@kernel.org>
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
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jul 2023 at 03:36, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Christian,
>
> On Tue, Jul 11, 2023 at 03:31:17PM +0200, Christian K=C3=B6nig wrote:
> > This adds the infrastructure for an execution context for GEM buffers
> > which is similar to the existing TTMs execbuf util and intended to repl=
ace
> > it in the long term.
> >
> > The basic functionality is that we abstracts the necessary loop to lock
> > many different GEM buffers with automated deadlock and duplicate handli=
ng.
> >
> > v2: drop xarray and use dynamic resized array instead, the locking
> >     overhead is unnecessary and measurable.
> > v3: drop duplicate tracking, radeon is really the only one needing that=
.
> > v4: fixes issues pointed out by Danilo, some typos in comments and a
> >     helper for lock arrays of GEM objects.
> > v5: some suggestions by Boris Brezillon, especially just use one retry
> >     macro, drop loop in prepare_array, use flags instead of bool
> > v6: minor changes suggested by Thomas, Boris and Danilo
> > v7: minor typos pointed out by checkpatch.pl fixed
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> > Tested-by: Danilo Krummrich <dakr@redhat.com>
>
> <snip>
>
> > diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> > new file mode 100644
> > index 000000000000..73205afec162
> > --- /dev/null
> > +++ b/include/drm/drm_exec.h
>
> <snip>
>
> > + * Since labels can't be defined local to the loops body we use a jump=
 pointer
> > + * to make sure that the retry is only used from within the loops body=
.
> > + */
> > +#define drm_exec_until_all_locked(exec)                              \
> > +     for (void *__drm_exec_retry_ptr; ({                     \
> > +             __label__ __drm_exec_retry;                     \
> > +__drm_exec_retry:                                            \
> > +             __drm_exec_retry_ptr =3D &&__drm_exec_retry;      \
> > +             (void)__drm_exec_retry_ptr;                     \
> > +             drm_exec_cleanup(exec);                         \
> > +     });)
> > +
> > +/**
> > + * drm_exec_retry_on_contention - restart the loop to grap all locks
> > + * @exec: drm_exec object
> > + *
> > + * Control flow helper to continue when a contention was detected and =
we need to
> > + * clean up and re-start the loop to prepare all GEM objects.
> > + */
> > +#define drm_exec_retry_on_contention(exec)                   \
> > +     do {                                                    \
> > +             if (unlikely(drm_exec_is_contended(exec)))      \
> > +                     goto *__drm_exec_retry_ptr;             \
> > +     } while (0)
>
> This construct of using a label as a value and goto to jump into a GNU
> C statement expression is explicitly documented in GCC's manual [1] as
> undefined behavior:
>
> "Jumping into a statement expression with a computed goto (see Labels as
> Values [2]) has undefined behavior. "
>
> A recent change in clang [3] to prohibit this altogether points this out,=
 so
> builds using clang-17 and newer will break with this change applied:
>
>   drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from thi=
s indirect goto statement to one of its possible targets
>      41 |                 drm_exec_retry_on_contention(&exec);
>         |                 ^

LKFT also noticed these build failures on arm and arm64 with clang nightly.


>   include/drm/drm_exec.h:96:4: note: expanded from macro 'drm_exec_retry_=
on_contention'
>      96 |                         goto *__drm_exec_retry_ptr;            =
 \
>         |                         ^
>   drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of in=
direct goto statement
>      39 |         drm_exec_until_all_locked(&exec) {
>         |         ^
>   include/drm/drm_exec.h:79:33: note: expanded from macro 'drm_exec_until=
_all_locked'
>      79 |                 __label__ __drm_exec_retry;                    =
 \
>         |                                                                =
 ^
>   drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a stateme=
nt expression
>
> It seems like if this construct works, it is by chance, although I am
> not sure if there is another solution.

Thanks for looking into this problem.


>
> [1]: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> [2]: https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html
> [3]: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096=
eb3aed7b712f5067
>
> Cheers,
> Nathan

- Naresh
