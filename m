Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40A845EB8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D50B10E57B;
	Thu,  1 Feb 2024 17:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YzY1cTmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D5D10E57B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:39:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4896A40006;
 Thu,  1 Feb 2024 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706809178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V2KBXwj4NCjvyE4+0IyeJO23YI/n7DqRxLkdLjw4M2I=;
 b=YzY1cTmSdDy0ffIMayCgOBcypcfMFD/Hvvfmyst5xxSR1Vg5PS4+95h2BDc+oz66xWiUgp
 ax/GemPF+x9OGVoXKrtTZkr6Ry4ajL99c58ko7eTVTAsc6dAD2QyZz/IgA6TphbY3iG8rz
 uV5w1IrlTydt64Wo3l3qVM+b8Vu77J7npywQtfl7Vp1WE6RDw9cEpve9UT1dse5ZJWGnN/
 pIXAywFNqRQP6FTcBekTJ0LmmpNrPNSe2y/iWxAIU+myq04SxINmA0ZGEEtzfdSDpkVVl4
 puibyhHuFDpBo756cSN2+AUrNMhhHHuqlfVgW3qKhqqHnFvvkeZl0iqQvnrZLw==
Date: Thu, 1 Feb 2024 18:39:35 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, nicolejadeyee@google.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com,
 miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 4/7] drm/vkms: Add chroma subsampling
Message-ID: <ZbvXV-1hrfXLcvC3@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, nicolejadeyee@google.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com,
 miquel.raynal@bootlin.com
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
 <20240110-vkms-yuv-v2-4-952fcaa5a193@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110-vkms-yuv-v2-4-952fcaa5a193@riseup.net>
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

[...]

> @@ -146,18 +149,23 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  	for (size_t x = 0; x < limit; x++) {
>  		int x_pos = get_x_position(frame_info, limit, x);
>  
> +		bool shoud_inc = !((x + 1) % frame_format->num_planes);

I think this line will break if the subsampling is not the same as the 
plane count. For NV12 it works only because there are two planes and 
hsub=2/vsub=2, but I believe NV24 will not work because of plane 2, as 
we need to increment x at the same speed on all planes.

I have a proposal to solve this issue (see my patchset applying on top of 
yours). You probably at least need to use .hsub/vsub to 
increment/decrement properly src_pixels pointer.

Currently the tests pass for it because it only use "horizontal 
lines" and "full color" pictures. 

In the series [1] I proposed to change the pattern to detect this kind of 
issue.

[...]

[1]: https://lore.kernel.org/dri-devel/20240201-yuv-v1-0-3ca376f27632@bootlin.com/T/#t

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
