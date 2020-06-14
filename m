Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A011F8834
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 11:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD0689E33;
	Sun, 14 Jun 2020 09:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092FD89E33;
 Sun, 14 Jun 2020 09:48:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 64so6479966pfv.11;
 Sun, 14 Jun 2020 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvxXGWImKK0idVHDWiFzUpEVLlobMFbDY9vn//eI/9A=;
 b=nkJFC3z1IN6j1mHX2gbfdoVRUMFSXotIgLCRLgLxMSbaFtMSnRF9i6kPNYaLn0QY2e
 KWLSX5yWkn1H57pNir1VZyy69tP0B4cvfNrKqFk6IJJaoGiGxCLEbdaUkHe7qtvhd5DS
 vFsOyE+pK3shQ4G6+mAqNeZB0SEsE0vMc5xF8nAZgp01m5YYzqNOQqTpASlB+soZECmh
 GCIwNbUjkKVjQQRMUQnKOoHbCaMpw1wgHqGMsth8ybEFjzjAARbMFCP8BZmrDFx3Jy5J
 VoaROYENiQjg/qd/8KN/cIwZBaqSUczlgK4XHzX5xEcjnEBXf5YTQb1DorH79/IvM/NU
 KR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvxXGWImKK0idVHDWiFzUpEVLlobMFbDY9vn//eI/9A=;
 b=G/Y6mnpDW3KXnq8/2wUO+IGocHD5YwTa7xM/U66cDG+XBZDIvY/x414ispCLPw68IX
 BiFwc2g2LSqG3APQRrI1SyNdcJCdb3M23ikhkdN23KL/YO1GFPnaJ3g18Ku2SMSljXWq
 jkCfxKCRiUBpiXbClOWQS8rrlSWyogrN3s2HZ4mg0Ztgq9rzjPZava9wSfp8tKNru8iJ
 UsZBK7ilAGp0BUqHt+lb1muKvaB9/SjttmjT9z3hLQfewZwYeRSzrgGWi5DvFuBoHxVd
 fhgxdnhk1zjFuQX8u8L0TY05+IbEMk/Jf4mAUo48R6dS4TN5TqsGfpI1eePdL6uKlROv
 +dBg==
X-Gm-Message-State: AOAM532jMwfLJyiXITHNFHyvVteZyHsDa5GibkPTawMWWQljtOQ4bS54
 j0TF3SOAs9AmV1b3CuJ7te0yEnHMkugOq4cr21Q=
X-Google-Smtp-Source: ABdhPJwYZavEWvdA0J1yrGBUxY/uYHKnkxZs2SsvB+9yof058vomrhWPnHEJZKAb221T+W5zWfJi7OS9ca5pfxCA65s=
X-Received: by 2002:a62:5284:: with SMTP id g126mr12644494pfb.36.1592128103604; 
 Sun, 14 Jun 2020 02:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200614064601.7872-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200614064601.7872-1-navid.emamdoost@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Jun 2020 12:48:06 +0300
Message-ID: <CAHp75VcLR2w9Ym0YOqUT9G8xT9qWrdD1-wP4UA-1wtuwCNxqSA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
To: Navid Emamdoost <navid.emamdoost@gmail.com>
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 etnaviv@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 9:48 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:

...

> +               if (ret < 0) {

> +                       pm_runtime_put(gpu->dev);

Please, in all your patches fix this to be _put_noidle(). We wouldn't
bear the flag day of fixing these parts again.
Yes, I know that *now* behaviour is the same, but calling put here is
slightly inconsistent.

...

> +               pm_runtime_put(gpu->dev);

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
