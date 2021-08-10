Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519793E55AF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D266389BC0;
	Tue, 10 Aug 2021 08:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9976D89BC0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:40:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i4so7689957wru.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=cKbU9FcikmLQJ8ei5FqM01XsNg7Lhvb/CqBLRSs+e6Y=;
 b=dyIuT2n2VcPiM/RBZyvglfDmYnDB6Khh/nbdE68r8gYpY/a2NOrDaGfZLTs1W/+53t
 vXS/cZ/tC1I9/7dqHtnrmgMvWpGq9dGx95D1TIug5tn0JH7x68v/1Ix3ehVQ3mzJinRI
 GUr9/F01AqBZbk8e0i4kbq2w26FwQ6BX+66Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=cKbU9FcikmLQJ8ei5FqM01XsNg7Lhvb/CqBLRSs+e6Y=;
 b=L7kO/G9oyCipRkMNbWQBNjRnlxSUv20/hPZQaReGEGFTJd+l80KypuksqH1SQt6uxp
 4D7A2zEQgIrsfREH5Q1JN/A75Q10mtc1scJsxEMzNYIIwJHkRZmoYDYQ75eWgGwBG49C
 zXSXDQfNyFArTS8Xe+e8eKUgXL9gIi9mWOADzXzISbuQCbwePhg298w53xidbC7vk9W0
 gQozv6Q6zLF67/lf/J2pGZbGFiyDbdscFvmiYaFKV1o5iankjIWGGOaW6EEkNZEjFhMu
 vKr3nrcBcmEPp0wfW9n2e6cYN2dYeMluiM16FUUgjIVpDcQdJjNnKthGx29OOQodNISw
 sDHw==
X-Gm-Message-State: AOAM532ILG7+vahPQtDLfk/wKeacu5M0Fxj8rX8RghQmjBnXw5OmeQxm
 fzLNV8md/V/Cqy/31k6PVNkB7w==
X-Google-Smtp-Source: ABdhPJza6SgqUQMLMWRHmcm7FQ9wXAO72W40L4Idi8UXF8r5IQoBj3uhgCeKhzBt6M/C31Jpx7GRDw==
X-Received: by 2002:adf:ee4e:: with SMTP id w14mr29754692wro.15.1628584821138; 
 Tue, 10 Aug 2021 01:40:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c15sm22801342wrw.93.2021.08.10.01.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:40:20 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:40:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Hridya Valsaraju <hridya@google.com>, John Stultz <john.stultz@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
Message-ID: <YRI7cqWXM545iMzO@phenom.ffwll.local>
Mail-Followup-To: Sumit Semwal <sumit.semwal@linaro.org>,
 Hridya Valsaraju <hridya@google.com>,
 John Stultz <john.stultz@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210722190747.1986614-1-hridya@google.com>
 <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
 <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
 <CAO_48GFS5SsdNCwOp6Jb+nmZJ+SdNkQkq628VhxXRGSLVeP0Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_48GFS5SsdNCwOp6Jb+nmZJ+SdNkQkq628VhxXRGSLVeP0Yg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 01:54:41PM +0530, Sumit Semwal wrote:
> Hi Hridya,
> 
> Apologies for the delay in responding.
> 
> On Wed, 4 Aug 2021 at 03:09, Hridya Valsaraju <hridya@google.com> wrote:
> 
> > On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com>
> > wrote:
> > > > This patch limits the size of total memory that can be requested in a
> > > > single allocation from the system heap. This would prevent a
> > > > buggy/malicious client from depleting system memory by requesting for
> > an
> > > > extremely large allocation which might destabilize the system.
> > > >
> > > > The limit is set to half the size of the device's total RAM which is
> > the
> > > > same as what was set by the deprecated ION system heap.
> > > >
> > > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > >
> > > Seems sane to me, unless folks have better suggestions for allocation
> > limits.
> > >
> > > Reviewed-by: John Stultz <john.stultz@linaro.org>
> >
> > Thank you for taking a look John!
> >
> Looks good to me; I will apply it to drm-misc today.

Please don't, this doesn't really solve anything:
- it's easy to bypass, just allocate more buffers to get over the limit
- resource limit plan is cgroups, not hand-rolled limits in every
  allocator
- the ttm "max half of system memory" is for pinned memory, to work around
  locking inversion issues between dma_resv_lock and core mm shrinkers. It
  does not actually impose an overall allocation limit, you can allocate
  ttm bo until your entire memory (and swap) are full. Christian König has
  merged a patch set to lift this by reworking the shrinker interaction,
  but it had to be reverted again because of some fallout I can't remember
  offhand. dma_resv_lock vs shrinkers is very tricky.

So if you want resource limits then you really want cgroups here.

Cheers, Daniel

> 
> 
> >
> > Regards,
> > Hridya
> >
> > >
> > > thanks
> > > -john
> >
> Best,
> Sumit.
> 
> -- 
> Thanks and regards,
> 
> Sumit Semwal (he / him)
> Tech Lead - LCG, Vertical Technologies
> Linaro.org │ Open source software for ARM SoCs

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
