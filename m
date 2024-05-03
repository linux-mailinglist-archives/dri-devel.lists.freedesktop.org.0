Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F5C8BB5C8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361F710F2F8;
	Fri,  3 May 2024 21:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M51pZegg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F0C10F2F8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:33:56 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f25f87e58so115990e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714772035; x=1715376835;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H0cKj1/eeDlsag1nYyx5cuj3RktPC8YvvhuCxa/6SIc=;
 b=M51pZeggcOF/Mja0fTZgyCbJPPJRD0bch/XTLIQUPHtit8dRhrDobkUmo1WTV4AVUc
 //zCK80LvhiogunsisFfwqThMv5kzZ0MLJA8MmmIhsMUqmyWV8vm/sZ1htQgAh//0XnB
 xcxxcdI7SBAwnkVGSdgIFd1GDvt6YFvdlPjQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772035; x=1715376835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H0cKj1/eeDlsag1nYyx5cuj3RktPC8YvvhuCxa/6SIc=;
 b=iNGI1TO5X0ec7rPgdnDF6O7LTxrYNfK0Pe7f/kEoayL1Cgf5OmZK6GVpPwSpU5lrhv
 rglfft/FEzVwO91sRuQ1SbTBNnaN+i0LLQlsDkJEAiHi6/O+9e8uQNiSBEjlx0kQcyLY
 i7Qh3nqmbYkiOWGZ8CFVncLSHgVjFEu55pDYnwjaeiRNZ4fIOVLzNwrVim4ixTWlGSLw
 qwMbtcXpVsaox+amffx2+j11SzSxYx8J5oPmKl1m18XD4Ru4xCdC0NEfQpX5QjiB51Bt
 umrJqutG+PWX219nKpyo5ijOOkJZXt1Q9RYcqq1gggVW2Gwd2SMK40NgitHWSxv9tcZm
 UDxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgxvZcWDp1ut9ejt1zwt4m6nWon12i2QVIwLRqcy6CXJnd6TxDE1moITVSxbMHFY/IChVYeHym3p/7xlDjd6H1TGw7NfkyCIJbuFIZVJ6J
X-Gm-Message-State: AOJu0YyLt0l0vdm7TxhGuGdMDxbV5DeYWvHKpCNnm5n5NVk1AjNyk5YX
 kDsH/k/TGc6jhRmf9kBxYp9J+qpW0Kprlgle+nvwDzLBBBFUFNW8X+l11arm4bL7gNhljNoFSob
 Lmb0piw==
X-Google-Smtp-Source: AGHT+IFw5qmBIRJPpB6GypjRip2Fp3adzYSoC6XlR6/1fHgblWVu655fEAIelZOxRKrBitBR3nCD9w==
X-Received: by 2002:a19:f003:0:b0:51f:5c3:2d6e with SMTP id
 p3-20020a19f003000000b0051f05c32d6emr2589759lfc.17.1714772035041; 
 Fri, 03 May 2024 14:33:55 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 gg12-20020a170906e28c00b00a594dfe312bsm2181875ejb.146.2024.05.03.14.33.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 14:33:54 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a599a298990so13918566b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:33:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5g6kNOUhgCbbol4EJqwepQT0S+nfovFHJD6dxPEd5QlfY1by188Hgjd3VguH+wgHgWy28iEvFbSz7tIvcbN5oZvb2mWfqrXO6kBReXnmM
X-Received: by 2002:a17:906:2c50:b0:a59:761d:8291 with SMTP id
 f16-20020a1709062c5000b00a59761d8291mr2183947ejh.9.1714772033952; Fri, 03 May
 2024 14:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
In-Reply-To: <20240503212428.GY2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:33:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
Message-ID: <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
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

On Fri, 3 May 2024 at 14:24, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Can we get to ep_item_poll(epi, ...) after eventpoll_release_file()
> got past __ep_remove()?  Because if we can, we have a worse problem -
> epi freed under us.

Look at the hack in __ep_remove(): if it is concurrent with
eventpoll_release_file(), it will hit this code

        spin_lock(&file->f_lock);
        if (epi->dying && !force) {
                spin_unlock(&file->f_lock);
                return false;
        }

and not free the epi.

But as far as I can tell, almost nothing else cares about the f_lock
and dying logic.

And in fact, I don't think doing

        spin_lock(&file->f_lock);

is even valid in the places that look up file through "epi->ffd.file",
because the lock itself is inside the thing that you can't trust until
you've taken the lock...

So I agree with Kees about the use of "atomic_dec_not_zero()" kind of
logic - but it also needs to be in an RCU-readlocked region, I think.

I wish epoll() just took the damn file ref itself. But since it relies
on the file refcount to release the data structure, that obviously
can't work.

                Linus
