Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB181B4781
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 16:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94789933;
	Wed, 22 Apr 2020 14:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B599589933
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:40:58 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t11so1195315pgg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QD4gvoO62U8g5ke55m5+fi2BWTvN1Nc+EFebE6YyQOw=;
 b=kBRXr4j4qq3NXWS/pXf/1+3fcHvwMlFDdQUdNXX8Wu7dcmXSWvGvQIGl1GSeXcszn9
 TWs5J+JwWja8Evmpng7eCALs5Y8vur5RbDbdVdchoUgUl+MLfPl+POJlopFg6bfp7YwI
 T/2dJTikefM8Is4MK8e4SbGDLkDqdDMEp+Y0xDXJjL3f5/jV2m5uzvEwGs0g5feG3TPp
 718JbvYPONmKPMcWHAhJtbZ4L5j7qLNnoLdJCu2yrR8SEb7b3wZqIDFRSojAydH0D4b/
 KPeCh+QvkEvXxu5Cj+p5EBZhEZKtuvbQGNYw6SISkzcBo7M86NBCM2/gLAVY+uwQqmDI
 lT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QD4gvoO62U8g5ke55m5+fi2BWTvN1Nc+EFebE6YyQOw=;
 b=CimBAJywVVwhm2T8l53JbHuqw8o1qYw8UysFFSHqV7Az64QqVbsEyuVN8k1bq0NYBF
 OzbcW+pM/mY170q/667vhIw3/2Z3G9P98tDTY22EL4lOUCr8fzCq3PQXeZXMp9MTQK+G
 MGuOHDPLEyY2jwre8Whh6WMtC94gJYQSH9HrKJOdlJ7yCqragY/MYq61oXEpIU2cWWij
 jp0MznOKN17poSiBrxTZeVKVU/W8sk+GomnhcxDKG/MsMHUmk8Fk9FCMENoxpbF2ju81
 sW4dq+Bc1QyQsizKbEb3H1s1h1WQ1pNlsSEI6InxM509k5SXVhFmurRDPacrzbsQ9qpE
 tpPg==
X-Gm-Message-State: AGi0PuY3NUcin0MNXeqEr3XNQHam1wGlc1AtgjFyBj2pOmRwQDJmkdVw
 XC9PLGriE2xLRB+Zjgzu96wkYy7SOo1ccH6tc1U=
X-Google-Smtp-Source: APiQypLalIxaytZo4bcWW/4fbstSP2AlbGVR5eg6nB09MxoKZVT8wAEJIrtspvA3WhXKsbt/27U45IisFwsyi4PqiHE=
X-Received: by 2002:a63:5511:: with SMTP id j17mr25966905pgb.4.1587566458280; 
 Wed, 22 Apr 2020 07:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
 <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
 <20200422135215.GA25950@nuc8i5>
In-Reply-To: <20200422135215.GA25950@nuc8i5>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Apr 2020 17:40:51 +0300
Message-ID: <CAHp75Vf2j-QraBxKofgyhtAxpHXnik3DP9kefPhA_d3BuSjfvw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
To: Dejin Zheng <zhengdejin5@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 4:52 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> On Tue, Apr 21, 2020 at 08:24:24PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 21, 2020 at 7:45 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> > >
> > > It forgot to call bochs_hw_fini() to release related resources when
> > > bochs_pci_probe() fail. eg: io virtual address get by ioremap().
> >
> > Good start, although I think the best is to switch this driver to use
> > pcim_*() functions and drop tons of legacy code.
> >
> Andy, thanks for your encouragement, I think we might be able to fix this
> issue first, after that, drop tons of legacy code by pcim_*() functions.
> Do you think it is ok?

It's really up to maintainer. I'm not the one here.

> > > Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
> > > CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bochs/bochs_drv.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> > > index addb0568c1af..210a60135c8a 100644
> > > --- a/drivers/gpu/drm/bochs/bochs_drv.c
> > > +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> > > @@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
> > >         return ret;
> > >
> > >  err_unload:
> > > +       bochs_hw_fini(dev);
> > >         bochs_unload(dev);
> > >  err_free_dev:
> > >         drm_dev_put(dev);
> > > --
> > > 2.25.0
> > >
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
