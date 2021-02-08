Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B8312B53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 08:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BBB6E3AC;
	Mon,  8 Feb 2021 07:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EA46E3AC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 07:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612771074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l3awWSy5e6riy2O68pZN3zZ2GQr/MiEbcpjT4NcEwmQ=;
 b=D4Fb5jQmWrU6NIjr9g6vV3AG1jKVeQQ7MgdvuMm4k05Cyd2WehEpDJVUOPkV5BV8+KteAB
 VOy0WRxB2Gl07eciheT6ImYGjE6XJTGrp+qR2FaDpWn2z61XG95+DT4elpUC4OAM2WcIVB
 mo/LQ64j+ntdkrJwiJf3PhlAmUENtns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-XTrgxfrMO46qeBaXVqHbnw-1; Mon, 08 Feb 2021 02:57:52 -0500
X-MC-Unique: XTrgxfrMO46qeBaXVqHbnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6244B91284;
 Mon,  8 Feb 2021 07:57:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com
 [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D36F91A86F;
 Mon,  8 Feb 2021 07:57:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4195E18000AF; Mon,  8 Feb 2021 08:57:48 +0100 (CET)
Date: Mon, 8 Feb 2021 08:57:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YB1sRx1GrT8rATEg@phenom.ffwll.local>
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
Cc: dongwon.kim@intel.com, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, daniel.vetter@intel.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > +/* extract pages referenced by sgt */
> > +static struct page **extr_pgs(struct sg_table *sgt, int *nents, int *last_len)
> 
> Nack, this doesn't work on dma-buf. And it'll blow up at runtime when you
> enable the very recently merged CONFIG_DMABUF_DEBUG (would be good to test
> with that, just to make sure).

> Aside from this, for virtio/kvm use-cases we've already merged the udmabuf
> driver. Does this not work for your usecase?

udmabuf can be used on the host side to make a collection of guest pages
available as host dmabuf.  It's part of the puzzle, but not a complete
solution.

As I understand it the intended workflow is this:

  (1) guest gpu driver exports some object as dma-buf
  (2) dma-buf is imported into this new driver.
  (3) driver sends the pages to the host.
  (4) hypervisor uses udmabuf to create a host dma-buf.
  (5) host dma-buf is passed on.

And step (3) is the problematic one as this will not
work in case the dma-buf doesn't live in guest ram but
in -- for example -- gpu device memory.

Reversing the driver roles in the guest (virtio driver
allocates pages and exports the dma-buf to the guest
gpu driver) should work fine.

Which btw is something you can do today with virtio-gpu.
Maybe it makes sense to have the option to run virtio-gpu
in render-only mode for that use case.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
