Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6209662017
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352210E292;
	Mon,  9 Jan 2023 08:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBBA10E292
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:34:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E99AC6602D53;
 Mon,  9 Jan 2023 08:34:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673253281;
 bh=oiTqC5bjvt0bvckR4OzYx9Ec47vPyBBSSJQTtaapIr0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aBCJ8Z8GBiLewgIuWSGLHFqnLrJwUOp9E3jz0dnhUFyXb57QzuFYfgcP0xSC3SfL7
 78OfXMnr9I+Q4QAUkGDuFCprivVzTCqlNJsAGaqVBR4J0djvprDEOfoVg2dQkAYPTm
 1BpVJH8pZtu0v3/BRblNWnjIUeer4Km4J9HeIKYTLvtoobJxVSPmczUzM/teOk0gUV
 tWSwo2KPlwRoc9siTYdw+i7OA9nGgFoiRMYe4KSjVuD5iPMLCYm+b0QGB5aIiOi0jV
 M/zBfVFkppkJAoiOuL+B6u8ygaCnVfnp+PnNf3BFGWUWwFLTAVREFxCEv41N17Aj9b
 NSXGs8WRCulLQ==
Date: Mon, 9 Jan 2023 09:34:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC 1/4] drm/panfrost: Provide a dummy show_fdinfo()
 implementation
Message-ID: <20230109093437.35ccf475@collabora.com>
In-Reply-To: <Y7btZUve7rDA/ctq@phenom.ffwll.local>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
 <20230104130308.3467806-2-boris.brezillon@collabora.com>
 <Y7btZUve7rDA/ctq@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, 5 Jan 2023 16:31:49 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jan 04, 2023 at 02:03:05PM +0100, Boris Brezillon wrote:
> > Provide a dummy show_fdinfo() implementation exposing drm-driver and
> > drm-client-id. More stats will be added soon.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 2fa5afe21288..6ee43559fc14 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -515,7 +515,22 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
> >  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
> >  };
> >  
> > -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> > +static void panfrost_show_fdinfo(struct seq_file *m, struct file *f)
> > +{
> > +	struct drm_file *file = f->private_data;
> > +	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> > +
> > +	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
> > +	seq_printf(m, "drm-client-id:\t%llu\n", panfrost_priv->sched_entity[0].fence_context);  
> 
> I think at this point we really need to not just have a document that says
> what this should look like, but drm infrastructure with shared code.
> Drivers all inventing their fdinfo really doesn't seem like a great idea
> to me.

Okay. I'm just curious how far you want to go with this common
infrastructure? Are we talking about having a generic helper printing
the pretty generic drm-{driver,client-id} props and letting the driver
prints its driver specific properties, or do you also want to
standardize/automate printing of some drm-memory/drm-engine props too?

Regards,

Boris
