Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2AC1B407
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1980710E7C0;
	Wed, 29 Oct 2025 14:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LP4xLJtC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2A010E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:36:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1BEC11A174B;
 Wed, 29 Oct 2025 14:36:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E59ED606E8;
 Wed, 29 Oct 2025 14:36:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9BEF7102F24F9; Wed, 29 Oct 2025 15:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Cp6JpAtoASV5c2ZHnxjic8luGPShZOCddn0tveS2zCk=;
 b=LP4xLJtCpeo0/5dDEGlvCen7w4edznxJlfh4hXIodgwC983y8R+ka7JswykSJVMQfzmKhs
 7lqUDNOq/iD6uuMldL5pGETpUyT20yXfyIAxuggiVpJI/IjEYzv57GpuN9AxR7NBjI8pqC
 v8i0/4FIP9gVRWJ0Gkgym79AZk9XMw+9ivEKalIg/U/R8m2NY748Qj1JMe3wqPJ7wND2DU
 zclGw7bK3OXJhnYO+4++30uGjZmhqacQKSlxgx3dZmc40KwBwf97F7wQfBxxQKK8mJKlgC
 q1PRAm5Uu+hNublx+XJEpK/aw/v5BNKPkmDbi8QOjZvMnCLeTgkY9rl2kO7iow==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:40 +0100
Subject: [PATCH RESEND v2 03/32] drm/vkms: Use enabled/disabled instead of
 1/0 for debug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=P2YQYyxAPSZpXd/i/92Ex57u+40+oZJvWkUOQRGtaCI=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ67gTBmoyopTr26ee+sA1L9TqFeiljDye1u
 t9L9WYhhSuJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImegAKCRAgrS7GWxAs
 4hISEADIvecDEqTRDOMd30EJrvFoLJdurexYYJOpbiRQw32Oo0Ll7HkT5kVmCYbk6vOUlNeabLI
 ukxPUg3edy1pY/s5xkiaNiN0pg01HOlEyx50gjhEG1Ex7ghFrb2bWXnJVJaW/I0Pl+nWqkgLvNl
 9197W66mCD+UWEejgbsWAjbSESG3z6dpDxlwntcik+aDufgGSBgwvEW6nU4gMiK8C0/Zj13RbLq
 HhbC1mKkmH8rWOx90ovac8t5BTM4VrUioQBD6OxQgfpNLBWKDnk2QTIy8ljmA2K/WTkmU4sK5eU
 XsL2MCVmfym8zUMSiptCb9Zvx8lRkUppFfdZQLnb0bxefbL+vFDVGnJ3tgIggrvVDX6qC7rbuBL
 gOQHsbzmQd9k5cq7QvBqA4hUHyAWj5yG0thY5oVILmTHM8ch1tzOn7bT5Hw/PD3eomR3ttXrk1i
 uURqRgLALZlCoSzGZy1TL9FV8dhG6F8waG9J54ZR1xc0RsqGp40OKjfUZaNyU0RWixD+VJH06LQ
 XkKxZcq0erG1J8+Aep2CnS8CukaMXoToZT7T4X4DnC3XFIyXh+gXlHziZtzm1yBE2ejcRK+2DwB
 qJIGbwWX53TZITJWhU5W7dMUqHgkRIPSqn3kQo6GOdEASwk0JnISOsK4OYHgBWHJnzsYZrKTxV+
 jkMXTqKG18EtldA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

Debug information are mainly read by human, so display human
readable values.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index cfdd5f32f234..391794d391c5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -354,8 +355,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 		seq_puts(m, "crtc:\n");
-		seq_printf(m, "\twriteback=%d\n",
-			   vkms_config_crtc_get_writeback(crtc_cfg));
+		seq_printf(m, "\twriteback=%s\n",
+			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 	}
 
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.51.0

