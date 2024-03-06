Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677648740FC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E831134F8;
	Wed,  6 Mar 2024 20:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="qpY1+0FP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3711134F8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:34 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tqjzp1b6PzDq8y;
 Wed,  6 Mar 2024 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709755414; bh=i30Vaa/vWmAWuQ1xuyHQbAwUbCzPkek4gi1m2EvEbUs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qpY1+0FP6AdVM3Qg8lZv+hYANPxKP5Uhd+ZQCanHSNm0ZAMiUDZjQmzYMem4Zok9Y
 R7KxA49tasIbhKDw3h5f6YE/lSen/1CSnbgxgOD3YO2K4dphn5YoKk6XkwN3+5PSqW
 nsfZGf4QqtPZladu1ohTmr3RYYToDmwgelbwqIp4=
X-Riseup-User-ID: 91291689B435C54B67630DDED63C74A69CF5F515D6AE21446F9EFDBED5BFBAF3
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tqjzh2DQtzFvsk;
 Wed,  6 Mar 2024 20:03:28 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 06 Mar 2024 17:03:08 -0300
Subject: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
In-Reply-To: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
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

As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
To round a number, you need to add 0.5 to the number and floor that,
drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.

[1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/

Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 include/drm/drm_fixed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 0c9f917a4d4b..de3a79909ac9 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
 
 static inline int drm_fixp2int_round(s64 a)
 {
-	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
+	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
 }
 
 static inline int drm_fixp2int_ceil(s64 a)

-- 
2.43.0

