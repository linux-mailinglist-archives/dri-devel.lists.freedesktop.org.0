Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8434443DB4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 08:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC2773192;
	Wed,  3 Nov 2021 07:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E99E73191
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635924651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xpja8WAihX9QgetoK4QXWHOWWctjoZyW/XmFOQd8n4=;
 b=WCwF36Vhsr6AhYP//HwDPAVNS5AwjPZv8wDtCGws+v33EprWNfSsa7Q7SKSFPETdVb6mao
 ZaGF01EfsY6dlm4S7S38OsW3G0wmlh/WwiJLuc5C7owkpDumxn6noNv1fv9PjP6rotED48
 bWCUGQrjClSY0XFl/N1UU+9u/M+egIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-3wlqcyNwORaF132aqw5eUQ-1; Wed, 03 Nov 2021 03:30:47 -0400
X-MC-Unique: 3wlqcyNwORaF132aqw5eUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A05A710B3947;
 Wed,  3 Nov 2021 07:30:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E65C319723;
 Wed,  3 Nov 2021 07:30:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 147151800924; Wed,  3 Nov 2021 08:30:43 +0100 (CET)
Date: Wed, 3 Nov 2021 08:30:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: delay pinning the pages till first use
Message-ID: <20211103073043.x7hdnm43zrw7u6j3@sirius.home.kraxel.org>
References: <20211102113139.154140-1-maksym.wezdecki@collabora.com>
 <20211102130308.2s64ghmic5nhj6vu@sirius.home.kraxel.org>
 <CAPaKu7T9-KmmDwNRFzQWM3jH4h-xUwjtfWays20z24dVvROoHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPaKu7T9-KmmDwNRFzQWM3jH4h-xUwjtfWays20z24dVvROoHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, mwezdeck <maksym.wezdecki@collabora.co.uk>,
 Maksym Wezdecki <maksym.wezdecki@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:58:55AM -0700, Chia-I Wu wrote:
> On Tue, Nov 2, 2021 at 6:07 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Tue, Nov 02, 2021 at 12:31:39PM +0100, Maksym Wezdecki wrote:
> > > From: mwezdeck <maksym.wezdecki@collabora.co.uk>
> > >
> > > The idea behind the commit:
> > >   1. not pin the pages during resource_create ioctl
> > >   2. pin the pages on the first use during:
> > >       - transfer_*_host ioctl
> > >         - map ioctl
> >
> > i.e. basically lazy pinning.  Approach looks sane to me.
> >
> > >   3. introduce new ioctl for pinning pages on demand
> >
> > What is the use case for this ioctl?
> > In any case this should be a separate patch.
> 
> Lazy pinning can be a nice optimization that userspace does not
> necessarily need to know about.  This patch however skips pinning for
> execbuffer ioctl and introduces a new pin ioctl instead.  That is a
> red flag.

Ah, so the pin ioctl is for buffers which need a pin for execbuffer.

Yep, that isn't going to fly that way, it'll break old userspace.

Lazy pinning must be opt-in, so new userspace which knows about
the pin ioctl can enable lazy pinning.  One possible way would
be to add a flag for the VIRTGPU_RESOURCE_CREATE ioctl, so lazy
pinning can be enabled per resource.

take care,
  Gerd

