Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A5BACA54
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6FB10E594;
	Tue, 30 Sep 2025 11:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wNy9Av6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A20310E594
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 19E1B4481E;
 Tue, 30 Sep 2025 11:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986F6C4CEF0;
 Tue, 30 Sep 2025 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759230680;
 bh=pamUrF4sQmbi+IgkRDORPMVtOF9KkWMGCPXvrfuO+g0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=wNy9Av6qZrh4wVN/YBhRIJ6BwkQMdmkCMTcPI21AjtPSkw4DgdEKMGcTshqKwC+qY
 rpAeFAEs/OutYAjh5IhKiDZMVbs7LQpXOgWwx3SFfnmViQbrbmJJN6zutp3lITQ/WE
 +CIj0AhKTeNoHaO6zoxwEZak868EgLY3stYj/sVU=
Subject: Patch "drm/ast: Use msleep instead of mdelay for edid read" has been
 added to the 6.1-stable tree
To: airlied@redhat.com, csoto@nvidia.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, kuohsiang_chou@aspeedtech.com,
 nirmoyd@nvidia.com, sashal@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 30 Sep 2025 13:10:53 +0200
In-Reply-To: <20250929155412.141429-1-sashal@kernel.org>
Message-ID: <2025093053-sharpness-backlight-58f7@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-use-msleep-instead-of-mdelay-for-edid-read.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-181949-greg=kroah.com@vger.kernel.org Mon Sep 29 17:54:28 2025
From: Sasha Levin <sashal@kernel.org>
Date: Mon, 29 Sep 2025 11:54:09 -0400
Subject: drm/ast: Use msleep instead of mdelay for edid read
To: stable@vger.kernel.org
Cc: Nirmoy Das <nirmoyd@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>, KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>, Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20250929155412.141429-1-sashal@kernel.org>

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
@@ -51,7 +51,7 @@ int ast_astdp_read_edid(struct drm_devic
 			 *	  of right-click of mouse.
 			 * 2. The Delays are often longer a lot when system resume from S3/S4.
 			 */
-			mdelay(j+1);
+			msleep(j + 1);
 
 			if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1,
 							ASTDP_MCU_FW_EXECUTING) &&


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-6.1/net-dsa-lantiq_gswip-suppress-einval-errors-for-brid.patch
queue-6.1/hid-multitouch-specify-that-apple-touch-bar-is-direc.patch
queue-6.1/minmax-add-a-few-more-min_t-max_t-users.patch
queue-6.1/can-etas_es58x-sort-the-includes-by-alphabetic-order.patch
queue-6.1/can-mcba_usb-populate-ndo_change_mtu-to-prevent-buff.patch
queue-6.1/hid-multitouch-take-cls-maxcontacts-into-account-for.patch
queue-6.1/hid-multitouch-get-the-contact-id-from-hid_dg_transd.patch
queue-6.1/alsa-usb-audio-avoid-multiple-assignments-in-mixer_q.patch
queue-6.1/cpufreq-initialize-cpufreq-based-invariance-before-s.patch
queue-6.1/ethernet-rvu-af-remove-slash-from-the-driver-name.patch
queue-6.1/bluetooth-hci_sync-fix-hci_resume_advertising_sync.patch
queue-6.1/alsa-usb-audio-fix-block-comments-in-mixer_quirks.patch
queue-6.1/alsa-usb-audio-fix-build-with-config_input-n.patch
queue-6.1/minmax-fix-indentation-of-__cmp_once-and-__clamp_once.patch
queue-6.1/drm-ast-use-msleep-instead-of-mdelay-for-edid-read.patch
queue-6.1/smb-server-don-t-use-delayed_work-for-post_recv_cred.patch
queue-6.1/drm-gma500-fix-null-dereference-in-hdmi-teardown.patch
queue-6.1/s390-cpum_cf-fix-uninitialized-warning-after-backport-of-ce971233242b.patch
queue-6.1/mm-folio_may_be_lru_cached-unless-folio_test_large.patch
queue-6.1/i40e-increase-max-descriptors-for-xl710.patch
queue-6.1/minmax-add-in_range-macro.patch
queue-6.1/can-etas_es58x-populate-ndo_change_mtu-to-prevent-bu.patch
queue-6.1/alsa-usb-audio-remove-unneeded-wmb-in-mixer_quirks.patch
queue-6.1/selftests-fib_nexthops-fix-creation-of-non-fdb-nexth.patch
queue-6.1/alsa-usb-audio-move-mixer_quirks-min_mute-into-commo.patch
queue-6.1/mm-gup-revert-mm-gup-fix-infinite-loop-within-__get_.patch
queue-6.1/hid-multitouch-support-getting-the-tip-state-from-hi.patch
queue-6.1/bpf-reject-bpf_timer-for-preempt_rt.patch
queue-6.1/alsa-usb-audio-add-mute-tlv-for-playback-volumes-on-.patch
queue-6.1/minmax-deduplicate-__unconst_integer_typeof.patch
queue-6.1/mm-gup-check-ref_count-instead-of-lru-before-migrati.patch
queue-6.1/can-hi311x-populate-ndo_change_mtu-to-prevent-buffer.patch
queue-6.1/minmax-simplify-and-clarify-min_t-max_t-implementation.patch
queue-6.1/alsa-usb-audio-simplify-null-comparison-in-mixer_qui.patch
queue-6.1/i40e-fix-idx-validation-in-config-queues-msg.patch
queue-6.1/can-peak_usb-fix-shift-out-of-bounds-issue.patch
queue-6.1/i40e-add-validation-for-ring_len-param.patch
queue-6.1/minmax-avoid-overly-complicated-constant-expressions-in-vm-code.patch
queue-6.1/net-dsa-lantiq_gswip-do-also-enable-or-disable-cpu-p.patch
queue-6.1/bluetooth-hci_event-fix-uaf-in-hci_acl_create_conn_s.patch
queue-6.1/alsa-usb-audio-convert-comma-to-semicolon.patch
queue-6.1/ib-mlx5-fix-obj_type-mismatch-for-srq-event-subscrip.patch
queue-6.1/kmsan-fix-out-of-bounds-access-to-shadow-memory.patch
queue-6.1/can-rcar_can-rcar_can_resume-fix-s2ram-with-psci.patch
queue-6.1/net-dsa-lantiq_gswip-move-gswip_add_single_port_br-c.patch
queue-6.1/alsa-usb-audio-add-dsd-support-for-comtrue-usb-audio.patch
queue-6.1/arm64-dts-imx8mp-correct-thermal-sensor-index.patch
queue-6.1/nexthop-forbid-fdb-status-change-while-nexthop-is-in.patch
queue-6.1/i40e-fix-validation-of-vf-state-in-get-resources.patch
queue-6.1/alsa-usb-audio-add-mixer-quirk-for-sony-dualsense-ps.patch
queue-6.1/minmax-introduce-min-max-_array.patch
queue-6.1/mm-gup-local-lru_add_drain-to-avoid-lru_add_drain_al.patch
queue-6.1/futex-prevent-use-after-free-during-requeue-pi.patch
queue-6.1/usb-core-add-0x-prefix-to-quirks-debug-output.patch
queue-6.1/bnxt_en-correct-offset-handling-for-ipv6-destination.patch
queue-6.1/mm-add-folio_expected_ref_count-for-reference-count-.patch
queue-6.1/alsa-usb-audio-drop-unnecessary-parentheses-in-mixer.patch
queue-6.1/can-sun4i_can-populate-ndo_change_mtu-to-prevent-buf.patch
queue-6.1/octeontx2-pf-fix-potential-use-after-free-in-otx2_tc.patch
