Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A6463424
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014826E4D2;
	Tue, 30 Nov 2021 12:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E306E92A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 12:04:16 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id p4so26413110qkm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 04:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0TDfEMK/KsWzDzMYVf16B8nf+1SscGhMhouVQsRYobA=;
 b=PyDcfZpXtYt3oGURyS+5a12jt0Y5bvbUlNrbCZz1w0WLKpTTZwftgbaHiJAsW0HSV3
 lyURilx6RGKAAJfAPihxYa/9smThOFBYpttJdjv6/b/H/LHOfwcmpyDu47CI0ZvJtWjm
 Ok6By6cZC7JyccNda3BE+8h6F/VSvhttvpNrI9kz+KWq4D5cJ/BUx+NGSjJvbVcY7lr6
 hDhzVfe2hER7ylpQrb7aJj4lq/RNWSqjQrGeiQDm3PTnPWSoX1xlpJzShhPjk8BuW+JN
 6+DfjZ+xO+ZouKrFOppCMoTysuuE8ZFjZyOvgUsDqkOoOdhUPcBMl9W+wLP0ktUtfZ3o
 jfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0TDfEMK/KsWzDzMYVf16B8nf+1SscGhMhouVQsRYobA=;
 b=32j02kf+UzPIlAw9MWJwEtnvv84OXGlYFhrfcoRr/a95eNkEQtllR6qe5ofoqUUuvh
 XsrWIKBJYG+Q0mc+qCFpJmNEr+slZv7xV3C7mNBc5VxTySY5NYwBNfs5dqtMNJbRI703
 yckT5+I2/gdirvGZPDR7NFVAKLH9XWa8S2wtwxJrwjDsE1xNKxlVhuD+XUHzFg84JGB5
 +toLtyD4ry5mN8rWoG83ynjYBF+oppr/4apyrIHsdBBgKDY0A5CnoKlNrU/YGtep49h9
 D2c4J/6bPmeu+sraEi5eKMZdu3g7Wvn9snZWxzZWdMtH9J3JF4YnUDFPBz4zuJiKtRPe
 janA==
X-Gm-Message-State: AOAM531SNIIAwrnr04NmC+6PF9Ndgxgd86nn0AetjkLxWceX002EinOM
 CnRuhyIEUU/NgaRgBdQ64bO7cvpKctkRavBIG4FX9A==
X-Google-Smtp-Source: ABdhPJwUsLfTa42RaUov5RS9fCUqXRqbdlJQej/TrtDN+wj6yAPMSmvLGq5UUPagfhJbUp/7Nt/oEtRA+7wRJzCr0AE=
X-Received: by 2002:a05:620a:d84:: with SMTP id
 q4mr37009939qkl.610.1638273855141; 
 Tue, 30 Nov 2021 04:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20211130095727.2378739-1-elver@google.com>
In-Reply-To: <20211130095727.2378739-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 30 Nov 2021 13:03:37 +0100
Message-ID: <CAG_fn=X8FhDPKFGM2zrVp=OACDXSxe3J32CDOQ9_jr0sSCBaoA@mail.gmail.com>
Subject: Re: [PATCH] lib/stackdepot: always do filter_irq_stacks() in
 stack_depot_save()
To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 30 Nov 2021 12:21:37 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Imran Khan <imran.f.khan@oracle.com>, Vijayanand Jitta <vjitta@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 Vlastimil Babka <vbabka@suse.cz>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 11:14 AM Marco Elver <elver@google.com> wrote:
>
> The non-interrupt portion of interrupt stack traces before interrupt
> entry is usually arbitrary. Therefore, saving stack traces of interrupts
> (that include entries before interrupt entry) to stack depot leads to
> unbounded stackdepot growth.
>
> As such, use of filter_irq_stacks() is a requirement to ensure
> stackdepot can efficiently deduplicate interrupt stacks.
>
> Looking through all current users of stack_depot_save(), none (except
> KASAN) pass the stack trace through filter_irq_stacks() before passing
> it on to stack_depot_save().
>
> Rather than adding filter_irq_stacks() to all current users of
> stack_depot_save(), it became clear that stack_depot_save() should
> simply do filter_irq_stacks().
>
> Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
> ---
>  lib/stackdepot.c  | 13 +++++++++++++
>  mm/kasan/common.c |  1 -
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index b437ae79aca1..519c7898c7f2 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -305,6 +305,9 @@ EXPORT_SYMBOL_GPL(stack_depot_fetch);
>   * (allocates using GFP flags of @alloc_flags). If @can_alloc is %false,=
 avoids
>   * any allocations and will fail if no space is left to store the stack =
trace.
>   *
> + * If the stack trace in @entries is from an interrupt, only the portion=
 up to
> + * interrupt entry is saved.
> + *
>   * Context: Any context, but setting @can_alloc to %false is required if
>   *          alloc_pages() cannot be used from the current context. Curre=
ntly
>   *          this is the case from contexts where neither %GFP_ATOMIC nor
> @@ -323,6 +326,16 @@ depot_stack_handle_t __stack_depot_save(unsigned lon=
g *entries,
>         unsigned long flags;
>         u32 hash;
>
> +       /*
> +        * If this stack trace is from an interrupt, including anything b=
efore
> +        * interrupt entry usually leads to unbounded stackdepot growth.
> +        *
> +        * Because use of filter_irq_stacks() is a requirement to ensure
> +        * stackdepot can efficiently deduplicate interrupt stacks, alway=
s
> +        * filter_irq_stacks() to simplify all callers' use of stackdepot=
.
> +        */
> +       nr_entries =3D filter_irq_stacks(entries, nr_entries);
> +
>         if (unlikely(nr_entries =3D=3D 0) || stack_depot_disable)
>                 goto fast_exit;
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 8428da2aaf17..efaa836e5132 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -36,7 +36,6 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags, bool=
 can_alloc)
>         unsigned int nr_entries;
>
>         nr_entries =3D stack_trace_save(entries, ARRAY_SIZE(entries), 0);
> -       nr_entries =3D filter_irq_stacks(entries, nr_entries);
>         return __stack_depot_save(entries, nr_entries, flags, can_alloc);
>  }
>
> --
> 2.34.0.rc2.393.gf8c9666880-goog
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
