Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E454564A3CC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 15:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33F810E1D4;
	Mon, 12 Dec 2022 14:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E333C10E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 14:55:30 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id s7so12329850plk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4ea8rvmGnrS/8sRSsoYglrzM9FWA5fUizBf/l/CVMc=;
 b=nt1qHxoUkFtSYDEH24MU3Zr1sZ5imgK/FR3091m9lCKlCS0zN1OR0Hr9JPZ3dJJ9eP
 +UO+hGhO3DZRXmDDg8PBN7K8JXncFazWDw2OnuuR3MyCA1GHgf0jF2Yv71bVONV3pVte
 qAiY+6HitJTUUlXQcYl4v46tWCuWvi9A8EEp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4ea8rvmGnrS/8sRSsoYglrzM9FWA5fUizBf/l/CVMc=;
 b=8EN5xD2wT9z/UOAXo6IG0pavHrIgcHyqPTDQgW+aw+ITNUjL66UKEz17hPubeUORmO
 s+dZB6ZBtwMSUoV6NunPB9JjvTu1efGH+hC561rwuHzBRBmOAbHPL861UYSAi3nDxH/b
 Ef/pNJuQ9eU08a8ivygzmJiKRg8mkOyJWwvIYxE2flu2MT9vCNiIy4aTCq+8CnO14lEp
 TcENDY6kTjKGyf7xTfOh+m+eiPLSoCw4y8UojzQR+Wu1PmWV+n3Ef7vifjqgiNcCTTHx
 3tfxnxxDcfa4l+lEaLAqP0/RWF10mpQVNiuW9yYri0uxDbmqPu5rPbENbLAqpTTcfSCa
 7QhA==
X-Gm-Message-State: ANoB5pl2UZp6sR/bNfvi9yhcYR4TBgxoEUiKGOBbWbSKG2pQ0GEuds0J
 O2enT/WjYZ8KQE4LNGqUC4gI5w==
X-Google-Smtp-Source: AA0mqf6WJEW3banWVF1AHkY7665xfeS0AMVZwAlise4jZmkDo1Cpd3nFYLOJGi6TID6YpovqBoQXgA==
X-Received: by 2002:a17:902:6b05:b0:186:b063:32e with SMTP id
 o5-20020a1709026b0500b00186b063032emr17616981plk.62.1670856930519; 
 Mon, 12 Dec 2022 06:55:30 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:55:29 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 2/3] drm/bridge: tc358764: Enable pre_enable_prev_first
 flag
Date: Mon, 12 Dec 2022 20:25:07 +0530
Message-Id: <20221212145508.15096-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212145508.15096-1-jagan@amarulasolutions.com>
References: <20221212145508.15096-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Enable the drm bridge pre_enable_prev_first flag so that the
previous bridge pre_enable should be called first before the
pre_enable for the tc358764 bridge is called.

This makes sure that the previous bridge should be initialized
properly before the tc358764 bridge is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- none

 drivers/gpu/drm/bridge/tc358764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 53259c12d777..f85654f1b104 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -369,6 +369,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.25.1

