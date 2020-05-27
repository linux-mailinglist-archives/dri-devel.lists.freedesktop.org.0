Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C51E4ECC
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 22:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D3A6E3BC;
	Wed, 27 May 2020 20:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA096E3BC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 20:05:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF9D42089D;
 Wed, 27 May 2020 20:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590609950;
 bh=N1nKAU4vjXzrN3ZCzfQIK8tGr2UNnnDVh5ijat7Jixc=;
 h=From:To:Cc:Subject:Date:From;
 b=vSBjwSbCJvKlikusm/wmEr/7TTDzTbgl52W4bOlziIe35z6bmG7aVvt16cX4vA3Ds
 JawzsuArKpqNtEmfpTUHEY4PpJ0UflU2koaEGTxsAfJy7ykbE1JLOiYLsX0PVK6ntO
 MBQLohmfCYcFetFH5Zo07tt1jDsbH52VrZ740kqc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/panfrost: Reduce the amount of logs on deferred probe
Date: Wed, 27 May 2020 22:05:44 +0200
Message-Id: <20200527200544.7849-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no point to print deferred probe (and its failures to get
resources) as an error.  Also there is no need to print regulator errors
twice.

In case of multiple probe tries this would pollute the dmesg.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Steven Price <steven.price@arm.com>

---

Changes since v2:
1. Rebase
2. Add Steven's review

Changes since v1:
1. Remove second error message from calling panfrost_regulator_init()
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 8136babd3ba9..b172087eee6a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -101,7 +101,9 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 				      pfdev->comp->num_supplies,
 				      pfdev->regulators);
 	if (ret < 0) {
-		dev_err(pfdev->dev, "failed to get regulators: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(pfdev->dev, "failed to get regulators: %d\n",
+				ret);
 		return ret;
 	}
 
@@ -213,10 +215,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	}
 
 	err = panfrost_regulator_init(pfdev);
-	if (err) {
-		dev_err(pfdev->dev, "regulator init failed %d\n", err);
+	if (err)
 		goto err_out0;
-	}
 
 	err = panfrost_reset_init(pfdev);
 	if (err) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
