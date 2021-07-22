Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E23D1E2E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46956ECD7;
	Thu, 22 Jul 2021 06:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0716EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 06:23:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 49a34d20-eab5-11eb-9082-0050568c148b;
 Thu, 22 Jul 2021 06:23:11 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 13542194B25;
 Thu, 22 Jul 2021 08:23:24 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 7/7] drm/todo: Add bridge related todo items
Date: Thu, 22 Jul 2021 08:22:46 +0200
Message-Id: <20210722062246.2512666-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- deprecated callbacks in drm_bridge_funcs
- move connector creation to display drivers

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 12e61869939e..0ed1f49df73e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -477,6 +477,53 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vette
 
 Level: Intermediate
 
+Drop use of deprecated callbacks in bridge drivers
+--------------------------------------------------
+
+&struct drm_bridge_funcs contains a number of deprecated operations
+which use can be replaced by the atomic variants.
+
+* pre_enable => atomic_pre_enable
+* enable => atomic_enable
+* disable => atomic_disable
+* post_disable => atomic_post_disable
+
+The above are in most cases a simple adjustment of the arguments and names.
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
+Contact: Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Level: Beginner or intermediate (depending on the driver)
+
+Move connector creation to display drivers
+------------------------------------------
+
+With the introduction of chained bridges the creation of connectors are moved to the
+display drivers. The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR is used to signal to the bridge
+driver that no connector shall be created and that the display driver will take care.
+Display drivers will in most cases be able to utilise drm_bridge_connector_init() for all
+the logic.
+
+This task requires all bridge drivers to support optional or no connector creation and all
+display drivers using bridges to support creating the connector.
+
+Contact: Sam Ravnborg <sam@ravnborg.org>, bridge maintainers, driver maintainer
+
+Level: Intermediate or advanced (depending on the driver)
 
 Core refactorings
 =================
-- 
2.30.2

