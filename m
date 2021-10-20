Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B143528B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA746E9C5;
	Wed, 20 Oct 2021 18:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E124B6E8F8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:19:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 461401bb-31d2-11ec-ac3c-0050568cd888;
 Wed, 20 Oct 2021 18:19:33 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E9595194B6F;
 Wed, 20 Oct 2021 20:19:19 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 7/7] drm/todo: Add bridge related todo items
Date: Wed, 20 Oct 2021 20:19:01 +0200
Message-Id: <20211020181901.2114645-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020181901.2114645-1-sam@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
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

- deprecated callbacks in drm_bridge_funcs
- move connector creation to display drivers

v2:
  - Updated descriptions in todo.rst

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 60d1d7ee0719..17c03e7c41e5 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -463,6 +463,55 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vette
 
 Level: Intermediate
 
+Drop use of deprecated operations in bridge drivers
+--------------------------------------------------
+
+&struct drm_bridge_funcs contains a number of deprecated operations
+which use can be replaced by the atomic variants.
+
+The following is more or less 1:1 replacements whit the arguments
+and names adjusted:
+* pre_enable => atomic_pre_enable
+* enable => atomic_enable
+* disable => atomic_disable
+* post_disable => atomic_post_disable
+
+* mode_set is no longer required and the implementation shall be merged
+  with atomic_enable.
+
+* mode_fixup => atomic_check
+  mode_fixup() was created a long time ago, when we were supposed to have
+  a single bridge at the output of the CRTC. The bridge could then instruct
+  the CRTC to output a different mode than what the display requires.
+  Now that we have support for multiple bridges, it's not as straightforward,
+  and we've so far just pretended to ignore the problem. The .mode_fixup()
+  operation is used and abused, and just telling people to use .atomic_check()
+  will likely make things worse as that operation has access to the full atomic
+  commit and can alter the mode of pretty much anything. We need to define clear
+  semantics for .atomic_check() in bridges.
+
+
+Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
+         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Level: Beginner or intermediate (depending on the driver)
+
+Move connector creation to display drivers
+------------------------------------------
+
+With the introduction of chained bridges the creation of connectors are moved
+to the display drivers. The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR is used to
+signal to the bridge driver that no connector shall be created and that the
+display driver will take care. Display drivers will in most cases be able to
+utilise drm_bridge_connector_init() for all the logic.
+
+Step 1 is to have all bridge drivers supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR.
+Step 2 is to move connector creation to all relevant display drivers, utilizing
+the drm_bridge_connector where possible.
+
+Contact: Sam Ravnborg <sam@ravnborg.org>, bridge and/or driver maintainer(s)
+
+Level: Intermediate or advanced (depending on the driver)
 
 Core refactorings
 =================
-- 
2.30.2

