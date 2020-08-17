Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE631246444
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 12:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF17B6E053;
	Mon, 17 Aug 2020 10:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBF06E053
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597659571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VGbJwI3itELdK2Hji+iycRZOmACsuMM37BEJjNDZq9g=;
 b=WXNqC8BkD1hU8+pAUAECJNd58GlEfYSrvbt8c4xqJ/RPLw+Op5AxxUnFJuXP3edUSMpTCk
 ctzg4M4erjhT5anmJbKPqMbEhoAmRh6Bqj0bikObno32KbVPj8v81EPzTUbhSJXmJPTT79
 JqKeMW/3uu5Pj8G8OXC8lE0tm6kpQ1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-te4cdZJ8MhaRjjpNLyRBsQ-1; Mon, 17 Aug 2020 06:19:29 -0400
X-MC-Unique: te4cdZJ8MhaRjjpNLyRBsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8918F425E8;
 Mon, 17 Aug 2020 10:19:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DDE07DFC0;
 Mon, 17 Aug 2020 10:19:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 251C29D8F; Mon, 17 Aug 2020 12:19:25 +0200 (CEST)
Date: Mon, 17 Aug 2020 12:19:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, 1882851@bugs.launchpad.net,
 David Airlie <airlied@linux.ie>, Chia-I Wu <olvaffe@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: fix unblank
Message-ID: <20200817101925.ljpfgz336zxegsup@sirius.home.kraxel.org>
References: <20200807105429.24208-1-kraxel@redhat.com>
 <20200807130956.GE2352366@phenom.ffwll.local>
 <20200817090342.bemmtkvz4seayp2i@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817090342.bemmtkvz4seayp2i@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Mon, Aug 17, 2020 at 11:03:42AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> > > @@ -100,6 +100,7 @@ static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
> > >  	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
> > >  
> > >  	output->enabled = true;
> > > +	output->need_update = true;
> 
> > > --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> > > @@ -163,7 +163,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
> > >  	    plane->state->src_w != old_state->src_w ||
> > >  	    plane->state->src_h != old_state->src_h ||
> > >  	    plane->state->src_x != old_state->src_x ||
> > > -	    plane->state->src_y != old_state->src_y) {
> > > +	    plane->state->src_y != old_state->src_y ||
> > > +	    output->need_update) {
> > 
> > Uh instead of hand-rolling what's essentially a drm_crtc_needs_modeset
> > check, why not use that one? atomic helpers try to keep the usual suspects
> > for state transitions already handy, to avoid every driver rolling their
> > own. Or do I miss something here?
> 
> Well, the virtio-gpu virtual hardware can't do plane updates and crtc
> updates independant from each other.  So the crtc callbacks handle
> disable only (we don't need a fb for that) and leave the enable to the
> plane update.
> 
> I suspect calling drm_atomic_crtc_needs_modeset() in plane update isn't
> going to fly ...

Digged a bit more, seems crtc_state->*_changed is cleared after modeset
so the following plane update wouldn't see it.  Which I think means
there is no way around tracking that in need_update.

output->enabled is probably not needed though, seems I can replace that
by either output->crtc.state->enable or ->active.  Not fully sure which
one, probably ->active.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
