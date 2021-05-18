Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6898387D31
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B5A6EC1B;
	Tue, 18 May 2021 16:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A426EC19;
 Tue, 18 May 2021 16:17:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 927386100C;
 Tue, 18 May 2021 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621354631;
 bh=OUsEAuCJMnPfB6TDhzwq4OHHwYb6CzyGEBig+zjv1tE=;
 h=From:To:Cc:Subject:Date:From;
 b=SvPHCVzpjHNhIg1cCxFY8L+TQs/usJJLmXSrbf6L7y+eHCvxGH8k/KYlckxtELqKC
 vywkXvVCHAHQWOJOJ39CMiJGHTrQy0O5oN6+IyBOznk1TQyBPSj8z6j/0CcemLgWsH
 O3+ESNRlejAdqgAPwK9TYGl6SquQhAgfPxn824qA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: remove local storage of debugfs file
Date: Tue, 18 May 2021 18:17:05 +0200
Message-Id: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to keep the dentry around for the debugfs kvmgt cache
file, as we can just look it up when we want to remove it later on.
Simplify the structure by removing the dentry and relying on debugfs
to find the dentry to remove when we want to.

By doing this change, we remove the last in-kernel user that was storing
the result of debugfs_create_long(), so that api can be cleaned up.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 65ff43cfc0f7..433c2a448f2d 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -88,6 +88,7 @@ struct kvmgt_pgfn {
 	struct hlist_node hnode;
 };
 
+#define KVMGT_DEBUGFS_FILENAME "kvmgt_nr_cache_entries"
 struct kvmgt_guest_info {
 	struct kvm *kvm;
 	struct intel_vgpu *vgpu;
@@ -95,7 +96,6 @@ struct kvmgt_guest_info {
 #define NR_BKT (1 << 18)
 	struct hlist_head ptable[NR_BKT];
 #undef NR_BKT
-	struct dentry *debugfs_cache_entries;
 };
 
 struct gvt_dma {
@@ -1843,16 +1843,15 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	info->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
 	kvm_page_track_register_notifier(kvm, &info->track_node);
 
-	info->debugfs_cache_entries = debugfs_create_ulong(
-						"kvmgt_nr_cache_entries",
-						0444, vgpu->debugfs,
-						&vdev->nr_cache_entries);
+	debugfs_create_ulong(KVMGT_DEBUGFS_FILENAME, 0444, vgpu->debugfs,
+			     &vdev->nr_cache_entries);
 	return 0;
 }
 
 static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
 {
-	debugfs_remove(info->debugfs_cache_entries);
+	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME,
+				      info->vgpu->debugfs));
 
 	kvm_page_track_unregister_notifier(info->kvm, &info->track_node);
 	kvm_put_kvm(info->kvm);
-- 
2.31.1

