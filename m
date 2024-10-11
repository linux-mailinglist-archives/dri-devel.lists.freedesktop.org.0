Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC799A656
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18F510EAF8;
	Fri, 11 Oct 2024 14:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k4Gr/qNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6010EAF8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:29:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92379E0002;
 Fri, 11 Oct 2024 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728656968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxooFsfSP5WcF10uZh9IA27LMTRQH7j6L0q8CNYDpNM=;
 b=k4Gr/qNYHdODpez3/DCHZupSvlEjfo3N4RAaY2HahSkuKqldVKtl7BPPO0MxrtN+LPZ7EA
 5Gyf6RhX+P9oR4YAZAl8jWTRWAjKTgrZvnwx3nENZKDgfVIHsht1LUiaUXostuQ6NvKCkK
 WcJ8nS4pmpvqKlBglmcfPAjOMKNKdG299UNBOGJmEe8f+j10Tn9ijloFpvcKup2pwaYujJ
 AOwLMi0Wk80drqgtOTS6j6tSft0exOSpgYuj7bnQYi3OTsrSm6+kKCYzOEpzpzaamOBmTP
 oLcfBeSUbuWOvQ/bhMTGyS8YGWRzFIHsSER4FwQW5Tvi1wesvYIoa1md7cxCzQ==
Date: Fri, 11 Oct 2024 16:29:25 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <Zwk2RSgfV75LVLpR@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>
 <20241008-ingenious-calm-silkworm-3e99ba@houat>
 <ZwT6CnyYRKS9QxIS@louis-chauvet-laptop>
 <20241011-shiny-skua-of-authority-998ad3@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-shiny-skua-of-authority-998ad3@houat>
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

On 11/10/24 - 12:49, Maxime Ripard wrote:
> On Tue, Oct 08, 2024 at 11:23:22AM GMT, Louis Chauvet wrote:
> > 
> > Hi, 
> > 
> > > > + * The YUV color representation were acquired via the colour python framework.
> > > > + * Below are the function calls used for generating each case.
> > > > + *
> > > > + * For more information got to the docs:
> > > > + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
> > > > + */
> > > > +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> > > > +	/*
> > > > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > > > +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > > > +	 *                     in_bits = 16,
> > > > +	 *                     in_legal = False,
> > > > +	 *                     in_int = True,
> > > > +	 *                     out_bits = 8,
> > > > +	 *                     out_legal = False,
> > > > +	 *                     out_int = True)
> > > > +	 */
> > > 
> > > We should really detail what the intent and expected outcome is supposed
> > > to be here. Relying on a third-party python library call for
> > > documentation isn't great.
> >
> > This was requested by Pekka in the [v2] of this series.
> 
> Ok.
> 
> > I can add something like this before each tests, but I think having the 
> > exact python code used may help people to understand what should be the 
> > behavior, and refering to the python code to understand the conversion.
> 
> Help, sure. Be the *only* documentation, absolutely not.
> 
> Let's turn this around. You run kunit, one of these tests fail:
> 
>  - It adds cognitive load to try to identify and make sense of an
>    unknown lib.
> 
>  - How can we check that the arguments you provided there are the one
>    you actually wanted to provide, and you didn't make a typo?
> 
> > I can add something like this before each tests to clarify the tested 
> > case:
> > 
> > 	Test cases for conversion between YUV BT601 limited range and 
> > 	RGB using the ITU-R BT.601 weights.
> > 
> > Or maybe just documenting the structure yuv_u8_to_argb_u16_case:
> > 
> > 	@encoding: Encoding used to convert RGB to YUV
> > 	@range: Range used to convert RGB to YUV
> > 	@n_colors: Count of test colors in this case
> > 	@format_pair.name: Name used for this color conversion, used to 
> > 			   clarify the test results
> > 	@format_pair.rgb: RGB color tested
> > 	@format_pair.yuv: Same color as @format_pair.rgb, but converted to 
> > 			  YUV using @encoding and @range.
> > 
> > What do you think?
> 
> That it's welcome, but it still doesn't allow to figure out what your
> intent was with this test 2 years from now.

I don't really understand what you want to add. Can you explain what you 
expect here? Did you mean you want a description like this above the test 
function?

/*
 * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
 * colors to ARGB colors in VKMS
 *
 * This test will use the functions get_conversion_matrix_to_argb_u16 and
 * argb_u16_from_yuv888 to convert YUV colors (stored in
 * yuv_u8_to_argb_u16_cases) into ARGB colors.
 *
 * As there is a different range between YUV input (8 bits) and RGB output (16
 * bits), the values are not checked exactly but ensured that they are within
 * the uncertainty range.
 */

Thanks,
Louis Chauvet

> Maxime


