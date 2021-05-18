Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E80386F58
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 03:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1BA6E02F;
	Tue, 18 May 2021 01:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E216E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 01:35:47 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id c15so9516333ljr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 18:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Y4UC937pcRi6mdp2HazCoUPjtNxk9PJkqRxwraum1Y=;
 b=gqVqIx8Ym2P95cU1nEwsXDnOMInJKjvLvl6PdHm+m4USuWxwS7QapJ/4AnjrYoQgjp
 Ul+p1xz0jsBYnf7HxkvT5KEQQnHy9T/2McLKcqfpIWocA0q+0ATrVtMzn0XcOX6uS6dk
 /MUMbUdum0s43SXkfV0oQ3/kVHBjAyHYj0f2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Y4UC937pcRi6mdp2HazCoUPjtNxk9PJkqRxwraum1Y=;
 b=ls681jel3OeF8XWXIqERd10Cx40oLw3HWGWhe0teQzPnQ9M4BXPm4soADtvJ7jv/Q4
 nyKvd4U7B1IAyaSrmiwbKlO65XGB2IOF0UrPwnB3SRPy5puGBtLFJW3Wl3Dt+pYexUN9
 OCyoNL71kKXBiKBQEWLPa3OAPZu/gwqhGBH4jpq6KgIqfvzFpvS9ec7wEk+pp2WRcJ0t
 EAELrPM2Fxw86S991MtvQef1N/u/fMqN7MKOftQj9WHuo7c/iCJQZubAeIF2mcV46bBG
 60teoyOmT4MPPlEtR5Zn9PywEoatBGEUgrKYKEIAWpXaHVLr47mvtKQmFc+ZxVJk1M7H
 uT0g==
X-Gm-Message-State: AOAM532IM0I4HWbF8oP96SivmCzcPAr2Dtliw7U7pHvKRVbQd2Pj7S7M
 rd4/4j+seltcM3xUVnhtKKCCsioVyyhDhRFL
X-Google-Smtp-Source: ABdhPJxK8mRAN+r0w7+3ScjYwiu50V9Of2EeFe/KXKx5mI4W1flQCQ4/wogQwD6hwDpZ5n1CiEBH9g==
X-Received: by 2002:a2e:b6d1:: with SMTP id m17mr1916761ljo.149.1621301745561; 
 Mon, 17 May 2021 18:35:45 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id o17sm2124686lfi.91.2021.05.17.18.35.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 18:35:45 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id v9so10244653lfa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 18:35:44 -0700 (PDT)
X-Received: by 2002:a05:6512:36c5:: with SMTP id
 e5mr2066552lfs.41.1621301740633; 
 Mon, 17 May 2021 18:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210518010940.1485417-1-sashal@kernel.org>
 <20210518010940.1485417-5-sashal@kernel.org>
In-Reply-To: <20210518010940.1485417-5-sashal@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 17 May 2021 18:35:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whw9_rp0NYTsCqcGnUkcV5Qgv7FTxADtPrdq4KFmsj+Lg@mail.gmail.com>
Message-ID: <CAHk-=whw9_rp0NYTsCqcGnUkcV5Qgv7FTxADtPrdq4KFmsj+Lg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.12 5/5] tty: vt: always invoke
 vc->vc_sw->con_resize callback
To: Sasha Levin <sashal@kernel.org>
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 6:09 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>
> [ Upstream commit ffb324e6f874121f7dce5bdae5e05d02baae7269 ]

So I think the commit is fine, and yes, it should be applied to
stable, but it's one of those "there were three different patches in
as many days to fix the problem, and this is the right one, but maybe
stable should hold off for a while to see that there aren't any
problem reports".

I don't think there will be any problems from this, but while the
patch is tiny, it's conceptually quite a big change to something that
people haven't really touched for a long time.

So use your own judgement, but it might be a good idea to wait a week
before backporting this to see if anything screams.

          Linus
