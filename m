Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D46D9C97
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDC610E23A;
	Thu,  6 Apr 2023 15:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376FF10E23A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:45:39 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-947a47eb908so72773866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680795937;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o4s/AMWTHPQ0Z3regicJnZ+4belPQ4UloMO8BfOKLAI=;
 b=UwgzXrcRFsm3HAZ3tj9A9ayYh9opklvikGWNzA8Zs+rKhFCMFyPJ3nM9Qe0o/WrOnt
 QGdzJUijU5vlI/c0ZV/2+Pr0ECTnQcPIwR+GS0O90gg/zsWfdQg1FJEg/Wu1PTcSUNMK
 WssImuOUr7pyYoGsDK49IQmNh66lQt8/KxJ7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680795937;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4s/AMWTHPQ0Z3regicJnZ+4belPQ4UloMO8BfOKLAI=;
 b=0Nkt8Vcd0Qspu/5OaDk9240jrszIJ6iHmC9dp5A7hcCh/NngFOyo2u3OZyZYxkVKVU
 hp0nbldqn3YHte8wyyIAAYKcb54MrAikCdJNHx0q1IGCfKsXCuaSM3/mrKI054DQZzWP
 ncsVPy0ppJl1XS8PmNgD2CJZDBxRuzx98odJo9QvFcrdAV7YVFZ8HGNkJSp5fml3ddCB
 XrF1MPnUBGmirKP8GwFwbATV6t2i/cS97+eMNAT7Y/3J7/+tRyAWdB3oyj2wKW/+Adf7
 IJqp4NhOIIQTG1NuJ+9ZEhmhL7nt3BdmuOv+FAAMAdqMxeI16NIwhnTDPoqlLhgVRr7F
 TVqw==
X-Gm-Message-State: AAQBX9eRAYC1DrDUMnSg6VsyG6pwu16QnpIjD+QmRH8qBiB2+9b1iR+e
 6WLvWBXw2uhXGI1S+jj2DlE8ow==
X-Google-Smtp-Source: AKy350YwqwW1z5k7uN136V0I41uI+PtWwRyr9V7ixGL/0ewgSzzeYzSvJkplfR8X5tYH4vq2nignvA==
X-Received: by 2002:a17:906:2cd:b0:92f:27c2:13c0 with SMTP id
 13-20020a17090602cd00b0092f27c213c0mr5772280ejk.6.1680795937501; 
 Thu, 06 Apr 2023 08:45:37 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 cw10-20020a170906478a00b009486efb9192sm990297ejc.11.2023.04.06.08.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:45:36 -0700 (PDT)
Date: Thu, 6 Apr 2023 17:45:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM Range Allocator
 abstraction
Message-ID: <ZC7pHlLFutMWJF1s@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
 <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
 <CANiq72=E2k7+_cwYw_EjVezk0mWCRqbH4MUjsEmxWgJMh=3AEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=E2k7+_cwYw_EjVezk0mWCRqbH4MUjsEmxWgJMh=3AEQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>, Asahi Lina <lina@asahilina.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 05:28:59PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 6, 2023 at 4:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Documentation:
> >
> > In drm we try to document all the interfaces that drivers use with formal
> > docs. Yes there's some areas that are not great for historical reasons,
> > but for new stuff and new wrappers we're really trying:
> >
> > - This helps in telling internal (even across .c files or in rust across
> >   modules within a crate) from stuff drivers access. Sure you have static
> >   in C or pub in rust, but that doesn't tell you whether it's public all
> >   the way to drivers.
> 
> I think you may be talking about the value high-level docs here, but
> just in case, visibility in Rust is flexible enough to expose (or not)
> APIs to those that you need. In other words, it does tell you (and
> enforces!) whether it is public all the way to drivers.
> 
> There is also the possibility of even more fancy visibility, but so
> far we just needed `pub(crate)`.
> 
> `rustdoc` also shows/hides things as needed, thus the generated docs
> for the crate should only show what is usable by others.
> 
> Then there is the `kernel` crate split, too.
> 
> > - ideally docs have a short intro section that explains the main concepts
> >   and links to the main data structures and functions. Just to give
> >   readers a good starting point to explore.
> 
> Agreed, this is typically done in Rust in the top-level doc comments
> (module or crate). For the Rust side of the kernel, we are definitely
> trying to emphasize the quality of the docs, including compile- and
> runtime-tested examples.
> 
> Regarding linking, `rustdoc` already generates a listing with the
> contents of each crate/module even if there is no other docs. So as
> long as the short descriptions of the items are good, it may be fairly
> readable already, e.g. see
> https://rust-for-linux.github.io/docs/rust/kernel/sync/index.html for
> an example in our old `rust` branch. But, of course, you can add extra
> docs at that level too when there are many things or is unclear what
> should be used.
> 
> Also note that, sometimes, the docs we write are in the type, rather
> than the module, e.g. see the nice examples Wedson wrote for `RBTree`:
> https://rust-for-linux.github.io/docs/rust/kernel/rbtree/struct.RBTree.html.

