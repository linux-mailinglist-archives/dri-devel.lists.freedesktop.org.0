Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863033E9AB5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 00:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403936E0FE;
	Wed, 11 Aug 2021 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3097F6E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628719714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZIuQpOSakjR1F0O38drzzzVlj+CamxwCqQpO6BT/Y8=;
 b=C+oXDkCj8FB37WTeRKaYp94Nxfp5BA7R84EVc+HhO51mNax9TinPCrsSiIJ0wOFlLA1Mio
 oLTGaqJAniL1FzCVpTY8az5yd20QOjbgisdN3EsA6bsfMfIugknsrQeSXl7MDkSkzMTeTh
 crlNa1/X1G/SCk/qCHxVRv6K4wmiQbo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-0Zy5y0CTO8OvsCyAAE7HQA-1; Wed, 11 Aug 2021 18:08:33 -0400
X-MC-Unique: 0Zy5y0CTO8OvsCyAAE7HQA-1
Received: by mail-oi1-f199.google.com with SMTP id
 bf27-20020a056808191bb029026778435932so1977059oib.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 15:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZIuQpOSakjR1F0O38drzzzVlj+CamxwCqQpO6BT/Y8=;
 b=Vc5nQoBCNTLIRW2uAUFJkE4/2eRWHaH8A5CDJBSfVwTmBr9TJvww1jFh9lX/Va/wSR
 WLIptRQ0fo8vDEw0KICfEfkf1jD8SOFigElbcxcvArGdsA8vhUZZG0rCE1oPeM05+oKD
 SMtx6HPC3y/0u31r/X0M9kKx5avcIjOoitF2gBXxceab4DzACTYgPbPqZ5JQMzP/KCp+
 jnsHEEYPKB9KJ842take49JlvRXNnIi6F+BOGbCEXP7XUeZm5Xx31VLOxgjnF8qXssRV
 M4zLy2dxbTYC/GOcP395vWEsxqhhltZ/e+qYSW41dSsG+Yp3zxHKJxAyfwg+24vJhT3I
 6Rlw==
X-Gm-Message-State: AOAM531lncezObc3/W06kYJyLffhyOPqVWP1f5Un0fwNsDsIfwNA2ivY
 6d/p8iBCYusI8USKpOymZXY2jNjvQE6Cwwy/cOGQ++r92KJByQdD57mLYSrVFQzNvIExGl37P6Q
 5ssNfKuVV3NCRRmSEfvcZlY48DrS2
X-Received: by 2002:a05:6808:1807:: with SMTP id
 bh7mr818933oib.157.1628719712959; 
 Wed, 11 Aug 2021 15:08:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHW0oiASQt39stuFDakeRHLwQGeA6uybDAE7Lm1gE17v8QC+IkptQlxOrOWXX4IHmLzUHZ9Q==
X-Received: by 2002:a05:6808:1807:: with SMTP id
 bh7mr818885oib.157.1628719712733; 
 Wed, 11 Aug 2021 15:08:32 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id w9sm119012ooe.15.2021.08.11.15.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 15:08:32 -0700 (PDT)
Date: Wed, 11 Aug 2021 16:08:30 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>, Eric
 Farman <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>, "Raj, Ashok"
 <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>, Leon Romanovsky
 <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas
 <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v4 00/14] Provide core infrastructure for managing
 open/release
Message-ID: <20210811160830.0c17b085.alex.williamson@redhat.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  5 Aug 2021 22:18:56 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> This is in support of Max's series to split vfio-pci. For that to work the
> reflck concept embedded in vfio-pci needs to be sharable across all of the
> new VFIO PCI drivers which motivated re-examining how this is
> implemented.
> 
> Another significant issue is how the VFIO PCI core includes code like:
> 
>    if (pci_dev_driver(pdev) != &vfio_pci_driver)
> 
> Which is not scalable if there are going to be multiple different driver
> types.
> 
> This series takes the approach of moving the "reflck" mechanism into the
> core code as a "device set". Each vfio_device driver can specify how
> vfio_devices are grouped into the set using a key and the set comes along
> with a set-global mutex. The core code manages creating per-device set
> memory and associating it with each vfio_device.
> 
> In turn this allows the core code to provide an open/close_device()
> operation that is called only for the first/last FD, and is called under
> the global device set lock.
> 
> Review of all the drivers show that they are either already open coding
> the first/last semantic or are buggy and missing it. All drivers are
> migrated/fixed to the new open/close_device ops and the unused per-FD
> open()/release() ops are deleted.
> 
> The special behavior of PCI around the bus/slot "reset group" is recast in
> terms of the device set which conslidates the reflck, eliminates two
> touches of pci_dev_driver(), and allows the reset mechanism to share
> across all VFIO PCI drivers. PCI is changed to acquire devices directly
> from the device set instead of trying to work backwards from the struct
> pci_device.
> 
> Overall a few minor bugs are squashed and quite a bit of code is removed
> through consolidation.
> 
> v4:
>  - Fix use-after-free typo in mbochs error unwind
>  - Allow mdevs to work when they don't have open/release ops, for
>    bisect-ability
>  - Redo the vfio_pci_try_bus_reset() patch, make it dev_set centric
>  - Change VFIO_DEVICE_PCI_HOT_RESET to align with the new
>    vfio_pci_try_bus_reset() design

Applied to vfio next branch for v5.15 with Connie and Christoph's
additional Reviewed-bys.  Thanks,

Alex

