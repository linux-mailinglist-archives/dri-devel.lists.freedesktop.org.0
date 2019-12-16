Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7011FF60
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0EB6E149;
	Mon, 16 Dec 2019 08:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D19E6E130
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576483646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MChTIXWynUE7agqmCTTzipxpECKLcpr2EozeeZ4no+M=;
 b=hGkwytpCTRmLYwq1/oT1hCgUgRjCDPUfJ62kN5jtJu6mRJORtItXkLq3msU9yANu/T4/Z4
 k7nwsdKpGDzYpsTBhfqBx7ZW72A8msbIJH45bw+TvVwS8T9A+WDJ5f1QrnRpp+MVjJDU8r
 4OTstbhezk07g5U2qgPqHXmV21u6VEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-hDeFmvPqPzq69MVWDW9Clg-1; Mon, 16 Dec 2019 03:07:21 -0500
X-MC-Unique: hDeFmvPqPzq69MVWDW9Clg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39E01800D7B;
 Mon, 16 Dec 2019 08:07:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.36.118.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30B4B26190;
 Mon, 16 Dec 2019 08:07:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DF82783F; Mon, 16 Dec 2019 09:07:19 +0100 (CET)
Date: Mon, 16 Dec 2019 09:07:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, gurchetansingh@chromium.org
Subject: Re: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
Message-ID: <20191216080719.2ahwtraxofydb2db@sirius.home.kraxel.org>
References: <20191211081810.20079-1-kraxel@redhat.com>
 <20191211081810.20079-2-kraxel@redhat.com>
 <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
 <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
 <20191211123635.GY624164@phenom.ffwll.local>
 <20191211131830.iz3a2o4xzmmkjsp7@sirius.home.kraxel.org>
 <20191213095959.GA624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213095959.GA624164@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > I suspect for imported dma-bufs we should leave the mmap() to the
> > exporter instead of pulling the pages out of the sgt and map them
> > ourself.
> 
> Uh yes. If we still do that, then yes very much we shouldn't.

Looking again.  drm_gem_dumb_map_offset() throws an error in case
obj->import_attach is not NULL.  So the udl mmap code should not see
imported buffers in the first place, unless I missed some detail ...

> > Hmm.  Ok.  I guess I'm not going to try solve all that properly just for
> > the little virtio fix.
> > 
> > Just curious:  How do you tell your hardware?  Are there bits for that
> > in the gtt, simliar to the caching bits in the x86 page tables?
> 
> Brace for contact ...
> 
> - on amdgpu it's a bit in the gpu pagetable. I think (but not sure, not an
>   expert on these chips) that's the only way.
> 
> - on i915 it's a also a bit in the gpu pagetables, but userspace can
>   override the caching/coherency mode on a per-texture/render target/*BO
>   level in the command stream.
> 
> This is why gpus and dma-api don't mix well, since dma-api's goal is to
> hide all this even from the driver. gpus otoh leak it all the way to
> userspace. The trouble is as old as AGP from 1999 or so, I've become
> somewhat cynic at trying to fix this for real and not just with hacks. The
> disconnect between what we need and what dma-api kernel people want to
> give us is too big to bridge it seems.

Phew.  For vulkan support in virtio-gpu we are going to throw virtual
machines into that mix.  Fun ahead I guess ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
