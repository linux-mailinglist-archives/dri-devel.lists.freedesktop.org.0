Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEF515590
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAAD10FA6F;
	Fri, 29 Apr 2022 20:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD9110FA6F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651264105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8HsfkpqhssnZoIsPQ1O3oVRAyXbkapxW4GnxH0gSv4=;
 b=OXyk+ZlA2xofIDLIpoh4YJ+rLWv81XKCIyy/IB39BgGEe31RKH4WNLCYpEDcIa1ShrAN2n
 Df/3G8VM/wCkyyVQ1ZiPCi2WCGcyyQGgVCm4XzcCAkmyd+sygyQJLNjtrtFnsUkDESUdmC
 f8FSupPV971Lb1Wl1zABlpBDfU5IZDE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-B-hhozY9PhyQMP1p_HnfKA-1; Fri, 29 Apr 2022 16:28:24 -0400
X-MC-Unique: B-hhozY9PhyQMP1p_HnfKA-1
Received: by mail-io1-f72.google.com with SMTP id
 204-20020a6b01d5000000b00657bb7a0f33so5328398iob.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8HsfkpqhssnZoIsPQ1O3oVRAyXbkapxW4GnxH0gSv4=;
 b=VZwee8K19jNu85OnYWK6D5ZC40UCZoYrMsfZM3WiUJfZ59+h9J6zdOZp8FvlKvknuv
 dDpXXmjnq+UPPz8KpPXu+zlGM6/Cr4P97BlsSxbFNHvJizyAcZmTdkvCeE3jQ3LmnxuZ
 GuZHTKi0LOTMLEpq6tAe63GeeO2UXcQIzi8LMFxrzl9psTJmQifvvc5IfGWz+0FqDbzA
 H6ZnUpfhrPXyFzmr59+gOH2FiGhjbiG+GEmgm4iztcyf3a6LkumHy9OOy+LYdPVz56MZ
 jkNj+rgFa3qP1UZmVZgupj7IgCb5FuQTWuog9XGEOPYh3fV7IDHXdTMUhEIxhWiAaSVS
 ZUCw==
X-Gm-Message-State: AOAM533M8Jg2W6E7vRmqB1DzCVnJ8Z173/uoCk5vQniGi7UnL/TtXV/Q
 ZOVk0cwHjY4r1abWx3sQdB3PxVO+ZX1mfvCGmjHAmDtwQU3QqcUMl1iPWKDN821hp7T4tJ1kFv5
 9Jgwu2jdQOik0kfYPyQOdhbjzVp/I
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr445922iog.108.1651264103324; 
 Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXw055Zf6CAZcffMOqFXVe3D8deItwuTS9dyUJRlHujGyFKq6cxPYeLOoiZHbK09XyaEEw5w==
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr445889iog.108.1651264103032; 
 Fri, 29 Apr 2022 13:28:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j7-20020a02cb07000000b0032b3a7817b2sm836302jap.118.2022.04.29.13.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:28:22 -0700 (PDT)
Date: Fri, 29 Apr 2022 14:28:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Message-ID: <20220429142820.6afe7bbe.alex.williamson@redhat.com>
In-Reply-To: <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022 13:28:38 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> When the open_device() op is called the container_users is incremented and
> held incremented until close_device(). Thus, so long as drivers call
> functions within their open_device()/close_device() region they do not
> need to worry about the container_users.
> 
> These functions can all only be called between open_device() and
> close_device():
> 
>   vfio_pin_pages()
>   vfio_unpin_pages()
>   vfio_dma_rw()
>   vfio_register_notifier()
>   vfio_unregister_notifier()
> 
> Eliminate the calls to vfio_group_add_container_user() and add
> vfio_assert_device_open() to detect driver mis-use.

A comment here explaining that decrementing open_count is pushed until
after close_device to support this feature would help to explain the
somewhat subtle change in vfio_group_get_device_fd().

Otherwise the series looks ok with fixes noted by previous reviews.
Thanks,

Alex

