Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DC33752B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 15:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0D6ECFE;
	Thu, 11 Mar 2021 14:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A941789306
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 14:12:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so13285604wmy.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 06:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/hB+uxqpftp+vtj0Am9qezMsV64CNF9AAIr7fvjZKpY=;
 b=JLGbv/T/KJFGkbk1gfyG+4jzJ4xJ2cckz0KmMHodIXRTh+5f/n3Xo00237J6yO4RjY
 AIx/Bd/1Dn7/zuK6uvzutHpJOCtTa5j3ud4ddzT4t+3dBlQuybYpDeYCJoRVUwGWzNY+
 eMXycHsl102/Kok6J4HCeM8G6p5ml4pjFjYfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/hB+uxqpftp+vtj0Am9qezMsV64CNF9AAIr7fvjZKpY=;
 b=HQBnoRqLXsKoRN6v/sFqcpQ96j5viaQz4G9IFrQXrpK2olLwPrIqhb43hrr92Gx3os
 CsRwBOpGTrgcu47oDOOj6VXEDWMzlkmOBlzMNtqra2EIiWjf5ckJ3X/VNXVWxPs6Pldv
 W+cgwDJ2sXlEnrIyWXfc57/tlmIGEsHHDD29f9zOlVsKJTovMghB6NY8kNHd2qigxrdD
 ka4sEHviy/cPn6CD9biG4TndAf2N41VpUoC9dblMfYUIlNbaUnxgPSJxfeK/s3PBfZj7
 BZ3DhU4FOs1HpsVa5yVKli6oXDgGQbHr2eNcHqx6jYdw5nzAIuDUYcMVLGuH3od6po46
 A13Q==
X-Gm-Message-State: AOAM533nkIGIRyk3LIFhu1AG0dmPS1DqhQCV9Ipjwyc34LjB9JBoDIC8
 YX2Ru21LB2AuXac4w5y4JYQ22pkcvnOT+scG
X-Google-Smtp-Source: ABdhPJzuTjv2eGPv0OBlHHOPWuUV8id1BMnVI4ZXdMNHsTKuD8q3fjFa80KL1/pjcUEpJ1XSrL1IHw==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr8320044wmb.128.1615471936309; 
 Thu, 11 Mar 2021 06:12:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m11sm4005820wrz.40.2021.03.11.06.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:12:15 -0800 (PST)
Date: Thu, 11 Mar 2021 15:12:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: Fix confusion of dynamic dma-buf vs dynamic
 attachment
Message-ID: <YEolPdhj7xeNAvBV@phenom.ffwll.local>
References: <20210305105114.26338-1-chris@chris-wilson.co.uk>
 <c05431b8-518e-4d2f-4c62-90ab197bd0c3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c05431b8-518e-4d2f-4c62-90ab197bd0c3@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 11:54:49AM +0100, Christian K=F6nig wrote:
> Am 05.03.21 um 11:51 schrieb Chris Wilson:
> > Commit c545781e1c55 ("dma-buf: doc polish for pin/unpin") disagrees with
> > the introduction of dynamism in commit: bb42df4662a4 ("dma-buf: add
> > dynamic DMA-buf handling v15") resulting in warning spew on
> > importing dma-buf. Silence the warning from the latter by only pinning
> > the attachment if the attachment rather than the dmabuf is to be
> > dynamic.
> =

> NAK, this is intentionally like this. You need to pin the DMA-buf if it is
> dynamic and the attachment isn't.
> =

> Otherwise the DMA-buf would be able to move even when it has an attachment
> which can't handle that.
> =

> We should rather fix the documentation if that is wrong on this point.

The doc is right, it's for the exporter function for importers. For
non-dynamic importers dma-buf.c code itself does ensure the pinning
happens. So non-dynamic importers really have no business calling
pin/unpin, because they always get a mapping that's put into system memory
and pinned there.

Ofc for driver specific stuff with direct interfaces you can do whatever
you feel like, but probably good to match these semantics.

But looking at the patch, I think this is more about the locking, not the
pin/unpin stuff. Locking rules definitely depend upon what the exporter
requires, and again dma-buf.c should do all the impendence mismatch that's
needed.

So I think we're all good with the doc, but please double-check.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Fixes: bb42df4662a4 ("dma-buf: add dynamic DMA-buf handling v15")
> > Fixes: c545781e1c55 ("dma-buf: doc polish for pin/unpin")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Cc: <stable@vger.kernel.org> # v5.7+
> > ---
> >   drivers/dma-buf/dma-buf.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index f264b70c383e..09f5ae458515 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -758,8 +758,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >   	    dma_buf_is_dynamic(dmabuf)) {
> >   		struct sg_table *sgt;
> > -		if (dma_buf_is_dynamic(attach->dmabuf)) {
> > -			dma_resv_lock(attach->dmabuf->resv, NULL);
> > +		if (dma_buf_attachment_is_dynamic(attach)) {
> > +			dma_resv_lock(dmabuf->resv, NULL);
> >   			ret =3D dma_buf_pin(attach);
> >   			if (ret)
> >   				goto err_unlock;
> > @@ -772,8 +772,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >   			ret =3D PTR_ERR(sgt);
> >   			goto err_unpin;
> >   		}
> > -		if (dma_buf_is_dynamic(attach->dmabuf))
> > -			dma_resv_unlock(attach->dmabuf->resv);
> > +		if (dma_buf_attachment_is_dynamic(attach))
> > +			dma_resv_unlock(dmabuf->resv);
> > +
> >   		attach->sgt =3D sgt;
> >   		attach->dir =3D DMA_BIDIRECTIONAL;
> >   	}
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
