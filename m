Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49C8BB669
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912FD10E06D;
	Fri,  3 May 2024 21:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SBf6iPYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB9710E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:52:57 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so18526766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1714773176; x=1715377976;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A7KwjGqB6cN3Dl955k2+YGPiXLoEdjHxOLmUV0m+ZBo=;
 b=SBf6iPYgBBP1SifjYTzgT9bkefmksDXba6dYtylhmkhQxHXv6dg0qlNdMwB8E76lUF
 AcRkrlRY/jKbn9j3l9vco2WoujnHCHyqQxJZO/E0/p8C9AAFUhnJ4WtOwQ0DWzF6wN45
 BjM2ZhvqC/Jb4NfYL9fDTxrVfvgbbrSGToMzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714773176; x=1715377976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7KwjGqB6cN3Dl955k2+YGPiXLoEdjHxOLmUV0m+ZBo=;
 b=LfsnMcqdIf2RaeUQ6BtsO31u0TxwZE4GlNQ0oaNreBDaAt52qaJHZY6FPDaE5W46Gy
 mxb4e3wxE8DzkQZKopXzJu3znk4kGLFU+kvomtMyDXKQfxl2isTUiV9AbCmUdpIDDbcw
 85qOYo+dEpgf/gYK80148i0IbchjXk6oPhA6jRJ4yVTuBRef/mUzeKvp1MWWcAPtJiud
 3qntV/S/1v2JeHtj88kGOMwn71luHdlr5SYuFW82147tDfXSnfJp24TWcFl8Otu574x4
 /F6GzRYqmSvIsfnv/JQLs6oIFOmfADp0S7HK3rmp44PwE+9ZvJl2wKlcJ7cGkeU6v2Ix
 3gsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkDo25PUucp/ktLnGuKqHLyrNNrsK1CFVAV9itl/KYueQtPKa7oUynm4S+KKHj1C711oAAEjlRFQ9HuWNbi9Os49lWOshSCCY2dRMQwAHO
X-Gm-Message-State: AOJu0YwximnsuJAvNq3AOWQxDYvXRkPoM+u10Qy0p5E4pA0qYLIuJNaX
 CcIiCTywufpJlNIvi01gai2iOPIYw78zRAbT+XkpwSlAhuTANq6SSbMDU0w82K7rynpDJEhoUBw
 vIhl/KA==
X-Google-Smtp-Source: AGHT+IFKNPa1tUhXThWPJD4SS2IGNPuWMxDZv5emAXq9QvJ7tsuOF1ZCz3QPvsvzW8qEszNp6ztQeA==
X-Received: by 2002:a50:cc97:0:b0:56b:9029:dd48 with SMTP id
 q23-20020a50cc97000000b0056b9029dd48mr2541808edi.5.1714773176052; 
 Fri, 03 May 2024 14:52:56 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 p8-20020aa7c888000000b00572aba0d8a0sm2130524eds.88.2024.05.03.14.52.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 14:52:55 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a599af16934so17660766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXSuCzhbZbw29AAOk2DzBTXnaOHPBr1PiqpvolBKMHubZNvG5kfA+T7dFEVPepvFmrQylFWvIeMSdKk4de0xvS1wMlM0ZeaY7USa9HkvXf6
X-Received: by 2002:a17:906:eca8:b0:a58:c639:9518 with SMTP id
 qh8-20020a170906eca800b00a58c6399518mr2622517ejb.76.1714773175036; Fri, 03
 May 2024 14:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
In-Reply-To: <20240503214531.GB2118490@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 May 2024 14:52:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
Message-ID: <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
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

On Fri, 3 May 2024 at 14:45, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> How do you get through eventpoll_release_file() while someone
> has entered ep_item_poll()?

Doesn't matter.

Look, it's enough that the file count has gone down to zero. You may
not even have gotten to eventpoll_release_file() yet - the important
part is that you're on your *way* to it.

That means that the file will be released - and it means that you have
violated all the refcounting rules for poll().

So I think you're barking up the wrong tree.

                  Linus
