Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10430044A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF376E9FC;
	Fri, 22 Jan 2021 13:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9DB6E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQpKuSu/XZms0h2vrZRdE58y8K/XKXt6RJB9+QvBgLg=;
 b=GnEI8p+v+DfvFpqMBv2YxhkOLM+wB3TX84ng7ECT1nwMjkvG2gZ5eVN1TEGX1PipaRo3vS
 C7kjwlWtwAAOKfLF+u2bQErcDqI3//VNWd90HRdN8eCOK1VQkGHyTWdwNoehsSsdlBHTBI
 2Xt/B0uFDJpDTkGXQjAqd8rMyUxCQg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-OP9_3mXzPNOM-cxgZQGzZA-1; Fri, 22 Jan 2021 08:35:48 -0500
X-MC-Unique: OP9_3mXzPNOM-cxgZQGzZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03C76107ACE3;
 Fri, 22 Jan 2021 13:35:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5DC810023BD;
 Fri, 22 Jan 2021 13:35:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0BE5F18000AB; Fri, 22 Jan 2021 14:35:45 +0100 (CET)
Date: Fri, 22 Jan 2021 14:35:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/4] drm/qxl: unpin release objects
Message-ID: <20210122133545.acloe4ytgp6r4iql@sirius.home.kraxel.org>
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-3-kraxel@redhat.com>
 <a4187459-1dbd-e799-fba4-bf7021de831b@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4187459-1dbd-e799-fba4-bf7021de831b@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 09:13:42AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.01.21 um 12:12 schrieb Gerd Hoffmann:
> > Balances the qxl_create_bo(..., pinned=true, ...);
> > call in qxl_release_bo_alloc().
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >   drivers/gpu/drm/qxl/qxl_release.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> > index 0fcfc952d5e9..add979cba11b 100644
> > --- a/drivers/gpu/drm/qxl/qxl_release.c
> > +++ b/drivers/gpu/drm/qxl/qxl_release.c
> > @@ -166,6 +166,7 @@ qxl_release_free_list(struct qxl_release *release)
> >   		entry = container_of(release->bos.next,
> >   				     struct qxl_bo_list, tv.head);
> >   		bo = to_qxl_bo(entry->tv.bo);
> > +		bo->tbo.pin_count = 0; /* ttm_bo_unpin(&bo->tbo); */
> 
> This code looks like a workaround or a bug.
> 
> AFAICT the only place with pre-pinned BO is qdev->dumb_shadow_bo. Can you
> remove the pinned flag entirely and handle pinning as part of
> dumb_shadow_bo's code.

No, the release objects are pinned too, and they must be
pinned (qxl commands are in there, and references are
placed in the qxl rings, so allowing them to roam is
a non-starter).

> if (pin_count)
>     ttm_bo_unpin();
> WARN_ON(pin_count); /* should always be 0 now */

Well, the pin_count is 1 at this point.
No need for the if().

Just calling ttm_bo_unpin() here makes lockdep unhappy.

Not calling ttm_bo_unpin() makes ttm_bo_release() throw
a WARN() because of the pin.

Clearing pin_count (which is how ttm fixes things up
in the error path) works.

I'm open to better ideas.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
