Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15542C2F604
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDDF10E51B;
	Tue,  4 Nov 2025 05:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KxmsLWe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971E010E51B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 05:30:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C395F601E9;
 Tue,  4 Nov 2025 05:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B888C4CEF7;
 Tue,  4 Nov 2025 05:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762234201;
 bh=aC6B8UHi5aacgxMSscj/IHYzs5mWx5Z8rV5IeveKbfU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=KxmsLWe6llU51Iv6uTnwLbIxlDRYMRxAi7eSK/vNG6RwGZznah30dGtP9aXNLwlQ/
 VeDILoY0klGE1knQAt7JtPLhUm3nmDSF0q6yh3/w8edbuJqTFlQT9JaUwMP/NNFkSQ
 GY0ZEDdRKVECCPdHQu5fO3jgzepX6wEwlqc9ofbM=
Subject: Patch "drm/sysfb: Do not dereference NULL pointer in plane reset" has
 been added to the 6.1-stable tree
To: airlied@gmail.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, sashal@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 04 Nov 2025 14:29:50 +0900
In-Reply-To: <20251103145911.4040590-1-sashal@kernel.org>
Message-ID: <2025110450-little-probe-8b14@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-192216-greg=kroah.com@vger.kernel.org Tue Nov  4 00:37:33 2025
From: Sasha Levin <sashal@kernel.org>
Date: Mon,  3 Nov 2025 09:59:11 -0500
Subject: drm/sysfb: Do not dereference NULL pointer in plane reset
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dan Carpenter <dan.carpenter@linaro.org>, Melissa Wen <melissa.srw@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20251103145911.4040590-1-sashal@kernel.org>

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
@@ -330,7 +330,11 @@ EXPORT_SYMBOL(drm_gem_destroy_shadow_pla
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

queue-6.1/bluetooth-hci-fix-tracking-of-advertisement-set-inst.patch
queue-6.1/drm-amd-pm-powerplay-smumgr-fix-pciebootlinklevel-va.patch-16017
queue-6.1/drm-amd-pm-powerplay-smumgr-fix-pciebootlinklevel-va.patch
queue-6.1/wifi-ath10k-fix-memory-leak-on-unsupported-wmi-comma.patch
queue-6.1/x86-bugs-fix-reporting-of-lfence-retpoline.patch
queue-6.1/dt-bindings-usb-dwc3-imx8mp-dma-range-is-required-only-for-imx8mp.patch
queue-6.1/btrfs-use-smp_mb__after_atomic-when-forcing-cow-in-c.patch
queue-6.1/arch-add-the-macro-compile_offsets-to-all-the-asm-of.patch
queue-6.1/s390-pci-restore-irq-unconditionally-for-the-zpci-device.patch
queue-6.1/xhci-dbc-improve-performance-by-removing-delay-in-transfer-event-polling.patch
queue-6.1/asoc-fsl_sai-fix-bit-order-for-dsd-format.patch
queue-6.1/edac-mc_sysfs-increase-legacy-channel-support-to-16.patch
queue-6.1/net-hns3-return-error-code-when-function-fails.patch
queue-6.1/btrfs-scrub-replace-max_t-min_t-with-clamp-in-scrub_.patch
queue-6.1/xhci-dbc-poll-at-different-rate-depending-on-data-transfer-activity.patch
queue-6.1/xhci-dbc-avoid-event-polling-busyloop-if-pending-rx-transfers-are-inactive.patch
queue-6.1/serial-sc16is7xx-remove-unused-to_sc16is7xx_port-macro.patch
queue-6.1/selftests-mptcp-join-mark-delete-re-add-signal-as-skipped-if-not-supported.patch
queue-6.1/asoc-intel-avs-unprepare-a-stream-when-xrun-occurs.patch
queue-6.1/mptcp-drop-bogus-optimization-in-__mptcp_check_push.patch
queue-6.1/drm-etnaviv-fix-flush-sequence-logic.patch
queue-6.1/serial-sc16is7xx-reorder-code-to-remove-prototype-declarations.patch
queue-6.1/serial-sc16is7xx-refactor-efr-lock.patch
queue-6.1/mptcp-pm-in-kernel-c-flag-handle-late-add_addr.patch
queue-6.1/xhci-dbc-allow-users-to-modify-dbc-poll-interval-via-sysfs.patch
queue-6.1/perf-have-get_perf_callchain-return-null-if-crosstas.patch
queue-6.1/bluetooth-iso-fix-another-instance-of-dst_type-handl.patch
queue-6.1/s390-pci-avoid-deadlock-between-pci-error-recovery-and-mlx5-crdump.patch
queue-6.1/serial-sc16is7xx-remove-useless-enable-of-enhanced-features.patch
queue-6.1/btrfs-zoned-refine-extent-allocator-hint-selection.patch
queue-6.1/drm-msm-a6xx-fix-gmu-firmware-parser.patch
queue-6.1/selftests-mptcp-disable-add_addr-retrans-in-endpoint_tests.patch
queue-6.1/bluetooth-hci_sync-fix-race-in-hci_cmd_sync_dequeue_.patch
queue-6.1/scsi-ufs-core-initialize-value-of-an-attribute-retur.patch
queue-6.1/mptcp-change-first-as-a-parameter.patch
queue-6.1/bluetooth-btmtksdio-add-pmctrl-handling-for-bt-close.patch
queue-6.1/drm-sched-fix-race-in-drm_sched_entity_select_rq.patch
queue-6.1/bpf-sync-pending-irq-work-before-freeing-ring-buffer.patch
queue-6.1/alsa-usb-audio-fix-control-pipe-direction.patch
queue-6.1/drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
queue-6.1/btrfs-always-drop-log-root-tree-reference-in-btrfs_r.patch
queue-6.1/drm-amd-pm-fix-smu-table-id-bound-check-issue-in-smu.patch
queue-6.1/xhci-dbc-provide-sysfs-option-to-configure-dbc-descriptors.patch
queue-6.1/bluetooth-iso-add-support-for-periodic-adv-reports-p.patch
queue-6.1/usbnet-prevents-free-active-kevent.patch
queue-6.1/xhci-dbc-fix-bogus-1024-byte-prefix-if-ttydbc-read-races-with-stall-event.patch
queue-6.1/bpf-do-not-audit-capability-check-in-do_jit.patch
queue-6.1/net-phy-dp83867-disable-eee-support-as-not-implemented.patch
queue-6.1/libbpf-fix-powerpc-s-stack-register-definition-in-bp.patch
