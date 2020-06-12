Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F011F828B
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A616E3B2;
	Sat, 13 Jun 2020 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m17617.mail.qiye.163.com (m17617.mail.qiye.163.com
 [59.111.176.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61D56E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 05:06:45 +0000 (UTC)
Received: from njvxl5505.vivo.xyz (unknown [157.0.31.125])
 by m17617.mail.qiye.163.com (Hmail) with ESMTPA id D641E2614DE;
 Fri, 12 Jun 2020 13:06:39 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: fix potential memleak issue
Date: Fri, 12 Jun 2020 13:06:32 +0800
Message-Id: <20200612050633.3441-1-bernard@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSUIfT0tKHR4ZSUhCVkpOQkpCSENPS0tLSEhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBg6Ghw*Tzg2GQszOC0WNjA3
 PToKCh1VSlVKTkJKQkhDT0tLT01CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSUtKQzcG
X-HM-Tid: 0a72a6ec3f229375kuwsd641e2614de
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function msm_gpu_crashstate_capture maybe called for several
times, and then the state->bos is a potential memleak. Also
the state->pos maybe alloc failed, but now without any handle.
This change is to fix some potential memleak and add error
handle when alloc failed.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a22d30622306..d67a9933f3ce 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -366,8 +366,11 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			if (!should_dump(submit, submit->cmd[i].idx))
 				nr++;
 
+		kfree(state->bos);
 		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+		if (!state->bos)
+			return;
 
 		for (i = 0; i < submit->nr_bos; i++) {
 			if (should_dump(submit, i)) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
