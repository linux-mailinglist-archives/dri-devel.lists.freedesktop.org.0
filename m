Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E9D045D3
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77B10E79B;
	Thu,  8 Jan 2026 16:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CnUzUomQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7610E79B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:28:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB73A43FDC;
 Thu,  8 Jan 2026 16:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426BBC116C6;
 Thu,  8 Jan 2026 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767889684;
 bh=cMtp4ViB5FOEFsKw6VEvjAT4jP16jiUTXjmmugUEzSM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=CnUzUomQgtd5dyKPSXwfypNaT/5xqp+5hbay9MMng6DDd2gm/smT0TDiCpfLH37Qy
 HJnITwpsPoUZCd9//M1ZOKpqZyKGT6t7MlX9NUvaxLizQQhAQf50RpDP9ZBOM+3DL+
 RqnhJS6xF3hEjbgxWTFMEqfQGIYfqqFqaEHosoGo=
Subject: Patch "drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()" has
 been added to the 5.10-stable tree
To: contact@stefanchrist.eu, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 patrik.r.jakobsson@gmail.com, sashal@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 17:27:37 +0100
In-Reply-To: <20260107162328.4079503-1-sashal@kernel.org>
Message-ID: <2026010837-implicate-shiny-c50d@gregkh>
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

    drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-gma500-remove-unused-helper-psb_fbdev_fb_setcolreg.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-206185-greg=kroah.com@vger.kernel.org Wed Jan  7 17:44:01 2026
From: Sasha Levin <sashal@kernel.org>
Date: Wed,  7 Jan 2026 11:23:28 -0500
Subject: drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Stefan Christ <contact@stefanchrist.eu>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20260107162328.4079503-1-sashal@kernel.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit be729f9de6c64240645dc80a24162ac4d3fe00a8 ]

Remove psb_fbdev_fb_setcolreg(), which hasn't been called in almost
a decade.

