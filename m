Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306679EE07
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6827810E4DB;
	Wed, 13 Sep 2023 16:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF41910E02A;
 Wed, 13 Sep 2023 16:10:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B40C61A0A;
 Wed, 13 Sep 2023 16:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25ED1C433C7;
 Wed, 13 Sep 2023 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694621456;
 bh=zb3Av1pFNOsjED2IV5DGzeXlf/onH5EprDbHqtbQT5U=;
 h=From:Date:Subject:To:Cc:From;
 b=Qg4IGxYynpdACteEvT7EkdE/xPD94USvg2ihnnUDmzCmtoft/v+c+9krD+k6TD0jN
 MShDL5F1gOGib2CK3QpH2OWrd9tZT8fD1XWETdVHMyEmBUWeRw1tu5oHLEk33aH9iv
 R/qJtAQBOUY5sZdbDG/4ZQUjCO9IyRvwzoCzfDZEajMn8wbBxZU0a/wWD3ESOYVmjH
 1tuqBmdU1bstlLEMTcgs5IfHJNBom30nKSqlx4rGinVZgrrKtfGp23+4emdqvYu5R4
 x4sRkZQ/2JthyaTxQyj1wsdC1SMNXc5IWDZiyG38HJjqWkTXS3HKMU9I5IiUV0RNmv
 pXBWzds3PKp2A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 13 Sep 2023 09:10:36 -0700
Subject: [PATCH] drm/amd/display: Fix -Wuninitialized in
 dm_helpers_dp_mst_send_payload_allocation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPveAWUC/x3NSQ7DIAxA0atEXhcphEWHq1QVcrHbWCKAMB2j3
 L2oy795fwXlKqxwGlao/BSVnHrY3QBhxnRnI9QbpnFy49E6c5O3eT2SJGmCUb5MhhY/cyxc1VP
 xizavnMgX/MSM5DHGHLB12AS3vzqHiGQP0Belcvf++/Nl2358pnq5jgAAAA==
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 Wayne.Lin@amd.com, lyude@redhat.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=nathan@kernel.org;
 h=from:subject:message-id; bh=zb3Av1pFNOsjED2IV5DGzeXlf/onH5EprDbHqtbQT5U=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKmM9/lf+i24czf2fN73Jy6zvQwNtkj95LHXVnnBnBDiF
 Jb7zVq8o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkqSvDb5YvF4xeJYp3O5s9
 NEpbWrmmo+G71c0vimJ6k3Qr056d3szwv6TNLavXbXvqzXWMNm0r16zZ6P/u7dwLPCqhlbaWBo8
 n8AAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building with clang, there is a warning (or error when
CONFIG_WERROR is set):

  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21: error: variable 'old_payload' is uninitialized when used here [-Werror,-Wuninitialized]
    368 |                                                  new_payload, old_payload);
        |                                                               ^~~~~~~~~~~
  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:344:61: note: initialize the variable 'old_payload' to silence this warning
    344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
        |                                                                    ^
        |                                                                     = NULL
  1 error generated.

This variable is not required outside of this function so allocate
old_payload on the stack and pass it by reference to
dm_helpers_construct_old_payload(), resolving the warning.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 9ad509279b0a..c4c35f6844f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
+	struct drm_dp_mst_atomic_payload *new_payload, old_payload;
 	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 	int ret = 0;
@@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
 	} else {
 		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
-						 new_payload, old_payload);
-		drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
+						 new_payload, &old_payload);
+		drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payload, new_payload);
 	}
 
 	if (ret) {

---
base-commit: 8569c31545385195bdb0c021124e68336e91c693
change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-c37b33aaad18

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

