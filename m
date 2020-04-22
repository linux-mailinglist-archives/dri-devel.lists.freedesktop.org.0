Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06F1B55DA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EE96E348;
	Thu, 23 Apr 2020 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1016EA19
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 15:21:48 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r4so1247765pgg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HG3yYEiNc0envK1euxexUufAAl4nbvpE6zokSUWiokM=;
 b=nZzzMniSbj02OzHpHPqt7kEflsYgvSeEH9cTwn32djvqykD4v7ut2HI16jk3LX5r1m
 iGJjGN6nX4/mbNsBmDdw0/GVUxyLLmkkigSgSw1+asfeW49OyLUMk/Dt2QmHRTAgKHTS
 B1kmamcknz9dE0f2mrkp6MSfyryWNo0kaB9qEPmQzlI9ASonUsbSIQSf1XI+oK/44n8+
 FxFctYO1yg0MQxAHmqMb+igSj2MkWzVBP2KAG2cplRraTSkWMjMmFTPEuI59rtJ4YIn1
 NTPLjH6j4PDkayI4MHAtVfOe0VCbXyJou0UJcCJXkRbUUmTbwVZ9Lqwbh95+amDK5ISD
 SoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HG3yYEiNc0envK1euxexUufAAl4nbvpE6zokSUWiokM=;
 b=ETtGfLcAbGEkA20fp4XGM23OmRszvnFc+/lxkhV1vXpkKU7A0hUtC4+60jwyDUhRvS
 yBczY9/37RtMUZwl0Z0cMxwgvhI6lrak2Ub2Ogv/Xm9GnrAWhlQsheTZYx7pSNPwu8U6
 pCsZStoxsCrr/hNd4jrEYOUrXS6BAXxB/gtVLiQCvAdv48dmHuRp/WIo3Vyqf0W0Q20Z
 hfEaQ1K7H6/ShzzucWBx1IU9AjBTGo2LFB8UpJ+w+4jINpDrGokAj5saU7dszCqF5Uu+
 2YzYjCJFhvYppUVykCqe7gPiXesADmkJiqPD9iEO0ACorBwT2oJ67IiFpBx46f+8tbvV
 edJg==
X-Gm-Message-State: AGi0PuZhFsIxLtlXkCFSQL/lvVwH2bv2fcxDjtJ3sHIvF/+9MHSZ+y6Y
 dxm6jhIM1QAbBgptNxcrVyo=
X-Google-Smtp-Source: APiQypLh7oHfDORxCtqZwJwOyMBu9z4t1h/pwGHqNs7EvgsRntlz9Au3nusIGydC3+aAKxF7K73PSA==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr25840974pgh.53.1587568907934; 
 Wed, 22 Apr 2020 08:21:47 -0700 (PDT)
Received: from localhost ([89.208.244.140])
 by smtp.gmail.com with ESMTPSA id 79sm5468092pgd.62.2020.04.22.08.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 08:21:47 -0700 (PDT)
Date: Wed, 22 Apr 2020 23:21:42 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
Message-ID: <20200422152142.GA26943@nuc8i5>
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
 <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
 <20200422135215.GA25950@nuc8i5>
 <CAHp75Vf2j-QraBxKofgyhtAxpHXnik3DP9kefPhA_d3BuSjfvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vf2j-QraBxKofgyhtAxpHXnik3DP9kefPhA_d3BuSjfvw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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

On Wed, Apr 22, 2020 at 05:40:51PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 22, 2020 at 4:52 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> >
> > On Tue, Apr 21, 2020 at 08:24:24PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 21, 2020 at 7:45 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> > > >
> > > > It forgot to call bochs_hw_fini() to release related resources when
> > > > bochs_pci_probe() fail. eg: io virtual address get by ioremap().
> > >
> > > Good start, although I think the best is to switch this driver to use
> > > pcim_*() functions and drop tons of legacy code.
> > >
> > Andy, thanks for your encouragement, I think we might be able to fix this
> > issue first, after that, drop tons of legacy code by pcim_*() functions.
> > Do you think it is ok?
> 
> It's really up to maintainer. I'm not the one here.
>
Thanks Andy.

Hi Gerd:

I am a newbie, andy gave me some directions to submit the patch, eg: check
ioremap leak. At this time, I found that the bochs driver may have similar
problems, so I submitted this patch, then, Andy said the best is to switch
this driver to use pcim _ * () functions and drop tons of legacy code.
I think we might be able to fix this issue first, after that, drop tons
of legacy code by pcim_*() functions. Can you give me some suggestions?
thank you very much!

BR,
Dejin

> > > > Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
> > > > CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/bochs/bochs_drv.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> > > > index addb0568c1af..210a60135c8a 100644
> > > > --- a/drivers/gpu/drm/bochs/bochs_drv.c
> > > > +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> > > > @@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
> > > >         return ret;
> > > >
> > > >  err_unload:
> > > > +       bochs_hw_fini(dev);
> > > >         bochs_unload(dev);
> > > >  err_free_dev:
> > > >         drm_dev_put(dev);
> > > > --
> > > > 2.25.0
> > > >
> > >
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
