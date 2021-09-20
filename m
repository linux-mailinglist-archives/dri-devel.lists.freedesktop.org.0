Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B7E41142E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 14:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8676E4CD;
	Mon, 20 Sep 2021 12:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92CE6E4CD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632140373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oqV0BaNYpr2I0JiEDB8GSwff72PtI0XltHh00N1EQLw=;
 b=TJmRbE0aM2d2ARxH/nVl9XKtj2W/KZwPzKwQ6KmYKUTOwMY3wA9Jz2TNlLP2Ycl0cUvFT0
 Kqp5t/hAAXeuPGAjJxV7B4NvLVM+voPlFPejWO1X2da2zC3Ac5hijO8dZu8h8iv3rSSPWy
 xDp3cJn4KwZQqycfnScMhloTa27dDok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-XPNszXZzMVGAp3Bhyu4PVQ-1; Mon, 20 Sep 2021 08:19:32 -0400
X-MC-Unique: XPNszXZzMVGAp3Bhyu4PVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 255DA835DE1;
 Mon, 20 Sep 2021 12:19:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3785D9DC;
 Mon, 20 Sep 2021 12:19:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 4/9] vfio/ccw: Make the FSM complete and synchronize
 it to the mdev
In-Reply-To: <4-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Organization: Red Hat GmbH
References: <4-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 20 Sep 2021 14:19:18 +0200
Message-ID: <87zgs7fni1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Thu, Sep 09 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> The subchannel should be left in a quiescent state unless the VFIO device
> FD is opened. When the FD is opened bring the chanel to active and allow
> the VFIO device to operate. When the device FD is closed then quiesce the
> channel.
>
> To make this work the FSM needs to handle the transitions to/from open and
> closed so everything is sequenced. Rename state NOT_OPER to BROKEN and use
> it wheneven the driver has malfunctioned. STANDBY becomes CLOSED. The
> normal case FSM looks like:
>     CLOSED -> IDLE -> PROCESS/PENDING* -> IDLE -> CLOSED
>
> With a possible branch off to BROKEN from any state. Once the device is in
> BROKEN it cannot be recovered other than be reloading the driver.

Hm, not sure whether it is a good idea to conflate "something went
wrong" and "device is not operational". In the latter case, we will
eventually get a removal of the css device when the common I/O layer has
processed the channel report for the subchannel; while the former case
could mean all kind of things, but the subchannel will likely stay
around. I think NOT_OPER was always meant to be a transitional state.

>
> Delete the triply redundant calls to
> vfio_ccw_sch_quiesce(). vfio_ccw_mdev_close_device() always leaves the
> subchannel quiescent. vfio_ccw_mdev_remove() cannot return until
> vfio_ccw_mdev_close_device() completes and vfio_ccw_sch_remove() cannot
> return until vfio_ccw_mdev_remove() completes. Have the FSM code take care
> of calling cp_free() when appropriate.

I remember some serialization issues wrt cp_free() etc. coming up every
now and than; that might need extra care (I'm taking a look.)

>
> Device reset becomes a CLOSE/OPEN sequence which now properly handles the
> situation if the device becomes BROKEN.
>
> Machine shutdown via vfio_ccw_sch_shutdown() now simply tries to close and
> leaves the device BROKEN (though arguably the bus should take care to
> quiet down the subchannel HW during shutdown, not the drivers)

The problem is that there is not really a uniform thing that can be done
for shutdown; e.g. we can quiesce and then disable I/O and EADM
subchannels, but CHSC subchannels cannot be quiesced.

