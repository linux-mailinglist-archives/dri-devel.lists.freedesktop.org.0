Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800674FCDFA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5800D10EE19;
	Tue, 12 Apr 2022 04:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95E2B10EE0C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:29:15 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id AA8D0205657E;
 Mon, 11 Apr 2022 21:29:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA8D0205657E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649737754;
 bh=AgbekYe0S46Vr5OLHiFsmZOewWJmWOdqv5BV4g+6iIw=;
 h=From:To:Subject:Date:From;
 b=XSccBTnRuJkj5P9mKo4JTcEaCN2IysTkyLsxTlYl8xaJERLHXoQWu3ZwmyWYq04uO
 4QRFGoypXiTnMcEB6aLUTzJnXWX/UfjVz22QNUKTTaLx4TvUJ0o4WtbrZmL9nIGEuZ
 dqV61xETbTn48KEsbF219Xf3ViUvug42xM/51fLo=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: ssengar@microsoft.com, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mikelley@microsoft.com, decui@microsoft.com
Subject: [PATCH v4] drm/hyperv: Add error message for fb size greater than
 allocated
Date: Mon, 11 Apr 2022 21:28:59 -0700
Message-Id: <1649737739-10113-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

Add error message when the size of requested framebuffer is more than
the allocated size by vmbus mmio region for framebuffer

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
v3 -> v4 :
	* Shorter error message
	* Alignment match for open parenthesis
	* Added -> Add (typo fix in commit message)

 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index e82b815..27f4fcb 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -123,8 +123,11 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (fb->format->format != DRM_FORMAT_XRGB8888)
 		return -EINVAL;
 
-	if (fb->pitches[0] * fb->height > hv->fb_size)
+	if (fb->pitches[0] * fb->height > hv->fb_size) {
+		drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
+			current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
 		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
1.8.3.1

