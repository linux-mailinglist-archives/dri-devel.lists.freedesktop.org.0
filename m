Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42621AFB1A4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7410E440;
	Mon,  7 Jul 2025 10:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nj30RvUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A6610E43C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 10:50:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D9864316C;
 Mon,  7 Jul 2025 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751885432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nL3IJ5osSagrIIgvQZfPceQ9374c+AjQb8HIJvaM5Ko=;
 b=nj30RvUOar2z6zj+iaWv2J8HB2x5NwxKmRsjF1LsARGeAVCyGravOtcHIc8LAAbtIXnoBn
 04tGF7MJb2UumibPwpu1HBUkxGu4LU0yTftwyZRQrFrGosXdH45bMWl/KxkU9tu5hgvfWS
 6fufJSZj0xQr0GZA/kLt40iftlE/+8q1hoakHm/VT3J2csDXZl01q9TjezaJeLTfQQyNFK
 2YUfh8AaRer4RPo/kyNvl0sZBU0Dpv7hE9IJyrJAZ9Sr+zYSl4VvJkHwta4xvu2sXNbRz3
 YHnX7OA2uMNQrrh4XY7wpDzC1FgnsQC2TIZF2jCQkDb0zK57qFPvDQL59oZI3w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Damon Ding <damon.ding@rock-chips.com>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20250627165652.580798-1-m.szyprowski@samsung.com>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
Message-Id: <175188541197.52287.1957637122955318630.b4-ty@bootlin.com>
Date: Mon, 07 Jul 2025 12:50:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieefvdehvedvgeeftedugeetudevuedvffekhedvfeetkeduleelgeevudffieeinecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmo
 hhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepuggrmhhonhdrughinhhgsehrohgtkhdqtghhihhpshdrtghomh
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


On Fri, 27 Jun 2025 18:56:52 +0200, Marek Szyprowski wrote:
> devm_drm_bridge_alloc() is the new API to be used for allocating
> (and partially initializing) a private driver struct embedding
> a struct drm_bridge.
> 
> Analogix DP driver somehow missed the automated conversion in commit
> 9c399719cfb9 ("drm: convert many bridge drivers from devm_kzalloc() to
> devm_drm_bridge_alloc() API"), what causes the following warning:
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
      commit: 48f05c3b4b701ae7687fd44d462c88b7ac67e952

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

