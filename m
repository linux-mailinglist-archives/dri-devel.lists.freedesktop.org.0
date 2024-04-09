Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24E89D640
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79232112C4C;
	Tue,  9 Apr 2024 10:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EhDDzU8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C274112C4B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:06:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D6AD1BF20A;
 Tue,  9 Apr 2024 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712657169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqqIhw8jAz1IoeoUfDX7ZgfwWio/XO2e8ETDGPutQoo=;
 b=EhDDzU8sbXO2ORX1BNpoLu25UrKjUEPzb9gNNo8miMT0FPupYk7lY0bAQanUccet26IqAA
 psBd8WSI0zQ52F3Vpp8D0z7YBSorfAiM9JP9EPexHpKShEAdMEQETjIjreZN1sIFTYZt7t
 7/ltiVNI+C4klRoDpshneoU+hPBcRI+GEKJsCE8k3K2qFsgUgOUaVpHYK445VMHIjFZFXa
 qZ6FXEavoyigREs61NNE951CB7nxmJDWUI4mZOMUvi6UrTX/OKwdtAVSNS2iEz0tluLtrY
 OsMOJjfJKtrHobVLsCn3qLAX2a+tkexP7azuvYP8r6dkw+uE3x9SN389tCJI7A==
Date: Tue, 9 Apr 2024 12:06:06 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 09/16] drm/vkms: Introduce pixel_read_direction enum
Message-ID: <ZhUTDvdsi2I-7-nE@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
 <20240325151103.0a5f7112.pekka.paalanen@collabora.com>
 <ZgLwTJVb_Z_MHuCp@localhost.localdomain>
 <20240327141629.48ec16f2.pekka.paalanen@collabora.com>
 <ZhOhupo3bf6Cxasy@louis-chauvet-laptop>
 <20240409103537.44e99854.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409103537.44e99854.pekka.paalanen@collabora.com>
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

Le 09/04/24 - 10:35, Pekka Paalanen a écrit :
> On Mon, 8 Apr 2024 09:50:18 +0200
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Le 27/03/24 - 14:16, Pekka Paalanen a écrit :
> > > On Tue, 26 Mar 2024 16:57:00 +0100
> > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > >   
> > > > Le 25/03/24 - 15:11, Pekka Paalanen a écrit :  
> > > > > On Wed, 13 Mar 2024 18:45:03 +0100
> > > > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > > >     
> > > > > > The pixel_read_direction enum is useful to describe the reading direction
> > > > > > in a plane. It avoids using the rotation property of DRM, which not
> > > > > > practical to know the direction of reading.
> > > > > > This patch also introduce two helpers, one to compute the
> > > > > > pixel_read_direction from the DRM rotation property, and one to compute
> > > > > > the step, in byte, between two successive pixel in a specific direction.
> > > > > > 
> > > > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
> > > > > >  drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++++++
> > > > > >  3 files changed, 77 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > > > index 9254086f23ff..989bcf59f375 100644
> > > > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> 
> > > > > I hope IGT uses FB patterns instead of solid color in its tests of
> > > > > rotation to be able to detect the difference.    
> > > > 
> > > > They use solid colors, and even my new rotation test [3] use solid colors.  
> > > 
> > > That will completely fail to detect rotation and reflection bugs then.
> > > E.g. userspace asks for 180-degree rotation, and the driver does not
> > > rotate at all. Or rotate-180 getting confused with one reflection.  
> > 
> > I think I missunderstood what you means with "solid colors".
> > 
> > The tests uses a plane with multiple solid colors:
> > 
> > +-------+-------+
> > | White | Red   |
> > +-------+-------+
> > | Blue  | Green |
> > +-------+-------+
> > 
> > But it don't use gradients because of YUV.
> >
> 
> Oh, that works. No worries then.
> 
> > > > It is mainly for yuv formats with subsampling: if you have formats with 
> > > > subsampling, a "software rotated buffer" and a "hardware rotated buffer" 
> > > > will not apply the same subsampling, so the colors will be slightly 
> > > > different.  
> > > 
> > > Why would they not use the same subsampling?  
> > 
> > YUV422, for each pair of pixels along a horizontal line, the U and V 
> > components are shared between those two pixels. However, along a vertical 
> > line, each pixel has its own U and V components.
> > 
> > When you rotate an image by 90 degrees:
> >  - Hardware Rotation: If you use hardware rotation, the YUV subsampling 
> >    axis will align with what was previously the "White-Red" axis. The 
> >    hardware will handle the rotation.
> >  - Software Rotation: If you use software rotation, the YUV subsampling 
> >    axis will align with what was previously the "Red-Green" axis.
> 
> That would be a bug in the software rotation.

