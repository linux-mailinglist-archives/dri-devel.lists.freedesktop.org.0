Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D21B6718
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1DE6EA3B;
	Thu, 23 Apr 2020 22:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4A96E804
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:14:20 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id y6so2551975pjc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gr4q+GtQ73VeA1ex9WDdOXnvVsAGwwpT9Br82wEFbbM=;
 b=chSOWq4WT8sLvJ6tgwVOsVV5xwk0uqU1QNxzyAno/WKveBs/2IXVsFUCOT54GDobkv
 uPcs1fPtUIZUVsC6VD8qweivTuwJ/1hAj/RawRP5iJNQVG142svwWGv6aLVblg04PQQg
 DH/k4yOQrq3alOMg9cqUM9x3UI82NDP4tWpYZgG0gL5C79inVyY8+AJMTRRBBUaOwZ+b
 PZWTFjzPSdf8CZBov1dA/M8NALAUc2B7KSUAdsJs6bRzc75liNI157k5AanFHPLP0MJy
 2KGWGXRQtHHGqLi0YA8KehFLMOfixaDWKcEjzB6BIJ2E6hyxgWri3GwAUGkQtV+81miE
 bq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gr4q+GtQ73VeA1ex9WDdOXnvVsAGwwpT9Br82wEFbbM=;
 b=AlxXSNsR1Aj8opDCm5JCaOoo+TuOCdVwdNQkgdVL2nWroVZ7yzREBFnNdB4li5XQIb
 rQ7Vsywm4HjndTTEOV7/bDq8XgsxJAEcjrq8orA6Cs8IxFMPuV/7yvtKyqjjcTteRUhd
 gVCL4gj+o/lupfTe3YQ0e5hznJhdYK+1rHAlFsx19b+kedGaS627DfB8S6FfXyRQnSV3
 n5ZJbqjaG1hIs/K/azfauT+9Dub1mXOqYkeaD8koYgI8uJXpme8Q28ZXyvivFCJ7HGrH
 5yqa8/yUGwGrSvTLcY+vnJrKng6n+YvOgcC/iTxqQ9KifWDI1DseFifrNtZzcWTpOlQJ
 lO6A==
X-Gm-Message-State: AGi0Puax5NF8o/tZd2PKfG/gmCvrsBpMmphlZAvc5vsG7NaMj4BoA3ul
 Ivj4WnkD4kesgNvkOgYeO0k=
X-Google-Smtp-Source: APiQypJ9D5YwGJP6XZ0Hx/3cE3rM1cNh5FmISzcRlldumlGuRKgCjPow9KPEvSp4D9K3K9JS3R/h6Q==
X-Received: by 2002:a17:902:aa97:: with SMTP id
 d23mr3921865plr.244.1587651260522; 
 Thu, 23 Apr 2020 07:14:20 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id s145sm2237772pgs.57.2020.04.23.07.14.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 07:14:20 -0700 (PDT)
Date: Thu, 23 Apr 2020 22:14:16 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
Message-ID: <20200423141416.GA1562@nuc8i5>
References: <20200421164543.16605-1-zhengdejin5@gmail.com>
 <CAHp75Ve4JwkM+=WHHF73jwNwRS39E-xPDrcn77zCUTpVkj8buA@mail.gmail.com>
 <20200422135215.GA25950@nuc8i5>
 <CAHp75Vf2j-QraBxKofgyhtAxpHXnik3DP9kefPhA_d3BuSjfvw@mail.gmail.com>
 <20200422152142.GA26943@nuc8i5>
 <20200423101420.ityynrorrehjvxrs@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423101420.ityynrorrehjvxrs@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
 virtualization@lists.linux-foundation.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 12:14:20PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > I am a newbie, andy gave me some directions to submit the patch, eg: check
> > ioremap leak. At this time, I found that the bochs driver may have similar
> > problems, so I submitted this patch, then, Andy said the best is to switch
> > this driver to use pcim _ * () functions and drop tons of legacy code.
> > I think we might be able to fix this issue first, after that, drop tons
> > of legacy code by pcim_*() functions. Can you give me some suggestions?
> > thank you very much!
> 
> drm has drmm_* functions for that.  Daniel Vetter <daniel@ffwll.ch> has
> a patch series pending switching lots of drivers over and IIRC it fixes
> this bug too.
>
Gerd, Thanks for your info and abandon this commit. 

BR,
Dejin

> cheers,
>   Gerd
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
