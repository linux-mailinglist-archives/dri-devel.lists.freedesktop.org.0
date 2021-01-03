Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA862E8C79
	for <lists+dri-devel@lfdr.de>; Sun,  3 Jan 2021 15:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E089623;
	Sun,  3 Jan 2021 14:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A92F89623
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jan 2021 14:02:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB6C820C56;
 Sun,  3 Jan 2021 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609682574;
 bh=3wcwLP3yhCppf7CmmfZnT9BbP/bxX1BDeFfoAgZD7GE=;
 h=From:To:Cc:Subject:Date:From;
 b=pAcDoGwXTxoLbRuqvjDyDS6otLikwiQMDcc3fODKiZNBVIdSURyBviZh5tjSDBF7K
 8xAOo8d1cVGR7vuCXkZUcfCyTizilb85We8xUkiUFv6t/3oMo4glpbw0LjBjEP1vbg
 /OWW88tRwdwjKHP2GfXw+VRZRY10ez255oYI5FDenFjeDttG5i4nOSbwA360HT4PAt
 +xow4n7CekvVVnSCNER28TiCrgt4dkUGQ9jwSo38efPSG0oc8cO52X4dNMSFLPz9az
 eb8lxL2Zet+qUcrEhqu56CajDJWzrMxzJBopLdACrm7w8w9cpIsblvSPO7FZGSOwPX
 rWht1Y+bvN3Vw==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bindu Ramamurthy <bindu.r@amd.com>, Wayne Lin <Wayne.Lin@amd.com>
Subject: [PATCH] drm/amd/display: Fix unused variable warning
Date: Sun,  3 Jan 2021 15:02:32 +0100
Message-Id: <20210103140248.3889757-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Some of the newly added code is hidden inside of #ifdef
blocks, but one variable is unused when debugfs is disabled:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8370:8: error: unused variable 'configure_crc' [-Werror,-Wunused-variable]

Change the #ifdef to an if(IS_ENABLED()) check to fix the warning
and avoid adding more #ifdefs.

Fixes: c920888c604d ("drm/amd/display: Expose new CRC window property")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 4 +---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 42b0fdb72e7b..5071b55ad0f6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8379,8 +8379,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 			manage_dm_interrupts(adev, acrtc, true);
 		}
-#ifdef CONFIG_DEBUG_FS
-		if (new_crtc_state->active &&
+		if (IS_ENABLED(CONFIG_DEBUG_FS) && new_crtc_state->active &&
 			amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 			/**
 			 * Frontend may have changed so reapply the CRC capture
@@ -8401,7 +8400,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				amdgpu_dm_crtc_configure_crc_source(
 					crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
 		}
-#endif
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 0235bfb246e5..eba2f1d35d07 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -46,13 +46,13 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
 }
 
 /* amdgpu_dm_crc.c */
-#ifdef CONFIG_DEBUG_FS
 bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);
 bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
 					struct dm_crtc_state *dm_old_crtc_state);
 int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source);
+#ifdef CONFIG_DEBUG_FS
 int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name);
 int amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc,
 				     const char *src_name,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
