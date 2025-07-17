Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97811B08727
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 09:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8D10E749;
	Thu, 17 Jul 2025 07:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B9dNw4iF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F00210E749
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:41:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21B744435F;
 Thu, 17 Jul 2025 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752738116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTCB0MhY9raHq4U1R98VXnyfrvr0fz0dGAYz6OpWrYk=;
 b=B9dNw4iF6UKwg1ZkWqIJx6e7Mo8h44VxR9cpdH6QWwJn+5BCZ9x5WmWYAJ32fv8kE4Pwsn
 8SY+CGygPll7ZarxMecksxqNBVvQYvXJPzdubGtgY8EmKG96c/wgxeISDx7M9pTECt9+2p
 mvBEbCnhgCKMADb27/1qVLU2PJpWxo1f1lYtyq/YbEo3zEDIqC+RP4n9mQ3u8sj64o5M1n
 xylUfS0VOuzJogj/DwJzIo7oxCSOSNoOBz5sFqvwULUb1+XNSNNv/T45b14NlSIO/fy1Za
 q5v6dU+UtGUT2DOJHm9gcS/nP3Lr/3DTl9ypkbMRN1W5VQVU+RX9g5Y0ypdq4A==
Date: Thu, 17 Jul 2025 09:41:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tidss: encoder: convert to devm_drm_bridge_alloc()
Message-ID: <20250717094153.35f854b7@booty>
In-Reply-To: <20250716134107.4084945-1-mwalle@kernel.org>
References: <20250716134107.4084945-1-mwalle@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepmhifrghllhgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiu
 ggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
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

Hello Michael,

On Wed, 16 Jul 2025 15:41:07 +0200
Michael Walle <mwalle@kernel.org> wrote:

> Convert the tidss encoder to use devm_drm_bridge_alloc(). Instead of
> allocating the memory by drmm_simple_encoder_alloc() use
> devm_drm_bridge_alloc() and initialize the encoder afterwards.
> 
> Fixes: a7748dd127ea ("drm/bridge: get/put the bridge reference in drm_bridge_add/remove()")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> index 95b4aeff2775..81a04f767770 100644
> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> @@ -90,14 +90,18 @@ int tidss_encoder_create(struct tidss_device *tidss,
>  	struct drm_connector *connector;
>  	int ret;
>  
> -	t_enc = drmm_simple_encoder_alloc(&tidss->ddev, struct tidss_encoder,
> -					  encoder, encoder_type);
> +	t_enc = devm_drm_bridge_alloc(tidss->dev, struct tidss_encoder,
> +				      bridge, &tidss_bridge_funcs);
>  	if (IS_ERR(t_enc))
>  		return PTR_ERR(t_enc);
>  
> +	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
> +				      encoder_type);

Nit: this should be a single line (< 100 chars).

> +	if (ret)
> +		return ret;
> +
>  	t_enc->tidss = tidss;
>  	t_enc->next_bridge = next_bridge;
> -	t_enc->bridge.funcs = &tidss_bridge_funcs;
>  
>  	enc = &t_enc->encoder;
>  	enc->possible_crtcs = possible_crtcs;

This patch switches from drmm_ to devm_, but I haven't checked in
detail whether this introduces a different lifetime. At a very quick
glance however it looks fine.

With that assumption, looks like a correct patch.

However allocating an encoder using a bridge alloc function (while we
used to call an encoder allocation function) looks counter-intuitive.

We had discussed on IRC a different idea, adding a wrapper structure
around the bridge. Quoting your proposal:

  struct tidss_encoder_bridge {
    struct drm_bridge bridge;
    struct tidss_encoder *encoder
  }

and then in the bridge funcs go from drm_bridge to tidss_encoder_brigde
and use the pointer to get the original private struct.

That would be cleaner and more intuitive, but use a bit more memory and
have an additional pointer deref, thus I think we can live with the
patch you just sent, at least for now.

In the long term it may be that more and more components of the DRM
subsystem become dynamically allocated like bridges and panels [0] have
recently become. So at some point it may make sense to add the bridge
wrapper struct and then go back to drmm_simple_encoder_alloc() for
allocation.

[0] https://lore.kernel.org/all/20250331-b4-panel-refcounting-v4-1-dad50c60c6c9@redhat.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
