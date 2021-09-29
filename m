Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C441CF3A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 00:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247C56EADF;
	Wed, 29 Sep 2021 22:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E47D6E247
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 22:28:40 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m3so16744842lfu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tA+KKGOLRJY1ixD7Pul8ODDIk67Mm56gd0/u9zf4oKY=;
 b=dLxBXIwdypum+ES9aYEtVXoL6oAEUkFY0NQZFL46k5u3Zp9lqyMYUv0iJgDZ8sEuh6
 q5sntL/XSGJWcBPRKarzVKwWlu9c9OLbX0DifvgAZFepWmCuuAEQBh8ssXgRJmVyRqMm
 WtHKdxLXQ7qLY2TdeJqiNFPWcdSbFytLICHIBKvHylBzsDa6CorXj74mfThdM6ndJWjv
 jVqk7j7T0CCcvbaAaH05FYSrtUFAotwlx+OUnS+ImQg1EgYsWrR06j0uSNoXrL88+Zz5
 JAOay23HnbWiAnYFVz4Ml9XJ8sWF/I2Fm7hR5BfCexnYNjERaZg+yZiZ2LOMrSbuzCn9
 u4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tA+KKGOLRJY1ixD7Pul8ODDIk67Mm56gd0/u9zf4oKY=;
 b=WoAcK7xwqIAavg5iepa6HKiOlKLtE2dbb+MPzlexihiPUiTZ9yx8qtMS9h41uz93I/
 hI0v7zv04BURDbEtV9gbB4dLtgWUiz4JUWT1rw4M0Cr/HG65jXcCCkGfhbI9hoo8xLj5
 ihLgk17CjbFUquW0/isgk6O9hRSw0LHdzr0eyJvlscXqF3DxcGTAPVvgIrCoXY9JX5en
 qUxF7py9YriFYpzLbbUd1GV9XsPOJN4FCQ7zgvOLIwjuLLn9RBtIaBNsrXn93MdiDzU8
 Eyb4cgca46r22pGxhlHUka5RdnyKXvfeH6N4p2B52h7U6M2y6O8kNR55g+W8XLQUU8eY
 Zk9Q==
X-Gm-Message-State: AOAM532BAWxgSfhscieYMfMUw8BM3ip1+3jwW7KLiKez19nM5NwOR7jp
 8RaheMLC1zCzvMr0AiIry3PA7OVZADc=
X-Google-Smtp-Source: ABdhPJwWK0tddMF9iQtWSoycsuyb4XD9f8jRwyNj1fwPLDeZnvbPIJpbTGCFhRmM4HJlJVCzixhSIQ==
X-Received: by 2002:a2e:9598:: with SMTP id w24mr2392660ljh.77.1632954519231; 
 Wed, 29 Sep 2021 15:28:39 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id br40sm137782lfb.64.2021.09.29.15.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 15:28:38 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] drm/tegra: dc: rgb: Move PCLK shifter programming to
 CRTC
Date: Thu, 30 Sep 2021 01:28:04 +0300
Message-Id: <20210929222805.16511-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929222805.16511-1-digetx@gmail.com>
References: <20210929222805.16511-1-digetx@gmail.com>
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

Asus TF700T tablet uses TC358768 DPI->DSI bridge that sits between Tegra's
DPI output and display panel input. Bridge requires to have stable PCLK
output before RGB encoder is enabled because it uses PCLK by itself to
clock internal logic and bridge is programmed before Tegra's encoder is
enabled. Hence the PCLK clock shifter must be programmed when CRTC is
enabled, otherwise clock is unstable and bridge hangs because of it.
Move the shifter programming from RGB encoder into CRTC.

Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c  | 6 ++++++
 drivers/gpu/drm/tegra/rgb.c | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a29d64f87563..a582ce28b632 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2107,6 +2107,12 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		tegra_dc_writel(dc, value, DC_COM_RG_UNDERFLOW);
 	}
 
+	if (dc->rgb) {
+		/* XXX: parameterize? */
+		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
+	}
+
 	tegra_dc_commit(dc);
 
 	drm_crtc_vblank_on(crtc);
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 606c78a2b988..933e14e4609f 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -116,10 +116,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 		DISP_ORDER_RED_BLUE;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
-	/* XXX: parameterize? */
-	value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
-	tegra_dc_writel(rgb->dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
-
 	tegra_dc_commit(rgb->dc);
 }
 
-- 
2.32.0

