Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1A9B822A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0B10E904;
	Thu, 31 Oct 2024 18:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AmTC2Nb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B45110E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:06:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C853F2000D;
 Thu, 31 Oct 2024 18:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnxB3DYHE4hlot0SiDmuaPnWv/Qs3ZnmMdNCEu0LXW8=;
 b=AmTC2Nb5X/r7SKiLz0cluzgtNgcCtelTLxq+FfKqJe2ZQdwXI5WBU9wVu+QjOqOpWt1z03
 SUBfqt3By3meI/Kq3dwBqll2/SsmJfGfjLTvVpwPWDCOUxeZgxeo1LatPfpZcNYeBY4JwE
 qtyqWn09SCfQGjSxpXY8eOJ6y2HXRLnKUZjUiGKv68UIACOjckvrPzHM/LRjitd03gZsSY
 tB0lxlqXOBbrLAmR8SBx1R0uwNLEpMrKngFrWNMuOuKbPk5rxg3GFOxSLntu2UsYaNM7Z1
 DYMEKmVqJjpBwjg3RXFMGx2OBnX9xJ71ZcOCQsq73BMG++vriZc5ZCtsmARdww==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 19:06:04 +0100
Subject: [PATCH v13 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-yuv-v13-4-c67a337301ae@bootlin.com>
References: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 20241031-yuv-v13-0-bd5463126faa@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7tjRMSUn1ff+jaTKfg3LLB4Z1WdxYK0a7+YdSZB50Ws=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8cO4JrWkuXTajcS3TwlAWUM/tx0YtbPwUmWt
 HmGXz61ywSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPHDgAKCRAgrS7GWxAs
 4oBeEADC0xzD/sfcbN2nWw4+6Y6jG0Wla6EVNCMEhkPF0j5rwx7F1GSoDTa1kGuSTdtbe9iMD1/
 ZdSSxfIzTmMZvO0BrF1lCZ7uXApFFYoi3xat5GTVpaQQhk9Dz4yEHgVFIY6nsgQ9ekcCg+GGW0s
 +7myo1+dFhU127Gnteouyz5SGvpmzV1aHNEKBIRqGeEY/AGPAn4OU/U51uiowTzlfoSPdNK+Nwr
 aopFW+Lleee06NVUcIEeQlMx77R1G8NbB+yfxwcs7GeFm0eWHtMxv1mrXww/wax4GfT1zYymD8W
 K/7Cwo/DiU+bOm+qsSOsqgz0vf/bKsrlgqnOYqxN5tGXjRPCADelbUR/qJfH8qG5Tgkw3p6+Ic2
 y+hatDGm5l38NzvB9uEBftzTePHXR/DzxyhtCA2YWTU5fP8sRFKcjM+ReE1f2GDS6dOteecC0Nx
 hDqQWMDsCZXzcQwWKzcW/IVQWb66dyQw+sUvLgLqVJg6mjTQZb43qJwuJg0g8SEA66kUTj16/xD
 FKQJzxcCeE79Hg8tqs11zCVjYZnFelzgRBvksWCqmrZJSijT9EX+3i4A6MNdqaUxCTsY+LLrPm4
 lEgOAfkGXz4E0mN/waShmRqMOIo3eJlpJCDTqGQGytnxHbax7MvDrADBLqL+2MogY7fODHwjWeX
 WkW6jmSSWBYI+ew==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.
---
 drivers/gpu/drm/drm_color_mgmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff..509aa4325391 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -494,6 +494,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +510,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.46.2

