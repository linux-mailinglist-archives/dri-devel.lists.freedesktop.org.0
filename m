Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361E176B2A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 03:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571016E93D;
	Tue,  3 Mar 2020 02:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E9B6E923;
 Tue,  3 Mar 2020 02:49:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BB5224673;
 Tue,  3 Mar 2020 02:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203741;
 bh=vHRDbj6UVOHRSQWFOnKdMq/CIfcCsdWrXBioM9JlNZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ICBovOdYJM/cl003HYhv3qdKTXxtlfCSqcfcUUSB9bVNCjdnQICs3HfQNNBNUB582
 x5DBlWNhEPe0kojT2pD5z3PtL8/wDKs5XikuhGAJ/rA/vsf1VkvdzW7h9nKl0MBqmF
 rhrE13+jCU/F6A3IxlchG0dtsjbCmii7PBfKu4cE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 08/32] drm/msm/mdp5: rate limit pp done timeout
 warnings
Date: Mon,  2 Mar 2020 21:48:27 -0500
Message-Id: <20200303024851.10054-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024851.10054-1-sashal@kernel.org>
References: <20200303024851.10054-1-sashal@kernel.org>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brian Masney <masneyb@onstation.org>

[ Upstream commit ef8c9809acb0805c991bba8bdd4749fc46d44a98 ]

Add rate limiting of the 'pp done time out' warnings since these
warnings can quickly fill the dmesg buffer.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index b1da9ce543790..aa28a43ff842c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1118,8 +1118,8 @@ static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 	ret = wait_for_completion_timeout(&mdp5_crtc->pp_completion,
 						msecs_to_jiffies(50));
 	if (ret == 0)
-		dev_warn(dev->dev, "pp done time out, lm=%d\n",
-			 mdp5_cstate->pipeline.mixer->lm);
+		dev_warn_ratelimited(dev->dev, "pp done time out, lm=%d\n",
+				     mdp5_cstate->pipeline.mixer->lm);
 }
 
 static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
