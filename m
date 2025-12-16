Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4FDCC4C3F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 18:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F2610E83A;
	Tue, 16 Dec 2025 17:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vfgOrVRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD4C10E6CD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 17:59:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 453EC4E41C34;
 Tue, 16 Dec 2025 17:59:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1AA186071C;
 Tue, 16 Dec 2025 17:59:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A09E119A97E3; Tue, 16 Dec 2025 18:59:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765907974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=p1l+ifg6rxKNBzLh6S5qUvhw9tuzvTYHLw55FhL7wQk=;
 b=vfgOrVRn0maqCDFsR1FdM8EafbexHbxqC4K65lQppvD+z3YeC1fyUwj/CkNRNuC/Rryb31
 5UIW0bktLsByUOMqFg5YgBtnmjHcQOUITrSOXMMJLAvtK4WfdrF3jLjgXDYWEWznqcQooF
 Ma3kkWbjljApDGf9bHqBsEk/XXT6P8ufsX5SZjtq5I0RWA8LzTLI+C/GiEKbHRzZJeZ/M6
 dklLAsn6Cs+2wZudxb8JJXv3t4LR/IdzYC6BssbB7WfknoNu+vzPCoXdPtmyelR06T5kdK
 jsVGY0faBA9DYNYuSnv+8+F0zo+kXz4LeYZltYiuI8vnbFHWZjj98P1JXH+RLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:36 +0100
Subject: [PATCH v3 03/22] drm/todo: add entry about converting to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-3-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

of_drm_find_bridge() is deprecated, but converting some users is very
complex and should be reasonably doable only after the DRM panel bridge
lifetime rework. Add a TODO to track this.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename
---
 Documentation/gpu/todo.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 22487ac1b011..520da44a04a6 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -506,6 +506,22 @@ Contact: Maxime Ripard <mripard@kernel.org>,
 
 Level: Intermediate
 
+Convert users of of_drm_find_bridge() to of_drm_find_and_get_bridge()
+---------------------------------------------------------------------
+
+Taking a struct drm_bridge pointer requires getting a reference and putting
+it after disposing of the pointer. Most functions returning a struct
+drm_bridge pointer already call drm_bridge_get() to increment the refcount
+and their users have been updated to call drm_bridge_put() when
+appropriate. of_drm_find_bridge() does not get a reference and it has been
+deprecated in favor of of_drm_find_and_get_bridge() which does, but some
+users still need to be converted.
+
+Contact: Maxime Ripard <mripard@kernel.org>,
+         Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+Level: Intermediate
+
 Core refactorings
 =================
 

-- 
2.52.0

