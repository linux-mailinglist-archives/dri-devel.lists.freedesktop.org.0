Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C718744EF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 01:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7032010E6B4;
	Thu,  7 Mar 2024 00:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oxW6sYPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F7D10E480
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 00:03:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75658C0005;
 Thu,  7 Mar 2024 00:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709769816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSCVwRBqqpIFk80Ndvwhk2GhpYykGyN7ek/hm0Pe3Nw=;
 b=oxW6sYPZZ/MWrDkustYOSq/f4GUYIvFBdKIvGEvQSNQHbb+dKpAzGZaGZcw6cIxumpTQow
 cKG6rf9UvLgefQ+BwhZ1Fo7vIe4nt7JgtvksQdYeAASuizgMYFWdt0hmL4nat1ja8JgFEI
 D3UOEAU5yDn3G1CLV57Dt56KQgte9PFR0/Svddpl8s3HVUWpOvR60BUSh9Gv932/0w5Vov
 KG2Ia04l91eQnOoxxR9SHKaJ30V2E4vKnlBqJHEHyelLKiRzeyrXzz/VjXz3celS9j6ny5
 l4IQBEx7kkGQhBY2/W3IGgg+4taSCRjWKP4JF1mV1Fug9yrXAvR6/0h8OjLphA==
Date: Thu, 7 Mar 2024 01:03:32 +0100
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
Message-ID: <ZekEVOz6NHHnu0Yj@localhost.localdomain>
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
References: <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
 <20240229141238.51891cad.pekka.paalanen@collabora.com>
 <ZeXoo4DJxlzhuK4W@localhost.localdomain>
 <fde6b1d5-56c9-43d0-9ccc-87683b700734@riseup.net>
 <ZeXtWAM1XDEhxWOM@localhost.localdomain>
 <a1de0c95-cb5f-456d-8831-684b4e5573db@riseup.net>
 <b8bf9fb9-ea1b-468d-8d56-81c6a9ea6466@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8bf9fb9-ea1b-468d-8d56-81c6a9ea6466@riseup.net>
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

Le 06/03/24 - 17:09, Arthur Grillo a écrit :
> 
> 
> On 04/03/24 13:51, Arthur Grillo wrote:
> > 
> > 
> > On 04/03/24 12:48, Louis Chauvet wrote:
> [...]
> >>>
> >>>> Regarding the YUV part, I don't feel confortable adressing Pekka's 
> >>>> comments, would you mind doing it?
> >>>
> >>> I'm already doing that, how do you want me to send those changes? I reply to
> >>> your series, like a did before?
> >>
> >> Yes, simply reply to my series, so I can rebase everything on the 
> >> line-by-line work.
> > 
> > OK, I will do that.
> 
> Hi,
> 
> I know that I said that, but it would be very difficult to that with my
> b4 workflow. So, I sent a separate series based on the v4:
> 
> https://lore.kernel.org/all/20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net/
> 
> I hope that it does not difficult things for you.

Thanks for this work!

I completly understood, and a "real" patch is even better as I 
can fetch them through patchwork. The v5 is (almost, see my comment)
ready, but I want to wait for Pekka's comments/replies on the v4 before 
sending it. 

Kind regards,
Louis Chauvet

> Best Regards,
> ~Arthur Grillo
> 
> > 
> > Best Regards,
> > ~Arthur Grillo
> > 
> >> Kind regards,
> >> Louis Chauvet
> >>
> >>> Best Regards,
> >>> ~Arthur Grillo
> >>>
> >>>>
> >>>> Kind regards,
> >>>> Louis Chauvet
> >>>>
> >>>> [...]
> >>>>
> >>

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
