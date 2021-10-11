Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE2429548
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14096E900;
	Mon, 11 Oct 2021 17:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157CE6E900
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 17:08:14 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n63so25448788oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bdR8B2SCkgkhZRGwEibKgUZJ+mS8tIXLqdrjvZhlSeY=;
 b=MADCvz5NbcGRWgYUnnEopvajCNlM9xGn432/01uisL2VJssIEWlI/Fp0eBrIiaXZMx
 ztNx3+nsgemWrq2UTWsbaQUoHMKuoFTfh1+kU2nh9Bms9CQXZc0LuRNHhDyqTbEm9yE+
 BpREs6YY7zhuWj6GWj90eTWxm9BYoeNybaQYZfxJr2tuk/TqaIqcziu1wIv/aUFyLnSh
 /+Tg5gt0LgiW+gZj2fCh/JFTSgX1hwAr88eSRGp9xcejw2UrvzNcYYi8eCg8noMqMx3t
 lXgWAqtDqQS+UGJkU01sXU//fn6JESUFhrFLIs8TP7lS4Bn3TSMm7OG2YBNYkNjUrBWo
 FQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bdR8B2SCkgkhZRGwEibKgUZJ+mS8tIXLqdrjvZhlSeY=;
 b=z96X2K6CcLEwYxUVovC+GADpbbJy7EuYSS6r+8bmPfo7AZ9jUoQDGThesHCtm6LVy1
 Oomdr6Lkt9YkJ4GtpM0FOcoiPvM/M22yP6HqnNoCPj48BtjAj6sux1pK54KoDsOmfEjv
 ZmOMAhT73ucD+rOMYx0/bsgR7gacnCYz+5m+jWJVU1KJ9Rr8RhPJZ8sGUq8RZomlBcd9
 /+D6N4BOaCjYz0QxM3a1j7sVGjqjTYVbprVBUEhMq4idpAULaZHF9xZfLEy4m7VLA9No
 RCPYJo0T8Nll/2G//Dvpa/77Ro48YLAqPhaW9MRoBAu7hgE/F0rkt9Re8gcWrmTsmH7C
 ktKA==
X-Gm-Message-State: AOAM532LWWHjr1yV1W5BI+bygSxHLD8XpEGIM0D5MHNP0pl1Zh9431Gr
 mxw6qjUMS78Utqi8mR1CLxFg/xNlUkPMYQXYlYirFA==
X-Google-Smtp-Source: ABdhPJyLho+5zSsoVSlKP+x611Lv7WBfE3Spy5S+sd4hJmMPlnG+XC8c/EJh3fRyckNGj+URcwD6go10L9AJ6c7zRJ0=
X-Received: by 2002:a54:4618:: with SMTP id p24mr109828oip.134.1633972093136; 
 Mon, 11 Oct 2021 10:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211007095815.3563-1-vbabka@suse.cz>
 <YV7TnygBLdHJjmRW@elver.google.com>
 <2a62971d-467f-f354-caac-2b5ecf258e3c@suse.cz>
In-Reply-To: <2a62971d-467f-f354-caac-2b5ecf258e3c@suse.cz>
From: Marco Elver <elver@google.com>
Date: Mon, 11 Oct 2021 19:08:01 +0200
Message-ID: <CANpmjNP4U9a5HFoRt=HLHpUCNiR5v82ia++wfRCezTY1TpR9RA@mail.gmail.com>
Subject: Re: [PATCH] lib/stackdepot: allow optional init and stack_table
 allocation by kvmalloc()
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, kasan-dev@googlegroups.com, 
 Vijayanand Jitta <vjitta@codeaurora.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta <glittao@gmail.com>, 
 Imran Khan <imran.f.khan@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 11 Oct 2021 at 19:02, Vlastimil Babka <vbabka@suse.cz> wrote:
[...]
> > On the other hand, the lazy initialization mode you're introducing
> > requires an explicit stack_depot_init() call somewhere and isn't as
> > straightforward as before.
> >
> > Not sure what is best. My intuition tells me STACKDEPOT_LAZY_INIT would
> > be safer as it's a deliberate opt-in to the lazy initialization
> > behaviour.
>
> I think it should be fine with ALWAYS_INIT. There are not many stackdepot
> users being added, and anyone developing a new one will very quickly find
> out if they forget to call stack_depot_init()?

I think that's fine.

> > Preferences?
> >
> > [...]
> >> --- a/drivers/gpu/drm/drm_mm.c
> >> +++ b/drivers/gpu/drm/drm_mm.c
> >> @@ -980,6 +980,10 @@ void drm_mm_init(struct drm_mm *mm, u64 start, u64 size)
> >>      add_hole(&mm->head_node);
> >>
> >>      mm->scan_active = 0;
> >> +
> >> +#ifdef CONFIG_DRM_DEBUG_MM
> >> +    stack_depot_init();
> >> +#endif
> >
> > DRM_DEBUG_MM implies STACKDEPOT. Not sure what is more readable to drm
> > maintainers, but perhaps it'd be nicer to avoid the #ifdef here, and
> > instead just keep the no-op version of stack_depot_init() in
> > <linux/stackdepot.h>. I don't have a strong preference.
>
> Hm, but in case STACKDEPOT is also selected by something else (e.g.
> CONFIG_PAGE_OWNER) which uses lazy init but isn't enabled on boot, then
> without #ifdef CONFIG_DRM_DEBUG_MM above, this code would call a
> stack_depot_init() (that's not a no-op) even in case it's not going to be
> using it, so not what we want to achieve.
> But it could be changed to use IS_ENABLED() if that's preferred by DRM folks.

You're right -- but I'll leave this to DRM folks.

> BTW it's possible that there won't be any DRM review because this failed to
> apply:
> https://patchwork.freedesktop.org/series/95549/
> DRM folks, any hint how to indicate that the base was next-20211001?
>
[...]
> > +#ifdef CONFIG_STACKDEPOT_ALWAYS_INIT
> > +static inline int stack_depot_early_init(void)       { return stack_depot_init(); }
> > +#else
> > +static inline int stack_depot_early_init(void)       { return 0; }
> > +#endif       /* CONFIG_STACKDEPOT_ALWAYS_INIT */
>
> We could, but it's a wrapper made for only a single caller...
>
> >>  #endif
> >> diff --git a/init/main.c b/init/main.c
> >> index ee4d3e1b3eb9..b6a5833d98f5 100644
> >> --- a/init/main.c
> >> +++ b/init/main.c
> >> @@ -844,7 +844,8 @@ static void __init mm_init(void)
> >>      init_mem_debugging_and_hardening();
> >>      kfence_alloc_pool();
> >>      report_meminit();
> >> -    stack_depot_init();
> >> +    if (IS_ENABLED(CONFIG_STACKDEPOT_ALWAYS_INIT))
> >> +            stack_depot_init();
> >
> > I'd push the decision of when to call this into <linux/stackdepot.h> via
> > wrapper stack_depot_early_init().
>
> No strong preferrences, if you think it's worth it.

All the other *init() functions seem to follow the same idiom as there
are barely any IS_ENABLED() in init/main.c.  So I think it's just
about being consistent with the rest.

Thanks,
-- Marco
