Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC169908ED8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 17:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D9210EDAA;
	Fri, 14 Jun 2024 15:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aFh82x5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7941410ED9B;
 Fri, 14 Jun 2024 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kmzOSqTKJaH0dvCeP0l9yACALP9ZDMY12Vpbbl/oZpo=; b=aFh82x5B16HfjMQDExiRAYOAAm
 f+p+YESYJxmGdkjJJFXxIDhcYx424j/smaqMdz5/3/77aQOwxYLMkU3TAiDIHnWA3uZbeVh+KJ3sG
 fZLfCLiAazI7zvQfh3PgDOBn3lC7zkMFUX+1P8dETPjZUtjjT5je5ozkwzmWO9uQJAV+1B3FVqHfj
 fJrMwntYMkrFJS+a0THptww0VlUiKdUlXTqyKCVNZGDmYVMBgCC4mvFPLMDCih6mtCipLYaOqMxhV
 C/BP6hP0UqoVg8a0V6OfZJyi5xnvMZNwv7vZ6GOHhLn6EpJuxPcmnoF3Hd+lUHHJNBUD5cfKaV8Po
 phSrk10g==;
Received: from [179.118.191.115] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sI8yA-003B8v-5N; Fri, 14 Jun 2024 17:36:02 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v6 2/8] drm: Support per-plane async flip configuration
Date: Fri, 14 Jun 2024 12:35:29 -0300
Message-ID: <20240614153535.351689-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614153535.351689-1-andrealmeid@igalia.com>
References: <20240614153535.351689-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Drivers have different capabilities on what plane types they can or
cannot perform async flips. Create a plane::async_flip field so each
driver can choose which planes they allow doing async flips.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
 include/drm/drm_plane.h           | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2e1d9391febe..ed1af3455477 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1079,9 +1079,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip && plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
+		if (async_flip && !plane->async_flip) {
 			drm_dbg_atomic(prop->dev,
-				       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
+				       "[PLANE:%d] does not support async flips\n",
 				       obj->id);
 			ret = -EINVAL;
 			break;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 9507542121fa..0bebc72af5c3 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -786,6 +786,11 @@ struct drm_plane {
 	 * @kmsg_panic: Used to register a panic notifier for this plane
 	 */
 	struct kmsg_dumper kmsg_panic;
+
+	/**
+	 * @async_flip: indicates if a plane can do async flips
+	 */
+	bool async_flip;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.45.2

