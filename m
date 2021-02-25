Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943D324E72
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28536EC89;
	Thu, 25 Feb 2021 10:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1796EC89
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 10:45:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id k66so4406635wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3idtwS6zYmBRk0u2V+/NLyjIX5bD4fwV71S/p31/Emk=;
 b=GY2kulOW8cXMjk6JFjNY+kK4D0HnSV/CRAjloRweHgCc60nXzEPiSlW9Y7rbNpdmGv
 TGCH9qNwv8zEUUnjcgDGLf5AoImmiBhF3hUPKbvfSz2vXQcl2wI33AuaEqppJvxhdWdM
 rMecDg/tiLISxBtWnG62/bS4yLn6+Xrf8myeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3idtwS6zYmBRk0u2V+/NLyjIX5bD4fwV71S/p31/Emk=;
 b=mz0RpOaXaBd13EE7NzIe03j6SgONgfS4BiaZVHrjui9WVfqPO2WE16eesOvfqWEFBy
 weXAZcEJ56/WzTV76L4Z2az/4p6iJha+WlchTWPt6aJ6a2S2KSwqHr4XqzYso68KTsYR
 M4A9PH/XdhW20Utun6YpvAilwLEXsdWhlf1Ym3GqH0ZzcQf5S+aROLTsjg/9PMlCmzfP
 EMajPauzJ0NWvMo8uFPjJSNtq1xu05Nr2IQz9rtLZzzIaIlMCtLCRzNjIXWebA66DrAs
 EmuYwWoP8mYlfrhouQtPAGFGPkLQ0ExmBIO6q+CAp3V73t7qsfL6RIHCMqHdrCHOkT1I
 drow==
X-Gm-Message-State: AOAM531YJABzreIf2Ggs+bO4bTPM7GurPPOguSDQLLLoMM7gCh7WD2V2
 gnDkF20POz1pAnwUWJioJ6jgNA==
X-Google-Smtp-Source: ABdhPJxiL7xIc7cnoY5mDWFeLwU9JFNqQVi3g5zMbx77RZ3f+ZhOBSDI2s6aRAhBEpxtlkq3F4PzzA==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr2644384wmq.142.1614249945915; 
 Thu, 25 Feb 2021 02:45:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a14sm9232064wrg.84.2021.02.25.02.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:45:45 -0800 (PST)
Date: Thu, 25 Feb 2021 11:45:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <YDd/1xvDoctHWgdD@phenom.ffwll.local>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <20210224184657.GR2643399@ziepe.ca>
 <b364d7e9-b323-e590-359d-32e067f3f5ee@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b364d7e9-b323-e590-359d-32e067f3f5ee@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 11:30:23AM +0100, Christian K=F6nig wrote:
> =

> =

> Am 24.02.21 um 19:46 schrieb Jason Gunthorpe:
> > On Wed, Feb 24, 2021 at 09:45:51AM +0100, Daniel Vetter wrote:
> > =

> > > Hm I figured everyone just uses MAP_SHARED for buffer objects since
> > > COW really makes absolutely no sense. How would we enforce this?
> > In RDMA we test
> > =

> > drivers/infiniband/core/ib_core_uverbs.c:       if (!(vma->vm_flags & V=
M_SHARED))
> > =

> > During mmap to reject use of MAP_PRIVATE on BAR pages.
> =

> That's a really good idea. MAP_PRIVATE and any driver mappings doesn't
> really work at all.

Yeah I feel like this is the next patch we need to add on this little
series of locking down dma-buf mmap semantics. Probably should also push
these into drm gem mmap code (and maybe ttm can switch over to that, it's
really the same).

One at a time.
-Daniel
> =

> Christian.
> =

> > =

> > Jason
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