Gma500 commit 4d8d096e9ae8 ("gma500: introduce the framebuffer support
code") added the helper psb_fbdev_fb_setcolreg() for setting the fbdev
palette via fbdev's fb_setcolreg callback. Later
commit 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for
fb_ops") set several default helpers for fbdev emulation, including
fb_setcmap.

The fbdev subsystem always prefers fb_setcmap over fb_setcolreg. [1]
Hence, the gma500 code is no longer in use and gma500 has been using
drm_fb_helper_setcmap() for several years without issues.

Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops")
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Stefan Christ <contact@stefanchrist.eu>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.10+
Link: https://elixir.bootlin.com/linux/v6.16.9/source/drivers/video/fbdev/core/fbcmap.c#L246 # [1]
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Link: https://lore.kernel.org/r/20250929082338.18845-1-tzimmermann@suse.de
[ adapted file path from fbdev.c to framebuffer.c and removed fb_setcolreg from three fb_ops structures ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/gma500/framebuffer.c |   44 -----------------------------------
 1 file changed, 44 deletions(-)

--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -34,47 +34,6 @@ static const struct drm_framebuffer_func
 	.create_handle = drm_gem_fb_create_handle,
 };
 
-#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)) >> 16)
-
-static int psbfb_setcolreg(unsigned regno, unsigned red, unsigned green,
-			   unsigned blue, unsigned transp,
-			   struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	uint32_t v;
-
-	if (!fb)
-		return -ENOMEM;
-
-	if (regno > 255)
-		return 1;
-
-	red = CMAP_TOHW(red, info->var.red.length);
-	blue = CMAP_TOHW(blue, info->var.blue.length);
-	green = CMAP_TOHW(green, info->var.green.length);
-	transp = CMAP_TOHW(transp, info->var.transp.length);
-
-	v = (red << info->var.red.offset) |
-	    (green << info->var.green.offset) |
-	    (blue << info->var.blue.offset) |
-	    (transp << info->var.transp.offset);
-
-	if (regno < 16) {
-		switch (fb->format->cpp[0] * 8) {
-		case 16:
-			((uint32_t *) info->pseudo_palette)[regno] = v;
-			break;
-		case 24:
-		case 32:
-			((uint32_t *) info->pseudo_palette)[regno] = v;
-			break;
-		}
-	}
-
-	return 0;
-}
-
 static int psbfb_pan(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
@@ -167,7 +126,6 @@ static int psbfb_mmap(struct fb_info *in
 static const struct fb_ops psbfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = psbfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
@@ -178,7 +136,6 @@ static const struct fb_ops psbfb_ops = {
 static const struct fb_ops psbfb_roll_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
@@ -189,7 +146,6 @@ static const struct fb_ops psbfb_roll_op
 static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.10/usb-fix-descriptor-count-when-handling-invalid-mbim-.patch
queue-5.10/net-dsa-b53-skip-multicast-entries-for-fdb_dump.patch
queue-5.10/ipmi-fix-the-race-between-__scan_channels-and-delive.patch
queue-5.10/nfsv4-pnfs-clear-nfs_ino_layoutcommit-in-pnfs_mark_l.patch
queue-5.10/iio-imu-st_lsm6dsx-introduce-st_lsm6dsx_device_set_e.patch
queue-5.10/macintosh-mac_hid-fix-race-condition-in-mac_hid_togg.patch
queue-5.10/vhost-vsock-improve-rcu-read-sections-around-vhost_v.patch
queue-5.10/dma-pool-eliminate-alloc_pages-warning-in-atomic_poo.patch
queue-5.10/mfd-mt6397-irq-fix-missing-irq_domain_remove-in-erro.patch
queue-5.10/platform-x86-ibm_rtl-fix-ebda-signature-search-point.patch
queue-5.10/acpi-property-fix-fwnode-refcount-leak-in-acpi_fwnod.patch
queue-5.10/power-supply-apm_power-only-unset-own-apm_get_power_.patch
queue-5.10/xhci-dbgtty-fix-device-unregister.patch
queue-5.10/mlxsw-spectrum_mr-fix-use-after-free-when-updating-m.patch
queue-5.10/alsa-vxpocket-fix-resource-leak-in-vxpocket_probe-er.patch
queue-5.10/revert-nfs-clear-sb_rdonly-before-getting-superblock.patch
queue-5.10/usb-gadget-udc-fix-use-after-free-in-usb_gadget_state_work.patch
queue-5.10/crypto-ccree-correctly-handle-return-of-sg_nents_for.patch
queue-5.10/firmware-imx-scu-irq-fix-of-node-leak-in.patch
queue-5.10/efi-cper-align-arm-cper-type-with-uefi-2.9a-2.10-spe.patch
queue-5.10/usb-chaoskey-fix-locking-for-o_nonblock.patch
queue-5.10/arm-9464-1-fix-input-only-operand-modification-in-lo.patch
queue-5.10/block-fix-comment-for-op_is_zone_mgmt-to-include-res.patch
queue-5.10/nfs-don-t-unhash-dentry-during-unlink-rename.patch
queue-5.10/nfs-avoid-changing-nlink-when-file-removes-and-attri.patch
queue-5.10/rdma-bnxt_re-fix-ib_send_ip_csum-handling-in-post_se.patch
queue-5.10/hwmon-replace-snprintf-in-show-functions-with-sysfs_emit.patch
queue-5.10/fbdev-ssd1307fb-fix-potential-page-leak-in-ssd1307fb.patch
queue-5.10/mips-fix-a-reference-leak-bug-in-ip22_check_gio.patch
queue-5.10/rdma-bnxt_re-fix-dma_free_coherent-pointer.patch
queue-5.10/rdma-efa-remove-possible-negative-shift.patch
queue-5.10/rdma-rtrs-server-fix-error-handling-in-get_or_create.patch
queue-5.10/platform-x86-huawei-wmi-add-keys-for-honor-models.patch
queue-5.10/net-ethtool-ioctl-remove-if-n_stats-checks-from-etht.patch
queue-5.10/virtio-fix-virtqueue_set_affinity-docs.patch
queue-5.10/pwm-bcm2835-support-apply-function-for-atomic-config.patch
queue-5.10/fs_context-drop-the-unused-lsm_flags-member.patch
queue-5.10/firewire-nosy-switch-from-pci_-to-dma_-api.patch
queue-5.10/nfs-automounted-filesystems-should-inherit-ro-noexec.patch
queue-5.10/alsa-uapi-fix-typo-in-asound.h-comment.patch
queue-5.10/hfsplus-fix-missing-hfs_bnode_get-in-__hfs_bnode_cre.patch
queue-5.10/block-rnbd-clt-fix-signedness-bug-in-init_dev.patch
queue-5.10/compiler-gcc.h-define-__sanitize_address__-under-hwa.patch
queue-5.10/net-mlx5-fw_tracer-handle-escaped-percent-properly.patch
queue-5.10/xfrm-also-call-xfrm_state_delete_tunnel-at-destroy-t.patch
queue-5.10/spi-xilinx-increase-number-of-retries-before-declari.patch
queue-5.10/usb-raw-gadget-cap-raw_io-transfer-length-to-kmalloc.patch
queue-5.10/backlight-led-bl-add-devlink-to-supplier-leds.patch
queue-5.10/asoc-stm-use-dev_err_probe-helper.patch
queue-5.10/perf-x86-intel-correct-large-pebs-flag-check.patch
queue-5.10/media-vpif_capture-fix-section-mismatch.patch
queue-5.10/revert-xfrm-destroy-xfrm_state-synchronously-on-net-.patch
queue-5.10/netrom-fix-memory-leak-in-nr_sendmsg.patch
queue-5.10/block-rnbd-remove-a-useless-mutex.patch
queue-5.10/firewire-nosy-fix-dma_free_coherent-size.patch
queue-5.10/via_wdt-fix-critical-boot-hang-due-to-unnamed-resour.patch
queue-5.10/iio-imu-st_lsm6dsx-fix-measurement-unit-for-odr-stru.patch
queue-5.10/crypto-af_alg-zero-initialize-memory-allocated-via-sock_kmalloc.patch
queue-5.10/leds-lp50xx-get-rid-of-redundant-check-in-lp50xx_enable_disable.patch
queue-5.10/iommu-arm-smmu-qcom-enable-use-of-all-smr-groups-whe.patch
queue-5.10/cpufreq-s5pv210-fix-refcount-leak.patch
queue-5.10/xfrm-delete-x-tunnel-as-we-delete-x.patch
queue-5.10/mfd-da9055-fix-missing-regmap_del_irq_chip-in-error-.patch
queue-5.10/net-openvswitch-avoid-needlessly-taking-the-rtnl-on-.patch
queue-5.10/net-sched-ets-remove-drr-class-from-the-active-list-.patch
queue-5.10/ipvs-fix-ipv4-null-ptr-deref-in-route-error-path.patch
queue-5.10/crypto-asymmetric_keys-prevent-overflow-in-asymmetri.patch
queue-5.10/i40e-fix-scheduling-in-set_rx_mode.patch
queue-5.10/btrfs-fix-memory-leak-of-fs_devices-in-degraded-seed.patch
queue-5.10/mtd-lpddr_cmds-fix-signed-shifts-in-lpddr_cmds.patch
queue-5.10/net-rose-fix-invalid-array-index-in-rose_kill_by_dev.patch
queue-5.10/nbd-partition-nbd_read_stat-into-nbd_read_reply-and-.patch
queue-5.10/net-hns3-using-the-num_tqps-in-the-vf-driver-to-appl.patch
queue-5.10/perf-tools-fix-split-kallsyms-dso-counting.patch
queue-5.10/nfc-pn533-fix-error-code-in-pn533_acr122_poweron_rdr.patch
queue-5.10/platform-x86-asus-wmi-use-brightness_set_blocking-fo.patch
queue-5.10/usb-dwc2-fix-hang-during-suspend-if-set-as-periphera.patch
queue-5.10/x86-dumpstack-prevent-kasan-false-positive-warnings-.patch
queue-5.10/inet-avoid-ehash-lookup-race-in-inet_ehash_insert.patch
queue-5.10/selftests-bpf-improve-reliability-of-test_perf_branc.patch
queue-5.10/power-supply-wm831x-check-wm831x_set_bits-return-val.patch
queue-5.10/net-bridge-describe-tunnel_hash-member-in-net_bridge.patch
queue-5.10/pci-brcmstb-fix-disabling-l0s-capability.patch
queue-5.10/ocfs2-fix-memory-leak-in-ocfs2_merge_rec_left.patch
queue-5.10/alsa-usb-mixer-us16x08-validate-meter-packet-indices.patch
queue-5.10/selftests-bpf-fix-failure-paths-in-send_signal-test.patch
queue-5.10/alsa-wavefront-fix-integer-overflow-in-sample-size-validation.patch
queue-5.10/btrfs-don-t-rewrite-ret-from-inode_permission.patch
queue-5.10/octeontx2-pf-fix-ubsan-shift-out-of-bounds-error.patch
queue-5.10/i3c-master-inherit-dma-masks-and-parameters-from-par.patch
queue-5.10/pmdomain-use-device_get_match_data.patch
queue-5.10/iavf-fix-off-by-one-issues-in-iavf_config_rss_reg.patch
queue-5.10/rculist-add-hlist_nulls_replace_rcu-and-hlist_nulls_.patch
queue-5.10/usb-dwc2-fix-hang-during-shutdown-if-set-as-peripher.patch
queue-5.10/netfilter-nf_conncount-reduce-unnecessary-gc.patch
queue-5.10/dm-log-writes-add-missing-set_freezable-for-freezabl.patch
queue-5.10/asoc-stm32-sai-fix-clk-prepare-imbalance-on-probe-failure.patch
queue-5.10/nfs-fix-open-coded-versions-of-nfs_set_cache_invalid.patch
queue-5.10/usb-xhci-limit-run_graceperiod-for-only-usb-3.0-devi.patch
queue-5.10/iommu-qcom-fix-device-leak-on-of_xlate.patch
queue-5.10/asoc-ak5558-disable-regulator-when-error-happens.patch
queue-5.10/i3c-remove-i2c-board-info-from-i2c_dev_desc.patch
queue-5.10/drm-gma500-remove-unused-helper-psb_fbdev_fb_setcolreg.patch
queue-5.10/asoc-ak4458-disable-regulator-when-error-happens.patch
queue-5.10/smack-fix-bug-unprivileged-task-can-create-labels.patch
queue-5.10/ima-handle-error-code-returned-by-ima_filter_rule_ma.patch
queue-5.10/genalloc.h-fix-htmldocs-warning.patch
queue-5.10/s390-ap-don-t-leak-debug-feature-files-if-ap-instruc.patch
queue-5.10/netfilter-nft_connlimit-update-the-count-if-add-was-.patch
queue-5.10/acpi-property-use-acpi-functions-in-acpi_graph_get_n.patch
queue-5.10/broadcom-b44-prevent-uninitialized-value-usage.patch
queue-5.10/serial-sprd-return-eprobe_defer-when-uart-clock-is-n.patch
queue-5.10/usb-typec-ucsi-handle-incorrect-num_connectors-capab.patch
queue-5.10/drm-amd-display-fix-logical-vs-bitwise-bug-in-get_em.patch
queue-5.10/sunrpc-svcauth_gss-avoid-null-deref-on-zero-length-gss_token-in-gss_read_proxy_verf.patch
queue-5.10/x86-dumpstack-make-show_trace_log_lvl-static.patch
queue-5.10/nfsd-nfsv4-file-creation-neglects-setting-acl.patch
queue-5.10/rdma-core-fix-kasan-slab-use-after-free-read-in-ib_register_device-problem.patch
queue-5.10/netfilter-nft_connlimit-move-stateful-fields-out-of-.patch
queue-5.10/net-mlx5-fw_tracer-validate-format-string-parameters.patch
queue-5.10/backlight-led_bl-take-led_access-lock-when-required.patch
queue-5.10/ext4-remove-unused-return-value-of-__mb_check_buddy.patch
queue-5.10/soc-renesas-r9a06g032-sysctrl-handle-h2mode-setting-.patch
queue-5.10/mlxsw-spectrum_router-fix-neighbour-use-after-free.patch
queue-5.10/xfs-fix-a-memory-leak-in-xfs_buf_item_init.patch
queue-5.10/jbd2-fix-the-inconsistency-between-checksum-and-data-in-memory-for-journal-sb.patch
queue-5.10/nvme-fc-don-t-hold-rport-lock-when-putting-ctrl.patch
queue-5.10/efi-cper-adjust-infopfx-size-to-accept-an-extra-spac.patch
queue-5.10/arm-dts-microchip-sama5d2-fix-spi-flexcom-fifo-size-to-32.patch
queue-5.10/firmware-imx-scu-irq-init-workqueue-before-request-m.patch
queue-5.10/net-hns3-add-vlan-id-validation-before-using.patch
queue-5.10/usb-dwc3-keep-susphy-enabled-during-exit-to-avoid-controller-faults.patch
queue-5.10/rdma-core-fix-logic-error-in-ib_get_gids_from_rdma_h.patch
queue-5.10/wifi-ieee80211-correct-fils-status-codes.patch
queue-5.10/nfsd-blocklayout-fix-minlength-check-in-proc_layoutg.patch
queue-5.10/f2fs-fix-to-avoid-updating-zero-sized-extent-in-extent-cache.patch
queue-5.10/crypto-seqiv-do-not-use-req-iv-after-crypto_aead_enc.patch
queue-5.10/tpm-cap-the-number-of-pcr-banks.patch
queue-5.10/usb-dwc2-disable-platform-lowlevel-hw-resources-duri.patch
queue-5.10/acpi-processor_core-fix-map_x2apic_id-for-amd-pstate.patch
queue-5.10/nfs-clean-up-function-nfs_mark_dir_for_revalidate.patch
queue-5.10/cpufreq-scmi-fix-null-ptr-deref-in-scmi_cpufreq_get_rate.patch
queue-5.10/scsi-sim710-fix-resource-leak-by-adding-missing-iopo.patch
queue-5.10/drm-vmwgfx-fix-a-null-ptr-access-in-the-cursor-snooper.patch
queue-5.10/blk-mq-abort-suspend-when-wakeup-events-are-pending.patch
queue-5.10/acpica-avoid-walking-the-namespace-if-start_node-is-.patch
queue-5.10/bpf-arm64-do-not-audit-capability-check-in-do_jit.patch
queue-5.10/exfat-fix-remount-failure-in-different-process-envir.patch
queue-5.10/hfsplus-verify-inode-mode-when-loading-from-disk.patch
queue-5.10/net-openvswitch-fix-middle-attribute-validation-in-p.patch
queue-5.10/pwm-bcm2835-make-sure-the-channel-is-enabled-after-p.patch
queue-5.10/mfd-mt6358-irq-fix-missing-irq_domain_remove-in-erro.patch
queue-5.10/regulator-core-protect-regulator_supply_alias_list-w.patch
queue-5.10/pci-dwc-fix-wrong-port_logic_ltssm_state_mask-defini.patch
queue-5.10/powerpc-64s-ptdump-fix-kernel_hash_pagetable-dump-fo.patch
queue-5.10/leds-netxbig-fix-gpio-descriptor-leak-in-error-paths.patch
queue-5.10/wifi-rtl818x-fix-potential-memory-leaks-in-rtl8180_i.patch
queue-5.10/rdma-bnxt_re-fix-incorrect-bar-check-in-bnxt_qplib_m.patch
queue-5.10/nbd-defer-config-unlock-in-nbd_genl_connect.patch
queue-5.10/mm-balloon_compaction-we-cannot-have-isolated-pages-in-the-balloon-list.patch
queue-5.10/hwmon-max16065-use-local-variable-to-avoid-toctou.patch
queue-5.10/powerpc-pseries-cmm-call-balloon_devinfo_init-also-without-config_balloon_compaction.patch
queue-5.10/f2fs-fix-to-propagate-error-from-f2fs_enable_checkpoint.patch
queue-5.10/drm-vgem-fence-fix-potential-deadlock-on-release.patch
queue-5.10/nbd-clean-up-return-value-checking-of-sock_xmit.patch
queue-5.10/f2fs-fix-to-detect-recoverable-inode-during-dryrun-of-find_fsync_dnodes.patch
queue-5.10/net-usb-rtl8150-fix-memory-leak-on-usb_submit_urb-fa.patch
queue-5.10/spi-imx-keep-dma-request-disabled-before-dma-transfe.patch
queue-5.10/wifi-rtl818x-rtl8187-fix-potential-buffer-underflow-.patch
queue-5.10/ti-sysc-allow-omap2-and-omap4-timers-to-be-reserved-.patch
queue-5.10/caif-fix-integer-underflow-in-cffrml_receive.patch
queue-5.10/i3c-support-dynamically-added-i2c-devices.patch
queue-5.10/ext4-correct-the-checking-of-quota-files-before-movi.patch
queue-5.10/powerpc-pseries-cmm-adjust-balloon_migrate-when-migrating-pages.patch
queue-5.10/usbip-fix-locking-bug-in-rt-enabled-kernels.patch
queue-5.10/scsi-qla2xxx-use-reinit_completion-on-mbx_intr_comp.patch
queue-5.10/nbd-defer-config-put-in-recv_work.patch
queue-5.10/block-rnbd-clt-fix-leaked-id-in-init_dev.patch
queue-5.10/media-samsung-exynos4-is-fix-potential-abba-deadlock-on-init.patch
queue-5.10/staging-fbtft-core-fix-potential-memory-leak-in-fbtf.patch
queue-5.10/asoc-bcm-bcm63xx-pcm-whistler-check-return-value-of-.patch
queue-5.10/lockd-fix-vfs_test_lock-calls.patch
queue-5.10/soc-rockchip-power-domain-manage-resource-conflicts-with-firmware.patch
queue-5.10/hwmon-ibmpex-fix-use-after-free-in-high-low-store.patch
queue-5.10/drm-panel-visionox-rm69299-don-t-clear-all-mode-flag.patch
queue-5.10/s390-smp-fix-fallback-cpu-detection.patch
queue-5.10/ext4-minor-defrag-code-improvements.patch
queue-5.10/efi-cper-add-a-new-helper-function-to-print-bitmasks.patch
queue-5.10/ext4-improve-integrity-checking-in-__mb_check_buddy-.patch
queue-5.10/media-mediatek-vcodec-fix-a-reference-leak-in-mtk_vcodec_fw_vpu_init.patch
queue-5.10/nfsd-clear-seclabel-in-the-suppattr_exclcreat-bitmap.patch
queue-5.10/scsi-qla2xxx-fix-initiator-mode-with-qlini_mode-excl.patch
queue-5.10/clk-mvebu-cp110-add-clk_ignore_unused-to-pcie_x10-pc.patch
queue-5.10/scsi-target-do-not-write-nul-characters-into-ascii-c.patch
queue-5.10/asoc-stm32-sai-use-the-devm_clk_get_optional-helper.patch
queue-5.10/net-mlx5-fw_tracer-add-support-for-unrecognized-stri.patch
queue-5.10/powerpc-64s-slb-fix-slb-multihit-issue-during-slb-preload.patch
queue-5.10/x86-ptrace-always-inline-trivial-accessors.patch
queue-5.10/xfrm-flush-all-states-in-xfrm_state_fini.patch
queue-5.10/net-sched-sch_cake-fix-incorrect-qlen-reduction-in-c.patch
queue-5.10/watchdog-wdat_wdt-fix-acpi-table-leak-in-probe-funct.patch
queue-5.10/ocfs2-relax-bug-to-ocfs2_error-in-__ocfs2_move_exten.patch
queue-5.10/netfilter-nf_conncount-fix-leaked-ct-in-error-paths.patch
queue-5.10/backlight-lp855x-fix-lp855x.h-kernel-doc-warnings.patch
queue-5.10/ipmi-fix-__scan_channels-failing-to-rescan-channels.patch
queue-5.10/fs-nls-fix-inconsistency-between-utf8_to_utf32-and-u.patch
queue-5.10/leds-lp50xx-remove-duplicated-error-reporting-in-.remove.patch
queue-5.10/usb-ohci-nxp-fix-device-leak-on-probe-failure.patch
queue-5.10/net-ethtool-ioctl-split-ethtool_get_phy_stats-into-m.patch
queue-5.10/btrfs-scrub-always-update-btrfs_scrub_progress-last_.patch
queue-5.10/hfsplus-fix-volume-corruption-issue-for-generic-073.patch
queue-5.10/reset-fix-bit-macro-reference.patch
queue-5.10/ipv6-bug-in-pskb_expand_head-as-part-of-calipso_skbu.patch
queue-5.10/wifi-mac80211-discard-beacon-frames-to-non-broadcast-address.patch
queue-5.10/kmsan-introduce-__no_sanitize_memory-and-__no_kmsan_.patch
queue-5.10/i3c-fix-refcount-inconsistency-in-i3c_master_registe.patch
queue-5.10/wifi-cw1200-fix-potential-memory-leak-in-cw1200_bh_r.patch
queue-5.10/hfsplus-fix-volume-corruption-issue-for-generic-070.patch
queue-5.10/platform-x86-acer-wmi-ignore-backlight-event.patch
queue-5.10/ipvlan-ignore-packet_loopback-in-handle_mode_l2.patch
queue-5.10/revert-nfs-ignore-sb_rdonly-when-mounting-nfs.patch
queue-5.10/pinctrl-single-fix-pin_config_bias_disable-handling.patch
queue-5.10/ipv4-fix-reference-count-leak-when-using-error-route.patch
queue-5.10/fs-nls-fix-utf16-to-utf8-conversion.patch
queue-5.10/nfs-label-the-dentry-with-a-verifier-in-nfs_rmdir-an.patch
queue-5.10/regulator-core-disable-supply-if-enabling-main-regul.patch
queue-5.10/powerpc-addnote-fix-overflow-on-32-bit-builds.patch
queue-5.10/scsi-stex-fix-reboot_notifier-leak-in-probe-error-pa.patch
queue-5.10/usb-ohci-nxp-use-helper-function-devm_clk_get_enabled.patch
queue-5.10/netfilter-nf_conncount-rework-api-to-use-sk_buff-dir.patch
queue-5.10/net-sched-ets-always-remove-class-from-active-list-b.patch
queue-5.10/clk-renesas-r9a06g032-export-function-to-set-dmamux.patch
queue-5.10/block-rnbd-clt-fix-wrong-max-id-in-ida_alloc_max.patch
queue-5.10/dm-raid-fix-possible-null-dereference-with-undefined.patch
queue-5.10/media-renesas-rcar_drif-fix-device-node-reference-leak-in-rcar_drif_bond_enabled.patch
queue-5.10/selftests-ftrace-traceonoff_triggers-strip-off-names.patch
queue-5.10/net-mdio-aspeed-move-reg-accessing-part-into-separat.patch
queue-5.10/mm-balloon_compaction-convert-balloon_page_delete-to-balloon_page_finalize.patch
queue-5.10/platform-x86-msi-laptop-add-missing-sysfs_remove_gro.patch
queue-5.10/rdma-bnxt_re-fix-to-use-correct-page-size-for-pde-ta.patch
queue-5.10/ip6_gre-make-ip6gre_header-robust.patch
queue-5.10/pinctrl-stm32-fix-hwspinlock-resource-leak-in-probe-.patch
queue-5.10/irqchip-qcom-irq-combiner-fix-section-mismatch.patch
queue-5.10/ethtool-use-phydev-variable.patch
queue-5.10/mm-balloon_compaction-make-balloon-page-compaction-callbacks-static.patch
queue-5.10/revert-nfs-ignore-sb_rdonly-when-remounting-nfs.patch
queue-5.10/ethtool-avoid-overflowing-userspace-buffer-on-stats-.patch
queue-5.10/bluetooth-btusb-add-new-vid-pid-13d3-3533-for-rtl882.patch
queue-5.10/samples-work-around-glibc-redefining-some-of-our-def.patch
queue-5.10/lib-vsprintf-check-pointer-before-dereferencing-in-t.patch
queue-5.10/leds-leds-lp50xx-enable-chip-before-any-communication.patch
queue-5.10/team-fix-check-for-port-enabled-in-team_queue_overri.patch
queue-5.10/usb-usb-storage-no-additional-quirks-need-to-be-adde.patch
queue-5.10/bfs-reconstruct-file-type-when-loading-from-disk.patch
queue-5.10/ext4-fix-string-copying-in-parse_apply_sb_mount_options.patch
queue-5.10/livepatch-match-old_sympos-0-and-1-in-klp_find_func.patch
queue-5.10/alsa-pcmcia-fix-resource-leak-in-snd_pdacf_probe-err.patch
queue-5.10/watchdog-wdat_wdt-stop-watchdog-when-uninstalling-mo.patch
queue-5.10/leds-lp50xx-reduce-level-of-dereferences.patch
queue-5.10/clk-renesas-r9a06g032-fix-memory-leak-in-error-path.patch
queue-5.10/f2fs-use-global-inline_xattr_slab-instead-of-per-sb-slab-cache.patch
queue-5.10/x86-kmsan-don-t-instrument-stack-walking-functions.patch
queue-5.10/i3c-allow-of-alias-based-persistent-bus-numbering.patch
queue-5.10/mptcp-pm-ignore-unknown-endpoint-flags.patch
queue-5.10/net-mdio-aspeed-add-dummy-read-to-avoid-read-after-w.patch
queue-5.10/alsa-wavefront-clear-substream-pointers-on-close.patch
queue-5.10/pci-keystone-exit-ks_pcie_probe-for-invalid-mode.patch
queue-5.10/pinctrl-qcom-msm-fix-deadlock-in-pinmux-configuratio.patch
queue-5.10/pinctrl-single-fix-incorrect-type-for-error-return-v.patch
queue-5.10/iio-imu-st_lsm6dsx-discard-samples-during-filters-se.patch
queue-5.10/pmdomain-imx-fix-reference-count-leak-in-imx_gpc_probe.patch
