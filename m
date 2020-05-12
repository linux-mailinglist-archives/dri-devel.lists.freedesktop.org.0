Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58DC1D0B8E
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B446E9CA;
	Wed, 13 May 2020 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDE489D64
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 12:09:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id n14so13217629qke.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0E+w23r0rm59Sttp+Cx0/u2Fxv6Zhza30yRDAxBOwIM=;
 b=XRnT+4+TWQyHNmyGS+cSdisYi0zNeQpz5uND4j+3R32mzcUZGCtrhnUZduANVucjLs
 fPeDcZnf0jJZdFR18+rXBGExeB/xOfjO6j5ubgczrNSIabiDm3PpWhxkNKaizLg4FP0J
 sa50sZfadORNY04EFhJQrsRUYbYc9oVcbKS2sMEoCu11o9nPs7ZSUus3alQ+pAkKbMAV
 aWmgipf3DUd2+yiqRDwFz9qMTz3IWl1iCgmhXs/gmp7BDs1Z+Hp9W9wAYy5ZacibQ3td
 xqUancRvGLhZbF4o+FHI7mZTtBugkHa1LurSn3oFjsiEMnHhi/WOIzp2ySY0+TXNYike
 G58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0E+w23r0rm59Sttp+Cx0/u2Fxv6Zhza30yRDAxBOwIM=;
 b=UAW/x+Irlt8i81sIckdIJrwsrFtPm5RjnIWFgoswkq5rJckvjI8wEh+ShsouO31i4h
 /uTNXFNOiHi//DjwvEN9oM5rsmAzjTY7BDES5BqVEFj7XgYCNlvUSoHbQDFlK3GiE3Y8
 d1iTJG2aRHJu3nW2sjCgBctwEDHP9SYC75TiNAleNN+PbBIvI5ui1v/XafB9BMGXr2Jt
 RJOQVkBggrrGSMJd/Y5ohBs0sNXj99qP4Z/GWqM7rfPYAmAO/gld9UP9zveLEwJrhm0b
 IYmNsRgQsio9qYSyEJMjoQg132cDX8YwyVLaO6e34xSkmneYvcr1Bwhte1H8QiHp1H6r
 74jA==
X-Gm-Message-State: AGi0Pub1Na8ND3SId6fPV/XrWVUpN6tjg+iA3F83B7QPkrI12JOnYYqV
 tpnHIGr8bQOeWPsfZohSTsdnLA==
X-Google-Smtp-Source: APiQypKyJUyUDzstE5W+rLlCHv8FxVxdeZGVjAl1eRUGduGzlJpYQ83iKZf1ZsgDC1FOpB7AS1NLBw==
X-Received: by 2002:a37:484c:: with SMTP id v73mr8524856qka.496.1589285394059; 
 Tue, 12 May 2020 05:09:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id y18sm12534463qty.41.2020.05.12.05.09.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 May 2020 05:09:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jYTjM-0003lT-T7; Tue, 12 May 2020 09:09:52 -0300
Date: Tue, 12 May 2020 09:09:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC 02/17] dma-fence: basic lockdep annotations
Message-ID: <20200512120952.GG26002@ziepe.ca>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
 <20200512085944.222637-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512085944.222637-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 10:59:29AM +0200, Daniel Vetter wrote:
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 6802125349fb..d5c0fd2efc70 100644
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -110,6 +110,52 @@ u64 dma_fence_context_alloc(unsigned num)
>  }
>  EXPORT_SYMBOL(dma_fence_context_alloc);
>  
> +#ifdef CONFIG_LOCKDEP
> +struct lockdep_map	dma_fence_lockdep_map = {
> +	.name = "dma_fence_map"
> +};
> +
> +bool dma_fence_begin_signalling(void)
> +{

Why is this global? I would have expected it to be connected to a
single fence?

It would also be alot nicer if this was some general lockdep feature,
not tied to dmabuf. This exact problem also strikes anyone using
completions, for instance, and the same solution should be
applicable??

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
