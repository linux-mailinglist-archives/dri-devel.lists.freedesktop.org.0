Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA6BAE179
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 18:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B663810E60A;
	Tue, 30 Sep 2025 16:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G02T/CxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95F10E60A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759251173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JryoONnZtvrch8iWe5kQa/bp3US7CnLH1VFoC2oPQRw=;
 b=G02T/CxWdFzdWNfhlIFwdrUzUnNBxZAHRXbim9H6o7KQF5KMS4DNUuK0/q0tS1t4VDHqf1
 GOfXb5jTCrqx4i4h3f5VwHtoD6hlai8QA77ya8Sck7zGbs4bYIpeUgCs+aMFoPl2guGAKD
 IxWFGeHTQKPEyMC6jJaM17C6FhYIod4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-0bfZG4UmOBi-or1NCeDEUA-1; Tue, 30 Sep 2025 12:52:51 -0400
X-MC-Unique: 0bfZG4UmOBi-or1NCeDEUA-1
X-Mimecast-MFC-AGG-ID: 0bfZG4UmOBi-or1NCeDEUA_1759251171
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7a6cda1b2a9so1823180a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 09:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759251171; x=1759855971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JryoONnZtvrch8iWe5kQa/bp3US7CnLH1VFoC2oPQRw=;
 b=eS3o8iEB82UN45owfU01zVdx2bJRqUPe+ajnKE6ENFB5tK6xjfaXjaskhbGFbrkGMN
 KeA03W69XRwdhZHKbjznPY1eeObRs4cTonJFoLLnkFxejWMTDH2wy0zOgLpw2qigZmKv
 9HMMLEu0nKbLY1hOVe31+08XP81Q+5oJrq3OGRUb/HGlXIdTI01Q2drHWrykHfu9zzN6
 gNRj1M/BAYANXGX9UG4p6CxKl1G4xI25DRky2FQBYM/giDQ6TOI7xL5Nbj2FaGsH+piN
 gWNPJvdR8gkuqfdNf5TZPDz3wFf+aV3t6iMUcXpZcvCD7z513apk/Fb0a/Ws7mmgnhEI
 M6pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSb7pLvWKAJKyNXOYYsp/gh9mhP/uoh77I+ho0FkHY+X+D/GJ4UJnjbohT75HERBlERTN2rubyd4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHw6Sb2n23lfSyij3AR35WlbizHDzRJKtl8MepeltFx4mWH0Vm
 O4SRiTgAJZWa4o6dY/Vt5AueynafOd8FWJw8zNjMEHJ1tP0a7bYTgfNMYQstZRu9Vwfo+FA5sF5
 h8vMgsdVsujCBY9CZi0SkSYAa0PLlFrHiKy2XB08Zdfhz/3j9KQ7U4UfYKLWrWGDiM3IP4A==
X-Gm-Gg: ASbGncs08V8KuyMEHcZVPkwjz8g0vtQOBaY/lCdzmFO9eh4h/DfMDIoaecMKDzNAUR6
 Z1SThtuQ7B4Vm3dCQewiItA+qOuk5hBwRN1mOzTwN+KvLiOi+x9YQQWpB5j7B7vFz90Mo3ho0H6
 7iS8zTqlToQtH2kpT9fGmpWeeL0F47gJ0KwCZrUQ9QV/SgnJpjywBnsSP8z0T9hdPoLe6I4UJbj
 k1Smcldrl6es7IBx+z7Wc981q7B+YbzjrKLxJo2Cu4mcF6uKslQQiTpDSJ14osD+qvfJVClHWTN
 4gKDRI3gVB1b0zirtOqY9UT+WCeuJzThSdGfPTv2G4vRR92L
X-Received: by 2002:a05:6808:f86:b0:438:33fd:317c with SMTP id
 5614622812f47-43fa41bd61fmr82476b6e.3.1759251171056; 
 Tue, 30 Sep 2025 09:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwZ3/lKZz7Fdu2TvHNlTbKRk5qveSl6rvSejYaxAMAP02EZ6HQb/uugFp+9XcOcN4obhcZxg==
X-Received: by 2002:a05:6808:f86:b0:438:33fd:317c with SMTP id
 5614622812f47-43fa41bd61fmr82463b6e.3.1759251170626; 
 Tue, 30 Sep 2025 09:52:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-43f51238c63sm2746753b6e.22.2025.09.30.09.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 09:52:49 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:52:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250930105247.1935b553.alex.williamson@redhat.com>
In-Reply-To: <20250930143408.GI2942991@nvidia.com>
References: <cover.1759070796.git.leon@kernel.org>
 <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
 <20250929151749.2007b192.alex.williamson@redhat.com>
 <20250930090048.GG324804@unreal>
 <CH3PR12MB754801DC65227CC39A3CB1F3AB1AA@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20250930143408.GI2942991@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5-XLEkYlaUP7vIndtlEwkEsFZghTEKfRuL-cqEjCCVk_1759251171
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

On Tue, 30 Sep 2025 11:34:08 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 30, 2025 at 12:50:47PM +0000, Shameer Kolothum wrote:
> 
> > This is where hisi_acc reports a different BAR size as it tries to hide
> > the migration control region from Guest access.  
> 
> I think for now we should disable DMABUF for any PCI driver that
> implements a VFIO_DEVICE_GET_REGION_INFO
> 
> For a while I've wanted to further reduce the use of the ioctl
> multiplexer, so maybe this series:
> 
> https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op/
> 
> And then the dmabuf code can check if the ops are set to the generic
> or not and disable itself automatically.
> 
> Otherwise perhaps route the dmabuf through an op and deliberately omit
> it (with a comment!) from hisi, virtio, nvgrace.
> 
> We need to route it through an op anyhow as those three drivers will
> probably eventually want to implement their own version.

Can't we basically achieve the same by testing the ioctl is
vfio_pci_core_ioctl?  Your proposal would have better granularity, but
we'd probably want an ops callback that we can use without a userspace
buffer to get the advertised region size if we ever want to support a
device that both modifies the size of the region relative to the BAR
and supports p2p.  Thanks,

Alex

