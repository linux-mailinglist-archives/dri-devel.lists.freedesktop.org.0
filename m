Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A0A02D99
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 17:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070F010E27F;
	Mon,  6 Jan 2025 16:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SU6Z0UNE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C2910E6D1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 16:19:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88A1D1C000F;
 Mon,  6 Jan 2025 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736180385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6TjL7+Dt4IgiDqEA5HrH0jQggyhqcEXsVzpeF2qpXs=;
 b=SU6Z0UNEBs5rCJ2rX6P8PZ/h9K30T1JcvKK3yrIKER6XSCjj8qQu2bMBAF2+iG0TejF+M6
 4f6FBlvbpb5zmb4iMcDj6ifd2TYbujtuZQDgjzKbPZswiI5KCjAH7Zhdc/AKOyq4+kSHz0
 zTQnflr3uHe3FTS/H8AhNq1UoO2H/28yV3Lq4bJ4gfNBDqoiZ7JF6BL+OhwDiECBz1oyqv
 hNtiIS+nv/6CoOvA+ayGuHk8D71WtKu19OvJntXFu1KuR379OVoeYYAs5UCbMuTAW4D+W1
 aNcdQkOrODyw8QHy1chYKjM8QOCWxN/mBCXbRIHo6lJPLt+16tZstC0fANlGXw==
Date: Mon, 6 Jan 2025 17:19:42 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
Message-ID: <Z3wCnk_WStJk9B5D@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
 <20241230-google-vkms-managed-v6-7-15c7d65cd63b@bootlin.com>
 <20250106-acoustic-inescapable-locust-9d5b36@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-acoustic-inescapable-locust-9d5b36@houat>
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

On 06/01/25 - 14:04, Maxime Ripard wrote:
> On Mon, Dec 30, 2024 at 07:37:37PM +0100, Louis Chauvet wrote:
> > To allows driver to only use drmm objects, add helper to create
> > drm_writeback_connectors with automated lifetime management.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 69 +++++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_writeback.h     |  8 +++++
> >  2 files changed, 77 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > index 9c69f7181e02c23dabce488405608c40d4184af5..1251f65aae9e3b6fb5c5de9ab9280e5430342208 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -369,6 +369,75 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
> >  	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
> >  }
> >  
> > +/**
> > + * drmm_writeback_connector_init - Initialize a writeback connector with
> > + * a custom encoder
> > + *
> > + * @dev: DRM device
> > + * @wb_connector: Writeback connector to initialize
> > + * @con_funcs: Connector funcs vtable
> > + * @enc: handle to the already initialized drm encoder, optional
> > + * @enc_funcs: Encoder funcs vtable, optional, only used when @enc is NULL
> > + * @formats: Array of supported pixel formats for the writeback engine
> > + * @n_formats: Length of the formats array
> > + * @possible_crtcs: if @enc is NULL, this will set the possible_crtc for the
> > + *		    newly created encoder
> > + *
> > + * This function initialize a writeback connector and register its cleanup.
> > + *
> > + * This function creates the writeback-connector-specific properties if they
> > + * have not been already created, initializes the connector as
> > + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> > + * values.
> > + *
> > + * If @enc is NULL, this function will create a drm-managed encoder and will
> > + * attach @enc_funcs on it. It will also attach the CRTC passed in
> > + * @possible_crtcs
> > + *
> > + * Returns: 0 on success, or a negative error code
> > + */
> > +int drmm_writeback_connector_init(struct drm_device *dev,
> > +				  struct drm_writeback_connector *wb_connector,
> > +				  const struct drm_connector_funcs *con_funcs,
> > +				  struct drm_encoder *enc,
> > +				  const struct drm_encoder_helper_funcs *enc_funcs,
> > +				  const u32 *formats, int n_formats,
> > +				  u32 possible_crtcs)
> 
> The name isn't really consistent with the other functions. We already
> have a drm_writeback_connector_init that doesn't take the encoder point
> but will just read it from wb_connector->encoder, and we have
> drm_writeback_connector_with_encoder that assumes the encoder has
> already been created.
>
> We should the name or behavior on either one of them. Why do we need an
> optional encoder pointer? If enc is not NULL, then enc_funcs shouldn't
> be necessary, if it's NULL, then drm_writeback_connector_init will be
> sufficient?

This was requested by Jani in [1]. If you prefer I can create two variants 
for the next iteration.

[1]:https://lore.kernel.org/all/87a5gxyrhc.fsf@intel.com/

> 
> Maxime


