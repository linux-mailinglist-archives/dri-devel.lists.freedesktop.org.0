Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F050450C61
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 18:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1966EE91;
	Mon, 15 Nov 2021 17:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A906EE90;
 Mon, 15 Nov 2021 17:35:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D34363338;
 Mon, 15 Nov 2021 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636997706;
 bh=InDIuwgQh4vUsiFge5+CnfWvrotgyR5Ayivqc4GkCt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DiuQ5JUgwrNcoygA/Mvy2oyNTYrHy4y3xQz8HKly4EpRw9FtxFtJV1AiAmCHL/X4/
 mF2bCyQc0hlTXOdR5h4uYr6ul5o40E/uSxGPQv+qdBshRReaa+OW23e7RGE4bkpRTd
 EUzYXpM8KiSvQw4EquUbqnSM/jMuqFI1tffQC/WA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 218/575] drm/msm: prevent NULL dereference in
 msm_gpu_crashstate_capture()
Date: Mon, 15 Nov 2021 17:59:03 +0100
Message-Id: <20211115165351.254216719@linuxfoundation.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115165343.579890274@linuxfoundation.org>
References: <20211115165343.579890274@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tim Gardner <tim.gardner@canonical.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tim Gardner <tim.gardner@canonical.com>

[ Upstream commit b220c154832c5cd0df34cbcbcc19d7135c16e823 ]

Coverity complains of a possible NULL dereference:

CID 120718 (#1 of 1): Dereference null return value (NULL_RETURNS)
23. dereference: Dereferencing a pointer that might be NULL state->bos when
    calling msm_gpu_crashstate_get_bo. [show details]
301                        msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
302                                submit->bos[i].iova, submit->bos[i].flags);

Fix this by employing the same state->bos NULL check as is used in the next
for loop.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20210929162554.14295-1-tim.gardner@canonical.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 55d16489d0f3f..90c26da109026 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -376,7 +376,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
-		for (i = 0; i < submit->nr_bos; i++) {
+		for (i = 0; state->bos && i < submit->nr_bos; i++) {
 			if (should_dump(submit, i)) {
 				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
 					submit->bos[i].iova, submit->bos[i].flags);
-- 
2.33.0



