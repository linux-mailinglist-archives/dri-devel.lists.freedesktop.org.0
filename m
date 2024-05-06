Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1828BCE0D
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 14:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D239D10F5D0;
	Mon,  6 May 2024 12:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Kw1bK83i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405B10F5D0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:37:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41c26dcc3ecso2596605e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714999033; x=1715603833; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NmNWteJIHVG/FsNg6lLCmILTCJBN+MkrWHLSaZrPJk4=;
 b=Kw1bK83iv0JwI0GToAaL954AitiJvAKo3osc2XEudd6PIpJy942NMdCnNASPqj/gvD
 oMhoAU6bypWZJPYMdgVLjzAmo6yopHfoRzvjGcKpIXYXG7zqjqRU91zVVJ4xOMdWs5Vu
 dSB8eHzEIhKancu0ncDAihKRFT0a7S8EYB42E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714999033; x=1715603833;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NmNWteJIHVG/FsNg6lLCmILTCJBN+MkrWHLSaZrPJk4=;
 b=rit1bDeoZHTa7L0vnjcrTVHgSI+BNIycVv9jSQLgM8s6XUXKO/u86k1j80orTKhbwG
 g85FB35oabDbilTGllT0rIy2K0S5g4DHQJjRqFVrjzqeJwmxiPkwvQBb3Zv4G9N3b15E
 eyZGelWZLIGiSQd/rbUgOjk+Ks6HIv2IZttJ+bGPE6PTmpcVSLovHvhgJaB0HvZI/0je
 NAIMsDtLhj+FRu1TdpO0yfIZrnHkmWDo5CElEXrCTmOT12JubURVEqA629jGwnrkBzGJ
 dFmO2YmfROmvVvrgfNF1TwF+/QkABjZ6E7BXl6IsSaHQBW5RwWLpxNxqSPtWtOQ1feSG
 puhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1v/On0Q5vcq4l295YKcPMqGqhmhwaBAjNoNVs89/sBFzbuLfKf6K02oG/OWI6q9e0dgn9soJl2BjVgwfcCoKIvcAY+T1Zqa6vMAngoXlp
X-Gm-Message-State: AOJu0YyeRW/fx3qpm0FqYmD2UQeSrBDsZT9yJ/RVrQMLFZy36/HdwGj3
 Gijh44kTAKBjyV43YGJokmu7uJ9aOlt3NdoRtlOLfcuND+XKadoCrq5OJqijMvo=
X-Google-Smtp-Source: AGHT+IF4oVKBpTMWMqUQ/dzQ+O/7RQpt5fMGVwZ3eSkPNG4BC5o71WjeNR+MccKjqHnTIbg2KzBZFg==
X-Received: by 2002:a05:600c:1d25:b0:418:ef65:4b11 with SMTP id
 l37-20020a05600c1d2500b00418ef654b11mr7944219wms.2.1714999033407; 
 Mon, 06 May 2024 05:37:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b0041c7ac6b0ffsm19767802wmb.37.2024.05.06.05.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 05:37:13 -0700 (PDT)
Date: Mon, 6 May 2024 14:37:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>,
 axboe@kernel.dk, brauner@kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <ZjjO9kaRjT48Uyuc@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>, axboe@kernel.dk,
 brauner@kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <202405031529.2CD1BFED37@keescook> <20240503230318.GF2118490@ZenIV>
 <202405031616.793DF7EEE@keescook>
 <CAHk-=wjoXgm=j=vt9S2dcMk3Ws6Z8ukibrEncFZcxh5n77F6Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjoXgm=j=vt9S2dcMk3Ws6Z8ukibrEncFZcxh5n77F6Dg@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Fri, May 03, 2024 at 04:41:19PM -0700, Linus Torvalds wrote:
> On Fri, 3 May 2024 at 16:23, Kees Cook <keescook@chromium.org> wrote:
> >
> > static bool __must_check get_dma_buf_unless_doomed(struct dma_buf *dmabuf)
> > {
> >         return atomic_long_inc_not_zero(&dmabuf->file->f_count) != 0L;
> > }
> >
> > If we end up adding epi_fget(), we'll have 2 cases of using
> > "atomic_long_inc_not_zero" for f_count. Do we need some kind of blessed
> > helper to live in file.h or something, with appropriate comments?
> 
> I wonder if we could try to abstract this out a bit more.
> 
> These games with non-ref-counted file structures *feel* a bit like the
> games we play with non-ref-counted (aka "stashed") 'struct dentry'
> that got fairly recently cleaned up with path_from_stashed() when both
> nsfs and pidfs started doing the same thing.
> 
> I'm not loving the TTM use of this thing, but at least the locking and
> logic feels a lot more straightforward (ie the
> atomic_long_inc_not_zero() here is clealy under the 'prime->mutex'
> lock

The one the vmgfx isn't really needed (I think at least), because all
other drivers that use gem or ttm use the dma_buf export cache in
drm/drm_prime.c, which is protected by a bog standard mutex.

vmwgfx is unfortunately special in a lot of ways due to somewhat parallel
dev history. So there might be an uapi reason why the weak reference is
required. I suspect because vmwgfx is reinventing a lot of its own wheels
it can't play the same tricks as gem_prime.c, which hooks into a few core
drm cleanup/release functions.

tldr; drm really has no architectural need for a get_file_unless_doomed,
and I certainly don't want to spread it it further than the vmwgfx
historical special case that was added in 2013.
-Sima

> IOW, the tty use looks correct to me, and it has fairly simple locking
> and is just catching the the race between 'fput()' decrementing the
> refcount and and 'file->f_op->release()' doing the actual release.
> 
> You are right that it's similar to the epoll thing in that sense, it
> just looks a _lot_ more straightforward to me (and, unlike epoll,
> doesn't look actively buggy right now).
> 
> Could we abstract out this kind of "stashed file pointer" so that we'd
> have a *common* form for this? Not just the inc_not_zero part, but the
> locking rule too?
> 
>               Linus

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
