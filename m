Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACFCBACA2D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D9C10E58E;
	Tue, 30 Sep 2025 11:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gqo/VnSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A41710E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:08:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E6123604C6;
 Tue, 30 Sep 2025 11:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF55C4CEF0;
 Tue, 30 Sep 2025 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759230530;
 bh=dAHPIfq9gs0ftMfI45o7P8b7qPfg/5L3fh9SAl2pFAY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=gqo/VnSuVxVp8xReY24PJlifQjyFJk4vy32xWA/lRRVY6HPFIVmmTSST/iQS2IlLi
 cYHHzfDt1fV3KcyIpv9x1e43uOotXzEd82xNjFYG/eMyHSH9JxQ2FzjO/cdFFqTJly
 qj1jj/Vb/pUBAyw5sBNSL06Xz90k7oxmVAW7qMnk=
Subject: Patch "drm/ast: Use msleep instead of mdelay for edid read" has been
 added to the 6.6-stable tree
To: airlied@redhat.com, csoto@nvidia.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, kuohsiang_chou@aspeedtech.com,
 nirmoyd@nvidia.com, sashal@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 30 Sep 2025 13:08:47 +0200
In-Reply-To: <20250929155031.137825-1-sashal@kernel.org>
Message-ID: <2025093047-revisable-gallstone-f60e@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/ast: Use msleep instead of mdelay for edid read

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-use-msleep-instead-of-mdelay-for-edid-read.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-181948-greg=kroah.com@vger.kernel.org Mon Sep 29 17:51:18 2025
From: Sasha Levin <sashal@kernel.org>
Date: Mon, 29 Sep 2025 11:50:10 -0400
Subject: drm/ast: Use msleep instead of mdelay for edid read
To: stable@vger.kernel.org
Cc: Nirmoy Das <nirmoyd@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>, csoto@nvidia.com, KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>, Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20250929155031.137825-1-sashal@kernel.org>

From: Nirmoy Das <nirmoyd@nvidia.com>

[ Upstream commit c7c31f8dc54aa3c9b2c994b5f1ff7e740a654e97 ]

