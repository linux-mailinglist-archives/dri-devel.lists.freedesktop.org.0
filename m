Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E301A2838
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 20:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95A16EA60;
	Wed,  8 Apr 2020 18:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406016EA60
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 18:02:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w10so8951792wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEcQ55ibRFK7AXPn8tBuEBfXFG9cbhFC58mmg9uXPtg=;
 b=lf9Ts6U3jCUsqBGgmBxLulZ73U60x2S9pa76VvVszJnbPdvtYQ9W03I6zarSOjxquI
 irDxo9wy1Q8TjRSiQ4877luhVhJISMxrvQV77w4PxJi2kpvHOFXgcA7nqRD/SOhBc7XL
 owtIwDaoRaEHteth91tQjFbd+OXTX5ORu1BANT36apSN4kbkhJ+T3fXtgUFFGOXfNOfT
 1vRm3LaHANUexcyGxozZAl52w27oUPo+2a+vg7glZiyvdWMMn9JANFwqoTLlbbeSoyIK
 CYu1bey/UrsYZWYVj+v3kF95wEoDHbgjWn97XxU1ewe03hG0G4/5PX8SP4GCqhfiGyn6
 6I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEcQ55ibRFK7AXPn8tBuEBfXFG9cbhFC58mmg9uXPtg=;
 b=OyxdAAQENe1huYvx1yHVZ2sbzsKK3z/ZqdaAK/sAgBlSU9KQ+hSapi+lFb5OWDXcgM
 HzBegsfhOYMIER9ik0hk4/Yy4YIQRQ+p40j+muO6QAz1/0JOJLa/q7J9TVIZ1svlc3RJ
 wIg7pziMSwCpmm6VKOxsqXkEn19N/0B6fEGYxe0WyX4gfWgRa58YvV+AYMCqXEoZ5GPC
 ygYsKFXggEC77Sj+NW/iCW2xfd8KzUyJZI2W9db7NowMBf66KfDAkJSpJOeYu/IpH56+
 wGlHK8AGCgNyTyhhN5T8yVtkbplX+OBLLQWEzdHjiBpqGOHbjK6JCA9cWQHl/qz5nWeb
 RXZA==
X-Gm-Message-State: AGi0PuaiAX+3wAEnUGQ/yPJeH2eg8e9rnjgU6kYc/Y9pWdAaIGlRNEFF
 pdMPZ5+c2L16V4YX9dUlP8g=
X-Google-Smtp-Source: APiQypIvpKUxxFoSuOVyu3jyunFbDt5AMBn6/R62J/u8KG+Ic2bfo8fZLnJQ2UZyDBBT3/2jHqkxsw==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr9165884wrl.278.1586368969830; 
 Wed, 08 Apr 2020 11:02:49 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
 by smtp.gmail.com with ESMTPSA id z8sm6681209wrr.86.2020.04.08.11.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 11:02:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Use i2c_put_adapter() instead of put_device()
Date: Wed,  8 Apr 2020 20:02:44 +0200
Message-Id: <20200408180244.3079849-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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

From: Thierry Reding <treding@nvidia.com>

In order to properly release the I2C adapter used for DDC/CI, use the
i2c_put_adapter() function provided by the I2C subsystem rather than the
put_device() function which doesn't include code to drop a reference to
the adapter's owner module.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..136fd2f56af0 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -177,7 +177,7 @@ void tegra_output_remove(struct tegra_output *output)
 		free_irq(output->hpd_irq, output);
 
 	if (output->ddc)
-		put_device(&output->ddc->dev);
+		i2c_put_adapter(output->ddc);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
