Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209A78689B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BD010E4A9;
	Thu, 24 Aug 2023 07:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E6C10E4AD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:38:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04C0962349;
 Thu, 24 Aug 2023 07:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B0BC433CA;
 Thu, 24 Aug 2023 07:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862688;
 bh=Ud+JmrQSf+WR8fLk9PtmUGKmnz/n+mzcTHuAf4DcxX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u5ji2+9DHanRfav04RicE1BpnqasiNzCcJCY2gklfVBpwKZTDHXBnfRI2zPvHMR6b
 EDhSsPp9uIbNp0XLq4wmsg5rQl1GVmwm+KGFyMv7ED3vMGkja+GQKQmvoOWTmaLiTf
 rkQwt73vqm4LSSOyqNdGHff79+P77BUQiGk54ItBMwFHwusnjsamjymWUp3I/tY8R8
 pyqQhtTglLhNR1viLM6VVH7wuZSev3eBVvkF+7srRuni8wsseL4fMmlmlctOySpWdF
 Rzd7UzjZBnBztEE+Lr0XPWru9W5onfLE0NSPSduzJHZKqV5keWJTCIk2d0BcJNKQe1
 hhXLhGInGs3SA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 15/20] drm/tegra/hub: Increase buffer size to ensure all
 possible values can be stored
Date: Thu, 24 Aug 2023 08:37:00 +0100
Message-ID: <20230824073710.2677348-16-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from int to string, we must allow for up to 10-chars (2147483647).

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/tegra/hub.c: In function ‘tegra_display_hub_probe’:
 drivers/gpu/drm/tegra/hub.c:1106:47: warning: ‘%u’ directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
 drivers/gpu/drm/tegra/hub.c:1106:42: note: directive argument in the range [0, 4294967294]
 drivers/gpu/drm/tegra/hub.c:1106:17: note: ‘snprintf’ output between 6 and 15 bytes into a destination of size 8

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 1af5f8318d914..f21e57e8599ee 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -1101,7 +1101,7 @@ static int tegra_display_hub_probe(struct platform_device *pdev)
 
 	for (i = 0; i < hub->soc->num_wgrps; i++) {
 		struct tegra_windowgroup *wgrp = &hub->wgrps[i];
-		char id[8];
+		char id[16];
 
 		snprintf(id, sizeof(id), "wgrp%u", i);
 		mutex_init(&wgrp->lock);
-- 
2.42.0.rc1.204.g551eb34607-goog