The busy-waiting in `mdelay()` can cause CPU stalls and kernel timeouts
during boot.

Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Carol L Soto csoto@nvidia.com<mailto:csoto@nvidia.com>
Fixes: 594e9c04b586 ("drm/ast: Create the driver for ASPEED proprietory Display-Port")
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/r/20250917194346.2905522-1-nirmoyd@nvidia.com
[ Applied change to ast_astdp_read_edid() instead of ast_astdp_read_edid_block() ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_dp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -62,7 +62,7 @@ int ast_astdp_read_edid(struct drm_devic
 			 *	  of right-click of mouse.
 			 * 2. The Delays are often longer a lot when system resume from S3/S4.
 			 */
-			mdelay(j+1);
+			msleep(j + 1);
 
 			if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1,
 							ASTDP_MCU_FW_EXECUTING) &&


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-6.6/smb-client-fix-wrong-index-reference-in-smb2_compoun.patch
queue-6.6/gpiolib-extend-software-node-support-to-support-secondary-software-nodes.patch
queue-6.6/net-dsa-lantiq_gswip-suppress-einval-errors-for-brid.patch
queue-6.6/scsi-ufs-mcq-fix-memory-allocation-checks-for-sqe-an.patch
queue-6.6/hid-multitouch-specify-that-apple-touch-bar-is-direc.patch
queue-6.6/can-mcba_usb-populate-ndo_change_mtu-to-prevent-buff.patch
queue-6.6/hid-multitouch-take-cls-maxcontacts-into-account-for.patch
queue-6.6/hid-multitouch-get-the-contact-id-from-hid_dg_transd.patch
queue-6.6/alsa-usb-audio-avoid-multiple-assignments-in-mixer_q.patch
queue-6.6/cpufreq-initialize-cpufreq-based-invariance-before-s.patch
queue-6.6/ethernet-rvu-af-remove-slash-from-the-driver-name.patch
queue-6.6/bluetooth-hci_sync-fix-hci_resume_advertising_sync.patch
queue-6.6/alsa-usb-audio-fix-block-comments-in-mixer_quirks.patch
queue-6.6/alsa-usb-audio-fix-build-with-config_input-n.patch
queue-6.6/drm-ast-use-msleep-instead-of-mdelay-for-edid-read.patch
queue-6.6/smb-server-don-t-use-delayed_work-for-post_recv_cred.patch
queue-6.6/drm-gma500-fix-null-dereference-in-hdmi-teardown.patch
queue-6.6/s390-cpum_cf-fix-uninitialized-warning-after-backport-of-ce971233242b.patch
queue-6.6/xfrm-xfrm_alloc_spi-shouldn-t-use-0-as-spi.patch
queue-6.6/mm-folio_may_be_lru_cached-unless-folio_test_large.patch
queue-6.6/i40e-increase-max-descriptors-for-xl710.patch
queue-6.6/can-etas_es58x-populate-ndo_change_mtu-to-prevent-bu.patch
queue-6.6/alsa-usb-audio-remove-unneeded-wmb-in-mixer_quirks.patch
queue-6.6/selftests-fib_nexthops-fix-creation-of-non-fdb-nexth.patch
queue-6.6/alsa-usb-audio-move-mixer_quirks-min_mute-into-commo.patch
queue-6.6/mm-gup-revert-mm-gup-fix-infinite-loop-within-__get_.patch
queue-6.6/hid-multitouch-support-getting-the-tip-state-from-hi.patch
queue-6.6/bpf-reject-bpf_timer-for-preempt_rt.patch
queue-6.6/alsa-usb-audio-add-mute-tlv-for-playback-volumes-on-.patch
queue-6.6/mm-gup-check-ref_count-instead-of-lru-before-migrati.patch
queue-6.6/can-hi311x-populate-ndo_change_mtu-to-prevent-buffer.patch
queue-6.6/alsa-usb-audio-simplify-null-comparison-in-mixer_qui.patch
queue-6.6/can-peak_usb-fix-shift-out-of-bounds-issue.patch
queue-6.6/i40e-add-validation-for-ring_len-param.patch
queue-6.6/net-allow-alloc_skb_with_frags-to-use-max_skb_frags.patch
queue-6.6/arm-dts-kirkwood-fix-sound-dai-cells-for-openrd-clie.patch
queue-6.6/firewire-core-fix-overlooked-update-of-subsystem-abi.patch
queue-6.6/net-dsa-lantiq_gswip-do-also-enable-or-disable-cpu-p.patch
queue-6.6/bluetooth-hci_event-fix-uaf-in-hci_acl_create_conn_s.patch
queue-6.6/alsa-usb-audio-convert-comma-to-semicolon.patch
queue-6.6/ib-mlx5-fix-obj_type-mismatch-for-srq-event-subscrip.patch
queue-6.6/can-rcar_can-rcar_can_resume-fix-s2ram-with-psci.patch
queue-6.6/net-dsa-lantiq_gswip-move-gswip_add_single_port_br-c.patch
queue-6.6/i2c-designware-add-quirk-for-intel-xe.patch
queue-6.6/alsa-usb-audio-add-dsd-support-for-comtrue-usb-audio.patch
queue-6.6/arm64-dts-imx8mp-correct-thermal-sensor-index.patch
queue-6.6/mmc-sdhci-cadence-add-mobileye-eyeq-support.patch
queue-6.6/nexthop-forbid-fdb-status-change-while-nexthop-is-in.patch
queue-6.6/alsa-usb-audio-add-mixer-quirk-for-sony-dualsense-ps.patch
queue-6.6/mm-gup-local-lru_add_drain-to-avoid-lru_add_drain_al.patch
queue-6.6/futex-prevent-use-after-free-during-requeue-pi.patch
queue-6.6/usb-core-add-0x-prefix-to-quirks-debug-output.patch
queue-6.6/bnxt_en-correct-offset-handling-for-ipv6-destination.patch
queue-6.6/mm-add-folio_expected_ref_count-for-reference-count-.patch
queue-6.6/wifi-virt_wifi-fix-page-fault-on-connect.patch
queue-6.6/alsa-usb-audio-drop-unnecessary-parentheses-in-mixer.patch
queue-6.6/vhost-take-a-reference-on-the-task-in-struct-vhost_t.patch
queue-6.6/can-sun4i_can-populate-ndo_change_mtu-to-prevent-buf.patch
queue-6.6/octeontx2-pf-fix-potential-use-after-free-in-otx2_tc.patch
