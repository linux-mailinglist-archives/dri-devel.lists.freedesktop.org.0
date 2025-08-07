Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B01B1D32D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC1110E0C8;
	Thu,  7 Aug 2025 07:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJce7DAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9EE10E0C8;
 Thu,  7 Aug 2025 07:20:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADB0F5C6247;
 Thu,  7 Aug 2025 07:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D271C4CEEB;
 Thu,  7 Aug 2025 07:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754551223;
 bh=QAymJJ06cre5xL6TD3wl31zS7/sMx5/eUajrkA/4UAI=;
 h=From:To:Cc:Subject:Date:From;
 b=pJce7DAc80rSzLxSCt141wdl8kSmtmRpLIv3RS4HCQ8+tcgchWjbo/HJh/RU9sa2u
 n1ZFXW8UNUGbTVpZpfmXhaNSioyP8FziwRp9aeCvYVq4dCdx+eBBN6sOKI8LuFvjR3
 r7nqSC/NaRZFMR868vdH1UuVjqCCPmqogzUjrJ3XhPg3XlfIrEQu6HOhFQVRbqDt4C
 pwl2xDwy5bSf8L4oJCkZJaF4KFtJZejxc6IYOtSwc0sYmyXMSYljB0jK0TDcWAnKvp
 YwgtNpvdkcrJfVkJxINPQsMa0iTSHW7vvX3z+lw6iRxiY6PnLVrgI2+gXKHi/n5luH
 BCGxnY0daRUbA==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Date: Thu,  7 Aug 2025 09:19:48 +0200
Message-Id: <20250807072016.4109051-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

clang-21 points out a variable that is conditionally initialized
but then dereferenced:

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
 1138 |         if (plane_state->crtc)
      |             ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1142:58: note: uninitialized use occurs here
 1142 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
      |                                                                 ^~~~~~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:2: note: remove the 'if' if its condition is always true
 1138 |         if (plane_state->crtc)
      |         ^~~~~~~~~~~~~~~~~~~~~~
 1139 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1132:35: note: initialize the variable 'crtc_state' to silence this warning
 1132 |         struct drm_crtc_state *crtc_state;
      |                                          ^
      |                                           = NULL

The bug is real, but the suggestion from clang to set it to NULL is
unfortunately just as harmful as dereferencing a NULL pointer is little
better than uninitialized data.

Change the function to return an error in this case.

Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27..4987f2f2fee0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1135,10 +1135,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (IS_ERR(plane_state))
 		return PTR_ERR(plane_state);
 
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
+	if (!plane_state->crtc)
+		return -ENXIO;
 
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
 	if (ret)
 		return ret;
-- 
2.39.5

