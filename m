Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB2AFB20A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 13:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A8A10E447;
	Mon,  7 Jul 2025 11:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IMzbot9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AE110E132
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 11:12:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C065204CA;
 Mon,  7 Jul 2025 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751886730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2IuGLoN2z6uUxTC0PrzTB7ZmiLrMY5Ne3GgAeVwppg=;
 b=IMzbot9aBAhY+A1it6LpZpCDyjxBoQIEZACu8HSiFtwHItU4PwlkuJ2jMdd3nFYTVyqrQ7
 g58FUCdJhatxHJwhIByjBcT8m1wZowSJzo107blG5b5DB2bimuNIiUEi1sNRZDZdwb6kWp
 0lzJB2OZyDTuhKH/989quxd98EclsS8hpjf+OCBMQ4UzFP03vc9iNzg+xZ4gi7vjTgVMtE
 3diL1I5cvtehD9HFWbk/zakM6rw2dN9U7BtoRVIV0mNHaEKzfusG7E/HhatCo9cS2zuOS8
 G4nVxrThkkntyGQMBUXKrvTNtrh10EzzaVp5Rrmzeg2YX6W2RHaALEOuRc/FSw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
References: <20250704-drm-bridge-alloc-fix-tc358767-regression-v2-1-ec0e511bedd0@bootlin.com>
Subject: Re: [PATCH v2] drm/bridge: tc358767: fix uninitialized variable
 regression
Message-Id: <175188670931.81272.9699272605011757855.b4-ty@bootlin.com>
Date: Mon, 07 Jul 2025 13:11:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieefvdehvedvgeeftedugeetudevuedvffekhedvfeetkeduleelgeevudffieeinecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegtohhlihhnrdhirdhkihhnghesghhmrghilhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhov
 hesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrgh
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


On Fri, 04 Jul 2025 01:30:18 +0200, Luca Ceresoli wrote:
> Commit a59a27176914 ("drm/bridge: tc358767: convert to
> devm_drm_bridge_alloc() API") split tc_probe_bridge_endpoint() in two
> functions, thus duplicating the loop over the endpoints in each of those
> functions. However it missed duplicating the of_graph_parse_endpoint() call
> which initializes the struct of_endpoint, resulting in an uninitialized
> read.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: tc358767: fix uninitialized variable regression
      commit: cb863540e7c756abe7e709673a3e073c6a7aa8c0

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

