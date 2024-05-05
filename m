Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57488BC396
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 22:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6E6112DDB;
	Sun,  5 May 2024 20:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VPgPWi6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7720B112DDB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 20:17:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59a387fbc9so274225966b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 13:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714940228; x=1715545028;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=89jyKA3wApx9BQCfs5IiJWmwTiyjcjG5A1RQj5E06Fo=;
 b=VPgPWi6zaQlfb+dmPmP7K8RKFiAh4F/pRYCP0jwTvzMKUAiLc+HsCRK2F4UQQP2h8E
 1qMGcu03PAnbDqHhbihuVM3A8HQfc3CcluWlWfq2oRujKcUJTcRexBOYexJdJgrYZkQy
 bHhPRhmoPNtmRZS0DEU7UTpLZxhqzQ7Fa6kpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714940228; x=1715545028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=89jyKA3wApx9BQCfs5IiJWmwTiyjcjG5A1RQj5E06Fo=;
 b=FmqIDuAMhIm7PiENhVfuXE3lRj/aX3YZco5Xjo+ST1mWFxhEPKx0r/K0tZFfgCCUtd
 45eV02mT4rTQMk/6RJK9MMmCkFkwletXRclYYk4ZJN9yAcYp2P1s7fAkTLuGRdUU4CuQ
 wJu8Hh2JNJ204c5KOlvo9o/MNT7CIfEbWiZdDek6amcskezSdkH6Iu8NORpT3UWV/o/U
 IyMl/l9aVWInt01z8AQr8NHdtdIcQeRg3oJbrG7XB2IxAD/sMRqSbB0eBxuxWNosWjXo
 HkdBU50WYZ4oZTkPPbwP7TSqV0TjFjleXIhnQvZa6IdOzv1ULm2b2siPjdfNN9ADV2A3
 PcaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYJkm6ZcC2CEnNZESMZD320Z4Tk0eMw76XME32OBE22QdEqMqHAsJlGbY0AdaY7twVOxwpCxy8rqMQ7uTV1ZABoIlyQoVW9mKYoYJXgj8P
X-Gm-Message-State: AOJu0YwAFrnlHN0VSrOkq/IbEQlszCRiVig9eRJOwNBFzaYjiN1JTbvR
 EcPjEGWARxXijbIGXK7xqdQVj7MH3DJo16hFbDLUMlLvpQA9QVoE/yWNq3cNQXJFcTOyql7WzKf
 yJ/aGsA==
X-Google-Smtp-Source: AGHT+IFL1BkoggKrkMlmkjFFH4cgbzlG1IdbIIhsDym0dOhgLI+87k+e/qbcqRiJXgMKikvwUDrpzQ==
X-Received: by 2002:a17:907:7da0:b0:a59:ba2b:5913 with SMTP id
 oz32-20020a1709077da000b00a59ba2b5913mr2134337ejc.62.1714940228594; 
 Sun, 05 May 2024 13:17:08 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 me16-20020a170906aed000b00a59cb16818csm659180ejb.100.2024.05.05.13.17.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 13:17:08 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso115167366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 13:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWdPcw/ggBLJ4t8e6YSFhnd/BtAUzuH9tYBcdlbU4cp46uRTxsqcHHpV1H6fd2Ixn0DVjhUdKmIruNk6UVo4QcheejPUhs5JSdQ0Ui6B6Qb
X-Received: by 2002:a17:906:7188:b0:a59:cd18:92f5 with SMTP id
 h8-20020a170906718800b00a59cd1892f5mr599989ejk.11.1714940227970; Sun, 05 May
 2024 13:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
 <20240505175556.1213266-2-torvalds@linux-foundation.org>
 <12120faf79614fc1b9df272394a71550@AcuMS.aculab.com>
In-Reply-To: <12120faf79614fc1b9df272394a71550@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 May 2024 13:16:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxLdB_P=nW1bmVKn1m2jdcZRgkMksfvA722toFpT554w@mail.gmail.com>
Message-ID: <CAHk-=whxLdB_P=nW1bmVKn1m2jdcZRgkMksfvA722toFpT554w@mail.gmail.com>
Subject: Re: [PATCH v2] epoll: be better about file lifetimes
To: David Laight <David.Laight@aculab.com>
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "brauner@kernel.org" <brauner@kernel.org>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "jack@suse.cz" <jack@suse.cz>, 
 "keescook@chromium.org" <keescook@chromium.org>,
 "laura@labbott.name" <laura@labbott.name>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "minhquangbui99@gmail.com" <minhquangbui99@gmail.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com"
 <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>, 
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>, 
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
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

On Sun, 5 May 2024 at 13:02, David Laight <David.Laight@aculab.com> wrote:
>
> How much is the extra pair of atomics going to hurt performance?
> IIRC a lot of work was done to (try to) make epoll lockless.

If this makes people walk away from epoll, that would be absolutely
*lovely*. Maybe they'd start using io_uring instead, which has had its
problems, but is a lot more capable in the end.

Yes, doing things right is likely more expensive than doing things
wrong. Bugs are cheap. That doesn't make buggy code better.

Epoll really isn't important enough to screw over the VFS subsystem over.

I did point out elsewhere how this could be fixed by epoll() removing
the ep items at a different point:

  https://lore.kernel.org/all/CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com/

so if somebody actually wants to fix up epoll properly, that would
probably be great.

In fact, that model would allow epoll() to just keep a proper refcount
as an fd is added to the poll events, and would probably fix a lot of
nastiness. Right now those ep items stay around for basically random
amounts of time.

But maybe there are other ways to fix it. I don't think we have an
actual eventpoll maintainer any more, but what I'm *not* willing to
happen is eventpoll messing up other parts of the kernel. It was
always a ugly performance hack, and was only acceptable as such. "ugly
hack" is ok. "buggy ugly hack" is not.

              Linus
