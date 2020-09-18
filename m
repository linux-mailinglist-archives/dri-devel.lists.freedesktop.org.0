Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366826FD80
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E436ECEB;
	Fri, 18 Sep 2020 12:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898A76ECEB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:48:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l9so5456767wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=XApl2kYt9xUmRP5psUkQBhn2GDFKQJu7UH6yAt3QUWA=;
 b=A8p2oYFKY7zPaqTEiOXEd9EwjUjubmI5UxUmX2JaKANkCWPGfOgldA/C/f4mzKQQdw
 +SrkqGu42ESAhWYGb7V3XyrqV05qEXdsORrKto6EpEJhnyASo9U18DCOFcRiGzVCEsfc
 QYyq7gAb/SUs5vCrjYzg9O7R7k3hiAmZYAbso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=XApl2kYt9xUmRP5psUkQBhn2GDFKQJu7UH6yAt3QUWA=;
 b=hri2COLvMS2QEmdXk+SkXBsIQ2GO2rewC+oo5ymAD5IQqCSYN8VfVnvs6RzZj7ssiJ
 yI7/lzPW2CWI90on00BC6X3a6ZFw7UhNcs497AsmaFxqEJpvlEE0uXPGk59CvwIQs/Gr
 9xCxoFVwiQ2bOApR7cGNTq1WyuvzZRb8ghOaK7N6xUZriE+W/1i1vtnB3pj5vNjoOm/B
 lYL0Srnh5gtNbcBjNWHJm5mcKNhTo+MLd1yYAlwfINtqb0VwlHGcYQJcy1ubXV1RZzJp
 Vk3vI1RWhfaU4XhOZ1ts7c6G1dbwhTDqrw07eWKTwslCm7jJLr7gHbtNsc5dspqpIA/h
 60+g==
X-Gm-Message-State: AOAM533TsFUB4bY4Sbo91o22RqZDxw/jqJCtc61tn9rlK0z8NcpDMo78
 Ku5diNviuxeMsoUw9I7Wfp4UXg==
X-Google-Smtp-Source: ABdhPJws4fdJlwAFRicyfASJ6sKqsyVx8I56ikTXgryM1sw8YM3g8WD8s8WEkijsL4e0bWaUa5+i4w==
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr15140544wmj.116.1600433331211; 
 Fri, 18 Sep 2020 05:48:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p11sm4881656wma.11.2020.09.18.05.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:48:50 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:48:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dmabuf: fix NULL pointer dereference in dma_buf_release()
Message-ID: <20200918124848.GE438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Charan Teja Reddy <charante@codeaurora.org>,
 sumit.semwal@linaro.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vinmenon@codeaurora.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <1600425151-27670-1-git-send-email-charante@codeaurora.org>
 <7a4a51fb-008b-cd64-35e7-2a2765b2c3a6@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a4a51fb-008b-cd64-35e7-2a2765b2c3a6@amd.com>
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vinmenon@codeaurora.org,
 Charan Teja Reddy <charante@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 01:16:16PM +0200, Christian K=F6nig wrote:
> Am 18.09.20 um 12:32 schrieb Charan Teja Reddy:
> > NULL pointer dereference is observed while exporting the dmabuf but
> > failed to allocate the 'struct file' which results into the dropping of
> > the allocated dentry corresponding to this file in the dmabuf fs, which
> > is ending up in dma_buf_release() and accessing the uninitialzed
> > dentry->d_fsdata.
> > =

> > Call stack on 5.4 is below:
> >   dma_buf_release+0x2c/0x254 drivers/dma-buf/dma-buf.c:88
> >   __dentry_kill+0x294/0x31c fs/dcache.c:584
> >   dentry_kill fs/dcache.c:673 [inline]
> >   dput+0x250/0x380 fs/dcache.c:859
> >   path_put+0x24/0x40 fs/namei.c:485
> >   alloc_file_pseudo+0x1a4/0x200 fs/file_table.c:235
> >   dma_buf_getfile drivers/dma-buf/dma-buf.c:473 [inline]
> >   dma_buf_export+0x25c/0x3ec drivers/dma-buf/dma-buf.c:585
> > =

> > Fix this by checking for the valid pointer in the dentry->d_fsdata.
> > =

> > Fixes: 4ab59c3c638c ("dma-buf: Move dma_buf_release() from fops to dent=
ry_ops")
> > Cc: <stable@vger.kernel.org> [5.7+]
> > Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> Going to pick this up for inclusion into drm-misc-next as well.

drm-misc-fixes since this is a bugfix that needs to be backported.
-Daniel

> =

> > ---
> >   drivers/dma-buf/dma-buf.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > =

> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 58564d82..844967f 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -59,6 +59,8 @@ static void dma_buf_release(struct dentry *dentry)
> >   	struct dma_buf *dmabuf;
> >   	dmabuf =3D dentry->d_fsdata;
> > +	if (unlikely(!dmabuf))
> > +		return;
> >   	BUG_ON(dmabuf->vmapping_counter);
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
