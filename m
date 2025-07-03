Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02682AF843E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 01:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CF910E918;
	Thu,  3 Jul 2025 23:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T7xaFHaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 27472 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jul 2025 23:28:44 UTC
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C55210E918
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 23:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3273343136;
 Thu,  3 Jul 2025 23:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751585322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDAyEWIe7XZYwJv1nN64rJP4O70drfI1NJYvVOMt1W4=;
 b=T7xaFHafxQ6BjR7gj9MQ9EzG7tgapk+U44Gh/FwUnRXh0Y7X4BPUKwSo2Htg7Aue55gvAj
 Ld2AvMscsr6HYTS8NxJRhkX/dAV/By15AinNgLtEK7cezHyieFkw3OLnGrbOZir6zZkk2d
 XGINi9GUEwAsekLLLIaCEDqLW7ENeBV9o5MhOyenZ60183ZrxBiWCIGzDtIzx42s/m1GHU
 VJy/rY/H/XHK2Ok/JidGfxQgPYPYZ29SObirWxlr+h/nUi+PKMsYvG532+9dETYG7yVeay
 CVgPuBbOWPctC0q0cQt9BW6EsvnFYZX6/r+O2w/JXkd8W7yXx++tJZWK34Jf6Q==
Date: Fri, 4 Jul 2025 01:28:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: tc358767: fix uninitialized variable
 regression
Message-ID: <20250704012825.206a720b@booty>
In-Reply-To: <e40eb387-00cc-4e5d-88aa-6ea6a04bab51@gmail.com>
References: <20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com>
 <e40eb387-00cc-4e5d-88aa-6ea6a04bab51@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeehuddrudejledruddtfedrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthephedurddujeelrddutdefrdehhedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheptgholhhinhdrihdrkhhinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

On Thu, 3 Jul 2025 19:00:44 +0100
"Colin King (gmail)" <colin.i.king@gmail.com> wrote:

> On 03/07/2025 17:32, Luca Ceresoli wrote:
> > Commit a59a27176914 ("drm/bridge: tc358767: convert to
> > devm_drm_bridge_alloc() API") split tc_probe_bridge_endpoint() in two
> > functions, thus duplicating the loop over the endpoints in each of those
> > functions. However it missed duplicating the of_graph_parse_endpoint() call
> > which initializes the struct of_endpoint, resulting in an uninitialized
> > read.
> > 
> > Fixes: a59a27176914 ("drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API")
> > Reported-by: Colin King (gmail) <colin.i.king@gmail.com>
> > Closes: https://lore.kernel.org/all/056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com

Dang, broken URL. I could not check it because lore was down when I
sent the patch.

Ignore this patch, sending v2.

> Reviewed-by: Colin Ian King <colin.i.king@gmail.com>

Thanks,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
