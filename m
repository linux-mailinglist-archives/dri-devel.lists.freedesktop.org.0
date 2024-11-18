Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472D09D184E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EE310E566;
	Mon, 18 Nov 2024 18:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n7Wb+yDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523C810E559
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:43:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 264A51BF20C;
 Mon, 18 Nov 2024 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731955404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ROA9s97zr/TnBShjvPt9n/VC1Dc0gzXiBJZ5MkzKUk=;
 b=n7Wb+yDaayzEWGz44mm8+0Wv02/af9bivC4WIe0eIlxWxgOcfGLANrr2Cpt7Y4JaVPXq1x
 kcBFf2RMzmwEM8MU2t4rlw03//R1DbU4g+WPD+KRd53FWpDRaBKxX/DAqrIQs9cQ5FJn1a
 1PUCbH/nABFcZZWG/WPBHLqkrjkayxw/9SgNuT8FBZ42fAPOw2PvsKqGC9AJ3z9h7ih/SS
 dOQ8/dN/iLDMSTkuQIbF6Bs+NjYquYi3byPD4/e0sYC13Wl/833RxjK6ZvaHgZuHDOSiXp
 SqBcnDp5K+nz0I1LmU/rick9sq6t+/zn4F4EAJ21c6ToCkHO9lCGdWviOGvCKg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 18 Nov 2024 19:43:17 +0100
Subject: [PATCH v13 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-yuv-v13-4-ac0dd4129552@bootlin.com>
References: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
In-Reply-To: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=axL606VOP+Vzkxig7OQTFfHk5EC8HgjRmS6iK/9rLyk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnO4rEdyRYcspheKMPUWgrhgvQwTgPP6Sk+atTG
 rUUBSAOOAWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZzuKxAAKCRAgrS7GWxAs
 4hIZD/9H+iynSmSGhCU5eDOlmCj3KCd+2hx4wLnQc8IWvQhuoP6RXQp1y0VFTAa8YRi91Bj74SJ
 Sp17WwlAt858MnZwQ3QVsJM4YEXlhg8523Qi5OB4h097aDq9NEvo9ANQ7bJ5NeQ4c6sSM8/c71/
 WtytJGuntaTvjEoR0amm4fvKj8bTDkSakAFmixVBAJdimYNhZpuPOw12vACdnm+3CAMw8TPO0wr
 XIaNXVVz9Vff4lpdAJdQ5QSxGD1YrVXqF7Q1Uyie9O3efbJO012iI/BAw+pfPgQ4Co+mGhpBuQi
 vie9TBptjFTW7Hlg100uWa16wNqkNp/j6MsXmbul9MRjBNKpfLiY+rgtQ47YwadExIQcO64qlwY
 +GniO/atU3NHnDMcCBbvdDHazf++V/fR6IWNSukXvmCysFHMBJG6bATAR720zZ+KkikcKAYPlIf
 Am4szjnTvTCcngm+sjoWjF8WTssw483Zylvf6ZCyWhXP7S/mGqS/86t7idaKP7zuGndG34Evl8j
 cOlUM61rhWGZU3IhXXAus3K8XuSvzLO8yqdc8Im8hsEaBnXh2LvZ0FhUDKmeQBHx14if7tQfh5Q
 6DiZRK7M4zRBgWCTx1hyVKZmIUAgAOptcyrjMIGyFxpMdwjJXW27t7r937pOG/L0hQiiM+bK+10
 p4e3b/ClCUeNlSw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.
---
 drivers/gpu/drm/drm_color_mgmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..509aa4325391340f8cfc50bd0fc277c48c889d3d 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -494,6 +494,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +510,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.47.0

