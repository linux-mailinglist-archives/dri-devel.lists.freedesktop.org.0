Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6B12115C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E4E6E83D;
	Mon, 16 Dec 2019 17:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426B56E83E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576516272;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=6afJ/ajVIJ5TlVFS2srTzT3GQgZn62D7gfGJJ/yBQYU=;
 b=LAi+bhVAl1fcaxGP3hVQBaWPm0rYi/68fuMOYgD95/mfD1hOBEmvpQrkATli40TI7N
 EYIRbo0vkKbvAkL5tqHJa7XRrSa/kZbYABaFH86gcqHO9ShtI/uROpa3GebLvkvqtQiH
 YbOasE4x7mfl3Nev203REjx8oxuiN9alYsRXAdLEmnRJ41rNpigwhfo2mi02rJf1KFlF
 6cBQiBlRofIY+GrLiiMxpqWRQv15RTBUA6hCFKMRLppubtBEKmma5w1plF9HZICAiO1V
 HeZaW+2oaEvbSyLQ/v2mM03CLI1+0lZ0FX5/CNu3KsLZvqhi7wlEqV1tD9tQOF4/ojjz
 VdPQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMv1qxJQXi4="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.0.7 AUTH)
 with ESMTPSA id N0b206vBGHBAOnz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 16 Dec 2019 18:11:10 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2] drm/modes: Apply video parameters with only reflect option
Date: Mon, 16 Dec 2019 18:10:17 +0100
Message-Id: <20191216171017.173326-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At the moment, video mode parameters like video=540x960,reflect_x,
(without rotation set) are not taken into account when applying the
mode in drm_client_modeset.c.

One of the reasons for this is that the calculation that
combines the panel_orientation with cmdline->rotation_reflection
does not handle the case when cmdline->rotation_reflection does
not have any rotation set.
(i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)

Example:
  *rotation = DRM_MODE_ROTATE_0 (no panel_orientation)
  cmdline->rotation_reflection = DRM_MODE_REFLECT_X (video=MODE,reflect_x)

The current code does:
  panel_rot = ilog2(*rotation & DRM_MODE_ROTATE_MASK);
  cmdline_rot = ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK);
  sum_rot = (panel_rot + cmdline_rot) % 4;

and therefore:
  panel_rot = ilog2(DRM_MODE_ROTATE_0) = ilog2(1) = 0
  cmdline_rot = ilog2(0) = -1
  sum_rot = (0 + -1) % 4 = -1 % 4 = 3
   ...
  *rotation = DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X

So we incorrectly generate DRM_MODE_ROTATE_270 in this case.
To prevent cmdline_rot from becoming -1, we need to treat
the rotation as DRM_MODE_ROTATE_0.

On the other hand, there is no need to go through that calculation
at all if no rotation is set in rotation_reflection.
A simple XOR is enough to combine the reflections.

Finally, also allow DRM_MODE_ROTATE_0 in the if statement below.
DRM_MODE_ROTATE_0 means "no rotation" and should therefore not
require any special handling (e.g. specific tiling format).

This makes video parameters with only reflect option work correctly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
v1: https://lists.freedesktop.org/archives/dri-devel/2019-December/248145.html

Changes in v2:
  - Clarified commit message - parameters are parsed correctly,
    but not taken into account when applying the mode.
---
 drivers/gpu/drm/drm_client_modeset.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 895b73f23079..cfebce4f19a5 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -859,19 +859,23 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	 */
 	cmdline = &connector->cmdline_mode;
 	if (cmdline->specified && cmdline->rotation_reflection) {
-		unsigned int cmdline_rest, panel_rest;
-		unsigned int cmdline_rot, panel_rot;
-		unsigned int sum_rot, sum_rest;
+		if (cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK) {
+			unsigned int cmdline_rest, panel_rest;
+			unsigned int cmdline_rot, panel_rot;
+			unsigned int sum_rot, sum_rest;
 
-		panel_rot = ilog2(*rotation & DRM_MODE_ROTATE_MASK);
-		cmdline_rot = ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK);
-		sum_rot = (panel_rot + cmdline_rot) % 4;
+			panel_rot = ilog2(*rotation & DRM_MODE_ROTATE_MASK);
+			cmdline_rot = ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK);
+			sum_rot = (panel_rot + cmdline_rot) % 4;
 
-		panel_rest = *rotation & ~DRM_MODE_ROTATE_MASK;
-		cmdline_rest = cmdline->rotation_reflection & ~DRM_MODE_ROTATE_MASK;
-		sum_rest = panel_rest ^ cmdline_rest;
+			panel_rest = *rotation & ~DRM_MODE_ROTATE_MASK;
+			cmdline_rest = cmdline->rotation_reflection & ~DRM_MODE_ROTATE_MASK;
+			sum_rest = panel_rest ^ cmdline_rest;
 
-		*rotation = (1 << sum_rot) | sum_rest;
+			*rotation = (1 << sum_rot) | sum_rest;
+		} else {
+			*rotation ^= cmdline->rotation_reflection;
+		}
 	}
 
 	/*
@@ -879,7 +883,8 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	 * depending on the hardware this may require the framebuffer
 	 * to be in a specific tiling format.
 	 */
-	if ((*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_180 ||
+	if (((*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_0 &&
+	     (*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_180) ||
 	    !plane->rotation_property)
 		return false;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
