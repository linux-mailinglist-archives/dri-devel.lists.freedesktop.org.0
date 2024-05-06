Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBB8BD04B
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 16:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F4010F08E;
	Mon,  6 May 2024 14:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRM5NQFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924ED10F08E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:29:49 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso2512971f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715005788; x=1715610588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P7R2UF48atqv/gEumi+l7V+7dd7ac8J8DMLbixRpr6s=;
 b=nRM5NQFnSvKeflgikrgveLvlY6RIvss0weShYSI7u8F/5edb0Q7908o1ZuZNSxo41m
 GkZHwBPWSeb58F0NEU6wdjjXyO2G04m2LLTIpXvr//EVOia59uHH29fdEMircXeQiLkV
 SRL9eVDqnIJ8WhW8rf6Clxnb7X0CYw0d9AVCu5ZNG7IX3LxZVHybzMsiMaAN44J89gvc
 fUPo0htUd7gO8md+NZpxRmRRU2m9Wpwg3JBUX8Cr6Ards/8s1GrccI7ykzx8S4RzplNn
 jubPx+EpsKB0fTivRvROZFdB2ob9XQqU4Lpy+M47QO+XWEAs2Dr8V0cWz5nSPGYcnTqN
 kNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715005788; x=1715610588;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P7R2UF48atqv/gEumi+l7V+7dd7ac8J8DMLbixRpr6s=;
 b=qrpvQaJNFpIqe2taEcVT6QYCvrCENTwB67yEpUDWqPUVp7KFI2JROaghquoIsFt/z/
 wLp+HJafLgplOqlE8NH/lNcTDx0xZPMq6t0SMRq7AwBwwBlMfw61pNdwASY/Y0Cw2xFp
 Dz0STuiyfobOtZNzg3pNBxmESvkVfo5Z9lUwoOkrkkvmCtRm2XSYxbj3d1XpaHg8c+7C
 AsknSSBHAfO5WKjgF0cKgby2K5U8CyTRHLU1UYt6lRL2JJLOFXYlUeArvvGaFS7AOm6O
 3tFrj8txwfCkrML3Xkb0hwVDJe9ACWRewAN8pP2h6QQwCwAhV9y7FCIizxGJWFx4T4zI
 P+6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6AOnatETbqW/MUvQNX40fFiee2vqMgfSPAFgRzualiFygS9GxQql7siOPa4nN63E3HgdqqZA8l+/Zi/NbQyRgVXaGDXewqaoUOTT5djOp
X-Gm-Message-State: AOJu0YyWszPCIXhXLvl30tRY9Dfa6e6PvRGzD21ZTJfrQhC2vixC+HdK
 U0KCZiv7QWI8vjKB5mX5wAFwBwBJu4FBCxAe5Jg3y2tsHWdKf42O
X-Google-Smtp-Source: AGHT+IH+uilrYBzdDMiE5k3XA1ozo74RVRh9CEWscdREfkRqL3c1m4xxcjh8Y/GbZ1wlL8KfoUDDPg==
X-Received: by 2002:adf:efc9:0:b0:34c:e6ca:b844 with SMTP id
 i9-20020adfefc9000000b0034ce6cab844mr8581498wrp.10.1715005787486; 
 Mon, 06 May 2024 07:29:47 -0700 (PDT)
Received: from [192.168.178.25] ([185.254.126.157])
 by smtp.gmail.com with ESMTPSA id
 dn2-20020a0560000c0200b0034e14d59f07sm10890219wrb.73.2024.05.06.07.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 07:29:46 -0700 (PDT)
Message-ID: <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
Date: Mon, 6 May 2024 16:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org,
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 minhquangbui99@gmail.com, sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 04.05.24 um 20:20 schrieb Linus Torvalds:
> On Sat, 4 May 2024 at 08:32, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> Lookie here, the fundamental issue is that epoll can call '->poll()'
>> on a file descriptor that is being closed concurrently.
> Thinking some more about this, and replying to myself...
>
> Actually, I wonder if we could *really* fix this by simply moving the
> eventpoll_release() to where it really belongs.
>
> If we did it in file_close_fd_locked(),  it would actually make a
> *lot* more sense. Particularly since eventpoll actually uses this:
>
>      struct epoll_filefd {
>          struct file *file;
>          int fd;
>      } __packed;
>
> ie it doesn't just use the 'struct file *', it uses the 'fd' itself
> (for ep_find()).
>
> (Strictly speaking, it should also have a pointer to the 'struct
> files_struct' to make the 'int fd' be meaningful).

While I completely agree on this I unfortunately have to ruin the idea.

Before we had KCMP some people relied on the strange behavior of 
eventpoll to compare struct files when the fd is the same.

I just recently suggested that solution to somebody at AMD as a 
workaround when KCMP is disabled because of security hardening and I'm 
pretty sure I've seen it somewhere else as well.

So when we change that it would break (undocumented?) UAPI behavior.

Regards,
Christian.

>
> IOW, eventpoll already considers the file _descriptor_ relevant, not
> just the file pointer, and that's destroyed at *close* time, not at
> 'fput()' time.
>
> Yeah, yeah, the locking situation in file_close_fd_locked() is a bit
> inconvenient, but if we can solve that, it would solve the problem in
> a fundamentally different way: remove the ep iterm before the
> file->f_count has actually been decremented, so the whole "race with
> fput()" would just go away entirely.
>
> I dunno. I think that would be the right thing to do, but I wouldn't
> be surprised if some disgusting eventpoll user then might depend on
> the current situation where the eventpoll thing stays around even
> after the close() if you have another copy of the file open.
>
>               Linus
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

