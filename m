Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85C8BB811
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 01:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3082113324;
	Fri,  3 May 2024 23:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UTjdwjs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCA7113324
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 23:16:34 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a595199cb9bso21649366b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714778192; x=1715382992;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cGG/rn4AzL6EAyTxraRF01dNEmbt6QApJhVwyWVeemo=;
 b=UTjdwjs+qMjOECgI/e/24cJvt4XMwoggmgqFhZ3FaUwNzl0/OxFJzPE+a0bUSKfmOr
 eTZTW05OLK/fx8C0kNfK3/6XFV1O5J9G/Y/V6kxb0QES7nBGA3vw8xFxGvvNJ9hqNGHL
 Ex+DRFFhvk8STBM9OvT0OhUxWE2Nbht3S/hAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714778192; x=1715382992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cGG/rn4AzL6EAyTxraRF01dNEmbt6QApJhVwyWVeemo=;
 b=KBYygstWdcw690Ax9YKzcf1D4sO75t0nOFLcNcAI+rc3cdv4BVFYmGHrHZIVMwNYiW
 U+qIpNbS7ZYi9xDWVXTDNrxgN+UjqWoYBR3Lwf2yo9CqllaHIb63Eqqd6wdDGap0p2aG
 jTAr4j2+59QB93pt1pxwGTmCkh00dkR3pEvlO74QVWBIR+VvhbIP5d+soU8lSagh4A7z
 7EfgOeXprTwv1+RaRb6dKJajRTfWAI/b9fRhpPnxAbbNs4nakOnn8GeAb6oCNy442nA4
 /lljFsb/rzVNBljunXD0IRoFNq9SGtyG0podM+4+olnq/MItI6sqHqWN+ITk3qLUbhHm
 TgzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU74qJ0SoMn9gKwRf3TopvLXxInumyylAsWlzCHlRV4xgJPs6QRaxRvzmMGjKLU2oAywYwxWz47Xly52OQ/NJYp/dOoJ4uApY/kgAkoQnYJ
X-Gm-Message-State: AOJu0YwQKT0xriYHg2L3JwuH8s4tnQrmsvySIEjn5JXV2HOCpC8cBvxb
 /WGyFmBlWfsWmIxKIE2j2O6kKCaQoRJpZnfkUeZ3lUdTqyVZYbxC6Y3IVPyCU4b8jblezQQvQqk
 mfL0bzw==
X-Google-Smtp-Source: AGHT+IFomQBTJNxVeVJfcDr7rQ+kjddmL+OP66BxWgYBfcZE45oJmRAgnTyrxIpiMgkP3VMgevdf1w==
X-Received: by 2002:a17:906:d8b2:b0:a58:73f0:4d1a with SMTP id
 qc18-20020a170906d8b200b00a5873f04d1amr1994356ejb.70.1714778192697; 
 Fri, 03 May 2024 16:16:32 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 p27-20020a17090635db00b00a58e0d1d5bfsm2247659ejb.221.2024.05.03.16.16.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 16:16:32 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a599fcba36eso27797266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTPohoWM+HN/lvceFIXjoM3JL/4n4bO1ATs2nEpIPZ/GRO8LQPlcmgeB03mbS6j4L6C+mM+5EHFw/dOG772HZBGMMUUBba1yGAzZWj25QH
X-Received: by 2002:a17:906:52c1:b0:a59:2e45:f528 with SMTP id
 w1-20020a17090652c100b00a592e45f528mr2851931ejn.38.1714778191864; Fri, 03 May
 2024 16:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <20240503220145.GD2118490@ZenIV> <20240503220744.GE2118490@ZenIV>
In-Reply-To: <20240503220744.GE2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 16:16:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
Message-ID: <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: keescook@chromium.org, axboe@kernel.dk, brauner@kernel.org, 
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

On Fri, 3 May 2024 at 15:07, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Suppose your program calls select() on a pipe and dmabuf, sees data to be read
> from pipe, reads it, closes both pipe and dmabuf and exits.
>
> Would you expect that dmabuf file would stick around for hell knows how long
> after that?  I would certainly be very surprised by running into that...

Why?

That's the _point_ of refcounts. They make the thing they refcount
stay around until it's no longer referenced.

Now, I agree that dmabuf's are a bit odd in how they use a 'struct
file' *as* their refcount, but hey, it's a specialty use. Unusual
perhaps, but not exactly wrong.

I suspect that if you saw a dmabuf just have its own 'refcount_t' and
stay around until it was done, you wouldn't bat an eye at it, and it's
really just the "it uses a struct file for counting" that you are
reacting to.

                Linus
