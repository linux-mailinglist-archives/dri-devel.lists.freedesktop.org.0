Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3CA7138E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F07D10E682;
	Wed, 26 Mar 2025 09:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KUZ+ho6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A4910E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:23:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A919433F0;
 Wed, 26 Mar 2025 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742980982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rDx2fSJy3Ms3G00Il013uPyrptL0oa5bj9agKMtWMM=;
 b=KUZ+ho6aGeehjv9NG29fFrcshfuYBqofKIemxDQRrRTtkp4I3fB3x9pNMQ8EwnYcN0oNYJ
 TVTQySZwOnB7PvAjIjz2X1CFC6IRNScDQA82WSDuQu7wYu806PG56N/bczmh9xyPkzvwdb
 8LyRj+BMu7w5BEeNl/rW2WeorXASf46PpYp44qU5psIifx/jrIHTRrTXn3mGuUIviYum5T
 Pzd5PAFfGBPLS14Nn3YufCxU8qFPgElH3Yejh6Aw5wkIzpTpE7nbTHBa8Lb3D/ygyiUd1/
 65Vhyqdp15eDe+tyOGwaXpi17x9tfnLAdcbIrBqEYw65Z1JSzZIM7cMa1nDVzg==
Date: Wed, 26 Mar 2025 10:22:59 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250326102259.3bdbc22d@booty>
In-Reply-To: <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhui
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

On Tue, 25 Mar 2025 13:24:08 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> Introduce reference counted allocations for panels to avoid
> use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> to allocate a new refcounted panel. Followed the documentation for
> drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> implementations for this purpose.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

[...]

> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type);
> +
> +/**
> + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
                                                     ^^
"a refcounted panel"

> + * @dev: struct device of the panel device
> + * @type: the type of the struct which contains struct &drm_panel
> + * @member: the name of the &drm_panel within @type
> + * @funcs: callbacks for this panel
> + * @connector_type: connector type of the driver

I'd say it's the connector type in the hardware, rather than of the
driver (the driver follows what is in the hardware. Maybe you can just
copy the description present in the drm_panel_init kdoc:

 * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
 *      the panel interface (must NOT be DRM_MODE_CONNECTOR_Unknown)

Other than that it looks good!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
