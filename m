Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D5A7138D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151CF10E129;
	Wed, 26 Mar 2025 09:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KLu2vuse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82ABA10E129
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:23:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 566884341A;
 Wed, 26 Mar 2025 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742980986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsEyj+lTR3bdUdE++96P2r98RujtLyXQv06vTnGR8p4=;
 b=KLu2vuse3BgDkRGWJCGipYhivSvJ1dwKmjSCBREKhVNVvVY75CiZU6rOIByUexIPRPG0eC
 3QHPZlMeN/SBMMb74hwbCR8JnqJ74bKO4+YQNQmbzum9Fg2KSpmWOZY/TZHehv3fjk6a0j
 k1RPq+uoF3KosMgRfxi7ehli9J77pL3vijKfjYpLfhtL5qdDve3IZj6ubs1E9tjZsd1aNa
 GwwC1fFllKG6AZQb3705XmfVHjNwpYuhlO+FipY7evaD4yrUr9AbvsfH8+wQ6va1sVcfrQ
 DxcWwcJExrF2dL+7wty8DCwT9DQUJPw49fEDTV6Kk9zvDK+csegTkW39ZiTqzg==
Date: Wed, 26 Mar 2025 10:23:04 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/panel: Add refcount support
Message-ID: <20250326102304.49510630@booty>
In-Reply-To: <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeehffejffekudfhkeeklefgjeeuheekffelheejgfeijeehieelkedttdfhjedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhui
 hgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
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

On Tue, 25 Mar 2025 13:24:09 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> Allocate panel via reference counting.
> Add _get() and _put() helper functions
> to ensure panel allocations are refcounted.
> Avoid use after free by ensuring panel is
> valid and can be usable till the last reference
> is put. This avoids use-after-free

"panel is valid and can be usable" is not totally correct. When there
are still references held, you ensure the panel struct is still
_allocated_, not necessarily valid and usable.

Minor nit: you are wrapping at less than 50 columns, which is a bit
tight. I think 75 is the expected value for wrapping.

> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

[...]

> +/**
> + * drm_panel_get - Acquire a panel reference
> + * @panel: DRM panel
> + *
> + * This function increments the panel's refcount.
> + *
> + */

Not sure it's mandatory, but documenting the returned value is good
practice , e.g.:

 * Returns:
 * Pointer to @panel.

> +/**
> + * drm_panel_put - Release a panel reference
> + * @panel: DRM panel
> + *
> + * This function decrements the panel's reference count and frees the
> + * object if the reference count drops to zero.
> + */
> +struct drm_panel *drm_panel_put(struct drm_panel *panel)
> +{
> +	if (!panel)
> +		return panel;
> +
> +	kref_put(&panel->refcount, __drm_panel_free);
> +
> +	return panel;

While this is using the same structure as my bridge work, I now realize
the _put() should probably not return the panel (or bridge) pointer, it
should just be a void function. The reason is the pointer might have
been freed when _put() returns (depending on the refcount) so that
pointer value might be dangling and whoever calls _put() must not use
that pointer anymore.

Other get/put APIs do this, e.g. of_node_get/put().

So I'm going to change drm_bridge_put() to return void, unless there
are good reasons to keep it and that I'm missing.

> @@ -280,7 +291,10 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
>   * @member: the name of the &drm_panel within @type
>   * @funcs: callbacks for this panel
>   * @connector_type: connector type of the driver
> - * The returned refcount is initialised to 1
> + *
> + * The returned refcount is initialised to 1. This  reference will
> + * be automatically dropped via devm (by calling
> + * drm_bridge_put()) when @dev is removed.
          ^^^^^^
"panel". Same in a few other places in this patch. Please search in all
this series in case there are more. It's easy to forget about replacing
some of those in the comments. :)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
