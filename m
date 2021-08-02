Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D33DD601
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 14:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3C36E054;
	Mon,  2 Aug 2021 12:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DCC6E054
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627908662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wAGb0/Z4wPD/t00pT7MzQ9nUgC0GYALOMMF7/kic3DI=;
 b=BGOLUhvdCDCBGGXWk63TrwM07qLjoICSbGuYnm0x3npNBzr+rPM0ghLCHyhNnFOeNou4jv
 7bN96Ftol0JNOfAXQ977eFCi59Ofg08FUcDa/tlpZJKEMi6eYbUErfMuc+YwKhKYOmmATE
 CT+Ps86zHwlKpSP79X+u6sioOnBBwUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-FqCGvq2aOn-P61k05Dyi-w-1; Mon, 02 Aug 2021 08:51:01 -0400
X-MC-Unique: FqCGvq2aOn-P61k05Dyi-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CD51006C88;
 Mon,  2 Aug 2021 12:50:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 355E11000324;
 Mon,  2 Aug 2021 12:50:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3D72B180039F; Mon,  2 Aug 2021 14:50:56 +0200 (CEST)
Date: Mon, 2 Aug 2021 14:50:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Tina Zhang <tina.zhang@intel.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
 <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > That sounds sensible to me.  Fence the virtio commands, make sure (on
> > the host side) the command completes only when the work is actually done
> > not only submitted.  Has recently been added to qemu for RESOURCE_FLUSH
> > (aka frontbuffer rendering) and doing the same for SET_SCANOUT (aka
> > pageflipping), then send vblank events to userspace on command
> > completion certainly makes sense.
> 
> Hm how does this all work? At least drm/virtio uses
> drm_atomic_helper_dirtyfb, so both DIRTYFB ioctl and atomic flips all end
> up in the same driver path for everything. Or do you just combine the
> resource_flush with the flip as needed and let the host side figure it all
> out? From a quick read of virtgpu_plane.c that seems to be the case ...

virtio_gpu_primary_plane_update() will send RESOURCE_FLUSH only for
DIRTYFB and both SET_SCANOUT + RESOURCE_FLUSH for page-flip, and I
think for the page-flip case the host (aka qemu) doesn't get the
"wait until old framebuffer is not in use any more" right yet.

So we'll need a host-side fix for that and a guest-side fix to switch
from a blocking wait on the fence to vblank events.

> Also to make this work we don't just need the fence, we need the timestamp
> (in a clock domain the guest can correct for ofc) of the host side kms
> driver flip completion. If you just have the fence then the jitter from
> going through all the layers will most likely make it unusable.

Well, there are no timestamps in the virtio-gpu protocol ...

Also I'm not sure they would be that helpful, any timing is *much* less
predictable in a virtual machine, especially in case the host machine is
loaded.

take care,
  Gerd

