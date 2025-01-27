Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593FFA1D4BD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 11:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C7710E0BA;
	Mon, 27 Jan 2025 10:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ODwDe+ZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42F810E0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 10:48:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C430C2000A;
 Mon, 27 Jan 2025 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737974907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=16Z4jSz8wfLo+04tmP/UOzeDIejcTqVQyH3UF14AFGo=;
 b=ODwDe+ZCtqIB1E51+TpbvEuaH8BndqDBT1ItNBYeAMUq++lzJKw7iA97a7ZFIw9Z+hNnmj
 zX2eciYO70HPV8FxI8nUAkwBIOPWnzgs/zvD2P8paW+g0mHKg53qvl5r6jcZPikKvhLise
 k0+p75ebhi+oQkeXEryvFG6sZ+bjiEsH2987J7cW6fQ/cp7gOSSOWV5xHoMb7OvJL4s3/h
 dojbVMGl9mMjUK/FrYE952CB8oNMa9sHv1dlM/NwK46zf2ktU4ElnvClshZ5yHQmInxxa7
 /MeaORBBKoHXL8wztSI5D36aVASN2DxzMnMsPkG8+6Pi9KR2pF4RohKyFr9CyA==
Date: Mon, 27 Jan 2025 11:48:23 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com,
 linux-doc@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
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

On 26/01/25 - 18:06, Maxime Ripard wrote:
> On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
> > +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> > +	/*
> > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > +	 *                     in_bits = 16,
> > +	 *                     in_legal = False,
> > +	 *                     in_int = True,
> > +	 *                     out_bits = 8,
> > +	 *                     out_legal = False,
> > +	 *                     out_int = True)
> > +	 *
> > +	 * Test cases for conversion between YUV BT601 full range and RGB
> > +	 * using the ITU-R BT.601 weights.
> > +	 */
> 
> What are the input and output formats?
> 
> Ditto for all the other tests.

There is no really "input" and "output" format, they are reference values 
for conversion, you should be able to use it in both direction. They are 
generated by RGB_to_YCbCr (RGB input, YUV output) just because it was 
easier to create the colors from RGB values.

If you think we should specify what is was used as input and output to 
generate those values, I can modify the comment to:

	Tests cases for color conversion generated by converting RGB 
	values to YUV BT601 full range using the ITU-R BT.601 weights.

Beside that modification, did you notice anything else on the series that 
require more work before adding your Ack-by/Reviewed-by on the other 
patches?

Thanks,
Louis Chauvet
 
> Maxime


