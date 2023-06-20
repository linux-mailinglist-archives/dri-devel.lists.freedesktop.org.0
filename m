Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9AB7362E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 06:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E123C10E257;
	Tue, 20 Jun 2023 04:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 40F2610E257;
 Tue, 20 Jun 2023 04:59:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id EF41360B6AA47;
 Tue, 20 Jun 2023 12:59:21 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: alexander.deucher@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Date: Tue, 20 Jun 2023 12:59:19 +0800
Message-Id: <20230620045919.492128-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Su Hui <suhui@nfschina.com>, Jane.Jian@amd.com, Bokun.Zhang@amd.com,
 David.Francis@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch error:
    gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: error:
    static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
    static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"

Fixes: 1721bc1b2afa ("drm/amdgpu: Update VF2PF interface")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index 24d42d24e6a0..a482b422fed2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -177,10 +177,10 @@ struct amd_sriov_msg_pf2vf_info {
 	uint64_t mecfw_offset;
 	/* MEC FW size in BYTE */
 	uint32_t mecfw_size;
-	/* UVD FW position in BYTE from the start of VF visible frame buffer */
-	uint64_t uvdfw_offset;
 	/* UVD FW size in BYTE */
 	uint32_t uvdfw_size;
+	/* UVD FW position in BYTE from the start of VF visible frame buffer */
+	uint64_t uvdfw_offset;
 	/* VCE FW position in BYTE from the start of VF visible frame buffer */
 	uint64_t vcefw_offset;
 	/* VCE FW size in BYTE */
@@ -193,8 +193,8 @@ struct amd_sriov_msg_pf2vf_info {
 	/* frequency for VF to update the VF2PF area in msec, 0 = manual */
 	uint32_t vf2pf_update_interval_ms;
 	/* identification in ROCm SMI */
-	uint64_t uuid;
 	uint32_t fcn_idx;
+	uint64_t uuid;
 	/* flags to indicate which register access method VF should use */
 	union amd_sriov_reg_access_flags reg_access_flags;
 	/* MM BW management */
@@ -263,7 +263,7 @@ struct amd_sriov_msg_vf2pf_info {
 	struct {
 		uint8_t id;
 		uint32_t version;
-	} ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
+	} __packed ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
 	uint64_t dummy_page_addr;
 
 	/* reserved */
-- 
2.30.2

