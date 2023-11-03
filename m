Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC87E039D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 14:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EED10E9E3;
	Fri,  3 Nov 2023 13:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97710E9ED
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 13:14:25 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91371BEB;
 Fri,  3 Nov 2023 14:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699017246;
 bh=zdGGDGGi0EjJoJXJD3OePDCfsWtgBRwsx7Z+r8jYoyA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ykodq0rZICsxpK3As05OwmeuKKRSc7UhBzxtHtAgoOm44Sb6TfveAeBC3p2QmW4yG
 ItylLtyNGJK61KVKVXmLi80H+AjsLe4rAq4ffGIZE2uoJ442HwpM0uymsOZD6PaYY0
 VKv/syGSd1uRc4UvJjkQHh6CpVp5BFGGjBQfeTM8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 03 Nov 2023 15:14:04 +0200
Subject: [PATCH v2 2/4] drm/framebuffer: Fix use of uninitialized variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231103-uninit-fixes-v2-2-c22b2444f5f5@ideasonboard.com>
References: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
In-Reply-To: <20231103-uninit-fixes-v2-0-c22b2444f5f5@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Parshuram Thombare <pthombar@cadence.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=zdGGDGGi0EjJoJXJD3OePDCfsWtgBRwsx7Z+r8jYoyA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlRPIsWu+CRgRS5bZtVv9evyDD5YSsgvRh8ehjM
 qDeOXjyVkeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUTyLAAKCRD6PaqMvJYe
 9XSiD/4qJVFOddephYbYFQsGjgjnyGoamkQnluXuBX09mIL4+G8dJth68eLvlTFnCaPAO9QwR5l
 3TWv+SMFR5DDmlGn0tR3VrggNqPe2riOWGT2TAlpGtluD6a9Hj0hRmx+b8tL2WVXCjsGVFDB4Cn
 8oQ9RcCVyiv50KWeBAF4gUoVYndSusuHH87eJjmvA4EXqU/m5kyqJLe+jeO+x3MrH8hC+kcLFmZ
 9mUI069yxsthJFSZJjU9oSur684yA7FUdqCXBwyl1JcVLd3+LZcZyiVcmcp0amIOuTsvFZxPx7j
 KIeU44AQnLhtCADOFl02OKktxXEHi6B0q9Y82VGxZ7OlUvD+gTZnlLAoP2U5n7Ix0V5w7+FtdVR
 od6r1qIuVLDxvfNHEU+hGpJ0vdNpoFWCwphMVC4zp/O1pIxnzSDxIItIzKgh5mEkpFN+WXT3bwZ
 veocAeyq7iuxKpwdHXtqlEQVX/+ZWrUZOqsScRNjcVVG30ePi9ZRzZm8KSlJw2biyxXsMhcbRTC
 9cIb6yrNVZfdYA0LbagOhq0xEejlJANNHVYxxrtyIU56N/yUCpzPwgl5R2h5hN+mFEpNMBto2IO
 dAgSjJBil93r3dnhCdE9s1ssyRYszqFnhgeRmj+o7gLeI+8UoBXeDh6onU+dh513wUEjGjcmR8z
 y4TZMtPPefBl00g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports:

drivers/gpu/drm/drm_framebuffer.c:654 drm_mode_getfb2_ioctl() error: uninitialized symbol 'ret'.

'ret' is possibly not set when there are no errors, causing the error
above. I can't say if that ever happens in real-life, but in any case I
think it is good to initialize 'ret' to 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 09e289fca5c3..3cc0ffc28e86 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -583,7 +583,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 	struct drm_mode_fb_cmd2 *r = data;
 	struct drm_framebuffer *fb;
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;

-- 
2.34.1

