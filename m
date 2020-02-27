Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE8171563
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 11:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EAD6E595;
	Thu, 27 Feb 2020 10:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9666E595
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582801013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DYpy6RJTXglkEu2oTovR+MB3265JeXuBkFoSO+vFOFs=;
 b=FNNkRHSBPyxwq5Ll7qEgjvrdTfohJOvFZxl9s1TlF2y2NRSrue2G+hs9JerYEHQq21DkIQ
 2KRBVe2xdtRUEFY3/eWqA4ypxSE27TeOChxRM5v0j4Xfs4iHoVKs/xU+twW9X8PrBbHo0j
 XRKprR69Kno55mL3jpqR/kPFlZi9I4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-EQVjFHmoPeexcX8WUqiLWQ-1; Thu, 27 Feb 2020 05:56:49 -0500
X-MC-Unique: EQVjFHmoPeexcX8WUqiLWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E7E9107ACC7;
 Thu, 27 Feb 2020 10:56:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 999838D540;
 Thu, 27 Feb 2020 10:56:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C6B561744A; Thu, 27 Feb 2020 11:56:43 +0100 (CET)
Date: Thu, 27 Feb 2020 11:56:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
Message-ID: <20200227105643.h4klc3ybhpwv2l3x@sirius.home.kraxel.org>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
 <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 gurchetansingh@chromium.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> I think it might be safe for some integrated graphics where the driver
> maintainers can guarantee that it's safe on all particular processors used
> with that driver, but then IMO it should be moved out to those drivers.
> 
> Other drivers needing write-combine shouldn't really use shmem.
> 
> So again, to fix the regression, could we revert 0be895893607f ("drm/shmem:
> switch shmem helper to &drm_gem_object_funcs.mmap") or does that have other
> implications?

This patch isn't a regression.  The old code path has the
pgprot_writecombine() call in drm_gem_mmap_obj(), so the behavior
is the same before and afterwards.

But with the patch in place we can easily have shmem helpers do their
own thing instead of depending on whatever drm_gem_mmap_obj() is doing.
Just using cached mappings unconditionally would be perfectly fine for
virtio-gpu.

Not sure about the other users though.  I'd like to fix the virtio-gpu
regression (coming from ttm -> shmem switch) asap, and I don't feel like
changing the behavior for other drivers in 5.6-rc is a good idea.

So I'd like to push patches 1+2 to -fixes and sort everything else later
in -next.  OK?

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
