Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED8B83FA5C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 23:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C134210E476;
	Sun, 28 Jan 2024 22:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA210E476
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 22:33:19 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a35c1793d02so19915766b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 14:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1706481137; x=1707085937;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bqwd7hhPAgPM5QIH38rfOxpWBqWFIbyQQhTZxa5cgpo=;
 b=VmMADS4ETqqthWdwGG7a2qHTC3Jid+dI5Q62MIWCeWIK6B5iUhk1I+3fP/0bF1Fwfb
 DPIOHqPv8plJZajEqalCAQlWRo0BKivZJYEC1BmFn3qd9k8KwY38ilPuYH+jjzMt2rPh
 pvVD9vOQj0IskQNj/q9eSxL98Sh+W0pG0SXG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706481137; x=1707085937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bqwd7hhPAgPM5QIH38rfOxpWBqWFIbyQQhTZxa5cgpo=;
 b=fJa55WDiRNxm+In2YsohAY1WTWhMuL3JTVnrqp8ibspn0ADgd5sDcRelpIx35cO+It
 TTdhQ3d9hLj2iD2KkB9FlKpC2kXVzwMycKs0XmQNKhexbZFOlEusSUrX9BTLb8lV670O
 hY0nBPF+iayaj0qWNMJVeZEWO9MVzFGTMmROcQNO7yBiPWfMuymyn/a0eLH+Rl4jQddn
 lC1XO7/PhvP5N+N5SvQRp+8cQ5SDIDsfXQQRMGo93wGrJBVTG6UV+x0XyS/GZFFTvBd8
 LeQkb1oa5T6uP1/T61tu6nzpP7WXA1qOd4a1PT3iRTa4UzGgaykCZPfoMldc09V4Auxn
 BlOA==
X-Gm-Message-State: AOJu0YylzklMKiIpWUMLoHl61IM+AANGI58PHyHPCWmwx6nrZKlWaTv8
 17dnLFvK2SFCTgxRlRWXF5O2fqj1yqnTUT0WWEWazgLiHwCHP6oUFb3uWoghDYYIvUFhvXU3DD4
 /P7HnwQ==
X-Google-Smtp-Source: AGHT+IEnkfgg3NuKYfss7tbxdGe15WjCVbjP230oDKNxPw7P+x3tJHlbSW83HGvKFCv+Ddu9k/FgrQ==
X-Received: by 2002:a17:906:b347:b0:a28:a36e:98ac with SMTP id
 cd7-20020a170906b34700b00a28a36e98acmr3325393ejb.68.1706481137350; 
 Sun, 28 Jan 2024 14:32:17 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 cw18-20020a170906c79200b00a31636793dfsm3208672ejb.201.2024.01.28.14.32.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 14:32:16 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-55eece07a75so601732a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 14:32:16 -0800 (PST)
X-Received: by 2002:a05:6402:3509:b0:55e:c6e3:5e24 with SMTP id
 b9-20020a056402350900b0055ec6e35e24mr2150353edd.36.1706481136452; Sun, 28 Jan
 2024 14:32:16 -0800 (PST)
MIME-Version: 1.0
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
 <CAHk-=whxYjLFhjov39N67ePb3qmCmxrhbVXEtydeadfao53P+A@mail.gmail.com>
 <a756a7712dfe4d03a142520d4c46e7a3@AcuMS.aculab.com>
In-Reply-To: <a756a7712dfe4d03a142520d4c46e7a3@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jan 2024 14:32:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiacNkOUvT_ib9t4HXX9DSsUCFOCAvbPi+WBkdX3KCq2A@mail.gmail.com>
Message-ID: <CAHk-=wiacNkOUvT_ib9t4HXX9DSsUCFOCAvbPi+WBkdX3KCq2A@mail.gmail.com>
Subject: Re: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
To: David Laight <David.Laight@aculab.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 14:22, David Laight <David.Laight@aculab.com> wrote:
>
> Hmmmm blame gcc :-)

I do agree that the gcc warning quoting is unnecessarily ugly (even
just visually), but..

> The error message displays as '0' but is e2:80:98 30 e2:80:99
> I HATE UTF-8, it wouldn't be as bad if it were a bijection.

No, that's not the problem. The UTF-8 that gcc emits is fine.

And your email was also UTF-8:

    Content-Type: text/plain; charset=UTF-8

The problem is that you clearly then used some other tool in between
that took the UTF-8 byte stream, and used it as (presumably) Latin1,
which is bogus.

If you just make everything use and stay as UTF-8, it all works out
beautifully. But I suspect you have an editor or a MUA that is fixed
in some 1980s mindset, and when you cut-and-pasted the UTF-8, it
treated it as Latin1.

Just make all your environment be utf-8, like it should be. It's not
the 80s any more. We don't do mullets, and we don't do Latin1, ok?

            Linus
