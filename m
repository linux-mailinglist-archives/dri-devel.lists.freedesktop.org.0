Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33714870620
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FADD11224E;
	Mon,  4 Mar 2024 15:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OTjcR5kw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF3A1122B7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:48:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A38A0C0003;
 Mon,  4 Mar 2024 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709567323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0Rx6kS4aBKT4TZ4Uy9UR+iMb1g1h163O9nRLaaNYMk=;
 b=OTjcR5kwIY3YRerZd/3Rlvx9nRKePt5/jdKJxCevdagYUuXXF1Y4rd9zDjufno3GUZzYCR
 io+/YROohcglgoAZAk2tOMTBScP0keHzqcyFUCwpfkD/MfPFTZlrDytIFc1CEwHEFZWgze
 0pAtClsvJ4+8MoPpWsVQizCrTqh1vqtl/6oBW/Y8eCp3Kx9qcJ4nlalkIcBVmHCcVDL3kw
 EoF62Ciw9bw0d7q0FKUwFOyruLtvQcEE02iYPItnZQocJiXl3vZyuV2eGHeV3a2nmtMGOr
 0yaU+GTPUsQpwelFhrRDp/LwSFBS2dvou1M7hLTthr/btuvAzILJEIpOKbV5UA==
Date: Mon, 4 Mar 2024 16:48:40 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
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
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Message-ID: <ZeXtWAM1XDEhxWOM@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
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
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
 <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
 <20240229141238.51891cad.pekka.paalanen@collabora.com>
 <ZeXoo4DJxlzhuK4W@localhost.localdomain>
 <fde6b1d5-56c9-43d0-9ccc-87683b700734@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde6b1d5-56c9-43d0-9ccc-87683b700734@riseup.net>
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

> > @arthur, I will submit a v4 with this:
> > - matrix selection in plane_atomic_update (so it's selected only once)
> > - s64 numbers for matrix
> > - avoiding multiple loop implementation by switching matrix columns
> 
> This looks good to me.
> 
> > 
> > Regarding the YUV part, I don't feel confortable adressing Pekka's 
> > comments, would you mind doing it?
> 
> I'm already doing that, how do you want me to send those changes? I reply to
> your series, like a did before?

Yes, simply reply to my series, so I can rebase everything on the 
line-by-line work.
 
Kind regards,
Louis Chauvet

> Best Regards,
> ~Arthur Grillo
> 
> > 
> > Kind regards,
> > Louis Chauvet
> > 
> > [...]
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
