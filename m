Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217EB255958
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 13:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317986E499;
	Fri, 28 Aug 2020 11:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F746E499
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598614084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vcVCnDfXCrpqdXroEZsRpzoOz05edQsOh2pIT4QY95E=;
 b=d4u9wTJIhYCrrklCfYatvJ9ry1ZYxNLYhLyL6BtFCNGqMG38xjtTiIXHcUkdnk4bItdP99
 Y8uD9oC2y7fCfjnIJ4gM3FyzqqZTpuUiLcxQi4xIwGaqaIYNluhdFIdG1DudZaALBl/ZHg
 YdFCHwGUW9pV/AB0uQrtaxKH4A7Hel4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-KhS13XkaMoyyK4EiseYxow-1; Fri, 28 Aug 2020 07:28:02 -0400
X-MC-Unique: KhS13XkaMoyyK4EiseYxow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BEF64090;
 Fri, 28 Aug 2020 11:28:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCF325D9F3;
 Fri, 28 Aug 2020 11:28:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C877C9C87; Fri, 28 Aug 2020 13:27:59 +0200 (CEST)
Date: Fri, 28 Aug 2020 13:27:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 1/2] drm/virtio: fix unblank
Message-ID: <20200828112759.rmeeh5bonrewiqte@sirius.home.kraxel.org>
References: <20200818072511.6745-1-kraxel@redhat.com>
 <20200818072511.6745-2-kraxel@redhat.com>
 <88ae71c2-c3ed-e0e4-e62c-bdf9d6534f2a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88ae71c2-c3ed-e0e4-e62c-bdf9d6534f2a@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, 1882851@bugs.launchpad.net,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 09:24:40AM +0200, Jiri Slaby wrote:
> On 18. 08. 20, 9:25, Gerd Hoffmann wrote:
> > When going through a disable/enable cycle without changing the
> > framebuffer the optimization added by commit 3954ff10e06e ("drm/virtio:
> > skip set_scanout if framebuffer didn't change") causes the screen stay
> > blank.  Add a bool to force an update to fix that.
> > 
> > v2: use drm_atomic_crtc_needs_modeset() (Daniel).
> > 
> > Cc: 1882851@bugs.launchpad.net
> > Fixes: 3954ff10e06e ("drm/virtio: skip set_scanout if framebuffer didn't change")
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Tested-by: Jiri Slaby <jirislaby@kernel.org>

Ping.  Need an ack or an review to merge this.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
