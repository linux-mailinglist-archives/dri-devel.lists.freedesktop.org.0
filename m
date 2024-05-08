Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CDE8C02C9
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 19:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54511310C;
	Wed,  8 May 2024 17:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GlK0tXWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8DA11310C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 17:15:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so1122133166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715188501; x=1715793301;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U/4yjhmm7i2TdW/kF2dab+x944KGHXX8XGDp8OQOwgM=;
 b=GlK0tXWzgN63C6tr4h7kqwLc3c8pOjgBN/BDzvlqG+z7Ml/ccr1sbVcK7d9zPfHozw
 TuJoTydMwBloKWe2Q+Vh1L+7e2zqsKBe538O2zlM5k/1TBL6cZuKr/6lTNZVCxwlOdLQ
 i163akUZEuZ8CqJveFTCHBS1GDw96yoQ5PU3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715188501; x=1715793301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U/4yjhmm7i2TdW/kF2dab+x944KGHXX8XGDp8OQOwgM=;
 b=VTHRKaEFMZcfV7k+nnB8UcqJ2zWVTdUGHtLxJ2AtRhlwdfEm8htdYPSRFT86tp4i0I
 cciFYnqHxfBbfrqqPlgvH+MipMIIVUlXhWdL5CoSjn6/lmGkB67YAddlDQd0PEXs3Tdv
 M5pf1X9u7XOXHqrNzAYWG87QM7PVJ+4T2/RcYuWifDcCZGWJB6HkfAjysTvRU8dco4Ka
 59JRTzF1HHkFUkfuWPiwSmpu5dDtw/9b1/YdY0xvsdlIfNDc9RuPCy3aCXzn933ZbdEC
 Unr4DZl/yr1cGMOdpUervzi0PPBDokH+0sJNsrx8FBiIQ1gwRgDsTPw21CKNN0mb1SbO
 YG9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE7ezrUVtuCbhtRs2HDjmXF0PL0igG7zOVghhvZfOwdGSQYFZF0m5xCU1JyzSVEHCN+51ai8eOhlNoaA7KsoR6u4HRzUf0lgvrmA8lWBH7
X-Gm-Message-State: AOJu0Yz7YN7h0nrhOIC99mnfFtFJEW+H/1d2xUm1Fi6XT8sTpZd0NR5N
 mXtUPgxupOJ8OCwdRhP1Qz0MQ55pfzRZtsj0FJUacaMWUN0dLkdxN2wJJP8tL7SMU8tgkejZSjb
 yeBNGDQ==
X-Google-Smtp-Source: AGHT+IHAi6DC3qNEQMincyeS6SKTZyfuO6q9qxuz6wjAE4RWa4MaWmCyLBbTIAveTOyuCOg2iv75LQ==
X-Received: by 2002:a17:906:69cf:b0:a58:5ee1:db43 with SMTP id
 a640c23a62f3a-a59fb95876amr204782266b.23.1715188501639; 
 Wed, 08 May 2024 10:15:01 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 ze16-20020a170906ef9000b00a59b9b1abdfsm4938715ejb.185.2024.05.08.10.15.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 10:15:01 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a59a17fcc6bso1092724966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 10:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXn/3qntcJ5YEQJIPqo7hko6T13DPUfofjUS6lk2wG7cxS/xgqvxeZVg7T4AhapnQocAyj7Q1ad5Ng25cwQpdnA2U1vbgvOWCP/uOEg7bKG
X-Received: by 2002:a17:906:a996:b0:a59:ca9c:4de9 with SMTP id
 a640c23a62f3a-a59fb9f5184mr235459866b.76.1715188500986; Wed, 08 May 2024
 10:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
 <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
In-Reply-To: <CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2024 10:14:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com>
Message-ID: <CAHk-=wjmC+coFdA_k6_JODD8_bvad=H4pn4yGREqOTm+eMB+rg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
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

On Wed, 8 May 2024 at 09:19, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So since we already have two versions of F_DUPFD (the other being
> F_DUPFD_CLOEXEC) I decided that the best thing to do is to just extend
> on that existing naming pattern, and called it F_DUPFD_QUERY instead.
>
> I'm not married to the name, so if somebody hates it, feel free to
> argue otherwise.

Side note: with this patch, doing

   ret = fcntl(fd1, F_DUPFD_QUERY, fd2);

will result in:

 -1 (EBADF): 'fd1' is not a valid file descriptor
 -1 (EINVAL): old kernel that doesn't support F_DUPFD_QUERY
 0: fd2 does not refer to the same file as fd1
 1: fd2 is the same 'struct file' as fd1

and it might be worth noting a couple of things here:

 (a) fd2 being an invalid file descriptor does not cause EBADF, it
just causes "does not match".

 (b) we *could* use more bits for more equality

IOW, it would possibly make sense to extend the 0/1 result to be

- bit #0: same file pointer
- bit #1: same path
- bit #2: same dentry
- bit #3: same inode

which are all different levels of "sameness".

Does anybody care? Do we want to extend on this "sameness"? I'm not
convinced, but it might be a good idea to document this as a possibly
future extension, ie *if* what you care about is "same file pointer",
maybe you should make sure to only look at bit #0.

               Linus
