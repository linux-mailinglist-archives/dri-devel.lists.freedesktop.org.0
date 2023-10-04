Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71997B822B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 16:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C0B10E385;
	Wed,  4 Oct 2023 14:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Wed, 04 Oct 2023 14:23:34 UTC
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com
 [203.205.221.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5667310E385
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1696429409;
 bh=IFCQ36qNYlflTBGjiB1GM2HwJb7GMQotoPrkQGvpdeg=;
 h=From:To:Cc:Subject:Date;
 b=rt5SZM/W7cAieYMelDWnyGDd9k9cJOhcILeSOS8D6Imk0175LVjcK0Ut0+dgasvyj
 dO7jIaYkknO1+LnE9wp6gZ4Prf4l0Ur7j2vl+L29tMQG+4EK63gUBh+YqNha8vKzeA
 FyCEUjLjiGEwgrwM9bgjJTuKF6E4mQibYZ57HjF0=
Received: from KernelDevBox.byted.org ([180.184.49.4])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id 2B994C3D; Wed, 04 Oct 2023 22:10:57 +0800
X-QQ-mid: xmsmtpt1696428657tu2n08duz
Message-ID: <tencent_B13DB7F6C0023C46157250A524966F326A09@qq.com>
X-QQ-XMAILINFO: N1rJBQiDRgEyuI+t+UbeNj+Wm8g6/mII93pNgmgQXgZB0grYJnsuHkWW150X/k
 21GnTcWuJzWLUqL8jZqdpOxpfpF6FU1hvRJVCLIRev+ZCgBZ26meJNtlueLs2atXChSz/wu8Uhdi
 1zfLBk6z/TKYpUs1BTpNJ1q8BtuzYOcupt1BvWYF0xFIE0W1XZoFXgXmqSzaRPNrRwfPnR7Cj0AX
 49UJtPqoxp06Y2YAPp48Dk13TNOqGe3QfnSFpjkkiQuALxDjCs4xkJpnEFt6opK4+dFlKDjJTg4n
 /BciY+2ggHBHYTJ+3G6yzl7p/a5nV12/seqZI1BWIncNZK1jWw6GTU97fUOUtmb2we2pYTQ/mS87
 eRIGzLReScHJklIuHkXJeKqya3oZ5fvn2b7hIPASKamKGLjk8/zxtufVn50zffSG7gm6+U4hfOac
 QvRW4+m9bmCD0C3kC/mdf464elnxrcVc8V7bC+ulZljbNYEjlnyaqXpHXphNAia9TV3ehVciUX88
 +hceXyGGaIcmEfX/QiI2A8YzgB2LTOk3eUT+B5o7duNc14v1rcJ5NNri37Ov9VogiuoKZJ9dqRzE
 fPUUHV9G8HRRlp6UDAnpgwPQoDD/R3uJWY+1keSOtjusyk7xHhFFYFO/ZlsrGZa6gtK9rtr73Z7X
 8Ml0ikoD+oy7XOP4TuSn9/3t6tGG4jZeIBkqktbi7D9o4v8hH2oID+uNvRiwr9UNRDLRmZtwengf
 EdswQUo0x47ZX+wdK69OoMk/KReFb8Gw1+JkptQu5nagvWa4pLPzLo/GaBB0TOwMFSZn/deSuCMN
 FbvNdS9PTFiSGWqOBWPUKT+nqoDhFl+PjL1z7FRFREk3+pxZ5hKBpwn7hERWOx0BaRjN0uamYTXv
 cz2XiaCiUgKc53/Q652LG7tOFeV0MH+ZKQJuT9CtuwrdyXITavWIJog4vreckh1kvdAnOaPYLmnL
 Ne7En2TrRiI9wYk9AaeG/mFx81ROVXo3v5v+GJMemlCHx4WzH0CBbBviykDHvckCGb+oNwyEsn1r
 8FxM0qpaL3V0OLf7Am
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH] drm/tegra: dpaux: Fix PM disable depth imbalance in
 tegra_dpaux_probe
Date: Wed,  4 Oct 2023 22:10:55 +0800
X-OQ-MSGID: <20231004141055.242982-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
 Zhang Shurong <zhang_shurong@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_enable function increases the power disable depth,
which means that we must perform a matching decrement on the error
handling path to maintain balance within the given context.
Additionally, we need to address the same issue for pm_runtime_get_sync.
We fix this by invoking pm_runtime_disable and pm_runtime_put_sync
when error returns.

Fixes: 82b81b3ec1a7 ("drm/tegra: dpaux: Implement runtime PM")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index ef02d530f78d..ae12d001a04b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -522,7 +522,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(dpaux->dev, "failed to request IRQ#%u: %d\n",
 			dpaux->irq, err);
-		return err;
+		goto err_pm_disable;
 	}
 
 	disable_irq(dpaux->irq);
@@ -542,7 +542,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	 */
 	err = tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
 	if (err < 0)
-		return err;
+		goto err_pm_disable;
 
 #ifdef CONFIG_GENERIC_PINCONF
 	dpaux->desc.name = dev_name(&pdev->dev);
@@ -555,7 +555,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
 	if (IS_ERR(dpaux->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
-		return PTR_ERR(dpaux->pinctrl);
+		err = PTR_ERR(dpaux->pinctrl);
+		goto err_pm_disable;
 	}
 #endif
 	/* enable and clear all interrupts */
@@ -571,10 +572,15 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	err = devm_of_dp_aux_populate_ep_devices(&dpaux->aux);
 	if (err < 0) {
 		dev_err(dpaux->dev, "failed to populate AUX bus: %d\n", err);
-		return err;
+		goto err_pm_disable;
 	}
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	return err;
 }
 
 static void tegra_dpaux_remove(struct platform_device *pdev)
-- 
2.30.2

