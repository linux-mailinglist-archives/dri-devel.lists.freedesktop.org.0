Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77322883DF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D22F6EC52;
	Fri,  9 Oct 2020 07:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DBB6EC52
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:47:37 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d1so7282207qtr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAiaW+93Fl44jRzXXS4wP2VkVubvR/5JY7dN1rt4R24=;
 b=W2/Ti3kYbkEU5RKCfPrBtOvrhfe9cr5iuuAldgjQ7SvTctTZBqQB3etOoQUyfT1pjh
 9uLIyPpE3dMy91CHV8oruvhojOvHgUTEGe0B1p52ndlkMEoY9sf9xwsZ8MwshknuqA4f
 jpAFBR0c47xN5bTpItg86xQwUfhypUtNqWUPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAiaW+93Fl44jRzXXS4wP2VkVubvR/5JY7dN1rt4R24=;
 b=s5CMl8CBWBUs5eIXha/q4dxy+nl1KfJqu5m2MyM9pTVXAwaBl2KgyUhOwzHUXTIoy9
 UmnX9Kee+hWsMtxHqFg+LSSdI/SqHtMsL1NDUHb9l0m1tVFI0qmlvnnXvmtbwGBN4bxh
 b5mrZfQSeDjB0mqtcF5SXWxb8g7HCBWOD3ic8jxWJ5SwsoutSsnojEkGyTIuBmZbCcVY
 Mz1UQSVgO71DBp8ZC6NnZZ7uM6PcFQgc4eUGZpPefGt+oioloxGm0H7TKBHg2MS3AX6g
 02TnbRRcTeVdkhHaoavmeIqpGzpJcdobFchB8aUMjBPBm/jPQmklMk8GYiDZjhNJyHkQ
 Bwtw==
X-Gm-Message-State: AOAM531WpNYhcUY3iXyDBxKOiiSJXaEbf6lFRBa/A2QwrzFQBI3RMEAF
 WfOv6eCEBrLduykYyPMh/lB7cMfGNQshuiIArnY=
X-Google-Smtp-Source: ABdhPJzaS4AsDvCUEmHGRC+WwFuD4vOUEpxsmXwUsmKQfLl5+lxXtC5MeHCenesLqwiwzmORkg0T9r/PACyAmMvdq7A=
X-Received: by 2002:ac8:48ca:: with SMTP id l10mr12339910qtr.385.1602229656436; 
 Fri, 09 Oct 2020 00:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200222235152.242816-1-megous@megous.com>
 <020e9eb5-4fdc-44d0-b00e-42b6e6435110@www.fastmail.com>
In-Reply-To: <020e9eb5-4fdc-44d0-b00e-42b6e6435110@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 07:47:24 +0000
Message-ID: <CACPK8Xd-o+5xA=T12yR6+gxmpvwkqi_VjU10MpsLVzh0e2dKnA@mail.gmail.com>
Subject: Re: [PATCH] drm: aspeed: Fix GENMASK misuse
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:DRM DRIVER FOR ASPEED BMC GFX" <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 at 00:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Sun, 23 Feb 2020, at 10:21, Ondrej Jirman wrote:
> > Arguments to GENMASK should be msb >= lsb.
> >
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> > I just grepped the whole kernel tree for GENMASK argument order issues,
> > and this is one of the three that popped up. No testing was done.
>
> I think someone's sent a patch previously, and last time it turned into a
> discussion about how the macros aren't actually used and could be
> removed.
>
> Regardless:
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, I've applied this to drm-misc-next. Apologies for the delay.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
