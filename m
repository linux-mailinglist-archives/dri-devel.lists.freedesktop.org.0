Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A2218BA0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 17:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027C86E1E6;
	Wed,  8 Jul 2020 15:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1119F6E1E6;
 Wed,  8 Jul 2020 15:41:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1802F208B6;
 Wed,  8 Jul 2020 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594222918;
 bh=IGi0Xef7jbHhMsYfOprqPDNw4VFPWt/swz7U6H8LxOg=;
 h=From:To:Cc:Subject:Date:From;
 b=azY+tD3Lw19sM10hAtYzHfv0jwN8m83cZjemnKnBkuvvujKX39w2Mxc9FLI/F03Sr
 php+yLZ64zrX+/B3Dy4HM1KauAMqmYTI6kn02jjUgFYYj0cmp8e5g6oGwhQRaJLPAC
 K0xGj2BV/dtK0xhjKNu8FsF3Ro0lO5e1W4RS8a/4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/8] drm/msm: fix potential memleak in error
 branch
Date: Wed,  8 Jul 2020 11:41:49 -0400
Message-Id: <20200708154157.3200116-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
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
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bernard Zhao <bernard@vivo.com>

[ Upstream commit 177d3819633cd520e3f95df541a04644aab4c657 ]

In function msm_submitqueue_create, the queue is a local
variable, in return -EINVAL branch, queue didn`t add to ctx`s
list yet, and also didn`t kfree, this maybe bring in potential
memleak.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
[trivial commit msg fixup]
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 5115f75b5b7f3..325da440264a3 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -78,8 +78,10 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	queue->flags = flags;
 
 	if (priv->gpu) {
-		if (prio >= priv->gpu->nr_rings)
+		if (prio >= priv->gpu->nr_rings) {
+			kfree(queue);
 			return -EINVAL;
+		}
 
 		queue->prio = prio;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
