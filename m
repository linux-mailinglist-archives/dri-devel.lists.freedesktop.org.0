Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955FA645525
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C110E361;
	Wed,  7 Dec 2022 08:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A457610E303
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 08:34:12 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id t17so4461196eju.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dcRZDjg3O3q6T3Sk5c09WrJuoI7e4rWvSzYj/Z5H43A=;
 b=4WirXC4jMxNwlMz6xJ0Jso5tI43SM73m6Z9nAG5UcC6cra+AVeRVqQ34JVt6DgZKgV
 c9hIcYbA/AvXNIM6RMGCohkjPKGrjCTBPl9oU3bNjAjQ/umGlKZLpggA155FB0vJk6Ct
 rVcHJ0ILj6BY4HBabqfD7FJVizZkw3Ldgd5e3xJbSInv7XpX/wYG6HZCmV7RsRmxhpIu
 XkwElGUBdmrQGgZBpaz/Yd6JEAvU7fw8grj8BxnZf8UlHql26r0u8WY4z+Mv4oLZ0koR
 xQtcD4jBbiBlgU3ycjVbJlgfX5rdOKY5JE6tHR1X8QYJktlo5P4BCCoaT1FmCpd7wM9l
 2tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcRZDjg3O3q6T3Sk5c09WrJuoI7e4rWvSzYj/Z5H43A=;
 b=eJsdb7BSpGbiI3QDP7esz8I0p6X4NCYh6mjorSDx8Lc6PIKGBZYDJOe3zg1dn+q72j
 F+59E1EjuKHahQ3uqXbpyFZ2AhI+CpCSoDlAAE5MKcUpcGP4L4r+minvYzmgKitdUJfr
 q9VrP4dzoyCdeYyICSpudKdZUZ2OJfazuOOJZF9XJ+bbMgy1w4Gr+7ZJWfV5mKKRXJoR
 B95PR6LVi1K7jx0VU10y4fk0JHlyuRLijvh+zbqCQrGK7Axlpw7iKo1Jl8cI+1XTeBvD
 LgECQtmDim9U3i7zZjAS2Jo3lK6eF46gcKjzvUFn14SYmJg0vR6YG7Kd1a3CKFheDalr
 Wfdg==
X-Gm-Message-State: ANoB5pns+5zLEmQhbvesCLkZrip2KDX0JgzL1bvwuvCHOcxSBAKP290N
 w6BwiZ2Otgef12CLwbdCREktQw==
X-Google-Smtp-Source: AA0mqf5gb/HnDPmrEu015wzGjESF27vgWXcc+GMbiF/NffvzbIeSzlwquLLovFxqS8JOcTBj9/5vKQ==
X-Received: by 2002:a17:906:164d:b0:7c0:b602:f9a1 with SMTP id
 n13-20020a170906164d00b007c0b602f9a1mr17569290ejd.88.1670315651166; 
 Tue, 06 Dec 2022 00:34:11 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 00:34:10 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:03 +0100
Subject: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:47 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For platforms using simplefb / efifb, call
drm_aperture_remove_framebuffers() to remove the conflicting
framebuffer.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 14a9e6ad2d15..6fd4d42437fd 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -14,6 +14,7 @@
 
 #include <video/mipi_display.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -238,6 +239,10 @@ static int ili9486_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = drm_aperture_remove_framebuffers(false, &ili9486_driver);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);

-- 
b4 0.10.1
