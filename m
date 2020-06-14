Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF91F8F90
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51B89FD4;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF33A89DC2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:15:20 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id y5so15500055iob.12
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpwnKZ9Z6FevvyoUxw0sdksaS/2sRQ75c+duIaoaZRc=;
 b=kQZ1gsfj4lQvJR/H6vCmpiIkhHpY1f5kqABWgOdvQibUv+iHS3adjlq7sAmeP7nupv
 kTuTPf9cEZCfjSzEt5Pwjn2/Y5OJPqcXNKdEiYJ65tNm3lE5S//3/QUChsdLMiH3Ss5m
 IZmyOEbX7udSeeSl2jFkIBtVbh7C5D3OmB6KXnNmI+Sn5CM5R2Z+pEQJWLd2KrntjvW9
 8Eji/AAMtgS44m6p87Bwqpo51mPp2t5RWPvCuujfimgke9S/e5Ft+SqEfO/txsZqyZJQ
 LELwfOzqwyJJUYpIRnY4sDK8dODhipQ+tSIo4x5CmkOJnQGfk8VKCCiYCKAFYcBZgG/x
 1MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpwnKZ9Z6FevvyoUxw0sdksaS/2sRQ75c+duIaoaZRc=;
 b=Caz1etdg7koIhzgptCiwc6Ji4AcgHnS9gF8n042Fl80Bk0Z+jyoscjKDvTMSKRQ5W/
 vA9wFpdhtSIV/iNPnUnEQnPoEd69jLrSfxLqVLSdfwf+333AMWcAg+zaaEPAaBSwbYfS
 k7owovEzTxR+p8iyIsLgKx/6C+Dd/ZI73EcjxEs+gny2I/NjuvQhLGmjVTS/khmcPDVt
 5Z1nMPR9I5lggpQD+xVCyu4Qq70qM4iQGw5pa1kNHOtJpwyT3OiGth7vkJqeU0NOoz0+
 RZCwwZgEtt5IQZ6e8ugCsZp5R7a8Q2QzD+zTCauOFS8eDv0eZ7fR3xjirHM1FDmZBKnr
 6OWg==
X-Gm-Message-State: AOAM530bTTX6qpbnBYKAb571ZPrWKzDnTwACgLJ8+ppokEtkSQXm/I8o
 HkiLjs6mGaiyk4j9tbjK9Sogho6PWrAdKDHfTpA=
X-Google-Smtp-Source: ABdhPJyOaUbf6w/OzApnwrzsYrF07Gr4v+amCoL5dWrIxkwQePYhnfiW6OXCJxV+poNC+TJA0dsvW1qrLKIoTHB/K70=
X-Received: by 2002:a02:380d:: with SMTP id b13mr17917547jaa.107.1592162118632; 
 Sun, 14 Jun 2020 12:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200614065251.94106-1-navid.emamdoost@gmail.com>
 <CAHp75VfGHab7Oy5hhW+6rWxkcB5ZHif2hK7inbbdvfF-k0wX0A@mail.gmail.com>
In-Reply-To: <CAHp75VfGHab7Oy5hhW+6rWxkcB5ZHif2hK7inbbdvfF-k0wX0A@mail.gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sun, 14 Jun 2020 14:15:07 -0500
Message-ID: <CAEkB2ESj-SgM9aSHdMp_wx_gUETO-CoD4jkR+nr_CLZRShrp5g@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: fix ref count leak in vc4_dsi_encoder_enable
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Qiushi Wu <wu000273@umn.edu>, David Airlie <airlied@linux.ie>,
 Kangjie Lu <kjlu@umn.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 7:32 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 14, 2020 at 9:55 AM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> >
> > in vc4_dsi_encoder_enable, the call to pm_runtime_get_sync increments
> > the counter even in case of failure, leading to incorrect
> > ref count. In case of failure, decrement the ref count before returning.
>
> ...
>
> > +out:
> > +       pm_runtime_put(dev);
>
> Better to use pm_runtime_put_noidle() for error case.
> And here is a change of semantics, i.e. before your patch there was no
> put at all. How did you test this?
I had no way to test this but looked to me like a miscalculation of
ref count when there is a get and an error happens then the ref count
should be restored. Does that look incorrect?

>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Navid.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
