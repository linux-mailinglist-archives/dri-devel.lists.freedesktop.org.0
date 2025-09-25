Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8067BA1CB8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E91310E2E4;
	Thu, 25 Sep 2025 22:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C+yZubRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A435410E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758839497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPGBYTkBK6lmMsctQg86rFzc+ubUYRnHqSeaFKAdA0w=;
 b=C+yZubRgK7Xuwq8ZYbAwrcRYC9QJmxmKZYhbFEgZZzGy0wcSpRtZdmQIn5cJi+4/kE7I0b
 H7LRxQ7lvfwPszHznmJsqnXlq31xtlX1UeKVoTth1DoVwhxeCom1E1069qr7z2twjZ/ElL
 OZg7vgVrWNEhfNV/vmzboGSLcCUVDtI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-Ur_gjSY2NJ2DJCRBaYG2ZQ-1; Thu, 25 Sep 2025 18:31:36 -0400
X-MC-Unique: Ur_gjSY2NJ2DJCRBaYG2ZQ-1
X-Mimecast-MFC-AGG-ID: Ur_gjSY2NJ2DJCRBaYG2ZQ_1758839495
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-42571642af9so5015135ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758839495; x=1759444295;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pPGBYTkBK6lmMsctQg86rFzc+ubUYRnHqSeaFKAdA0w=;
 b=V1aQUxXXkRc60sRMNNcgnMIPbB8UmYmXyePzNnQYe6FNxOo1eR5sSJd999drYkokOs
 rQBHJ7oeiW9ZT2AL6KNmCsbSSP6tz8xWfR9ikPgNdyNPUkI1MxmlDHtXkQdiR7j8RZOo
 elWPHjrw/gc8NWQDS5jYUP5mi8L5Fv6mTi8wyZ25DpPIK8tdWz4bY8v/jDjlvmakq3vQ
 f8yUcJYOjCm4TorswUSKU8RJ9A51yfBijveq/fpYIuDE5VQDjgvkYxQzn6TbE2jU39pb
 YvRawSLuedSo+JIyQ1ONu+6bucaLVQqYhnTP9ZzjsiMLF53oNruUECwktYMGS/MCFU50
 dA/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Oex4F+pzKrexjkQXMlzLU58UE6Jtwi/18l9pUNU8BJGmb3nZsw2gZzHwo+y7vmU/WWWMfWdyDIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyUuY735XscuqngMst2cnNzjkAG3duaGvM0hgRGqEaHpNwZbBb
 0EuUse7cU0hgYoVC54ZQCOX3PIkaetI2Zb/VLLAOTMw7kB2qTuDmeqwNqnu+osgv8oB58PMuCoF
 fFDVBs9jUZ6VtEFNBN8Fx23vu+q4+unFGlPB4ZA5GxkbwGgVlAhHBqnYV/lTZK+uehXRPnA==
X-Gm-Gg: ASbGncsTnZE9yJB9JGsR0hkh9UCeswmDTvo8q/iHuq1Yqvgt2cn8D85pXD6wDYxMEMR
 JsJwdI/wV3wCpDihvZ1dilkFqKFPFYYX01lABdsAA0pTcbV4yJrgEHPHQ+yVPw4ACp2gwwwHO6o
 B7E9xC3IDvMAhmwP+jyxw2eze26TrLSSsCOSxmYm5wyN7IFFcm0jovKDTNlDLz/u5PO0ENL7Lte
 5cn5jnkrzebu/iDbpSxoy0go384/eOeRCYnI0BASB0JRnhZhZ2Csyz6COAGG5xY0srcQje1SeMh
 VFi+3GbKzZdaGhtXjyGVtjPsa7blldbCbJe/3mrNIIY=
X-Received: by 2002:a92:d987:0:b0:424:80e6:9e8b with SMTP id
 e9e14a558f8ab-42595661562mr24720335ab.7.1758839495386; 
 Thu, 25 Sep 2025 15:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjWzVlsd5kVvaGcIPZVt9Dy5vtGZ7X7lNybnyhnS6f36pgd3Q/xbJFuK0zszjvTKZaW8Iag==
X-Received: by 2002:a92:d987:0:b0:424:80e6:9e8b with SMTP id
 e9e14a558f8ab-42595661562mr24719995ab.7.1758839494991; 
 Thu, 25 Sep 2025 15:31:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56a69a1c574sm1211405173.40.2025.09.25.15.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:31:34 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:31:31 -0600
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
Message-ID: <20250925163131.22a2c09b.alex.williamson@redhat.com>
In-Reply-To: <20250925115308.GT2617119@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
 <20250923113041.38bee711.alex.williamson@redhat.com>
 <20250923174333.GE2608121@nvidia.com>
 <20250923120932.47df57b2.alex.williamson@redhat.com>
 <20250925070314.GA12165@unreal>
 <20250925115308.GT2617119@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gfvmgCpKgZ4guHGXXLAAknE3v5fLav_JxTm425OM-jo_1758839495
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

On Thu, 25 Sep 2025 08:53:08 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Sep 25, 2025 at 10:03:14AM +0300, Leon Romanovsky wrote:
> 
> > > It would at least make sense to me then to store the provider on the
> > > vfio_pci_dma_buf object at the time of the get feature call rather than
> > > vfio_pci_core_init_dev() though.  That would eliminate patch 08/ and
> > > the inline #ifdefs.  
> > 
> > I'll change it now. If "enable" function goes to be "get" function, we
> > won't need to store anything in vfio_pci_dma_buf too. At the end, we
> > have exactly two lines "provider = priv->vdev->provider[priv->bar];",
> > which can easily be changed to be "provider = pcim_p2pdma_provider(priv->vdev->pdev, priv->bar)"  
> 
> Not without some kind of locking change. I'd keep the
> priv->vdev->provider[priv->bar] because setup during probe doesn't
> need special locking.

Why do we need to store the provider on the vfio_pci_core_device at
probe though, we can get it later via pcim_p2pdma_provider().  Ideally
we'd take the opportunity to pull out the setup part of the _provider
function to give us an initialization interface to use at probe time
without an unnecessary BAR# arg.  Thanks,

Alex

