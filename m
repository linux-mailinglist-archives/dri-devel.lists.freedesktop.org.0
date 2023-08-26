Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F627789C13
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 10:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A66F10E011;
	Sun, 27 Aug 2023 08:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 779 seconds by postgrey-1.36 at gabe;
 Sat, 26 Aug 2023 10:28:34 UTC
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com
 [203.205.221.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE210E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693045709;
 bh=E32l48gh74u0wKPcn5axJaB36BSlQqywiLukbAdXIo0=;
 h=From:To:Cc:Subject:Date;
 b=RPtg03lhGW1Os0SWcIdelvT7bxIj4E1jEzo+U44JZGPrLNqNlMst34oZZpYJvxNiC
 PBdm5GuUzfzXr5l0l6zWuuRbCeLSO1KYNVvczuG07B5N2yQGX6DG/xS4ZsPvJYE37C
 GXywJ4kMhYbD1bf2hBqexoP2sVq2Z42wQUAyEB8k=
Received: from KernelDevBox.byted.org ([180.184.49.4])
 by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
 id B702291; Sat, 26 Aug 2023 18:02:55 +0800
X-QQ-mid: xmsmtpt1693044175tknomh8m9
Message-ID: <tencent_73FCC06A3D1C14EE5175253C6FB46A07B709@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTZp3i9LCvKYDbI9UtNovodc1zIJP/gvVV0C9AiP/tkwAKzErV5Z
 875prIgdlkbQpLlKuuDWJuSxiNTe9ZpBCF6bvFBCPFOYAQEqYccrDWb4p4UIUKm2SJbS2L7BCwaT
 aoVnREjC45OyNfRG5LdTdi2S6Sj8kgyNIvuq5tdodzK1sZv+ovLK1ct+MfiqkEqQZ2F5LSgZPe7P
 VRSTirdwNI0Xr6j6ZCEK3iE0U4PUChNDVVd26cGBOdWBh6/kjJG/URi+TIt57uVcwSg1fwZ5KGRq
 zg4881cK67nDMhzeVGvxsq/sWPLIAv5zUrO+Zu/h4Q+xcAKy7FCBuJaBEtQux0Y2MYCCQcZ+71CO
 49nIUnRSRUsASYy9w0tb78mXeHeSiSe75vFhx63/JDOhGY2t/jvAFioCZgg85EKQsZvcPplEKQGX
 Dd9YGOmaibSR3xNvjFYq1mfq2X23vAp8SrMxlDvVP2LCc/wrN7R4Zb9V6BEtMEYvzrF0sc6jqwlk
 C1hEvrPG1k7yblUPaW5Eafvgp5naHYNqr4ezrlcXyGHHZEMd0+rhi3CV0ewzxqm4/V6+WcIrihao
 rdoY7D4lSPlCF9YPzcXm896zLv5AXU0aNfIbLaBlW7LyKJVKeG6gLVywVx3ROtFoXEFLerSX1fCY
 NXtsngpac08po6cZhVWu8HwL33gWUOyfDP5DoOO7jZ950JRf39/DXdu/CdaT3jQykKVE2rPbXSQm
 TTBxOU0tNz4p+LL+ovIRisVZXr1qWadcmoiVegik36K3YAoZGfM0XuJLfxh//8LoRTIhYG85P9oR
 bpqqvbp+uzSRPUh9cfJXUkbbl2bVXBK+h5Gs+D/cKn3s1Ds+pB94TUjFOnF8fR3QJILE4axHRcKs
 OmWWj85kO/riG3TJQ0AyGoT/r+sboldviGFALGxtnsNJ9UA4OKrbS2ViJOBG7vHkJHsm6yE+x1im
 F8sxgLGCb1a0DMBZ82MDtEspBUhtVJ51bruqFEHr5UbCEGYe8TD2si4XQWpQizhWNDDL4OnHI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: ldewangan@nvidia.com
Subject: [PATCH] spi: tegra: Fix missing IRQ check in tegra_slink_probe()
Date: Sat, 26 Aug 2023 18:02:54 +0800
X-OQ-MSGID: <20230826100254.2197256-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Aug 2023 08:16:19 +0000
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
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 Zhang Shurong <zhang_shurong@foxmail.com>, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This func misses checking for platform_get_irq()'s call and may passes the
negative error codes to request_irq(), which takes unsigned IRQ #,
causing it to fail with -EINVAL, overriding an original error code.

Fix this by stop calling request_irq() with invalid IRQ #s.

Fixes: dc4dc3605639 ("spi: tegra: add spi driver for SLINK controller")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/spi/spi-tegra20-slink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 4d6db6182c5e..f5cd365c913a 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -1086,6 +1086,8 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	reset_control_deassert(tspi->rst);
 
 	spi_irq = platform_get_irq(pdev, 0);
+	if (spi_irq < 0)
+		return spi_irq;
 	tspi->irq = spi_irq;
 	ret = request_threaded_irq(tspi->irq, tegra_slink_isr,
 				   tegra_slink_isr_thread, IRQF_ONESHOT,
-- 
2.30.2