Yeah this all looks great and very hyperlinked.

I think the only nit I have is that for types with two or more type
variables (like the rbtree) what each of them should represent in the top
intro. I can guess it's <Key, Value> and not the other way round, but
confirmation takes quite a bit of scrolling to check with the function
types.

Otherwise I think perfect api docs.

> > - Linking all the things, so that readers can connect the different parts.
> >   This is really important in C where e.g. get/put() or any such function
> >   pairs all needed to be linked together. With rust I'm hoping that
> >   rustdoc liberally sprinkles links already and we don't have to do this
> >   as much.
> 
> If you mean within doc comments, it does! :) It is called "intra-doc
> links". Basically, you just write something in-between square
> brackets, and it is able to create the link to the right thing (in
> most cases, otherwise you can help it more), e.g.
> 
>     /// Returns a new [`Foo`].
> 
> And, of course, for the rest of things that aren't inside comments, it
> automatically provides links etc.
> 
> There has been work on `rustdoc` on getting "Jump to Definition" and
> similar features to work on the source view, too.
> 
> > - Short explainers for parameters. For rust this also means type
> >   parameters, for those even simplified examples of how drivers are
> >   supposed to use them would help a lot in reading docs & understanding
> >   concepts.
> 
> For parameters, we are not forcing to write explanations for every
> parameter (as in providing a list), but rather writing what is
> actually useful to know (referring to the parameters as needed). So it
> depends on a case-by-case.
> 
> In any case, in general is clearer what parameters are compared to C,
> due to the stronger typing. Of course, if one uses integers
> everywhere, it is as confusing as C. But if one has a type, it is
> easier to tell, plus one may jump with a click into the explanation of
> that type etc.
> 
> Regarding examples, 100% agreed. And not only that, the examples are
> enforced to be kept up to date by compiling and running them via KUnit
> (not yet submitted for mainline, but we have been enforcing it for our
> old `rust` branch for a long time).
> 
> > - Ideally links from the rust to the sphinx side to linke relevant
> >   chapters together. Often the bigger explanations are in .rst files with
> >   DOT graphs (kms has a bunch I've added) or similar, and it doesn't make
> >   that much sense to duplicate all that on the rust side I guess. But it
> >   needs to be discoverable.
> 
> Definitely. One next step is having easy-to-write links to the rST
> docs. For this, a couple years ago I talked with the `rustdoc`
> maintainers about having a "External references map file" feature, so
> that we can link rST documents from the Rust docs, including generated
> C docs too. For instance, ideally we would be able to use the square
> brackets around a C type and have it work:
> 
>     /// Exposes the kernel’s [`struct wait_queue_head`] as a condition variable.
> 
> Regarding the bigger explanations: we are trying to keep most of the
> docs close to the Rust code where it makes sense, as
> module-level/crate-level docs, rather than as rST docs. This has
> several benefits, like keeping them closer to the code, the linking
> features, having them organized equally as the code, no need to know
> whether there is a doc somewhere or not (e.g. if it is, it is near the
> code), examples are compiled, etc.

Just a quick comment on this, that's the same we do on the C side. Most
overview chapters are actually DOC: sections pulled in from the code.

What I meant here is that for big overview stuff (like for modesetting how
the display pipe structures tie together as an example:
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#overview)
it doesn't make sense to duplicate that in rustdoc once more.

> Of course, sometimes longer-form docs and other documents may not make
> sense as part of any code in particular, or may be shared across C and
> Rust, etc., and there it may more sense to use `Documentation/` files
> instead.
> 
> But, in general, the idea is that, compared to C, most of the docs go
> into the code. To give an idea of the difference: so far, in our old
> `rust` branch, we only needed a few documents in `Documentation/`
> (e.g. the Quick Start guide etc.), and everything else went into the
> code itself.

Maybe drm is the exception, but if you look at our .rst files we also have
most of our docs in the code:

https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/drm-kms-helpers.rst

The rst files just provide the scaffolding because C dosn't have
crates/modules hierarchy that would do this for you automatically.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
