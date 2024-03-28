Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B778901E7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E01112459;
	Thu, 28 Mar 2024 14:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KPV5jSOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C60112459;
 Thu, 28 Mar 2024 14:35:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F1166178A;
 Thu, 28 Mar 2024 14:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75326C433C7;
 Thu, 28 Mar 2024 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711636523;
 bh=0lXhQOQpoYqkSCQXugAMNauSxAI684zw2Aqn6FW8NFE=;
 h=From:Subject:Date:To:Cc:From;
 b=KPV5jSOIpt8SUFjNWiKGn948ySEOZubixRZ1Jkn2WIY/2pJWREoYxbM80UZZkQmud
 SrKGro+jb4y68zd+ZaCF/Lp/CEjucM1RdSR0N21Sn6M7cx5R4D4CVU1nRhsreU/LGR
 9KKZdiFsoc8TrLFx5YuXICad+tLrs5TMzEmd5rTPPSh4BlSFuS4qF0K4LlRsnbE/n6
 JR0fA1F9nzoIkM+ppfHrZI7XSoB4MRN7l2xRY9saJfNFrjKqjM3xZv+05HDo36ADiS
 /b5wf4cGPqJaUfkVoHTE6SaxmvK5rFIK8cIBt5GU0aitl/WIJSiY21lFVkWjazuayw
 lqk/sw7E7+YQQ==
From: Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2 0/6] drm/msm/dp: Spring cleaning
Date: Thu, 28 Mar 2024 07:39:59 -0700
Message-Id: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECBBWYC/13MQQ6CMBCF4auQWTumFCnqynsYFmWYyiRSsBWiI
 dzdSuLG5f+S9y0QOQhHOGcLBJ4lyuBT6F0G1Fl/Y5Q2NWilD6rQBfaxx3ZEurP104ju2NhCO6N
 dc4J0GgM7eW3gtU7dSXwO4b35c/5df5T5p+YcFXJVlWVpmJjU5TEJiac9DT3U67p+AIWWIZCuA
 AAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=0lXhQOQpoYqkSCQXugAMNauSxAI684zw2Aqn6FW8NFE=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmBYFIOvy88e8J13Nl7k/+jUc5dtLmVt8MyH5Zw
 nHo85Qsxg+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgWBSBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXKABAA3BDnwcmFQEfeLQwxRG7WcMxVVKQYcI0wZgDqvfo
 gqwtHU6ZvGoX8k98TwtSz+k5HjniL59pO67rZNC5FIkwx8ZPGHftqZ3l4JKYIn4WpSvWeAPPI2T
 UD388AgjI549rpCxpYoSlKSy0cKHcCzgM3+nPBzDlof6MxP0YV9TbWgnpkVyxMDqdIhILDjWZQh
 Vzt/B0ZljpBwdnzIFQp37AfHzzZ7FgSbTH7pOFYt746/s+uKzfF9RwWZj/l5azOb1K2IFXZrPh6
 iW30ldLNtGy6w1DbtJgiv0ax6bEqkLYOUxR7IRPxK6/ZquiUN/gIzZibiWLpliNU+UTA5WaxaRy
 oIVwKlK3dOTIM7tjzrHEy5IMpRtQ3W0s4tYQM38r4gv1ToknVrs6RneeBhYDLi1cLALy7Uyz3f6
 lpi68gBImWJULRHJMRr5gOqiAz6QlOJZEMRDvrm55PIiFhQSu9UHs2dRBXzt+NX86PsrpWBNKqL
 LkQBROy3KLb+t3brzuR9kI3L++vYbJIMq2wTbxZwQRNkNpXgFqs7hyBYU7xZz2Kp4VpEB8g/FYw
 bPvjz63ph/ynUY2lKde2vT79yqVglmav0jWlfnMe2zwci2jbAcgxYatYx9g/OthkGqPyAA6i8Sf
 Is+VfWqfuA9Je4zFvFmA5nJbandFFi4crcqEraQbyx/U=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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

Spring is in the air, clean out some dust that has accumulated in the
Qualcomm DP driver.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Changes in v2:
- Merge dp_debug_get() and dp_debug_init()
- Link to v1: https://lore.kernel.org/r/20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com

---
Bjorn Andersson (6):
      drm/msm/dp: Drop unused dp_debug struct
      drm/msm/dp: Removed fixed nvid "support"
      drm/msm/dp: Remove unused defines and members
      drm/msm/dp: Use function arguments for aux writes
      drm/msm/dp: Use function arguments for timing configuration
      drm/msm/dp: Use function arguments for audio operations

 drivers/gpu/drm/msm/dp/dp_audio.c   | 25 +++------------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  9 ++----
 drivers/gpu/drm/msm/dp/dp_catalog.c | 64 ++++++++++++++-----------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 49 +++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 17 +---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c   | 59 +++++++++++-----------------------
 drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++---------------
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 --
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 --
 drivers/gpu/drm/msm/dp/dp_link.c    |  4 ---
 drivers/gpu/drm/msm/dp/dp_link.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 14 +++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 --
 15 files changed, 88 insertions(+), 216 deletions(-)
---
base-commit: 084c8e315db34b59d38d06e684b1a0dd07d30287
change-id: 20240323-msm-dp-cleanup-f8ba32f62fb9

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>

