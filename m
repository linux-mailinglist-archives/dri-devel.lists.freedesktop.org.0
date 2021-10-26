Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12A43AE1F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 10:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A78F6E44F;
	Tue, 26 Oct 2021 08:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235AB6E44F;
 Tue, 26 Oct 2021 08:32:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A34D560E75;
 Tue, 26 Oct 2021 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635237179;
 bh=uCkPTVoU53WjkdLeoB8wj5W6HHDIndi8XX783vkYnKc=;
 h=From:To:Cc:Subject:Date:From;
 b=Gnv4MSVeqWWK56HzvTnGFjdyR/wiG3tDifj8A5YLdfJ/4f8btdSbqrXjKstEWmLyf
 QUIlgZFQzmlVv+P2lYbmy1ty/dE3+j074o2VXsuTjFxqT0LYvr8AQpTJQ8NrkbYdqZ
 75pQMJSPAT0ASTXKy0FKHtF5MZxuVqUGbnuxEz4hCJRhmp+8HOYpIUCB1xV6T553Dv
 IxZmfJqqbod7V1leev1sqxjIvnDo1WD9KtY6xaoSIkNXrxl3SGxvH6mX84Ox4SQyJM
 910fPjNsidwc/V5b7+jTjmst0vKF9iw+misyqbT3x3lKwdaWilCULzcAOBEUQVCnDc
 0PRBT2rbeHA3A==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: fix missing #include
Date: Tue, 26 Oct 2021 10:32:41 +0200
Message-Id: <20211026083254.3396322-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

From: Arnd Bergmann <arnd@arndb.de>

Some randconfig builds fail when drm/drm_bridge.h is not included
implicitly in this file:

drivers/gpu/drm/msm/dp/dp_parser.c:279:25: error: implicit declaration of function 'devm_drm_panel_bridge_add' [-Werror,-Wimplicit-function-declaration]
        parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);

Fixes: 4b296d15b355 ("drm/msm/dp: Allow attaching a drm_panel")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 81dbcc86d08a..a7acc23f742b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
+#include <drm/drm_bridge.h>
 
 #include "dp_parser.h"
 #include "dp_reg.h"
-- 
2.29.2

