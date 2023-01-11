Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97F666227
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B76410E7BE;
	Wed, 11 Jan 2023 17:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D53010E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+MeraZdARiGlH97qbC++ixvY3ydhDMG3H5stHgiEsfc=; b=DIzmdy90oU+wlzd53r1I83G1CM
 2TYsAoW5ih1jfFEHNDQRZ3JI/BllXt8C2bDu9LT1rsgPX7D1odhMQT9av6kD7R+Rp1jj8kTGkXHX9
 LuL82fGWKnx2hpeBB8hscJuZE2WpXlOc5DCxq7WAIiCxmtgQ5r989SnAduNM1cb6y2HtySdgMz0Bh
 P5SAV8Li/hl4vXc99a8n+dfHJI0oKCEfQTRmkSX9RY881N2Vq5UFCPReOY2Yd3agwsF6cHH4/U7Z7
 vnJcymNNUtHpz9xL+5H3pUGH/tWRBG3ip1xl66UC6aaR+F8g46Jl2kQLTRsP5H6rnOR+QU0QrZjoh
 UovLHYtw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf4L-005Sku-6G; Wed, 11 Jan 2023 18:39:21 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 13/13] drm/todo: Update the debugfs clean up task
Date: Wed, 11 Jan 2023 14:37:48 -0300
Message-Id: <20230111173748.752659-14-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111173748.752659-1-mcanal@igalia.com>
References: <20230111173748.752659-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The structs drm_debugfs_connector_entry, drm_debugfs_encoder_entry, and
drm_debugfs_crtc_entry introduced a debugfs infrastruture that made it
possible to remove late-register debugfs. So, update the debugfs clean
up task to include the advances for the kms objects and point out
possible improvements to be done.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/gpu/todo.rst | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 1f8a5ebe188e..3c4d4b8541e8 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -511,14 +511,12 @@ There's a bunch of issues with it:
 - Convert drivers to support the drm_debugfs_add_files() function instead of
   the drm_debugfs_create_files() function.
 
-- Improve late-register debugfs by rolling out the same debugfs pre-register
-  infrastructure for connector and crtc too. That way, the drivers won't need to
-  split their setup code into init and register anymore.
-
-- We probably want to have some support for debugfs files on crtc/connectors and
-  maybe other kms objects directly in core. There's even drm_print support in
-  the funcs for these objects to dump kms state, so it's all there. And then the
-  ->show() functions should obviously give you a pointer to the right object.
+- Convert drivers to use the kms object debugfs helpers, such as
+  drm_debugfs_connector_add_files(), instead of the drm_debugfs_create_files()
+  function on late register hooks.
+
+- We probably want to have some support for debugfs files on planes, like we
+  have for crtc, connectors, and encoders.
 
 - The drm_driver->debugfs_init hooks we have is just an artifact of the old
   midlayered load sequence. DRM debugfs should work more like sysfs, where you
-- 
2.39.0

