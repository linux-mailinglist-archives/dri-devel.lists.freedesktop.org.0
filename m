Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9835C464944
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 09:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A526EE75;
	Wed,  1 Dec 2021 08:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9B46E8A3;
 Tue, 30 Nov 2021 14:33:52 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id k21so26327071ioh.4;
 Tue, 30 Nov 2021 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvFvndBl4Bydux7YEgvSu6yBLgLtvHPAwDkKBUzy3MQ=;
 b=DTpy4LJX5vuS+gtnzgO+ty8a1J2mBtBHacEvP1LZaKaTqkRDxbjFzJI99OAaZwlblU
 iw6pUW5DB/W9iWDF0Me9jj5mlzYr1J0dBOoIo1jVzH91TK4aAm5dCIZxVYZi7AxY67hn
 rJBiUcKmWm/L6g8qzPoZ+eTyDPND6CoPfEed1nSwAEoRwoWEOOmc3e5hU/9hPb/BnNwT
 zwO249C2NX6cb3rHF0JFCtBgXkmeuPOFs8dmi4nYHimvyTQ0X0jxcb6bWh7lrHDlA0Ii
 2KY+nGNL9ug8Ny/6adOjhf2deqTWn7Gklh+KBZ4g3ix/akUO/VRb3NEB1YwjdoftvY2x
 yuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvFvndBl4Bydux7YEgvSu6yBLgLtvHPAwDkKBUzy3MQ=;
 b=qHeTXRZqSW4aGrPRAMqCXZqCnMXaNR20uq/Ggot3DCVCFYS7Wkq8JNM02kZJdnrjQ4
 9urciRls6L8rq4iDFuopRUBEcdYJSHZD9uG8NPkDs1sNp8Lp6B6maSfonGoZq8KuEVKw
 CtY95++NeoDYp8oMGk49cU7lMApoAGv8gyLnIH4r4vstbHVDsx9ZNP1vUaRPnMZRpDOJ
 X6gclbH33UEkn5IJNtBcllFM0qo2WSs5TlbimzuDHokm4Rg3uQwLGy/fqorYQcH3rq6J
 VNAstfFqzzpp9lRYReRiYsTIkwKxUw99nbh+gNzFVeC0UOYAxVYfWgxEvkttMFtJXz4O
 ecCg==
X-Gm-Message-State: AOAM530k8MNV4cy82hDp6XblOjSUK583GH3RJTWfDeyXX/vGQDYN2DK5
 /7gTYZHQzza2EbP7XzfWScn71ikrXwUz/APd+3s=
X-Google-Smtp-Source: ABdhPJzI7PIJq5HrCfzlxDRzoUVWPYEqe5LkOcdc3MqSXtKmXZp9CsxTy+8jedmlD8Ani/UF1Mfqt8vJbKVG0KUZqGI=
X-Received: by 2002:a05:6638:2257:: with SMTP id
 m23mr72343928jas.17.1638282832252; 
 Tue, 30 Nov 2021 06:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20211130095727.2378739-1-elver@google.com>
In-Reply-To: <20211130095727.2378739-1-elver@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 30 Nov 2021 15:33:41 +0100
Message-ID: <CA+fCnZdO4OqLqUyCJ6YQbpgAOpDk_BQrUBgP87KQmw7qv7zTZQ@mail.gmail.com>
Subject: Re: [PATCH] lib/stackdepot: always do filter_irq_stacks() in
 stack_depot_save()
To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Dec 2021 08:05:16 +0000
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Imran Khan <imran.f.khan@oracle.com>, Vijayanand Jitta <vjitta@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 Vlastimil Babka <vbabka@suse.cz>
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
>   * (allocates using GFP flags of @alloc_flags). If @can_alloc is %false, avoids
>   * any allocations and will fail if no space is left to store the stack trace.
>   *
> + * If the stack trace in @entries is from an interrupt, only the portion up to
> + * interrupt entry is saved.
> + *
>   * Context: Any context, but setting @can_alloc to %false is required if
>   *          alloc_pages() cannot be used from the current context. Currently
>   *          this is the case from contexts where neither %GFP_ATOMIC nor
> @@ -323,6 +326,16 @@ depot_stack_handle_t __stack_depot_save(unsigned long *entries,
>         unsigned long flags;
>         u32 hash;
>
> +       /*
> +        * If this stack trace is from an interrupt, including anything before
> +        * interrupt entry usually leads to unbounded stackdepot growth.
> +        *
> +        * Because use of filter_irq_stacks() is a requirement to ensure
> +        * stackdepot can efficiently deduplicate interrupt stacks, always
> +        * filter_irq_stacks() to simplify all callers' use of stackdepot.
> +        */
> +       nr_entries = filter_irq_stacks(entries, nr_entries);
> +
>         if (unlikely(nr_entries == 0) || stack_depot_disable)
>                 goto fast_exit;
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 8428da2aaf17..efaa836e5132 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -36,7 +36,6 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags, bool can_alloc)
>         unsigned int nr_entries;
>
>         nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
> -       nr_entries = filter_irq_stacks(entries, nr_entries);
>         return __stack_depot_save(entries, nr_entries, flags, can_alloc);
>  }
>
> --
> 2.34.0.rc2.393.gf8c9666880-goog
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
