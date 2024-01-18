Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D1B831B00
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 15:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D58B10E80E;
	Thu, 18 Jan 2024 14:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7DB10E80E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 14:00:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-55760f84177so2636540a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 06:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705586345; x=1706191145; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qjibwC0Pm0aKsecVEm1CI9Jop+u2Qm2VSXFGfFyZIo8=;
 b=aEggvj3LuAqBn3zXBF3OCuSVODcyXAOBSEuUspGCkWjjdiNwIFnrCRPtMXePOjC0Em
 dZIJX1qTpz6fdzjYb8eWaKj5wshkNt/KXh7HRqZmwgFhUWE5/N8/1WV9dz/NeDl3VfdE
 lZKJT4qjXVykJpJkuGrkn5BFaS+jQ/l0+5n+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705586345; x=1706191145;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qjibwC0Pm0aKsecVEm1CI9Jop+u2Qm2VSXFGfFyZIo8=;
 b=t1i2cSBcv3K64ZFGoLs69eT9Ol2Y8jhs2ZKyYaEiw8X370jEypP0sO8JT7ZwVnY3DF
 oyc+2WbqRNvjSTHf/BquuSyEb2jCjs0uUzoYy1X8zkIcVlF5T7gsO21v/ItpL3ldUJyU
 ll+Guv+3koF5LCOsOuIKnJ0fd/f6eKWXNzmhsKpcUE2ct/mfD0BbMzxETTOLyG23VeCz
 /ZFTotZdHQMyrkx6LczQG1+dpXdBJn5ty3uHlm3HAjVHZgam1U8A3DvDVonUbwz7GOTa
 8VeSKgpzFSEl4EeVs6MPd3/8LOIpJodEZ/dmcJIE4QvgJGWft5BYzG4/7/AK1MhItapA
 gYsQ==
X-Gm-Message-State: AOJu0YxBmnu+k1Qm4ABCerhYdR+zNp6+pGQMqd9ety4+wVZr1ZpVWCZ2
 Vg1WT0QaPK2fSgDZp67hjXC/Xua94snXxkCHPVvR2jexEsEMAMBc/6hR17Qu7dw=
X-Google-Smtp-Source: AGHT+IFY8Kxs594jsuK2rUy7WAVPHDnGECZOoMzsVJ25pNzJ9447ocIjSe/xC5v5/5dl598y8kCJ6A==
X-Received: by 2002:a17:906:c352:b0:a28:ab63:db33 with SMTP id
 ci18-20020a170906c35200b00a28ab63db33mr1195735ejb.7.1705586345068; 
 Thu, 18 Jan 2024 05:59:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170906608300b00a2c8dfa5c25sm8554918ejj.123.2024.01.18.05.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 05:59:04 -0800 (PST)
Date: Thu, 18 Jan 2024 14:59:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <Zakupp1GCZMk5aDT@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
References: <20240108120056.22165-4-paul@crapouillou.net>
 <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
 <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
 <ZZwU827NMHbx7bsO@phenom.ffwll.local>
 <2c0d4ef1b657c56ea2290fe16d757ce563a3e71b.camel@crapouillou.net>
 <ZZxKvR9gjH8D5qxj@phenom.ffwll.local>
 <31e56028b4d865c60b7c01b2a305b3dd8a21ff7a.camel@crapouillou.net>
 <ZZ1Dx1Jqbi61_Afb@phenom.ffwll.local>
 <c100b5f75b12de4a331dd36de3573483dbde915f.camel@crapouillou.net>
 <ZakuD-ns-5UJmrRi@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZakuD-ns-5UJmrRi@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 02:56:31PM +0100, Daniel Vetter wrote:
