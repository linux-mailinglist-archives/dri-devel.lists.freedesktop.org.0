Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6E961061
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 17:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB7389ECB;
	Tue, 27 Aug 2024 15:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GywE6kNb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF75889ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 15:08:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E5FA1C0002;
 Tue, 27 Aug 2024 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724771291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yBb/0QoR/0aXl4uwkrI2beUWpuOVhY6b6+ZI6lXnRY=;
 b=GywE6kNbzyPd6VkGoTFhKtRyozEw6AiLvVvKr4Rd9hd2ILkZAzfLVLFopir/Qm6csVZ3yS
 q4ghn5ZNXAWnrBephGfiYT8BTuU2RXqRgwrLCbMusQbsjorhQ8isEtAX1tiky7UXFdAyA2
 Egw5g3Ck0aQxsXodCnFxVm/ju1FBRB3U4+7HyanzFloaXr7TePhp93ExZ7OYaHvDJ9p5xt
 hodgveEjKBYmQfS5AGba+GArXVZRBkdb8pqvk7znjfD6/ACD5LyuO1i0YS1efBWBFzfxTb
 udB18jY46pNk7Ho9Z/srVW1tbE0s5PWTWz2PXZEDNAsQTim4mj/Jma5tPXRisg==
Date: Tue, 27 Aug 2024 17:08:08 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v2 1/6] drm/vkms: Switch to managed for connector
Message-ID: <Zs3r2MK5nZs5TFsy@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
 <20240827-google-vkms-managed-v2-1-f41104553aeb@bootlin.com>
 <20240827-dynamic-acoustic-guillemot-ddde49@houat>
 <Zs3TeoUwn3iO7oBs@louis-chauvet-laptop>
 <20240827-chubby-tidy-collie-c8ecf7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827-chubby-tidy-collie-c8ecf7@houat>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 27/08/24 - 16:39, Maxime Ripard a écrit :
> On Tue, Aug 27, 2024 at 03:24:10PM GMT, Louis Chauvet wrote:
> > Le 27/08/24 - 15:15, Maxime Ripard a écrit :
> > > Hi,
> > > 
> > > On Tue, Aug 27, 2024 at 11:57:36AM GMT, Louis Chauvet wrote:
> > > > The current VKMS driver uses non-managed function to create connectors. It
> > > > is not an issue yet, but in order to support multiple devices easily,
> > > > convert this code to use drm and device managed helpers.
> > > > 
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
> > > >  drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++++----------
> > > >  2 files changed, 12 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > index 5e46ea5b96dc..9a3c6c34d1f6 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > @@ -99,7 +99,6 @@ struct vkms_crtc_state {
> > > >  struct vkms_output {
> > > >  	struct drm_crtc crtc;
> > > >  	struct drm_encoder encoder;
> > > > -	struct drm_connector connector;
> > > >  	struct drm_writeback_connector wb_connector;
> > > >  	struct hrtimer vblank_hrtimer;
> > > >  	ktime_t period_ns;
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > > > index 5ce70dd946aa..4fe6b88e8081 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > > > @@ -3,11 +3,11 @@
> > > >  #include "vkms_drv.h"
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_edid.h>
> > > > +#include <drm/drm_managed.h>
> > > >  #include <drm/drm_probe_helper.h>
> > > >  
> > > >  static const struct drm_connector_funcs vkms_connector_funcs = {
> > > >  	.fill_modes = drm_helper_probe_single_connector_modes,
> > > > -	.destroy = drm_connector_cleanup,
> > > >  	.reset = drm_atomic_helper_connector_reset,
> > > >  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > >  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > > @@ -50,7 +50,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > >  {
> > > >  	struct vkms_output *output = &vkmsdev->output;
> > > >  	struct drm_device *dev = &vkmsdev->drm;
> > > > -	struct drm_connector *connector = &output->connector;
> > > > +	struct drm_connector *connector;
> > > >  	struct drm_encoder *encoder = &output->encoder;
> > > >  	struct drm_crtc *crtc = &output->crtc;
> > > >  	struct vkms_plane *primary, *cursor = NULL;
> > > > @@ -80,8 +80,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> > > >  	if (ret)
> > > >  		return ret;
> > > >  
> > > > -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> > > > -				 DRM_MODE_CONNECTOR_VIRTUAL);
> > > > +	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
> > > > +	if (!connector) {
> > > > +		DRM_ERROR("Failed to allocate connector\n");
> > > > +		ret = -ENOMEM;
> > > > +		goto err_connector;
> > > > +	}
> > > > +
> > > 
> > > I think it would be worth explaining why you need to move to a separate
> > > allocation for the connector now.
> > > 
> > > Maxime
> > 
> > Hi,
> > 
> > This is in preparation for ConfigFS implementation, as the number of 
> > connector/encoders/crtc/planes... will be dynamic, we need to have 
> > separate alloaction.
> > 
> > If I add this paragraph in the commit message, is it sufficient?
> > 
> > 	A specific allocation for the connector is not strictly necessary 
> > 	at this point, but in order to implement dynamic configuration of 
> > 	VKMS (configFS), it will be easier to have one allocation per 
> > 	connector.
> > 
> > (same for encoder & CRTC)
> 
> Yeah, that's a good message, but it probably belongs in a separate patch
> then.

Can you explain what you mean by "in a separate patch"? I wanted to write 
this paragraph in the commit log.

Louis Chauvet
