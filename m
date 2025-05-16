Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A2AB9A77
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194D10EA45;
	Fri, 16 May 2025 10:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Mq2Xes4D";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="d5jsWcQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B867A10EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:51:41 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 942AC25400CA;
 Fri, 16 May 2025 06:51:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 16 May 2025 06:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1747392700; x=1747479100; bh=VDIJz6NdPv
 TlCQzLO6Any5IgSGj4IrnIRIKUGoRE4mw=; b=Mq2Xes4DOqZnt5ARvIMrtukCSh
 o1lse6IBACUjEI+dCsYWzX2lMK6aSWcFE5YGfwKhgso1XOwwfxgUIbqNq3lyRttd
 2f5JyykPa1bOlOcUrohw4ApejqYhAsHDejhl8XXjm7J7/Qe5JtDwWTMgltfLdgBe
 nYaKXeG3fHMXQLe3ZuQXWdmBG0boGZYn2+xhfPylPU7GaWvdpkBHemmd4bLiEGdn
 hYX+ueH8xqpB6UXf/9Wsl6vTsMgVu9116hr/NVH6AZPzznLoQ9UGLN3fNPIzDZSY
 M9Mi9O3D5Blik/M0VP5u+i2CwEmC+LkIS0SSx0ms+ypUrdWDzAx7frA56S7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1747392700; x=1747479100; bh=VDIJz6NdPvTlCQzLO6Any5IgSGj4IrnIRIK
 UGoRE4mw=; b=d5jsWcQxrSuFwjW3PLzPF0TlzQZqlUFPtRJEczugJeQdCjiMDtb
 GoNHBKVsL7kn2/BaQYGfKAInWofZh+92vR7OLZtBgajYskU+SKbUYaF3i1Ib//K6
 WU2IYDm1LJtuJjnRtkKM5nJvHKxQFU+tXu/fnX6pY/I81SLiseizo4tiiJlGbmdv
 nP0QyQ8xGxQS/EU0X/Sa+BhaAkEEY9RfqhYQMygE7jiNY1xr00OXjsssd/qrgdMw
 RN03cFOZLnct4k2FmJ4kkyRO1YcWEIWCRGZ8HaNQTE3EkOH2GsjKlQkIjRiPHokT
 vRDF7j4XhobAnuoLTbs7IfoDEh8i2A6YSUA==
X-ME-Sender: <xms:uhgnaNx_E6CsIQuXTqjaobD7SZ-QvV4EWQ7E6jsNWL5M80Mtx6U5Ow>
 <xme:uhgnaNQ085vmWY7-ufybl7hRs6Zep_yiCrYg152TGwePZSvOFWgNex--sqhWqXHEP
 PAa3zFjJ6lFlCsypQ>
X-ME-Received: <xmr:uhgnaHVO1GomO0V8nhD3Mas5GYuQdkAySNsx6-8o9QP79PuMbec05HcUALerxD2w2idqz_iEWoYcyZ-xtfiXXyhKaeJzr9G1W8rpf7nPj0hY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfedu
 udevkefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uhgnaPjxoUkt5Gc7CSQPRzJnS2DiXt6cP8dLgxcQRkPo8O1tPWTFag>
 <xmx:uhgnaPCaPDZcTBHjD_2oDvBeJAp2YLE2guSS-cyT2XOkg2q4ld09kw>
 <xmx:uhgnaII0KAHY0I5mqHh_ivc6FzgX4XgdjK0Ix1XUI_B_tHhPIE94MQ>
 <xmx:uhgnaOC4wDM2qZmhgVxKytBKC0VLQJp9NqCSA5W-b3zk-3_-O1CgzQ>
 <xmx:vBgnaMp5bLmDEHIomjrq1tVcTwhYrwSgV_kFW35yLIvda4lMQpVzOukY>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:51:32 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v11 0/8] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Fri, 16 May 2025 22:44:17 +1200
Message-ID: <20250516105101.11650-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All,

v11 of this patch adding support for the Allwinner DE33 display engine. This version removes the clock dt-binding and ccu driver support that Chen-Yu has also taken as a subset, and as suggested removes the bus dt-binding patch which will be sent with the device-tree changes to enable downstream device support subsequently.

Use of lower-case for an enum is also corrected and Maxime's Acked-by added. I also noticed a couple of other ordering issues while fixing the enum, and have also corrected these so that the intermediate patches all compile, but no code changes, so the end result of applying this series (now on top of clk-next) is unchanged.

Regards,

Ryan

Jernej Skrabec (7):
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: mixer: add mixer configuration for the H616

Ryan Walklin (1):
  dt-bindings: allwinner: add H616 DE33 mixer binding

 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 +++-
 drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 +++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
 8 files changed, 223 insertions(+), 62 deletions(-)

-- 
2.49.0

