Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77574BA410E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58510E315;
	Fri, 26 Sep 2025 14:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gHVwjqSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424F010E315
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758896037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYsj9+8I0Zx27jHpluvCkiN1087KEQYq4tnoUW0GI60=;
 b=gHVwjqSnXHb7EcJVuSmAxGBysXD143Lr4ddT0yPGVYq0bulfIVfDe4saImNhK1Ega1SpMe
 adMFy3rw6dWXEC+IWPYR5qfoLDraWP1ocaOKOJRDZn63MqqxOJlKbBcEoftPzPfdhdylqD
 o19bIJvR3L8p3tUan0kn1ll7EXnADBQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-R7UATaAYNw-xNJIICQdAaw-1; Fri, 26 Sep 2025 10:13:55 -0400
X-MC-Unique: R7UATaAYNw-xNJIICQdAaw-1
X-Mimecast-MFC-AGG-ID: R7UATaAYNw-xNJIICQdAaw_1758896034
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-425d6a07c97so1411965ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758896034; x=1759500834;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qYsj9+8I0Zx27jHpluvCkiN1087KEQYq4tnoUW0GI60=;
 b=j12Qd2IaUVumBcu4DCMuDFG4y105Ta8qUaW4U1wCvqEmHWp4AW5lCQat4ynFBjR9ty
 gfBBU5MRSPerShhgba0xj5Z7JKDeThSS4KeRG9IKM/b2Zm5FcXQyau7vyi32iTkY7whA
 Zl7lSr6aiXxfjaTieodjlxjbazVXa6Vn2t0gQXgBuDunrQCT1be6EHnrC9hWK8MIuuiy
 xidVo4veB5XkM+7XYbROQXMlLb5OsoSCQzrdrnP6Nc0Eeyz7cfEi+3EnPjPj8EOrl16h
 EKmNuVSQ1xzID66WPe1TMxzmTEYo5gKt6KpbHTSYgdFQcs16a3rla6u0IZ7nWjLlDamb
 hBoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL4w3VedPXO07ygyl5ZarjHU08uhqJbVMXd6mNH2GU0ol/6zh9oWQuzpTyfxm5khtyoNGP6onJKoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV1JFQIL3s2dDf+8sX6PO2Jck6s74E3Gs8UckSZUz9XWL54kp0
 uWVm9ZyL8TVkeXwc8MFn1ngDF8w6fLbDsyyXp3Hjz+87MNPsPlQXNuTwVXSbxZO2ovKgGYbAHpb
 5V8OUs63ofMAbeD48G39A7L5Ojc9er2NPCnJUQ1/iW/PY8oi2nSiDbLMuT8ffqDBk4TYLKg==
X-Gm-Gg: ASbGncsFGu93+kfLkc1VKrnhf+qL9sVgDiArpHHZsT7rfLIRLgxP3ME3wQ5vKUVSo2j
 +S+fu4J8ZA5IsErX4VBSJJskZsOjCySRsvsg5qvHwC3YSaX/IPhC4E3NO0ZyhwbLWHSQzgqox+G
 hQ/xtBw+cNFgyb7uPh94qFZzArJQ/M3rEX3i7WhwAcA/tHZyKWVwtXVOy0Eoaz3koj7snogUHrp
 UU0wDDdACmgVJrWeMS0xEewIobE3kM/B2l0muT+WNwAppjOc3Y0/+/4fPQHN5q/AIy4ppIT4GbJ
 7ok3HcLJTQsp+4jzcztp0rXIfSpgnbdjzgRAHdBEvCQ=
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id
 e9e14a558f8ab-425955e4dfdmr37293745ab.2.1758896034414; 
 Fri, 26 Sep 2025 07:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHfT8sSg9RrO7oeIo38sP5Lm5q3G5XmCIbUcAskNNx/V0hMD+Gb0yPcLZiy3wfp8DzV0Dz7Q==
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id
 e9e14a558f8ab-425955e4dfdmr37293545ab.2.1758896033974; 
 Fri, 26 Sep 2025 07:13:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56a6a5b1ec5sm1833727173.67.2025.09.26.07.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 07:13:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 08:13:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250926081350.16bb66c8.alex.williamson@redhat.com>
In-Reply-To: <20250925230236.GB2617119@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
 <20250923113041.38bee711.alex.williamson@redhat.com>
 <20250923174333.GE2608121@nvidia.com>
 <20250923120932.47df57b2.alex.williamson@redhat.com>
 <20250925070314.GA12165@unreal>
 <20250925115308.GT2617119@nvidia.com>
 <20250925163131.22a2c09b.alex.williamson@redhat.com>
 <20250925230236.GB2617119@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1LjoZfjI_SjkcNvDbRHhf0Mj1r0DEq3At6gaSfRKUEo_1758896034
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

On Thu, 25 Sep 2025 20:02:36 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Sep 25, 2025 at 04:31:31PM -0600, Alex Williamson wrote:
> > On Thu, 25 Sep 2025 08:53:08 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Thu, Sep 25, 2025 at 10:03:14AM +0300, Leon Romanovsky wrote:
> > >   
> > > > > It would at least make sense to me then to store the provider on the
> > > > > vfio_pci_dma_buf object at the time of the get feature call rather than
> > > > > vfio_pci_core_init_dev() though.  That would eliminate patch 08/ and
> > > > > the inline #ifdefs.    
> > > > 
> > > > I'll change it now. If "enable" function goes to be "get" function, we
> > > > won't need to store anything in vfio_pci_dma_buf too. At the end, we
> > > > have exactly two lines "provider = priv->vdev->provider[priv->bar];",
> > > > which can easily be changed to be "provider = pcim_p2pdma_provider(priv->vdev->pdev, priv->bar)"    
> > > 
> > > Not without some kind of locking change. I'd keep the
> > > priv->vdev->provider[priv->bar] because setup during probe doesn't
> > > need special locking.  
> > 
> > Why do we need to store the provider on the vfio_pci_core_device at
> > probe though, we can get it later via pcim_p2pdma_provider().   
> 
> Because you'd need some new locking to prevent races.

The race is avoided if we simply call pcim_p2pdma_provider() during
probe.  We don't need to save the returned provider.  That's where it
seems like pulling the setup out to a separate function would eliminate
this annoying BAR# arg.
 
> Besides, the model here should be to call the function once during
> probe and get back the allocated provider. The fact internally it is
> kind of nutzo still shouldn't leak out as a property of the ABI.
> 
> I would like to remove this weird behavior where it caches things
> inside the struct device. That's not normal for an API to do that, it
> is only done for the genalloc path that this doesn't use.

My goal in caching the provider on the vfio p2pdma object was to avoid
caching it on the vfio_pci_core_device, but now we're storing it on the
struct device, the vfio_pci_core_device, AND the vfio p2pdma object.
Given the current state that it's stored on the struct device, I think
we only need a setup call during probe (that could be stubbed out
rather than #ifdef'd), then cache the provider on the vfio p2pdma
object when a dmabuf is configured.  Thanks,

Alex

