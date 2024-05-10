Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062F8C1E26
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 08:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AD810E221;
	Fri, 10 May 2024 06:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jdyWyMgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDF210E221
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 06:34:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0AAE6CE1C95;
 Fri, 10 May 2024 06:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C318BC113CC;
 Fri, 10 May 2024 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715322842;
 bh=wVgOOLtVKMV7bsilEbUlznVvVGVC/ysLZc58xE9C6/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jdyWyMgS+v9qUGAFlHih7XgvQwrmsyDQCIOGDIKvOfqMEFtpGPQ0OGCTu8jYydX/R
 D5aAXl+I3zxvW5NV9UXZpfwVEJ+cUvSc6GFxu267oR/eyntQ+aO7DUNJWJtaGnni47
 5yiXHQuv2uRwexYJnTqAVm4IxxgkCHS2sX7PBkpAWGQ+xjDDk1Z+FmTypT8l0+3tns
 YAVR2sp3FWUjEdwhxPam5R0321D2eTUJUx7qVrlAA/Tdugfyfca6c1Ao6f1pHPlIp5
 zi02q1WopIt+CS92a/E7+wnTqhdrRX2WrjomGr6uAH+TwysbzNY1rm6tT5Ire4VWc9
 cMw7Z7GkywhrQ==
Date: Fri, 10 May 2024 08:33:54 +0200
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
Message-ID: <20240510-abnehmen-klammheimlich-36242d03b7a0@brauner>
References: <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
 <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
 <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com>
 <20240509-kutschieren-tacker-c3968b8d3853@brauner>
 <CAHk-=wgKdWwdVUvjSNLL-ne9ezQN=BrwN34Kq38_=9yF8c03uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgKdWwdVUvjSNLL-ne9ezQN=BrwN34Kq38_=9yF8c03uA@mail.gmail.com>
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

On Thu, May 09, 2024 at 08:48:20AM -0700, Linus Torvalds wrote:
> On Thu, 9 May 2024 at 04:39, Christian Brauner <brauner@kernel.org> wrote:
> >
> > Not worth it without someone explaining in detail why imho. First pass
> > should be to try and replace kcmp() in scenarios where it's obviously
> > not needed or overkill.
> 
> Ack.
> 
> > I've added a CLASS(fd_raw) in a preliminary patch since we'll need that
> > anyway which means that your comparison patch becomes even simpler imho.
> > I've also added a selftest patch:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.misc
> 
> LGTM.
> 
> Maybe worth adding an explicit test for "open same file, but two
> separate opens, F_DUPFD_QUERY returns 0? Just to clarify the "it's not
> testing the file on the filesystem for equality, but the file pointer
> itself".

Yep, good point. Added now.
