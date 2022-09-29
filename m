Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B465EF198
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 11:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E05C10E545;
	Thu, 29 Sep 2022 09:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C93E10E544;
 Thu, 29 Sep 2022 09:14:17 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MdSHg3SyjzWh65;
 Thu, 29 Sep 2022 17:10:07 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 17:14:14 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 17:14:14 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH -next] drm/msm/msm_gem_shrinker: fix compile error in
 can_block()
Date: Thu, 29 Sep 2022 17:30:22 +0800
Message-ID: <20220929093022.2428520-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I got the compile error:

  drivers/gpu/drm/msm/msm_gem_shrinker.c: In function ‘can_block’:
  drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: error: ‘__GFP_ATOMIC’ undeclared (first use in this function); did you mean ‘GFP_ATOMIC’?
    if (sc->gfp_mask & __GFP_ATOMIC)
                       ^~~~~~~~~~~~
                       GFP_ATOMIC
  drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: note: each undeclared identifier is reported only once for each function it appears in

__GFP_ATOMIC is dropped by commit 6708fe6bec50 ("mm: discard __GFP_ATOMIC").
Use __GFP_HIGH instead.

Fixes: 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 58e0513be5f4..6a0de6cdb82b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -26,7 +26,7 @@ static bool can_swap(void)
 
 static bool can_block(struct shrink_control *sc)
 {
-	if (sc->gfp_mask & __GFP_ATOMIC)
+	if (sc->gfp_mask & __GFP_HIGH)
 		return false;
 	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
 }
-- 
2.25.1

