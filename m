Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116FA948485
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 23:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7002E10E2CA;
	Mon,  5 Aug 2024 21:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZUPtYyAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365810E2CA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 21:28:41 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so487693566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 14:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1722893320; x=1723498120;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4JmhoGoeqp0EkHzxnqjsByi1+fgV+qGizB/Udaf1KjI=;
 b=ZUPtYyAuVGiMzZhHAPivWS0So7tUSVoLxlKhb48uFQ64f7nEm2LoOYYrTW41bkSYKC
 rkNA9Ht1yhKXzZKofs3xqTkPKHXp7cqR48uzmkOQsEx8n0HxX91kpjd3PTn1wgZjyR2v
 M2sEI7gATAEj1V/DZuooKCgpsNgm8xerTANZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722893320; x=1723498120;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4JmhoGoeqp0EkHzxnqjsByi1+fgV+qGizB/Udaf1KjI=;
 b=D9sfJOkSYqgPJ9UH6WvZbPFJ/Gn7ZZNgeQMZduYfG6POdAYCXl26IYcRjCDHwpgFP0
 /HTdq9oe5SYnckYM7xKVVaIQnVD8ECIEvHpTL/jYBAu71FTd+Thyv9LnNSahmhWtZC2Y
 qvAt7DkBFABGKmigpNvdVa06RKoVbEe2Rk5KBEeuhSobJsDC6refxp9lUz09QoXsxGOZ
 h4p6MxcO0c+X9kGC+ZDD/u4zfZp9SMsxGvR0D/EwAaQJwwRh9yjPrsvIqihchaeuxI4x
 Wem+NUi89dd/bKuQV4nDpWpmkKRxAHr54o74JLluApXFqkiNuilyOgusW3C0dEUwxOtk
 IETw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0tPuBKJObABZA2dC4PNNCbjSAmOzHiNpj3JAGZV3yAWlFlWFaJSy0oZnkFs5UmCyXAwlzzG5nJW05M9u7kAqjiTjkZ7LBrp94CuEFluqQ
X-Gm-Message-State: AOJu0Yyxs4ETgdxV2g82ELqGw5ea+QJm1vr3LGJM4ifg5bxr82JZEZuL
 ckh6Ye4ublQKMOq2zwUr0aG1v8evDvXv3xZnbgKZXtdDOWxyRQ8vAS1M6uxcBFkwxc8kYm+Mnre
 jfltweA==
X-Google-Smtp-Source: AGHT+IGDuEgwKEeXLAGmnX2wGODhn+ghGCt6qdO1GqM3uHAVWrWiEhgWiKU7u2twSybTFfHKS8Fo1Q==
X-Received: by 2002:a17:906:d54a:b0:a77:c330:ad9d with SMTP id
 a640c23a62f3a-a7dc51be76emr979597066b.61.1722893319899; 
 Mon, 05 Aug 2024 14:28:39 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e7feecsm494272866b.176.2024.08.05.14.28.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 14:28:39 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5a2a90243c9so12616764a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 14:28:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCULOWbMvGz30JNhxXjc947pEXKZjGG0NDBHu8qoH+O+4XEXpCo70boVwGMCq7cYpa29KXRIzsBylck9vKM7/unPoslhdKXlT/8gRDyI8ReW
X-Received: by 2002:aa7:df97:0:b0:5af:758a:6934 with SMTP id
 4fb4d7f45d1cf-5b7f0fc7f1amr8956337a12.0.1722893319128; Mon, 05 Aug 2024
 14:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240804075619.20804-1-laoar.shao@gmail.com>
In-Reply-To: <20240804075619.20804-1-laoar.shao@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 14:28:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com>
Message-ID: <CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Sun, 4 Aug 2024 at 00:56, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> There is a BUILD_BUG_ON() inside get_task_comm(), so when you use
> get_task_comm(), it implies that the BUILD_BUG_ON() is necessary.

Let's just remove that silly BUILD_BUG_ON(). I don't think it adds any
value, and honestly, it really only makes this patch-series uglier
when reasonable uses suddenly pointlessly need that double-underscore
version..

So let's aim at

 (a) documenting that the last byte in 'tsk->comm{}' is always
guaranteed to be NUL, so that the thing can always just be treated as
a string. Yes, it may change under us, but as long as we know there is
always a stable NUL there *somewhere*, we really really don't care.

 (b) removing __get_task_comm() entirely, and replacing it with a
plain 'str*cpy*()' functions

The whole (a) thing is a requirement anyway, since the *bulk* of
tsk->comm really just seems to be various '%s' things in printk
strings etc.

And once we just admit that we can use the string functions, all the
get_task_comm() stuff is just unnecessary.

And yes, some people may want to use the strscpy_pad() function
because they want to fill the whole destination buffer. But that's
entirely about the *destination* use, not the tsk->comm[] source, so
it has nothing to do with any kind of "get_task_comm()" logic, and it
was always wrong to care about the buffer sizes magically matching.

Hmm?

                Linus
