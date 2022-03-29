Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E04EAF16
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F0110E922;
	Tue, 29 Mar 2022 14:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0F910E922
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 14:10:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u3so25055680wrg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Jpn95VpEwqe9LKeHWyblbqM6jwwK7W2+waTN1xRVPXQ=;
 b=FCbILTsIeftcx9Jt0BEtLLHXxEr/T0XF35/erIBoKOW226wDqlmzTJQPPejMew+mhd
 UlyRNka/Ra4EuqJADzu2GHuKEYKymT8PcEY403+mP8iE6I6bZNLs3UEDiydXVbaWBGD7
 mz/tEVk+bpiGqc9fg1niAF7oUn+LfldzxaVuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Jpn95VpEwqe9LKeHWyblbqM6jwwK7W2+waTN1xRVPXQ=;
 b=Ybf5vpHtHOA1+aDjElXzcowhAZspgQNU3qgTryf8cAt357H3/U72GVWPKJ+MA3yLWe
 C3fplRtaZR/AKczi25kKRQSY0+2Jsvn3rdxgXM93LRm22ic0b/7P5fp/af++Dy521N7M
 03Aa9JGDKV1ntFzjkMeWXybRtNsRUJN3XB9oy1AtEvE7U/ZD2uSqTuYbx9ALxDyue5th
 7fWTLe46JEY99CTawy3Yw1sTGOI6NWOuaew2higWVw9GOjCV47AWcVV7csEO7PWlWgfT
 MaczzNJE6r+NHZDW9L770oItR09I+n7LunHpLdGIef5+Q12DQh5KeHbk/JjX3q8DRC2B
 vbZQ==
X-Gm-Message-State: AOAM531E0VYAIQEw0pMtGmaeDZXSvhNnYvxvGbFF/1pdHGhA8eHvwcrN
 YFxvyAY7Mb2aaCRHt4KZN3EaKg==
X-Google-Smtp-Source: ABdhPJwiAiFHH9tvrLS6DxzHY+xXbg+mD5m1uI9ysyIBJJOZ4xC59b3stmOq2en/769fX0REs3phaQ==
X-Received: by 2002:adf:e88c:0:b0:204:b1d:317a with SMTP id
 d12-20020adfe88c000000b002040b1d317amr31487688wrm.634.1648563046644; 
 Tue, 29 Mar 2022 07:10:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056000186e00b0020405198faasm17330362wri.52.2022.03.29.07.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 07:10:46 -0700 (PDT)
Date: Tue, 29 Mar 2022 16:10:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 00/12] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <YkMTZLea4+X39Fp8@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Jonathan Cameron <jic23@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220213184616.669b490b@jic23-huawei>
 <N8XC7R.5FP2M8552CGT3@crapouillou.net>
 <YkLEXJzs8ukrxG8s@phenom.ffwll.local>
 <QI1I9R.GDPWLM86I45S@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <QI1I9R.GDPWLM86I45S@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 10:11:14AM +0100, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le mar., mars 29 2022 at 10:33:32 +0200, Daniel Vetter <daniel@ffwll.ch> a
> écrit :
> > On Tue, Feb 15, 2022 at 05:43:35PM +0000, Paul Cercueil wrote:
> > >  Hi Jonathan,
> > > 
> > >  Le dim., févr. 13 2022 at 18:46:16 +0000, Jonathan Cameron
> > >  <jic23@kernel.org> a écrit :
> > >  > On Mon,  7 Feb 2022 12:59:21 +0000
> > >  > Paul Cercueil <paul@crapouillou.net> wrote:
> > >  >
> > >  > >  Hi Jonathan,
> > >  > >
> > >  > >  This is the V2 of my patchset that introduces a new userspace
> > >  > > interface
> > >  > >  based on DMABUF objects to complement the fileio API, and adds
> > >  > > write()
> > >  > >  support to the existing fileio API.
> > >  >
> > >  > Hi Paul,
> > >  >
> > >  > It's been a little while. Perhaps you could summarize the various
> > > view
> > >  > points around the appropriateness of using DMABUF for this?
> > >  > I appreciate it is a tricky topic to distil into a brief summary
> > > but
> > >  > I know I would find it useful even if no one else does!
> > > 
> > >  So we want to have a high-speed interface where buffers of samples
> > > are
> > >  passed around between IIO devices and other devices (e.g. USB or
> > > network),
> > >  or made available to userspace without copying the data.
> > > 
> > >  DMABUF is, at least in theory, exactly what we need. Quoting the
> > >  documentation
> > >  (https://www.kernel.org/doc/html/v5.15/driver-api/dma-buf.html):
> > >  "The dma-buf subsystem provides the framework for sharing buffers
> > > for
> > >  hardware (DMA) access across multiple device drivers and
> > > subsystems, and for
> > >  synchronizing asynchronous hardware access. This is used, for
> > > example, by
> > >  drm “prime” multi-GPU support, but is of course not limited to GPU
> > > use
> > >  cases."
> > > 
> > >  The problem is that right now DMABUF is only really used by DRM,
> > > and to
> > >  quote Daniel, "dma-buf looks like something super generic and
> > > useful, until
> > >  you realize that there's a metric ton of gpu/accelerator bagage
> > > piled in".
> > > 
> > >  Still, it seems to be the only viable option. We could add a custom
> > >  buffer-passing interface, but that would mean implementing the same
> > >  buffer-passing interface on the network and USB stacks, and before
> > > we know
> > >  it we re-invented DMABUFs.
> > 
> > dma-buf also doesn't support sharing with network and usb stacks, so I'm
> > a
> > bit confused why exactly this is useful?
> 
> There is an attempt to get dma-buf support in the network stack, called
> "zctap". Last patchset was sent last november. USB stack does not support
> dma-buf, but we can add it later I guess.
> 
> > So yeah unless there's some sharing going on with gpu stuff (for data
> > processing maybe) I'm not sure this makes a lot of sense really. Or at
> > least some zero-copy sharing between drivers, but even that would
> > minimally require a dma-buf import ioctl of some sorts. Which I either
> > missed or doesn't exist.
> 
> We do want zero-copy between drivers, the network stack, and the USB stack.
> It's not just about having a userspace interface.

