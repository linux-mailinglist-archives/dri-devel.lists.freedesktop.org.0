Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863378BB59E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C9B112236;
	Fri,  3 May 2024 21:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BOFPp1Um";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FAB112236
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:25:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5171a529224so120877e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714771504; x=1715376304;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fhxz4aHpmXZJ6K0C5hNTESMtOJDx3oTLGnKkbndye9Q=;
 b=BOFPp1UmxbirLw4sqZ+zwlQLDRpJLiW4ZTz+tEpU5NNYmTFceLXH1ZMEgh8kzKVmTX
 eVwvAbiWHLiEGXD9blHdJaYyCRPAwkFb0rLeOBmpPAtT3Tq3gIv4lrunsmNd5c0jwK2l
 R3y9RSAbEIIPEBe/L9D4rJospt1WnOxUiOOoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714771504; x=1715376304;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fhxz4aHpmXZJ6K0C5hNTESMtOJDx3oTLGnKkbndye9Q=;
 b=kDcJOBAG9ym5EEdqrPyNoGC3iuf71rICtDQ6vcw/Wq24GOG5R1N/Gbyq9CcFX+DN2b
 vQJ27QGhUUo4yeyQRHxYwXP4UgT+/JlPKl0Awyw3HAzqSDGoktnGFRBLAhH01f5TLrza
 i0zNSlpM0pNHUiFW4DzZqEd+CJ76Pt7kEhw1n26ApsSexAt0Zumb0ftxU1R9kCZuFjOj
 XGcm6RqbfVZCi2IGxPN1tW9I03Q20esZne/7zq1yhklIkVNVUPVeilup6Z+liuOgN7GL
 A4odAIi9FrYY15nKaoRzPIetsHZL0YZjcnML1m7JK9j/x50MxFUwXImNdli186wACZdO
 eL6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFbxJZVO3sF7n4v5DIMy6V5GS03zhMsn0GSkaJZE7YOT4yG+Q90ynzh+uq3yzfTJnLxLkA1YEOWtxFsMCE+Y44oBcYVkyhKQ4X1THq81Nm
X-Gm-Message-State: AOJu0YxZxSMnBffFh6M+d2WOF9bJdmdBWzAWQ2b0DIsruin28h2ua8Q3
 u6vWlBvs9aU0epA1PahE0faAwqNI1I3cOEZvwb3Ppok20KpXClCItaw1ZQIyxBz2tLUSlIiLLxD
 s/7kSgw==
X-Google-Smtp-Source: AGHT+IFURIYqfxHz8yaocFiMxbEFBPqYvnjPEhCj5fNbqBtxM+IhdpsMjnCRIzq2/6dQi6LFAjfI2w==
X-Received: by 2002:ac2:5f97:0:b0:51e:76a4:4e6d with SMTP id
 r23-20020ac25f97000000b0051e76a44e6dmr2247024lfe.51.1714771504049; 
 Fri, 03 May 2024 14:25:04 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 y17-20020ac24471000000b0051d1325c8b1sm654616lfl.169.2024.05.03.14.25.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 14:25:02 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2df83058d48so1242571fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWEXzp0LXvOYJoqFZKdHjcOfnw7hSswxfiRKIrqjEOKjPvNUzZymH7SwDPIe1Mkgk5Zuz4nq2B2PUVkLcdx3EqDBkEQFYVAcMV+xUfpycws
X-Received: by 2002:a19:381a:0:b0:51c:68a3:6f8e with SMTP id
 f26-20020a19381a000000b0051c68a36f8emr2449065lfa.31.1714771502428; Fri, 03
 May 2024 14:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV>
In-Reply-To: <20240503211109.GX2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:24:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
Message-ID: <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
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

On Fri, 3 May 2024 at 14:11, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> What we need is
>         * promise that ep_item_poll() won't happen after eventpoll_release_file().
> AFAICS, we do have that.
>         * ->poll() not playing silly buggers.

No. That is not enough at all.

Because even with perfectly normal "->poll()", and even with the
ep_item_poll() happening *before* eventpoll_release_file(), you have
this trivial race:

  ep_item_poll()
     ->poll()

and *between* those two operations, another CPU does "close()", and
that causes eventpoll_release_file() to be called, and now f_count
goes down to zero while ->poll() is running.

So you do need to increment the file count around the ->poll() call, I feel.

Or, alternatively, you'd need to serialize with
eventpoll_release_file(), but that would need to be some sleeping lock
held over the ->poll() call.

> As it is, dma_buf ->poll() is very suspicious regardless of that
> mess - it can grab reference to file for unspecified interval.

I think that's actually much preferable to what epoll does, which is
to keep using files without having reference counts to them (and then
relying on magically not racing with eventpoll_release_file().

                Linus
