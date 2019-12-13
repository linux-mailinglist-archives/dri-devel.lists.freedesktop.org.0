Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FABA11E738
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7F6EA2D;
	Fri, 13 Dec 2019 15:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F33A6E915
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 46B0C292C56
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 01/36] drm/framebuffer: Add optional modifier info
Date: Fri, 13 Dec 2019 16:58:32 +0100
Message-Id: <20191213155907.16581-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

modifier_info is a pointer to an optional modifier-related information.
Managing the memory needed for that information is the responsibility
of drivers.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 include/drm/drm_framebuffer.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index c0e0256e3e98..2b3341b526d7 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -29,6 +29,7 @@
 
 #include <drm/drm_mode_object.h>
 
+struct drm_afbc;
 struct drm_clip_rect;
 struct drm_device;
 struct drm_file;
@@ -139,6 +140,21 @@ struct drm_framebuffer {
 	 * @format: framebuffer format information
 	 */
 	const struct drm_format_info *format;
+
+	union {
+		/**
+		 * @modifier_info: pointer to an optional modifier-related
+		 * information. Managing the memory holding that information
+		 * is driver's responsibility.
+		 */
+		void *modifier_info;
+
+		/**
+		 * @afbc_info: afbc-specific pointer
+		 */
+		struct drm_afbc *afbc_info;
+	};
+
 	/**
 	 * @funcs: framebuffer vfunc table
 	 */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
