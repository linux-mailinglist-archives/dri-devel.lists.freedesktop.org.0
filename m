Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85568C9843
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 05:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034C10E12A;
	Mon, 20 May 2024 03:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MwA1Rn/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A1210E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:30:17 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ecd3867556so63928045ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 20:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716175817; x=1716780617;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+JrWPfIASUzFRmiR/DV6jZQiIB7Zl8bPPeoGLFG72Uo=;
 b=MwA1Rn/UOntKNOFiZYrGQav2hDtCe83KQFPLypKujfoOsNOWjRwRgCOh/IDE+pM7aY
 +A48n3x5VeqJEMzm8oB/BvUY/NQsVHMReDhYagH+iGLcMuM2bqIU0tdoE47po40HrtIJ
 cVJhmIMwm/KJ4PtaPvv2AkdAUkooXODNqEkds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716175817; x=1716780617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JrWPfIASUzFRmiR/DV6jZQiIB7Zl8bPPeoGLFG72Uo=;
 b=rBmtycS749LGa4KBXI/cQ2wCkiTuYHmyznVlgY/1qeF1PoiCKRVOAS7nAaBailqAg3
 T9Wvft+NwOD0coRJjmMnisoc5Fh4YEBv02K/PP+XISMAVXViTS0PVrPcu/hgjB7MU4ox
 MRAdhJY61ktpKUPwxWefwHwLr+yqRABYSxQexMEK+KB9NfhSP7LqbRkMt0ZVY9lBn69B
 vpK4LLrTPhdRoPUVy+qw4HEJd4PUdLb8TZVCLA/0MJBYpSPQH8P2bialnwn3FqMaEcY2
 DjDQm0QKBsFY5/nmxLkNn1qp+WDyKnW82MBtaUFJG/dKpGi3raSrdEtYzpWnw1IvwZEL
 Lk5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa9naK5W1tVN7Zx5+5Q1ShtiWZvQR+NGXxtmLQrZCKEluT6x6H4ZFGs7H6POLBLc/dQjhnpDEOa4MzwSA/YrFyLqjoIwKq0SbApfOSzUYk
X-Gm-Message-State: AOJu0YxUfX/fPwvuhiyBzNsq+aEVpoZcXnbWUTJjNMbQBJZ61EHAlK6n
 xhSbT2aCF3nJj3ZdCYX+ktagKlJ4GRuPO2CJRUQy54xSZEhIqtvacKybo3+lVg==
X-Google-Smtp-Source: AGHT+IGEIhXHFo8lQr4BEx8nWbaYE1K8DXMrMP87uwXai76RXva2jls+/QFtIlMVhVxe/QA8pDzVAQ==
X-Received: by 2002:a17:902:6bc4:b0:1ea:f9af:ee99 with SMTP id
 d9443c01a7336-1ef43d28276mr260443125ad.25.1716175817070; 
 Sun, 19 May 2024 20:30:17 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bada3efsm193550625ad.114.2024.05.19.20.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 20:30:16 -0700 (PDT)
Date: Sun, 19 May 2024 20:30:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: kernel test robot <oliver.sang@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Benno Lossin <benno.lossin@proton.me>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Christoph Lameter <cl@linux.com>,
 Dennis Zhou <dennis@kernel.org>, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, linux-hardening@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [linux-next:master] [mm/slab]  7bd230a266:
 WARNING:at_mm/util.c:#kvmalloc_node_noprof
Message-ID: <202405192018.9A54A254A@keescook>
References: <202405151008.6ddd1aaf-oliver.sang@intel.com>
 <a7qrk7rkfbg44mhfehup3cgwi7bhcuqys72tg2ri7ck7sggfnx@643nnjnpxwzt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7qrk7rkfbg44mhfehup3cgwi7bhcuqys72tg2ri7ck7sggfnx@643nnjnpxwzt>
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

On Sun, May 19, 2024 at 07:06:45PM -0400, Kent Overstreet wrote:
> this looks like an i915 bug

Yeah, agreed.

> On Wed, May 15, 2024 at 10:41:19AM +0800, kernel test robot wrote:
[...]
> > [test failed on linux-next/master 6ba6c795dc73c22ce2c86006f17c4aa802db2a60]
[...]
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202405151008.6ddd1aaf-oliver.sang@intel.com
> > 
> > 
> > [  940.101700][ T5353] ------------[ cut here ]------------
> > [ 940.107107][ T5353] WARNING: CPU: 1 PID: 5353 at mm/util.c:649 kvmalloc_node_noprof (mm/util.c:649 (discriminator 1)) 

This is:

        /* Don't even allow crazy sizes */
        if (unlikely(size > INT_MAX)) {
                WARN_ON_ONCE(!(flags & __GFP_NOWARN));


> > [  940.307791][ T5353] Call Trace:
[...]
> > [ 940.351795][ T5353] eb_copy_relocations (drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1685) i915

And this is:

                const unsigned int nreloc = eb->exec[i].relocation_count;
		...
                size = nreloc * sizeof(*relocs);

                relocs = kvmalloc_array(1, size, GFP_KERNEL);

So something isn't checking the "relocation_count" size that I assume is
coming in from the ioctl?

-Kees

-- 
Kees Cook
