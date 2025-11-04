Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E94C2F051
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 03:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B60D10E516;
	Tue,  4 Nov 2025 02:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wJF5p0Hm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093F10E508
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 02:48:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0E7E601E3;
 Tue,  4 Nov 2025 02:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E368C4CEE7;
 Tue,  4 Nov 2025 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762224491;
 bh=hngd9c4IlEMLdPDLMhoxbrpzDfwnywheEpKe7yw4fK0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=wJF5p0HmtE3zkcpeUfKfZT/vx0EcTAQhrRdMu4oXNP3noQ6kkYrAgaxAsnxVlh/L/
 8Yn9WCVvKmldS2jk73TmXNk9Ygn1QI3tKxAcWXP52n2WBMy4QV+m6JXiIrL50fEmeO
 e48+Fq5QdAAxRgvPRyhOmWWoJLHc3Tp9kI4dMm5o=
Subject: Patch "drm/sysfb: Do not dereference NULL pointer in plane reset" has
 been added to the 6.6-stable tree
To: airlied@gmail.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, sashal@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 04 Nov 2025 11:48:01 +0900
In-Reply-To: <20251103124727.4003872-1-sashal@kernel.org>
Message-ID: <2025110401-nugget-capsize-d2b6@gregkh>
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

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-192201-greg=kroah.com@vger.kernel.org Mon Nov  3 21:50:23 2025
From: Sasha Levin <sashal@kernel.org>
Date: Mon,  3 Nov 2025 07:47:27 -0500
Subject: drm/sysfb: Do not dereference NULL pointer in plane reset
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dan Carpenter <dan.carpenter@linaro.org>, Melissa Wen <melissa.srw@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20251103124727.4003872-1-sashal@kernel.org>

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
@@ -301,7 +301,11 @@ EXPORT_SYMBOL(drm_gem_destroy_shadow_pla
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

queue-6.6/bluetooth-hci-fix-tracking-of-advertisement-set-inst.patch
queue-6.6/cpuidle-governors-menu-select-polling-state-in-some-more-cases.patch
queue-6.6/drm-amd-pm-powerplay-smumgr-fix-pciebootlinklevel-va.patch
queue-6.6/wifi-ath10k-fix-memory-leak-on-unsupported-wmi-comma.patch
queue-6.6/s390-pci-restore-irq-unconditionally-for-the-zpci-device.patch
queue-6.6/asoc-fsl_sai-fix-bit-order-for-dsd-format.patch
queue-6.6/bluetooth-hci_core-fix-tracking-of-periodic-advertis.patch
queue-6.6/net-hns3-return-error-code-when-function-fails.patch
queue-6.6/mptcp-fix-msg_peek-stream-corruption.patch
queue-6.6/asoc-intel-avs-unprepare-a-stream-when-xrun-occurs.patch
queue-6.6/drm-etnaviv-fix-flush-sequence-logic.patch
queue-6.6/bluetooth-iso-fix-another-instance-of-dst_type-handl.patch
queue-6.6/s390-pci-avoid-deadlock-between-pci-error-recovery-and-mlx5-crdump.patch
queue-6.6/crypto-aspeed-acry-convert-to-platform-remove-callba.patch
queue-6.6/sfc-fix-potential-memory-leak-in-efx_mae_process_mpo.patch
queue-6.6/drm-msm-a6xx-fix-gmu-firmware-parser.patch
queue-6.6/cpuidle-governors-menu-rearrange-main-loop-in-menu_select.patch
queue-6.6/wifi-ath12k-free-skb-during-idr-cleanup-callback.patch
queue-6.6/bluetooth-hci_sync-fix-race-in-hci_cmd_sync_dequeue_.patch
queue-6.6/scsi-ufs-core-initialize-value-of-an-attribute-retur.patch
queue-6.6/bluetooth-btmtksdio-add-pmctrl-handling-for-bt-close.patch
queue-6.6/drm-sched-fix-race-in-drm_sched_entity_select_rq.patch
queue-6.6/bpf-sync-pending-irq-work-before-freeing-ring-buffer.patch
queue-6.6/alsa-usb-audio-fix-control-pipe-direction.patch
queue-6.6/drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
queue-6.6/drm-amd-pm-fix-smu-table-id-bound-check-issue-in-smu.patch
queue-6.6/drm-amd-pm-powerplay-smumgr-fix-pciebootlinklevel-va.patch-21603
queue-6.6/usbnet-prevents-free-active-kevent.patch
queue-6.6/bpf-do-not-audit-capability-check-in-do_jit.patch
queue-6.6/crypto-aspeed-fix-double-free-caused-by-devm.patch
queue-6.6/net-phy-dp83867-disable-eee-support-as-not-implemented.patch
queue-6.6/wifi-ath11k-add-missing-platform-ids-for-quirk-table.patch
queue-6.6/libbpf-fix-powerpc-s-stack-register-definition-in-bp.patch
