Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56EB18422
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8E010E892;
	Fri,  1 Aug 2025 14:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HqSJGCVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E459610E1DB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:43:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2545244343;
 Fri,  1 Aug 2025 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754059433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yK4ipANA6XLeByXgFwmLEFeRRYI7v5g/yoyt5zSHMD4=;
 b=HqSJGCVRhcTia5nmSTiP/eck5fzRmFedbhUeDHKbEFrdhpJrvEavG94xtqpegvpApO1UST
 TjbwbxT1L/2T6Og/0U32wQN9vuYoD4433AUNo/QNRq3/jGzzsizr9tVZHskr6kQGDnB5NN
 VLLinr7H9LlaevSgL5M/EqU5mcx0RybyzutJBoIpxPC/wPyqfRE9MX0oD6NjMPLzJhufmm
 8ZAR0ocAhXY4NxVftXkgB8JeXE6NifdjStUwjilbrVYaMH7rGPE2xeN+U/HFAMzEtOlM5g
 FHiGVcdooBUiI8E3lh2hZsA1wg7BHh/jwEBTZuxelbCOs/6CN1Ju3jZD2srdfQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 01 Aug 2025 16:43:49 +0200
Subject: [PATCH 2/2] drm/vkms: Properly order plane for blending
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-vkms-fix-zpos-v1-2-d83ba1e6291d@bootlin.com>
References: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
In-Reply-To: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2542;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xbRNygqeCI/g92dMO05R8xANYrSCMlkw/7PZ6ZSdPoo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBojNKm+N6ReAgv5etfRseZt/O/Z7/nzOWM5g7Dg
 NZyBvuZBYiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIzSpgAKCRAgrS7GWxAs
 4nb9D/wOOQGnHoqr1UxnEadidkrvQUtCgmTJzA9Zf8iTPKoshPDm8ERCBly/IHnPrvWy77/Xfnc
 U6BG1fzoq6UyCfEuIyX2zZnQTYGh/NCq+vHe7VzKPkr2JHG9W49Stu0+g60wKMKxZGNhyr5Z0c7
 n32w6ZZ/jUY7r7ICjvrlBR7Pnjm/WwXY+OyFYzCB6+jSKmUVIWkJ+yPh1Dwng+V6EAw9dTCVjul
 nBO30lZSSUZggHGx4dittSvmgDJFbE2XiyApTsIl3o+2lA5ALTapYLlcDM0qSYuYXWjxWLPkIE8
 j0p6tmww1PFnV/U3fY73lD6g/ZiJbk5hFj3jKZ9pv/IEw3txtOmkfdpDSnyF7hzMq5uv1pZGKdj
 lRMknrEIk0ubc7HhZTW231pNrB8US8m/BSN3xx549oY1I+9NT7adtJuOHOGdPxtIGFFQAcSiRkG
 +/y2umfarf6Tx07iOZL21G0lmaQjT+r5jeARg4AQJPgCosE6a0dluSmWA4raX9Hj8Qo+lWn1zcB
 c8dNJk8Xh1RJrMgojkDIlqiCnZCXft0ktLplLKqaJQDbDl95tXfxAx/X0Hld/0D2VUJiFoY+vxv
 bvsZm9NREFT89kkU19hqZd4YAh/Hg0YMTeBXJFWBe81g11uiAqbh+dpLh1XAGmFqxmQfjnaDciV
 9ir0vIM7k95oZaw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmvghli
 hhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current blending algorithm requires that vkms_state->active_planes be
ordered by z-order. This has not been an issue so far because the planes
are registered in the correct order in DRM (primary-overlay-cursor).
This new algorithm now uses the configured z-order to populate
active_planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 26 ++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.c  |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9510252e1f198b00e28bcc7987620..f3f3ad8ede29987b385d53834970bcd0c6adefa7 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -200,14 +200,28 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	vkms_state->num_active_planes = i;
 
 	i = 0;
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
 
-		if (!plane_state->visible)
-			continue;
+	unsigned int current_zpos = 0;
+
+	while (i < vkms_state->num_active_planes) {
+		unsigned int next_zpos = UINT_MAX;
+
+		drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+			plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+
+			if (!plane_state->visible)
+				continue;
+
+			if (plane_state->normalized_zpos == current_zpos)
+				vkms_state->active_planes[i++] = to_vkms_plane_state(plane_state);
+
+			if (plane_state->normalized_zpos > current_zpos &&
+			    plane_state->normalized_zpos < next_zpos)
+				next_zpos = plane_state->normalized_zpos;
+		}
+
+		current_zpos = next_zpos;
 
-		vkms_state->active_planes[i++] =
-			to_vkms_plane_state(plane_state);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e8472d9b6e3b2b5d6d497763288bf3dc6fde5987..e492791a7a970b768184292bf82318e3fca6b36a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -135,6 +135,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.max_height = YRES_MAX;
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
+	dev->mode_config.normalize_zpos = true;
 	/*
 	 * FIXME: There's a confusion between bpp and depth between this and
 	 * fbdev helpers. We have to go with 0, meaning "pick the default",

-- 
2.50.1

