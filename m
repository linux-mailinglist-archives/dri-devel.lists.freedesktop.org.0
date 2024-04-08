Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B585A89CC35
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 21:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36822112809;
	Mon,  8 Apr 2024 19:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfAX9tTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B59010F874;
 Mon,  8 Apr 2024 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712603178; x=1744139178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFba2qgmd8y+SWGIDFsnPJlx7DAyfbeTQu2+viNDZnE=;
 b=EfAX9tTs5ywimcyOxwwgT52297HACqKEwZzlD8bD4jbkl8kgxroAnPxe
 il16ixVpG79EtQ2sg1RGTLG3WdTCfD/SGQ6UR9ROYYkxUgkklZ5+fRolM
 WsqZV972jeOZh5YTY7QhHY/tdxpStvcSnpxzyUz4P7xOtXwYGKXBS2XdJ
 PJ6bzPVyjudl+hjhEtR+CnKZdNSn3ttg+tj1OCybLobsco26ixQAvloVw
 BAnUIC/NKQ16JeHI/+5OKNmKxdzKpr4G3gJkL0yxfrCeusjss/dKDukLp
 C8FdcOw7nveWcdmkEwg6PnlLa5zJynF4QjDGEGOZpiHvGkNoFaftVmOPE w==;
X-CSE-ConnectionGUID: olxluasMQ8y/xLBJ1pi4mg==
X-CSE-MsgGUID: DAf8Fi4qQGeUd3aRcUJONQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19278631"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19278631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792377"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792377"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 12:06:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 22:06:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/amdgpu: Use drm_crtc_vblank_crtc()
Date: Mon,  8 Apr 2024 22:06:08 +0300
Message-ID: <20240408190611.24914-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the open coded drm_crtc_vblank_crtc() with the real
thing.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 8 ++------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 8baa2e0935cc..258703145161 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -65,9 +65,7 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
 
 static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
@@ -91,10 +89,8 @@ static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 					     ktime_t *vblank_time,
 					     bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct amdgpu_vkms_output *output = drm_crtc_to_amdgpu_vkms_output(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 71d2d44681b2..662d2d83473b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -528,7 +528,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 	if (acrtc) {
 		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
 		drm_dev = acrtc->base.dev;
-		vblank = &drm_dev->vblank[acrtc->base.index];
+		vblank = drm_crtc_vblank_crtc(&acrtc->base);
 		previous_timestamp = atomic64_read(&irq_params->previous_timestamp);
 		frame_duration_ns = vblank->time - previous_timestamp;
 
-- 
2.43.2