I think in that case we need these other pieces too. And we need acks from
relevant subsystems that these other pieces are a) ready for upstream
merging and also that the dma-buf side of things actually makes sense.

> > If there's none of that then just hand-roll your buffer handling code
> > (xarray is cheap to use in terms of code for this), you can always add
> > dma-buf import/export later on when the need arises.
> > 
> > Scrolling through patches you only have dma-buf export, but no
> > importing,
> > so the use-case that works is with one of the existing subsystems that
> > supporting dma-buf importing.
> > 
> > I think minimally we need the use-case (in form of code) that needs the
> > buffer sharing here.
> 
> I'll try with zctap and report back.

Do you have a link for this? I just checked dri-devel on lore, and it's
not there. Nor anywhere else.

We really need all the pieces, and if block layer reaction is anything to
judge by, dma-buf wont happen for networking either. There's some really
nasty and fairly fundamental issues with locking and memory reclaim that
make this utter pain or outright impossible.
-Daniel

> 
> Cheers,
> -Paul
> 
> > >  > >
> > >  > >  Changes since v1:
> > >  > >
> > >  > >  - the patches that were merged in v1 have been (obviously)
> > > dropped
> > >  > > from
> > >  > >    this patchset;
> > >  > >  - the patch that was setting the write-combine cache setting
> > > has
> > >  > > been
> > >  > >    dropped as well, as it was simply not useful.
> > >  > >  - [01/12]:
> > >  > >      * Only remove the outgoing queue, and keep the incoming
> > > queue,
> > >  > > as we
> > >  > >        want the buffer to start streaming data as soon as it is
> > >  > > enabled.
> > >  > >      * Remove IIO_BLOCK_STATE_DEQUEUED, since it is now
> > > functionally
> > >  > > the
> > >  > >        same as IIO_BLOCK_STATE_DONE.
> > >  > >  - [02/12]:
> > >  > >      * Fix block->state not being reset in
> > >  > >        iio_dma_buffer_request_update() for output buffers.
> > >  > >      * Only update block->bytes_used once and add a comment
> > > about
> > >  > > why we
> > >  > >        update it.
> > >  > >      * Add a comment about why we're setting a different state
> > > for
> > >  > > output
> > >  > >        buffers in iio_dma_buffer_request_update()
> > >  > >      * Remove useless cast to bool (!!) in iio_dma_buffer_io()
> > >  > >  - [05/12]:
> > >  > >      Only allow the new IOCTLs on the buffer FD created with
> > >  > >      IIO_BUFFER_GET_FD_IOCTL().
> > >  > >  - [12/12]:
> > >  > >      * Explicitly state that the new interface is optional and
> > > is
> > >  > >        not implemented by all drivers.
> > >  > >      * The IOCTLs can now only be called on the buffer FD
> > > returned by
> > >  > >        IIO_BUFFER_GET_FD_IOCTL.
> > >  > >      * Move the page up a bit in the index since it is core
> > > stuff
> > >  > > and not
> > >  > >        driver-specific.
> > >  > >
> > >  > >  The patches not listed here have not been modified since v1.
> > >  > >
> > >  > >  Cheers,
> > >  > >  -Paul
> > >  > >
> > >  > >  Alexandru Ardelean (1):
> > >  > >    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> > >  > >
> > >  > >  Paul Cercueil (11):
> > >  > >    iio: buffer-dma: Get rid of outgoing queue
> > >  > >    iio: buffer-dma: Enable buffer write support
> > >  > >    iio: buffer-dmaengine: Support specifying buffer direction
> > >  > >    iio: buffer-dmaengine: Enable write support
> > >  > >    iio: core: Add new DMABUF interface infrastructure
> > >  > >    iio: buffer-dma: Use DMABUFs instead of custom solution
> > >  > >    iio: buffer-dma: Implement new DMABUF based userspace API
> > >  > >    iio: buffer-dmaengine: Support new DMABUF based userspace API
> > >  > >    iio: core: Add support for cyclic buffers
> > >  > >    iio: buffer-dmaengine: Add support for cyclic buffers
> > >  > >    Documentation: iio: Document high-speed DMABUF based API
> > >  > >
> > >  > >   Documentation/driver-api/dma-buf.rst          |   2 +
> > >  > >   Documentation/iio/dmabuf_api.rst              |  94 +++
> > >  > >   Documentation/iio/index.rst                   |   2 +
> > >  > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
> > >  > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 610
> > >  > > ++++++++++++++----
> > >  > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
> > >  > >   drivers/iio/industrialio-buffer.c             |  60 ++
> > >  > >   include/linux/iio/buffer-dma.h                |  38 +-
> > >  > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
> > >  > >   include/linux/iio/buffer_impl.h               |   8 +
> > >  > >   include/uapi/linux/iio/buffer.h               |  30 +
> > >  > >   11 files changed, 749 insertions(+), 145 deletions(-)
> > >  > >   create mode 100644 Documentation/iio/dmabuf_api.rst
> > >  > >
> > >  >
> > > 
> > > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
