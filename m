Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AC5797B4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 12:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7D110EF9D;
	Tue, 19 Jul 2022 10:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5310EF9D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658226685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pulf+GTQxk5uin6YUOuCzeis2FI3CtuvGLbmZk5/0oY=;
 b=R0OpMP9R+L2z1KV6JNnZp5y83xucrlcwLXPF33J8OhQod8c+mfhBgn0N+ucXxbnN3nI8xC
 rPDc6SbqjeDQWMh9B6r/mk/ZO9BoFd/R7QyFGotFCvOEF6RSDa8WDAsajRE0SLYwSXuPsk
 VbdpxbtihJN+j9IPQYE0etelTkzpboE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-Quqbb-BjMrWIOgrgNYImrA-1; Tue, 19 Jul 2022 06:31:08 -0400
X-MC-Unique: Quqbb-BjMrWIOgrgNYImrA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AC8F8039A2;
 Tue, 19 Jul 2022 10:31:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0460492C3B;
 Tue, 19 Jul 2022 10:31:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 62DE21800098; Tue, 19 Jul 2022 12:31:06 +0200 (CEST)
Date: Tue, 19 Jul 2022 12:31:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
Message-ID: <20220719103106.gttro4tjjbis6pgg@sirius.home.kraxel.org>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
 <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
 <20220706071301.43fvbioka4iksqup@sirius.home.kraxel.org>
 <05a5608b-899d-71de-a7d7-406334c5604b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a5608b-899d-71de-a7d7-406334c5604b@collabora.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 10:22:52AM +0300, Dmitry Osipenko wrote:
> On 7/6/22 10:13, Gerd Hoffmann wrote:
> >   Hi,
> > 
> >> Gerd, thank you very much! It's was indeed unclear to me how to test the
> >> MMIO GPU, but yours variant with microvm works! I was looking for trying
> >> aarch64 in the past, but it also was unclear how to do it since there is
> >> no DT support for the VirtIO-GPU, AFAICS.
> > 
> > aarch64 uses acpi by default (can be disabled via 'qemu -no-acpi').
> > Not fully sure about arm(v7).
> > 
> > Even with DT it should work because DT only describes the virtio-mmio
> > 'slots', not the actual virtio devices.
> > 
> >> There is no virgl support because it's a virtio-gpu-device and not
> >> virtio-gpu-device-gl that is PCI-only in Qemu. Hence everything seems good.
> > 
> > It's named 'virtio-gpu-gl-device'
> 
> Ah, thanks again! Just quickly tested virtio-gpu-gl-device and
> everything works too for MMIO GPU on microvm, including virgl and Xorg
> (glamor).
> 
> [drm] features: +virgl +edid -resource_blob -host_visible
> [drm] features: -context_init
> [drm] number of scanouts: 1
> [drm] number of cap sets: 2
> [drm] cap set 0: id 1, max-version 1, max-size 308
> [drm] cap set 1: id 2, max-version 2, max-size 696
> [drm] Initialized virtio_gpu 0.1.0 0 for LNRO0005:01 on minor 0
> virtio-mmio LNRO0005:01: [drm] drm_plane_enable_fb_damage_clips() not called

Cool.  Havn't found the time to try s390x, so I'm taking that as good
enough test that we don't have any unnoticed dependencies on pci.

Queued up.  I'll go over a few more pending patches, and assuming no
issues show up in testing this should land in drm-misc-next in a few
hours.

take care,
  Gerd

