Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5545417E26
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 01:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB416E2B4;
	Fri, 24 Sep 2021 23:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237DC6EE94
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 23:24:00 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id s11so11274969pgr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1xurLATt1ex61qvV7KZiCU51/9V6GkfxwxIS9VeD8VA=;
 b=M0iBjYKc31rwburlfMZhx8Oipce7pYY2b5Wpof8qmfYNDOvUxojzCbPVRom/Yf98BS
 U2aMO7VEjPmHKfCPKRqp6w1QdDDg/lnJZL7ZZEi2aaExAU7LgRYJwhNBFrc6Qvq3CExX
 nLwe3BAxUsOGADFUJj40SReGj/U7+suX8cfR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1xurLATt1ex61qvV7KZiCU51/9V6GkfxwxIS9VeD8VA=;
 b=Ta/31my0AfJixXiVzcD8E6N17jGPcDYKxoF2NpmTi+gy9gyVxFMnn6n+yy8OTEQX0z
 BJdmoVzKAfUc57yXAAM9qhNtaTIAGWjKBe4GCQYlousTwS6ApXi7HZ4SlucY01eddfDh
 +eLx/iSFpkOBmboH5AC5O27glbVeCwXdioxYwpfOCYsw5MrwBn8kS9BU5ZRpKTwDN/Zs
 bKE5vmDApl2f8SHvFpB7abwz/h2OAxeQvsq4p5cgyG+Ozehen2h/oMN7MqCAoj1Wh/TC
 D/wSYKO7jwOQYQICohxrFb7Blx3XyKlafxR34DvoJ/o5oYN4LLyhefrKC2MYmKLkwaIV
 5YfQ==
X-Gm-Message-State: AOAM533wvFiqs2qCZt8hMp2Nn1Zxqq8Y/7WTtLrf7I30An6/twhQJBC8
 J4K+OaV0gueIC+F2iagXPIJRww==
X-Google-Smtp-Source: ABdhPJxSkNCeRzwyQ3fSmMMMaH7U8DCIuSFSDDP6SFmH8mr0k4mDFzipSj7Tc0UW0PwqVpy2bX58+Q==
X-Received: by 2002:a63:555d:: with SMTP id f29mr5911472pgm.33.1632525839778; 
 Fri, 24 Sep 2021 16:23:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74de:c8b7:3a35:1063])
 by smtp.gmail.com with UTF8SMTPSA id 18sm9916476pfh.115.2021.09.24.16.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 16:23:59 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Thomas Hebb <tommyhebb@gmail.com>, Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/2] drm/rockchip: dsi: Fix unbalanced clock on probe error
Date: Fri, 24 Sep 2021 16:23:46 -0700
Message-Id: <20210924162321.2.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210924162321.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
References: <20210924162321.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
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

Our probe() function never enabled this clock, so we shouldn't disable
it if we fail to probe the bridge.

Noted by inspection.

Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4340a99edb97..0886a5dee58c 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1391,14 +1391,10 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev,
 				      "Failed to probe dw_mipi_dsi: %d\n", ret);
-		goto err_clkdisable;
+		return ret;
 	}
 
 	return 0;
-
-err_clkdisable:
-	clk_disable_unprepare(dsi->pllref_clk);
-	return ret;
 }
 
 static int dw_mipi_dsi_rockchip_remove(struct platform_device *pdev)
-- 
2.33.0.685.g46640cef36-goog

