Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425891062A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3060B10E9DF;
	Thu, 20 Jun 2024 13:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X762k1oG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0089610E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:35:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54078621A6;
 Thu, 20 Jun 2024 13:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9B9C32786;
 Thu, 20 Jun 2024 13:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718890535;
 bh=5tYVYfhQ8AgDhKqY9oLsQ7bOinioICIDD6Nq7WRjn+U=;
 h=From:To:Cc:Subject:Date:From;
 b=X762k1oGLZKF7Cl1FWlBDIiH354n9HkPPslE3bLQYYWYSFlSrOikylk6qdVQxm5Cq
 XxmC5SiKhpEb1rcpJHoHQWmzUjm5P0o0DYgC2+K2/IcTOSySrDHCpE0mjnMm5DzOdo
 vj/ZvNkO21YCB3dC02Vf6P+kgaJJKVf6tOp97U9dREcgb4MxnlUosaJIWE7y54cGHP
 t+FA6V5g9zF1hHx+NHsGbucqXrywXop/D60/DvoLdpwe9txWYYHciXBlzdzy1nHgtI
 MwyQjotlanGi1VMtYkbMoqEZ2+0cdoJjPNBVSDthrzrH2hEw7iDUTTYXrY9Yi2A2eP
 9jYw9331jLI5w==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/3] drm/todo: Create a TODO item for additional HDMI work
Date: Thu, 20 Jun 2024 15:35:29 +0200
Message-ID: <20240620133531.3954622-1-mripard@kernel.org>
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

Changes from v1:
  - Add sound and HDCP
---
 Documentation/gpu/todo.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2ea6ffc9b22b..3104ffbd6295 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -633,10 +633,46 @@ long as that supports DMA. Otherwise importing can still needlessly fail.
 
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
+  - Make the audio support somewhat generic too. The lowest hanging fruits
+    would be to provide helpers for `get_eld`, to handle hotplug and compute
+    ACR, N, and CTS parameters.
+
+  - Handling HDCP in a generic manner would be a good idea too.
+    See `[PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into helpers <https://lore.kernel.org/dri-devel/20230419154321.1993419-1-markyacoub@google.com/>`_
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

