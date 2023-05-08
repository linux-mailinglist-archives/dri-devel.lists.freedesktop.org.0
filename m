Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC06FA015
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 08:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8D10E123;
	Mon,  8 May 2023 06:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316EF10E123;
 Mon,  8 May 2023 06:46:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1957861F20;
 Mon,  8 May 2023 06:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C95DC433EF;
 Mon,  8 May 2023 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1683528363;
 bh=4kJuHiKvil1lM32oKHLaU29Oj9tb02eWzRjkbqti0CM=;
 h=Subject:To:Cc:From:Date:From;
 b=zC21WlN91KBZTO0DSOx+YO1wLp/x+/ILYWrd0PCbezoayOa08Yr0iO7HE7wSUTVE+
 iR+jGS+nboSCwENDX8bmPsYf2HtEOYQX/vveOQaoqlXMLdgE7bYqpD6eyHHMFoEfKD
 AU8pz8weGbCF3coQZIFW38b0weJpOV61ZiAX58Xg=
Subject: Patch "drm/amd/display (gcc13): fix enum mismatch" has been added to
 the 6.1-stable tree
To: Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com, jirislaby@kernel.org,
 mliska@suse.cz, sunpeng.li@amd.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 08 May 2023 08:46:00 +0200
Message-ID: <2023050800-leggings-pointed-d172@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/amd/display (gcc13): fix enum mismatch

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-gcc13-fix-enum-mismatch.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 545094d993f4639482018becda5f2a47d126f0ab Mon Sep 17 00:00:00 2001
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Date: Mon, 31 Oct 2022 12:42:47 +0100
Subject: drm/amd/display (gcc13): fix enum mismatch
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

commit 545094d993f4639482018becda5f2a47d126f0ab upstream.

rn_vbios_smu_set_dcn_low_power_state() produces a valid warning with
gcc-13:
  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c:237:6: error: conflicting types for 'rn_vbios_smu_set_dcn_low_power_state' due to enum/integer mismatch; have 'void(struct clk_mgr_internal *, enum dcn_pwr_state)'
  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h:36:6: note: previous declaration of 'rn_vbios_smu_set_dcn_low_power_state' with type 'void(struct clk_mgr_internal *, int)'

I.e. the type of the 2nd parameter of
rn_vbios_smu_set_dcn_low_power_state() in the declaration is int, while
the definition spells enum dcn_pwr_state. Synchronize them to the
latter (and add a forward enum declaration).

Cc: Martin Liska <mliska@suse.cz>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
@@ -26,6 +26,8 @@
 #ifndef DAL_DC_RN_CLK_MGR_VBIOS_SMU_H_
 #define DAL_DC_RN_CLK_MGR_VBIOS_SMU_H_
 
+enum dcn_pwr_state;
+
 int rn_vbios_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
 int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
 int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
@@ -33,7 +35,7 @@ int rn_vbios_smu_set_hard_min_dcfclk(str
 int rn_vbios_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
 void rn_vbios_smu_set_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz);
 int rn_vbios_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
-void rn_vbios_smu_set_dcn_low_power_state(struct clk_mgr_internal *clk_mgr, int display_count);
+void rn_vbios_smu_set_dcn_low_power_state(struct clk_mgr_internal *clk_mgr, enum dcn_pwr_state);
 void rn_vbios_smu_enable_48mhz_tmdp_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
 void rn_vbios_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
 int rn_vbios_smu_is_periodic_retraining_disabled(struct clk_mgr_internal *clk_mgr);


Patches currently in stable-queue which might be from jirislaby@kernel.org are

queue-6.1/linux-vt_buffer.h-allow-either-builtin-or-modular-fo.patch
queue-6.1/net-wwan-t7xx-do-not-compile-with-werror.patch
queue-6.1/bonding-gcc13-synchronize-bond_-a-t-lb_xmit-types.patch
queue-6.1/drm-amd-display-gcc13-fix-enum-mismatch.patch
queue-6.1/wifi-ath11k-synchronize-ath11k_mac_he_gi_to_nl80211_he_gi-s-return-type.patch
queue-6.1/thunderbolt-use-correct-type-in-tb_port_is_clx_enabled-prototype.patch
queue-6.1/sfc-gcc13-synchronize-ef100_enqueue_skb-s-return-type.patch
queue-6.1/block-blk-iocost-gcc13-keep-large-values-in-a-new-enum.patch
queue-6.1/wireguard-timers-cast-enum-limits-members-to-int-in-prints.patch
