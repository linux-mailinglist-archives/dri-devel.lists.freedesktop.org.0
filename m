Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA5420CCD3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F576E40C;
	Mon, 29 Jun 2020 06:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541BE6E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:55 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m26so8222042lfo.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
 b=E8gAXrM5cuu0IF442c0VUexWE3bkFUf3djAfo0y0tzrGwZDsUWKClZiplXSxevzpb6
 ORkx6IV6ae32ae/+Ty6JarojOmizz+ANLD+vKFkprJLd1ZAhcVp8XT+PfFoq0CH0rYEH
 Qu1NeRVxqOKRSBRK1gaRbYqRCnPe3rgmfDsNgG90XwZZNU9VKYb9bLZBpfi1Njq8sbZx
 TEZ0lGDpH9GvuRY6YR32oyVK7WieU9cBn/arKnRiCv9OHj7md9ZdQGlBM9Ym2mOXDs+B
 zsU3uQqnZ2QCvktCgr638zDIFMKCWDqUjY5ku+VsCIRsPf6QL/lfzpb0o/xU6oPIh1j1
 Z6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
 b=e3/BnEk0XBastcklAdA9bMwIOXqyQFaZSCNsl1tSrKVO8moWmMMI+v930vgjQ197/w
 jS+XV3cw2tDEHHhNLBa7IP5jDaJpRjmR55lalJympxgqIC0Vi1Mo4p5QQPW+hci3P9Ar
 ayLHDIMOji4PAw3hfAMDyEddLr0BwVKcst5ziemQpwRf1Xus54SA8sKb+bh07KwcC6wH
 aPWPjGUj7Sb86uuN6fnCQSHwVRzPn+VfCx+odg78Te1+ywCZn0OKVGLBqP8363+xnTaR
 1s1ryC9+O4H2ZJwVg/bdONUx555sqVgartpDTWepoWnFO3j8i8LAablHcMl2J5vz+u9d
 6pnQ==
X-Gm-Message-State: AOAM5308yfFQoyNRea9GMEqdS7Xy1yPcYtbd78wxAn6rsOwpvQO194/e
 TYyfgprwgnIU2haJWvJt3ic=
X-Google-Smtp-Source: ABdhPJwvYzl5MaUIZ2ARAdDQMTiYdlfoRyS1pvY1Az0U7VHaIlnyA2ud0VXw2QxY0oaAcdAKL9I7Xg==
X-Received: by 2002:a05:6512:3249:: with SMTP id
 c9mr697236lfr.216.1593400733792; 
 Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 2/6] drm/tegra: gr2d: Add tiled PATBASE address register
Date: Mon, 29 Jun 2020 06:18:38 +0300
Message-Id: <20200629031842.32463-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two PATBASE address registers, one for linear layout and other
for tiled. The driver's address registers list misses the tiled PATBASE
register.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 1 +
 drivers/gpu/drm/tegra/gr2d.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 48363f744bb9..1a0d3ba6e525 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -177,6 +177,7 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_DSTC_BASE_ADDR,
 	GR2D_SRCA_BASE_ADDR,
 	GR2D_SRCB_BASE_ADDR,
+	GR2D_PATBASE_ADDR,
 	GR2D_SRC_BASE_ADDR_SB,
 	GR2D_DSTA_BASE_ADDR_SB,
 	GR2D_DSTB_BASE_ADDR_SB,
diff --git a/drivers/gpu/drm/tegra/gr2d.h b/drivers/gpu/drm/tegra/gr2d.h
index 2398486f0699..9b7d66e15b9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.h
+++ b/drivers/gpu/drm/tegra/gr2d.h
@@ -14,6 +14,7 @@
 #define GR2D_DSTC_BASE_ADDR		0x2d
 #define GR2D_SRCA_BASE_ADDR		0x31
 #define GR2D_SRCB_BASE_ADDR		0x32
+#define GR2D_PATBASE_ADDR		0x47
 #define GR2D_SRC_BASE_ADDR_SB		0x48
 #define GR2D_DSTA_BASE_ADDR_SB		0x49
 #define GR2D_DSTB_BASE_ADDR_SB		0x4a
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
