Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A715A8BE099
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 13:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202010F19C;
	Tue,  7 May 2024 11:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="i39Rl/qA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3972B10F19C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 11:03:00 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-34aa836b948so711588f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715079778; x=1715684578; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BGTjyA9KJ+ZN6kFiIcuqLZ6W/XXJNW0jRsNPu94ZivE=;
 b=i39Rl/qAcJX9mcud/nXq2ltET5cNkWvnYwoK95A3/9dHbvN8u8Yg8FreIxRNMfxszr
 fHxJbSsrpTy5X0IWwAkVf7P0qA2tgIpPLwDl9yokWNu7oV1OKNBlZ1PrwVO6/cHcsIGQ
 M7IIwgUHeoue4mGVAXzIgY2mfBki+FNkjtfYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715079778; x=1715684578;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BGTjyA9KJ+ZN6kFiIcuqLZ6W/XXJNW0jRsNPu94ZivE=;
 b=TfNBZoLcjfJ24amZL20wpxMz4K+H+TkENmzbP+RZt6P8zJOQpzIGrNfcxD+0y0Ypw8
 xp1d9d+d7NVrIHZf+X7teeOqPL2PaCPwC39eZOtAUxGcVQKBBC000s5s/NiIB5C867hK
 MvbLxXoPRKp0i0s/+P5ii1zRoOgVeKpy6Co4gzxV2GiQEBJxPb0ApF7j4rLodr0x3Ayn
 jvCJ9nBTNdLzktnyrUg6arM2LMiDQi/UXSn8IgE5ugflV2f5tqxy9mVI3P1DgGvcN10E
 T8aySM59c5ymiCieMRHonnpZrIut/AzAXKCHqVdd3xL9xV0CPkwQDHY6Er+JqtEE/+Nm
 ZlLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpqacokc+B6YUR/SCqKCVz3VZYQZTJNl0o9ZNvZUZoarbsj0LD8bHPqskdeYFJhrhRUwDgq6jf2eMfcp/O5YTnhlBECNg5tewPACSo+oY+
X-Gm-Message-State: AOJu0Yxh86UjCdGVMUBZoPczUyjEADUuB/UORmWbscNL4mhpZCYqioKi
 m7gT/uEG/Yu+Zd7HfbpYXDJaIMbpv76VIxWxFnf7V0YK0P66r0alVielIQEHXGw=
X-Google-Smtp-Source: AGHT+IEX2EtqX8oJOpcirgNGAupSfQht9uZGGyEeDzOIFWWprFx1SmPXUeMAhFXKNaku4P+OQUC4Bg==
X-Received: by 2002:a5d:6409:0:b0:34d:b76c:cff7 with SMTP id
 z9-20020a5d6409000000b0034db76ccff7mr8695492wru.3.1715079778329; 
 Tue, 07 May 2024 04:02:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a05600001c300b0034df7313bf1sm12829804wrx.0.2024.05.07.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 04:02:57 -0700 (PDT)
Date: Tue, 7 May 2024 13:02:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
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
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
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

On Mon, May 06, 2024 at 04:29:44PM +0200, Christian König wrote:
> Am 04.05.24 um 20:20 schrieb Linus Torvalds:
> > On Sat, 4 May 2024 at 08:32, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > Lookie here, the fundamental issue is that epoll can call '->poll()'
> > > on a file descriptor that is being closed concurrently.
> > Thinking some more about this, and replying to myself...
> > 
> > Actually, I wonder if we could *really* fix this by simply moving the
> > eventpoll_release() to where it really belongs.
> > 
> > If we did it in file_close_fd_locked(),  it would actually make a
> > *lot* more sense. Particularly since eventpoll actually uses this:
> > 
> >      struct epoll_filefd {
> >          struct file *file;
> >          int fd;
> >      } __packed;
> > 
> > ie it doesn't just use the 'struct file *', it uses the 'fd' itself
> > (for ep_find()).
> > 
> > (Strictly speaking, it should also have a pointer to the 'struct
> > files_struct' to make the 'int fd' be meaningful).
> 
> While I completely agree on this I unfortunately have to ruin the idea.
> 
> Before we had KCMP some people relied on the strange behavior of eventpoll
> to compare struct files when the fd is the same.
> 
> I just recently suggested that solution to somebody at AMD as a workaround
> when KCMP is disabled because of security hardening and I'm pretty sure I've
> seen it somewhere else as well.
> 
> So when we change that it would break (undocumented?) UAPI behavior.

Uh extremely aside, but doesn't this mean we should just enable kcmp on
files unconditionally, since there's an alternative? Or a least everywhere
CONFIG_EPOLL is enabled?

It's really annoying that on some distros/builds we don't have that, and
for gpu driver stack reasons we _really_ need to know whether a fd is the
same as another, due to some messy uniqueness requirements on buffer
objects various drivers have.
-Sima

> 
> Regards,
> Christian.
> 
> > 
> > IOW, eventpoll already considers the file _descriptor_ relevant, not
> > just the file pointer, and that's destroyed at *close* time, not at
> > 'fput()' time.
> > 
> > Yeah, yeah, the locking situation in file_close_fd_locked() is a bit
> > inconvenient, but if we can solve that, it would solve the problem in
> > a fundamentally different way: remove the ep iterm before the
> > file->f_count has actually been decremented, so the whole "race with
> > fput()" would just go away entirely.
> > 
> > I dunno. I think that would be the right thing to do, but I wouldn't
> > be surprised if some disgusting eventpoll user then might depend on
> > the current situation where the eventpoll thing stays around even
> > after the close() if you have another copy of the file open.
> > 
> >               Linus
> > _______________________________________________
> > Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
