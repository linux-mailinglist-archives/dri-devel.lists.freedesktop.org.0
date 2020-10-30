Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5429FC31
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 04:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0035C6E948;
	Fri, 30 Oct 2020 03:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB836E948
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:30:17 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k65so5356035oih.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 20:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oMY9pxFypCz+sF9iqPwWsJbC9qvwpmj8H4dhF+NfdQ=;
 b=Cm2BCBaE0HkCTyOU/fbadFmrRd5FXxeBg8UMkDSDS1j6UyRSiTx5urdd8HHKLA6zHR
 hY06B2HqNpN+dCebixLmWfx7eJpaIQ4VrKXtvWStO+woq17+xkAiZkij8073l2qZVMfM
 /yge+eZBZQbEZ/DBrYRiyEwSv4qYPr5cGlc8O/WbKQmnfcMStPl+g4wLrSNImh8CLwEI
 32NkObz9twkgzIWYkvMls7X2hNLrhSJiqi21XNx9Ccop5rYvlKeKtv+Okwy0RirNRC9k
 UhOiE8R4dvHFjQ6CydKSNwMesYjB2yeiEnVXHYw6SK2UD0VGcyum+RxmbZdvVbJBb7FG
 MbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oMY9pxFypCz+sF9iqPwWsJbC9qvwpmj8H4dhF+NfdQ=;
 b=PrqqyX8GT8cJQi1mkmaOaiiB/5NDECfKac6hCcnjbQ1rMK2xAD6ACbZISOcFtkLRjk
 kzP14T8FsXyTw40NW3v74VGdrl7CBYtwNSa0dyDrEKkjmcvWPiUOsJYnAJ4ZSME3bO/x
 UAz8DdYqltZK82dN7j9El9XVEQ5qAnHpPjrwC/S5iU2McNXgETke8sJOQGcmVnTu9r9C
 VdowHGTzo6QNqPmrzHMgM70BBGnRn2TGBucNZJZBLvqK0heJfp4ihSkm3NX4s7SRYDyi
 2OdSBlsyiDZzsaSF4PLMRRYz2jqBxXZxyNvFBhmRiPJY9tYqd41KRxiUZaoOsSTq6McS
 dVxw==
X-Gm-Message-State: AOAM530Ip1qN44vrfKU/r9/uS1XGZ92Dwswvp92CVjwkc029JbF98+/k
 s6Rqe06kXYZbAGZB2NQXq+uHYtkpfrzEEYxCqonqLQ==
X-Google-Smtp-Source: ABdhPJyoYlDfNB9INSs49MENv3IRsfUKToKB7mwBdmNjsIcA5aDVVdbolYFcxBttTKe/8dItjxvA3P8hwe661BVNN2c=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr224448oia.169.1604028616954;
 Thu, 29 Oct 2020 20:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201030023427.3078-1-hdanton@sina.com>
In-Reply-To: <20201030023427.3078-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 29 Oct 2020 20:30:04 -0700
Message-ID: <CALAqxLU1=vScNWfxc-Ji9F_cY311z8GuFLiFT0q0PrDyJVxViA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dma-buf: system_heap: Allocate higher order pages
 if available
To: Hillf Danton <hdanton@sina.com>
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 7:34 PM Hillf Danton <hdanton@sina.com> wrote:
> On Thu, 29 Oct 2020 12:34:51 -0700 John Stultz wrote:
> > As for your comment on HPAGE_PMD_ORDER (9 on arm64/arm) and
> > PAGE_ALLOC_COSTLY_ORDER(3), I'm not totally sure I understand your
> > question? Are you suggesting those values would be more natural orders
> > to choose from?
>
> The numbers, 9 and 3, are not magic themselves but under the mm diretory
> they draw more attentions than others do. Sometimes it would take two
> minutes for me to work out that HPAGE_PMD_ORDER does not mean 1MiB, on
> platforms like arm64 or not.

Yes, I can say it took me longer than two minutes to dig around and
work out HPAGE_PMD_ORDER for my last reply.  :)

Though I'm still a bit unsure if you are proposing something more than
just a comment to explain why order 8 and order 4 allocations are used
in my patch? Please let me know if so.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
