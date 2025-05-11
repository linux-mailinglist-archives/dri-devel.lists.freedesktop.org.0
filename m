Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D1AB2BA3
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 23:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782D10E0B8;
	Sun, 11 May 2025 21:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TW5FjP0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93410E0B8;
 Sun, 11 May 2025 21:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=moNs0d3PL9+4Allv8IQxIKhdsP9+MrQ2T+WXbX6oiRk=; b=TW5FjP0c3WcQwl++SZDJnE3C6G
 /qNfcVr15d1mlMFicZ6oW2ktVFdmZBXfRoFRAIL5etpcHwv51Zry3gkLofkWGJxHaTcyxghbKhIhB
 ZBf8tKTDdL1F3HdEIDCH3IJPaZJev3bbFJPKsmWDrGWo1aSaSQCT0b9NidLozGRUl6fDbZLuSJiRH
 fbefX/iJm6dKdripcEMPauC3VRS1o9kDc6Rq3ZKySsbqrDKTz63kE/x9O2M5YCMuq2kFqOgBSoxLb
 0YUTQ3MCd4s+SCX1eRKjIoTbgKKtJHzz2Y3MKAfVWcv8M+s7jSCN3ZqzIInFVQ386Rt0UNK9NuE/B
 Qo3kr2Dw==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uEEIp-006mbm-Un; Sun, 11 May 2025 23:38:56 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: disable CRTC degamma LUT for DCN401
Date: Sun, 11 May 2025 18:22:41 -0300
Message-ID: <20250511213847.61930-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In DCN401 pre-blending degamma LUT isn't affecting cursor as in previous
DCN version. As this is not the behavior close to what is expected for
CRTC degamma LUT, disable CRTC degamma LUT property in this HW.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4176
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

When enabling HDR on KDE, it takes the first CRTC 1D LUT available and
apply a color transformation (Gamma 2.2 -> PQ). AMD driver usually
advertises a CRTC degamma LUT as the first CRTC 1D LUT, but it's
actually applied pre-blending. In previous HW version, it seems to work
fine because the 1D LUT was applied to cursor too, but DCN401 presents a
different behavior and the 1D LUT isn't affecting the hardware cursor.

To address the wrong gamma on cursor with HDR (see the link), I came up
with this patch that disables CRTC degamma LUT in this hw, since it
presents a different behavior than others. With this KDE sees CRTC
regamma LUT as the first post-blending 1D LUT available. This is
actually more consistent with AMD color pipeline. It was tested by the
reporter, since I don't have the HW available for local testing and
debugging.

Melissa

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e8bdd7f0c460..db157b38f862 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -737,7 +737,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	 * support programmable degamma anywhere.
 	 */
 	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
-	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
+	/* Dont't enable DRM CRTC degamma property for DCN401 since the
+	 * pre-blending degamma LUT doesn't apply to cursor, and therefore
+	 * can't work similar to a post-blending degamma LUT as in other hw
+	 * versions.
+	 * TODO: revisit it once KMS plane color API is merged.
+	 */
+	drm_crtc_enable_color_mgmt(&acrtc->base,
+				   (is_dcn &&
+				    dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01) ?
+				     MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
-- 
2.47.2

