Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FA7B6413
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 10:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA3A10E067;
	Tue,  3 Oct 2023 08:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3A210E067
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 08:30:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-503f39d3236so749187e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696321813; x=1696926613; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tCVLlGuDttXDAeKBU2+UulxgkQbSJpXxQEIW9ibhWmE=;
 b=WmOC1Oe/7MbBkhxnzeyYXqykOraGpTkABJCeZoFiis/NyjF5cpfRr4HzT+dDM8aES9
 SSBhIDkknl37a66NJ62x80WKvN/9ZA2AXJuS/zFlA6Rjp35/OXObrccb9NyjOf/8UJ3P
 XhyVvLRFOzHgKtmDH6rOTRDEa0FzOm7lu4kt9HWspDqta/UZDwQma7wtgNM29lmy1z4c
 ojUayrFwSbQO0H9hm8jMXQigOb9VZUnSk+7V7jeXzxbc4uwhyBN5IbMb2LUv3/T05Ua/
 v8ObSuAxLC3oHADKjHBeoYk11C9aF25Mc927WY+dFLa0thASzXC4wJ0UIabgzhcALhqm
 nOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696321813; x=1696926613;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCVLlGuDttXDAeKBU2+UulxgkQbSJpXxQEIW9ibhWmE=;
 b=kvjJvGIswCmur/3tKDM3Z3a52tWZCeQzE1RAchnLdI5DkaUbgirRLL4EhRnUOpZWCT
 1brJEF76eSABfbql9vaVKuU2N9p3DL853INBzkKWQMuG/Qf+YQQWHJzDPQDLiqpLUQSD
 xXkeXuqWxQsFtR8WF5PARnlYhfKRC6g0f21YuGF9a0xo69bCzrOsB97WFVVSEzziTY+t
 5Z2OLcrRO7AXfg/Hb4vYeruAreL6iHUzU6vw8tp9+FB2tnyjNIxEQwfdigecxUEcUIg1
 XHIhPlbqQ9FnWn+hF83YcUwfS/1P+02H10rN0B8EsongefKZIM3NW0/O51vp/YL780FF
 p8+Q==
X-Gm-Message-State: AOJu0YxH0lOmmMpfr6j8bTcXg+/1FejK9zriWXBw2DVriQRDphC4sz6c
 2rPBKug2a67RwbL8V8fFuqoWmw==
X-Google-Smtp-Source: AGHT+IF5jqCZuut1egRUR+esMIoO1bSWn9DsA6o33yNuDo0JmBUPqEnTCoPt8mrVyD2S7D9i02Vjdg==
X-Received: by 2002:a05:6512:360a:b0:502:d35b:5058 with SMTP id
 f10-20020a056512360a00b00502d35b5058mr10185024lfs.4.1696321812713; 
 Tue, 03 Oct 2023 01:30:12 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q20-20020a1cf314000000b00401b242e2e6sm8801252wmq.47.2023.10.03.01.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 01:30:11 -0700 (PDT)
Date: Tue, 3 Oct 2023 11:30:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
Message-ID: <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
 <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 02, 2023 at 10:16:24AM -0700, T.J. Mercier wrote:
> On Mon, Oct 2, 2023 at 12:04 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The buffer->pages[] has "buffer->pagecount" elements so this > comparison
> > has to be changed to >= to avoid reading beyond the end of the array.
> > The buffer->pages[] array is allocated in cma_heap_allocate().
> >
> > Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index ee899f8e6721..bea7e574f916 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
> >         struct vm_area_struct *vma = vmf->vma;
> >         struct cma_heap_buffer *buffer = vma->vm_private_data;
> >
> > -       if (vmf->pgoff > buffer->pagecount)
> > +       if (vmf->pgoff >= buffer->pagecount)
> >                 return VM_FAULT_SIGBUS;
> >
> Hi Dan,
> 
> Your fix looks correct to me, but I'm curious if you observed this
> problem on a device? The mmap in dma-buf.c looks like it prevents
> creating a mapping that is too large, and I think an access beyond the
> VMA should segfault before reaching here.

This is from static analysis and not from testing.  You could be correct
that this bug can't affect real life.

regards,
dan carpenter

