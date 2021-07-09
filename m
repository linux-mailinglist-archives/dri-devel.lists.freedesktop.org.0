Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29873C2035
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 09:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5266E9CE;
	Fri,  9 Jul 2021 07:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039A6E9D1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:49:14 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id i42so1981991vkr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 00:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ehlBa+HtjKV4+ykQO254b/PW48csECL6xnzySzLyqo8=;
 b=ln8aEqmOxCKi+p5yI7PIlinD2bkJRBurJsgAujzOsslmWLxWto0mM6kNHQo4pnwJmD
 i+7DGiATrNYraHn48EMTGHoVlp6QpyeUEe1lf6aGVoYgzg6AzT0eFCobFmyBbc7+pBS2
 VjHddK66nGgGio8u+ZcrjqtdA7Pl/GQDjK4WVSFZ6EpQeYN/mvFt2RrpMbBzaEkbOMsr
 WW+LOzn4CQoIo/eXg2Bxv9KN9lq3gVYiudiq9KFZIaGI/dz8IvCUS+wZ4VJhsVd4qoT+
 qvqn18PAsH2m/1LhJC8FcifZTAKDtOUlO9SA+AdC5mOroCM0LRebJvC36fOZ2wNzo65G
 8eJg==
X-Gm-Message-State: AOAM53334IgSiia+w13zZ/kitYPV7fi7BLWRN7JmvKe2INJfO5ghdXOa
 D05zvwAWnmAsK0ZV79iv47sGYdntRvyFCA13vu0=
X-Google-Smtp-Source: ABdhPJw2UDBcz9da1MB6qrpiT6AxAXFguCuHCKvYha65Fne8x78kJ+6SQYYVOOu55/IoqF0T6RhQj6eIUds0SfdAcrg=
X-Received: by 2002:a05:6122:588:: with SMTP id
 i8mr20230622vko.6.1625816953655; 
 Fri, 09 Jul 2021 00:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210709010055.86663-1-someguy@effective-light.com>
In-Reply-To: <20210709010055.86663-1-someguy@effective-light.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jul 2021 09:49:02 +0200
Message-ID: <CAMuHMdWhs4en-yR9ic+d4V9M_0BUFX40rP0M=tZRGMaUy2wv3g@mail.gmail.com>
Subject: Re: [PATCH] fbcon: garbage collect fbdev scrolling acceleration
To: Hamza Mahfooz <someguy@effective-light.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 3:04 AM Hamza Mahfooz
<someguy@effective-light.com> wrote:
> As per commit 39aead8373b3 ("fbcon: Disable accelerated scrolling"), we can
> now remove all of the code that was made redundant by disabling scrolling
> acceleration.

Bummer, more code to revert to re-enable acceleration in the _56_
fbdev drivers using acceleration (some of them unusable without),
despite commit 39aead8373b3 claiming "No other driver supportes
accelerated fbcon"...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
