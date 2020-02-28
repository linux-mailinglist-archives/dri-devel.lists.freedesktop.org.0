Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D38173557
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3B6EF28;
	Fri, 28 Feb 2020 10:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6D36EF28
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582885696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XczlIIYVTslwtdEpA7Nw4kJ3AXw7ycrbUCvKcsAsjN8=;
 b=Z/f5sYeKT1bQg0MpS9sX6nWURKBj4mAAL7Zvs4S6rElc1PMd92EaTG2Epw+7tpBgfJR8XK
 dMQfaDv2kAl9SbNq243b/QI2GY8ganM85r9M+z67giWr1eSjR28qAAfQZB4y1JRG7l7nD7
 YtNmJUSUG8DD1qnfIpqt1vqp98ljBoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-IxTKl2bVP6a7MneC64IZWw-1; Fri, 28 Feb 2020 05:28:12 -0500
X-MC-Unique: IxTKl2bVP6a7MneC64IZWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81BF1100550E;
 Fri, 28 Feb 2020 10:28:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ACF51001902;
 Fri, 28 Feb 2020 10:28:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7954117449; Fri, 28 Feb 2020 11:28:10 +0100 (CET)
Date: Fri, 28 Feb 2020 11:28:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC PATCH 0/8] *** Refactor struct virtgpu_object ***
Message-ID: <20200228102810.wdrkt43oova7zib3@sirius.home.kraxel.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
 <20200227072319.qimkovn7ncx35no5@sirius.home.kraxel.org>
 <CAAfnVB=hPaGUtq=w9X5DGnsCAAjMzP_dTNKQm-4hG5ORD=2r+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVB=hPaGUtq=w9X5DGnsCAAjMzP_dTNKQm-4hG5ORD=2r+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > struct virtgpu_object {
> 
> Yeah, using "virtgpu_" rather than "virtio_gpu" makes sense.

It wasn't my intention to suggest a rename.  It's just that the kernel
is a bit inconsistent here and I picked the wrong name here.  Most
places use virtio_gpu but some use virtgpu (file names, ioctl api).

> > struct virtgpu_object_hostmem {
> >         struct virtgpu_object base;
> >         {offset, range};
> >         (...)
> 
> I'm a kernel newbie, so it's not obvious to me why struct
> drm_gem_shmem_object would be a base class for struct
> virtgpu_object_hostmem?

I think it is easier to just continue using virtio_gpu_object in most
places and cast to virtio_gpu_object_{shmem,hostmem} only if needed.
Makes it easier to deal with common fields like hw_res_handle.

In the hostmem case we would simply not use the drm_gem_shmem_object
fields except for drm_gem_shmem_object.base (which is drm_gem_object).

> Side question: is drm_gem_object_funcs.vmap(..) /
> drm_gem_object_funcs.vunmap(..) even possible for hostmem?

Sure.  Using ioremap should work, after asking the host to map the
object at some location in the pci bar.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
