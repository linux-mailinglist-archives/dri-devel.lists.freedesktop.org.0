Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B498DB972A8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 20:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A0110E04E;
	Tue, 23 Sep 2025 18:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WgwCqdwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3012C10E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758650977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQIcre9d/GLURHCzSftYDLgKY/Tx/WICcqQ2djA+XCg=;
 b=WgwCqdwXaYN3Trerny7CPtN4SBPyc/HSKDsoex+YwLeP0gtV+SgGmQ/UMR1Tnh+RpS1iuO
 dKdFLD77MyzuEVG8CFDFv4XOzWcgUlIqjirngbu1iFBv2/dvCPe/VCFzCfuVa2FsZewXG7
 8xEDTJQxTKTkD4GB86sD0clhH88n8/Y=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-dCda6KryNJ65QvC9CEce1g-1; Tue, 23 Sep 2025 14:09:35 -0400
X-MC-Unique: dCda6KryNJ65QvC9CEce1g-1
X-Mimecast-MFC-AGG-ID: dCda6KryNJ65QvC9CEce1g_1758650975
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-8c24aa3f7f5so37543639f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758650975; x=1759255775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQIcre9d/GLURHCzSftYDLgKY/Tx/WICcqQ2djA+XCg=;
 b=QBSf+LWjBl3aqd4E7yEEWl70AZmch7Bg0YXNCo2H88x1trCN2pSBT4jFlrSordjUQA
 fnoKcpYK5VZQtM2+ITV1E2vyerHKoohoLoyVhNIC0+ZpNB3RrL0EimzAPpn8RBUY/3OV
 a7Pt4QbHtYrTXJpe4JptxY2hNBrhIv178/0i0mOcKNCqqX5cQnYZdriNxwvtCTaJgDjM
 SU1Cpbv64OxKX3HdDpSZOw7SuXrx5vAWDR4VMr/TLZeVuE9M40wUsx0jM+F35AWEH3tw
 Xw6XH6Kz0LPXgcPdgI1aY1cGiKrFi9/cwBr0X7+ZQHU8UkStKk43POSCfl0PdDSE8hQo
 cEWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmvuDQLyDOG1YiBpIEdBhSnjW2JVCmJaVzHN14HJ52NTH947E7J8k4IPtj+4v/Un6Ih8YEcaCdKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2NzVp6rPT89XYZmOpvI6pIVdRPOu8cQywXkJJSCzbTlPbCPfA
 Q/Ciok5ERUQAWDz/pDiGucpor9AKm2FgenKO464eHEKZ2qHvbrHzxcnJVlZa4p1m9WY55KrK0Zu
 axE2obcs+J4qugVNV+IFEWZtgkzOS2pUuL1Fy9x+p1YEvm29+qZYiCIn2DtTHwBAIP9igrw==
X-Gm-Gg: ASbGncsQkTVAyPhXAiPMJiJGyOht+iIjnzBTy6p0xTsO+xcLQzF1ZGSvjVtWcGLDZwi
 Ji3Mq3KwSO2S7XJVX+zOAXr7tEF9+ZqvrPl6PrQrS1DiorlKsvkcSTZhp2wcN6tKVDU/wTsMXbg
 RWxGtG/s6Nfj25j31Z+DRCadbgUnckg3BGFJ23E9CN4e85o072sHdWHmRE+vX7W8V0KKdTd+Uys
 tJ+LOUJ3qu75bnE9Tm4raC6OkdAscv9B5yXoo9C2gVrcGAQlayDllmA5RLdE+6X8HYAt3HduZsm
 3f67B7SSXNAaBmAcLNju1rcrXxS2tKGE5ByaUhD8epw=
X-Received: by 2002:a05:6e02:1528:b0:412:5782:c7c1 with SMTP id
 e9e14a558f8ab-42581ea129fmr20080515ab.5.1758650975099; 
 Tue, 23 Sep 2025 11:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq8NLMhZ8QXjx/u5jq96UNETG/D0tlVJnMFlvqXnog3t1PaipQH1rILjZIuw/YRGMbPtKiFQ==
X-Received: by 2002:a05:6e02:1528:b0:412:5782:c7c1 with SMTP id
 e9e14a558f8ab-42581ea129fmr20080265ab.5.1758650974546; 
 Tue, 23 Sep 2025 11:09:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-54f69c6262esm5209728173.79.2025.09.23.11.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 11:09:33 -0700 (PDT)
Date: Tue, 23 Sep 2025 12:09:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250923120932.47df57b2.alex.williamson@redhat.com>
In-Reply-To: <20250923174333.GE2608121@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
 <20250923113041.38bee711.alex.williamson@redhat.com>
 <20250923174333.GE2608121@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BSTZ6ndbQyT8mW_UXszjSgDSfNgGy-NC3KIwW95mif0_1758650975
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 23 Sep 2025 14:43:33 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 23, 2025 at 11:30:41AM -0600, Alex Williamson wrote:
> > On Tue, 23 Sep 2025 12:04:14 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Mon, Sep 22, 2025 at 03:00:32PM -0600, Alex Williamson wrote:  
> > > > But then later in patch 8/ and again in 10/ why exactly do we cache
> > > > the provider on the vfio_pci_core_device rather than ask for it on
> > > > demand from the p2pdma?    
> > > 
> > > It makes the most sense if the P2P is activated once during probe(),
> > > it is just a cheap memory allocation, so no reason not to.
> > > 
> > > If you try to do it on-demand then it will require more locking.  
> > 
> > I'm only wondering about splitting to an "initialize/setup" function
> > where providers for each BAR are setup, and a "get provider" interface,
> > which doesn't really seem to be a hot path anyway.  Batching could
> > still be done to setup all BAR providers at once.  
> 
> I agree it is a weird interface, but it is close to the existing weird
> interface :\

Seems like it would help if we just positioned it as a "get provider
for BAR" function that happens to initialize all the providers on the
first call, rather than an "enable" function with some strange BAR
argument and provider return.  pcim_p2pdma_provider(pdev, bar)?

It would at least make sense to me then to store the provider on the
vfio_pci_dma_buf object at the time of the get feature call rather than
vfio_pci_core_init_dev() though.  That would eliminate patch 08/ and
the inline #ifdefs.

> > However, the setup isn't really once per probe(), even in the case of a
> > new driver probing we re-use the previously setup providers.    
> 
> It uses devm to call pci_p2pdma_release() which NULL's pdev->p2pdma.

Ah, right.  So the /* PCI device was "rebound" to the driver */ comment
is further misleading, a new probe would do a new setup.  Thanks,

Alex

