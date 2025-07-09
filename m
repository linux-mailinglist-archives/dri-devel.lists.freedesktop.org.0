Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106BAFED72
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 17:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A641110E0BC;
	Wed,  9 Jul 2025 15:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jmrfOYDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6DA10E0BC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 15:17:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A68644A15;
 Wed,  9 Jul 2025 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752074260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfLLLC/coJUNS4s3ydMc+7GREukJb5AW44xl+9So/eM=;
 b=jmrfOYDfcslyHG3NucOxWlhR3RZLY5SFKDG/7Qsvjdnd/YC3pMIqTjWI2cXaRNhQYAApH8
 FtoRF3l9Q9s+NOnDMDdgkFIpnMsv18LGDCo7OwVe05xlJyQYKR4kaLJDAy5NEPUEjqPlA/
 uuavvcYDn+Zf8ykKcU1+85mbK3f0p5mAiz4l44N+z6UySPcuUY59OtaUbuTg9hguM9/zbS
 yJJPhgQzJ7WmF2G4vW89UzLnAe3myMfK/aYeIcCRbd5xNq0oXloA4WY02EfvC9S721nUKG
 y7UVcA+MIMB9kiH2tJRUIfOUqk1Ox3/ErfaOszfUGohyxrEnKnmDyYCjZkZSEw==
Date: Wed, 9 Jul 2025 17:17:12 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm: fix missing conversions of bridge drivers to
 devm_drm_bridge_alloc()
Message-ID: <20250709171712.768c8985@booty>
In-Reply-To: <20250709-rebel-jackdaw-of-promise-8bf5d3@houat>
References: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
 <175205374260.60140.13824257782987722025.b4-ty@bootlin.com>
 <20250709-rebel-jackdaw-of-promise-8bf5d3@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlrghinhdrvhholhhmrghtsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprhhgrghllhgrihhsphhouhesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomh
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

On Wed, 9 Jul 2025 14:05:51 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Jul 09, 2025 at 11:35:42AM +0200, Luca Ceresoli wrote:
> > 
> > On Tue, 08 Jul 2025 17:24:41 +0200, Luca Ceresoli wrote:  
> > > Most DRM bridge drivers have been converted to devm_drm_bridge_alloc() by
> > > [0], but a few drivers were missed. One got converted by [1], this series
> > > converts all the (known) remaining ones.
> > > 
> > > Thanks Marek for having found and reported them!
> > > 
> > > [0] https://lore.kernel.org/all/20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com/
> > > [1] https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/
> > > 
> > > [...]  
> > 
> > Applied, thanks!
> > 
> > [1/2] drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
> >       commit: ac4531424d907f3983e919a7bda2b90ea0cede4f
> > [2/2] drm/sti: hda: convert to devm_drm_bridge_alloc() API
> >       commit: 602d565d3c10dfb2dfd397f65078cb603a26a513  
> 
> You sent the patches yesterday, it would have been nice to wait a few
> days for the maintainers to answer.

Apologies. Being a fix, I thought it would make sense to apply them
quickly. Note taken.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
