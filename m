Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB60905540
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E842710E87E;
	Wed, 12 Jun 2024 14:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EzM0HDiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126C10E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:36:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C14D1CE1805;
 Wed, 12 Jun 2024 14:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AFFC116B1;
 Wed, 12 Jun 2024 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718202956;
 bh=YkTkobD98YgdF9Ps4HcWB86UJKfgpoXQvm65qO4nc2o=;
 h=From:To:Cc:Subject:Date:From;
 b=EzM0HDiDd1wDKTb4k5ZVmkrls8wJA1E+TUWioaMeZUEVf0tRNv9oOdVXLfzpDhZ20
 ycCorzwERYhJGbJwBkizNBcgjh/UuDTnvmdKVl1hW32rS56nJTjMniMcbJPNgQ1m0q
 EgAFymm/zqJLFaIVh6PDxPMX9+h9pmVWLW+AtO+EFThoM6J5XLdjT8j6IqwTqW/li1
 s85GXa2DddMWNK3J1YEDtEdBEYjHWceSPm1esBBWW3wdyKio7A8M2S7j64J0kMBKWF
 o8MYpGXeWh8x8Z8PZQWjMnIqmYDmPwdnZHCn0dxJuXD6wDCdGA8VEno3lPDp9E2YVG
 CsWlmg3wUbnUA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/3] drm/todo: Create a TODO item for additional HDMI work
Date: Wed, 12 Jun 2024 16:35:51 +0200
Message-ID: <20240612143553.915966-1-mripard@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

We recently added some infrastructure to deal with HDMI but we're still
lacking a couple of things. Add a TODO entry with the remaining items.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2ea6ffc9b22b..52fd8672fb6d 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -633,10 +633,39 @@ long as that supports DMA. Otherwise importing can still needlessly fail.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 
 Level: Advanced
 
+Improve HDMI Infrastructure
+---------------------------
+
+We have a bunch of helpers to handle HDMI and reduce the boilerplate in
+drivers. Support so far includes HDMI 1.4 support, but we need to extend
+it with:
+
+  - CEC handling support. CEC requires a bit of integration into every
+    HDMI driver to set the device physical address according to the EDID
+    in `.get_modes`, and to clear/reset it in the hotplug detection
+    path. We should create the ``drm_atomic_helper_connector_hdmi_get_modes()``
+    and ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helpers to handle
+    this properly, and convert drivers to use them.
+
+  - In order to support HDMI 2.0 properly, the scrambler parameters need
+    to be moved into the state. This includes figuring out in
+    drm_atomic_helper_connector_hdmi_check() if the scrambler and TMDS ratio
+    need to be changed, and make the
+    ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helper reset the
+    scrambler status when the device is plugged and unplugged.
+
+  - We need to support YUV420 too.
+
+The `vc4` driver is a good example for all this.
+
+Contact: Maxime Ripard <mripard@kernel.org>
+
+Level: Intermediate
+
 
 Better Testing
 ==============
 
 Add unit tests using the Kernel Unit Testing (KUnit) framework
-- 
2.45.2

