Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4CD1BF169
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994C26EB4E;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C586EEA2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:10:57 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F3C8B6D9CB7E42972048;
 Wed, 29 Apr 2020 22:10:53 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 22:10:45 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <airlied@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: remove duplicate assignment of ast_crtc_funcs member
Date: Wed, 29 Apr 2020 22:10:10 +0800
Message-ID: <20200429141010.8445-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct member 'set_config' was assigned twice:

static const struct drm_crtc_funcs ast_crtc_funcs = {
	.reset = ast_crtc_reset,
	.set_config = drm_crtc_helper_set_config,
	......
	.set_config = drm_atomic_helper_set_config,
	......
};

Since the second one is which we use now in fact, we can remove the
first one.

This fixes the following coccicheck warning:

drivers/gpu/drm/ast/ast_mode.c:932:50-51: set_config: first occurrence
line 934, second occurrence line 937

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d2ab81f9c498..7062bcd78740 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -931,7 +931,6 @@ static void ast_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 
 static const struct drm_crtc_funcs ast_crtc_funcs = {
 	.reset = ast_crtc_reset,
-	.set_config = drm_crtc_helper_set_config,
 	.gamma_set = drm_atomic_helper_legacy_gamma_set,
 	.destroy = ast_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
