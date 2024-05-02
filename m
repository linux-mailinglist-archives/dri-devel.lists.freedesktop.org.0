Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D914D8BA3A6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 01:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8711F10F60E;
	Thu,  2 May 2024 23:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nsscsV0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B410F60E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 23:03:25 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2b2769f017aso2806423a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714691005; x=1715295805;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I4RW3z/Zjpo6qwpklLmujf0x6xZ5b4UXLeUz+5BU7aE=;
 b=nsscsV0s4CSpDHku+Q0THxGAL1LY3wxCEFpuwHtt0AUcLVzL6jR90nYmHASzcSkHUu
 K+LD9pJLtOGqMr5zdWz2R9GTK+k18rAyIhL7RAM93H/P6uG90jxQdrBFPwCjhRmmh8x5
 2ohOTR/O0J2VPWXfZQPrrgoGMEY1jD0pPM+HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714691005; x=1715295805;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4RW3z/Zjpo6qwpklLmujf0x6xZ5b4UXLeUz+5BU7aE=;
 b=SIAG/dnL/CCRGzC4wucyVdvZC1a+ues3UimyedAULSwE6VaQAr7HjAWzEShVi++YtI
 zLhF5dtpXQ6W/X+6wbGMzZePCvvEf+fYaTEAJRKzpcJnnUoKu0jc/SZu0PGimSLNy6hz
 OLZ32L7+QNg2gteClLvWfUIeK5RryGl+iATDcxtMwPzUx3jhFIckksq8N5shRJK6NVyg
 lyYRG++ufsaxXse6oV69rYmWLSOyoy/Gkac4rpnl15EV8icULYnFt+C2efBc3eIf6V7d
 +Y5EPjWZLJuRDbtEf2Or58zH3H1zIFjUTWMF/l0nCEAf2qhXPGAVnlWiTysrff91hDS8
 8oBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwG4O88FL/raWpdDg5OzaLS0z+hCP62jrFjGP82MPJuk53PfldmWhwVZkZ+EbYP0maVE8pOgXc5T4vfPZCKx6myDOHIns9kXPPshSsxNiE
X-Gm-Message-State: AOJu0YxYkbHAuTVtHko12ziXwapPP68TzCNfZ72A0Fz3ZNn1ow/Hz6PX
 WGOOU7FNIhfFOagsEV9o3DGG1CtoVeP4WZVRy6TgE+Jh4oUjfWuRg/b4fUD37A==
X-Google-Smtp-Source: AGHT+IFN1ghcNnx1vVRkm1yx/61qx4Z1G+3b7jaqkQpPQe3ATJr7d5YMS5BN39H3i6ElpFem8xw9lw==
X-Received: by 2002:a17:90a:c70a:b0:2b2:7e94:c5fa with SMTP id
 o10-20020a17090ac70a00b002b27e94c5famr1292136pjt.5.1714691005284; 
 Thu, 02 May 2024 16:03:25 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 gn23-20020a17090ac79700b002b2b608c10esm1807658pjb.56.2024.05.02.16.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 16:03:24 -0700 (PDT)
Date: Thu, 2 May 2024 16:03:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/5] fs: Do not allow get_file() to resurrect 0 f_count
Message-ID: <202405021600.F5C68084D@keescook>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-1-keescook@chromium.org>
 <CAG48ez0d81xbOHqTUbWcBFWx5WY=RM8MM++ug79wXe0O-NKLig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0d81xbOHqTUbWcBFWx5WY=RM8MM++ug79wXe0O-NKLig@mail.gmail.com>
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

On Fri, May 03, 2024 at 12:53:56AM +0200, Jann Horn wrote:
> On Fri, May 3, 2024 at 12:34 AM Kees Cook <keescook@chromium.org> wrote:
> > If f_count reaches 0, calling get_file() should be a failure. Adjust to
> > use atomic_long_inc_not_zero() and return NULL on failure. In the future
> > get_file() can be annotated with __must_check, though that is not
> > currently possible.
> [...]
> >  static inline struct file *get_file(struct file *f)
> >  {
> > -       atomic_long_inc(&f->f_count);
> > +       if (unlikely(!atomic_long_inc_not_zero(&f->f_count)))
> > +               return NULL;
> >         return f;
> >  }
> 
> Oh, I really don't like this...
> 
> In most code, if you call get_file() on a file and see refcount zero,
> that basically means you're in a UAF write situation, or that you
> could be in such a situation if you had raced differently. It's
> basically just like refcount_inc() in that regard.

Shouldn't the system attempt to not make things worse if it encounters
an inc-from-0 condition? Yes, we've already lost the race for a UaF
condition, but maybe don't continue on.

> And get_file() has semantics just like refcount_inc(): The caller
> guarantees that it is already holding a reference to the file; and if

Yes, but if that guarantee is violated, we should do something about it.

> the caller is wrong about that, their subsequent attempt to clean up
> the reference that they think they were already holding will likely
> lead to UAF too. If get_file() sees a zero refcount, there is no safe
> way to continue. And all existing callers of get_file() expect the
> return value to be the same as the non-NULL pointer they passed in, so
> they'll either ignore the result of this check and barrel on, or oops
> with a NULL deref.
> 
> For callers that want to actually try incrementing file refcounts that
> could be zero, which is only possible under specific circumstances, we
> have helpers like get_file_rcu() and get_file_active().

So what's going on in here:
https://lore.kernel.org/linux-hardening/20240502223341.1835070-2-keescook@chromium.org/

> Can't you throw a CHECK_DATA_CORRUPTION() or something like that in
> there instead?

I'm open to suggestions, but given what's happening with struct dma_buf
above, it seems like this is a state worth checking for?

-- 
Kees Cook
