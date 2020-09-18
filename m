Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1E26EBC0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267CF6E455;
	Fri, 18 Sep 2020 02:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831446E455
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:10:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA87923977;
 Fri, 18 Sep 2020 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395021;
 bh=MwGFtKWSGpn1CofDZXm/j7WAMuhx+zTxLN826jRE7rE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2GHW4Z9ZEmwjRHzLew4vWGt0yJNFVdDTVZKbLm8rZK5F8Hx6TkXy7zei9cmFN05Fq
 tIhGCALQ3IGq9TUlIZ3zOSnklXwX1Fyqx6IpWa7spn1ZohyeZ+RjnWZP6LNZZPrxIs
 KnUd7ZUZTsJtwOd7j3fC4hLlBWMM1OJsIocZHrCc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 115/206] drm/msm: fix leaks if initialization
 fails
Date: Thu, 17 Sep 2020 22:06:31 -0400
Message-Id: <20200918020802.2065198-115-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Pavel Machek <pavel@denx.de>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pavel Machek <pavel@denx.de>

[ Upstream commit 66be340f827554cb1c8a1ed7dea97920b4085af2 ]

We should free resources in unlikely case of allocation failure.

Signed-off-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7f45486b6650b..3ba3ae9749bec 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -495,8 +495,10 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (!dev->dma_parms) {
 		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
 					      GFP_KERNEL);
-		if (!dev->dma_parms)
-			return -ENOMEM;
+		if (!dev->dma_parms) {
+			ret = -ENOMEM;
+			goto err_msm_uninit;
+		}
 	}
 	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
