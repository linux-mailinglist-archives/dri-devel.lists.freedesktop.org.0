Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83368406F15
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 18:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5F36EA23;
	Fri, 10 Sep 2021 16:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D876EA23
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631290196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/69qBPEq+ZxoLUCx7D3iUMKDE0eou/SmM/DmrEsT78=;
 b=FN005Z4iU0lqZChXTlZ+78Ze9k/Sqaf9Oc4bzTV28KKla6lMOy1qrkGIAaSotlWG7KeZtN
 oh14wFh9gU6cZcLbioHR0uYj4zEK2qIri4Zepu4SF9T2X6Jg+KToEgdpb04S3JYVmq224U
 MPdh0awidgOGAAtHMviaQATtG/mXwN4=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-YtxE_Y3dMzKz-LrEkdwIYQ-1; Fri, 10 Sep 2021 12:09:55 -0400
X-MC-Unique: YtxE_Y3dMzKz-LrEkdwIYQ-1
Received: by mail-io1-f70.google.com with SMTP id
 n189-20020a6b8bc6000000b005b92c64b625so4105939iod.20
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 09:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=6/69qBPEq+ZxoLUCx7D3iUMKDE0eou/SmM/DmrEsT78=;
 b=zUkIVg8jULxl3aYXtEZCLefZNdG2Q2VAPa2mu8x8ork97RsMSs6EX8aO7VudVC308y
 QeJq1NJoSz3Abe8EXnq2paOfqKcIdT1JCV08N3S6CTMj9O+XhMXre/P+InFLBTXKIKGD
 wrz7JoSQm9rvXnAVk2HDT3upKi9W06ndumONbk6iFqB4Hw8APET8vwi8yYCKs1BotkZ7
 zd90Quf8+eZKYt8cnFrfQU1RXYR/Ede65Wqx22FnFWiojYpvMm2YDuDyhInuNYe6ZgOi
 kSc/hhFXhFzSEw/L51deuI4G6dCOfNr5N/xJslPx3RbK6aKzxHOzyKiUcTe5qSPNCCYw
 kYiw==
X-Gm-Message-State: AOAM533ywgZNBOTgjxXYL1HkpGTnJiixozmBoZn45QKd/H51G46sGNzQ
 uMF52+E9uhoPea+MU/zgP56d6Zv/EWho/Y1T5XenetUjn6ObRUdFQM3vguzH512u+MbJcHDugja
 cbgR+k2oV0gk/wsnfFOhhEvjvJB4T
X-Received: by 2002:a05:6e02:8f2:: with SMTP id
 n18mr6862648ilt.256.1631290194644; 
 Fri, 10 Sep 2021 09:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP8Y1TihJai/O/xPIO5JmfEsEgfV81tQvv38D8IJQRDSK+KLhAXgtQ59aQINI+2fQswrVxaA==
X-Received: by 2002:a05:6e02:8f2:: with SMTP id
 n18mr6862610ilt.256.1631290194398; 
 Fri, 10 Sep 2021 09:09:54 -0700 (PDT)
Received: from redhat.com (c-73-14-100-188.hsd1.co.comcast.net.
 [73.14.100.188])
 by smtp.gmail.com with ESMTPSA id y10sm2555019ilv.35.2021.09.10.09.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 09:09:54 -0700 (PDT)
Date: Fri, 10 Sep 2021 10:09:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christoph Hellwig <hch@infradead.org>, David Airlie <airlied@linux.ie>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Eric Farman
 <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Christoph
 Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 5/9] vfio/mdev: Consolidate all the device_api sysfs
 into the core code
Message-ID: <20210910100951.4da06602.alex.williamson@redhat.com>
In-Reply-To: <20210910133850.GT2505917@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <5-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <YTtLRmiXq+QtJ+la@infradead.org>
 <20210910133850.GT2505917@nvidia.com>
Organization: Red Hat
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

On Fri, 10 Sep 2021 10:38:50 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Fri, Sep 10, 2021 at 01:10:46PM +0100, Christoph Hellwig wrote:
> > On Thu, Sep 09, 2021 at 04:38:45PM -0300, Jason Gunthorpe wrote:  
> > > Every driver just emits a static string, simply feed it through the ops
> > > and provide a standard sysfs show function.  
> > 
> > Looks sensible.  But can you make the attribute optional and add a
> > comment marking it deprecated?  Because it really is completely useless.
> > We don't version userspace APIs, userspae has to discover new features
> > individually by e.g. finding new sysfs files or just trying new ioctls.  
> 
> To be honest I have no idea what side effects that would have..
> 
> device code search tells me libvirt reads it and stuffs it into some
> XML
> 
> Something called mdevctl touches it, feeds it into some JSON and
> other stuff..
> 
> qemu has some VFIO_DEVICE_API_* constants but it is all dead code
> 
> I agree it shouldn't have been there in the first place
> 
> Cornelia? Alex? Any thoughts?

It's not a version, it's a means for userspace to determine the basic
API for an mdev device without needing to go through the process of
creating a container, adding the group, setting an IOMMU type, opening
the device before being able to call VFIO_DEVICE_GET_INFO to determine
the API.  For example, it wouldn't make sense for libvirt to attach a
vfio-ccw device to a PCIe root port in a VM.  It's a means to say this
mdev device is a vfio-pci or that mdev device is a vfio-ccw.  If it were
optional, then management tools would have no basic idea how to attach
the device to a VM without gaining access to the device themselves.
Thanks,

Alex

