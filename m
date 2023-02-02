Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15E687FA5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 15:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DD510E531;
	Thu,  2 Feb 2023 14:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B79010E517;
 Thu,  2 Feb 2023 14:13:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1C4F4CE2A97;
 Thu,  2 Feb 2023 14:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF18AC433D2;
 Thu,  2 Feb 2023 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1675347194;
 bh=1pMG7Pa76jFEvorIxfR7GamBOmkilJdNM0nQDHmdpiA=;
 h=From:To:Cc:Subject:Date:From;
 b=QwVaovFY3zDMEMHDj2Y6qrtKovByOCCSkyPSUzLpi0+ijNdTtDrc+9N4l4EoE7Htx
 NrI124W2PX4lWafSRbs+bd16YNbUChbB4X6IDMB4Fqn1AA+g825dXULjT2sWnwwg4Z
 nhZ8UuN2nUjP1/EyqNDcD7Jd17jY0c90GtPqcoVM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] i915: fix memory leak with using debugfs_lookup()
Date: Thu,  2 Feb 2023 15:13:09 +0100
Message-Id: <20230202141309.2293834-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=1pMG7Pa76jFEvorIxfR7GamBOmkilJdNM0nQDHmdpiA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMm3j3zVNZ3sfIL/45+LPg9f+1bHb/XbsPY8L1s045Q+w2q3
 rVJHO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi5mEM8/QfTqif/WPVbvUjEgJ6/j
 /DVtx3Ps6wYN6dhy57F25M+vcydiaT/MRcM7398QA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  To make things simpler, just
call debugfs_lookup_and_remove() instead which handles all of the logic
at once.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 8ae7039b3683..de675d799c7d 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -699,7 +699,7 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 
 	clear_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status);
 
-	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
+	debugfs_lookup_and_remove(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs);
 
 	kvm_page_track_unregister_notifier(vgpu->vfio_device.kvm,
 					   &vgpu->track_node);
-- 
2.39.1

