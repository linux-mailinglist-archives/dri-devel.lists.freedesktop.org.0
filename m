Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FBF41B968
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57D26E9C8;
	Tue, 28 Sep 2021 21:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02856E9C6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:36:10 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f2d30c08fso216916pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQX8GmY7T6q1qGlMzAWCdy7ICpLGZnTQF7PCVQGgK8s=;
 b=S/hCXUApz8v+EUOzq+kJgswsyDLmDLWGOGe8+KqWZqgpB6uopZbXwSsAQXyn13zg4Y
 Z3qFD6UkcUsi3aLN/halyD1zf32opsJxPdQW4xmUCxET4iCZmwlzJPcxK76nAeupUudL
 5n8BzBLWXkGtKPCUHcFDAqlWt1aCP/7LZH7NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQX8GmY7T6q1qGlMzAWCdy7ICpLGZnTQF7PCVQGgK8s=;
 b=NeH+75z46aBGgRGF8rXfUfGe3cCSBszyHGH9e77RCx2hHLgn/OohPVX++xfx8zFxyA
 5g2Z3EdYmQMHy3oyZ6Ae5UzyAjsLtpV1552ekCPiTYGFJVftkVuPY8KF9jeFDn4NroUq
 g/a3LYnWkGAd8Fs79f5+TB+cbG3b+1bEgV9hR97bTpG7BxyZXOPgYHfcQWggyw9VtdxM
 uvSkN0lunSdwEneyvgZ+TpqqX6PjjEf7WpWbA0+Auwg7MP1fspkUgAZycwO09kulZu5S
 XUZwcThW7GMQAu7ADDGglRfAYN/GDzbyknM8R1qql3B7lSgDKn9q7La4SyVXMOWlB9bv
 WL1g==
X-Gm-Message-State: AOAM531pVb1I5gWq8PROvKltkU0j17jQjHeQA/SLLKhA919psklxl6vw
 gJmGocffZ4Kt6e3MIlCqdf1CeA==
X-Google-Smtp-Source: ABdhPJxBtdrSwbloXEqMEPuEWnVWzEKAvsoScNpy0XM3MNi5Y5l3IAsEFHhs+VYcC72TNoEAzTsALw==
X-Received: by 2002:a17:902:cec2:b0:13b:5916:59e1 with SMTP id
 d2-20020a170902cec200b0013b591659e1mr6841845plg.76.1632864970399; 
 Tue, 28 Sep 2021 14:36:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d7ca:580:94ab:8af8])
 by smtp.gmail.com with UTF8SMTPSA id n18sm105073pfa.42.2021.09.28.14.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 14:36:09 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Thomas Hebb <tommyhebb@gmail.com>,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 3/4] drm/rockchip: dsi: Fix unbalanced clock on probe error
Date: Tue, 28 Sep 2021 14:35:51 -0700
Message-Id: <20210928143413.v3.3.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210928213552.1001939-1-briannorris@chromium.org>
References: <20210928213552.1001939-1-briannorris@chromium.org>
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 21c67343cc6c..8ea852880d1c 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1434,14 +1434,10 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
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

