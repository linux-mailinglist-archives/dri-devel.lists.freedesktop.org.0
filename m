Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62302985A13
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5BA10E9A7;
	Wed, 25 Sep 2024 12:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmY7EVoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6BA10E9A6;
 Wed, 25 Sep 2024 12:05:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C5AE1A440ED;
 Wed, 25 Sep 2024 12:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E9EC4CEC3;
 Wed, 25 Sep 2024 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265903;
 bh=PIrSWSe1p/OzEoLjFK1fW3I3p/lUQ7HiMkPO+JrSeR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AmY7EVoeHaTWEPHgResZXTfPDdqJqzo83H9heT9qGbEFdSusL5d603ahHOniANjIf
 WLYrAl/ezmabFUfZOkZ/UX9WW3Ph4H1rC5t6dp1S9MLEfZjLqGtNrcnQByf1/iaZMp
 tLdbonFMenFGl9fwS8CygAMNEEOOUcovefwj1YRKoGhGiYPLacqnXODl9hBDynNRki
 NcLkMiaW1gLGWjTYN4Qt1AeWZO21N/pozsUeav/AMw7SX3xDMEPg12zeGOsMgKzJ3U
 MwVuibbinH4J/D8whftxBQHhKHMwyaFY6DZfDo6dOP35/IVWpoVjBjsx7tYT42KZEz
 aUrXKKXFJQeWg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Sasha Levin <sashal@kernel.org>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 121/197] drm/xe/hdcp: Check GSC structure validity
Date: Wed, 25 Sep 2024 07:52:20 -0400
Message-ID: <20240925115823.1303019-121-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit b4224f6bae3801d589f815672ec62800a1501b0d ]

Sometimes xe_gsc is not initialized when checked at HDCP capability
check. Add gsc structure check to avoid null pointer error.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-4-suraj.kandpal@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index b3d3c065dd9d8..2f935771658e6 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -39,10 +39,14 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_gt *gt = tile->media_gt;
+	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
 
-	if (!xe_uc_fw_is_enabled(&gt->uc.gsc.fw))
+	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
+		drm_dbg_kms(&xe->drm,
+			    "GSC Components not ready for HDCP2.x\n");
 		return false;
+	}
 
 	xe_pm_runtime_get(xe);
 	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC)) {
@@ -52,7 +56,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 		goto out;
 	}
 
-	if (!xe_gsc_proxy_init_done(&gt->uc.gsc))
+	if (!xe_gsc_proxy_init_done(gsc))
 		ret = false;
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
-- 
2.43.0

