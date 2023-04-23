Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC76EC02A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A00D10E407;
	Sun, 23 Apr 2023 14:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953210E3EE;
 Sun, 23 Apr 2023 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4GQm73N05wdyDPvLOueAQrdj1CPYaUCZeKkaAs7VjXY=; b=h2ixzavpfQLRZTKkPcsvUCerpa
 LoWyHwwWnSdmYYg+hC/Hnz4QMtMT7U68Rvz7ux818FUzfSWXCVmsN8eWeKnzaILchgmSYHg2gwph+
 ke043JYgzHR+pr+v5CcOeYqNdOt7qZFyhmctCzqoPOV6hkqIHC7As5ZjpgZ+obUKlh1VhUKyKiRw1
 cI1EU41E+TYX6+B2QSNH7eFjttLv/ar2/wHCjT/hoNPLcnheUAxZp7BcSmRvGuQc/jwdRgoUnrkni
 PdtbyQbeh6ROOvboSKntvevX6ke1BEKqEjBabV0BoivARn+hynJAbfVGHPYXXmlTiYLSqRthR6Dfi
 2ghFpcpA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTL-00ANVs-Dv; Sun, 23 Apr 2023 16:13:47 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 33/40] drm/amd/display: reject atomic commit if setting
 both plane and CRTC degamma
Date: Sun, 23 Apr 2023 13:10:45 -0100
Message-Id: <20230423141051.702990-34-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DC only has pre-blending degamma caps (pre-blending/DPP) that is
currently in use for CRTC/post-blending degamma, so that we don't have
HW caps to perform plane and CRTC degamma at the same time. Reject
atomic updates when serspace sets both plane and CRTC degamma
properties.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 693168cc1d9c..07303c9f3618 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -949,6 +949,17 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	if (ret != -EINVAL)
 		return ret;
 
+	/* We only have one degamma block available (pre-blending) for the
+	 * whole color correction pipeline, so that we can't actually perform
+	 * plane and CRTC degamma at the same time. Reject atomic updates when
+	 * userspace sets both plane and CRTC degamma properties.
+	 */
+	if (has_crtc_cm_degamma && ret == -EINVAL){
+		drm_dbg_kms(crtc->base.crtc->dev,
+			    "doesn't support plane and CRTC degamma at the same time\n");
+			return -EINVAL;
+	}
+
 	/* As we don't have plane degamma, check if we have CRTC degamma
 	 * waiting for mapping to pre-blending degamma block */
 #endif
-- 
2.39.2

