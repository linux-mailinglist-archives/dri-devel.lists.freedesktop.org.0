Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0818699A5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF6C10E8A6;
	Tue, 27 Feb 2024 15:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="id7cz+2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1810E594
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C24A61C0004;
 Tue, 27 Feb 2024 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxX/T5aZao8IAh+tvJ+h1jgz8NA+Qb+ugAuRUGDGBxA=;
 b=id7cz+2Y6DwUH4pY84bMuhCorW2eM7EdsL89UxxR1WAfCzOrFgCfHQM+D/C2zTjCI0ZMeK
 RJ1yQojPN6Z07XLBGxWxAZlYI/64t0gZowYTYMMhxPrzpMpOQlWAiKgJwNCHgSLB5LWg07
 lG/nlHSa9qwqoXa/ZLcY0ZIyzY+ygh3eDaTeIF+41bBY1rnPZOY1Ucdt0tUBW522D4e9XH
 SZM9CoNBc5KK8ZVJs5Pgj3sun2Bv7w0jugfPqxw9Z/PlXfa3Nwa2+BYW68RDpJHd+Lgayh
 fOLaAEE759cCbBgZf78mkT3HvtcTNPZYMXVKXjCBi+66Twum2kPDMUIOoO4guw==
Date: Tue, 27 Feb 2024 16:02:13 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 9/9] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <Zd35ddQZbl3frcLm@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-9-aa6be2827bb7@bootlin.com>
 <4406ec1c-fcfc-4d06-bec2-a428058d32cc@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4406ec1c-fcfc-4d06-bec2-a428058d32cc@riseup.net>
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

Le 26/02/24 - 13:39, Arthur Grillo a écrit :
> 
> 
> On 23/02/24 08:37, Louis Chauvet wrote:
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Create KUnit tests to test the conversion between YUV and RGB. Test each
> > conversion and range combination with some common colors.
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > [Louis Chauvet: fix minor formating issues (whitespace, double line)]
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/Makefile                 |   1 +
> >  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
> >  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
> >  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 155 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_formats.c           |   9 +-
> >  drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
> >  6 files changed, 175 insertions(+), 2 deletions(-)
> 
> You need to add the CONFIG_DRM_VKMS_KUNIT_TESTS config to
> drivers/gpu/drm/vkms/Kconfig, like my previous patch did.

I don't know how I merged your patch, but I missed the Kconfig file, 
it was not intended, sorry.

Kind regards,
Louis Chauvet
 
[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
