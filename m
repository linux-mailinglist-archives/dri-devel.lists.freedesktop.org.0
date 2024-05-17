Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE418C8DC2
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 23:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5F610E0A0;
	Fri, 17 May 2024 21:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="awt7eiQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3941110E0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 21:37:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1eeabda8590so21119895ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715981864; x=1716586664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOCpqzi3HqgLjpNBxA0mBkV791uaa9LyaeXWVqamirw=;
 b=awt7eiQUlSzQgE+PZSZl3YWgZMJVErnSBM9jIY58Q1MVGMDmiCpDbK2JKmnYrfW0jE
 hFw95330C2nD4Ab08+wguQOdN4vkhaZ/S95Qb5yzNMqi50cqWi8VZxvfl21jv5ErQImv
 MPRbWgFHOJLeYPGLtT/9RcS/IUEgQOmyV9VY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715981864; x=1716586664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOCpqzi3HqgLjpNBxA0mBkV791uaa9LyaeXWVqamirw=;
 b=ormlRizC1d6tLhEaGSNMfzwdtMswY1pnBnCxyGC3olFvuGbBzCxkQuXVuRrSdp/XW1
 lhAmq3q3cM+K6ns8QyrwNTx36PxXSycbHflPm6XDG5a8GygzGaIubO+FOkXbvQJpOA14
 KebV9NJVZgGvLdQLggD7GOeA9c/N4CMEB6J/QLyZpAdbxgiflBelTXvT7jC9FPt3Hfo3
 GclWLsfLFIEGP/+2zEStQdhKZthwRwgEt7vbfi/Mz+1ncpWZ8GecFaN3/h0a29pH0wUJ
 kPalG79feEn3lfYV/vNwr4LfSGOKjB4ACVacMGBvGxCxs1LU5t7hpecEg3i7BVbDx9f/
 uzBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFKFS24+UeeH8pr5VabAaDbT7xPZqTFln8rwwWJ/VFbzoHrGAzkuO1bAG5F3tkm6LmTmHuiHRIkrp0MgFXXNBOtpY3tDIhfVrlwuj+jzfO
X-Gm-Message-State: AOJu0YwbwCnVcDjVE/vzHE+6XjGKb6p4uMyoI3yN+NtUAg1Bn0Dd8oXq
 vdv1XfTiNfjD6vsdwCNjWdre09Gf4hIpRAeLp9NkGqpHDEUdie6iyPz7CaOEnA==
X-Google-Smtp-Source: AGHT+IHQeVpOpHuWwPDHwj5Y2EyRQy9AOFOGAMnBVeq9k04cNJAbxX1fcU7hJFn6i0+Z3n4aXjp8KA==
X-Received: by 2002:a05:6a00:1ad0:b0:6e6:9f47:c18c with SMTP id
 d2e1a72fcca58-6f4e03858b3mr27717561b3a.33.1715981863806; 
 Fri, 17 May 2024 14:37:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:26de:b1dd:5:771c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2f8b3sm15168736b3a.211.2024.05.17.14.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 14:37:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] drm/panel: ilitek-ili9882t: Check for errors on the NOP
 in prepare()
Date: Fri, 17 May 2024 14:36:40 -0700
Message-ID: <20240517143643.5.I323476ba9fa8cc7a5adee4c1ec95202785cc5686@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
References: <20240517213712.3135166-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mipi_dsi_dcs_nop() function returns an error but we weren't
checking it in ili9882t_prepare(). Add a check. This is highly
unlikely to matter in practice. If the NOP failed then likely later
MIPI commands would fail too.

Found by code inspection.

Fixes: e2450d32e5fb ("drm/panel: ili9882t: Break out as separate driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index a2ea25bb6624..266a087fe14c 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -478,7 +478,11 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	usleep_range(10000, 11000);
 
 	// MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high
-	mipi_dsi_dcs_nop(ili->dsi);
+	ret = mipi_dsi_dcs_nop(ili->dsi);
+	if (ret < 0) {
+		dev_err(&ili->dsi->dev, "Failed to send NOP: %d\n", ret);
+		goto poweroff;
+	}
 	usleep_range(1000, 2000);
 
 	gpiod_set_value(ili->enable_gpio, 1);
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

