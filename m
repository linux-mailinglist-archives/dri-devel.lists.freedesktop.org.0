Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B276BE351
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A69210EE96;
	Fri, 17 Mar 2023 08:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3E10EE8A;
 Fri, 17 Mar 2023 08:23:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 707AFB82503;
 Fri, 17 Mar 2023 08:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62EAC4339E;
 Fri, 17 Mar 2023 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041419;
 bh=xZ13Sd87g9CKUnDrgvkkNwNiDfiWnXZudwoi/OaryNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=St2SF/s3v1p6ct/nxEVpyCflMhM+8DHR0z2aPQdZ7xVZDFtuPfrXYY2Qc5tpx3oS1
 IIQHSPOQDnWV9HASgwgdyeWBIDNaM+VCyYPSShkwxxlxyqIcOxVdiecZ8h5UOgh98C
 sQvpRs2jgnUvBRVcTdJVBtlj3GGVjEf4/mJG9rZWnRKPCQ52z8Jm4rpKriokJrSx4j
 9Ae/0p8dC5kAIEsusC16uPNiRSrR/Y9/91oZDQsmFnr/ND8X/4gKG6Vw4kVdea2vBC
 nid2hyp3wEmEz4n8LiROTVE3dthzdBJHrD0uNnVvzbveIwtFfYnOnk8Mlo+34vcDYI
 iQXP7MGZXh6oQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 32/37] drm/amd/display/dc/link/protocols/link_dp_capability:
 Remove unused variable and mark another as __maybe_unused
Date: Fri, 17 Mar 2023 08:17:13 +0000
Message-Id: <20230317081718.2650744-33-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Wenjing Liu <wenjing.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

‘ds_port’ is clearly not used anywhere and ‘result_write_min_hblank’ is
only utilised when debugging is enabled.  The alternative would be to
allocate the variable under the same clause as the debugging code, but
that would become very messy, very quickly.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c: In function ‘dp_wa_power_up_0010FA’:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:280:42: warning: variable ‘ds_port’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c: In function ‘dpcd_set_source_specific_data’:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1296:32: warning: variable ‘result_write_min_hblank’ set but not used [-Wunused-but-set-variable]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index e9bcb35ae185a..51427f5081642 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1284,7 +1284,7 @@ bool dp_overwrite_extended_receiver_cap(struct dc_link *link)
 void dpcd_set_source_specific_data(struct dc_link *link)
 {
 	if (!link->dc->vendor_signature.is_valid) {
-		enum dc_status result_write_min_hblank = DC_NOT_SUPPORTED;
+		enum dc_status __maybe_unused result_write_min_hblank = DC_NOT_SUPPORTED;
 		struct dpcd_amd_signature amd_signature = {0};
 		struct dpcd_amd_device_id amd_device_id = {0};
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

