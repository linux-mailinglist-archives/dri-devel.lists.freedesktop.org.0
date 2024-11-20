Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3699D3C78
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 14:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C0710E2BC;
	Wed, 20 Nov 2024 13:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="hl/n0tBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2706 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2024 13:19:08 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 615FF10E2BC;
 Wed, 20 Nov 2024 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=37yF9
 G6eKri9JMrWKD22xa5kGkbLDMghqYrX4j4s5F0=; b=hl/n0tBomqkwCcNr+GqBO
 D6JRTysO7jOZ0YKoDRwTWRNXGygk5Qu/vlw0wYf3AG7CS2Fd434MMWLsGH5UI3b+
 1sEAdzLLRBlQhNxIvvAM7TSgZSCU3uOTI1XMFY7mkgIvHHdhlrdULU3IC14d/d9S
 ExJSvxd0ogcDUCmPAZFnIo=
Received: from localhost.localdomain (unknown [183.14.215.87])
 by gzsmtp4 (Coremail) with SMTP id PygvCgCHzJYz1z1nW++6EA--.42732S2;
 Wed, 20 Nov 2024 20:33:55 +0800 (CST)
From: Zhang He <zhanghe9702@163.com>
To: rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zhang He <zhanghe9702@163.com>
Subject: [PATCH] drm/i915: Fixed an typo in i915_gem_gtt.c
Date: Wed, 20 Nov 2024 20:32:45 +0800
Message-ID: <20241120123245.71101-1-zhanghe9702@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCHzJYz1z1nW++6EA--.42732S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4xAw4UAF1rWw4DuFyUKFg_yoWDAwcEka
 y7ZryxG3yjyFsY9FZ8Cw4avF9Yyas5ur48Cw18tas3Jr9rAr1DXr97ZryUJr4xGFW5XF1D
 X3WkXF9Iyr9rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_a9a3UUUUU==
X-Originating-IP: [183.14.215.87]
X-CM-SenderInfo: x2kd0wlkhzliqs6rljoofrz/1tbiWwSdamc91sYG0gAAs2
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

in function `i915_gem_gtt_reserve` @node comment,
i915_vma has no `mode` member, `i915_vma.node` is the correct name

Signed-off-by: Zhang He <zhanghe9702@163.com>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index a9662cc6ed1e..25295eb626dc 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -71,7 +71,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
  * i915_gem_gtt_reserve - reserve a node in an address_space (GTT)
  * @vm: the &struct i915_address_space
  * @ww: An optional struct i915_gem_ww_ctx.
- * @node: the &struct drm_mm_node (typically i915_vma.mode)
+ * @node: the &struct drm_mm_node (typically i915_vma.node)
  * @size: how much space to allocate inside the GTT,
  *        must be #I915_GTT_PAGE_SIZE aligned
  * @offset: where to insert inside the GTT,
-- 
2.43.0

