Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A932850BA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 19:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DC16E4E3;
	Tue,  6 Oct 2020 17:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62A66E4E3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 17:24:42 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id m7so13413716oie.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKKopYNcjNeFpv6TLCvBYUo3phBxS/bzVk3ny8U3SZ4=;
 b=Ywzegx7iJlmxeVjVZylTidxr8VgvtygwAsLLUcnt9O5nTCCs6I2rKesGxA6F19rGvi
 UravkjBt8BIXUX4j75kb74n5qmm7iOVZZwiuoAEcuxHJbniAoU8uPchZp6IHOGjcoBlX
 1QK4XEVHCT1DG5yR53rfHgCYShrIyLE8nZYAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKKopYNcjNeFpv6TLCvBYUo3phBxS/bzVk3ny8U3SZ4=;
 b=R0Xmpfz8M/VIvT6HbleyF1DXdaPvyYSt3vHsiHvfJQ+Ehe98jlqRCiIBy1N9rBVwUH
 7HVKKS4f4KQJTSlWBeDSmx3DgNSV05z56oMky81utF3saf93nKhykOExIsFoZZUQFbA7
 dEQoBcdO1uFj989tN+upfMujU2WD1oJRSQLI7yoYGcdrDzQhcQy/lBWiJ/4stzcjY/VT
 qVXppW+8lOxrefwyqod/4Tf0S1SWlj7uql6B0Vm9iukcZMcfNdsqALlp/sSyNVYE28At
 CRgEe2T4w2z7eRHmOuUA5JaHSZRs12sZTOwmvRd3dkw184NI4LiOxUwQVMBK1oNDAdZF
 PENA==
X-Gm-Message-State: AOAM533EIEqeA+9fYHYsxj5+FmXFzmoRRTaVOT4Cjq96jPGO0F5pyY8k
 PhHtxpTLf0+HItMlbuwqI6e4+q7NQw0M16JF4llceA==
X-Google-Smtp-Source: ABdhPJwMRUDWMR5gv6uevejjE1dEUzVSRSA7mRuyKG9aJA0erHylD0SSdUS6tuHF6wQyEztNveufIUanB12QJiWFzXA=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3479076oib.14.1602005081922; 
 Tue, 06 Oct 2020 10:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local> <20201006154956.GI5177@ziepe.ca>
 <20201006163420.GB438822@phenom.ffwll.local>
In-Reply-To: <20201006163420.GB438822@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 6 Oct 2020 19:24:30 +0200
Message-ID: <CAKMK7uG1RpDQ9ZO=VxkNuGjGPqkAzMQDgi89eSjDoMerMQ4+9A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
To: Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 6, 2020 at 6:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Oct 06, 2020 at 12:49:56PM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 06, 2020 at 11:22:14AM +0200, Daniel Vetter wrote:
> > >
> > > For reinstanting the pages you need:
> > >
> > > - dma_resv_lock, this prevents anyone else from issuing new moves or
> > >   anything like that
> > > - dma_resv_get_excl + dma_fence_wait to wait for any pending moves to
> > >   finish. gpus generally don't wait on the cpu, but block the dependent
> > >   dma operations from being scheduled until that fence fired. But for rdma
> > >   odp I think you need the cpu wait in your worker here.
> >
> > Reinstating is not really any different that the first insertion, so
> > then all this should be needed in every case?
>
> Yes. Without move_notify we pin the dma-buf into system memory, so it
> can't move, and hence you also don't have to chase it. But with
> move_notify this all becomes possible.

I just realized I got it wrong compared to gpus. I needs to be:
1. dma_resv_lock
2. dma_buf_map_attachment, which might have to move the buffer around
again if you're unlucky
3. wait for the exclusive fence
4. put sgt into your rdma ptes
5 dma_resv_unlock

Maybe also something we should document somewhere for dynamic buffers.
Assuming I got it right this time around ... Christian?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
