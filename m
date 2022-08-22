Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84159CB3A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 23:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846A1A465E;
	Mon, 22 Aug 2022 21:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463BA4628
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661205514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQUeuV51GD+/Z3NmS3oF64vuc80M1JzNM209IAEm6Lo=;
 b=XreFxEgT0St/S5ytutYS0TIHGB1X4lCC+SRMR8Y4lCWpQDsKTJcoaoQXN60d/fNKoclp5c
 AP7AGBnPcmnqfpfC0KyAFnEXIEASnk0hskMvNF1yzbKXVA/oAgV149BaT9WTm7CTv/5pf+
 PziTZjASMSm+LNy6bHupV+BW9JdonoQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-wwa85hL5NFOr27dbX4_8VA-1; Mon, 22 Aug 2022 17:58:31 -0400
X-MC-Unique: wwa85hL5NFOr27dbX4_8VA-1
Received: by mail-il1-f199.google.com with SMTP id
 g5-20020a92cda5000000b002e954ecceb0so6316517ild.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=mQUeuV51GD+/Z3NmS3oF64vuc80M1JzNM209IAEm6Lo=;
 b=7jIU2as97bx/K6pE3p75Y6KaulZfH1PB0dYvYoHSY/en1zNLJJE32ALIS5dcPoyCPK
 TCAKIJtL0AoMZ0CXSIBcDqKJuu99Vy6olomT139wJG+x8Wcl2c7m3ZKcLzbVL7EoshIH
 oyyx5okmJje/+z8WHnS+80+GeN9qxbQTb8O1n1OT2jUua8kmJhv9UGHi5XmLz2WuU96C
 GE5Btu4rTbMr47yeKNo3UrfLC62ySwJdrRw16h5F3RcqFClLnr9BUJbKZZWodob40J2B
 sQOt2B6dDROK8UWubv+4jfspspOKWwT+QnNnt50BD0isk6si3Lp9pyvrNv7tynL2aGQV
 tk0w==
X-Gm-Message-State: ACgBeo3qSAYU4iqVQZt2BUQa6fHbbOSjx6hcQc6J6Ie/sqvnLvdbi3ha
 gIbiX/ujrbT01c1I5V8VUwXsBiedzJi53zMX0YmR7NETvUzGuTivkvV3HZEsSReqjkdhshZHz3F
 KFfiZaltF1XYqMa7dkrhjBDJR7G8u
X-Received: by 2002:a05:6638:3892:b0:342:8aa5:a050 with SMTP id
 b18-20020a056638389200b003428aa5a050mr10967574jav.145.1661205511224; 
 Mon, 22 Aug 2022 14:58:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Ji5Aas470cfaDuYoFCQXCz8xDov2+WjpaEqjz4PP+196q6rswlxrWF7iO99xdkBAv+YQNFg==
X-Received: by 2002:a05:6638:3892:b0:342:8aa5:a050 with SMTP id
 b18-20020a056638389200b003428aa5a050mr10967567jav.145.1661205510943; 
 Mon, 22 Aug 2022 14:58:30 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g2-20020a05660203c200b006788259b526sm6276185iov.41.2022.08.22.14.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:58:30 -0700 (PDT)
Date: Mon, 22 Aug 2022 15:58:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Message-ID: <20220822155828.6fa6a961.alex.williamson@redhat.com>
In-Reply-To: <Yv4rBEeUMQyIdEzi@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <Yv4rBEeUMQyIdEzi@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Maor Gottlieb <maorg@nvidia.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Aug 2022 09:05:24 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Aug 17, 2022 at 01:11:38PM -0300, Jason Gunthorpe wrote:
> > dma-buf has become a way to safely acquire a handle to non-struct page
> > memory that can still have lifetime controlled by the exporter. Notably
> > RDMA can now import dma-buf FDs and build them into MRs which allows for
> > PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> > from PCI device BARs.
> > 
> > This series supports a use case for SPDK where a NVMe device will be owned
> > by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> > may directly access the NVMe CMB or directly manipulate the NVMe device's
> > doorbell using PCI P2P.
> > 
> > However, as a general mechanism, it can support many other scenarios with
> > VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> > generic and safe P2P mappings.
> > 
> > This series goes after the "Break up ioctl dispatch functions to one
> > function per ioctl" series.
> > 
> > This is on github: https://github.com/jgunthorpe/linux/commits/vfio_dma_buf
> > 
> > Jason Gunthorpe (4):
> >   dma-buf: Add dma_buf_try_get()
> >   vfio: Add vfio_device_get()
> >   vfio_pci: Do not open code pci_try_reset_function()
> >   vfio/pci: Allow MMIO regions to be exported through dma-buf
> > 
> >  drivers/vfio/pci/Makefile           |   1 +
> >  drivers/vfio/pci/vfio_pci_config.c  |  22 ++-
> >  drivers/vfio/pci/vfio_pci_core.c    |  33 +++-
> >  drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++  
> 
> I forget about this..
> 
> Alex, do you want to start doing as Linus discused and I will rename
> this new file to "dma_buf.c" ?
> 
> Or keep this directory as having the vfio_pci_* prefix for
> consistency?

I have a hard time generating a strong opinion over file name
redundancy relative to directory structure.  By my count, over 17% of
files in drivers/ have some file name redundancy to their parent
directory structure (up to two levels).  I see we already have two
$FOO_dma_buf.c files in the tree, virtio and amdgpu among these.  In
the virtio case this is somewhat justified, to me at least, as the
virtio_dma_buf.h file exists in a shared include namespace.  However,
this justification only accounts for about 1% of such files, for many
others the redundancy exists in the include path as well.

I guess if we don't have a reason other than naming consistency and
accept an end goal to incrementally remove file name vs directory
structure redundancy where it makes sense, sure, name it dma_buf.c.
Ugh. Thanks,

Alex

