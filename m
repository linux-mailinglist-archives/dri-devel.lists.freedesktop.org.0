Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CCC2F601
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415810E51A;
	Tue,  4 Nov 2025 05:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jLCjCx2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D77B10E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 05:29:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F9ED601E9;
 Tue,  4 Nov 2025 05:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B347FC4CEF8;
 Tue,  4 Nov 2025 05:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762234169;
 bh=AXCssvaiEqsKEXptZagpn0ve09HQYBAV99hzJsgttRU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=jLCjCx2oaVDi7lOt0g3so7X0i/rKQa4fBPhFtQwRaXWPemvs3eEtjFkHLCZEeqpjR
 fkHplvS1btFGJ+ONDxFhHjGI5Kg+5indvkljdzJvzjzUdMXTjinKKKZ7k6LNHi70H6
 Z4P6XoQDkTJ5zTuZEqLOrNaeSIbKzABNVHds2vMU=
Subject: Patch "drm/sysfb: Do not dereference NULL pointer in plane reset" has
 been added to the 5.15-stable tree
To: airlied@gmail.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, sashal@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 04 Nov 2025 14:29:19 +0900
In-Reply-To: <20251103150626.4044944-1-sashal@kernel.org>
Message-ID: <2025110419-grass-number-3912@gregkh>
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

    drm/sysfb: Do not dereference NULL pointer in plane reset

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-192219-greg=kroah.com@vger.kernel.org Tue Nov  4 00:22:28 2025
From: Sasha Levin <sashal@kernel.org>
Date: Mon,  3 Nov 2025 10:06:26 -0500
Subject: drm/sysfb: Do not dereference NULL pointer in plane reset
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dan Carpenter <dan.carpenter@linaro.org>, Melissa Wen <melissa.srw@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20251103150626.4044944-1-sashal@kernel.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 14e02ed3876f4ab0ed6d3f41972175f8b8df3d70 ]

The plane state in __drm_gem_reset_shadow_plane() can be NULL. Do not
deref that pointer, but forward NULL to the other plane-reset helpers.
Clears plane->state to NULL.

v2:
- fix typo in commit description (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b71565022031 ("drm/gem: Export implementation of shadow-plane helpers")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/aPIDAsHIUHp_qSW4@stanley.mountain/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.15+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patch.msgid.link/20251017091407.58488-1-tzimmermann@suse.de
[ removed drm_format_conv_state_init() call ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -282,7 +282,11 @@ EXPORT_SYMBOL(drm_gem_destroy_shadow_pla
 void __drm_gem_reset_shadow_plane(struct drm_plane *plane,
 				  struct drm_shadow_plane_state *shadow_plane_state)
 {
-	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+	if (shadow_plane_state) {
+		__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+	} else {
+		__drm_atomic_helper_plane_reset(plane, NULL);
+	}
 }
 EXPORT_SYMBOL(__drm_gem_reset_shadow_plane);
 


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.15/drm-amd-pm-powerplay-smumgr-fix-pciebootlinklevel-va.patch
queue-5.15/wifi-ath10k-fix-memory-leak-on-unsupported-wmi-comma.patch
queue-5.15/x86-bugs-fix-reporting-of-lfence-retpoline.patch
queue-5.15/arch-back-to-std-gnu89-in-v5.18.patch
queue-5.15/dt-bindings-usb-dwc3-imx8mp-dma-range-is-required-only-for-imx8mp.patch
queue-5.15/btrfs-use-smp_mb__after_atomic-when-forcing-cow-in-c.patch
queue-5.15/x86-boot-compile-boot-code-with-std-gnu11-too.patch
queue-5.15/xhci-dbc-improve-performance-by-removing-delay-in-transfer-event-polling.patch
queue-5.15/net-hns3-return-error-code-when-function-fails.patch
queue-5.15/btrfs-scrub-replace-max_t-min_t-with-clamp-in-scrub_.patch
queue-5.15/xhci-dbc-poll-at-different-rate-depending-on-data-transfer-activity.patch
queue-5.15/xhci-dbc-avoid-event-polling-busyloop-if-pending-rx-transfers-are-inactive.patch
queue-5.15/ravb-exclude-gptp-feature-support-for-rz-g2l.patch
queue-5.15/drm-amd-pm-powerplay-smumgr-fix-pciebootlinklevel-va.patch-3340
queue-5.15/mptcp-drop-bogus-optimization-in-__mptcp_check_push.patch
queue-5.15/drm-etnaviv-fix-flush-sequence-logic.patch
queue-5.15/serial-8250_dw-use-devm_add_action_or_reset.patch
queue-5.15/xhci-dbc-allow-users-to-modify-dbc-poll-interval-via-sysfs.patch
queue-5.15/drm-msm-a6xx-fix-gmu-firmware-parser.patch
queue-5.15/serial-8250_dw-handle-reset-control-deassert-error.patch
queue-5.15/drm-sched-fix-race-in-drm_sched_entity_select_rq.patch
queue-5.15/bpf-sync-pending-irq-work-before-freeing-ring-buffer.patch
queue-5.15/alsa-usb-audio-fix-control-pipe-direction.patch
queue-5.15/drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
queue-5.15/btrfs-always-drop-log-root-tree-reference-in-btrfs_r.patch
queue-5.15/drm-amd-pm-fix-smu-table-id-bound-check-issue-in-smu.patch
queue-5.15/xhci-dbc-provide-sysfs-option-to-configure-dbc-descriptors.patch
queue-5.15/libbpf-normalize-pt_regs_xxx-macro-definitions.patch
queue-5.15/block-make-req_op_zone_open-a-write-operation.patch
queue-5.15/revert-docs-process-howto-replace-c89-with-c11.patch
queue-5.15/usbnet-prevents-free-active-kevent.patch
queue-5.15/net-ravb-enforce-descriptor-type-ordering.patch
queue-5.15/xhci-dbc-fix-bogus-1024-byte-prefix-if-ttydbc-read-races-with-stall-event.patch
queue-5.15/bpf-do-not-audit-capability-check-in-do_jit.patch
queue-5.15/riscv-libbpf-add-risc-v-rv64-support-to-bpf_tracing..patch
queue-5.15/net-phy-dp83867-disable-eee-support-as-not-implemented.patch
queue-5.15/libbpf-fix-powerpc-s-stack-register-definition-in-bp.patch
