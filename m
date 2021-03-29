Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5834DA77
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 00:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0C26E527;
	Mon, 29 Mar 2021 22:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726E66E525;
 Mon, 29 Mar 2021 22:24:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DFC1619D0;
 Mon, 29 Mar 2021 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617056648;
 bh=mtXCzZmAxSn69gCVvkhOZSDQfn1Lh6acPo4rUD0TvsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P/3t1W65WuQzB70KHWJGJMonD+RjdsJ2iVQ9l0BD05MU9HUnx0ZrY3dhM49t8qbf9
 p8YQQRiK5E/Kub/KHgWp3fUsgDPNY9dkROOasHPgzfNlC7DSqJMcDjzthjVJCGhgOP
 zBl3wCt9ljbtwBjjpIBP8byeV2fh9fhGcGRXgHCQabQ2eDuUuK+jdoc6Y8IIO/Wg4i
 t3OOTjTV0Kt9+nMlpaY8qbLvbJSEBhNUS8BOSTtGbIAsT9lBr0bYuKFUcqWyj1Emeq
 BddQgOgSCJQ2xbyyMwKBilqTXQ4eWWrQ9eB830PW8dalmi1N6hCHlXq86X8UgXdqe1
 4IbDxj61K0FGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 05/10] drm/msm: Ratelimit invalid-fence message
Date: Mon, 29 Mar 2021 18:23:56 -0400
Message-Id: <20210329222401.2383930-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222401.2383930-1-sashal@kernel.org>
References: <20210329222401.2383930-1-sashal@kernel.org>
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
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 7ad48d27a2846bfda29214fb454d001c3e02b9e7 ]

We have seen a couple cases where low memory situations cause something
bad to happen, followed by a flood of these messages obscuring the root
cause.  Lets ratelimit the dmesg spam so that next time it happens we
don't lose the kernel traces leading up to this.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index a9b9b1c95a2e..9dbd17be51f7 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -56,7 +56,7 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
 	int ret;
 
 	if (fence > fctx->last_fence) {
-		DRM_ERROR("%s: waiting on invalid fence: %u (of %u)\n",
+		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
 				fctx->name, fence, fctx->last_fence);
 		return -EINVAL;
 	}
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
