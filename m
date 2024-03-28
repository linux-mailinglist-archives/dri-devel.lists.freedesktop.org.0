Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC258766C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 15:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9C1138E6;
	Fri,  8 Mar 2024 14:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ma7RYtqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3371138E4;
 Fri,  8 Mar 2024 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=krDIRYgU1uLFsIvNtqFMjTjuXBLodI3PgcqmjvYIA64=; b=ma7RYtqGTddCWW/HzBOmsnL5Ut
 cpRud3IdvZ/c3pm3joUw6CwSSPeRodpDnGoKBQbAExK6ObI17EF5vq2qqqgbecfUF8g9mnspAHfsv
 AEnNry+B+spRFExeOeJ7Feu0pW6Ka7CMDBjuQumO1dHn0bodi43ZgI49zkYZ1iyf9YD+XfuuittVq
 LI1/4BSoF54VL0KUVUMZ+baz4xTH+8/CxfTLaj7MmV1oigMDTT+UEqAR8QjYkeMkWDl9HI+iv0cfY
 ZpdyKtnv/weyNo+o6G0ZLuPMbcsWObrzPZK1DrEIt7/LuVWax2a3GySvway+4buP7PHI849iQ3b0H
 od/OUN9g==;
Received: from [152.249.135.210] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ribdu-007p93-5S; Fri, 08 Mar 2024 15:56:14 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [RESEND PATCH v4 2/3] drm: Allow drivers to choose plane types to
 async flip
Date: Fri,  8 Mar 2024 11:55:52 -0300
Message-ID: <20240308145553.194165-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308145553.194165-1-andrealmeid@igalia.com>
References: <20240308145553.194165-1-andrealmeid@igalia.com>
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

Different planes may have different capabilities of doing async flips,
so create a field to let drivers allow async flip per plane type.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: new patch

 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
 drivers/gpu/drm/drm_plane.c       | 3 +++
 include/drm/drm_plane.h           | 5 +++++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 1eecfb9e240d..5c66289188be 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1075,9 +1075,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip && plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
+		if (async_flip && !plane_state->plane->async_flip) {
 			drm_dbg_atomic(prop->dev,
-				       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
+				       "[OBJECT:%d] This type of plane cannot be changed during async flip\n",
 				       obj->id);
 			ret = -EINVAL;
 			break;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 672c655c7a8e..71ada690222a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -366,6 +366,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 
 	drm_modeset_lock_init(&plane->mutex);
 
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		plane->async_flip = true;
+
 	plane->base.properties = &plane->properties;
 	plane->dev = dev;
 	plane->funcs = funcs;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 641fe298052d..5e9efb7321ac 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -779,6 +779,11 @@ struct drm_plane {
 	 * @hotspot_y_property: property to set mouse hotspot y offset.
 	 */
 	struct drm_property *hotspot_y_property;
+
+	/**
+	 * @async_flip: indicates if a plane can do async flips
+	 */
+	bool async_flip;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.43.0

