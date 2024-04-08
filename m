Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE65E89B934
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2E4112207;
	Mon,  8 Apr 2024 07:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ENzP4bmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F211220A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:50:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ECF91BF204;
 Mon,  8 Apr 2024 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712562622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEJD3OSjACyixRik8hGnxMF3pYou/HReMe01GlqMPOQ=;
 b=ENzP4bmtlShtGEpslWkF37pMHjtQVB1jkjIPugGqmM93CLGD3BMcrW/d5DZIEhE352n8SA
 UtMdo47f3NP/bVyH1Akd/sjriT1xKycIQl6lmhRscG/8zQoMzT4Whqhca4BzEPv3eaEkqk
 hFtHHB9w0uu1bMG6WxheIplnVJ00wVuBpv7yxqPeE596h82jE1y9Pek+ujAhF2l635PPav
 07M8FBqrVKNSc+UJGIlZXZJcqFNsPSvd+pnB8y4VsNsPdnUF/4W991rcTXt17qTXL+gAXJ
 RCU/I+n92qr1T3oeDkj5F6bz25dA8ekFgdCuu6OBCKQojKrNbRII5H+Eg1X4zQ==
Date: Mon, 8 Apr 2024 09:50:19 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Message-ID: <ZhOhu7PVNa_xMkN9@louis-chauvet-laptop>
Mail-Followup-To: Philipp Zabel <p.zabel@pengutronix.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
 <5f6ab3804baa87f6e2299f668d2ab41be3a13f13.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f6ab3804baa87f6e2299f668d2ab41be3a13f13.camel@pengutronix.de>
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

Le 27/03/24 - 13:11, Philipp Zabel a écrit :
> Hi Louis,
> 
> On Mi, 2024-03-13 at 18:45 +0100, Louis Chauvet wrote:
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Add support to the YUV formats bellow:
> > 
> > - NV12/NV16/NV24
> > - NV21/NV61/NV42
> > - YUV420/YUV422/YUV444
> > - YVU420/YVU422/YVU444
> > 
> > The conversion from yuv to rgb is done with fixed-point arithmetic, using
> > 32.32 floats and the drm_fixed helpers.
> 
> s/floats/fixed-point numbers/
> 
> Nothing floating here, the point is fixed.
> 
> [...]
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 23e1d247468d..f3116084de5a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
> >  				  int y_start, enum pixel_read_direction direction, int count,
> >  				  struct pixel_argb_u16 out_pixel[]);
> >  
> > +/**
> > + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values
> 
> s/CONVERSION_MATRIX_FLOAT_DEPTH/CONVERSION_MATRIX_FRACTIONAL_BITS/
> 
> Just a suggestion, maybe there are better terms, but using "FLOAT" here
> is confusing.
> 
> > + */
> > +#define CONVERSION_MATRIX_FLOAT_DEPTH 32
> > +
> > +/**
> > + * struct conversion_matrix - Matrix to use for a specific encoding and range
> > + *
> > + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> > + * used to compute rgb values from yuv values:
> > + *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> > + *   OR for yvu formats:
> > + *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> > + *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOAT_DEPTH
> 
> s/fixed floats/fixed-point numbers/

Thanks for those precision, I will change the wording in v6.

Louis Chauvet
 
> regards
> Philipp

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
