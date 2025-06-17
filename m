Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A99ADDBB9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 20:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ACE10E00C;
	Tue, 17 Jun 2025 18:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="etzspGAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA76D10E00C;
 Tue, 17 Jun 2025 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tIw2w8u4nYMztG5MgyDq77ZNr77yNCVZF5PqgMqfT/c=; b=etzspGAzIiggD7N2nPSW091Txt
 eqVQG4e+2T5J7zHhK1idKeV0F5EKOLticNKRWy0d1wWROjKnDxDnKzoUkHeVqLf1dy0bJ+sguMRly
 ymsUlyNvShhkqLAy5cwoupL6tjObWUN3AT+X1IvuuKHaF1NpCNdm1oH361Is1lK/EHU7xaIc30Map
 7tlGJoMaQ9588y2i588Hom9elOLhVz7Kf4TMXK+xTL5UN6yCulacptSAKYRpzfLIpCGJQw+yDmSrD
 AJhAO8T4OlOGviKqeUteKcDB9bSLRHkRehqhmW/8BaROjIKGmJyqlzZeSx24YxA+30codY8weqy2d
 rUTIdSaA==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uRbTg-00000008Bua-1yAx; Tue, 17 Jun 2025 18:56:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Date: Tue, 17 Jun 2025 11:56:11 -0700
Message-ID: <20250617185611.2965223-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
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

Add <linux/io.h> header to pull in readl/writel and friends.
This eliminates the following build errors:

drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
   33 |         return readl_relaxed(panel->link_base + offset);
drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
   43 |         writel(data, panel->link_base + offset);

Fixes: d7e3bee925bd ("drm/msm/dp: drop the msm_dp_catalog module")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/dp/dp_panel.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20250617.orig/drivers/gpu/drm/msm/dp/dp_panel.c
+++ linux-next-20250617/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -12,6 +12,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#include <linux/io.h>
+
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
 #define DP_MAX_NUM_DP_LANES	4
