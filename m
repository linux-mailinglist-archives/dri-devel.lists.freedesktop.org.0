Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D778D16A497
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 12:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87D38902A;
	Mon, 24 Feb 2020 11:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1C68902A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582542392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjHLuBJWLYLponRRJslGO66PUxG59OTJieH+3DkUX9Y=;
 b=eEpwU6mkmkElOemdmzle7wXYgvLV0gMyuJb21bmXbAfERpWcpKqWhxpJAHEtclEShvtxui
 IlOevxtUFKN4fk+Ve3AA/YGLHwYU/l0v99wEViJf2zWjoaATSU0GVtVXY33kXTSZd/k0q1
 z/bd5OloxMW8tROvDVRy9CMpbLdjUGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-DfLy9RKtPoi1uzbX6S4irQ-1; Mon, 24 Feb 2020 06:06:28 -0500
X-MC-Unique: DfLy9RKtPoi1uzbX6S4irQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F708017CC;
 Mon, 24 Feb 2020 11:06:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2825E27184;
 Mon, 24 Feb 2020 11:06:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C0E81747F; Mon, 24 Feb 2020 12:06:26 +0100 (CET)
Date: Mon, 24 Feb 2020 12:06:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 4/4 v6] drm/virtio: enqueue virtio_gpu_create_context
 after the first 3D ioctl
Message-ID: <20200224110626.ofk35vmwxz2ldomr@sirius.home.kraxel.org>
References: <20200219223423.53319-1-gurchetansingh@chromium.org>
 <20200219223423.53319-4-gurchetansingh@chromium.org>
 <CAPaKu7QakQzeT3YrP5ctGfkAToNpq+E+qZ9pq5j-VOgTE4KYvg@mail.gmail.com>
 <CAAfnVBkGYX6=eaViT0Qw0gecd9DJHOURaAZSvL6OVVkgE=+f2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBkGYX6=eaViT0Qw0gecd9DJHOURaAZSvL6OVVkgE=+f2A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 04:54:02PM -0800, Gurchetan Singh wrote:
> On Fri, Feb 21, 2020 at 3:06 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > On Wed, Feb 19, 2020 at 2:34 PM Gurchetan Singh
> > <gurchetansingh@chromium.org> wrote:
> > >
> > > For old userspace, initialization will still be implicit.
> > >
> > > For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
> > > the first 3D ioctl.
> > >
> > > v3: staticify virtio_gpu_create_context
> > >     remove notify to batch vm-exit
> > > v6: Remove nested 3D checks (emil.velikov):
> > >       - unify 3D check in resource create
> > >       - VIRTIO_GPU_CMD_GET_CAPSET is listed as a 2D ioctl, added a
> > >         3D check there.
> > I missed this change.  Why do we need a context to get capsets?  Is
> > this a workaround or something?
> 
> No, don't need a context to get a capset.  The patch tries to create a
> context when a 3D userspace first talks to the host, not when a 3D
> userspace first needs a context ID.  If the latter is preferred, we
> can do that too.

I think it makes sense to exclude the capset ioctls here.

Possibly they are used for non-3d-related capabilities at some
point in the future.

Also userspace gets capsets while checking device capabilities
and possibly does so before deciding how to drive the device.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
