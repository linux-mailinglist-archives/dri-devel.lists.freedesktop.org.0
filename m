Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36FB1D9D2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CEF10E03C;
	Thu,  7 Aug 2025 14:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VtSh9PJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E734510E03C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 14:19:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85E2B4435C;
 Thu,  7 Aug 2025 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754576345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wtz8BM8N6dsLJ4l/x1CO4upvlAXB7mujSRm/cuika7o=;
 b=VtSh9PJlgNlkwwSwcZEAXP56crN4z3IKJ/0xzSJSrCH91/uausGi1D59IDftllnIZ3SA/a
 IPBoNPDo+PPOF5cW4yZoJpWyhk7hSCeKSh1sPX0ui4HO6Lujzs4HgDNxdMPmABQiDZkjt0
 +GsyPyvnW6p+1q9fc8LjvZ9CF6uGeZ9FKXU35a0VI5SH2UQIT1qWdvtaBRtpa9xUTYFnUu
 t9eCdNf4turu3qErmDV2FgGoVFQuazeA30D/bII0YWNJXwBrQjH2qLy/W45g8BAGv/067Z
 WinIgURbtw0hzwcATzLZ/695IGIZ/y8vKr1G5kYSI0FmIRRm3zMhTe1CQR9rpw==
Date: Thu, 7 Aug 2025 16:18:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Aradhya Bhatia
 <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org (open
 list:DRM DRIVERS), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] drm/bridge: Remove unnecessary memset
Message-ID: <20250807161859.09d2134f@booty>
In-Reply-To: <20250807123836.494696-1-liaoyuanhong@vivo.com>
References: <20250807123836.494696-1-liaoyuanhong@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheplhhirghohihurghnhhhonhhgsehvihhvohdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehli
 hhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
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

Hello Liao,

On Thu,  7 Aug 2025 20:38:33 +0800
Liao Yuanhong <liaoyuanhong@vivo.com> wrote:

> kzalloc() has already been initialized to full 0 space, there is no need to
> use memset() to initialize again.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index a57ca8c3bdae..590f7c75744e 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1047,7 +1047,6 @@ cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
>  	if (!dsi_state)
>  		return NULL;
>  
> -	memset(dsi_state, 0, sizeof(*dsi_state));

Thanks, your patch seems correct, but your subject line should mention
the driver you are changing. You can use 
'git log --oneline -- <filename>'
to ensure which prefix is used for that file.

Without that your subject line would suggest you are changing the
drm_bridge core or doing a change affecting several drivers. That would
be misleading to reviewers receiving your patch as well as when looking
at the git history in case the patch gets applied (because the e-mail
Subject will be used as the git commit message title.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
