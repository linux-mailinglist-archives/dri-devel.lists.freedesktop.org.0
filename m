Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0EAE1FA6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 18:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB96610EB8B;
	Fri, 20 Jun 2025 16:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VhsG71ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E226C10EB88
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 16:00:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BB76432F4;
 Fri, 20 Jun 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750435205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vcq0bNKLXTxzoqOoWjjPyn3SmlF4gRI3gJ8lrJHFXgk=;
 b=VhsG71ng2ZvaxZ82r+hClPmpmVm4p45TLz2WV8MPRebmpU1087B/+03FYlZ9eMVYVHOq49
 X1UiZC6Nka0aDhzcP0jgayPz7/H94NzmmED17GzdncSWjtYF/I9M7Vf15iW1hqVPegRSt3
 8glYMLZJLMkkClmxsNe2p8+GJbJTCu9n5QX23ajfZQraMM6R/UqxLOKp0Ee4UsYYfLr/Kw
 kCAk9Iq6DOihONiZLzzCLb0tD5W22J/Qs6odT+Ngwp/DsPvRn8RE53sGTirzGN3iKimvGL
 i4rAfYVXSMs0GC+xPuApJJ68T1D7XgZ2sPu4cbAxhH/u89UV+S6WkyMtYtiLoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Jun 2025 17:59:55 +0200
Subject: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-0-ca53372c9a84@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
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

To the best of my knowledge, all drivers in the mainline kernel adding a
DRM bridge are now converted to using devm_drm_bridge_alloc() for
allocation and initialization. Among others this ensures initialization of
the bridge refcount, allowing dynamic allocation lifetime.

devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
the old pattern ([devm_]kzalloc + filling the struct fields +
drm_bridge_add) is not allowed anymore.

Any drivers that might have been missed during the conversion, patches in
flight towards mainline and out-of-tre drivers still using the old pattern
will already be caught by a warning looking like:

  ------------[ cut here ]------------
  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x148
  [...]
  Call trace:
   refcount_warn_saturate+0x120/0x148 (P)
   drm_bridge_get.part.0+0x70/0x98 [drm]
   drm_bridge_add+0x34/0x108 [drm]
   sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
   [...]

This warning comes from the refcount code and happens because
drm_bridge_add() is increasing the refcount, which is uninitialized and
thus initially zero.

Having a warning and the corresponding stack trace is surely useful, but
the warning text does not clarify the root problem nor how to fix it.

Add a DRM_WARN() just before increasing the refcount, so the log will be
much more readable:

  [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
  ------------[ cut here ]------------
  refcount_t: addition on 0; use-after-free.
  [...etc...]

A DRM_WARN is used because drm_warn and drm_WARN require a struct
drm_device pointer which is not yet available when adding a bridge.

Do not print the dev_name() in the warning because struct drm_bridge has no
pointer to the struct device. The affected driver should be easy to catch
based on the following stack trace however.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v9:
- change warning trigger from "refcount != 1" to "container not NULL"

This patch was added in v8
---
 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..0b450b334afd82e0460f18fdd248f79d0a2b153d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	if (!bridge->container)
+		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()\n");
+
 	drm_bridge_get(bridge);
 
 	mutex_init(&bridge->hpd_mutex);

-- 
2.49.0

