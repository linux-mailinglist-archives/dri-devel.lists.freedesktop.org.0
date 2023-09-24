Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EC7AC6CD
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 08:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04789E33;
	Sun, 24 Sep 2023 06:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 911 seconds by postgrey-1.36 at gabe;
 Sun, 24 Sep 2023 06:32:11 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9EFF89E33;
 Sun, 24 Sep 2023 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=T8DBtTZL75Mkz7Nv4P
 /oNxr1qOjt1z3TeK2i1xDdYI8=; b=NiAj93BWeLBhKXpox43EwvI04pW5hB324y
 ooBVzKAfCP9sS0+qdr5hK+cOFZA19HAnICHSbz31+kjzJ0QsLb7Hgi2RTr90CM3w
 bqmCd6TGE4D9FoFHuDmoP/f3dUEuT9P+4xS8f0HYN5SS+9+VLYHsNyO5LUqxggbQ
 mflOyunLY=
Received: from localhost.localdomain (unknown [223.104.131.178])
 by zwqz-smtp-mta-g3-0 (Coremail) with SMTP id _____wCHh4lM1A9lzKu9Cw--.59075S2;
 Sun, 24 Sep 2023 14:16:46 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: airlied@gmail.com
Subject: [PATCH] drm/i915/gt: Add error handling in intel_timeline_pin()
Date: Sun, 24 Sep 2023 14:16:32 +0800
Message-Id: <20230924061632.13665-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCHh4lM1A9lzKu9Cw--.59075S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWxZF4rKF1kXr15KF43trb_yoWDGFX_Gr
 18Ary7XFZrAF929347uw43ZFySya1DuFyrAr1rKFy3A3y2yr4qgas3urW5Xr15Aa43Jay7
 AanYqFn5Ary7JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUX4SDUUUUU==
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiGBP0glv2oAxUAwAAsr
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

