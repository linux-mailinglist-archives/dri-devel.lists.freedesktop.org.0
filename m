Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16153D3C20
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BA66E09C;
	Fri, 23 Jul 2021 15:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B3D6E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 15:01:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so848231wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=w9v+4s7/P2Cg+QjJMoNBlGX2Ekj8q+TMc1efLZ/J8+4=;
 b=fj7JYwQb2WhybJAUx4rfOc25+s+QNn44GNfoxzaxvvv+Pb3suvS7pBkfDBusZwXXlf
 m2ohNk1UieUIgdG4WzCnhOgYhZQUxbWqMI912foPZDh3S/Xyz1xqNn42hbT6j9xpiyaK
 YtEu8H9SIRKgSAtAIMM9wzpHYJE1pq6x0zKXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=w9v+4s7/P2Cg+QjJMoNBlGX2Ekj8q+TMc1efLZ/J8+4=;
 b=obSqwOMwoKtC9Jo9c0n+vVL5hFCDI+UOhBn3JwUfPFyrFcdER0g2aiHVGNk6T7KORU
 rar896tupemJFMITjzXl+QzqIeXb1THrWG2y0gFHGv7vJTR7T9HDTmm0HgYOGO7rw2tf
 ezLGEsJYWKpPwFcjnWkrITFvD6HmoRNI0HYMifDKgCxSMOQ45vOJgJfrxWB6FL0wAn42
 0gHiJkTwpU8zWDk+P8h8kFX0ns9d9fjvTSrSma2+LArNiP2hJB6NUiLUlYv+PFfPnpOP
 dlmho09S+Ora0RvvKv7gI2uC3NGMCst4/KgOtoBngFH+ERRCvPftRfVx6YfVMh5U2ilp
 L6aA==
X-Gm-Message-State: AOAM530NuhyzgqKlh8/bSBQQII5Che1ho28ahJ6xs13z/ZIhL4AnBZlu
 1Qon0BMOmuPKP8t5UgX6fLSQFbj0Dhu+VQ==
X-Google-Smtp-Source: ABdhPJxAhoY4SO+Rljt8tSjDfVfejZCTQg8CZQ/u7VOQRIgpa+QXhopteYV2nXJ0mUMxsKF9l0l34Q==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr5151839wmj.12.1627052479277; 
 Fri, 23 Jul 2021 08:01:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm5468873wmj.34.2021.07.23.08.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 08:01:18 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:01:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: WARN on dmabuf release with pending attachments
Message-ID: <YPrZvM8BI7VO8xQk@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Charan Teja Reddy <charante@codeaurora.org>,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 vinmenon@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <1627043468-16381-1-git-send-email-charante@codeaurora.org>
 <b057b0fe-75ae-d872-f500-a307543d8233@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b057b0fe-75ae-d872-f500-a307543d8233@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, vinmenon@codeaurora.org,
 Charan Teja Reddy <charante@codeaurora.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 02:34:13PM +0200, Christian König wrote:
> Am 23.07.21 um 14:31 schrieb Charan Teja Reddy:
> > It is expected from the clients to follow the below steps on an imported
> > dmabuf fd:
> > a) dmabuf = dma_buf_get(fd) // Get the dmabuf from fd
> > b) dma_buf_attach(dmabuf); // Clients attach to the dmabuf
> >     o Here the kernel does some slab allocations, say for
> > dma_buf_attachment and may be some other slab allocation in the
> > dmabuf->ops->attach().
> > c) Client may need to do dma_buf_map_attachment().
> > d) Accordingly dma_buf_unmap_attachment() should be called.
> > e) dma_buf_detach () // Clients detach to the dmabuf.
> >     o Here the slab allocations made in b) are freed.
> > f) dma_buf_put(dmabuf) // Can free the dmabuf if it is the last
> > reference.
> > 
> > Now say an erroneous client failed at step c) above thus it directly
> > called dma_buf_put(), step f) above. Considering that it may be the last
> > reference to the dmabuf, buffer will be freed with pending attachments
> > left to the dmabuf which can show up as the 'memory leak'. This should
> > at least be reported as the WARN().
> > 
> > Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
> 
> Good idea. I would expect a crash immediately, but from such a backtrace it
> is quite hard to tell what the problem is.
> 
> Patch is Reviewed-by: Christian König <christian.koenig@amd.com> and I'm
> going to push this to drm-misc-next on Monday if nobody objects.

The boom only happens a lot later when the offending import uses the
attachment again. This here has a good chance to catch that early
drm_buf_put(), so I think it's a good improvement. We'll still Oops later
on ofc, but meh.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks,
> Christian.
> 
> > ---
> >   drivers/dma-buf/dma-buf.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 511fe0d..733c8b1 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -79,6 +79,7 @@ static void dma_buf_release(struct dentry *dentry)
> >   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> >   		dma_resv_fini(dmabuf->resv);
> > +	WARN_ON(!list_empty(&dmabuf->attachments));
> >   	module_put(dmabuf->owner);
> >   	kfree(dmabuf->name);
> >   	kfree(dmabuf);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
