Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F88BBD96
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 20:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0916810E02A;
	Sat,  4 May 2024 18:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Js228Sz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A298510E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 18:20:41 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a598c8661f0so151105366b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 11:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714846839; x=1715451639;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TbTAb0O3vIVxVEVAX+Kz3ISBhu7sYKvIouph0u6S16I=;
 b=Js228Sz2g3WnOXmP5rHQA4NFDIOMEn3htjljDMsFmzge5DCCIIFXJFWBwu0Ksdg6Sp
 KZ2WbIooXRNg7dFZND9kHThzqyEXJb0yGr70rKhq0pkrDg23S/VbieMLIj2VVE3CRAO6
 pML8tP4oA3E0LJ9lTr9mLLv2p3WbfyuHP3ogQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714846839; x=1715451639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbTAb0O3vIVxVEVAX+Kz3ISBhu7sYKvIouph0u6S16I=;
 b=ZrmuDBeOW7ZqgdItwqpFwl9CDCm8VhkiTsej61vQ7QI6QVOlGXvjBVVLj5oyaWzB4a
 mXvgGgQIj75hcch/TWqhyj4MkcCNmMitB2ftnWodUbmiE37opeXmcxY0pMCokok9CILD
 nor5/ckUsga6LgHGrW1HpExxH7X1YocJcoIBQf7H6cShKCwAIFpvizhP9nfFUyYA+GUS
 RNIkBOIFm9zAc87i+QHKe1J0TM3eRhIlXVjEx1kNNudujB+FMY06oEcEfyRXcFIlwMG+
 ziMDA8ov/e9WvfFv0H2X7d4zo1/HepxJPSHnaY2nTsUowJsoEcpj2CgbwQ7xGz+h67vA
 9ELA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4+wjq+DopkiSlo4OGfFxGplQFFtwwDjwF8qtrwgwpqYTaKCZAKb7WLWFvU0Ccu8A5qdSMkKXuB+UNVuNNVwzsLNR/3I8l/B6e+cumI2lu
X-Gm-Message-State: AOJu0Yz0EfZMlmCqK0aoy2EVvzJCEwnnzQTxws6cO5yXnxBA5VzjoKek
 SR27PewU7t4rzlTLY4RVL5g77vT/m6b12sgdvwuCNLyCq/O+u0OP/BDz3fvZY5RdLotU/+v4TKR
 qoA5Dmw==
X-Google-Smtp-Source: AGHT+IHwXN7eRYgsL3HfqF1+vhYrGiVIf1+4xfLgxMpHKQpwXcZ8rLZrU4htkJPatExMKoGXNKyuug==
X-Received: by 2002:a50:99d4:0:b0:56f:e71b:74e3 with SMTP id
 n20-20020a5099d4000000b0056fe71b74e3mr4174639edb.39.1714846839635; 
 Sat, 04 May 2024 11:20:39 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 cf27-20020a0564020b9b00b0057270606829sm3146903edb.85.2024.05.04.11.20.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 May 2024 11:20:38 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a598c8661f0so151102966b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 11:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0oMNHlfxui8cL3shM/5kjoMNOxVvmUWjPQXoaoFMQwnVk02voNt6nwmohYCc4ZNxkMiYamM/d+s2JIoXBYqZbhm6zbjBdb94kJnhsgTQs
X-Received: by 2002:a17:906:e90:b0:a52:1e53:febf with SMTP id
 p16-20020a1709060e9000b00a521e53febfmr3945377ejf.69.1714846838331; Sat, 04
 May 2024 11:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
In-Reply-To: <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 11:20:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
Message-ID: <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
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

On Sat, 4 May 2024 at 08:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Lookie here, the fundamental issue is that epoll can call '->poll()'
> on a file descriptor that is being closed concurrently.

Thinking some more about this, and replying to myself...

Actually, I wonder if we could *really* fix this by simply moving the
eventpoll_release() to where it really belongs.

If we did it in file_close_fd_locked(),  it would actually make a
*lot* more sense. Particularly since eventpoll actually uses this:

    struct epoll_filefd {
        struct file *file;
        int fd;
    } __packed;

ie it doesn't just use the 'struct file *', it uses the 'fd' itself
(for ep_find()).

(Strictly speaking, it should also have a pointer to the 'struct
files_struct' to make the 'int fd' be meaningful).

IOW, eventpoll already considers the file _descriptor_ relevant, not
just the file pointer, and that's destroyed at *close* time, not at
'fput()' time.

Yeah, yeah, the locking situation in file_close_fd_locked() is a bit
inconvenient, but if we can solve that, it would solve the problem in
a fundamentally different way: remove the ep iterm before the
file->f_count has actually been decremented, so the whole "race with
fput()" would just go away entirely.

I dunno. I think that would be the right thing to do, but I wouldn't
be surprised if some disgusting eventpoll user then might depend on
the current situation where the eventpoll thing stays around even
after the close() if you have another copy of the file open.

             Linus
