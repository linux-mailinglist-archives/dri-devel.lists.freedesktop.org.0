Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DE8BBCE8
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 17:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A54110E94C;
	Sat,  4 May 2024 15:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Io4sRGbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6054F10E94C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 15:54:07 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a59a17fcc6bso124464966b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714838045; x=1715442845;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kZo6ArVOf5NVi3NAdVYQGqHRs84wzKq7YB5CfjfJdNw=;
 b=Io4sRGbW32rmIbi6ir/u4QeZZjyOfnMSiIeDHYLUq29oSKXgmdAWAZbaEpiG/oxuZY
 whYqCYKOk3yHWwm4WIiXiSDEoYuN+yNJcCwJ6PF2Z9CZAdQmhCI2c9o7l08S4Vfg+iYD
 p43xd+IfvBn5ncMaMNwIRXaqfiW0zmcWoHitg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714838045; x=1715442845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kZo6ArVOf5NVi3NAdVYQGqHRs84wzKq7YB5CfjfJdNw=;
 b=QjClnFvlRhB93fMWzHvbeE3A9gW9A5vxYkylpSIi47k5pOeD2J+4ZU3oFcNuIwem4d
 /Ih9q83qDtna5ROLkz5mH42rtnRwufgs4wjcuSIdepsyrgb6bJ1EkgSqvrnPhT/PuuoY
 jAystqHfV/8LSn05t7xpusFzN5rnS5VzLftvxGo4KDgxFXLC2RfSE/7aIlKEr6x5o0N9
 zJeq7mJ6tIW9LoDDMTOE0YtaEUDy57OeWVKFiAPFcdUyIlMmWAgoOWAgMd2mVi1dFeQh
 f9LyHsFr82mPaDLd1De5a/p36zMAxD4x7ZdK7ErMivACJl9La7oaeXod+XlWbNBR8u/3
 5wmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCn6gwyxOcg/tO+THqZWubl6k0HzxrpP5oUK1GEp//fK0p4R11cFU2lCNJndLgkDijAP89U9Qbs9bAQ6pON9SaDv02Ep1GjAwquEz3h0Cx
X-Gm-Message-State: AOJu0Yxs6EFaTaPuSSPlkoDjPFULJjGrSvTXuoUIHOXrKsNXRRV6Jy+W
 s2fW9OBKmZh/u3j1pGuL2IOC1LDXOOE4iJh4LLUFtwDLBPIoM2JtbIPin8ZYRCSZJBcSvIxkP95
 RmZx27Q==
X-Google-Smtp-Source: AGHT+IGYxSnTLw+EvsZ9XDvSRXjpUenOrrsHckZqG1tiuMn3m+k9V+HoWPvaGzdoG9rBjL+KTEc8Og==
X-Received: by 2002:a17:907:7da2:b0:a59:b784:ced5 with SMTP id
 oz34-20020a1709077da200b00a59b784ced5mr325972ejc.67.1714838045260; 
 Sat, 04 May 2024 08:54:05 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 bk15-20020a170906b0cf00b00a52244ab819sm3106526ejb.170.2024.05.04.08.54.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 May 2024 08:54:04 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a59afce5a70so57116066b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 08:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXyk/qqX7BKuT/H9/rQb2G2B8QbbdBq4z/a9scEOtvt9O9ndemZWKWqoQtF4CuGlF22IAKnXNpplcke6mfhRXKN8bsmJsqu/hn2azudtXZ
X-Received: by 2002:a17:906:a842:b0:a58:5ee1:db43 with SMTP id
 dx2-20020a170906a84200b00a585ee1db43mr3389515ejb.23.1714838043724; Sat, 04
 May 2024 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
In-Reply-To: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 May 2024 08:53:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
Message-ID: <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
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

On Sat, 4 May 2024 at 08:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And maybe it's even *only* dma-buf that does that fget() in its
> ->poll() function. Even *then* it's not a dma-buf.c bug.

They all do in the sense that they do

  poll_wait
    -> __pollwait
     -> get_file (*boom*)

but the boom is very small because the poll_wait() will be undone by
poll_freewait(), and normally poll/select has held the file count
elevated.

Except for epoll. Which leaves those pollwait entries around until
it's done - but again will be held up on the ep->mtx before it does
so.

So everybody does some f_count games, but possibly dma-buf is the only
one that ends up expecting to hold on to the f_count for longer
periods.

             Linus
