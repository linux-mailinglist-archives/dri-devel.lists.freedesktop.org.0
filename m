Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908133BDC46
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9C88DF6;
	Tue,  6 Jul 2021 17:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573366E550
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:28:30 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id c5so1308317qvu.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=px11FX2o2NfOVHHhqnYnIhPQRFcjzs1+EmS0dsyOJPw=;
 b=NF9XyW3fJY3iSvOKRIQQV+C9O8LDLzSL5nLvOmxEd2aIXF2R2INnN2ppJQUbhi6DTV
 bkLZ9RPPT44Eqt9TFVlwTbLNxtdPmHz8R3OsArM3R4sQi8ODLHQSjGR3OgBwMKyXtHNF
 K9ejcbRJRLCLTPyFEbwQzuBzfEgTPnMj6hMROdxPpkzmYY6xp0eWqzR8mSjb/sLAqfbB
 lSEkuCODAJl2x64EYiUVYfnC8YDK58ifVoE9B2fQ6/omp+mfhARrfLpa+fypn8XD9z9S
 kyOUZYLc41KEvRUUGGnMouFoGD5+qIuQ+IqsTll4iXp+lukaxhYtEoRakxbU44SzNWt/
 gwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=px11FX2o2NfOVHHhqnYnIhPQRFcjzs1+EmS0dsyOJPw=;
 b=YWTC22r2xJwgc3AYGUa5HbbtYJzS1GIGtxKtlMUTc5ByE6Gk/GPZzwyeov/hHiXupE
 4qYandrNOsRr2rifXmXZXI2SaR+pL5VpU07/cbr4rj4VFw+PkGOo+51kdni/tdpEaFfb
 YsKNopHNFdDEHLblKtbXZ1yMp15NrgSrQhFDP8K+wEkhKhdjNAqW5D5dpl2X36EzVsJ9
 o69plSMTlm5TlBY7VLxoJPM4A8VGml+khZD3c+FTCRSKHQCmpJv7brWToLDI3TZx3mJg
 pDud/LDFKuh0pf8P2mc+Hr3huwxU4lTKDOydfYqUbx6T0n9NqS1TMrmcKPDlbljfiqO/
 LBOA==
X-Gm-Message-State: AOAM533Y1R/gks1QY4R4lPA3jvsE7LlgKjpgY7cy0NdI9d/OtXXrDGr0
 czR2dlgXZi1jAl8+phkB6T8TWw==
X-Google-Smtp-Source: ABdhPJy+jZYEROJ3qIspffgyVpxmDj4ZiVgCcQDd9MnAGWHJKAq+GyoBJWW0gIXqY5aoWofm1iZXqA==
X-Received: by 2002:a0c:eb8f:: with SMTP id x15mr19333838qvo.42.1625592509542; 
 Tue, 06 Jul 2021 10:28:29 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id g13sm5694745qtx.96.2021.07.06.10.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 10:28:29 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1m0os0-004V5Z-2n; Tue, 06 Jul 2021 14:28:28 -0300
Date: Tue, 6 Jul 2021 14:28:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <20210706172828.GR4604@ziepe.ca>
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <20210706142357.GN4604@ziepe.ca>
 <CAKMK7uELNzwUe+hhVWRg=Pk5Wt_vOOX922H48Kd6dTyO2PeBbg@mail.gmail.com>
 <20210706152542.GP4604@ziepe.ca>
 <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
 <CAKMK7uGvO0h7iZ3vKGe8GouESkr79y1gP1JXbfV82sRiaT-d1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGvO0h7iZ3vKGe8GouESkr79y1gP1JXbfV82sRiaT-d1A@mail.gmail.com>
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 06:07:17PM +0200, Daniel Vetter wrote:

> Also on your claim that drivers/gpu is a non-upstream disaster: I've
> also learned that that for drivers/rdma there's the upstream driver,
> and then there's the out-of-tree hackjob the vendor actually
> supports.

In the enterprise world everyone has their out of tree backport
drivers. It varies on the vendor how much deviation there is from the
upstream driver and what commercial support relationship the vendor
has with the enterprise distros.

> So seems to be about the same level of screwed up, if you ask the
> vendor they tell you the upstream driver isn't a thing they care about
> and it's just done for a bit of goodwill. 

Sounds like you should get a new RDMA supplier :)

To be fair Intel is getting better, they got their new RDMA HW support
merged into v5.14 after about 2 years in the out of tree world. Though
it is still incomplete compared to their out of tree driver, the gap
is much smaller now.

> amounts of volume, then suddenly it's an option ... Minus the fw issue
> for nvidia, upstream does support all the gpus you can buy right now
> and that can run on linux with some vendor driver (aka excluding apple
> M1 and ofc upcoming products from most vendors).

I would look at how many actual commercial systems are running the
upstream/inbox stack. I personally know of quite a few sites with big
HPC RDMA deployments running pure inbox kernels, no add on kernel
modules, with full commercial support.

If you can say that kind of arrangment is also common place in the GPU
world then I will happily be wrong.

Jason
