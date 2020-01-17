Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E11140DF6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 16:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A896F5F6;
	Fri, 17 Jan 2020 15:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A49D6F5F7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579275303;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=mg6fEUJ1+2Cx9A/cZs29wUYgJ4T4WdORd0fpO29LUoM=;
 b=UQjHTlZF917dFKJikcBzZAwTCSPte+eIMAmYim5lakJnlhusSg2Y/JWAvcb/SqxZ7l
 jVhhU9ryucCh5zLOih6Hbwfb49qmfXYPnPSUAg7aV9alk6qBiEyU8I2d04y8C4fcyjU5
 E9yacoFSxcmEqrNodykv24b2mDMTtahIH8C6AdVMD/uxMWeWY2P7bbLaycxBcPdW10mZ
 d0u3a2WiylcFVyjH/IGI5uSUtkVYOnPlQauVRnOhNxGsSfy80nP8VYKtCGg6KKf8Do/8
 +pj2IDBOOQTHr8ysFFJZCvQgORjVi5U6u9HJXRBtQm6wvJDEdDlOMr7R9XMkR+jsrKAF
 oOaA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsNXwthI1"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0HFZ2opL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 17 Jan 2020 16:35:02 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 2/2] drm/modes: Allow DRM_MODE_ROTATE_0 when applying video
 mode parameters
Date: Fri, 17 Jan 2020 16:34:29 +0100
Message-Id: <20200117153429.54700-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117153429.54700-1-stephan@gerhold.net>
References: <20200117153429.54700-1-stephan@gerhold.net>
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

At the moment, only DRM_MODE_ROTATE_180 is allowed when we try to apply
the rotation from the video mode parameters. It is also useful to allow
DRM_MODE_ROTATE_0 in case there is only a reflect option in the video mode
parameter (e.g. video=540x960,reflect_x).

DRM_MODE_ROTATE_0 means "no rotation" and should therefore not require
any special handling, so we can just add it to the if condition.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/gpu/drm/drm_client_modeset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 895b73f23079..29367b6506a8 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -879,7 +879,8 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	 * depending on the hardware this may require the framebuffer
 	 * to be in a specific tiling format.
 	 */
-	if ((*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_180 ||
+	if (((*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_0 &&
+	     (*rotation & DRM_MODE_ROTATE_MASK) != DRM_MODE_ROTATE_180) ||
 	    !plane->rotation_property)
 		return false;
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
