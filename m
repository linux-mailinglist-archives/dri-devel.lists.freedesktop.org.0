Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C48BD475
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 20:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9777E10E1C5;
	Mon,  6 May 2024 18:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A9e2JKGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E4B10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 18:18:10 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-572adaa172cso3878626a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 11:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715019488; x=1715624288;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6q7UkdOxzhbeF8E3EB8/oVmwWLDDbJfhhsW1gzY2H6M=;
 b=A9e2JKGMowulJjUt72haMaSOfQccDXauYeBrMhpKncYSeTosOnQjKySmcMeNwuVpSh
 s0emdoqE1vUyFzM5LDBTJexdMBqp2Tq/Uo6bfcWOEQjq7GD5ozEJAaVIiPugbgH26xn1
 qT2kKXVgToccLuVWRdLPR7/wsX2Pv6m17nTO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715019488; x=1715624288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6q7UkdOxzhbeF8E3EB8/oVmwWLDDbJfhhsW1gzY2H6M=;
 b=G9cnA3rN+AcknG28wjcV5AFWBEqRoHs5/z7QT9+K7YB3hL41m3kaVt8oy0qKEdOFB3
 2XiwpXm9cebNWMsC5T9NBd+mZsEfCmBJUK8ymDcvfnb84gpH+nSKf7RMTme68sjp0PeA
 aECjwa7k143Fy99yl3CPucSmTV+gnI8CD9Ek6Dc/eKbJNtVxHVJje+NWkn4s41jJk6EM
 6+N7ens+hQVXGDZASXjX5Ob/vE1esgGMtfhotgfUxQR8J+efLG0EpVSUDkd2jzC2LEGG
 mrRbljwjWJF5xuxlsMbxEjPyxM2+LHnmyUUGY42fqTbYcykO4Pnwaj/ljjUd/W2a31QC
 ILFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEJ4y00So/6W6PsZnmgwQxbOF68j45Y4+k7VQYalqgRw4cTbM4KwWzndiIBLK6v+hbZA5HqmB/L9BuJpHMYEH+0hjExOoUwSySJbTHpDUX
X-Gm-Message-State: AOJu0Yyc6rDIy/8G5l+jJL58fIg8MmoHZl0E7CZHFae04RMLLdtS7brZ
 Y6TIbSqLWzhgkhKRY5WRhjXEjkh/G3WP3n0ACBiCO6wF6GS5qDvFfSW4aR/UwTeGknid4F+q6eH
 yVNnh8A==
X-Google-Smtp-Source: AGHT+IGdMZ/h3/d6fCOnuctNHaKMi20/UqFr1mXsYa6VoHRfQ725EIVcXUodjJLwYobJG2tq1221AQ==
X-Received: by 2002:a05:6402:1ca4:b0:572:a6fe:f7e7 with SMTP id
 4fb4d7f45d1cf-5731109760bmr254517a12.20.1715019488253; 
 Mon, 06 May 2024 11:18:08 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 u9-20020aa7d989000000b0057030326144sm5490043eds.47.2024.05.06.11.18.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 11:18:07 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a59ce1e8609so195298066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 11:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqLxeBA3MpvTRoh4tQjBY1Bm1YBHYsn7JBHUkd9VErahTr9Vq9OqenD1TQzK1/dOYnaxtXxmn8+HM4nSgdp7kRG7jYB+cKpzEtGifOijW0
X-Received: by 2002:a17:906:e49:b0:a59:91a0:df46 with SMTP id
 a640c23a62f3a-a59e4e862d2mr29381966b.31.1715019487019; Mon, 06 May 2024
 11:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV>
 <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
 <501ead34-d79f-442e-9b9a-ecd694b3015c@samba.org>
In-Reply-To: <501ead34-d79f-442e-9b9a-ecd694b3015c@samba.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 May 2024 11:17:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whBVkwFryz5-DOAxNKYOy5RwPpQkZHQSs1Oe806Xo6yeg@mail.gmail.com>
Message-ID: <CAHk-=whBVkwFryz5-DOAxNKYOy5RwPpQkZHQSs1Oe806Xo6yeg@mail.gmail.com>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Stefan Metzmacher <metze@samba.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <keescook@chromium.org>, 
 Jens Axboe <axboe@kernel.dk>, Bui Quang Minh <minhquangbui99@gmail.com>, 
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

On Mon, 6 May 2024 at 10:46, Stefan Metzmacher <metze@samba.org> wrote:
>
> I think it's a very important detail that epoll does not take
> real references. Otherwise an application level 'close()' on a socket
> would not trigger a tcp disconnect, when an fd is still registered with
> epoll.

Yes, exactly.

epoll() ends up actually wanting the lifetime of the ep item be the
lifetime of the file _descriptor_, not the lifetime of the file
itself.

We approximate that - badly - with epoll not taking a reference on the
file pointer, and then at final fput() it tears things down.

But that has two real issues, and one of them is that "oh, now epoll
has file pointers that are actually dead" that caused this thread.

The other issue is that "approximates" thing, where it means that
duplicating the file pointer (dup*() and fork() end unix socket file
sending etc) will not mean that the epoll ref is also out of sync with
the lifetime of the file descriptor.

That's why I suggested that "clean up epoll references at
file_close_fd() time instead:

  https://lore.kernel.org/all/CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com/

because it would actually really *fix* the lifetime issue of ep items.

In the process, it would make it possible to actually take a f_count
reference at EPOLL_CTL_ADD time, since now the lifetime of the EP
wouldn't be tied to the lifetime of the 'struct file *' pointer, it
would be properly tied to the lifetime of the actual file descriptor
that you are adding.

So it would be a huge conceptual cleanup too.

(Of course - at that point EPOLL_CTL_ADD still doesn't actually _need_
a reference to the file, since the file being open in itself is
already that reference - but the point here being that there would
*be* a reference that the epoll code would effectively have, and you'd
never be in the situation we were in where there would be stale "dead"
file pointers that just haven't gone through the cleanup yet).

But I'd rather not touch the epoll code more than I have to.

Which is why I applied the minimal patch for just "refcount over
vfs_poll()", and am just mentioning my suggestion in the hope that
some eager beaver would like to see how painful it would do to make
the bigger surgery...

                   Linus
