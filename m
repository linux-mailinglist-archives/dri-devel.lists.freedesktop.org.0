Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4E5E9DBE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D07C10E374;
	Mon, 26 Sep 2022 09:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 609 seconds by postgrey-1.36 at gabe;
 Mon, 26 Sep 2022 09:34:59 UTC
Received: from mail.nfschina.com (unknown [124.16.136.209])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A72510E3B5;
 Mon, 26 Sep 2022 09:34:59 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id F2DCF1E80D99;
 Mon, 26 Sep 2022 17:20:46 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtFvrhUFBcKz; Mon, 26 Sep 2022 17:20:44 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: liqiong@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id AC4901E80D96;
 Mon, 26 Sep 2022 17:20:43 +0800 (CST)
From: Li Qiong <liqiong@nfschina.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/gem: Use size_add() against integer overflow
Date: Mon, 26 Sep 2022 17:23:15 +0800
Message-Id: <20220926092315.17193-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Yu Zhe <yuzhe@nfschina.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Li Qiong <liqiong@nfschina.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"struct_size() + n" may cause a integer overflow,
use size_add() to handle it.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c9e4aeb14f4a..3dec87e46e50 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,8 +30,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	uint64_t sz;
 	int ret;
 
-	sz = struct_size(submit, bos, nr_bos) +
-			((u64)nr_cmds * sizeof(submit->cmd[0]));
+	sz = size_add(struct_size(submit, bos, nr_bos),
+			((u64)nr_cmds * sizeof(submit->cmd[0])));
 
 	if (sz > SIZE_MAX)
 		return ERR_PTR(-ENOMEM);
-- 
2.11.0

