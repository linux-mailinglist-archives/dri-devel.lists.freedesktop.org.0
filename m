Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB4D03324
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5283D10E71C;
	Thu,  8 Jan 2026 13:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OV+EWmQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCE210E71C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:57:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3D5243EDE;
 Thu,  8 Jan 2026 13:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F9EC116C6;
 Thu,  8 Jan 2026 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767880642;
 bh=50rVGuqgNf8Zn+RSEUBaCPDGWGD7XpJfjE/a6vsB3eU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=OV+EWmQjLC3T1/C6K6I1tP7Ir6eC+bchtZ9pzsPJsmGFqWNqH3CbjVRxTdPFRARfS
 vS0qo27CnykleDhKzRa1OOc9x4UIBpFGaef1stLZ0VVDuR/ViEGXmxwhdnBtHsxxb2
 VTLXixdT1GzYOoEQlz31ZXu8VG0Uk/oL8mHlbxwM=
Subject: Patch "drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()" has
 been added to the 5.15-stable tree
To: contact@stefanchrist.eu, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 patrik.r.jakobsson@gmail.com, sashal@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 14:56:28 +0100
In-Reply-To: <20260107155733.4065165-1-sashal@kernel.org>
Message-ID: <2026010828-outrage-prankster-f7de@gregkh>
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

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-gma500-remove-unused-helper-psb_fbdev_fb_setcolreg.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-206177-greg=kroah.com@vger.kernel.org Wed Jan  7 17:12:48 2026
From: Sasha Levin <sashal@kernel.org>
Date: Wed,  7 Jan 2026 10:57:33 -0500
Subject: drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Stefan Christ <contact@stefanchrist.eu>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20260107155733.4065165-1-sashal@kernel.org>

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
[ adapted patch from fbdev.c to framebuffer.c where the function was named psbfb_setcolreg() instead of psb_fbdev_fb_setcolreg() ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/gma500/framebuffer.c |   42 -----------------------------------
 1 file changed, 42 deletions(-)

--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -35,47 +35,6 @@ static const struct drm_framebuffer_func
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
 static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -147,7 +106,6 @@ static int psbfb_mmap(struct fb_info *in
 static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.15/netfilter-flowtable-check-for-maximum-number-of-enca.patch
queue-5.15/dt-bindings-pci-amlogic-fix-the-register-name-of-the.patch
queue-5.15/usb-fix-descriptor-count-when-handling-invalid-mbim-.patch
queue-5.15/net-dsa-b53-skip-multicast-entries-for-fdb_dump.patch
queue-5.15/ipmi-fix-the-race-between-__scan_channels-and-delive.patch
queue-5.15/nfsv4-pnfs-clear-nfs_ino_layoutcommit-in-pnfs_mark_l.patch
queue-5.15/iio-imu-st_lsm6dsx-introduce-st_lsm6dsx_device_set_e.patch
queue-5.15/macintosh-mac_hid-fix-race-condition-in-mac_hid_togg.patch
queue-5.15/vhost-vsock-improve-rcu-read-sections-around-vhost_v.patch
queue-5.15/alsa-wavefront-use-standard-print-api.patch
queue-5.15/dma-pool-eliminate-alloc_pages-warning-in-atomic_poo.patch
queue-5.15/mfd-mt6397-irq-fix-missing-irq_domain_remove-in-erro.patch
queue-5.15/hid-elecom-add-support-for-elecom-m-xt3urbk-018f.patch
queue-5.15/nfs-fix-the-verifier-for-case-sensitive-filesystem-i.patch
queue-5.15/fs-ntfs3-remove-unused-mi_mark_free.patch
queue-5.15/platform-x86-ibm_rtl-fix-ebda-signature-search-point.patch
queue-5.15/acpi-property-fix-fwnode-refcount-leak-in-acpi_fwnod.patch
queue-5.15/power-supply-apm_power-only-unset-own-apm_get_power_.patch
queue-5.15/xhci-dbgtty-fix-device-unregister.patch
queue-5.15/nfsv4-add-some-support-for-case-insensitive-filesyst.patch
queue-5.15/mlxsw-spectrum_mr-fix-use-after-free-when-updating-m.patch
queue-5.15/alsa-vxpocket-fix-resource-leak-in-vxpocket_probe-er.patch
queue-5.15/bluetooth-btusb-revert-use-of-devm_kzalloc-in-btusb.patch
queue-5.15/revert-nfs-clear-sb_rdonly-before-getting-superblock.patch
queue-5.15/drm-mediatek-fix-ccorr-mtk_ctm_s31_32_to_s1_n-functi.patch
queue-5.15/asoc-fsl_xcvr-add-counter-registers.patch
queue-5.15/i40e-refactor-argument-of-i40e_detect_recover_hung.patch
queue-5.15/usb-gadget-udc-fix-use-after-free-in-usb_gadget_state_work.patch
queue-5.15/crypto-ccree-correctly-handle-return-of-sg_nents_for.patch
queue-5.15/firmware-imx-scu-irq-fix-of-node-leak-in.patch
queue-5.15/fs-ntfs3-prevent-memory-leaks-in-add-sub-record.patch
queue-5.15/efi-cper-align-arm-cper-type-with-uefi-2.9a-2.10-spe.patch
queue-5.15/usb-chaoskey-fix-locking-for-o_nonblock.patch
queue-5.15/arm-9464-1-fix-input-only-operand-modification-in-lo.patch
queue-5.15/block-fix-comment-for-op_is_zone_mgmt-to-include-res.patch
queue-5.15/nfs-don-t-unhash-dentry-during-unlink-rename.patch
queue-5.15/nfs-avoid-changing-nlink-when-file-removes-and-attri.patch
queue-5.15/rdma-bnxt_re-fix-ib_send_ip_csum-handling-in-post_se.patch
queue-5.15/coresight-etm4x-extract-the-trace-unit-controlling.patch
queue-5.15/i3c-master-svc-prevent-incomplete-ibi-transaction.patch
queue-5.15/fbdev-ssd1307fb-fix-potential-page-leak-in-ssd1307fb.patch
queue-5.15/rdma-bnxt_re-fix-dma_free_coherent-pointer.patch
queue-5.15/rdma-efa-remove-possible-negative-shift.patch
queue-5.15/kvm-svm-mark-vmcb_npt-as-dirty-on-nested-vmrun.patch
queue-5.15/rdma-rtrs-server-fix-error-handling-in-get_or_create.patch
queue-5.15/platform-x86-huawei-wmi-add-keys-for-honor-models.patch
queue-5.15/net-ethtool-ioctl-remove-if-n_stats-checks-from-etht.patch
queue-5.15/virtio-fix-virtqueue_set_affinity-docs.patch
queue-5.15/fs_context-drop-the-unused-lsm_flags-member.patch
queue-5.15/rdma-irdma-fix-data-race-in-irdma_sc_ccq_arm.patch
queue-5.15/nfs-automounted-filesystems-should-inherit-ro-noexec.patch
queue-5.15/alsa-uapi-fix-typo-in-asound.h-comment.patch
queue-5.15/hfsplus-fix-missing-hfs_bnode_get-in-__hfs_bnode_cre.patch
queue-5.15/compiler-gcc.h-define-__sanitize_address__-under-hwa.patch
queue-5.15/fs-ntfs3-support-timestamps-prior-to-epoch.patch
queue-5.15/net-mlx5-fw_tracer-handle-escaped-percent-properly.patch
queue-5.15/vdpa-introduce-and-use-vdpa-device-get-set-config-he.patch
queue-5.15/xfrm-also-call-xfrm_state_delete_tunnel-at-destroy-t.patch
queue-5.15/spi-xilinx-increase-number-of-retries-before-declari.patch
queue-5.15/usb-raw-gadget-cap-raw_io-transfer-length-to-kmalloc.patch
queue-5.15/arm64-dts-imx8mm-venice-gw72xx-remove-unused-sdhc1-p.patch
queue-5.15/backlight-led-bl-add-devlink-to-supplier-leds.patch
queue-5.15/ntfs3-fix-uninit-memory-after-failed-mi_read-in-mi_f.patch
queue-5.15/asoc-stm-use-dev_err_probe-helper.patch
queue-5.15/perf-x86-intel-correct-large-pebs-flag-check.patch
queue-5.15/media-vpif_capture-fix-section-mismatch.patch
queue-5.15/revert-xfrm-destroy-xfrm_state-synchronously-on-net-.patch
queue-5.15/netrom-fix-memory-leak-in-nr_sendmsg.patch
queue-5.15/firewire-nosy-fix-dma_free_coherent-size.patch
queue-5.15/via_wdt-fix-critical-boot-hang-due-to-unnamed-resour.patch
queue-5.15/iio-imu-st_lsm6dsx-fix-measurement-unit-for-odr-stru.patch
queue-5.15/crypto-af_alg-zero-initialize-memory-allocated-via-sock_kmalloc.patch
queue-5.15/scsi-qla2xxx-fix-lost-interrupts-with-qlini_mode-dis.patch
queue-5.15/iommu-arm-smmu-qcom-enable-use-of-all-smr-groups-whe.patch
queue-5.15/cpufreq-s5pv210-fix-refcount-leak.patch
queue-5.15/xfrm-delete-x-tunnel-as-we-delete-x.patch
queue-5.15/mfd-da9055-fix-missing-regmap_del_irq_chip-in-error-.patch
queue-5.15/nfs-initialise-verifiers-for-visible-dentries-in-nfs.patch
queue-5.15/net-openvswitch-avoid-needlessly-taking-the-rtnl-on-.patch
queue-5.15/net-sched-ets-remove-drr-class-from-the-active-list-.patch
queue-5.15/leds-replace-all-non-returning-strlcpy-with-strscpy.patch
queue-5.15/coresight-etm4x-add-context-synchronization-before-e.patch
queue-5.15/dpaa2-mac-bail-if-the-dpmacs-fwnode-is-not-found.patch
queue-5.15/ipvs-fix-ipv4-null-ptr-deref-in-route-error-path.patch
queue-5.15/crypto-asymmetric_keys-prevent-overflow-in-asymmetri.patch
queue-5.15/i40e-fix-scheduling-in-set_rx_mode.patch
queue-5.15/btrfs-fix-memory-leak-of-fs_devices-in-degraded-seed.patch
queue-5.15/mtd-lpddr_cmds-fix-signed-shifts-in-lpddr_cmds.patch
queue-5.15/net-rose-fix-invalid-array-index-in-rose_kill_by_dev.patch
queue-5.15/nbd-partition-nbd_read_stat-into-nbd_read_reply-and-.patch
queue-5.15/net-hns3-using-the-num_tqps-in-the-vf-driver-to-appl.patch
queue-5.15/perf-tools-fix-split-kallsyms-dso-counting.patch
queue-5.15/nfc-pn533-fix-error-code-in-pn533_acr122_poweron_rdr.patch
queue-5.15/platform-x86-asus-wmi-use-brightness_set_blocking-fo.patch
queue-5.15/usb-dwc2-fix-hang-during-suspend-if-set-as-periphera.patch
queue-5.15/x86-dumpstack-prevent-kasan-false-positive-warnings-.patch
queue-5.15/inet-avoid-ehash-lookup-race-in-inet_ehash_insert.patch
queue-5.15/selftests-bpf-improve-reliability-of-test_perf_branc.patch
queue-5.15/power-supply-wm831x-check-wm831x_set_bits-return-val.patch
queue-5.15/net-bridge-describe-tunnel_hash-member-in-net_bridge.patch
queue-5.15/dt-bindings-pci-convert-amlogic-meson-pcie.txt-to-dt.patch
queue-5.15/pci-brcmstb-fix-disabling-l0s-capability.patch
queue-5.15/sched-deadline-only-set-free_cpus-for-online-runqueu.patch
queue-5.15/kvm-nvmx-immediately-refresh-apicv-controls-as-needed-on-nested-vm-exit.patch
queue-5.15/vdpa-sync-calls-set-get-config-status-with-cf_mutex.patch
queue-5.15/ocfs2-fix-memory-leak-in-ocfs2_merge_rec_left.patch
queue-5.15/alsa-usb-mixer-us16x08-validate-meter-packet-indices.patch
queue-5.15/selftests-bpf-fix-failure-paths-in-send_signal-test.patch
queue-5.15/alsa-wavefront-fix-integer-overflow-in-sample-size-validation.patch
queue-5.15/fuse-fix-readahead-reclaim-deadlock.patch
queue-5.15/r8169-fix-rtl8117-wake-on-lan-in-dash-mode.patch
queue-5.15/btrfs-don-t-rewrite-ret-from-inode_permission.patch
queue-5.15/octeontx2-pf-fix-ubsan-shift-out-of-bounds-error.patch
queue-5.15/i3c-master-inherit-dma-masks-and-parameters-from-par.patch
queue-5.15/xhci-dbgtty-use-idr-to-support-several-dbc-instances.patch
queue-5.15/pmdomain-use-device_get_match_data.patch
queue-5.15/spi-tegra210-quad-add-new-chips-to-compatible.patch
queue-5.15/iavf-fix-off-by-one-issues-in-iavf_config_rss_reg.patch
queue-5.15/rculist-add-hlist_nulls_replace_rcu-and-hlist_nulls_.patch
queue-5.15/usb-dwc2-fix-hang-during-shutdown-if-set-as-peripher.patch
queue-5.15/netfilter-nf_conncount-reduce-unnecessary-gc.patch
queue-5.15/dm-log-writes-add-missing-set_freezable-for-freezabl.patch
queue-5.15/asoc-stm32-sai-fix-clk-prepare-imbalance-on-probe-failure.patch
queue-5.15/usb-xhci-limit-run_graceperiod-for-only-usb-3.0-devi.patch
queue-5.15/net-hns3-using-the-num_tqps-to-check-whether-tqp_ind.patch
queue-5.15/platform-x86-intel-hid-add-dell-pro-rugged-10-12-tab.patch
queue-5.15/iommu-qcom-fix-device-leak-on-of_xlate.patch
queue-5.15/asoc-ak5558-disable-regulator-when-error-happens.patch
queue-5.15/i3c-remove-i2c-board-info-from-i2c_dev_desc.patch
queue-5.15/drm-gma500-remove-unused-helper-psb_fbdev_fb_setcolreg.patch
queue-5.15/asoc-ak4458-disable-regulator-when-error-happens.patch
queue-5.15/i40e-validate-ring_len-parameter-against-hardware-sp.patch
queue-5.15/phy-mscc-fix-ptp-for-vsc8574-and-vsc8572.patch
queue-5.15/smack-fix-bug-unprivileged-task-can-create-labels.patch
queue-5.15/ima-handle-error-code-returned-by-ima_filter_rule_ma.patch
queue-5.15/genalloc.h-fix-htmldocs-warning.patch
queue-5.15/spi-tegra210-quad-fix-timeout-handling.patch
queue-5.15/s390-ap-don-t-leak-debug-feature-files-if-ap-instruc.patch
queue-5.15/netfilter-nft_connlimit-update-the-count-if-add-was-.patch
queue-5.15/acpi-property-use-acpi-functions-in-acpi_graph_get_n.patch
queue-5.15/spi-tegra210-quad-combined-sequence-mode.patch
queue-5.15/broadcom-b44-prevent-uninitialized-value-usage.patch
queue-5.15/serial-sprd-return-eprobe_defer-when-uart-clock-is-n.patch
queue-5.15/selftests-bpf-skip-test_perf_branches_hw-on-unsuppor.patch
queue-5.15/usb-typec-ucsi-handle-incorrect-num_connectors-capab.patch
queue-5.15/drm-amd-display-fix-logical-vs-bitwise-bug-in-get_em.patch
queue-5.15/sunrpc-svcauth_gss-avoid-null-deref-on-zero-length-gss_token-in-gss_read_proxy_verf.patch
queue-5.15/nfsd-nfsv4-file-creation-neglects-setting-acl.patch
queue-5.15/net-stmmac-fix-rx-limit-check-in-stmmac_rx_zc.patch
queue-5.15/rdma-core-fix-kasan-slab-use-after-free-read-in-ib_register_device-problem.patch
queue-5.15/gpu-host1x-fix-race-in-syncpt-alloc-free.patch
queue-5.15/net-mlx5-fw_tracer-validate-format-string-parameters.patch
queue-5.15/backlight-led_bl-take-led_access-lock-when-required.patch
queue-5.15/fs-ntfs3-make-ni_ins_new_attr-return-error.patch
queue-5.15/ext4-remove-unused-return-value-of-__mb_check_buddy.patch
queue-5.15/soc-renesas-r9a06g032-sysctrl-handle-h2mode-setting-.patch
queue-5.15/mlxsw-spectrum_router-fix-neighbour-use-after-free.patch
queue-5.15/xfs-fix-a-memory-leak-in-xfs_buf_item_init.patch
queue-5.15/asoc-stm32-sai-fix-of-node-leak-on-probe.patch
queue-5.15/jbd2-fix-the-inconsistency-between-checksum-and-data-in-memory-for-journal-sb.patch
queue-5.15/nvme-fc-don-t-hold-rport-lock-when-putting-ctrl.patch
queue-5.15/efi-cper-adjust-infopfx-size-to-accept-an-extra-spac.patch
queue-5.15/arm-dts-microchip-sama5d2-fix-spi-flexcom-fifo-size-to-32.patch
queue-5.15/firmware-imx-scu-irq-init-workqueue-before-request-m.patch
queue-5.15/net-hns3-add-vlan-id-validation-before-using.patch
queue-5.15/spi-tegra210-quad-modify-chip-select-cs-deactivation.patch
queue-5.15/usb-dwc3-keep-susphy-enabled-during-exit-to-avoid-controller-faults.patch
queue-5.15/rdma-core-fix-logic-error-in-ib_get_gids_from_rdma_h.patch
queue-5.15/wifi-ieee80211-correct-fils-status-codes.patch
queue-5.15/leds-spi-byte-use-devm_led_classdev_register_ext.patch
queue-5.15/nfsd-blocklayout-fix-minlength-check-in-proc_layoutg.patch
queue-5.15/f2fs-fix-to-avoid-updating-zero-sized-extent-in-extent-cache.patch
queue-5.15/crypto-seqiv-do-not-use-req-iv-after-crypto_aead_enc.patch
queue-5.15/tpm-cap-the-number-of-pcr-banks.patch
queue-5.15/usb-dwc2-disable-platform-lowlevel-hw-resources-duri.patch
queue-5.15/acpi-processor_core-fix-map_x2apic_id-for-amd-pstate.patch
queue-5.15/net-hns3-align-type-of-some-variables-with-their-pri.patch
queue-5.15/asoc-fsl_xcvr-add-support-for-i.mx93-platform.patch
queue-5.15/scsi-sim710-fix-resource-leak-by-adding-missing-iopo.patch
queue-5.15/drm-vmwgfx-fix-a-null-ptr-access-in-the-cursor-snooper.patch
queue-5.15/blk-mq-abort-suspend-when-wakeup-events-are-pending.patch
queue-5.15/arm-dts-microchip-sama7g5-fix-uart-fifo-size-to-32.patch
queue-5.15/acpica-avoid-walking-the-namespace-if-start_node-is-.patch
queue-5.15/bpf-arm64-do-not-audit-capability-check-in-do_jit.patch
queue-5.15/exfat-fix-remount-failure-in-different-process-envir.patch
queue-5.15/hfsplus-verify-inode-mode-when-loading-from-disk.patch
queue-5.15/net-openvswitch-fix-middle-attribute-validation-in-p.patch
queue-5.15/pwm-bcm2835-make-sure-the-channel-is-enabled-after-p.patch
queue-5.15/mfd-mt6358-irq-fix-missing-irq_domain_remove-in-erro.patch
queue-5.15/regulator-core-protect-regulator_supply_alias_list-w.patch
queue-5.15/i40e-refactor-argument-of-several-client-notificatio.patch
queue-5.15/pci-dwc-fix-wrong-port_logic_ltssm_state_mask-defini.patch
queue-5.15/powerpc-64s-ptdump-fix-kernel_hash_pagetable-dump-fo.patch
queue-5.15/leds-netxbig-fix-gpio-descriptor-leak-in-error-paths.patch
queue-5.15/spi-tegra210-quad-use-device_reset-method.patch
queue-5.15/wifi-rtl818x-fix-potential-memory-leaks-in-rtl8180_i.patch
queue-5.15/rdma-bnxt_re-fix-incorrect-bar-check-in-bnxt_qplib_m.patch
queue-5.15/nbd-defer-config-unlock-in-nbd_genl_connect.patch
queue-5.15/rdma-irdma-avoid-invalid-read-in-irdma_net_event.patch
queue-5.15/mm-balloon_compaction-we-cannot-have-isolated-pages-in-the-balloon-list.patch
queue-5.15/asoc-fsl_xcvr-clear-the-channel-status-control-memor.patch
queue-5.15/powerpc-pseries-cmm-call-balloon_devinfo_init-also-without-config_balloon_compaction.patch
queue-5.15/f2fs-fix-to-propagate-error-from-f2fs_enable_checkpoint.patch
queue-5.15/drm-vgem-fence-fix-potential-deadlock-on-release.patch
queue-5.15/virtio_vdpa-fix-misleading-return-in-void-function.patch
queue-5.15/vdpa-introduce-query-of-device-config-layout.patch
queue-5.15/nbd-clean-up-return-value-checking-of-sock_xmit.patch
queue-5.15/f2fs-fix-to-detect-recoverable-inode-during-dryrun-of-find_fsync_dnodes.patch
queue-5.15/coresight-etm4x-save-restore-trfcr_el1.patch
queue-5.15/net-usb-rtl8150-fix-memory-leak-on-usb_submit_urb-fa.patch
queue-5.15/spi-imx-keep-dma-request-disabled-before-dma-transfe.patch
queue-5.15/wifi-rtl818x-rtl8187-fix-potential-buffer-underflow-.patch
queue-5.15/mt76-mt7615-fix-memory-leak-in-mt7615_mcu_wtbl_sta_a.patch
queue-5.15/ti-sysc-allow-omap2-and-omap4-timers-to-be-reserved-.patch
queue-5.15/caif-fix-integer-underflow-in-cffrml_receive.patch
queue-5.15/i3c-support-dynamically-added-i2c-devices.patch
queue-5.15/sctp-defer-sctp_dbg_objcnt_dec-to-sctp_destroy_sock.patch
queue-5.15/ext4-correct-the-checking-of-quota-files-before-movi.patch
queue-5.15/powerpc-pseries-cmm-adjust-balloon_migrate-when-migrating-pages.patch
queue-5.15/usbip-fix-locking-bug-in-rt-enabled-kernels.patch
queue-5.15/scsi-qla2xxx-use-reinit_completion-on-mbx_intr_comp.patch
queue-5.15/nbd-defer-config-put-in-recv_work.patch
queue-5.15/uio-uio_fsl_elbc_gpcm-add-null-pointer-check-to-uio_.patch
queue-5.15/media-samsung-exynos4-is-fix-potential-abba-deadlock-on-init.patch
queue-5.15/ps3disk-use-memcpy_-from-to-_bvec-index.patch
queue-5.15/staging-fbtft-core-fix-potential-memory-leak-in-fbtf.patch
queue-5.15/asoc-bcm-bcm63xx-pcm-whistler-check-return-value-of-.patch
queue-5.15/lockd-fix-vfs_test_lock-calls.patch
queue-5.15/soc-rockchip-power-domain-manage-resource-conflicts-with-firmware.patch
queue-5.15/asoc-intel-catpt-fix-error-path-in-hw_params.patch
queue-5.15/drm-mediatek-fix-probe-memory-leak.patch
queue-5.15/drm-panel-visionox-rm69299-don-t-clear-all-mode-flag.patch
queue-5.15/s390-smp-fix-fallback-cpu-detection.patch
queue-5.15/ext4-minor-defrag-code-improvements.patch
queue-5.15/net-usb-asix-validate-phy-address-before-use.patch
queue-5.15/rdma-irdma-fix-data-race-in-irdma_free_pble.patch
queue-5.15/rdma-rtrs-fix-clt_path-max_pages_per_mr-calculation.patch
queue-5.15/efi-cper-add-a-new-helper-function-to-print-bitmasks.patch
queue-5.15/powerpc-32-fix-unpaired-stwcx.-on-interrupt-exit.patch
queue-5.15/ntfs3-init-run-lock-for-extend-inode.patch
queue-5.15/ext4-improve-integrity-checking-in-__mb_check_buddy-.patch
queue-5.15/media-mediatek-vcodec-fix-a-reference-leak-in-mtk_vcodec_fw_vpu_init.patch
queue-5.15/coresight-etm4x-use-trace-filtering-controls-dynamic.patch
queue-5.15/nfsd-clear-seclabel-in-the-suppattr_exclcreat-bitmap.patch
queue-5.15/scsi-qla2xxx-fix-initiator-mode-with-qlini_mode-excl.patch
queue-5.15/clk-mvebu-cp110-add-clk_ignore_unused-to-pcie_x10-pc.patch
queue-5.15/scsi-target-do-not-write-nul-characters-into-ascii-c.patch
queue-5.15/asoc-stm32-sai-use-the-devm_clk_get_optional-helper.patch
queue-5.15/net-mlx5-fw_tracer-add-support-for-unrecognized-stri.patch
queue-5.15/powerpc-64s-slb-fix-slb-multihit-issue-during-slb-preload.patch
queue-5.15/x86-ptrace-always-inline-trivial-accessors.patch
queue-5.15/xfrm-flush-all-states-in-xfrm_state_fini.patch
queue-5.15/ntfs3-fix-uninit-buffer-allocated-by-__getname.patch
queue-5.15/net-sched-sch_cake-fix-incorrect-qlen-reduction-in-c.patch
queue-5.15/watchdog-wdat_wdt-fix-acpi-table-leak-in-probe-funct.patch
queue-5.15/ocfs2-relax-bug-to-ocfs2_error-in-__ocfs2_move_exten.patch
queue-5.15/asoc-stm-stm32_sai_sub-convert-to-platform-remove-callback-returning-void.patch
queue-5.15/netfilter-nf_conncount-fix-leaked-ct-in-error-paths.patch
queue-5.15/backlight-lp855x-fix-lp855x.h-kernel-doc-warnings.patch
queue-5.15/fs-ntfs3-add-new-argument-is_mft-to-ntfs_mark_rec_fr.patch
queue-5.15/ipmi-fix-__scan_channels-failing-to-rescan-channels.patch
queue-5.15/fs-nls-fix-inconsistency-between-utf8_to_utf32-and-u.patch
queue-5.15/media-verisilicon-protect-g2-hevc-decoder-against-invalid-dpb-index.patch
queue-5.15/usb-ohci-nxp-fix-device-leak-on-probe-failure.patch
queue-5.15/crypto-hisilicon-qm-restore-original-qos-values.patch
queue-5.15/fs-ntfs3-out1-also-needs-to-put-mi.patch
queue-5.15/net-ethtool-ioctl-split-ethtool_get_phy_stats-into-m.patch
queue-5.15/btrfs-scrub-always-update-btrfs_scrub_progress-last_.patch
queue-5.15/hfsplus-fix-volume-corruption-issue-for-generic-073.patch
queue-5.15/reset-fix-bit-macro-reference.patch
queue-5.15/wifi-mt76-fix-dts-power-limits-on-little-endian-systems.patch
queue-5.15/ipv6-bug-in-pskb_expand_head-as-part-of-calipso_skbu.patch
queue-5.15/wifi-mac80211-discard-beacon-frames-to-non-broadcast-address.patch
queue-5.15/kmsan-introduce-__no_sanitize_memory-and-__no_kmsan_.patch
queue-5.15/i3c-fix-refcount-inconsistency-in-i3c_master_registe.patch
queue-5.15/wifi-cw1200-fix-potential-memory-leak-in-cw1200_bh_r.patch
queue-5.15/hfsplus-fix-volume-corruption-issue-for-generic-070.patch
queue-5.15/platform-x86-acer-wmi-ignore-backlight-event.patch
queue-5.15/ipvlan-ignore-packet_loopback-in-handle_mode_l2.patch
queue-5.15/revert-nfs-ignore-sb_rdonly-when-mounting-nfs.patch
queue-5.15/pinctrl-single-fix-pin_config_bias_disable-handling.patch
queue-5.15/ipv4-fix-reference-count-leak-when-using-error-route.patch
queue-5.15/fs-nls-fix-utf16-to-utf8-conversion.patch
queue-5.15/nfs-label-the-dentry-with-a-verifier-in-nfs_rmdir-an.patch
queue-5.15/coresight-etm4x-add-isb-before-reading-the-trcstatr.patch
queue-5.15/regulator-core-disable-supply-if-enabling-main-regul.patch
queue-5.15/powerpc-addnote-fix-overflow-on-32-bit-builds.patch
queue-5.15/scsi-stex-fix-reboot_notifier-leak-in-probe-error-pa.patch
queue-5.15/usb-ohci-nxp-use-helper-function-devm_clk_get_enabled.patch
queue-5.15/netfilter-nf_conncount-rework-api-to-use-sk_buff-dir.patch
queue-5.15/net-sched-ets-always-remove-class-from-active-list-b.patch
queue-5.15/drm-i915-selftests-fix-inconsistent-is_err-and-ptr_e.patch
queue-5.15/svcrdma-bound-check-rq_pages-index-in-inline-path.patch
queue-5.15/clk-renesas-r9a06g032-export-function-to-set-dmamux.patch
queue-5.15/dm-raid-fix-possible-null-dereference-with-undefined.patch
queue-5.15/remoteproc-qcom_q6v5_wcss-fix-parsing-of-qcom-halt-r.patch
queue-5.15/media-renesas-rcar_drif-fix-device-node-reference-leak-in-rcar_drif_bond_enabled.patch
queue-5.15/selftests-ftrace-traceonoff_triggers-strip-off-names.patch
queue-5.15/net-mdio-aspeed-move-reg-accessing-part-into-separat.patch
queue-5.15/smc91x-fix-broken-irq-context-in-preempt_rt.patch
queue-5.15/mm-balloon_compaction-convert-balloon_page_delete-to-balloon_page_finalize.patch
queue-5.15/platform-x86-msi-laptop-add-missing-sysfs_remove_gro.patch
queue-5.15/rdma-bnxt_re-fix-to-use-correct-page-size-for-pde-ta.patch
queue-5.15/ip6_gre-make-ip6gre_header-robust.patch
queue-5.15/pinctrl-stm32-fix-hwspinlock-resource-leak-in-probe-.patch
queue-5.15/irqchip-qcom-irq-combiner-fix-section-mismatch.patch
queue-5.15/ethtool-use-phydev-variable.patch
queue-5.15/mm-balloon_compaction-make-balloon-page-compaction-callbacks-static.patch
queue-5.15/revert-nfs-ignore-sb_rdonly-when-remounting-nfs.patch
queue-5.15/ethtool-avoid-overflowing-userspace-buffer-on-stats-.patch
queue-5.15/bluetooth-btusb-add-new-vid-pid-13d3-3533-for-rtl882.patch
queue-5.15/samples-work-around-glibc-redefining-some-of-our-def.patch
queue-5.15/lib-vsprintf-check-pointer-before-dereferencing-in-t.patch
queue-5.15/team-fix-check-for-port-enabled-in-team_queue_overri.patch
queue-5.15/usb-usb-storage-no-additional-quirks-need-to-be-adde.patch
queue-5.15/bfs-reconstruct-file-type-when-loading-from-disk.patch
queue-5.15/livepatch-match-old_sympos-0-and-1-in-klp_find_func.patch
queue-5.15/alsa-pcmcia-fix-resource-leak-in-snd_pdacf_probe-err.patch
queue-5.15/watchdog-wdat_wdt-stop-watchdog-when-uninstalling-mo.patch
queue-5.15/clk-renesas-r9a06g032-fix-memory-leak-in-error-path.patch
queue-5.15/f2fs-use-global-inline_xattr_slab-instead-of-per-sb-slab-cache.patch
queue-5.15/x86-kmsan-don-t-instrument-stack-walking-functions.patch
queue-5.15/i3c-allow-of-alias-based-persistent-bus-numbering.patch
queue-5.15/mptcp-pm-ignore-unknown-endpoint-flags.patch
queue-5.15/net-mdio-aspeed-add-dummy-read-to-avoid-read-after-w.patch
queue-5.15/alsa-wavefront-clear-substream-pointers-on-close.patch
queue-5.15/pci-keystone-exit-ks_pcie_probe-for-invalid-mode.patch
queue-5.15/pinctrl-qcom-msm-fix-deadlock-in-pinmux-configuratio.patch
queue-5.15/pinctrl-single-fix-incorrect-type-for-error-return-v.patch
queue-5.15/iio-imu-st_lsm6dsx-discard-samples-during-filters-se.patch
queue-5.15/pmdomain-imx-fix-reference-count-leak-in-imx_gpc_probe.patch
