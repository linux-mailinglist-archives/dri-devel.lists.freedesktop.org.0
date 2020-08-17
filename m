Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB2C2461CF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 11:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A006E051;
	Mon, 17 Aug 2020 09:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5317C6E051
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597655027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iWLBVVWGQzp5rvaiSkpRpGi21EkmGXSL34WymXzDWrA=;
 b=RKlhmmrzi6sNxownCya4PqcGSifcOhd5NwmENyVyZ+BaBqKBsGdmceYJyzBr97bTOdnv9q
 btblH0OmcZcnVZuPXtxz36LgoOa9TkGrhJOErYriyhDwimMhMNu08aIwRcralT9cBRk8Xm
 1B6Lwqhzt/F4zJOW1IwlbiorY1kTkgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-XOr0Q0g5Pm2_V_1gskoIRA-1; Mon, 17 Aug 2020 05:03:45 -0400
X-MC-Unique: XOr0Q0g5Pm2_V_1gskoIRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3A50801ADB;
 Mon, 17 Aug 2020 09:03:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 746637A1C0;
 Mon, 17 Aug 2020 09:03:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB9611753B; Mon, 17 Aug 2020 11:03:42 +0200 (CEST)
Date: Mon, 17 Aug 2020 11:03:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, 1882851@bugs.launchpad.net,
 David Airlie <airlied@linux.ie>, Chia-I Wu <olvaffe@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: fix unblank
Message-ID: <20200817090342.bemmtkvz4seayp2i@sirius.home.kraxel.org>
References: <20200807105429.24208-1-kraxel@redhat.com>
 <20200807130956.GE2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807130956.GE2352366@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

> > --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> > @@ -100,6 +100,7 @@ static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
> >  	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
> >  
> >  	output->enabled = true;
> > +	output->need_update = true;

> > --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> > @@ -163,7 +163,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
> >  	    plane->state->src_w != old_state->src_w ||
> >  	    plane->state->src_h != old_state->src_h ||
> >  	    plane->state->src_x != old_state->src_x ||
> > -	    plane->state->src_y != old_state->src_y) {
> > +	    plane->state->src_y != old_state->src_y ||
> > +	    output->need_update) {
> 
> Uh instead of hand-rolling what's essentially a drm_crtc_needs_modeset
> check, why not use that one? atomic helpers try to keep the usual suspects
> for state transitions already handy, to avoid every driver rolling their
> own. Or do I miss something here?

Well, the virtio-gpu virtual hardware can't do plane updates and crtc
updates independant from each other.  So the crtc callbacks handle
disable only (we don't need a fb for that) and leave the enable to the
plane update.

I suspect calling drm_atomic_crtc_needs_modeset() in plane update isn't
going to fly ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
