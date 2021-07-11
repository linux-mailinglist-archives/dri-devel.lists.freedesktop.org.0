Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956ED3C3B49
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 11:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5949F6EB95;
	Sun, 11 Jul 2021 09:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9C6EB95
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 09:16:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id bb79aa0a-e228-11eb-9082-0050568c148b;
 Sun, 11 Jul 2021 09:16:53 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 82528194B25;
 Sun, 11 Jul 2021 11:17:07 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm: bridge: Mark deprecated operations in
 drm_bridge_funcs
Date: Sun, 11 Jul 2021 11:16:44 +0200
Message-Id: <20210711091644.552431-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210711091644.552431-1-sam@ravnborg.org>
References: <20210711091644.552431-1-sam@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_bridge_funcs includes several duplicated operations as atomic
variants has been added over time.
New bridge drivers shall use the atomic variants - mark the deprecated
operations to try to avoid usage in new bridge drivers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_bridge.h | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..6805898d70f5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -171,6 +171,11 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is still running when this callback is called.
 	 *
 	 * The @disable callback is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This is deprecated, do not use!
+	 * New drivers shall use &drm_bridge_funcs.atomic_disable.
 	 */
 	void (*disable)(struct drm_bridge *bridge);
 
@@ -190,6 +195,11 @@ struct drm_bridge_funcs {
 	 * called.
 	 *
 	 * The @post_disable callback is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This is deprecated, do not use!
+	 * New drivers shall use &drm_bridge_funcs.atomic_post_disable.
 	 */
 	void (*post_disable)(struct drm_bridge *bridge);
 
@@ -213,11 +223,15 @@ struct drm_bridge_funcs {
 	 * For atomic drivers the adjusted_mode is the mode stored in
 	 * &drm_crtc_state.adjusted_mode.
 	 *
-	 * NOTE:
-	 *
 	 * If a need arises to store and access modes adjusted for other
 	 * locations than the connection between the CRTC and the first bridge,
 	 * the DRM framework will have to be extended with DRM bridge states.
+	 *
+	 * NOTE:
+	 *
+	 * This is deprecated, do not use!
+	 * New drivers shall set their mode in &drm_bridge_funcs.atomic_enable
+	 * operation.
 	 */
 	void (*mode_set)(struct drm_bridge *bridge,
 			 const struct drm_display_mode *mode,
@@ -239,6 +253,11 @@ struct drm_bridge_funcs {
 	 * there is one) when this callback is called.
 	 *
 	 * The @pre_enable callback is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This is deprecated, do not use!
+	 * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
 	 */
 	void (*pre_enable)(struct drm_bridge *bridge);
 
@@ -259,6 +278,11 @@ struct drm_bridge_funcs {
 	 * chain if there is one.
 	 *
 	 * The @enable callback is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This is deprecated, do not use!
+	 * New drivers shall use &drm_bridge_funcs.atomic_enable.
 	 */
 	void (*enable)(struct drm_bridge *bridge);
 
-- 
2.30.2

