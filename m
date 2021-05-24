Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D99638E761
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51B96E5C8;
	Mon, 24 May 2021 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECF36E5B0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:24:59 +0000 (UTC)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FpdDY62gmzmWYm;
 Mon, 24 May 2021 21:22:37 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 21:24:57 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 21:24:56 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
Date: Mon, 24 May 2021 13:35:50 +0000
Message-ID: <20210524133550.2363884-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
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
Cc: linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Hulk
 Robot <hulkci@huawei.com>, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/media/tegra-vde/vde.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index e025b69776f2..321d14ba2e56 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	 * power-cycle it in order to put hardware into a predictable lower
 	 * power state.
 	 */
-	if (pm_runtime_resume_and_get(dev) < 0)
+	err = pm_runtime_resume_and_get(dev);
+	if (err < 0)
 		goto err_pm_runtime;
 
 	pm_runtime_put(dev);

