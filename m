Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2BA74587
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE2110E061;
	Fri, 28 Mar 2025 08:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UtrDTjFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6824610E061
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 08:34:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21848443D8;
 Fri, 28 Mar 2025 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1743150889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dz1oWfvojiArt+Yj+B47VCngh6+Au88jJB7WCr5hy9s=;
 b=UtrDTjFswGRPPre34n1lOnVH1Fs2NTgZRW2eYPQYsiGSw9GY0NrtkKzPcn8xodCTNoh2DM
 YXjm2lXx7CmKtzWzoMzGddInkzOZUL5pv2+RAjCFpe9kYyj9TiBycwczTaPNOS2EBBLfHn
 rigdJg29vUbhU0hw9ItVNzbx+iPFraGsprvIP3++p/AxIIVQw6WPna2YNVRluM7cA6f3so
 FrH7Pd/wmXaS5FWpogo/tsnKXyjd+F3fSPgXBFWmZ7pGqDcmxZZUjg/YSr6nZ2rwPBMq9w
 27HfREA/BCHDfPs0HZM3vuQRrbQ2qv+WvENPkHOB9/ZA7e4mJFb/ty3bRR/h8g==
Date: Fri, 28 Mar 2025 09:34:46 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250328093446.48368b57@booty>
In-Reply-To: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhui
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

Hello Anusha,

Thanks for your continued effort.

I have a few minor comments. Nothing big, but since Maxime requested a
change you'll have to send a new iteration, so find my comments below.

On Thu, 27 Mar 2025 10:55:39 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

[...]

> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41ffa6a88f3c3c58b 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -28,6 +28,7 @@
>  #include <linux/errno.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/kref.h>

Minor nit: you don't need this include in patch 1. You should move it
to patch 2 where it is actually used.

> @@ -268,6 +269,28 @@ struct drm_panel {
>  	bool enabled;
>  };
>  
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type);
> +
> +/**
> + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
                                                     ^^
A typo here is certainly not a huge problem, but I think I had already
reported this should be "a refcounted panel".

> + * @dev: struct device of the panel device
> + * @type: the type of the struct which contains struct &drm_panel
> + * @member: the name of the &drm_panel within @type
> + * @funcs: callbacks for this panel
> + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
> + * the panel interface
> + * Returns:
> + * Pointer to container structure embedding the panel, ERR_PTR on failure.
> + * The reference count is initialised to 1 and is automatically  given back
> + * by devm action.
> + */

In addition to Maxime's comment: I think it's a common practice to have
an empty line after the last @argument and also before the "Returns:"
line, to improve readability

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
