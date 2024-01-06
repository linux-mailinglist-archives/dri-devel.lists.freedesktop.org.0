Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C388260BC
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 17:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F3B10E0D0;
	Sat,  6 Jan 2024 16:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr
 [80.12.242.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DA910E0D0
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 16:56:20 +0000 (UTC)
Received: from pop-os.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id M9xzrDJlNBraWM9xzrWFWc; Sat, 06 Jan 2024 17:56:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1704560178;
 bh=yxMqrM3/fvbfO88ABtYbx7NWceijjlxlXEA90xmaYA0=;
 h=From:To:Cc:Subject:Date;
 b=rlNlhTFEC9f4inef+lf/dqwjC6inG5OTzyCnwH1SkqPlcup4CakBb1p4u6RLHfltu
 AXWkGzxX5hDzkzaH7RicUdgreY4FqBgAcnR9MC4+qYhv7KuJ7rqv4IGv30y2p22m2F
 Y3qGzVVktnp9pMm4/AQE2d9YdVYjGyOiK4m8MuIJYfJdD+zBp4z8OgYnKoHGna7jgr
 w5sHOxSFfui4C4dxQnYlDbZEiKMjkNGjrhuqKC6CA7mcTJu/0kAxuZVGT6UxQLCjco
 /51aWVLTTaxYrNUkHqWPGyxd26DdK7IqiLE6tnatBnawdV1skFgIpC4oJOQsNy8sTz
 /ZvnJmhhYMWlA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Jan 2024 17:56:18 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Anholt <eric@anholt.net>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] drm/stm: Fix an error handling path in
 stm_drm_platform_probe()
Date: Sat,  6 Jan 2024 17:54:32 +0100
Message-Id: <20fff7f853f20a48a96db8ff186124470ec4d976.1704560028.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If drm_dev_register() fails, a call to drv_load() must be undone, as
already done in the remove function.

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This was already sent a few years ago in [1] but it got no response.
Since, there has been some activity on this driver, so I send it again.

Note that it is untested.

[1]: https://lore.kernel.org/all/20200501125511.132029-1-christophe.jaillet@wanadoo.fr/
---
 drivers/gpu/drm/stm/drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index e8523abef27a..4d2db079ad4f 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -203,12 +203,14 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_put;
+		goto err_unload;
 
 	drm_fbdev_dma_setup(ddev, 16);
 
 	return 0;
 
+err_unload:
+	drv_unload(ddev);
 err_put:
 	drm_dev_put(ddev);
 
-- 
2.34.1

