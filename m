Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053464A5836
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFB910EB87;
	Tue,  1 Feb 2022 08:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DAB10EB89
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 08:05:26 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bx31so11219560ljb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0PJJMIRjpabG82Db2BkgEWkwXsmVMEfTVi2vjGRhtw=;
 b=izEqZAN6elcstfVcTg/tMHTABwgB/UMX/WOkNRN//agL7z/6AQ8IQpDwjRbjFiOFyW
 NSBjTU+DIpdkHEZSRFsK6dVcNOQXPRBlm+IInH2I4wUMQzKZVRtRzB0KgyZg3h/sWkIF
 P+52Df+wsBiYo+fABOASc+LW2G3zz9xmANft5nYdfMcrNmXe9eCuLBu7ufKU7t845c0w
 qDT1+SS6cYJ+t5Acbj+TXosOfeB5NFVfglRyE7tANu/CnIgwimMAw8vHGbNFYvo9eoDv
 /ap5CD/+2MDDcxr82vy5XgYwsoCyOoR3ymgxdDClfxnWzEMk4tdJbPN0uZwLLmOONJyV
 v1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0PJJMIRjpabG82Db2BkgEWkwXsmVMEfTVi2vjGRhtw=;
 b=yUtIvuxQ0KiRj8ENuQTC064p/wsoEcl/UZAuCnyy0khMs8km3LqCtV5AySM2SgKIsj
 edFnTh46fEFOA54/2jgbgezlWkCMh3NCtNlfUfcT1mgBRiIWaAjjBumQdLsRHYsETN+S
 fu4JFJy5PY92o9mVc7UmqevuO+53kl5GPJ4FNx2h6jXc+iRleP95ruJYF4J0fV37idZt
 cssM2X5eOuGJJcYl/i95nMBzFAo4CP90qXsYqf96y28nDC8//n5w6jeyqpv6qGEBRBSf
 9LJ56WAYCNZU1W3c9BNzfngzc1sSOzuSYfeFe8vIgrF2pZUPZoxM2vBMKlMsWq/dTaB6
 3T0A==
X-Gm-Message-State: AOAM531A1P4u92hBSJb2dCfVNgvesasPG+h19Hfp8bURBwjUSX7HRYyo
 Xg069lQntNI6KKsGT5I7VnsRsY05JMwpBhRtH8rcBw==
X-Google-Smtp-Source: ABdhPJxZwJ8f1U9XZiyGVaA6XDvnmQLDIfQhyp8AtRxgE5A16/QfHpbjmzbDOUwB09+DzDui2DpTkgQ/ryAXMams73Q=
X-Received: by 2002:a2e:a405:: with SMTP id p5mr15566025ljn.121.1643702724483; 
 Tue, 01 Feb 2022 00:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20220129150604.3461652-1-jordy@pwning.systems>
 <CALAqxLU58UYLRNrf4C7t4_SmSa1aUVaDj4SP=zCPfb9m6HBUNw@mail.gmail.com>
In-Reply-To: <CALAqxLU58UYLRNrf4C7t4_SmSa1aUVaDj4SP=zCPfb9m6HBUNw@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 1 Feb 2022 13:35:12 +0530
Message-ID: <CAO_48GGw3bfLdLArCMHNUsiGK_brHZ3D2dQd19wJj2_FoggCUA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix potential spectre v1 gadget
To: John Stultz <john.stultz@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Jordy Zomer <jordy@pwning.systems>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jordy,

On Tue, 1 Feb 2022 at 02:09, John Stultz <john.stultz@linaro.org> wrote:
>
> On Sat, Jan 29, 2022 at 7:06 AM Jordy Zomer <jordy@pwning.systems> wrote:
> >
> > It appears like nr could be a Spectre v1 gadget as it's supplied by a
> > user and used as an array index. Prevent the contents
> > of kernel memory from being leaked to userspace via speculative
> > execution by using array_index_nospec.
> >
> > Signed-off-by: Jordy Zomer <jordy@pwning.systems>
Thanks very much for your patch; I've pushed it to drm-misc-fixes, so
we should see it in mainline soon.

> > ---
> >  drivers/dma-buf/dma-heap.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 56bf5ad01ad5..8f5848aa144f 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/xarray.h>
> >  #include <linux/list.h>
> >  #include <linux/slab.h>
> > +#include <linux/nospec.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/syscalls.h>
> >  #include <linux/dma-heap.h>
> > @@ -135,6 +136,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
> >         if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
> >                 return -EINVAL;
> >
> > +       nr = array_index_nospec(nr, ARRAY_SIZE(dma_heap_ioctl_cmds));
> >         /* Get the kernel ioctl cmd that matches */
> >         kcmd = dma_heap_ioctl_cmds[nr];
>
> Thanks for submitting this! It looks sane to me.
>
> Acked-by: John Stultz <john.stultz@linaro.org>
>
> thanks
> -john


Best,
Sumit.
