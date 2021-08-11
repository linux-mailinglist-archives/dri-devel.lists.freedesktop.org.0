Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8323E8E4C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 12:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824786E114;
	Wed, 11 Aug 2021 10:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B426E104
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628676918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BI5vzL+WQhFoK9aWbzI6xFmh8bAxjrkTftn2LSBR450=;
 b=MqCBjGubIxhb50NK3wtY+3uKigl+e9s3ijqwjXjB+/NBlEUitJZJehscCejH0kNHOJN7yN
 WmkjgHT4kuJD515LeUo/CzkEtFYGQNZlJ87pTruKuBeiL80J8GVoqo1nwa+rTV0yAq8qAa
 OXLOU03GH4N8KTi+E6eD8knWTmNBw5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-dPnXXrX1P8eVelAA0CPV2Q-1; Wed, 11 Aug 2021 06:15:15 -0400
X-MC-Unique: dPnXXrX1P8eVelAA0CPV2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 885A9C73A0;
 Wed, 11 Aug 2021 10:15:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 824F55D740;
 Wed, 11 Aug 2021 10:14:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>, Eric
 Farman <farman@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>, Leon
 Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v4 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
In-Reply-To: <9-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
Organization: Red Hat GmbH
References: <9-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 11 Aug 2021 12:14:56 +0200
Message-ID: <87wnosuw2n.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Thu, Aug 05 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> vfio_pci_try_bus_reset() is triggering a reset of the entire_dev set if
> any device within it has accumulated a needs_reset. This reset can only be
> done once all of the drivers operating the PCI devices to be reset are in
> a known safe state.
>
> Make this clearer by directly operating on the dev_set instead of the
> vfio_pci_device. Rename the function to vfio_pci_dev_set_try_reset().
>
> Use the device list inside the dev_set to check that all drivers are in a
> safe state instead of working backwards from the pci_device.
>
> The dev_set->lock directly prevents devices from joining/leaving the set,
> or changing their state, which further implies the pci_device cannot
> change drivers or that the vfio_device be freed, eliminating the need for
> get/put's.
>
> If a pci_device to be reset is not in the dev_set then the reset cannot be
> used as we can't know what the state of that driver is. Directly measure
> this by checking that every pci_device is in the dev_set - which
> effectively proves that VFIO drivers are attached to everything.
>
> Remove the odd interaction around vfio_pci_set_power_state() - have the
> only caller avoid its redundant vfio_pci_set_power_state() instead of
> avoiding it inside vfio_pci_dev_set_try_reset().
>
> This restructuring corrects a call to pci_dev_driver() without holding the
> device_lock() and removes a hard wiring to &vfio_pci_driver.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci.c | 182 +++++++++++++++++-------------------
>  1 file changed, 86 insertions(+), 96 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

