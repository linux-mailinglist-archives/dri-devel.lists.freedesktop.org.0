Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D542016F868
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 08:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855A06E121;
	Wed, 26 Feb 2020 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924686E121
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582701361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6V8jMfD5K+m34rSIZMhj7w0BXefCLXIj0QJQvTNW550=;
 b=DQszsnK5NtJoDM52YnXAxwI4cERQX6iCZdd+jmswWn35GxA27GrqOy1MhHiP04+7jf56r6
 ceAlTJX4mhFuv5B7LYDY0lNpuRFlp9zb5M6hqa/13kzOrRRea2Vu8JRvPMJ/CQvxAYryrA
 BR6jEEVJ/gkLDVPuNLcSdOUURA1JVcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-9VraclzpOEKse3s5jU7HEw-1; Wed, 26 Feb 2020 02:15:19 -0500
X-MC-Unique: 9VraclzpOEKse3s5jU7HEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FBC5190B2A8;
 Wed, 26 Feb 2020 07:15:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC195C28C;
 Wed, 26 Feb 2020 07:15:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84D5917506; Wed, 26 Feb 2020 08:15:17 +0100 (CET)
Date: Wed, 26 Feb 2020 08:15:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: lepton <ytht.net@gmail.com>
Subject: Re: RFC: drm/virtio: Dummy virtio GPU
Message-ID: <20200226071517.4cbgfcaeknmmvyo3@sirius.home.kraxel.org>
References: <20200224230155.120894-1-ytht.net@gmail.com>
 <20200225102928.vnaamhecu5tnoaq2@sirius.home.kraxel.org>
 <CALqoU4wtYQtLg=wVkepP29wYZYKKVx3PA1Nytfy+fZdqrp-_Jg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALqoU4wtYQtLg=wVkepP29wYZYKKVx3PA1Nytfy+fZdqrp-_Jg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > No.
> >
> > First, what is wrong with vkms?
> The total lines of vkms driver is 1.2k+.

Which is small for a drm driver.

> I think it doesn't work along
> itself to provide things like  mmap on prime fd? (I tried it months
> ago).

Seems vkms only supports prime import, not prime export.
Maybe vgem works for you?

> And more, my "dummy virtio"
> device actually doesn't really depends on drm system so it's easier to
> back port to old kernel.

It depends on the virtio driver, which in turn *does* depend on drm
system.  So you have a indirect instead of a direct dependency.  I still
don't see the point ...

> > Second, if you really want something simple with the minimal set of drm
> > features possible you can write a rather small but still self-contained
> > driver when using all the drm helpers (shmem, simple display pipe) we
> > have these days.  Copy cirrus, strip it down: drop modesetting code,
> > drop blit-from-shmem-to-vram code, drop pci probing.  Maybe add module
> > options for max/default video mode.  Done.
> I need features like prime export/import, mmap on prime fd etc.

The shmem helpers support that just fine.

> And I'd like the code could work on different kernel version. So if go
> with this ways, the actually add more maintain cost in the long term?

Depends on which kernel version you need.  Backporting to 5.4-lts should
be easy, 4.4-lts lacks alot of the drm helpers though.

> > What is the use case btw?
> We have images works well under qemu + virtio vga, we'd like to run
> these images on public cloud service like Google GCE directly.

What do these images need a drm device for?
It seems not to be hardware-accelerated rendering.
It also seems not to be a virtual display.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
