Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A240F6F8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 13:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B376EC2F;
	Fri, 17 Sep 2021 11:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4834E6EC2F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631879967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZP54lIQNa3SFVPU1L+sJMJyXHw+9iH2dBIPo6OwbrY=;
 b=ANYE11v1xiKUCWRO3A/bMIeiGsP4/AnvfwE6IEsfsJoTHYg0IRj4NV8tjPIL6CntxnlrIp
 e6eWgwO+fGYGnravCBneF7lK9oDRwX4FUXrX+zxIMk/Rx4gPYYUSdPGCtuz1mq1C8cWzxm
 NBJ9uhu/U/4h7ljeJZxleE0RtEvQHdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-jftDKVi4NEuTuslHgpAfkg-1; Fri, 17 Sep 2021 07:59:24 -0400
X-MC-Unique: jftDKVi4NEuTuslHgpAfkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F02110168C4;
 Fri, 17 Sep 2021 11:59:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E73B5D6D5;
 Fri, 17 Sep 2021 11:59:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Eric Farman <farman@linux.ibm.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Christoph
 Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
In-Reply-To: <20210914133618.GD4065468@nvidia.com>
Organization: Red Hat GmbH
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
 <20210913192407.GZ2505917@nvidia.com>
 <6f55044373dea4515b831957981bbf333e03de59.camel@linux.ibm.com>
 <20210914133618.GD4065468@nvidia.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 17 Sep 2021 13:59:16 +0200
Message-ID: <87h7ejh0q3.fsf@redhat.com>
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

On Tue, Sep 14 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Sep 13, 2021 at 04:31:54PM -0400, Eric Farman wrote:
>> > I rebased it and fixed it up here:
>> > 
>> > https://github.com/jgunthorpe/linux/tree/vfio_ccw
>> > 
>> > Can you try again?
>> 
>> That does address the crash, but then why is it processing a BROKEN
>> event? Seems problematic. 
>
> The stuff related to the NOT_OPER looked really wonky to me. I'm
> guessing this is the issue - not sure about the pmcw.ena either..

[I have still not been able to digest the whole series, sorry.]

>
> diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
> index 5ea392959c0711..0d4d4f425befac 100644
> --- a/drivers/s390/cio/vfio_ccw_fsm.c
> +++ b/drivers/s390/cio/vfio_ccw_fsm.c
> @@ -380,29 +380,19 @@ static void fsm_open(struct vfio_ccw_private *private,
>  	spin_unlock_irq(sch->lock);
>  }
>  
> -static void fsm_close(struct vfio_ccw_private *private,
> -		      enum vfio_ccw_event event)
> +static int flush_sch(struct vfio_ccw_private *private)
>  {
>  	struct subchannel *sch = private->sch;
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	int iretry, ret = 0;
>  
> -	spin_lock_irq(sch->lock);
> -	if (!sch->schib.pmcw.ena)
> -		goto err_unlock;
> -	ret = cio_disable_subchannel(sch);
> -	if (ret != -EBUSY)
> -		goto err_unlock;
> -
>  	iretry = 255;
>  	do {
> -
>  		ret = cio_cancel_halt_clear(sch, &iretry);
> -
>  		if (ret == -EIO) {
>  			pr_err("vfio_ccw: could not quiesce subchannel 0.%x.%04x!\n",
>  			       sch->schid.ssid, sch->schid.sch_no);
> -			break;
> +			return ret;

Looking at this, I wonder why we had special-cased -EIO -- for -ENODEV
we should be done as well, as then the device is dead and we do not need
to disable it.

>  		}
>  
>  		/*
> @@ -413,13 +403,28 @@ static void fsm_close(struct vfio_ccw_private *private,
>  		spin_unlock_irq(sch->lock);
>  
>  		if (ret == -EBUSY)
> -			wait_for_completion_timeout(&completion, 3*HZ);
> +			wait_for_completion_timeout(&completion, 3 * HZ);
>  
>  		private->completion = NULL;
>  		flush_workqueue(vfio_ccw_work_q);
>  		spin_lock_irq(sch->lock);
>  		ret = cio_disable_subchannel(sch);
>  	} while (ret == -EBUSY);
> +	return ret;
> +}
> +
> +static void fsm_close(struct vfio_ccw_private *private,
> +		      enum vfio_ccw_event event)
> +{
> +	struct subchannel *sch = private->sch;
> +	int ret;
> +
> +	spin_lock_irq(sch->lock);
> +	if (!sch->schib.pmcw.ena)
> +		goto err_unlock;
> +	ret = cio_disable_subchannel(sch);

cio_disable_subchannel() should be happy to disable an already disabled
subchannel, so I guess we can just walk through this and end up in
CLOSED state... unless entering with !ena actually indicates that we
messed up somewhere else in the state machine. I still need to find time
to read the patches.

> +	if (ret == -EBUSY)
> +		ret = flush_sch(private);
>  	if (ret)
>  		goto err_unlock;
>  	private->state = VFIO_CCW_STATE_CLOSED;

