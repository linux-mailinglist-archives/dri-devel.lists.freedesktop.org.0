Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925328BF86D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC39F10EB0E;
	Wed,  8 May 2024 08:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gozhegQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AD110EB0E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 35DFBCE179B;
 Wed,  8 May 2024 08:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4618EC113CC;
 Wed,  8 May 2024 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715156619;
 bh=K8F6N9JpOlsWc+Jn9CZxhBMEiSzjK/YkQAeLoeEmCRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gozhegQh/sghCs3jhqNxNQD4Skq7ybLhYA9g5pbCyJMQHdidxIIMKkT+SAQjpOs1x
 r/+Pr+7vnfepnVBiy1k08ZJEVDf6YMabkKhnr5O8SeAezRaBUmxQy9Jq3JtOYtfO/2
 kUDALdXV0wDWjnHX5PVahvGNt9avtfV2GqzJFqlHX1nvQgyRiEcoJToY9tGhfTLqOu
 9LarS55PEg8RvFinUJkd96tqfJD3IBiwjJAH6jRv3I/gNUnOA5ivnIOHWjVPO7kWXc
 BpY1cmz3ga0wxomzIhkawH9Aoea71AjfKqY9a7UbKpIGStEvh7fs8DLobBPpwmCjP+
 hXaulBCK61CGg==
Date: Wed, 8 May 2024 10:23:32 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk,
 christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, jack@suse.cz,
 laura@labbott.name, 
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, minhquangbui99@gmail.com, sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better
 about file lifetimes
Message-ID: <20240508-unwiederholbar-abmarsch-1813370ad633@brauner>
References: <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <d68417df-1493-421a-8558-879abe36d6fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d68417df-1493-421a-8558-879abe36d6fa@gmail.com>
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

On Tue, May 07, 2024 at 07:45:02PM +0200, Christian König wrote:
> Am 07.05.24 um 18:46 schrieb Linus Torvalds:
> > On Tue, 7 May 2024 at 04:03, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > It's really annoying that on some distros/builds we don't have that, and
> > > for gpu driver stack reasons we _really_ need to know whether a fd is the
> > > same as another, due to some messy uniqueness requirements on buffer
> > > objects various drivers have.
> > It's sad that such a simple thing would require two other horrid
> > models (EPOLL or KCMP).
> > 
> > There'[s a reason that KCMP is a config option - *some* of that is
> > horrible code - but the "compare file descriptors for equality" is not
> > that reason.
> > 
> > Note that KCMP really is a broken mess. It's also a potential security
> > hole, even for the simple things, because of how it ends up comparing
> > kernel pointers (ie it doesn't just say "same file descriptor", it
> > gives an ordering of them, so you can use KCMP to sort things in
> > kernel space).
> > 
> > And yes, it orders them after obfuscating the pointer, but it's still
> > not something I would consider sane as a baseline interface. It was
> > designed for checkpoint-restore, it's the wrong thing to use for some
> > "are these file descriptors the same".
> > 
> > The same argument goes for using EPOLL for that. Disgusting hack.
> > 
> > Just what are the requirements for the GPU stack? Is one of the file
> > descriptors "trusted", IOW, you know what kind it is?
> > 
> > Because dammit, it's *so* easy to do. You could just add a core DRM
> > ioctl for it. Literally just
> > 
> >          struct fd f1 = fdget(fd1);
> >          struct fd f2 = fdget(fd2);
> >          int same;
> > 
> >          same = f1.file && f1.file == f2.file;
> >          fdput(fd1);
> >          fdput(fd2);
> >          return same;
> > 
> > where the only question is if you also woudl want to deal with O_PATH
> > fd's, in which case the "fdget()" would be "fdget_raw()".
> > 
> > Honestly, adding some DRM ioctl for this sounds hacky, but it sounds
> > less hacky than relying on EPOLL or KCMP.
> > 
> > I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> > too, if this is possibly a more common thing. and not just DRM wants
> > it.
> > 
> > Would something like that work for you?
> 
> Well the generic approach yes, the DRM specific one maybe. IIRC we need to
> be able to compare both DRM as well as DMA-buf file descriptors.
> 
> The basic problem userspace tries to solve is that drivers might get the
> same fd through two different code paths.
> 
> For example application using OpenGL/Vulkan for rendering and VA-API for
> video decoding/encoding at the same time.
> 
> Both APIs get a fd which identifies the device to use. It can be the same,
> but it doesn't have to.
> 
> If it's the same device driver connection (or in kernel speak underlying
> struct file) then you can optimize away importing and exporting of buffers
> for example.
> 
> Additional to that it makes cgroup accounting much easier because you don't
> count things twice because they are shared etc...

One thing to keep in mind is that a generic VFS level comparing function
will only catch the obvious case where you have dup() equivalency as
outlined above by Linus. That's what most people are interested in and
that could easily replace most kcmp() use-cases for comparing fds.

But, of course there's the case where you have two file descriptors
referring to two different files that reference the same underlying
object (usually stashed in file->private_data).

For most cases that problem can ofc be solved by comparing the
underlying inode. But that doesn't work for drivers using the generic
anonymous inode infrastructure because it uses the same inode for
everything or for cases where the same underlying object can even be
represented by different inodes.

So for such cases a driver specific ioctl() to compare two fds will
be needed in addition to the generic helper.
