Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC776FF17
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8560010E17F;
	Fri,  4 Aug 2023 10:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AE110E034
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:57:57 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98367188E;
 Fri,  4 Aug 2023 12:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691146611;
 bh=W3BdCub5uZqFZ3mcZrRZT/MkOLhq4JHeGg/aXz3nw1I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kvA6fMuoRo1j5nIIY4k+dISbOKqRumEyxFPcz+9nvbehNM1KM9SImM79Ig82Hq3AX
 5sAKvt/hhBS122FqZB0HFLI47vguOEqY/Tek6K4QzAefzo7dB8tnFeIfdnnPQFKeO+
 UJuMHEubt+uRaeUixNSMOsFBmvDuokOJu51zPVC8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:57:40 +0300
Subject: [PATCH 2/2] drm/framebuffer: Fix use of uninitialized variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-uninit-fixes-v1-2-a60772c04db5@ideasonboard.com>
References: <20230804-uninit-fixes-v1-0-a60772c04db5@ideasonboard.com>
In-Reply-To: <20230804-uninit-fixes-v1-0-a60772c04db5@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=W3BdCub5uZqFZ3mcZrRZT/MkOLhq4JHeGg/aXz3nw1I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNmxZWV22iZzrPJkJW6W5BD4iTDw0P5YJjzUk
 BzzN5se7uKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzZsQAKCRD6PaqMvJYe
 9acCD/9Jqv5JDU5Yg3BWu883KU+wA96GtjuEePd9EJOMd/im3JTG77qMTGlkUQ07EIQ7l5/QzRw
 CQcyhXk3LYB5ocA3wWtTX0O5hvsT/k0/zVtur/wANTbncq7Ae+OoFBxYbdWwTbCkpYNW8lwlOc6
 fv/9fgZ83E/NLAbdFTqyb1ER/x8si7NUKh7cHcm8Zjq2xPW01wKmsBLfl51XoYMOi+KaSvPajfg
 74v1/shwTaOg/WapJlgBWgTISdJ9LnK2fFT/pNp16Y8KMBj1a40Tw+381Ne5zu21+IjNrOcfTF1
 6LaNTK7kb5Bxugj8S2En42mUkACDUU6Gj0GrWEVqYD/ri6Q2GppTM48vjfKLhkKECkUJhKiHEby
 o8LbFZNMJG3auZHreOYO4pr/0xxwOXJ3GzvKRaykPD31h46dw7BLvHqU+J0If3LHYP51Hp1i228
 J8knCsXJJu8XV+JBy9pzgpu9Dwj/67cbQY86+C/JZ4syDmqb1klTgbq+hDjR7kMfnytX9d0yl+S
 J472vWkDKGUksF06JVFHAq4QOnAlmv5JtuCqUZY0BVwkMoVXXPzlyVA/LlTeozb4lwih6EunGcb
 LVvmb/O/t2T6n7OqmQ/IcuUtxODVYWuatZeszSYFt/Td7DDXin5BFDfXKNF/EHzWhB0zkqWAEuE
 RvIi4bOlH9kqyUg==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports:

drivers/gpu/drm/drm_framebuffer.c:654 drm_mode_getfb2_ioctl() error: uninitialized symbol 'ret'.

'ret' is possibly not set when there are no errors, causing the error
above. I can't say if that ever happens in real-life, but in any case I
think it is good to initialize 'ret' to 0.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..1955eaeba0ab 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -570,7 +570,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 	struct drm_mode_fb_cmd2 *r = data;
 	struct drm_framebuffer *fb;
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EINVAL;

-- 
2.34.1

