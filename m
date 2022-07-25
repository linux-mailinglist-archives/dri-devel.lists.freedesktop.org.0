Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73222580645
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 23:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074378F58E;
	Mon, 25 Jul 2022 21:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31168F590
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658783883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NWyiHW5I2/geA1CEWbRzyNY6UqPET26DY1+YZLfRCI=;
 b=AfYVYa0x98RVnqs3gcLbPGr2HetKUkW0pdYON45IHEnQYLrW4fgdly8IB8VllYfadkZ3qF
 nqFg2sS3ZA8hIrzFG8qbi/nr+yokvKVKZqC2yloGU65/iP7tMHMxbBoPp3gq6zOy/pQlqP
 mpRtNE74cdFFkN0sXpaD/81n2Yft6wE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-d9lRX-UQMPmwc-sHv5i1aw-1; Mon, 25 Jul 2022 17:18:02 -0400
X-MC-Unique: d9lRX-UQMPmwc-sHv5i1aw-1
Received: by mail-il1-f199.google.com with SMTP id
 o7-20020a056e02102700b002dd09fe012aso8059326ilj.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 14:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=2NWyiHW5I2/geA1CEWbRzyNY6UqPET26DY1+YZLfRCI=;
 b=0rL4arRNWCTSuC54QlL4NQCourHyNdEl+txDcguXP1OkZ8UWt4vOPUg1JHjWobaG01
 vjlqeEyrSL19FxgTGBn0QpJ0yq2zKqPztsT6hfSd6vP7UmPaCHvK6uwuNcjImSC6ee3G
 4bU0GbtAcKspIdSQftpj2ENGCRqDIME+2kPjIDiK8AplEGRKJhyptPW2szOcGltQ6k2e
 7m1SZRzsPtkBEtwEWQScqpPIYfQfftfzJgwOBJ8/ggxt6SDdawLpBkhKUv7plYkgC6lY
 5WMHwHcSsz015zCf3+WEp4rAEWl3ApHHtpWkjnraIu/OYfzVcpcPKfPYgOKaaalYYP3S
 2I3Q==
X-Gm-Message-State: AJIora/Hn8M5WTXKF+4vjTavg+YxMlGwD0n2Cmg75a8EomM4i6HH4CTJ
 qysHTjADgYxLOEgXRZ4/U7cy744JNIcXivCV0pdGpl1bz8qdTsCaIaZ5vuQT/oPC5wdVzglEcV3
 VUNMnbQgSu/8GjBrkT0SO4gYjx5Ad
X-Received: by 2002:a05:6e02:148c:b0:2dc:38ae:5c6a with SMTP id
 n12-20020a056e02148c00b002dc38ae5c6amr5550219ilk.115.1658783878656; 
 Mon, 25 Jul 2022 14:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXwuWmhW15O2ymdEn2whv1cs+NjXgAHFLetXDjRt4kzq/rgyjNkTHVfDxBgkGk5gC+VO8tdQ==
X-Received: by 2002:a05:6e02:148c:b0:2dc:38ae:5c6a with SMTP id
 n12-20020a056e02148c00b002dc38ae5c6amr5550196ilk.115.1658783878367; 
 Mon, 25 Jul 2022 14:17:58 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h76-20020a6bb74f000000b0067baeb55e65sm6614546iof.38.2022.07.25.14.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 14:17:58 -0700 (PDT)
