Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBEC3BD833
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 16:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CDD89E5F;
	Tue,  6 Jul 2021 14:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6549489E8C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 14:23:59 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id fi7so9269866qvb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YFV6rk8SCk3lOjLONoCa6QpHpLH5GrV0fP6FZz2KGC4=;
 b=i36XoWKRqU8KJek9jwEW2vzH1kXRjuehGEigeg5Akp/37tkny8vakSr0jIAXiOGu1u
 GHL0ilRliQ9oc9iQmH0an9uV7JDwd/mzX3DacIwdaf7HcjAKD8DG/JUXrWtMORT34TXg
 BYTz5cnKNmWDAd3HuxUJ6kG/qwZoiWbpmkdvRPgflY5DbEzGQI/QtT0N02w4M1gse04r
 jsMypKxf5auUb2hsbqD5cFX7qeepAXsueX82eDVDxqpjWSWLMJVdOufDNgfIs7QguF2V
 gCqp8r5nbz2rp8BmskQCVyWGVWJsMkQ7QtZ+ygTqYTusq6gu7yTTPo1WNdN0ZZrvKsSb
 lqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YFV6rk8SCk3lOjLONoCa6QpHpLH5GrV0fP6FZz2KGC4=;
 b=qZHtAwt/zSWNS/3IZPFvSYoRr7RORJXJALWpzOhpDoRdScUyWsIOLKbTrgO5P1IlN7
 9EWKnqjVrkd0Aq8kWRNy9k8n/ZeT4Lna9UCvfPsQ7m+CGfk5A4Ue3pO5h0NUxot0SMf4
 pbsVhTiEHNZdtNoTxueZLUOUDY6MN/ldPEy/+7LM1+dRZlO63nQoGrxV/WOQ6CJU17xj
 iPMFQ2brAaSTjGTolCK5BAJnzeP6rOMowesxNAuh9YbtWSsqs9zCZvgILYQVYaN4rsaz
 jqJY1WGvSFeIZKZGgAOXhYfaQUO/LAhl8lKUUFp5w7PlPfjB+35D3lbm9Dm7WS0KoilV
 HoDA==
X-Gm-Message-State: AOAM533nMDfeT9AbCYjOLHN2NwDrqE9r2u0vvqUwhI3L4YKZk9zr2weK
 QC8AceAYOHHCFPfaazcAn7hfKw==
X-Google-Smtp-Source: ABdhPJz1CsC+M5B6A7qlNZPYOtCZ1RD0GqU6WwjApjr7wLD9E1k97rwxhSXS/QrhzlkoPkDPUTVSHw==
X-Received: by 2002:a0c:c401:: with SMTP id r1mr18387245qvi.46.1625581438559; 
 Tue, 06 Jul 2021 07:23:58 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id b25sm6994985qkk.111.2021.07.06.07.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:23:58 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1m0lzR-004RHF-1S; Tue, 06 Jul 2021 11:23:57 -0300
Date: Tue, 6 Jul 2021 11:23:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <20210706142357.GN4604@ziepe.ca>
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
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

On Tue, Jul 06, 2021 at 12:36:51PM +0200, Daniel Vetter wrote:

> If that means AI companies don't want to open our their hw specs
> enough to allow that, so be it - all you get in that case is
> offloading the kernel side  of the stack for convenience, with zero
> long term prospects to ever make this into a cross vendor subsystem
> stack that does something useful.

I don't think this is true at all - nouveau is probably the best
example.

nouveau reverse engineered a userspace stack for one of these devices.

How much further ahead would they have been by now if they had a
vendor supported, fully featured, open kernel driver to build the
userspace upon?

> open up your hw enough for that, I really don't see the point in
> merging such a driver, it'll be an unmaintainable stack by anyone else
> who's not having access to those NDA covered specs and patents and
> everything.

My perspective from RDMA is that the drivers are black boxes. I can
hack around the interface layers but there is a lot of wild stuff in
there that can't be understood without access to the HW documentation.

I think only HW that has open specs, like say NVMe, can really be
properly community oriented. Otherwise we have to work in a community
partnership with the vendor.

Jason
