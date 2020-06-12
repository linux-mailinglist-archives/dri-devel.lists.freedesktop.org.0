Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451881F769A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 12:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8810F6E917;
	Fri, 12 Jun 2020 10:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF136E917
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591957017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gXPkv45EVfjIif3puGpbyAR3v4morx5HdPbm+nUFijQ=;
 b=AICwR5PNgAQnt74v2pzBS3beRD1pxUpH+JoDoyMpOxgJ7XecWkgGyJggvL2N5elxEb+/p0
 BQ9KDxuOQr/BjCF7BnrYNZRXxO+nUzNNIP2X1qYtJWlzpCNtEhhKMqP1Tn3yqsZMvAlaWl
 D6xYdn0kPqozJFwUd8JbimKdFnP/sSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-5gal6y7VNuCsNT45Izd8mQ-1; Fri, 12 Jun 2020 06:16:53 -0400
X-MC-Unique: 5gal6y7VNuCsNT45Izd8mQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B28B107ACCD;
 Fri, 12 Jun 2020 10:16:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 758D77E59F;
 Fri, 12 Jun 2020 10:16:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8BD8F16E16; Fri, 12 Jun 2020 12:16:50 +0200 (CEST)
Date: Fri, 12 Jun 2020 12:16:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
Message-ID: <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
References: <20200612013625.547-1-gurchetansingh@chromium.org>
 <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
MIME-Version: 1.0
In-Reply-To: <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 11:47:55AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.20 um 03:36 schrieb Gurchetan Singh:
> > This is useful for the next patch.  Also, should we only unmap the
> > amount entries that we mapped with the dma-api?
> 
> It looks like you're moving virtio code into shmem.

Well, not really.

virtio has -- for historical reasons -- the oddity that it may or may
not need to dma_map resources, depending on device configuration.
Initially virtio went with "it's just a vm, lets simply operate on
physical ram addresses".  That shortcut turned out to be a bad idea
later on, especially with the arrival of iommu emulation support in
qemu.  But we couldn't just scratch it for backward compatibility
reasons.  See virtio_has_iommu_quirk().

This just allows to enable/disable dma_map, I guess to fix some fallout
from recent shmem helper changes (Gurchetan, that kind of stuff should
be mentioned in cover letter and commit messages).

I'm not sure virtio actually needs that patch though.  I *think* doing
the dma_map+dma_unmap unconditionally, but then ignore the result in
case we don't need it should work.  And it shouldn't be a horrible
performance hit either, in case we don't have a (virtual) iommu in the
VM dma mapping is essentially a nop ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
