Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB4A171A1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042CF10E474;
	Mon, 20 Jan 2025 17:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PUTVb1uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4545D10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:26:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14F5FC0005;
 Mon, 20 Jan 2025 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737393970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijTWdScLTPpPCAjS9MA1NnWiveUzPhKnYGHD1lHAZms=;
 b=PUTVb1uvv6ybKH6EGFcRSapZX7S8XWjogODpv6zI3BzON4r2V356vTaBJr1o55nM+t0lK+
 VjmNY0TjXl/+jmxjFEeNRTydn+wF58nbI/6GulO1xI26n8BN10dxmU8XBRFdtOfbVX5ns2
 HtrAgAdQXNOjHtJGfGz73Uqpu2bj1vRxYGGY4H0ff9IfiImXxB/0GPatxmryEitHRorwsB
 4AOqvKPXvI2BBBSfSbNfSX5lXqUiBYQv9NIDsNTBP8uMLNbpp/RVjkxrnQaenQB08tJ5pp
 jPuuJq2u7ZniI1ntAufRoY/XNBzLLsdpHFucGC65nRSBRCeE3H/lxAf8wp+tEg==
Date: Mon, 20 Jan 2025 18:26:07 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v4 3/3] drm/vkms: Switch to dynamic allocation for CRTC
Message-ID: <Z46HL-eSSA2EsPCi@louis-chauvet-laptop>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120162327.2866-1-jose.exposito89@gmail.com>
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

On 20/01/25 - 17:23, José Expósito wrote:
> > A specific allocation for the CRTC is not strictly necessary at this
> > point, but in order to implement dynamic configuration of VKMS (configFS),
> > it will be easier to have one allocation per CRTC.
> > 
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---

[...]

> > +	/* Initialize the writeback component */
> >  	if (vkmsdev->config->writeback) {
> > -		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> > +		writeback = vkms_enable_writeback_connector(vkmsdev, output);
> >  		if (writeback)
> >  			DRM_ERROR("Failed to init writeback connector\n");
> >  	}
> 
> Hi Louis,
> 
> Thanks for fixing this error condition.
> 
> I have been working and running automated tests on top of this series and
> I haven't found any other issue.
> 
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks a lot! I will merge this tomorrow.

What is your automated tests series? 

I will also send tomorrow a new rebased iteration for:
- https://patchwork.freedesktop.org/series/140786/
- https://patchwork.freedesktop.org/series/133698/
- https://patchwork.freedesktop.org/patch/625883/

If someone can look on them and leave some reviews, I will be very happy 
to apply them!

I will also send a first version of the configFS work (two distincts 
series to make the review easier). 

Thanks a lot,
Louis Chauvet

