Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B264A294C4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 16:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6166010E3FB;
	Wed,  5 Feb 2025 15:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YFxgY+og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752810E7DC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 15:32:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67F001F764;
 Wed,  5 Feb 2025 15:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738769530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXBU1vPryPoRK7OtPk6233LZHDNAPJC+VTW6t5S7CHw=;
 b=YFxgY+ogzEwFf7iikNxyOCh/esYr2SxiBm2SuBCdURdGh+VfGNSwES4+l0fLapZblRi6DC
 I+t4vJw6lJA4TCjipDWLTsQZL+hql+5wIgJ/SnYN8PONBWtXQeo+EDlPJX/O4Lr2e5UPew
 hAQh/4Oe0OGKSrzQNwsHmhJ8zvaYbS2ZQE0YRuo++uQZvQqWEHh9Pv5JiymDUuZTt0Qigm
 RBo2sza659Y2x98e4lcX3aZF/FgPZfPt+JhxHLoYIusOJuh/E6GEm4rzIvIYlCjhpgPyMl
 raB21FYZ9bk6yElNcbSk01/Tkfv1O0Cql/dI1PuYwGEvGGL7Z5QNKu8/Qt2oKg==
Date: Wed, 5 Feb 2025 16:32:07 +0100
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
Message-ID: <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
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
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
 <20250205-pristine-perch-of-abundance-7abac1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-pristine-perch-of-abundance-7abac1@houat>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfefhgffgfeelveekvdejfedufeegffdvkeeileeuhedthfegjeeikeehheeukeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtphhtthhopehhrghmohhhrghmmhgvugdrs
 hgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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

On 05/02/25 - 09:55, Maxime Ripard wrote:
> On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote:
> > On 26/01/25 - 18:06, Maxime Ripard wrote:
> > > On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
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
> > > > +	 *
> > > > +	 * Test cases for conversion between YUV BT601 full range and RGB
> > > > +	 * using the ITU-R BT.601 weights.
> > > > +	 */
> > > 
> > > What are the input and output formats?
> > > 
> > > Ditto for all the other tests.
> > 
> > There is no really "input" and "output" format, they are reference values 
> > for conversion, you should be able to use it in both direction. They are 
> > generated by RGB_to_YCbCr (RGB input, YUV output) just because it was 
> > easier to create the colors from RGB values.
> 
> RGB and YUV aren't formats, they are color models. XRGB8888 is a format.
> NV12 is a format.
>
> > If you think we should specify what is was used as input and output to 
> > generate those values, I can modify the comment to:
> > 
> > 	Tests cases for color conversion generated by converting RGB 
> > 	values to YUV BT601 full range using the ITU-R BT.601 weights.
> 
> My point is that those comments should provide a way to reimplement the
> test from scratch, and compare to the actual implementation. It's useful
> when you have a test failure and start to wonder if the implementation
> or the test is at fault.
> 
> By saying only RGB and YUV, you can't possibly do that.

I understand your concern, but I believe there might be a slight 
misunderstanding. The table in question stores reference values for 
specific color models, not formats. Therefore, it doesn't specify any 
particular format like XRGB8888 or NV12.

To clarify this, I can rename the format_pair struct to value_pair. This 
should make it clearer that we are dealing with color model values rather 
than formats.

If you want to test a specific format conversion, such as 
YUV420_to_argbu16, you would need to follow a process like this:

	// Recreate a YUV420 data
	plane_1[0] = test_case.yuv.y
	plane_2[0] = test_case.yuv.u
	plane_2[1] = test_case.yuv.v

	// convertion to test from YUV420 format to argb_u16
	rgb_u16 = convert_YUV420_to_argbu16(plane_1, plane_2)

	// ensure the conversion is valid
	assert_eq(rgb_u16, test_case.rgb)

The current test is not performing this kind of format conversion. 
Instead, it verifies that for given (y, u, v) values, the correct (r, g, 
b, a) values are obtained. In other words, it tests color model 
conversion, not format conversion.

Do you think I need to change something in this test? If so, can you 
explain what kind of unit test you are expecting.

Thanks,
Louis Chauvet

> > Beside that modification, did you notice anything else on the series that 
> > require more work before adding your Ack-by/Reviewed-by on the other 
> > patches?
> 
> The rest looked good to me the last time I looked.
>
> Maxime


