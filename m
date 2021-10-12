Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B642A59A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEA46E944;
	Tue, 12 Oct 2021 13:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171ED6E944;
 Tue, 12 Oct 2021 13:25:52 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2940E40047; 
 Tue, 12 Oct 2021 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634045150;
 bh=zKVkWhJrCNRs1YQq8kD1+rhAcBYYHc1UVm4VR83IhSI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=Q6oKf1l4GDkPrJmo4hDWnxsi8yVM3/Rp8ckE2jwUqnsqWTuKUq+MXho/MgDob/1TL
 /tlmZpQWjUACcstaUvckCGTc2OtlYrylIM4bRirEd6z9eK6mk+1kfKzQIo+RkaAFMe
 P3o0+5tiH1uSrTDnvwmtcsyqI4+UJfDsB6QYmStNiEfyhURNwmOD4eAAqyK4Wzoz7Y
 vycoFb6k5AgSSd8AtZijbEfQBhVLS2248pGovjDrie/NVtq75WMpAyCDG0spOLTI7L
 mRsOF5HJvNWv16KqKjA/sUNls1++IdwLN97PuOxGdyB8TmxohDlGeCUNcvetdNwYvK
 T6/qXBWOpJL+Q==
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915: Fix dereference of pointer backup before it
 is null checked
Date: Tue, 12 Oct 2021 14:25:49 +0100
Message-Id: <20211012132549.260089-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

The assignment of pointer backup_bo dereferences pointer backup before
backup is null checked, this could lead to a null pointer dereference
issue. Fix this by only assigning backup_bo after backup has been null
checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: c56ce9565374 ("drm/i915 Implement LMEM backup and restore for suspend / resume")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 3b6d14b5c604..4ec6c557083a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -149,7 +149,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 	struct i915_gem_ttm_pm_apply *pm_apply =
 		container_of(apply, typeof(*pm_apply), base);
 	struct drm_i915_gem_object *backup = obj->ttm.backup;
-	struct ttm_buffer_object *backup_bo = i915_gem_to_ttm(backup);
+	struct ttm_buffer_object *backup_bo;
 	struct ttm_operation_ctx ctx = {};
 	int err;
 
@@ -163,6 +163,8 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 	if (err)
 		return err;
 
+	backup_bo = i915_gem_to_ttm(backup);
+
 	/* Content may have been swapped. */
 	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
 	if (!err) {
-- 
2.32.0

