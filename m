Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B648BC2F9
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 20:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADE2112C88;
	Sun,  5 May 2024 18:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MDL6bCh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33F112C88
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 18:04:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1eca151075eso2874945ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714932283; x=1715537083;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mE6ET/wemNoj1wnsoN5H46vn2H9jFrdPiFfXm3O1q/E=;
 b=MDL6bCh92W2Ahz2lU2XA0cSigEmVwL9Bo02kJYJ4LgEW5zN7DFFrtHTIUSY+RnCMEr
 VSPS5A/nXyG538mZ41A8sNv84xqvSewE9bhPqbekjQcsPgebahLDvJmROv6mueFeSDv8
 QN4QBZnFsss/RF39QJWL9jJ4yrn/X3rpD/NPlekd/V4QFUhgwLqcW078lXCy8zA+OTxZ
 8QTCCQ2+41DuD8ynglvwFbCZElxlMKANgdS+F6wI+1GcIHf8cCkv6MJMEWYuHNHjlp0l
 RcyBu6Zff/ipTPlyTAI/HhBeWiUzCD/I3EAaPg8/r5hsQiAX4pj+oSBzp8H7BLSPu93L
 Dyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714932283; x=1715537083;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mE6ET/wemNoj1wnsoN5H46vn2H9jFrdPiFfXm3O1q/E=;
 b=Mc66AHnfi5If4T6j/jZAyYCrpLRzMzg8Q9S+9E5zKtcEibFjZG9u9VfXS40kBAkakd
 cfl9ToPoIsD9mw8Cii9lzSojJhGdJeSOUBip2iksGItBolr7s4uIFD+DNJvwQQxfPCxL
 8wQV/nESrhzHUenRSDEbPn5jt+vKGFJI2TIEn006mdigebsjagOPOer9bHmYLjCuNuM5
 EzihdaP66wqCsSmTmg16P4lcpq+q5vaLNsw+XafzUdDI8OkQ6uJYSonJCZK107QLCbgF
 S3+7FzvUgJpSWLJd1lf+qmpSbwCdt7oTL68ulv9i9fi1x9YEzBcLGrYKYCmPxnyVMWl+
 LHPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXehD7YKuzBac3BpHT0kR+m/Y7iBXMP06hiwqj9b/kIJ/TrUkvjrBwMD5xw9ym85u9HNnhOH7/gMa6pnoczO+off8jLZGAK/3n7RsPH6+r6
X-Gm-Message-State: AOJu0YyCbV1lok8aNwMFXds3hJPKXE/v+JqTQiKpR+gh4/Tp5plXszl5
 ZyhDpamiijeOJAtd7N8uCG2uQNjmZJitjovPvw8PBoBeZwc05lXTYeV441uRV2U=
X-Google-Smtp-Source: AGHT+IGWjfUE/TDqZn5+tc9zv5WMH1AwiF3VlKR+EV8RVaOEHMWP8GFvz9bqpeX6sGO+oAr45ebqrg==
X-Received: by 2002:a17:902:d2d0:b0:1e8:4063:6ded with SMTP id
 n16-20020a170902d2d000b001e840636dedmr11260813plc.1.1714932282996; 
 Sun, 05 May 2024 11:04:42 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903121200b001eb03a2bb0asm6700128plh.53.2024.05.05.11.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 11:04:42 -0700 (PDT)
Message-ID: <be4fe24b-daa4-40af-806b-40db570e37b2@kernel.dk>
Date: Sun, 5 May 2024 12:04:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] epoll: be better about file lifetimes
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: brauner@kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, jack@suse.cz,
 keescook@chromium.org, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
References: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
 <20240505175556.1213266-2-torvalds@linux-foundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240505175556.1213266-2-torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 5/5/24 11:55 AM, Linus Torvalds wrote:
> epoll can call out to vfs_poll() with a file pointer that may race with
> the last 'fput()'. That would make f_count go down to zero, and while
> the ep->mtx locking means that the resulting file pointer tear-down will
> be blocked until the poll returns, it means that f_count is already
> dead, and any use of it won't actually get a reference to the file any
> more: it's dead regardless.
> 
> Make sure we have a valid ref on the file pointer before we call down to
> vfs_poll() from the epoll routines.
> 
> Link: https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
> Reported-by: syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com
> Reviewed-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> ---
> 
> Changes since v1:
> 
>  - add Link, Reported-by, and Jens' reviewed-by. And sign off on it
>    because it looks fine to me and we have some testing now.
> 
>  - move epi_fget() closer to the user
> 
>  - more comments about the background
> 
>  - remove the rcu_read_lock(), with the comment explaining why it's not
>    needed
> 
>  - note about returning zero rather than something like EPOLLERR|POLLHUP
>    for a file that is going away

I did look at that 0 return as well and agreed this is the right choice,
but adding the comment is a good idea.

Anyway, patch still looks fine to me. I'd word wrap the comment section
above epi_fget() wider, but that's just a stylistic choice...

-- 
Jens Axboe

