Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70748AB0A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5CF10E8A2;
	Tue, 11 Jan 2022 10:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AEA10E8A2;
 Tue, 11 Jan 2022 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641895795; x=1673431795;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=gLpEFzjhbh1j/IyS3srgDmraBo4qO+gRp/VDEsiOSLI=;
 b=Lu4898CweRP8snY9AG2SaGuOz88F0+PbJtTKjHSSab4JyRw5KkCi0suo
 Ma5jVy7fIFIoUBKWk2mNoOOv6GGqxiibnb34PHgUCyVQ/JAEmeomVH15C
 vxvXgcK1QaO9Oj8quA6LbnOickck1kvWrGMSfbZXkQzA1Cff8vA0A5bGQ
 0iFcgxda6Anw2SgonBY0IHSk8OOrejDWjSIIPw96XP9gM8OC9fhDiFGtz
 A0bR4mCDoayHLJLJpjCK/IH1D4Emk2qSFfzxltPFnpxrlhNZHr7tXQMbE
 UEcReqC7hMfGsp7cIydDldB0bTQaNGzx34Qqkw+HjSTDDfjeS+ZDt29Kn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230792395"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230792395"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 02:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="762482702"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2022 02:09:48 -0800
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vkms: change vkms driver to use
 drm_writeback_connector.base pointer
Date: Tue, 11 Jan 2022 15:48:01 +0530
Message-Id: <20220111101801.28310-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111101801.28310-1-suraj.kandpal@intel.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
	arun.r.murthy@intel.com, Kandpal@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changing vkms driver to accomadate the change of
drm_writeback_connector.base to a pointer the reason for which is
explained in the Patch(drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal, Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227f555f..6de0c4213425 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -114,7 +114,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_writeback_connector *wb_conn = &output->wb_connector;
-	struct drm_connector_state *conn_state = wb_conn->base.state;
+	struct drm_connector_state *conn_state = wb_conn->base->state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 
 	if (!conn_state)
@@ -140,8 +140,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 {
 	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
 
-	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
-	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
+	vkmsdev->output.wb_connector.encoder->possible_crtcs = 1;
+	drm_connector_helper_add(wb->base, &vkms_wb_conn_helper_funcs);
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-- 
2.17.1

