Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C88BC28D
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 18:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2AA1120C7;
	Sun,  5 May 2024 16:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y3BYWpkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5146D1120CF
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 16:46:25 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a52223e004dso220764966b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714927583; x=1715532383;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aYdtp3YANTth8Vi9S+yHKBJaPcPwhcLOgY9vMAI/QdY=;
 b=Y3BYWpkr9oSBWa5UP1PaY5eqB8SDbSyoYAOmZQkMvMjCTncoqomuGRYkMzV4bJCVut
 c0eSPAkEOj5z1wGWwcvwfLouqpfC+U5q/ugH2Fd4b/ZVIottMSD/fmf2KUGP1L5W90F2
 gd4KqhHkYKO+zHgJsyasof3W/4s6Kdrr4n0zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714927583; x=1715532383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aYdtp3YANTth8Vi9S+yHKBJaPcPwhcLOgY9vMAI/QdY=;
 b=FGt71ffa9Ms6MVYwHEMhtNP1UUJ6RR+2UlQLnCvLN/CgbceLQ15Pvsg9kXRyU9o+Te
 K4MUBDbLStfhgPy84PAKbrwaEFT4v/vFiismjmIx+9iDCMTMPfJA9FxeRfpGR7xHnWXM
 UFIHK4Y8D6hJB4tIcVlDk4YbVViCW51Pri4bPqrTpQ3CStVpqk+C0dQeJURfN6asCMmE
 zLNbW5h7dGvg8c21Sh7Sv9jQqPl/nHCpuRHonYKePogrLM3xmxchekhOFF54wy9GolDr
 +DvQq0ul+v8RyB0Uinm71g8MxIeqzc/qHuJMNV+jOqAcE5wUwBnOJsXGLm80fWBPI/EA
 29wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmuvHvumnhbPYetXVvlhLnxIyxize1F+ywZSq0I/X4QUI+47afvyPozn1ivhcCdtEArmsa7GXJj90tp5VpSDFScgF5bTDj7IeiHdWocnSa
X-Gm-Message-State: AOJu0YyIjFSj1bh50bzXuCErNooYJPdymNujCaNGF8nhy7PR9cqfdZeq
 lKbevRZ0OpMLgJGY53fg9m31BJrK54jaRTvkeaix/aallkRSbEHjmkI5KFudmCyNpMMXHG+B6QJ
 KBmixMQ==
X-Google-Smtp-Source: AGHT+IEBCdqJFVeNH6ofPtlQLexgPXvBU8V9kIE41KmbXiuL/Mv5xmXxvWsCvkxzskZY9Lp/a/sLVg==
X-Received: by 2002:a50:d741:0:b0:56e:23e3:bdc2 with SMTP id
 i1-20020a50d741000000b0056e23e3bdc2mr6819637edj.13.1714927583479; 
 Sun, 05 May 2024 09:46:23 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 u1-20020aa7d541000000b00572eebbfc61sm1210790edr.35.2024.05.05.09.46.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 09:46:22 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso281493866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 09:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXR5ph2//HkP+Lxmj1WdTX4Ar7Y7GcuAcf3VW2z5UmqET1aFAwT4DLbbUK86QDTwGVwYvMHmTJaEHqt8ROoB5mCWnRZx6q4pqauBauJbkfZ
X-Received: by 2002:a17:907:3f9a:b0:a59:c5c2:a31c with SMTP id
 hr26-20020a1709073f9a00b00a59c5c2a31cmr2077374ejc.33.1714927582181; Sun, 05
 May 2024 09:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <20240505-gelehnt-anfahren-8250b487da2c@brauner>
In-Reply-To: <20240505-gelehnt-anfahren-8250b487da2c@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 09:46:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
Message-ID: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, axboe@kernel.dk, 
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

On Sun, 5 May 2024 at 03:50, Christian Brauner <brauner@kernel.org> wrote:
>
> And I agree with you that for some instances it's valid to take another
> reference to a file from f_op->poll() but then they need to use
> get_file_active() imho and simply handle the case where f_count is zero.

I think this is

 (a) practically impossible to find (since most f_count updates are in
various random helpers)

 (b) not tenable in the first place, since *EVERYBODY* does a f_count
update as part of the bog-standard pollwait

So (b) means that the notion of "warn if somebody increments f_count
from zero" is broken to begin with - but it's doubly broken because it
wouldn't find anything *anyway*, since this never happens in any
normal situation.

And (a) means that any non-automatic finding of this is practically impossible.

> And we need to document that in Documentation/filesystems/file.rst or
> locking.rst.

WHY?

Why cannot you and Al just admit that the problem is in epoll. Always
has been, always will be.

The fact is, it's not dma-buf that is violating any rules. It's epoll.
It's calling out to random driver functions with a file pointer that
is no longer valid.

It really is that simple.

I don't see why you are arguing for "unknown number of drivers - we
know at least *one* - have to be fixed for a bug that is in epoll".

If it was *easy* to fix, and if it was *easy* to validate, then  sure.
But that just isn't the case.

In contrast, in epoll it's *trivial* to fix the one case where it does
a VFS call-out, and just say "you have to follow the rules".

So explain to me again why you want to mess up the driver interface
and everybody who has a '.poll()' function, and not just fix the ONE
clearly buggy piece of code.

Because dammit,. epoll is clearly buggy. It's not enough to say "the
file allocation isn't going away", and claim that that means that it's
not buggy - when the file IS NO LONGER VALID!

                      Linus
