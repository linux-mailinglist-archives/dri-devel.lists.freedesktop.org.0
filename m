Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6CA2AC56
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C010E895;
	Thu,  6 Feb 2025 15:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oW8nTiJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8205510E895
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:20:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A325E44273;
 Thu,  6 Feb 2025 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738855252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeCsnrKozW+jD4dro64DNaKKFt/Ebupy7eycXyiOkJQ=;
 b=oW8nTiJhBjjdEHbhhMgejcQQeOc4PWIu1KYYLGOI5+7qsJWElCruy9O/VxFiGvonMs/aRm
 Q+0+WlRJxz2zOdYXbHPQW6aGQKisAptuMQXairavgw5ws1vDR6FQRduGA//rH7IGuG3e6R
 gbG4s+Pnb6xYU5t3H7Mu07gZvbxEEqqTiXDpc4nWuGx/RmMaagb8V8mLDppT780ZMI3Wj+
 3+A6IxRHU5hJk58yH/n7p0FzR3kIIiog1OXXzUmuxcEEgEWcZreMQZvdKv6JZTlM+6dXM1
 tOqE/tzys3p1B6fO0vzeATyukW2uHmcRmDFwvjlyZBLrUEPH8+CSk1XKo99FXg==
Date: Thu, 6 Feb 2025 16:20:48 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
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
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250206162048.1f159ba6@bootlin.com>
In-Reply-To: <3605739.aeNJFYEL58@steina-w>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <20250203161607.223731-5-herve.codina@bootlin.com>
 <3605739.aeNJFYEL58@steina-w>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtt
 hhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
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

Hi Alexander,

On Thu, 06 Feb 2025 15:38:42 +0100
Alexander Stein <alexander.stein@ew.tq-group.com> wrote:

...
> With interrupt configured I got the following stack trace upon
> reboot/poweroff:
> 
> [   91.317264] sn65dsi83 2-002d: reset the pipe
> [   91.344093] Unable to handle ke
> ** replaying previous printk message **
> [   91.344093] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
...

Ouch :(

One question to help me investigating:
Do you have the issue at init/probe or when you start to display graphics?

Best regards,
Hervé
