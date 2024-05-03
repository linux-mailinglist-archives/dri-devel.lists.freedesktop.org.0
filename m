Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C08BB633
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EA910E4BD;
	Fri,  3 May 2024 21:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a8xEWBhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4508F10E4BD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:42:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a599af16934so16252666b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714772560; x=1715377360;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gwyBdWufoxKVrcKcsHh2OBVbUooApVD3S23GDedqB7U=;
 b=a8xEWBhAqQ8dKrXX6P5WP36+zYaj5FqGcUmYJZxUX+nBWok+ZhcBWd1wMHXAx5F1Eu
 A1AHoidf81CjKFrTt0AWQOYsuzMeM5MN23r5v4lD2UnEqfsFP/m6ML25nRkFtoGk7IQi
 gX1K5TFsow/GbNNkW9qmJDLUvo1WW8CUBPMoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772560; x=1715377360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwyBdWufoxKVrcKcsHh2OBVbUooApVD3S23GDedqB7U=;
 b=IXj1nYWBJYbWwUhUkZNMz7K2k2Q5nLDMZRdynfGqdZ4fdUk9YUyDozWBTdqAAaq7/I
 wedK8jvrWHsH1a9QfPsPPix39iyRK7laDGztFGy++w4LCewpXKQlKsxWrJdERZgLThRb
 CPPSuTQu2ZcNxnHqrZDrrUp9SqCNNgAtTi6spjiKCRjxXwuimcNzTLitVIi/5ybu6eR2
 LpdHjw9wOOd9ksGNlnQNYzc4LuvCDuBXa7/6TY//0Zb538dZ4KIuWuRtiSN8WDn6ygB5
 blyus5BmUIiB1ar9YRFMIIg9+F+ou1FjeBxnvbSe4xiUhjmwtGQx9itAJ4HMLdIuoTlx
 BlMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+aua4apxBuetaLVSeyXtyjbaJsrDtdOMyExvVewIF+Cg3w3tTqq/JNSzBJuV0mnetAI6eZ78fcFXRAEDUhhxgXYsPfxQ2ulyE4+nmsK1H
X-Gm-Message-State: AOJu0Ywt0qeUyKHjT69N4TJatRE1RJgZleDwYovv86oMbn690fNUUz/M
 IAldR0gh4eZCZRCf6Zygp4x+UnqDc5YqqRkawYmpiJ9L87D+3l/NVU1sWmjygb3lrQtkQ8V0MDf
 q7mDZ7w==
X-Google-Smtp-Source: AGHT+IGZ6g76lFaoNr/zQXgMaHrpIFS1TW2aK0UOPLz1y9gJnfMNSYB2zsHhRfdqXyRepBsaNjsrbw==
X-Received: by 2002:a50:8d1e:0:b0:572:9fea:95b6 with SMTP id
 s30-20020a508d1e000000b005729fea95b6mr2490497eds.24.1714772560433; 
 Fri, 03 May 2024 14:42:40 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm2140022edd.30.2024.05.03.14.42.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 14:42:39 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a599af16934so16247666b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNqv9fTCjiVkhUAfmqSaFB554KWzASj3Xn1Pp0Rr7/EZU2c2Iyb05/njFRk9XSd1f1a7g8AfHJ4Yu/DqCLm8uKCEciAiqws7Cmh+y+6n80
X-Received: by 2002:a17:906:29d4:b0:a59:8786:3852 with SMTP id
 y20-20020a17090629d400b00a5987863852mr2658677eje.55.1714772559064; Fri, 03
 May 2024 14:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV> <20240503213625.GA2118490@ZenIV>
In-Reply-To: <20240503213625.GA2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:42:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgRphONC5NBagypZpgriCUtztU7LCC9BzGZDEjWQbSVWQ@mail.gmail.com>
Message-ID: <CAHk-=wgRphONC5NBagypZpgriCUtztU7LCC9BzGZDEjWQbSVWQ@mail.gmail.com>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
 Bui Quang Minh <minhquangbui99@gmail.com>,
 Christian Brauner <brauner@kernel.org>, 
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>, 
 io-uring@vger.kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
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

On Fri, 3 May 2024 at 14:36, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> ... the last part is no-go - poll_wait() must be able to grab a reference
> (well, the callback in it must)

Yeah. I really think that *poll* itself is doing everything right. It
knows that it's called with a file pointer with a reference, and it
adds its own references as needed.

And I think that's all fine - both for dmabuf in particular, but for
poll in general. That's how things are *supposed* to work. You can
keep references to other things in your 'struct file *', knowing that
files are properly refcounted, and won't go away while you are dealing
with them.

The problem, of course, is that then epoll violates that "called with
reference" part.  epoll very much by design does *not* take references
to the files it keeps track of, and then tears them down at close()
time.

Now, epoll has its reasons for doing that. They are even good reasons.
But that does mean that when epoll needs to deal with that hackery.

I wish we could remove epoll entirely, but that isn't an option, so we
need to just make sure that when it accesses the ffd.file pointer, it
does so more carefully.

              Linus
