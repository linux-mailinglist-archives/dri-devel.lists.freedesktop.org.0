Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4D493DB9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F9610E175;
	Wed, 19 Jan 2022 15:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5787210E175
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:54:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso15135923wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0wqlG/hTKmwc1qlTFRNgFAeCCLQtJYdgJJ7JVZ30KiM=;
 b=e3Pr/dvFruT2iN6cAa0XHKtiGXwO9ueK+tpw6WUP4dtdEWHBBmgavmSQF8CU9J+UcN
 Hz8qBhrHQ1Vt/k5htfjwnT1NUI2SOss2Xgrkvlggt0Lb//TD0mBdhSnopsXNee83qc/w
 W1zJllJJxCEqEHZ8Wdd6DgeaZC8r9Yvd0MdkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0wqlG/hTKmwc1qlTFRNgFAeCCLQtJYdgJJ7JVZ30KiM=;
 b=AgYohsE9WJhliYLD89bym3stDuzYZVEtkG/zb2xHW7fc8RKzlfHGLvXv9Ea/zN7ELW
 IJLXwNEeiLe8kRKKigrtdiVXMPFHGe2uoPb0fHcEJpH/w7hqyBVz2PAacYsObRS5pM72
 yIT5bFwVrQyiVudpnYNS/A5LYKF1+lcYl1Ag0WFudWDDWWV5CtKQ7xx9ucVjIMKjYVod
 gN+V6y41un0t2PrSyjBNzALBJ9wI7SqOV+cDbF3IWxbtI/gVC2Xc9aIxiQZBrPAFGisI
 yICtJTdmArLYCsNArafDQL5h9q4l0msIxiRL9f39Xov83vIRkCwpG/SsFn7EuQd1PGxz
 Fnug==
X-Gm-Message-State: AOAM532zViLuaoGP1QzX/gfzKxl9m8T2xxH9HSfa+39w7nBQwMrBnK1o
 Wn0idVP0wqfHkdwjYtRg6Rc7IA==
X-Google-Smtp-Source: ABdhPJwYR2kHuXIdMjbo//urPLyFiKmcuB+F1hAH4j6/NzToi8Ft7emFD9AOoL2abPOHJyc76IPrBA==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr18768876wrf.431.1642607643845; 
 Wed, 19 Jan 2022 07:54:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w9sm6382224wmc.36.2022.01.19.07.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:54:02 -0800 (PST)
Date: Wed, 19 Jan 2022 16:54:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hridya Valsaraju <hridya@google.com>
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF
 to a cgroup.
Message-ID: <Yeg0GGi0tdnnCLHg@phenom.ffwll.local>
Mail-Followup-To: Hridya Valsaraju <hridya@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Suren Baghdasaryan <surenb@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Li Li <dualli@google.com>,
 Marco Ballesio <balejs@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Hang Lu <hangl@codeaurora.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Chris Down <chris@chrisdown.name>,
 Vipin Sharma <vipinsh@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vlastimil Babka <vbabka@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
 Kenny.Ho@amd.com, daniels@collabora.com, kaleshsingh@google.com,
 tjmercier@google.com
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-5-hridya@google.com>
 <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
 <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Kees Cook <keescook@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>, Kenny.Ho@amd.com,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Matthew Auld <matthew.auld@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Laura Abbott <labbott@redhat.com>,
 Marco Ballesio <balejs@google.com>, Jason Ekstrand <jason@jlekstrand.net>,
 linux-media@vger.kernel.org, Li Li <dualli@google.com>,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>,
 Vipin Sharma <vipinsh@google.com>, Nathan Chancellor <nathan@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 tjmercier@google.com, Christian Brauner <christian@brauner.io>,
 linaro-mm-sig@lists.linaro.org, Hang Lu <hangl@codeaurora.org>,
 daniels@collabora.com, Chris Down <chris@chrisdown.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 10:54:16AM -0800, Hridya Valsaraju wrote:
> On Sun, Jan 16, 2022 at 11:46 PM Christian König
> <christian.koenig@amd.com> wrote:
> >
> > Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
> > > The optional exporter op provides a way for processes to transfer
> > > charge of a buffer to a different process. This is essential for the
> > > cases where a central allocator process does allocations for various
> > > subsystems, hands over the fd to the client who
> > > requested the memory and drops all references to the allocated memory.
> > >
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > ---
> > >   include/linux/dma-buf.h | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > index 7ab50076e7a6..d5e52f81cc6f 100644
> > > --- a/include/linux/dma-buf.h
> > > +++ b/include/linux/dma-buf.h
> > > @@ -13,6 +13,7 @@
> > >   #ifndef __DMA_BUF_H__
> > >   #define __DMA_BUF_H__
> > >
> > > +#include <linux/cgroup_gpu.h>
> > >   #include <linux/dma-buf-map.h>
> > >   #include <linux/file.h>
> > >   #include <linux/err.h>
> > > @@ -285,6 +286,23 @@ struct dma_buf_ops {
> > >
> > >       int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > >       void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > > +
> > > +     /**
> > > +      * @charge_to_cgroup:
> > > +      *
> > > +      * This is called by an exporter to charge a buffer to the specified
> > > +      * cgroup.
> >
> > Well that sentence makes absolutely no sense at all.
> >
> > The dma_buf_ops are supposed to be called by the DMA-buf subsystem on
> > behalves of the importer and never by the exporter itself.
> >
> > I hope that this is just a documentation mixup.
> 
> Thank you for taking a look Christian!
> 
> Yes, that was poor wording, sorry about that. It should instead say
> that the op would be called by the process the buffer is currently
> charged to in order to transfer the buffer's charge to a different
> cgroup. This is helpful in the case where a process acts as an
> allocator for multiple client processes and we would like the
> allocated buffers to be charged to the clients who requested their
> allocation(instead of the allocating process as is the default
> behavior). In Android, the graphics allocator HAL process[1] does
> most of the graphics allocations on behalf of various clients. After
> allocation, the HAL process passes the fd to the client over binder
> IPC and the binder driver invokes the charge_to_cgroup() DMA-BUF op to
> uncharge the buffer from the HAL process and charge it to the client
> process instead.
> 
> [1]: https://source.android.com/devices/graphics/arch-bq-gralloc

For that use-case, do we really need to have the vfunc abstraction and
force all exporters to do something reasonable with it?

I think just storing the cgrpus gpu memory bucket this is charged against
and doing this in a generic way would be a lot better.

That way we can also easily add other neat features in the future, like
e.g. ttm could take care of charge-assignement automatically maybe, or we
could print the current cgroups charge relationship in the sysfs info
file. Or anything else really.

I do feel that in general for gpu memory cgroups to be useful, we should
really have memory pools as a fairly strong concept. Otherwise every
driver/allocator/thing is going to come up with their own, and very likely
incompatible interpretation. And we end up with a supposed generic cgroups
interface which cannot actually be used in a driver/vendor agnostic way at
all.
-Daniel

> 
> Regards,
> Hridya
> 
> 
> >
> > Regards,
> > Christian.
> >
> > >   The caller must hold a reference to @gpucg obtained via
> > > +      * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it is
> > > +      * currently charged to before being charged to @gpucg. The caller must
> > > +      * belong to the cgroup the buffer is currently charged to.
> > > +      *
> > > +      * This callback is optional.
> > > +      *
> > > +      * Returns:
> > > +      *
> > > +      * 0 on success or negative error code on failure.
> > > +      */
> > > +     int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpucg);
> > >   };
> > >
> > >   /**
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