> On Mon, Jan 15, 2024 at 01:54:27PM +0100, Paul Cercueil wrote:
> > Hi Daniel / Sima,
> > 
> > Le mardi 09 janvier 2024 à 14:01 +0100, Daniel Vetter a écrit :
> > > On Tue, Jan 09, 2024 at 12:06:58PM +0100, Paul Cercueil wrote:
> > > > Hi Daniel / Sima,
> > > > 
> > > > Le lundi 08 janvier 2024 à 20:19 +0100, Daniel Vetter a écrit :
> > > > > On Mon, Jan 08, 2024 at 05:27:33PM +0100, Paul Cercueil wrote:
> > > > > > Le lundi 08 janvier 2024 à 16:29 +0100, Daniel Vetter a écrit :
> > > > > > > On Mon, Jan 08, 2024 at 03:21:21PM +0100, Paul Cercueil
> > > > > > > wrote:
> > > > > > > > Hi Daniel (Sima?),
> > > > > > > > 
> > > > > > > > Le lundi 08 janvier 2024 à 13:39 +0100, Daniel Vetter a
> > > > > > > > écrit :
> > > > > > > > > On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul Cercueil
> > > > > > > > > wrote:
> > > > > > > > > > +static void ffs_dmabuf_signal_done(struct
> > > > > > > > > > ffs_dma_fence
> > > > > > > > > > *dma_fence, int ret)
> > > > > > > > > > +{
> > > > > > > > > > +	struct ffs_dmabuf_priv *priv = dma_fence-
> > > > > > > > > > >priv;
> > > > > > > > > > +	struct dma_fence *fence = &dma_fence->base;
> > > > > > > > > > +
> > > > > > > > > > +	dma_fence_get(fence);
> > > > > > > > > > +	fence->error = ret;
> > > > > > > > > > +	dma_fence_signal(fence);
> > > > > > > > > > +
> > > > > > > > > > +	dma_buf_unmap_attachment(priv->attach,
> > > > > > > > > > dma_fence-
> > > > > > > > > > > sgt,
> > > > > > > > > > dma_fence->dir);
> > > > > > > > > > +	dma_fence_put(fence);
> > > > > > > > > > +	ffs_dmabuf_put(priv->attach);
> > > > > > > > > 
> > > > > > > > > So this can in theory take the dma_resv lock, and if the
> > > > > > > > > usb
> > > > > > > > > completion
> > > > > > > > > isn't an unlimited worker this could hold up completion
> > > > > > > > > of
> > > > > > > > > future
> > > > > > > > > dma_fence, resulting in a deadlock.
> > > > > > > > > 
> > > > > > > > > Needs to be checked how usb works, and if stalling
> > > > > > > > > indefinitely
> > > > > > > > > in
> > > > > > > > > the
> > > > > > > > > io_complete callback can hold up the usb stack you need
> > > > > > > > > to:
> > > > > > > > > 
> > > > > > > > > - drop a dma_fence_begin/end_signalling annotations in
> > > > > > > > > here
> > > > > > > > > - pull out the unref stuff into a separate preallocated
> > > > > > > > > worker
> > > > > > > > > (or at
> > > > > > > > >   least the final unrefs for ffs_dma_buf).
> > > > > > > > 
> > > > > > > > Only ffs_dmabuf_put() can attempt to take the dma_resv and
> > > > > > > > would
> > > > > > > > have
> > > > > > > > to be in a worker, right? Everything else would be inside
> > > > > > > > the
> > > > > > > > dma_fence_begin/end_signalling() annotations?
> > > > > > > 
> > > > > > > Yup. Also I noticed that unlike the iio patches you don't
> > > > > > > have
> > > > > > > the
> > > > > > > dma_buf_unmap here in the completion path (or I'm blind?),
> > > > > > > which
> > > > > > > helps a
> > > > > > > lot with avoiding trouble.
> > > > > > 
> > > > > > They both call dma_buf_unmap_attachment() in the "signal done"
> > > > > > callback, the only difference I see is that it is called after
> > > > > > the
> > > > > > dma_fence_put() in the iio patches, while it's called before
> > > > > > dma_fence_put() here.
> > > > > 
> > > > > I was indeed blind ...
> > > > > 
> > > > > So the trouble is this wont work because:
> > > > > - dma_buf_unmap_attachment() requires dma_resv_lock. This is a
> > > > > somewhat
> > > > >   recent-ish change from 47e982d5195d ("dma-buf: Move
> > > > >   dma_buf_map_attachment() to dynamic locking specification"), so
> > > > > maybe
> > > > >   old kernel or you don't have full lockdep enabled to get the
> > > > > right
> > > > >   splat.
> > > > > 
> > > > > - dma_fence critical section forbids dma_resv_lock
> > > > > 
> > > > > Which means you need to move this out, but then there's the
> > > > > potential
> > > > > cache management issue. Which current gpu drivers just kinda
> > > > > ignore
> > > > > because it doesn't matter for current use-case, they all cache
> > > > > the
> > > > > mapping
> > > > > for about as long as the attachment exists. You might want to do
> > > > > the
> > > > > same,
> > > > > unless that somehow breaks a use-case you have, I have no idea
> > > > > about
> > > > > that.
> > > > > If something breaks with unmap_attachment moved out of the fence
> > > > > handling
> > > > > then I guess it's high time to add separate cache-management only
> > > > > to
> > > > > dma_buf (and that's probably going to be quite some wiring up,
> > > > > not
> > > > > sure
> > > > > even how easy that would be to do nor what exactly the interface
> > > > > should
> > > > > look like).
> > > > 
> > > > Ok. Then I'll just cache the mapping for now, I think.
> > > 
> > > Yeah I think that's simplest. I did ponder a bit and I don't think
> > > it'd be
> > > too much pain to add the cache-management functions for device
> > > attachments/mappings. But it would be quite some typing ...
> > > -Sima
> > 
> > It looks like I actually do have some hardware which requires the cache
> > management. If I cache the mappings in both my IIO and USB code, it
> > works fine on my ZedBoard, but it doesn't work on my ZCU102.
> > 
> > (Or maybe it's something else? What I get from USB in that case is a
> > stream of zeros, I'd expect it to be more like a stream of
> > garbage/stale data).
> > 
> > So, change of plans; I will now unmap the attachment in the cleanup
> > worker after the fence is signalled, and add a warning comment before
> > the end of the fence critical section about the need to do cache
> > management before the signal.
> > 
> > Does that work for you?
> 
> The trouble is, I'm not sure this works for you. If you rely on the
> fences, and you have to do cache management in between dma operations,
> then doing the unmap somewhen later will only mostly paper over the issue,
> but not consistently.
> 
> I think that's really bad because the bugs this will cause are very hard
> to track down and with the current infrastructure impossible to fix.
> 
> Imo cache the mappings, and then fix the cache management bug properly.
> 
> If you want an interim solution that isn't blocked on the dma-buf cache
> management api addition, the only thing that works is doing the operations
> synchronously in the ioctl call. Then you don't need fences, and you can
> guarantee that the unmap has finished before userspace proceeds.
> 
> With the dma_fences you can't guarantee that, it's just pure luck.

Maybe a follow up: Double check you really need the cache management
between the dma operations from 2 different devices, and not for the cpu
access that you then probably do to check the result.

Because if the issue is just cpu access, then protecting the cpu access
needs to use the begin/end_cpu_access dma-functions (or the corresponding
ioctl if you use mmap from userspace) anyway, and that should sort out any
issues you have for cpu access.

Just to make sure we're not needlessly trying to fix something that isn't
actually the problem.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
