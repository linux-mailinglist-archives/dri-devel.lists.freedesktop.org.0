Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4C9BFFF7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 09:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280EF10E31F;
	Thu,  7 Nov 2024 08:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m3Jnvxrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756D210E31F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 08:32:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F7AFF808;
 Thu,  7 Nov 2024 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730968321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IKvx4DWocZdxBr+M6wBy9WouQP4YF0DxwSsin22U4s=;
 b=m3JnvxrpEjrDeYzqyyiurbo1hBT7ZB4T/p1a3yNGCfwdgLiNxOPiy8K67FHHaZDNyJl+jT
 H+0sg/GLEOnXst9PCJhIO+4MPWixSYLzF8Fnpgdwt4TX/dK5bCOTRRM24149YzN+e+dMl2
 R8Fymx2ifglOwYsnelhuPC92IAEaRVoNiXJ47+qfpGR4OlPRpROvkT2d0M4Q05fPizCC2J
 1WiOkNT0WytZThVM3TapvzFl86fbh6BUj1meVSdoJM4bTngT5gBNwcMWqROElP+SqIjVx/
 ImUWK9VI4X3x7bOLSpf7FncqxqYyjaM23/0qgQTQBpFKJ1WcUyAYPSrJ6I7TMQ==
Date: Thu, 7 Nov 2024 09:31:57 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/mode_object: add
 drm_mode_object_read_refcount()
Message-ID: <20241107093157.64750c19@booty>
In-Reply-To: <87wmhgfu2r.fsf@intel.com>
References: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
 <20241106-drm-small-improvements-v2-3-f6e2aef86719@bootlin.com>
 <87wmhgfu2r.fsf@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jani,

On Wed, 06 Nov 2024 14:03:08 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 06 Nov 2024, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > Add a wrapper to kref_read() just like the ones already in place for
> > kref_get() and kref_put(). This will be used for sanity checks on object
> > lifetime.
> >
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_mode_object.c | 20 ++++++++++++++++++++
> >  include/drm/drm_mode_object.h     |  1 +
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> > index df4cc0e8e263d5887a799cf1a61d998234be7158..f990cc7e9b5d3bda3453123593314fa1ea2bf923 100644
> > --- a/drivers/gpu/drm/drm_mode_object.c
> > +++ b/drivers/gpu/drm/drm_mode_object.c
> > @@ -217,6 +217,26 @@ void drm_mode_object_get(struct drm_mode_object *obj)
> >  }
> >  EXPORT_SYMBOL(drm_mode_object_get);
> >  
> > +/**
> > + * drm_mode_object_get - read the refcount for a mode object
> > + * @obj: DRM mode object
> > + *
> > + * This function returns the current object's refcount if it is a
> > + * refcounted modeset object, or 0 on any other object.  
> 
> Returns: The current object's ...
> 
> > + */
> > +unsigned int drm_mode_object_read_refcount(struct drm_mode_object *obj)
> > +{
> > +	unsigned int refcount = 0;
> > +
> > +	if (obj->free_cb) {
> > +		refcount = kref_read(&obj->refcount);
> > +		DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, refcount);  
> 
> Please ditch the debug.

OK, will do both in v3.

Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
