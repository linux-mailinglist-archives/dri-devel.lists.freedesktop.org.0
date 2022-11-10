Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923CF623EEE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6110E6AD;
	Thu, 10 Nov 2022 09:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4A110E6AD;
 Thu, 10 Nov 2022 09:44:53 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N7H0r6xXZzJncC;
 Thu, 10 Nov 2022 17:41:48 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:44:50 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
 <mihail.atanassov@arm.com>, <brian.starkey@arm.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>, <thierry.reding@gmail.com>, 
 <sam@ravnborg.org>, <emma@anholt.net>, <mripard@kernel.org>,
 <vladimir.lypak@gmail.com>, <quic_akhilpo@quicinc.com>,
 <dianders@chromium.org>, <cuigaosheng1@huawei.com>, <olvaffe@gmail.com>,
 <angelogioacchino.delregno@somainline.org>, <marijn.suijten@somainline.org>
Subject: [PATCH 5/5] drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms
Date: Thu, 10 Nov 2022 17:44:45 +0800
Message-ID: <20221110094445.2930509-6-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_get_new_private_obj_state() function returns NULL
on error path, drm_atomic_get_old_private_obj_state() function
returns NULL on error path, too, they does not return error pointers.

By the way, vc4_hvs_get_new/old_global_state() should return
ERR_PTR(-EINVAL), otherwise there will be null-ptr-defer issue,
such as follows:

In function vc4_atomic_commit_tail():
  |-- old_hvs_state = vc4_hvs_get_old_global_state(state); <-- return NULL
  |-- if (WARN_ON(IS_ERR(old_hvs_state))) <-- no return
  |-- unsigned long state_rate = max(old_hvs_state->core_clock_rate,
	new_hvs_state->core_clock_rate); <-- null-ptr-defer

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 5c97642ed66a..8fbeecdf2ec4 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -197,8 +197,8 @@ vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_new_private_obj_state(state, &vc4->hvs_channels);
-	if (IS_ERR(priv_state))
-		return ERR_CAST(priv_state);
+	if (!priv_state)
+		return ERR_PTR(-EINVAL);
 
 	return to_vc4_hvs_state(priv_state);
 }
@@ -210,8 +210,8 @@ vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_old_private_obj_state(state, &vc4->hvs_channels);
-	if (IS_ERR(priv_state))
-		return ERR_CAST(priv_state);
+	if (!priv_state)
+		return ERR_PTR(-EINVAL);
 
 	return to_vc4_hvs_state(priv_state);
 }
-- 
2.25.1

