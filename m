Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928157B209
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39110E614;
	Wed, 20 Jul 2022 07:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE2810E614
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658303242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bu6xCyclso4xdC6iQFdBvv8TaQgKWEAQIznq+dBxwus=;
 b=Q+FxHFRz+IILgKiskhM8C1KTLwMC8JdQAbj7T7l0cLBdVCpmguNxCivTofD1IylZjIr9u5
 CSJtxkocPvmCFYxuy/BIfhpNXe4fqPn5LKIztsYyGod4884l8FyQ5CraG/jgAL99jHdkyO
 1AKBaougH/JOtnQme1gbhnQAHaOq6mk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-Lsd68fldM6mZTiXLsO4M8g-1; Wed, 20 Jul 2022 03:47:16 -0400
X-MC-Unique: Lsd68fldM6mZTiXLsO4M8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1092D1C08965;
 Wed, 20 Jul 2022 07:47:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB21440C128A;
 Wed, 20 Jul 2022 07:47:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
In-Reply-To: <20220719234419.GN4609@nvidia.com>
Organization: Red Hat GmbH
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <20220707153716.70f755ab.alex.williamson@redhat.com>
 <20220719234419.GN4609@nvidia.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Wed, 20 Jul 2022 09:47:12 +0200
Message-ID: <874jzcp6nz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 19 2022, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Jul 07, 2022 at 03:37:16PM -0600, Alex Williamson wrote:
>> On Mon,  4 Jul 2022 21:59:03 -0300
>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>> > diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
>> > index b49e2e9db2dc6f..09e0ce7b72324c 100644
>> > --- a/drivers/s390/cio/vfio_ccw_ops.c
>> > +++ b/drivers/s390/cio/vfio_ccw_ops.c
>> > @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>> >  	return ret;
>> >  }
>> >  
>> > -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
>> > -				  unsigned long action,
>> > -				  void *data)
>> > +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
>> >  {
>> >  	struct vfio_ccw_private *private =
>> > -		container_of(nb, struct vfio_ccw_private, nb);
>> > -
>> > -	/*
>> > -	 * Vendor drivers MUST unpin pages in response to an
>> > -	 * invalidation.
>> > -	 */
>> > -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
>> > -		struct vfio_iommu_type1_dma_unmap *unmap = data;
>> > -
>> > -		if (!cp_iova_pinned(&private->cp, unmap->iova))
>> > -			return NOTIFY_OK;
>> > +		container_of(vdev, struct vfio_ccw_private, vdev);
>> >  
>> > -		if (vfio_ccw_mdev_reset(private))
>> > -			return NOTIFY_BAD;
>> > +	/* Drivers MUST unpin pages in response to an invalidation. */
>> > +	if (!cp_iova_pinned(&private->cp, iova))
>> > +		return;
>> >  
>> > -		cp_free(&private->cp);
>> > -		return NOTIFY_OK;
>> > -	}
>> > +	if (vfio_ccw_mdev_reset(private))
>> > +		return;
>> >  
>> > -	return NOTIFY_DONE;
>> > +	cp_free(&private->cp);
>> >  }
>> 
>> 
>> The cp_free() call is gone here with [1], so I think this function now
>> just ends with:
>> 
>> 	...
>> 	vfio_ccw_mdev_reset(private);
>> }
>> 
>> There are also minor contextual differences elsewhere from that series,
>> so a quick respin to record the changes on list would be appreciated.
>> 
>> However the above kind of highlights that NOTIFY_BAD that silently gets
>> dropped here.  I realize we weren't testing the return value of the
>> notifier call chain and really we didn't intend that notifiers could
>> return a failure here, but does this warrant some logging or suggest
>> future work to allow a device to go offline here?  Thanks.
>
> It looks like no.
>
> If the FSM trapped in a bad state here, such as
> VFIO_CCW_STATE_NOT_OPER, then it means it should have already unpinned
> the pages and this is considered a success for this purpose

A rather pathological case would be a subchannel that cannot be
quiesced and does not end up being non-operational; in theory, the
hardware could still try to access the buffers we provided for I/O. I'd
say that is extremely unlikely, we might log it, but really cannot do
anything else.

>
> The return code here exists only to return to userspace so it can
> detect during a VFIO_DEVICE_RESET that the device has crashed
> irrecoverably.

Does it imply only that ("it's dead, Jim"), or can it also imply a
runaway device? Not that userspace can do much in any case.

>
> Thus just continuing to silently ignore it seems like the best thing.
>
> Jason

