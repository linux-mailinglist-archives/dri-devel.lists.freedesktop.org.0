Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAB34DA1B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 00:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F036E528;
	Mon, 29 Mar 2021 22:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487816E51B;
 Mon, 29 Mar 2021 22:21:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DD8A6196E;
 Mon, 29 Mar 2021 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617056515;
 bh=CLrg/mkHgEwMzrCgt4Zvz98xos31jfskRlbZx3TLzJA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ClrPHqDf+RzoyrioFKCFHqz+QkS3NilaNMYpe1QPJdT78n7kSPO9HAn7RTVU+Sejm
 3YUoWIdpOTTBEGIJZEbuukKFjMbkQ+DYgT2mWWn7x+Eyikea0hjD7bYI7iSC7NoGwu
 b2d3XJ4L2J9g8cA1mwQEblDEElI1U09Sjys8n74ZopeoDn4G1mzYfodi1cch0hyTkb
 TPjhRhcdiss5Y0pFFTceCW6SHVlHsz2GnIui6bQ/wwqmGW1sN4jeHhpp3GWhsd8usk
 MuiJWGPmBYEV2Q/hJxEoksdPAW5KwXowqukY7jaA7dUaT3klwP+keMFBtmyCwCf/9H
 +4R++lZMteuhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 17/38] drm/msm/adreno: a5xx_power: Don't apply
 A540 lm_setup to other GPUs
Date: Mon, 29 Mar 2021 18:21:12 -0400
Message-Id: <20210329222133.2382393-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222133.2382393-1-sashal@kernel.org>
References: <20210329222133.2382393-1-sashal@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

[ Upstream commit 4a9d36b0610aa7034340e976652e5b43320dd7c5 ]

While passing the A530-specific lm_setup func to A530 and A540
to !A530 was fine back when only these two were supported, it
certainly is not a good idea to send A540 specifics to smaller
GPUs like A508 and friends.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index f176a6f3eff6..e58670a61df4 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -304,7 +304,7 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	/* Set up the limits management */
 	if (adreno_is_a530(adreno_gpu))
 		a530_lm_setup(gpu);
-	else
+	else if (adreno_is_a540(adreno_gpu))
 		a540_lm_setup(gpu);
 
 	/* Set up SP/TP power collpase */
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
