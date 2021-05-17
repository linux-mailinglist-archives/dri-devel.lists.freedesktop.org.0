Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D4383348
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3866E9B8;
	Mon, 17 May 2021 14:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EB06E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:57:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c14so4943305wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UKxy7dc1rlYj1OT5J4qWzoDIHQlvk+/JqpaAyW2Z3H4=;
 b=FJgI1E+yKgfh1Ykb7uvrE4UjqHdhW45dU7F7ADMsmfF7/VxTKdHUj5HRp1yTo+023P
 DESi5D1zHoi2iEqcG85IJ/LUjXo8w4rkYOm5oQ0vYySP6N1MNPKwdZNlCBRa87Qdoq/j
 c9JT0DrvyrbC35Rnr2/DcwySWK/tHmKrpjl+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UKxy7dc1rlYj1OT5J4qWzoDIHQlvk+/JqpaAyW2Z3H4=;
 b=b/niZLwQ/SMTbITblUeWiNerSSi5qN7xoDutOAxbfM0XM4yvnLqTbOXTDWkr8gTjTu
 yJw58wes6uhH8TZUfOvH1EfvCTk56n4myiFtKoDWvRLiygRtnDDcSSsALDSp1v59Me2/
 gZDxXF1Rrcji7+joCxZoXDe5a+owZCSTYSAhy1CLek/nOnGvN/kNHSdOyIUrAbdZqvep
 QQdfTCL+xuVxZLyLpEt6YQV1FBDkDKJU3zC43I4VQ/B/7qR8fksbk1KDb0FYi7lWw5OD
 OMX3EwYH43KbxDJE9U8dUAYGn7pba0Ng1q0H5GY1lYFmX2+0UPUCA2p3WrQcA4U3zce7
 1n+Q==
X-Gm-Message-State: AOAM530PRWYtU0MmL+YMclFNSW7aU/UgD1Ch72IBel6sgkYOe5uJeSk3
 TFRne+jfqNTJmEuWLIakVVdPJg==
X-Google-Smtp-Source: ABdhPJxT4BqXJhpIsrVi6wfiVBy1NCOmjhyAFRsLW6Dl3GhfyYzCccJ6pdq9B7B4tFj82O7pZ6koAw==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr91289wrt.189.1621263434060;
 Mon, 17 May 2021 07:57:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z12sm15526570wrv.68.2021.05.17.07.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:57:13 -0700 (PDT)
Date: Mon, 17 May 2021 16:57:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] dma-buf: fix unintended pin/unpin warnings
Message-ID: <YKKERxNX+OmIgwlL@phenom.ffwll.local>
References: <20210517115705.2141-1-christian.koenig@amd.com>
 <CADnq5_O7EBT7tdsuq00K-T2j=HEq34hLEpsbME4157wcGZyTBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_O7EBT7tdsuq00K-T2j=HEq34hLEpsbME4157wcGZyTBg@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:09:13AM -0400, Alex Deucher wrote:
> On Mon, May 17, 2021 at 7:57 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > DMA-buf internal users call the pin/unpin functions without having a
> > dynamic attachment. Avoid the warning and backtrace in the logs.
> >
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Bugs: https://gitlab.freedesktop.org/drm/intel/-/issues/3481
> > Fixes: c545781e1c55 ("dma-buf: doc polish for pin/unpin")
> > CC: stable@kernel.org
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Hm this means we're losing the dma_resv_assert_held check, do we have that
in amdgpu callbacks to make sure we're not accidentally breaking stuff
later on?

But yeah lgtm, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> > ---
> >  drivers/dma-buf/dma-buf.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index f264b70c383e..eadd1eaa2fb5 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -760,7 +760,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> >
> >                 if (dma_buf_is_dynamic(attach->dmabuf)) {
> >                         dma_resv_lock(attach->dmabuf->resv, NULL);
> > -                       ret = dma_buf_pin(attach);
> > +                       ret = dmabuf->ops->pin(attach);
> >                         if (ret)
> >                                 goto err_unlock;
> >                 }
> > @@ -786,7 +786,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> >
> >  err_unpin:
> >         if (dma_buf_is_dynamic(attach->dmabuf))
> > -               dma_buf_unpin(attach);
> > +               dmabuf->ops->unpin(attach);
> >
> >  err_unlock:
> >         if (dma_buf_is_dynamic(attach->dmabuf))
> > @@ -843,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
> >                 __unmap_dma_buf(attach, attach->sgt, attach->dir);
> >
> >                 if (dma_buf_is_dynamic(attach->dmabuf)) {
> > -                       dma_buf_unpin(attach);
> > +                       dmabuf->ops->unpin(attach);
> >                         dma_resv_unlock(attach->dmabuf->resv);
> >                 }
> >         }
> > @@ -956,7 +956,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> >         if (dma_buf_is_dynamic(attach->dmabuf)) {
> >                 dma_resv_assert_held(attach->dmabuf->resv);
> >                 if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> > -                       r = dma_buf_pin(attach);
> > +                       r = attach->dmabuf->ops->pin(attach);
> >                         if (r)
> >                                 return ERR_PTR(r);
> >                 }
> > @@ -968,7 +968,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> >
> >         if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> >              !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> > -               dma_buf_unpin(attach);
> > +               attach->dmabuf->ops->unpin(attach);
> >
> >         if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
> >                 attach->sgt = sg_table;
> > --
> > 2.25.1
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
