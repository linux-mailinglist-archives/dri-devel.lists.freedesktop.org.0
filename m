Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C1A25FC7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 17:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E644810E4FD;
	Mon,  3 Feb 2025 16:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VGzLqo7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3C410E4FD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:20:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64D014429D;
 Mon,  3 Feb 2025 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738599646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYz4KDbtDKCjrsbHPX2KqcCz6vpI0HGScIWPHv7yNeY=;
 b=VGzLqo7ru3D7byHGtK6ocWVcwnSs36x6BnaWyYIukQWJhHOtQn/ZBtEImP02ZGUViqbu3b
 eF0+2qyDnuD4vcvel0aJadqM8isOU/j/bTLY3iUyS9ng8PyET8lRFbbyHGEGXs6vRvXn3v
 0BQefURaqb48Ua8GSquRvHV9ZuobtYv71QewVDX6gRYJOkrpGKkV3p+iphKdksNFi/vyxv
 XHXN2PCwo708ruuSd0ojlLFGbygxbsEz4d5d/FD99DKM1TFDiRSSZdF1IXS+oiWSQONpMt
 iltSwgN3+aE4OuuK3uzeecxg4tP6ALEqKheyGFg/u59G9j+gE5lc2DWf328kRA==
Date: Mon, 3 Feb 2025 17:20:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Message-ID: <20250203172044.74967850@bootlin.com>
In-Reply-To: <lu2crev4ikpn2tu6mizmvi4oorb7tbat2uxmcci3qekqi4ohqq@vfps25gpnurk>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-4-herve.codina@bootlin.com>
 <lu2crev4ikpn2tu6mizmvi4oorb7tbat2uxmcci3qekqi4ohqq@vfps25gpnurk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekfedtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduveetteevfeevhfeikeehheeujeehfeeutdehgfeiieffteekieevfeehffeiteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsthgvihhnsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Dmitry,

On Mon, 3 Feb 2025 17:56:46 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Mon, Feb 03, 2025 at 03:58:22PM +0100, Herve Codina wrote:
> > The current code uses a the reset_pipe() local function to reset the
> > CRTC outputs.
> > 
> > drm_atomic_helper_reset_crtc() has been introduced recently and it
> > performs exact same operations.
> > 
> > In order to avoid code duplication, use the new helper instead of the
> > local function.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
> >  1 file changed, 1 insertion(+), 29 deletions(-)
> >   
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

I messed me up in this v4. It doesn't apply on top of v6.14-rc1.

I already sent a v5 to fix that.

Can you add your tag on the v5?

Of course, I will add them myself if a v6 is needed.

I am sorry about my mistake.

Apologies,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