Date: Mon, 25 Jul 2022 15:17:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v4 00/10] cover-letter: Update vfio_pin/unpin_pages API
Message-ID: <20220725151755.12d53f2e.alex.williamson@redhat.com>
In-Reply-To: <20220723020256.30081-1-nicolinc@nvidia.com>
References: <20220723020256.30081-1-nicolinc@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 19:02:46 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> This is a preparatory series for IOMMUFD v2 patches. It prepares for
> replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
> with IOMMUFD version.
> 
> There's a gap between these two versions: the vfio_iommu_type1 version
> inputs a non-contiguous PFN list and outputs another PFN list for the
> pinned physical page list, while the IOMMUFD version only supports a
> contiguous address input by accepting the starting IO virtual address
> of a set of pages to pin and by outputting to a physical page list.
> 
> The nature of existing callers mostly aligns with the IOMMUFD version,
> except s390's vfio_ccw_cp code where some additional change is needed
> along with this series. Overall, updating to "iova" and "phys_page"
> does improve the caller side to some extent.
> 
> Also fix a misuse of physical address and virtual address in the s390's
> crypto code. And update the input naming at the adjacent vfio_dma_rw().
> 
> This is on github:
> https://github.com/nicolinc/iommufd/commits/vfio_pin_pages-v4
> 
> Terrence has tested this series on i915; Eric has tested on s390.
> 
> Thanks!
> 
> Changelog
> v4:
>  * Dropped double-shifting at two gvt_unpin_guest_page calls, fixing
>    a bug that's discovered by Alex
>  * Added Reviewed-by from Anthony Krowiak
>  * Rebased on top of linux-vfio's next
> v3: https://lore.kernel.org/kvm/20220708224427.1245-1-nicolinc@nvidia.com/
>  * Added a patch to replace roundup with DIV_ROUND_UP in i915 gvt
>  * Dropped the "driver->ops->unpin_pages" and NULL checks in PATCH-1
>  * Changed to use WARN_ON and separate into lines in PATCH-1
>  * Replaced "guest" words with "user" and fix typo in PATCH-5
>  * Updated commit log of PATCH-1, PATCH-6, and PATCH-10
>  * Added Reviewed/Acked-by from Christoph, Jason, Kirti, Kevin and Eric
>  * Added Tested-by from Terrence (i915) and Eric (s390)
> v2: https://lore.kernel.org/kvm/20220706062759.24946-1-nicolinc@nvidia.com/
>  * Added a patch to make vfio_unpin_pages return void
>  * Added two patches to remove PFN list from two s390 callers
>  * Renamed "phys_page" parameter to "pages" for vfio_pin_pages
>  * Updated commit log of kmap_local_page() patch
>  * Added Harald's "Reviewed-by" to pa_ind patch
>  * Rebased on top of Alex's extern removal path
> v1: https://lore.kernel.org/kvm/20220616235212.15185-1-nicolinc@nvidia.com/
> 
> Nicolin Chen (10):
>   vfio: Make vfio_unpin_pages() return void
>   drm/i915/gvt: Replace roundup with DIV_ROUND_UP
>   vfio/ap: Pass in physical address of ind to ap_aqic()
>   vfio/ccw: Only pass in contiguous pages
>   vfio: Pass in starting IOVA to vfio_pin/unpin_pages API
>   vfio/ap: Change saved_pfn to saved_iova
>   vfio/ccw: Change pa_pfn list to pa_iova list
>   vfio: Rename user_iova of vfio_dma_rw()
>   vfio/ccw: Add kmap_local_page() for memcpy
>   vfio: Replace phys_pfn with pages for vfio_pin_pages()
> 
>  .../driver-api/vfio-mediated-device.rst       |   6 +-
>  arch/s390/include/asm/ap.h                    |   6 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  45 ++--
>  drivers/s390/cio/vfio_ccw_cp.c                | 195 +++++++++++-------
>  drivers/s390/crypto/ap_queue.c                |   2 +-
>  drivers/s390/crypto/vfio_ap_ops.c             |  54 +++--
>  drivers/s390/crypto/vfio_ap_private.h         |   4 +-
>  drivers/vfio/vfio.c                           |  54 ++---
>  drivers/vfio/vfio.h                           |   8 +-
>  drivers/vfio/vfio_iommu_type1.c               |  45 ++--
>  include/linux/vfio.h                          |   9 +-
>  11 files changed, 213 insertions(+), 215 deletions(-)
> 

Applied to vfio next branch for v5.20.  Thanks,

Alex

