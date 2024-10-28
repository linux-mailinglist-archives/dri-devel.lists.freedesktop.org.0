Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0549B2BE2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A61E10E440;
	Mon, 28 Oct 2024 09:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Wa5cEUK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA47B10E381
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:50:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23EF3E0007;
 Mon, 28 Oct 2024 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730109038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbsfqPI/+Pq0sVsIDMdySlzGdjH2/Ya3VyVTgeSvFyE=;
 b=Wa5cEUK4rELTUuRoJFNkvcp9ZM959c5x73lKCnMLrVVHcTogtVkwqBmXezMIJoHyYn666v
 fNz80L9Njj/GQQkvRkj71/D0o0L8M2Fo2jEImxODvNc4bB/PZXS1chXGeZlwsMVB4f7nZx
 Dz9TtODIZC+RRw3nEwyRtt0WBBfuGLnXa5/o23JrU2v3z2t8cUFsWPYP+1kPUET2kxiwS7
 2IW7pDLTUYa84jqndr1yjn8ILxkcLJmCgYRTlclpPnrabWKr35YA2DmLDjzGKaN6bl+AxF
 M00Vm1BgmrMW/pbLUflJiIhZ/cjNZCiNzdQkAcav+/14F58X0fgTlAIJKgQIOg==
Date: Mon, 28 Oct 2024 10:50:35 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
Subject: Re: [PATCH v4 1/5] drm/vkms: Switch to managed for connector
Message-ID: <Zx9eazl8s7o6Mx-T@fedora>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
 <20241010-google-vkms-managed-v4-1-ed04a62ad2e3@bootlin.com>
 <575323aa-d322-4d03-8343-15aaaa955437@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <575323aa-d322-4d03-8343-15aaaa955437@riseup.net>
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

On 26/10/24 - 12:29, Maíra Canal wrote:
> Hi Louis,
> 
> On 10/10/24 14:39, Louis Chauvet wrote:
> > The current VKMS driver uses non-managed function to create connectors. It
> > is not an issue yet, but in order to support multiple devices easily,
> > convert this code to use drm and device managed helpers.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_output.c | 19 +++++++------------
> >   1 file changed, 7 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 5128aa3b2eb6..8f7a05b73e1d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -3,11 +3,11 @@
> >   #include "vkms_drv.h"
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_edid.h>
> > +#include <drm/drm_managed.h>
> >   #include <drm/drm_probe_helper.h>
> >   static const struct drm_connector_funcs vkms_connector_funcs = {
> >   	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >   	.reset = drm_atomic_helper_connector_reset,
> >   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> >   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > @@ -70,17 +70,17 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >   			if (IS_ERR(overlay)) {
> >   				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> >   				ret = PTR_ERR(overlay);
> > -				goto err_crtc;
> > +				goto err_connector;
> 
> Why did you renamed err_crtc to err_connector? I think err_crtc looks
> correct.

I rename it many times during my work, it was never clear for me if 
"err_crtc" is about an error during the CRTC initialization or a label to 
clean the crtc.

If for you err_crtc is correct (ie err_<thing> means "cleanup <thing>"), I 
will switch to this pattern.

Thanks,
Louis Chauvet
 
> Best Regards,
> - Maíra
> 
> >   			}
> >   			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> >   		}
> >   	}
> > -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_VIRTUAL);
> > +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> > +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> >   	if (ret) {
> >   		DRM_ERROR("Failed to init connector\n");
> > -		goto err_crtc;
> > +		goto err_connector;
> >   	}
> >   	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> > @@ -89,7 +89,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> >   	if (ret) {
> >   		DRM_ERROR("Failed to init encoder\n");
> > -		goto err_encoder;
> > +		return ret;
> >   	}
> >   	encoder->possible_crtcs = drm_crtc_mask(crtc);
> > @@ -111,12 +111,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >   err_attach:
> >   	drm_encoder_cleanup(encoder);
> > -
> > -err_encoder:
> > -	drm_connector_cleanup(connector);
> > -
> > -err_crtc:
> > +err_connector:
> >   	drm_crtc_cleanup(crtc);
> > -
> >   	return ret;
> >   }
> > 
