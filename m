Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDBA181A1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 17:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A246F10E5F4;
	Tue, 21 Jan 2025 16:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QDFViMwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6650810E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 16:03:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF2B440004;
 Tue, 21 Jan 2025 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737475407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Siaw3L481abmORrY2k86tlJvy1LDxpfizwQAPP/yCcw=;
 b=QDFViMwZ0NIVroK46zpdSFuqPQ8XP7BApXmoa91s4wQJiT262bKY2DAhOC0Ddb11kFFmjW
 ell3e8Xx94FnZWQmzNGTN67MElu5JDy04k1GYq3axIwzMC91A1DG9WQ4sdUVUgaGYs24hv
 dT3agW+XzIE/PE/+MCEBAAwJCR+vdQ2omOelmQo7hc3hEgE+dA20Kp6EsaibTvnTGJgsle
 VtH0YzutAvtwdalg1jhINPSsC6GuXF7HJ42BJe5FFYQgdUK/oxmRC+TAk/2hOQZcCK3b7A
 ul3w7L1OC9v7fOdegtsbHoN7S/c8URAyweup+/MDO5TN3CPgRcB04uSDScSR4w==
Date: Tue, 21 Jan 2025 17:03:25 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v4 3/3] drm/vkms: Switch to dynamic allocation for CRTC
Message-ID: <Z4_FTTvgf7JNj0h4@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20250117-b4-vkms-allocated-v4-3-8ec8fd21aaf6@bootlin.com>
 <20250120162327.2866-1-jose.exposito89@gmail.com>
 <Z46HL-eSSA2EsPCi@louis-chauvet-laptop> <Z496wgH0AyaoSHdW@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z496wgH0AyaoSHdW@fedora>
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

On 21/01/25 - 11:45, José Expósito wrote:
> On Mon, Jan 20, 2025 at 06:26:07PM +0100, Louis Chauvet wrote:
> > On 20/01/25 - 17:23, José Expósito wrote:
> > > > A specific allocation for the CRTC is not strictly necessary at this
> > > > point, but in order to implement dynamic configuration of VKMS (configFS),
> > > > it will be easier to have one allocation per CRTC.
> > > > 
> > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > ---
> > 
> > [...]
> > 
> > > > +	/* Initialize the writeback component */
> > > >  	if (vkmsdev->config->writeback) {
> > > > -		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> > > > +		writeback = vkms_enable_writeback_connector(vkmsdev, output);
> > > >  		if (writeback)
> > > >  			DRM_ERROR("Failed to init writeback connector\n");
> > > >  	}
> > > 
> > > Hi Louis,
> > > 
> > > Thanks for fixing this error condition.
> > > 
> > > I have been working and running automated tests on top of this series and
> > > I haven't found any other issue.
> > > 
> > > Reviewed-by: José Expósito <jose.exposito89@gmail.com>
> > 
> > Thanks a lot! I will merge this tomorrow.
> > 
> > What is your automated tests series? 
> 
> On the kernel side, I keep working on the ConfigFS patches here:
> https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/

I saw your message just after sending my "vkms-config" series, I am 
currently looking at your commits to see what are the changes.

I also sent an RFC for the ConfigFS interface, I did not change a lot of 
thing. I think the two major changes are:
- Adding format configuration
- Removing YUV related configuration (encoding/range)

> It sits on top of your work to switch to managed memory. But now that
> the code is merged, it needs to be rebased.
>
> You'll notice that I kept your signed-off-by in many patches, as I
> tried to reuse as much common code as possible.

Yes, thank you. I will compare with my work and understand your change.

> About the automated testing, the series could be split in two:

I agree, and indeed that what I meant in my previous mail :-)
I did not sent them earlier because I wanted to merge 
vkms-managed/allocated before.

> - vkms_config.h/c, which is tested with KUnit

Yes! Thank you for this, I wrote only very basic tests, so thank you for 
your extended kunit tests. 

> - ConfigFS, tested with IGT:
>   https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs

You did a really great job writting those tests! Please CC me 
when you will send them, I will be very happy to review them.

> I made some wrong assumptions with connectors, for example, it is
> possible to create a device without connectors and hot-add/remove
> them later, and I'm still fixing them and writing tests.
> Once that work is done I'll send the series to the ML.

I did the same asumption, so my series is also broken on this point. I 
don't want to duplicate the work, so I'm looking forward to your series!

Thanks for this amazing work,
Louis Chauvet

> Jose
> 
> > I will also send tomorrow a new rebased iteration for:
> > - https://patchwork.freedesktop.org/series/140786/
> > - https://patchwork.freedesktop.org/series/133698/
> > - https://patchwork.freedesktop.org/patch/625883/
> > 
> > If someone can look on them and leave some reviews, I will be very happy 
> > to apply them!
> > 
> > I will also send a first version of the configFS work (two distincts 
> > series to make the review easier). 
> > 
> > Thanks a lot,
> > Louis Chauvet
> > 
