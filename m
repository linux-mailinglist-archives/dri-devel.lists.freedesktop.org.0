Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE517AC5E3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 01:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E1210E064;
	Sat, 23 Sep 2023 23:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Sat, 23 Sep 2023 17:51:13 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 851EE10E071;
 Sat, 23 Sep 2023 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=T8DBtTZL75Mkz7Nv4P
 /oNxr1qOjt1z3TeK2i1xDdYI8=; b=hxg8hYPiYprkAE8xSncon7mEHsLtHDpts2
 pTqT1QE/md+heFMByQZ/Zg86rnXEGc+ld7GNMkICY5JztWS6HxIY8fiQoNy9WER5
 V9D8nH9+iiUuQlzb9aCHvQoALTPHkRUSlz9PPAduFAtUdi1+7nUBJfqCQjNv8luv
 8cVbveUzY=
Received: from localhost.localdomain (unknown [223.104.131.178])
 by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wCnfrDqIQ9luOtjBA--.52569S2;
 Sun, 24 Sep 2023 01:35:40 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: airlied@gmail.com
Subject: [PATCH] drm/i915/gt: Add error handling in intel_timeline_pin()
Date: Sun, 24 Sep 2023 01:35:25 +0800
Message-Id: <20230923173525.46759-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCnfrDqIQ9luOtjBA--.52569S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWxZF4rKF1kXr15KF43trb_yoWDGFX_Gr
 18Ary7XFZrAF929347uw43ZFySya1DuFyrAr1rKFy3A3y2yr4qgas3urW5Xr15Aa43Jay7
 AanYqFn5Ary7JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUXyZ5UUUUU==
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbibA7zgmNfuLT0vQAAsq
X-Mailman-Approved-At: Sat, 23 Sep 2023 23:32:23 +0000
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
Cc: intel-gfx@lists.freedesktop.org, liuhaoran <liuhaoran14@163.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds error-handling for the i915_active_acquire()
inside the intel_timeline_pin().

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..a2edf9233500 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -211,7 +211,11 @@ int intel_timeline_pin(struct intel_timeline *tl, struct i915_gem_ww_ctx *ww)
 	GT_TRACE(tl->gt, "timeline:%llx using HWSP offset:%x\n",
 		 tl->fence_context, tl->hwsp_offset);
 
-	i915_active_acquire(&tl->active);
+	err = i915_active_acquire(&tl->active);
+
+	if (err)
+		return err;
+
 	if (atomic_fetch_inc(&tl->pin_count)) {
 		i915_active_release(&tl->active);
 		__i915_vma_unpin(tl->hwsp_ggtt);
-- 
2.17.1

