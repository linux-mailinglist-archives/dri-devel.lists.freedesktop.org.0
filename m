Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E86D20FB55
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54076E059;
	Tue, 30 Jun 2020 18:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB026E071
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:05:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so23667857ljv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ygKaYG8Ey1UY0llZRhip5jaZ4mD1ALFWfXmOc46teac=;
 b=FsjNrIECT34lh97NGqe2QWzGkmZBiXEeFsx7gRjYzK/CzFfeu7nkeoBhvNwpWfXYsd
 PTOu0Bgzpgi5GNEK+wSrgHvfGJx6JDwdIbmzO9SXXnr2QiIX4t1G6miNGwjVtGE5JeKX
 YbBFQD34Pxc9mzJT7SJ4aCc4ZE8V0/qqsvLv7SQmF1CvsfQege89g1xhoNZVxmHXAQk2
 ZJB7JD2yHrpelQUFsSy7q2sU9ndPDg9CMKxAnujTbJhv19q2zaq4d6FV/00+hGGK9R9L
 3QmIkdlluIExCoRrBNzLDHlpQCLIFo/y+m+iyfRv+pbQ1rXZMKJj3keEkwZ8pkfAaKux
 pgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ygKaYG8Ey1UY0llZRhip5jaZ4mD1ALFWfXmOc46teac=;
 b=EEDP5fGu3iS6aTJbSVuFhb3dSUgqx1JiAde30ZuUj/j7P77DTm76axKGkgelOdke0f
 yS7V2JJFzrEp1QlznOeJM5WFvjbMgGtWPnQ4L6uGTI/CLp2/51phOSS0DX+OqkpVON92
 9IUFMQ9UjpJraSm1RW0moWGLoGTPJYeYucTx97vO8Ic2qXBTC3lJrV8fSO00UA/lWZsK
 0Fz/uchhVefNr+r+cG19eweFB3MriPLV7rpur9cDJrFDCyGJyp1utCkO4cNw3S1JiJ8a
 oqXzK3mfaWv/1kgH/XnwoTz4AmQQcNpkR2zj7j5Xt58wTm+xARNfP8R1S5Mq5ePZp6YO
 bIcQ==
X-Gm-Message-State: AOAM532HSZ4NTWgrFA2+bgwwTMJCjfE7tQV6+6ZWUKvi25dwmXv/BkmK
 gCEge4yNkOXHAI5rGwCrUqnWNlWKvss=
X-Google-Smtp-Source: ABdhPJw0vDXi43wZYA54sdKeGnFUoUNbyWby0xOnpusERkGhAkoqg5s0ARCDmoeY1AIqnXUIVKlsuQ==
X-Received: by 2002:a2e:9b89:: with SMTP id z9mr10832285lji.163.1593540356895; 
 Tue, 30 Jun 2020 11:05:56 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:05:56 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/7] drm/ingenic-drm: drop use of legacy drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:40 +0200
Message-Id: <20200630180545.1132217-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
References: <20200630180545.1132217-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the legacy member with the more descriptive _DRIVE_ variant.
No functional change.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 16f0740df507..deb37b4a8e91 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -419,7 +419,7 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		cfg |= JZ_LCD_CFG_VSYNC_ACTIVE_LOW;
 	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
 		cfg |= JZ_LCD_CFG_DE_ACTIVE_LOW;
-	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
+	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		cfg |= JZ_LCD_CFG_PCLK_FALLING_EDGE;
 
 	if (!priv->panel_is_sharp) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
