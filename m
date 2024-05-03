Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082F8BB888
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 01:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884CE10F049;
	Fri,  3 May 2024 23:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FmiTUtfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7725B10F049
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 23:55:05 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a51addddbd4so30373366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714780503; x=1715385303;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NxPhlO3npeMKaw71dXY38r1VkXmdKnYRPE7+RntnY6E=;
 b=FmiTUtfJ8VGY4LaOo7LbO6Cp3lV+LCpFq817LqMIqVK5ZQZcd6NdQp50BSdmNTGu2N
 VROeFwJ7GuYeAhHS4J2h8l3JPk8ZAhc5FNDLfnrxMHtZ1YwrkOejLw6drL3aUNQmGabC
 rzZL5FC2Y0tznxbS5qLUW1/4m2oFjEteaZF2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714780503; x=1715385303;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxPhlO3npeMKaw71dXY38r1VkXmdKnYRPE7+RntnY6E=;
 b=jQkAmOuC3akS6f50nkPTPLi1bt5+d+/WiH6uLc4GrLeI5yAyDg2IWsS0dqOo8vfIeu
 7ZIRouW9/s/9q+6xPnpBa24AK+suUAHvjQAvkfWo1KM9mwWOV4QL3OXo85isxDaflt98
 S6sbqWmaajXpxsT400AFrLJhECMLfaAzu9t0ogPQLonRjgKwlGhb1hnGQyhsdJ3R5zys
 jpKgoqtr+tt1VsCxMQ8U/ZqWzYeZgROOM3nf9j+3ca7/zvw14ZAzsutqMW1cvIXQDmR7
 M+DeJ3YfLihfxL1x0L7Ef0xYYmaG0ypvhWv4Q0i8htIey+XIi5bpDnzppbBmkZ5TLkzI
 IZKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd/AbDe1JN6FTNZip3ul8uyBJrpmGjDhAOn/MZJqf/JR4ObV3g5l2zxNJ45+0sT+ufw/w+eItGVvhZpTCnu1IHu1MlF1iZFbD54Qfx5tQq
X-Gm-Message-State: AOJu0Yzhcgu56MY8kwQRKqyR/Zfs/ym+ZWjNQShDgfRjd7TpjFtUHnLK
 jqDma+WU0uHBYzYAqQq5my7Bteg8csVHFANsH3mDQ10NYvqHBiMAhdqk0gcGddJ6M7ezqByYYVz
 u41o07A==
X-Google-Smtp-Source: AGHT+IFBLxubXHBKWog1cDQIhrZpMKCtd4kYQaWZErYsShqVrHZn+ojUaVMwfhpPaxkkxm+5K/WiHQ==
X-Received: by 2002:a50:9317:0:b0:572:7280:89d6 with SMTP id
 m23-20020a509317000000b00572728089d6mr2479758eda.7.1714780503468; 
 Fri, 03 May 2024 16:55:03 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056402274300b00572accd13dasm2292966edd.80.2024.05.03.16.55.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 16:55:02 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso27556866b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 16:55:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX26zqDw04/OPX3NhKwuJ6sAnmxpOwYufoNXseSjWwmiRxaVe32inFxdo3wg3vCPJkYh+U3DHQYQlZwixMkdBszUtOsy5egJ06/wTZgufPS
X-Received: by 2002:a17:906:3e4e:b0:a59:a64c:9a26 with SMTP id
 t14-20020a1709063e4e00b00a59a64c9a26mr202788eji.23.1714780501707; Fri, 03 May
 2024 16:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <20240503220145.GD2118490@ZenIV> <20240503220744.GE2118490@ZenIV>
 <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
 <20240503233900.GG2118490@ZenIV>
In-Reply-To: <20240503233900.GG2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 16:54:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjjsm=f+ZJRe3dXebBQS8PzpYmHjAJnk-9-2FAj3-QoQ@mail.gmail.com>
Message-ID: <CAHk-=wjjjsm=f+ZJRe3dXebBQS8PzpYmHjAJnk-9-2FAj3-QoQ@mail.gmail.com>
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

On Fri, 3 May 2024 at 16:39, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> *IF* those files are on purely internal filesystem, that's probably
> OK; do that with something on something mountable (char device,
> sysfs file, etc.) and you have a problem with filesystem staying
> busy.

Yeah, I agree, it's a bit annoying in general. That said, it's easy to
do: stash a file descriptor in a unix domain socket, and that's
basically exactly what you have: a random reference to a 'struct file'
that will stay around for as long as you just keep that socket around,
long after the "real" file descriptor has been closed, and entirely
separately from it.

And yes, that's exactly why unix domain socket transfers have caused
so many problems over the years, with both refcount overflows and
nasty garbage collection issues.

So randomly taking references to file descriptors certainly isn't new.

In fact, it's so common that I find the epoll pattern annoying, in
that it does something special and *not* taking a ref - and it does
that special thing to *other* ("innocent") file descriptors. Yes,
dma-buf is a bit like those unix domain sockets in that it can keep
random references alive for random times, but at least it does it just
to its own file descriptors, not random other targets.

So the dmabuf thing is very much a "I'm a special file that describes
a dma buffer", and shouldn't really affect anything outside of active
dmabuf uses (which admittedly is a large portion of the GPU drivers,
and has been expanding from there...). I

So the reason I'm annoyed at epoll in this case is that I think epoll
triggered the bug in some entirely innocent subsystem. dma-buf is
doing something differently odd, yes, but at least it's odd in a "I'm
a specialized thing" sense, not in some "I screw over others" sense.

             Linus
