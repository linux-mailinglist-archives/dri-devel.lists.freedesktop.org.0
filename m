Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3548BC362
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 22:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870CE112062;
	Sun,  5 May 2024 20:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KcqDBVVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31615112062
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 20:03:27 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e0a0cc5e83so12546991fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714939405; x=1715544205;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EHEpVJVmF2eGrGo8U8tgs6RR34ElBujEmi1VC80nQxg=;
 b=KcqDBVVOGszpCzbSNUBGlR7eY6LO0nJ+9ogigvmtCVdILfSHPlPbKTmyHt+yjJFofL
 JBs7o+oNVZdt8vwiW4zsvV5/N/iW1SMdfMhibQibVxTEydPogw3bGq9yswiu11cZH46d
 zCRT2gtRNxkJvSREfZV0quU3G5vj/HA9ZmMhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714939405; x=1715544205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EHEpVJVmF2eGrGo8U8tgs6RR34ElBujEmi1VC80nQxg=;
 b=FHvducGe1MmOxoQDCw7AWHatw8xq8Jy6/bzVschLOfOEKGUPW053iVOM/JtEDJAlf2
 6GBwa0f9wW0hA4nxQvl6sFX8RV3d2Bhx7cvMEgqkN3ZsYzeCFHM1G55R+8/8SgQWSaIZ
 nq5ZHhRq/0372+sOXmC4k6GH/iLtdGgnDz3mS7Doqn7S2XV6rf0BX2yhcZ8DaARDZHce
 cnnDawkKiJDQCnGV3LT9I5xXxLvO8XoxCJYJXJ/0L48H9FSo5aJ03vNvDOJRUz0MHoYG
 wgg7kNUPhv7VisFeHRfzkbWB3LMrsdB59JEmP7wzBk+NXBgH5kcvFc6qfe0/OkaKpGE2
 xDBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoFxrESk4HSDSd8I0WlEIgbtlbUiSgFj9/3wIeItW6iMZJXJ7uA9ZPGjFUAfhPnCK3WrSS4mP/C5w4Q1s7icMrrAoMMfdpqXPbh5l/UXs/
X-Gm-Message-State: AOJu0YzrQmNTGSo0F5Qx7wSQpj3eirWc54y62PgBo1Q51L/d1U6+xqD0
 hpR5C6uqIuuvxCwGHk5yfehhEZPsnmuu6Cnobn2avlAPBfMFCcrEUkGU8H+hXm74XA+wiTEGxgi
 +ShVKxg==
X-Google-Smtp-Source: AGHT+IE1XcdVZXlp4+1kV4IC7FK0CyxQJbSv57RtkHmieHRcLH3yd8qiluqOTTDWR9cWad+7ZVHLNQ==
X-Received: by 2002:a05:6512:611:b0:51e:f7ff:396f with SMTP id
 b17-20020a056512061100b0051ef7ff396fmr4965803lfe.57.1714939405313; 
 Sun, 05 May 2024 13:03:25 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 w19-20020a05651234d300b0051d47ba30c6sm1339880lfr.194.2024.05.05.13.03.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 13:03:24 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52006fbae67so1619823e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 13:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCMfJulK1IuQws7kcy/WnIDPrcDxm85Vnq1UAT04SIzj14OtISas9K4j1biGwb58bKMsezqQayY5c7LGzR/WwdoLdb7Hm5o2OIeEYtpRl4
X-Received: by 2002:a05:6512:202c:b0:518:c057:6ab1 with SMTP id
 s12-20020a056512202c00b00518c0576ab1mr4629192lfs.66.1714939404009; Sun, 05
 May 2024 13:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
 <20240505194603.GH2118490@ZenIV>
In-Reply-To: <20240505194603.GH2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 13:03:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipanX2KYbWvO5=5Zv9O3r8kA-tqBid0g3mLTCt_wt8OA@mail.gmail.com>
Message-ID: <CAHk-=wipanX2KYbWvO5=5Zv9O3r8kA-tqBid0g3mLTCt_wt8OA@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, keescook@chromium.org,
 axboe@kernel.dk, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name, 
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 5 May 2024 at 12:46, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I've no problem with having epoll grab a reference, but if we make that
> a universal requirement ->poll() instances can rely upon,

Al, we're note "making that a requirement".

It always has been.

Otgherwise, the docs should have shouted out DAMN LOUDLY that you
can't rely on all the normal refcounting of 'struct file' THAT EVERY
SINGLE NORMAL VFS FUNCTION CAN.

Lookie herte: epoll is unimportant and irrelevant garbage compared to
something fundamental like "read()", and what does read() do?

It does this:

        struct fd f = fdget_pos(fd);

        if (f.file) {
                ...

which is being DAMN CAREFUL to make sure that the file has the proper
refcounts before it then calls "vfs_read()". There's a lot of very
careful and subtle code in fdget_pos() to make this all proper, and
that even if the file is closed by another thread concurrently, we
*always* have a refcount to it, and it's always live over the whole
'vfs_read()' sequence.

'vfs_poll()' is NOT DIFFERENT in this regard. Not at all.

Now, you have two choices that are intellectually honest:

 - admit that epoll() - which is a hell of a lot less important -
should spend a small fraction of that effort on making its vfs_poll()
use sane

 - say that all this fdget_pos() care is uncalled for in the read()
path, and we should make all the filesystem .read() functions be aware
that the file pointer they get may be garbage, and they should use
get_file_active() to make sure every 'struct file *' use they have is
safe?

because if your choice is that "epoll can do whatever the f*&k it
wants", then it's in clear violation of all the effort we go to in a
MUCH MORE IMPORTANT code path, and is clearly not consistent or
logical.

Neither you nor Christian have explained why you think it's ok for
that epoll() garbage to magically violate all our regular rules.

Your claim that those regular rules are some new conditional
requirement that we'd be imposing. NO. They are the rules that
*anybody* who gets a 'struct file *' pointer should always be able to
rely on by default: it's damn well a ref-counted thing, and the caller
holds the refcount.

The exceptional case is exactly the other way around: if you do random
crap with unrefcounted poitners, it's *your* problem, and *you* are
the one who has to be careful. Not some unrelated poor driver that
didn't know about your f*&k-up.

Dammit, epoll is CLEARLY BUGGY. It's passing off random kernel
pointers without holding a refcount to them. THAT'S A BUG.

And fixing that bug is *not* somehow changing existing rules as you
are trying to claim. No. It's just fixing a bug.

So stop claiming that this is some "new requirement". It is absolutely
nothing of the sort. epoll() actively MISUSED file pointer, because
file pointers are fundamentally refcounted (as are pretty much all
sane kernel interfaces).

                Linus
