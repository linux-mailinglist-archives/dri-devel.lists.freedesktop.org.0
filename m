Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FA399FB4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093336E84F;
	Thu,  3 Jun 2021 11:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42F06E84F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 11:21:39 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fwjyr0GJtzWnyr;
 Thu,  3 Jun 2021 19:16:52 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 19:21:36 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 3 Jun
 2021 19:21:35 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <yukuai3@huawei.com>, <alexander.deucher@amd.com>
Subject: [PATCH] drm: fix doc warnings in drm_atomic.h
Date: Thu, 3 Jun 2021 19:30:51 +0800
Message-ID: <20210603113051.2095866-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603192238.0bbc6686@canb.auug.org.au>
References: <20210603192238.0bbc6686@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yi.zhang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add description for parameters for
for_each_new_plane_in_state_reverse to fix warnings:

include/drm/drm_atomic.h:908: warning: Function parameter or member '__state' not described in 'for_each_new_plane_in_state_reverse'
include/drm/drm_atomic.h:908: warning: Function parameter or member 'plane' not described in 'for_each_new_plane_in_state_reverse'
include/drm/drm_atomic.h:908: warning: Function parameter or member 'new_plane_state' not described in 'for_each_new_plane_in_state_reverse'
include/drm/drm_atomic.h:908: warning: Function parameter or member '__i' not described in 'for_each_new_plane_in_state_reverse'

Fixes: a6c3c37b661d ("drm/amd/display: fix gcc set but not used warning of variable 'old_plane_state'")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 include/drm/drm_atomic.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 8f1350e599eb..1701c2128a5c 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -898,6 +898,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 /**
  * for_each_new_plane_in_state_reverse - other than only tracking new state,
  * it's the same as for_each_oldnew_plane_in_state_reverse
+ * @__state: &struct drm_atomic_state pointer
+ * @plane: &struct drm_plane iteration cursor
+ * @new_plane_state: &struct drm_plane_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
  */
 #define for_each_new_plane_in_state_reverse(__state, plane, new_plane_state, __i) \
 	for ((__i) = ((__state)->dev->mode_config.num_total_plane - 1);	\
-- 
2.31.1

