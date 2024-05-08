Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B48BFAB8
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E6110FA60;
	Wed,  8 May 2024 10:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DvJSFi/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C3810FA60
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:16:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 835B4CE1812;
 Wed,  8 May 2024 10:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96A5C4AF66;
 Wed,  8 May 2024 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715163399;
 bh=WfYGyrtX+04z3bybKd65o2+F1bSnlXhpl/TxRURTuSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DvJSFi/PQtF6c2val1GNJIqbfRMi4rZzXYlYXy28NhIErSX+W9YhcrS44LD5Y7Mm8
 VpCCMswWkpbYN1s2W0DTiJKzZuR5fV3GtSxMf9al0Z0qY8+Rt1urbUaCD8bFRGVuQS
 e1MOGBnhSY0o90karmKFiePgu2ve9aou6O3Qjcp6lSf7t3UBfWH3/BhJDP2nw3DONG
 BWq71ij+KrCH5w2Ibu5C6bZmpUS7kW8pRGQZOLlIuBktKlhOE7VlJEpFupa/xeC6fA
 dRjUab7Mh9usEGH2x7wp8AR9pBj2jDA5EoDKJ0T7f89zk0XIgi88dZKfq8YWqk5Htj
 BW7Mww9oc6wGg==
Date: Wed, 8 May 2024 12:16:32 +0200
From: Christian Brauner <brauner@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better
 about file lifetimes
Message-ID: <20240508-zukauf-clinchen-c52792f8ad02@brauner>
References: <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
 <040b32b8-c4df-4121-bb0d-f0c6ee9e123d@gmail.com>
 <Zjs4iEw1Lx1YcR8M@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zjs4iEw1Lx1YcR8M@phenom.ffwll.local>
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

On Wed, May 08, 2024 at 10:32:08AM +0200, Daniel Vetter wrote:
> On Wed, May 08, 2024 at 07:55:08AM +0200, Christian König wrote:
> > Am 07.05.24 um 21:07 schrieb Linus Torvalds:
> > > On Tue, 7 May 2024 at 11:04, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
> > > > 
> > > > > I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> > > > > too, if this is possibly a more common thing. and not just DRM wants
> > > > > it.
> > > > > 
> > > > > Would something like that work for you?
> > > > Yes.
> > > > 
> > > > Adding Simon and Pekka as two of the usual suspects for this kind of
> > > > stuff. Also example code (the int return value is just so that callers know
> > > > when kcmp isn't available, they all only care about equality):
> > > > 
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239
> > > That example thing shows that we shouldn't make it a FISAME ioctl - we
> > > should make it a fcntl() instead, and it would just be a companion to
> > > F_DUPFD.
> > > 
> > > Doesn't that strike everybody as a *much* cleaner interface? I think
> > > F_ISDUP would work very naturally indeed with F_DUPFD.
> > > 
> > > Yes? No?
> > 
> > Sounds absolutely sane to me.
> 
> Yeah fcntl(fd1, F_ISDUP, fd2); sounds extremely reasonable to me too.
> 
> Aside, after some irc discussions I paged a few more of the relevant info
> back in, and at least for dma-buf we kinda sorted this out by going away
> from the singleton inode in this patch: ed63bb1d1f84 ("dma-buf: give each
> buffer a full-fledged inode")
> 
> It's uapi now so we can't ever undo that, but with hindsight just the
> F_ISDUP is really what we wanted. Because we have no need for that inode
> aside from the unique inode number that's only used to compare dma-buf fd
> for sameness, e.g.
> 
> https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/render/vulkan/texture.c#L490
> 
> The one question I have is whether this could lead to some exploit tools,
> because at least the android conformance test suite verifies that kcmp
> isn't available to apps (which is where we need it, because even with all
> the binder-based isolation gpu userspace still all run in the application
> process due to performance reasons, any ipc at all is just too much).
> 
> Otoh if we just add this to drm fd as an ioctl somewhere, then it will
> also be available to every android app because they all do need the gpu
> for rendering. So going with the full generic fcntl is probably best.
> -Sima

fcntl() will call security_file_fcntl(). IIRC, Android uses selinux and
I'm pretty certain they'd disallow any fcntl() operations they deems
unsafe. So a kernel update for them would likely require allow-listing
the new fcntl(). Or if they do allow all new fnctl()s by default they'd
have to disallow it if they thought that's an issue but really I don't
even think there's any issue in that.

I think kcmp() is a different problem because you can use it to compare
objects from different tasks. The generic fcntl() wouldn't allow that.
