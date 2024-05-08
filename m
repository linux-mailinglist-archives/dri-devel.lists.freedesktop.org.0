Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0688BF809
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED311348A;
	Wed,  8 May 2024 08:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ovjlFQ8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B6611348A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5BD1CE17DF;
 Wed,  8 May 2024 08:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57027C4AF18;
 Wed,  8 May 2024 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715155548;
 bh=hs3mKg+OQgaq+nvum86puw6d4BslQHZXpTBdAaPI+nY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovjlFQ8ukkRvL4ghs8zz4V4Kw25gMFTaKuE5sx+j5PMt25EqkuW7RedC1pfMLWx63
 QEOFtHNRBffi6eG8d4Mc8xu7/ZyYm2seS4ecvxSlxfPCTPsLhk5MqZ4Pugbnx9ygmJ
 ygElqYKrHzPHkKg9gGbFrHYd8hMkQbOsVRr/ndDF8RPm+r98qt4Kj+lyRf4fsULQpg
 HMs+r9d6EMaqu/xPzpW45mnmK24O45KOknIWxUeRCB4Cob5QR2kfh7BNtNmwrHvghE
 yU8xCwRc7djD6gRoEWtKEOpa2BXeXhzcE5Wh5AZUeXxQ0HUevyciP88YZ8/e6YgjI2
 tLmeOlFmOHC2Q==
Date: Wed, 8 May 2024 10:05:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
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
Message-ID: <20240508-gefangen-unberechenbar-96845bd61def@brauner>
References: <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
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

On Tue, May 07, 2024 at 12:07:10PM -0700, Linus Torvalds wrote:
> On Tue, 7 May 2024 at 11:04, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
> >
> > > I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> > > too, if this is possibly a more common thing. and not just DRM wants
> > > it.
> > >
> > > Would something like that work for you?
> >
> > Yes.
> >
> > Adding Simon and Pekka as two of the usual suspects for this kind of
> > stuff. Also example code (the int return value is just so that callers know
> > when kcmp isn't available, they all only care about equality):
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239
> 
> That example thing shows that we shouldn't make it a FISAME ioctl - we
> should make it a fcntl() instead, and it would just be a companion to
> F_DUPFD.
> 
> Doesn't that strike everybody as a *much* cleaner interface? I think

+1
See
https://github.com/systemd/systemd/blob/a4f0e0da3573a10bc5404142be8799418760b1d1/src/basic/fd-util.c#L517
that's another heavy user of this kind of functionality.
