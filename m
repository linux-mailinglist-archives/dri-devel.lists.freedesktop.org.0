Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62486A9ABBA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 13:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1C10E30B;
	Thu, 24 Apr 2025 11:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WTO+fOKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79E10E309;
 Thu, 24 Apr 2025 11:28:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AD1F43A07;
 Thu, 24 Apr 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745494091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bz9b9HTv2sWKqYaZLjCkIaHyjCRTMEZ4N5CM7lBAIjs=;
 b=WTO+fOKy08+k3R6VOo4FgIrrMPsiB/nAVAOfJMQAdVSxjWQogtIY5cFgPAk1SOOSNg84v5
 YAycUQfirISNqB46b6Rq2Kb0/kVJ/dVEDf6CJhl7XDUG4q1uUDmCk208gBMtVQ1QLCcowA
 g+fPgfDstAalRZjliFX6HSgfLCdZRZcUtPau+3ZpOneb+uQBqfC5TO3g1NgDEjHo5A2vBl
 J+gh7wITo8g5J8vLAI13NXWX+GLjyMQP1oVXIARzj/ipCf1WquNYUKY8S/ZYFKBK0oZlOQ
 bt2f1BodPSa+XQVEebdOJs0qRrfqWeThlK3iYiydfl+WN4DaUXnuKi9a5EyTRA==
Date: Thu, 24 Apr 2025 13:28:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski
 <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 29/34] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250424132804.30bcc49a@booty>
In-Reply-To: <6b699329-8ed4-4be6-81bb-17b4bf800d34@ideasonboard.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-29-42113ff8d9c0@bootlin.com>
 <6b699329-8ed4-4be6-81bb-17b4bf800d34@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphgruhhlkhesshihshdqs
 ggrshgvrdhiohdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Hello Tomi,

On Wed, 16 Apr 2025 15:31:41 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
> 
> On 07/04/2025 17:23, Luca Ceresoli wrote:
> > This is the new API for allocating DRM bridges.
> > 
> > This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> > which delegates to a submodule (zynqmp_dp.c) the allocation of a
> > sub-structure embedding the drm_bridge and its initialization, however it
> > does not delegate the drm_bridge_add(). Hence, following carefully the code
> > flow, it is correct to change the allocation function and .funcs assignment
> > in the submodule, while the drm_bridge_add() is not in that submodule.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> To add to my last mail, this clearly cannot be right, as it changes 
> kzalloc call to devm_* call, without removing the kfree()s...

Thank you very much for having tested this patch and found the mistake!
I have checked all other patches in the series and found no other
instance of this specific flaw, but a couple flaws of a different
nature. I'm now fixing all of them and will send v2 later today.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
