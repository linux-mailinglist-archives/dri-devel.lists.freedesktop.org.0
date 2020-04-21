Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A471B2E3F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 19:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9154B6E2FF;
	Tue, 21 Apr 2020 17:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBCB6E2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 17:24:32 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id nu11so1654213pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 10:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L2/tuyyrk+FrC+TVWKAO9Jkv7cmo4/vzdDOJ54GNqZ0=;
 b=IWpewJSykrsnWxN4K46c7BXyiKGU5U5+mh07wYceXa0O/DjBweXi+37HQV6tvxior8
 HDFIvxDRQZvnytbETu4ORlFbuLNAvRUZK06E6ocYW7wZu3MO0ot/BhZfVywbZG5Q50QL
 uhYIs5AGh2Ws5lc7HIcAFax5orO6IPLEuQ4MUp3tO8d9xZqSM/jnmzB2XmrdyBBMlzBA
 Nc+q2c2kebrbl7Q0mknsP2gTP5mwFdo5px3V0KHY+UtIh9rPfDAMM4hb/JVZj9ZdEujZ
 35nYpMtceYIjgLbKPL5kiaQ0fbIdc4SA15dZZhg0NguR4NdcLqUIeGKiT7WOdc3yeyJx
 14NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L2/tuyyrk+FrC+TVWKAO9Jkv7cmo4/vzdDOJ54GNqZ0=;
 b=Oc05+sSwCzaoy1OZ+tjmKdy2JBhLMiMbm4NqtJIXa1om6KYL8JC0jwDyjrUpUstH8m
 wXWhksJD4+K8m51zDqqe1d8Ug/r0tA7AUHvrnMUCWKQsQJuoJsUt0jN336P8ks1EF/hx
 w11RyXI9fBV1rBNilDYcwGnRvyeWyM7gBq+vAMPnieo+ITpK41/BDfiK+3A2gpg8HBNl
 4ohU9Xi6+IPk10ahNku4of1G0CcpkiHRwM3TvVtYPBEBHcWqCtz7lEf78OqvtnuV0LTN
 8AlgouubFaDakPT/57+njFEnLYv7X7eJONK16T+DhNapdVttzZpxW6Flstq/xnY0FKvz
 vWKg==
X-Gm-Message-State: AGi0Pua1SNuyrZVX2WCwebFFxc1ubz9Nmum40Nbk9KDfuxhVSsEa4p9A
 qJ6yq7xHuJyjEoBEDMvQ2HVSAcUe+j4YiiQomSs=
X-Google-Smtp-Source: APiQypLrw+ulWURfZADaQwTNudM24Gky3/1zWkBus2GpUzJiXP5056wZocjopPa5wu8+IgkOOwrer2mXCfEh+NM3RgA=
X-Received: by 2002:a17:90a:2401:: with SMTP id h1mr7010141pje.1.1587489871604; 
 Tue, 21 Apr 2020 10:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
In-Reply-To: <20200421164543.16605-1-zhengdejin5@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Apr 2020 20:24:24 +0300
Message-ID: <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
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

On Tue, Apr 21, 2020 at 7:45 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> It forgot to call bochs_hw_fini() to release related resources when
> bochs_pci_probe() fail. eg: io virtual address get by ioremap().

Good start, although I think the best is to switch this driver to use
pcim_*() functions and drop tons of legacy code.

> Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
> CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index addb0568c1af..210a60135c8a 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>         return ret;
>
>  err_unload:
> +       bochs_hw_fini(dev);
>         bochs_unload(dev);
>  err_free_dev:
>         drm_dev_put(dev);
> --
> 2.25.0
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
