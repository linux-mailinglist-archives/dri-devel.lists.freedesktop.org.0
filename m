Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D2A4FF75
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A298945A;
	Wed,  5 Mar 2025 13:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jsEXxU28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90F10E09B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:04:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26E0A440EC;
 Wed,  5 Mar 2025 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741179880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5cKEtirGP0Rs6xzOYVU1k4mOvhjvDHY1CUqXTEhlOU=;
 b=jsEXxU282Zw46sinma0efR/mPTZgANVomjhkHqlfO1cy+Idd/VmHwO3ZQKP87d7UdnhiKh
 asJRJT4AtKRNZDxgTtQ4oJ/bc0/cBgDsw//8oPtdoCglq/ZUl41+VD11WoYvDKm8UIs9ER
 rwVnSM69MG20kE55V/6Vn/I8Gw3B0ti78t7wpW6W87p8W30UuR++NWbKmiSVNdXQxSr9HZ
 598TXzrMGMEYaR0MLrvlqcbXsoNN3/TP/42z2kTsbcHMD0PRAuFqV1p08JlXqJ7AxeqhkC
 7ix78TvKNnLgGbmcsgcWazsoIBvp9PJ3bsOLqPvi0YhAvLfyN5CU7NIIWucFxA==
Date: Wed, 5 Mar 2025 14:04:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas
 Anderson <dianders@chromium.org>, Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 01/16] drm/bridge: Add encoder parameter to
 drm_bridge_funcs.attach
Message-ID: <20250305140436.2903b88d@booty>
In-Reply-To: <20250304-bridge-connector-v5-1-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-1-aacf461d2157@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdegkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrn
 hhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
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

On Tue, 04 Mar 2025 12:10:44 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> The drm_bridge structure contains an encoder pointer that is widely used
> by bridge drivers. This pattern is largely documented as deprecated in
> other KMS entities for atomic drivers.
> 
> However, one of the main use of that pointer is done in attach to just
> call drm_bridge_attach on the next bridge to add it to the bridge list.
> While this dereferences the bridge->encoder pointer, it's effectively
> the same encoder the bridge was being attached to.
> 
> We can make it more explicit by adding the encoder the bridge is
> attached to to the list of attach parameters. This also removes the need
> to dereference bridge->encoder in most drivers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
