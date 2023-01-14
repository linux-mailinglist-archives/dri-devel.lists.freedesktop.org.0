Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8F66ABD8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 15:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9BD10E085;
	Sat, 14 Jan 2023 14:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6D510E085;
 Sat, 14 Jan 2023 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673705038; bh=kBGWBKHIIKQIpYxP0OzdkdWOafSEc8bDoiSabz6C4S8=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=Bu/P+uckxIILRoyNCCIE8VRlk2ynL7kwkt5QCnjI8E4VzpnbWqUcgqOZKpswfuiB8
 kOUpbmU41aiYEQLmTvpmUvOHUT3UU8nrCF4F+vYZUUp97ihVVKEm6mOjnrD09zU8QX
 AzjRnY9dHpRAAYvnXOBvwJFJWn9hKSQR6zRNwdM4=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 14 Jan 2023 15:03:58 +0100 (CET)
X-EA-Auth: 1SrSBt70RjsiUzKSXWkgrhGKybdJO3t+s2nn7krxM8MgIPE6VodeGCtCPIciVl4mp7id9IJhJBwpj6IDplEW3+KSCzFkV5SL
Date: Sat, 14 Jan 2023 19:33:53 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: Convert i9xx_pipe_crc_auto_source to void
Message-ID: <Y8K2SS/zNiPAmLsS@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert function i9xx_pipe_crc_auto_source() to return void instead
of int since the current implementation always returns 0 to the caller.
Issue identified using returnvar Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Please note: The change is compile tested only.


 drivers/gpu/drm/i915/display/intel_pipe_crc.c | 23 ++++++-------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index e9774670e3f6..8d3ea8d7b737 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -72,14 +72,13 @@ static int i8xx_pipe_crc_ctl_reg(enum intel_pipe_crc_source *source,
 	return 0;
 }
 
-static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
-				     enum pipe pipe,
-				     enum intel_pipe_crc_source *source)
+static void i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
+				      enum pipe pipe,
+				      enum intel_pipe_crc_source *source)
 {
 	struct intel_encoder *encoder;
 	struct intel_crtc *crtc;
 	struct intel_digital_port *dig_port;
-	int ret = 0;
 
 	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
 
@@ -121,8 +120,6 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 		}
 	}
 	drm_modeset_unlock_all(&dev_priv->drm);
-
-	return ret;
 }
 
 static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
@@ -132,11 +129,8 @@ static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
 {
 	bool need_stable_symbols = false;
 
-	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
-		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
-		if (ret)
-			return ret;
-	}
+	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
+		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
 
 	switch (*source) {
 	case INTEL_PIPE_CRC_SOURCE_PIPE:
@@ -200,11 +194,8 @@ static int i9xx_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
 				 enum intel_pipe_crc_source *source,
 				 u32 *val)
 {
-	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
-		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
-		if (ret)
-			return ret;
-	}
+	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
+		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
 
 	switch (*source) {
 	case INTEL_PIPE_CRC_SOURCE_PIPE:
-- 
2.34.1



