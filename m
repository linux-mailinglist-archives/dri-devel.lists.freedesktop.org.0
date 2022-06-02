Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B553B6A9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFDC1120C8;
	Thu,  2 Jun 2022 10:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3198D1120C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:11:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n10so9016234ejk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XP2MYhxOsKZps4QmlXxrybN7eWdufRzVMujwQeLYeiQ=;
 b=Y7onb5K2NewHqCE/PuGP/wM6SCeTA9lIvWKzv8jJhtUkxUOyaEHEvZiw4JImYrjs5s
 kN6M2jWBn/hQJ/gO0U4qlL+XEEZs8pBtfUQ7IuiVcWEY+wkFthPiLSsrRXsS3fAejXjf
 kvvCJdXMPDrXcvk9yeZZs+tpjZf5dJArjVjTut02jEijcVhq8rbRluqdP29ZKyXUlZ0F
 fJkhZe5RKIX9fdItmgPXHqlKhpZXFaipTO/Gruap1SOY4B/9/Ytjd2qjTb2u4T/Z7HIv
 oAhNBOBsbESgy+TS8gXxGpo9jSv+l6+EKeAQ+jf9dQdnk/13eCdBqS3ieLyeeOzv7xBB
 liEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XP2MYhxOsKZps4QmlXxrybN7eWdufRzVMujwQeLYeiQ=;
 b=sHXMFz8y2N3aPLhVx3UogQekRvgcB4zOmQlM5Kv146Bw+duSyTmH4fSd/PunooVqif
 t9LQeVHTZNy/Z0V0KPwiHuHt0c+sjNx/IVZW7rRsraDn10ZmqYDpiUeOq5gKFtqs7gBO
 9Y/TfoI7aSZ215dD9zmH4nbvh2BhL7XToMx5S9R2qtyGqy960IdHzNsZ5LsVNQDl4jtg
 Gw4XRTKqEIxy7rqERSwP5FaceM0lAkB3AEwNzudLvIWX7rEjUoFxYXJFP9k3IMS8pEd+
 3WR06wK8XeIzldWZIPC/kBWWUX/4/ww6D+CpHKgmi9yIuRjGqBvjjGnFBi3+KZ6mSJRt
 sOuQ==
X-Gm-Message-State: AOAM532seIOlhjR3aQ8PPbxUaRuOtI9jb7BfvCbG2SJBy/Gi4HpmyT4y
 f4IBfNzy/LFz3m6LxtnX764=
X-Google-Smtp-Source: ABdhPJxDXM6X2WzIbpB2ecG4Bo1W47SYy6zSGtMFLhp5s1cFEX36s9yh+wV046gKroqLIrujwyPa2g==
X-Received: by 2002:a17:907:3e8a:b0:6fe:fcb6:6d45 with SMTP id
 hs10-20020a1709073e8a00b006fefcb66d45mr3454512ejc.348.1654164674585; 
 Thu, 02 Jun 2022 03:11:14 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
 by smtp.gmail.com with ESMTPSA id
 kx16-20020a170907775000b00706e8ac43b8sm1599621ejc.199.2022.06.02.03.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 03:11:14 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Subject: [PATCH] drm/sun4i: Enable output signal premultiplication for DE2/DE3
Date: Thu,  2 Jun 2022 10:10:57 +0000
Message-Id: <20220602101057.48170-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise alpha value is discarded, resulting incorrect pixel
apperance on the display.

This also fixes missing transparency for the most bottom layer.

Test applications and videos w/ w/o this patch are available at [1].

[1]: https://github.com/GloDroid/glodroid_tests/issues/1
Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 ++
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 6b1711a9a71f..71ab0a00b4de 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -320,6 +320,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0;
 
+	val |= SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY;
+
 	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index ebfc276b2464..bc12c95af6f3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -65,6 +65,7 @@
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
 
+#define SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY	BIT(0)
 #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
 
 #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
-- 
2.30.2

