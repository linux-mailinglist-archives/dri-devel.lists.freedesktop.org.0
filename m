Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B18BF886
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C80B1134BB;
	Wed,  8 May 2024 08:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HflFRQ0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668B1134B7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:32:12 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a59a1c4da28so130826566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715157131; x=1715761931; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k+L7cVJ0RXkqS3cuApbLADzGi4qIsO/ernkhsuK+4mg=;
 b=HflFRQ0u9Z3WswpYf8gQi4S2rQxGaBlBw3Nddd3edib0X7zFw67+O3ThFZm9myn5VJ
 NMXh8Ug/hjHJPmhZMK7Nf2GmH81M6iI6SNFfpbBc49+BTPqWF4ewdrFVdWpJ8aWuZO7b
 SytYkKkOTiO2Qptzq7GX7N9X2Pjd7QD4mIIWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157131; x=1715761931;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+L7cVJ0RXkqS3cuApbLADzGi4qIsO/ernkhsuK+4mg=;
 b=QP//evDc9OK5TIBneCPzcoupBF/8zjd/mzfQVE+YHLB4EIKqLzt3rFNzQamo5MNyts
 h1CGPHZUhpU9UCFWQQywg3SBwXDkpEcLy1qlZZqlnNRyjbjlM3NmVtNXi+4dRwoh14uA
 ka8GqjCjfedvRkOI5LHuJl9s/jxsVxMrbhPyC0k8yS3oAnWF5gVaqD8jvftUcNganqPs
 cS1y6zFLJvehjFQndKx3nfpwQaBGeC1g1ne3hX++Ic5U7RbD/fIV+ZLTXthJ1b6WXCwC
 S3vRPx6xRqZfnlgWab3uxelvbkTXT0XRKYzhNbCRAKRRB0EGu1bJxk9VSoQxexu2+S6/
 3m4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhdVuKqiqtSL1MNdjbOTQfWVFdb9mbCjyuEjn7CdCkxI6FeG3yc51LQy4H7MniJsufD3a636muQ3Pjf9qSZfRSrVUS8LErCT30D7cT5/+I
X-Gm-Message-State: AOJu0YyKdY/9LOjuivTtfCi69CI+zOhsmwlGLWs7/5Z3OTtOp2XuUGuF
 4AO1jUT9D+n/3pxz03fB2NXDz6RBExeRUi7LSbhdvy+Xo9HHJxYSrNZUD4y4/iY=
X-Google-Smtp-Source: AGHT+IHr0DJSEJ8IbuC5woWDxr1DEtRthw0/l9kV1uMkZSNSlIS/DcIHRg9/N+jRs+eVsPBC4/zXZw==
X-Received: by 2002:a17:906:fd17:b0:a59:7f38:8dfc with SMTP id
 a640c23a62f3a-a59fb9ebd21mr102078066b.5.1715157130873; 
 Wed, 08 May 2024 01:32:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 uz14-20020a170907118e00b00a599adfd49dsm6073415ejb.64.2024.05.08.01.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:32:10 -0700 (PDT)
Date: Wed, 8 May 2024 10:32:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org,
 axboe@kernel.dk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better
 about file lifetimes
Message-ID: <Zjs4iEw1Lx1YcR8M@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org,
 axboe@kernel.dk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
 <040b32b8-c4df-4121-bb0d-f0c6ee9e123d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <040b32b8-c4df-4121-bb0d-f0c6ee9e123d@gmail.com>
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

On Wed, May 08, 2024 at 07:55:08AM +0200, Christian König wrote:
> Am 07.05.24 um 21:07 schrieb Linus Torvalds:
> > On Tue, 7 May 2024 at 11:04, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
> > > 
> > > > I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> > > > too, if this is possibly a more common thing. and not just DRM wants
> > > > it.
> > > > 
> > > > Would something like that work for you?
> > > Yes.
> > > 
> > > Adding Simon and Pekka as two of the usual suspects for this kind of
> > > stuff. Also example code (the int return value is just so that callers know
> > > when kcmp isn't available, they all only care about equality):
> > > 
> > > https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239
> > That example thing shows that we shouldn't make it a FISAME ioctl - we
> > should make it a fcntl() instead, and it would just be a companion to
> > F_DUPFD.
> > 
> > Doesn't that strike everybody as a *much* cleaner interface? I think
> > F_ISDUP would work very naturally indeed with F_DUPFD.
> > 
> > Yes? No?
> 
> Sounds absolutely sane to me.

Yeah fcntl(fd1, F_ISDUP, fd2); sounds extremely reasonable to me too.

Aside, after some irc discussions I paged a few more of the relevant info
back in, and at least for dma-buf we kinda sorted this out by going away
from the singleton inode in this patch: ed63bb1d1f84 ("dma-buf: give each
buffer a full-fledged inode")

It's uapi now so we can't ever undo that, but with hindsight just the
F_ISDUP is really what we wanted. Because we have no need for that inode
aside from the unique inode number that's only used to compare dma-buf fd
for sameness, e.g.

https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/render/vulkan/texture.c#L490

The one question I have is whether this could lead to some exploit tools,
because at least the android conformance test suite verifies that kcmp
isn't available to apps (which is where we need it, because even with all
the binder-based isolation gpu userspace still all run in the application
process due to performance reasons, any ipc at all is just too much).

Otoh if we just add this to drm fd as an ioctl somewhere, then it will
also be available to every android app because they all do need the gpu
for rendering. So going with the full generic fcntl is probably best.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
