Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7A38B172
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C826E0CE;
	Thu, 20 May 2021 14:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21586E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 14:13:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f19-20020a05600c1553b02901794fafcfefso4891535wmg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JikLFJayP2FVBAv1MOBuowMA6XuEHXFNSz/Dei3FdQs=;
 b=bAk+xVbH1mkL+lis3lXp6+mK5wqbpKCqMnAsW6nfLpHYavvm6UW1iQE4GrnicIzh1z
 CN1ELKMNVmiyiuWumVQfqpjC3YtgIS0Sh8XbyjAyMpUnvb/UaOBYzLWxRiN2rwGtaJrq
 G5/JtibN2kQxm762sp9HLmh4kDkNT7gYLKnV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JikLFJayP2FVBAv1MOBuowMA6XuEHXFNSz/Dei3FdQs=;
 b=aWI7DDLfUvbejmPXKHP//NaYMOy1H5x7yLEsCr+an/F47RHikcjsQDpZmXYv9g5j9Q
 JffzuAkaNEJjAXVUCKDsh4NGZWmR7ih1HWOwtVWXACQajxfoABhOZZuYGKwDMafPmuFF
 ZcaKXKOwGbn9vado8a2iSe6L4O12lIuAM1HjriYMruUs/QNe5yvL1GWYSCE9TOTwNquj
 OE6/acd4e8qEjG9oQB1rAl2DnDJolVebKxL1PAKWGlqQ1D7DOYVf07Lni1h3rYhEFVOe
 0OmbkyIcm3xR5iBry9OkVUk1ge3537cHtyFsZWIdpfOeeuwdJ5on6dd91sTnxCUa5YXt
 O7hQ==
X-Gm-Message-State: AOAM531c/mZ9O1y+8LeCTx4Pdbjwd/xzcBO88aJTyyfALQn3Ukil+N3e
 9Qfq4+VTVWi2iRNQ5F1wmi32FA==
X-Google-Smtp-Source: ABdhPJxY4HxOkgjBNcmmRuE95+WBgzbxVsWLgBn6fNJNfMnEzwuCJyDyV9l+0jYQAJzpsQuHoLR5wg==
X-Received: by 2002:a1c:730b:: with SMTP id d11mr4193412wmb.20.1621520020604; 
 Thu, 20 May 2021 07:13:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i5sm3554575wrw.29.2021.05.20.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 07:13:40 -0700 (PDT)
Date: Thu, 20 May 2021 16:13:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: fix unintended pin/unpin warnings
Message-ID: <YKZukmJ3WAnvll5q@phenom.ffwll.local>
References: <20210517115705.2141-1-christian.koenig@amd.com>
 <CADnq5_O7EBT7tdsuq00K-T2j=HEq34hLEpsbME4157wcGZyTBg@mail.gmail.com>
 <YKKERxNX+OmIgwlL@phenom.ffwll.local>
 <a7396a42-995a-80bf-4f51-c203a62096e7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7396a42-995a-80bf-4f51-c203a62096e7@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 01:37:47PM +0200, Christian König wrote:
> Am 17.05.21 um 16:57 schrieb Daniel Vetter:
> > On Mon, May 17, 2021 at 10:09:13AM -0400, Alex Deucher wrote:
> > > On Mon, May 17, 2021 at 7:57 AM Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > DMA-buf internal users call the pin/unpin functions without having a
> > > > dynamic attachment. Avoid the warning and backtrace in the logs.
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > Bugs: https://gitlab.freedesktop.org/drm/intel/-/issues/3481
> > > > Fixes: c545781e1c55 ("dma-buf: doc polish for pin/unpin")
> > > > CC: stable@kernel.org
> > > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > Hm this means we're losing the dma_resv_assert_held check, do we have that
> > in amdgpu callbacks to make sure we're not accidentally breaking stuff
> > later on?
> 
> Mhm, well this is just for calling the pin/unpin internally from the DMA-buf
> framework itself.

It's both, but currently I think no users for it (since it would be
pinning for display).

Maybe we could do __ internal wrappers to keep the lockdep checks?

> Need to double check, but I think all those cases either have a
> dma_resv_assert_held() or are locking the reservation themselves before
> calling the function.

Yeah right now it's still all good, but that changes easily :-)

> But yeah, rather good point.

Do you plan to type something that I can ack?
-Daniel

> 
> Christian.
> 
> > 
> > But yeah lgtm, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > > > ---
> > > >   drivers/dma-buf/dma-buf.c | 10 +++++-----
> > > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index f264b70c383e..eadd1eaa2fb5 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -760,7 +760,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> > > > 
> > > >                  if (dma_buf_is_dynamic(attach->dmabuf)) {
> > > >                          dma_resv_lock(attach->dmabuf->resv, NULL);
> > > > -                       ret = dma_buf_pin(attach);
> > > > +                       ret = dmabuf->ops->pin(attach);
> > > >                          if (ret)
> > > >                                  goto err_unlock;
> > > >                  }
> > > > @@ -786,7 +786,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> > > > 
> > > >   err_unpin:
> > > >          if (dma_buf_is_dynamic(attach->dmabuf))
> > > > -               dma_buf_unpin(attach);
> > > > +               dmabuf->ops->unpin(attach);
> > > > 
> > > >   err_unlock:
> > > >          if (dma_buf_is_dynamic(attach->dmabuf))
> > > > @@ -843,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
> > > >                  __unmap_dma_buf(attach, attach->sgt, attach->dir);
> > > > 
> > > >                  if (dma_buf_is_dynamic(attach->dmabuf)) {
> > > > -                       dma_buf_unpin(attach);
> > > > +                       dmabuf->ops->unpin(attach);
> > > >                          dma_resv_unlock(attach->dmabuf->resv);
> > > >                  }
> > > >          }
> > > > @@ -956,7 +956,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> > > >          if (dma_buf_is_dynamic(attach->dmabuf)) {
> > > >                  dma_resv_assert_held(attach->dmabuf->resv);
> > > >                  if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> > > > -                       r = dma_buf_pin(attach);
> > > > +                       r = attach->dmabuf->ops->pin(attach);
> > > >                          if (r)
> > > >                                  return ERR_PTR(r);
> > > >                  }
> > > > @@ -968,7 +968,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> > > > 
> > > >          if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> > > >               !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> > > > -               dma_buf_unpin(attach);
> > > > +               attach->dmabuf->ops->unpin(attach);
> > > > 
> > > >          if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
> > > >                  attach->sgt = sg_table;
> > > > --
> > > > 2.25.1
> > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
