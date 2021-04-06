Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3697E355C46
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598316E8A3;
	Tue,  6 Apr 2021 19:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863B06E8A3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617737892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJhQUKqEV20liVnsgwrQmVyuB9gKm/Ks+xvFCx56LWo=;
 b=IsmWkyrFdqgIp635jhPURHVjUnh67zM4d2jBkwDQKrwS3vN310A1RCSQ8SQIzeag0AYngB
 /QBJQaEuzzwNTLIVhNLbiFABgRV+mfnw4U/MgtVWLsjcOmAm7cPK+4Lvj770wvI/ax7ifS
 bC9WpmW/rBBqBUafmQvvOcBek0aPMy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-y4Zh0538PROB9k8ijir18w-1; Tue, 06 Apr 2021 15:38:10 -0400
X-MC-Unique: y4Zh0538PROB9k8ijir18w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 466FC108BD06;
 Tue,  6 Apr 2021 19:38:08 +0000 (UTC)
Received: from omen (ovpn-112-85.phx2.redhat.com [10.3.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FD7A19D61;
 Tue,  6 Apr 2021 19:38:06 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:38:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] vfio/pci: remove vfio_pci_nvlink2
Message-ID: <20210406133805.715120bd@omen>
In-Reply-To: <20210326061311.1497642-2-hch@lst.de>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210326061311.1497642-2-hch@lst.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021 07:13:10 +0100
Christoph Hellwig <hch@lst.de> wrote:

> This driver never had any open userspace (which for VFIO would include
> VM kernel drivers) that use it, and thus should never have been added
> by our normal userspace ABI rules.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/vfio/pci/Kconfig            |   6 -
>  drivers/vfio/pci/Makefile           |   1 -
>  drivers/vfio/pci/vfio_pci.c         |  18 -
>  drivers/vfio/pci/vfio_pci_nvlink2.c | 490 ----------------------------
>  drivers/vfio/pci/vfio_pci_private.h |  14 -
>  include/uapi/linux/vfio.h           |  38 +--
>  6 files changed, 4 insertions(+), 563 deletions(-)
>  delete mode 100644 drivers/vfio/pci/vfio_pci_nvlink2.c

Hearing no objections, applied to vfio next branch for v5.13.  Thanks,

Alex

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
