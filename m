Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A925C3DF34B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 18:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14606E89A;
	Tue,  3 Aug 2021 16:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A486E89A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628009552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKtEVRvHNGT42iZNHToUtsFsYwSj6OAOl6LkhSWUXzQ=;
 b=JBp4GEaXvE8NidpofTnJY2Vym/Vcy9ZbqwbINf6rHnQXfnppGv6b2X767woTRFwtE5yHYq
 JcX+A/+rvaxL5CKimU4oqRkWP0ZoG9dh1twrtVvM/f68oTCU92AWt0/JOU+zcCh41uca5K
 8gVkcB4QvbVm9i423RzlnVnrnfKCurs=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-fPodRqtSNSugJI7uYrvc_Q-1; Tue, 03 Aug 2021 12:52:28 -0400
X-MC-Unique: fPodRqtSNSugJI7uYrvc_Q-1
Received: by mail-oi1-f198.google.com with SMTP id
 a14-20020a056808128eb029022053bcedd7so8880833oiw.17
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 09:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKtEVRvHNGT42iZNHToUtsFsYwSj6OAOl6LkhSWUXzQ=;
 b=nXvzjCQulVwyz/dipgdQk5Mw97i2BUNTxMyrnJD1yjrcD6g4qat/j9dgDtz4iNj+8Q
 AQv5KFn9h/STLWqeESBd+MN7rxYXv7df53o7ynDDXJTK/JTvAVROw15YAmG5VKWpeDGU
 /1Jw/blZz594WW6sidpj5OM0Tl+n28yZToURBsqj3ivjM1Jt9tmdamTfu2OqkuoeJreu
 sIJ8wSYPM0t+0of9gYhsiCazjPiSzGGZH6CwUJgya6tG+8VWp4DbK7M0iUru0Ipew+Gc
 jOr3mgdcsTpOB0Urx/12eTq69R3jQLie5VY+QNZPQue7QrjbqfKebbi7NqhAM6lEDu9D
 sU/A==
X-Gm-Message-State: AOAM532zWF4xlCmbhMOI9JxuB7sg8MoKyAA8+toNUgiBx3rg5bAm2Qk7
 vsw+mqUYoZ5k/eRx6NM0UzpP33hEbjzA7LEWFyQREsqOA/KFLAsAEkmhYo7e1Pb1D0iqYDY+Qoz
 x0ol3MR+zn+C9XZCxSvY5HcLCyY4b
X-Received: by 2002:a9d:62d4:: with SMTP id z20mr16205622otk.305.1628009548262; 
 Tue, 03 Aug 2021 09:52:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvKOEKD8L0w37wO357XcF+/U3bT3CXb+wzZAe9sXlApc1eVkv2cU2JtkoR7Kvj984JI4QXhg==
X-Received: by 2002:a9d:62d4:: with SMTP id z20mr16205581otk.305.1628009548040; 
 Tue, 03 Aug 2021 09:52:28 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id bd20sm2365330oib.1.2021.08.03.09.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:52:27 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:52:25 -0600
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
Subject: Re: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210803105225.2ee7dac2.alex.williamson@redhat.com>
In-Reply-To: <20210803164152.GC1721383@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <20210803103406.5e1be269.alex.williamson@redhat.com>
 <20210803164152.GC1721383@nvidia.com>
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

On Tue, 3 Aug 2021 13:41:52 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, Aug 03, 2021 at 10:34:06AM -0600, Alex Williamson wrote:
> > I think the vfio_pci_find_reset_target() function needs to be re-worked
> > to just tell us true/false that it's ok to reset the provided device,
> > not to anoint an arbitrary target device.  Thanks,  
> 
> Yes, though this logic is confusing, why do we need to check if any
> device needs a reset at this point? If we are being asked to reset
> vdev shouldn't vdev needs_reset?
> 
> Or is the function more of a 'synchronize pending reset' kind of
> thing?

Yes, the latter.  For instance think about a multi-function PCI device
such as a GPU.  The functions have dramatically different capabilities,
some might have function level reset abilities and others not.  We want
to be able to trigger a bus reset as the last device of the set is
released, no matter the order they're released and no matter the
capabilities of the device we're currently processing.  Thanks,

Alex

