Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA841B55D2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD95C6E357;
	Thu, 23 Apr 2020 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9746E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 13:52:21 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f8so966711plt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HEwMCGWH0xcjOsy5stWmc4ah1I0kvVQlv1OL97kZJ8E=;
 b=eODaU84rKvZhPtW1/2/UZuI04TESBOxyPQP2oM7DwYZNntzWY5+fYJdm5Ys6qJqy4x
 yQlNFZODFFEZZFONOFIawiVBwnGC4fcTAkFmiM00ED55/qe3faE4lT9LhAl2IRbszqm5
 tD8wB+DY8CtsDiH+7T3S2Z82lGX+iVB8169GRL/ZiclyDStdkkjz9Os918CAk+ccxzwv
 +05pvB4gpNOTBfR0c9Wr2iNg5y7PHldG1n0bRNEqtzhaYsa2NEMdkqyPieUHe7TRQ2hn
 zTvQxILcNHFCbiGYeWD1kot3rLRVtkr2AW43WHLtEAwdgbqf7GFVN0nbvG757o1/uLA7
 VuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HEwMCGWH0xcjOsy5stWmc4ah1I0kvVQlv1OL97kZJ8E=;
 b=quz0eumaxOa5VTwSok11dwXhJVMRTOw4Bgu4p/uFe1MwmHmlUVyP482sCk/X9qvMA2
 N3rx4BB02pp4YCUKzRQSr5Ddn7Tlux1k90xdxoIGMCqoa1NCMH8xgVEYzGAfxGAMihD2
 bKh48F+6098nws0xoV642M/qAcHhtraSRX7uQZ76it2qQ0J/KxQpR5qs2qRvTWrmYxd+
 PsvDTCuD5SihuOee326i1Wpt6xIXIv+s169qXLHkPFQOZGilyAldZaqk4SvvT8EaAo0f
 B6A19NNjnibex/zGdpqyROW9leh+NCkFm9J2DLeKXo+krt5gO8dRq94Sqv1Rbqcu6j39
 1a0Q==
X-Gm-Message-State: AGi0Puby8VNKWJFhomY+dgnZfb/f7sjkVbzzDSXDf0tZ2Ul7QUmY6J7G
 pTIfButD9dAP0L5SjOLqxHg=
X-Google-Smtp-Source: APiQypK46J2JZt/QDCU3a/7EQZIhcDY2YqHNsCHaS5xB+ir5i4TYKlDP8o0KoPRDGmMgr1lTZwTX5A==
X-Received: by 2002:a17:90a:20ea:: with SMTP id
 f97mr5952983pjg.157.1587563541569; 
 Wed, 22 Apr 2020 06:52:21 -0700 (PDT)
Received: from localhost ([89.208.244.140])
 by smtp.gmail.com with ESMTPSA id w126sm5547847pfb.117.2020.04.22.06.52.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 06:52:21 -0700 (PDT)
Date: Wed, 22 Apr 2020 21:52:15 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
Message-ID: <20200422135215.GA25950@nuc8i5>
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
 <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
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

On Tue, Apr 21, 2020 at 08:24:24PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 21, 2020 at 7:45 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> >
> > It forgot to call bochs_hw_fini() to release related resources when
> > bochs_pci_probe() fail. eg: io virtual address get by ioremap().
> 
> Good start, although I think the best is to switch this driver to use
> pcim_*() functions and drop tons of legacy code.
>
Andy, thanks for your encouragement, I think we might be able to fix this
issue first, after that, drop tons of legacy code by pcim_*() functions.
Do you think it is ok?

BR,
Dejin

> > Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
> > CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> >  drivers/gpu/drm/bochs/bochs_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> > index addb0568c1af..210a60135c8a 100644
> > --- a/drivers/gpu/drm/bochs/bochs_drv.c
> > +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> > @@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
> >         return ret;
> >
> >  err_unload:
> > +       bochs_hw_fini(dev);
> >         bochs_unload(dev);
> >  err_free_dev:
> >         drm_dev_put(dev);
> > --
> > 2.25.0
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