Yes, but it is very complex to fix I think, so I did not chose 
this path :)
 
> > Because the subsampling compression axis changes depending on whether 
> > you're using hardware or software rotation, the compression effect on 
> > colors will differ. Specifically:
> >  - Hardware rotation, a gradient along the "White-Red" axis may be 
> >    compressed (i.e same UV component for multiple pixels along the 
> >    gradient).
> >  - Software rotation, the same gradient will not be compressed (i.e, each 
> >    different color in the gradient have dedicated UV component)
> > 
> > The same reasoning also apply for "color borders", and my series [3] avoid 
> > this issue by choosing the right number of pixels.
> 
> What is [3]?

I don't know why I put [3] here, I probably mixed references between mails

[3]: https://lore.kernel.org/all/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com/
 
> I've used similar tactics in the Weston test suite, when I have no
> implementation for chroma siting: the input and reference images
> consist of 2x2 equal color pixel groups, so that chroma siting makes no
> difference. When chroma siting will be implemented, the tests will be
> extended.
> 
> Is there a TODO item to fix the software rotation bug and make the
> tests more sensitive?
> 
> I think documenting this would be an ok intermediate solution.
> 
> > > The framebuffer contents are defined in its natural orientation, and
> > > the subsampling applies in the natural orientation. If such a FB
> > > is on a rotated plane, one must account for subsampling first, and
> > > rotate second. 90-degree rotation does not change the encoded color.
> > > 
> > > Getting the subsampling exactly right is going to be necessary sooner
> > > or later. There is no UAPI for setting chroma siting yet, but ideally
> > > there should be.
> > >   
> > > > > The return values do seem correct to me, assuming I have guessed
> > > > > correctly what "X" and "Y" refer to when combined with rotation. I did
> > > > > not find good documentation about that.    
> > > > 
> > > > Yes, it is difficult to understand how rotation and reflexion should 
> > > > works in drm. I spend half a day testing all the combination in drm_rect_* 
> > > > helpers to understand how this works. According to the code:
> > > > - If only rotation or only reflexion, easy as expected
> > > > - If reflexion and rotation are mixed, the source buffer is first 
> > > >   reflected and then rotated.  
> > > 
> > > Now that you know, you could send a documentation patch. :-)  
> > 
> > And now I'm not sure about it :)
> 
> You'll have people review the patch and confirm your understanding or
> point out a mistake. A doc patch it easier to notice and jump in than
> this series.

I just send it [4], you are in copy.

[4]: https://lore.kernel.org/all/20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com/

> > I was running the tests on my v6, and for the first time ran my new 
> > rotation [3] on the previous VKMS code. None of the tests for 
> > ROT_90+reflexion and ROT_270+reflexion are passing...
> > 
> > So, either the previous vkms implementation was wrong, or mine is wrong :)
> > 
> > So, if a DRM expert can explain this, it could be nice.
> > 
> > To have a common example, if I take the same buffer as above 
> > (white+red+blue+green), if I create a plane with rotation = 
> > ROTATION_90 | REFLECTION_X, what is the expected result?
> > 
> > 1 - rotation then reflection 
> > 
> > +-------+-------+
> > | Green | Red   |
> > +-------+-------+
> > | Blue  | White |
> > +-------+-------+
> > 
> > 2 - reflection then rotation (my vkms implementation)
> > 
> > +-------+-------+
> > | White | Blue  |
> > +-------+-------+
> > | Red   | Green |
> > +-------+-------+
> > 
> 
> I wish I knew. :-)
> 
> Thanks,
> pq
> 
> 
> > > For me as a userspace developer, the important place is
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-plane-properties
> > >   


