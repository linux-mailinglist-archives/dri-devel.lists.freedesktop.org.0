Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6B8C74F9
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 13:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FAD10EC6A;
	Thu, 16 May 2024 11:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BkWzfcQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4D10EC6E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 11:07:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B1ECE0003;
 Thu, 16 May 2024 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715857662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPzwo8GURkKv057NaSVRyjsaXMP54tiK1Z3Jjq48Yh8=;
 b=BkWzfcQ7jwfOAqnwEdzMCpV9fr07ChPRZSb7kTF/ShveC6Dx+b9FkN0yLPVQN3cfp+LBeK
 zSXaZ2OSQHX/Cutzewl1nFTcmBEx9Wjae8YPyZA6jSYOzXNPTtAg2W7HKOWiUk8h8dhO2e
 RBb9ur7Pk80QXoKNTVB0888jsFMaO9OyecR7Aku7dMpewKrKseU6h6g8XScCIiXR+95hd0
 P709tiRf4nf7+V/ocl/QqXM9Ou8y2EyUwDh1LoGnlQaq1XJI/c3Vf/D/a0yaCqaQPg7/h0
 lURTKtaMZAcWLEiBK0gbp6CBJHJxoA2tPbzO8TcamimWXhMlVLBPag5scD003w==
Date: Thu, 16 May 2024 13:07:36 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v7 11/17] drm/vkms: Remove useless drm_rotation_simplify
Message-ID: <ZkXo-CSQwErOYQX9@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
 <20240513-yuv-v7-11-380e9ffec502@bootlin.com>
 <c83255f4-745e-43e6-98e0-2e89c31d569a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c83255f4-745e-43e6-98e0-2e89c31d569a@igalia.com>
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

Le 16/05/24 - 07:43, Maíra Canal a écrit :
> Hi Louis,
> 
> On 5/13/24 04:50, Louis Chauvet wrote:
> > As all the rotation are now supported by VKMS, this simplification does
> > not make sense anymore, so remove it.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> I'd like to push all commits up to this point to drm-misc-next. Do you
> see a problem with it? Reason: I'd like Melissa to take a look at the
> YUV patches and patches 1 to 11 fix several composition errors.
> 
> Let me know your thoughts about it.

Hi,

This version is missing performance numbers and one fix from Pekka, so 
please don't merge v7.

I will push a v8 today (if I have the time to fetch all the performance 
numbers), with the performance numbers and the fix.

Thanks,
Louis Chauvet

> Best Regards,
> - Maíra
> 
> > ---
> >   drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
> >   1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 8875bed76410..5a028ee96c91 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >   	frame_info->fb = fb;
> >   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> >   	drm_framebuffer_get(frame_info->fb);
> > -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> > -									  DRM_MODE_ROTATE_90 |
> > -									  DRM_MODE_ROTATE_270 |
> > -									  DRM_MODE_REFLECT_X |
> > -									  DRM_MODE_REFLECT_Y);
> > -
> > +	frame_info->rotation = new_state->rotation;
> >   
> >   	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> >   }
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
