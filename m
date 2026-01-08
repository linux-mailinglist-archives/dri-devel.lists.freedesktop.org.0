Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5DD02FFB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC710E715;
	Thu,  8 Jan 2026 13:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jJS9EPlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72510E715
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:25:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8DB160131;
 Thu,  8 Jan 2026 13:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E69C19425;
 Thu,  8 Jan 2026 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1767878752;
 bh=Qq6qmWpuso7QHJBD/3b3tItnEemJIpQIFI9CEZTFROA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=jJS9EPlx0h+wBOZPiKMpEnp45B8kxO/Kojqvnxz6YPDi+unmaLcwZYy/BbkIwEGfq
 KQKXINaH8SzxC8kah+jfHct3lBGnbFmJ3hEMX390UoK2YEZbBF+/e3Mn0H+IQXUKre
 9BDBLmCfNrpuutTMrP6V25Ek/MwOum2ZoSq/yrPo=
Subject: Patch "drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()" has
 been added to the 6.1-stable tree
To: contact@stefanchrist.eu, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 patrik.r.jakobsson@gmail.com, sashal@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 14:24:52 +0100
In-Reply-To: <20260107154824.4057632-1-sashal@kernel.org>
Message-ID: <2026010852-winking-barge-f87e@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-gma500-remove-unused-helper-psb_fbdev_fb_setcolreg.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-206160-greg=kroah.com@vger.kernel.org Wed Jan  7 17:10:53 2026
From: Sasha Levin <sashal@kernel.org>
Date: Wed,  7 Jan 2026 10:48:24 -0500
Subject: drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Stefan Christ <contact@stefanchrist.eu>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20260107154824.4057632-1-sashal@kernel.org>

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
@@ -146,7 +105,6 @@ static int psbfb_mmap(struct fb_info *in
 static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-6.1/netfilter-flowtable-check-for-maximum-number-of-enca.patch
queue-6.1/dt-bindings-pci-amlogic-fix-the-register-name-of-the.patch
queue-6.1/usb-fix-descriptor-count-when-handling-invalid-mbim-.patch
queue-6.1/net-dsa-b53-skip-multicast-entries-for-fdb_dump.patch
queue-6.1/ipmi-fix-the-race-between-__scan_channels-and-delive.patch
queue-6.1/nfsv4-pnfs-clear-nfs_ino_layoutcommit-in-pnfs_mark_l.patch
queue-6.1/net-stmmac-dwmac4-allow-platforms-to-specify-some-dm.patch
queue-6.1/macintosh-mac_hid-fix-race-condition-in-mac_hid_togg.patch
queue-6.1/vhost-vsock-improve-rcu-read-sections-around-vhost_v.patch
queue-6.1/alsa-wavefront-use-standard-print-api.patch
queue-6.1/bpf-check-skb-transport_header-is-set-in-bpf_skb_che.patch
queue-6.1/dma-pool-eliminate-alloc_pages-warning-in-atomic_poo.patch
queue-6.1/mfd-mt6397-irq-fix-missing-irq_domain_remove-in-erro.patch
queue-6.1/risc-v-kvm-fix-guest-page-fault-within-hlv-instructi.patch
queue-6.1/hid-elecom-add-support-for-elecom-m-xt3urbk-018f.patch
queue-6.1/scsi-smartpqi-add-abort-handler.patch
queue-6.1/wifi-cfg80211-sme-store-capped-length-in-__cfg80211_.patch
queue-6.1/f2fs-drop-inode-from-the-donation-list-when-the-last-file-is-closed.patch
queue-6.1/platform-x86-ibm_rtl-fix-ebda-signature-search-point.patch
queue-6.1/btrfs-do-not-skip-logging-new-dentries-when-logging-.patch
queue-6.1/acpi-property-fix-fwnode-refcount-leak-in-acpi_fwnod.patch
queue-6.1/power-supply-apm_power-only-unset-own-apm_get_power_.patch
queue-6.1/rtc-gamecube-check-the-return-value-of-ioremap.patch
queue-6.1/mlxsw-spectrum_mr-fix-use-after-free-when-updating-m.patch
queue-6.1/alsa-vxpocket-fix-resource-leak-in-vxpocket_probe-er.patch
queue-6.1/md-raid5-fix-io-hang-when-array-is-broken-with-io-in.patch
queue-6.1/bluetooth-btusb-revert-use-of-devm_kzalloc-in-btusb.patch
queue-6.1/revert-nfs-clear-sb_rdonly-before-getting-superblock.patch
queue-6.1/drm-mediatek-fix-ccorr-mtk_ctm_s31_32_to_s1_n-functi.patch
queue-6.1/asoc-fsl_xcvr-add-counter-registers.patch
queue-6.1/i40e-refactor-argument-of-i40e_detect_recover_hung.patch
queue-6.1/mm-simplify-folio_expected_ref_count.patch
queue-6.1/crypto-ccree-correctly-handle-return-of-sg_nents_for.patch
queue-6.1/firmware-imx-scu-irq-fix-of-node-leak-in.patch
queue-6.1/kvm-svm-don-t-skip-unrelated-instruction-if-int3-into-is-replaced.patch
queue-6.1/fs-ntfs3-prevent-memory-leaks-in-add-sub-record.patch
queue-6.1/efi-cper-align-arm-cper-type-with-uefi-2.9a-2.10-spe.patch
queue-6.1/usb-chaoskey-fix-locking-for-o_nonblock.patch
queue-6.1/arm-9464-1-fix-input-only-operand-modification-in-lo.patch
queue-6.1/block-fix-comment-for-op_is_zone_mgmt-to-include-res.patch
queue-6.1/nfs-avoid-changing-nlink-when-file-removes-and-attri.patch
queue-6.1/rdma-bnxt_re-fix-ib_send_ip_csum-handling-in-post_se.patch
queue-6.1/coresight-etm4x-extract-the-trace-unit-controlling.patch
queue-6.1/i3c-master-svc-prevent-incomplete-ibi-transaction.patch
queue-6.1/drm-vmwgfx-use-kref-in-vmw_bo_dirty.patch
queue-6.1/fbdev-ssd1307fb-fix-potential-page-leak-in-ssd1307fb.patch
queue-6.1/wifi-nl80211-validate-and-configure-puncturing-bitma.patch
queue-6.1/mips-fix-a-reference-leak-bug-in-ip22_check_gio.patch
queue-6.1/rdma-bnxt_re-fix-dma_free_coherent-pointer.patch
queue-6.1/irqchip-irq-bcm7120-l2-fix-section-mismatch.patch
queue-6.1/rdma-efa-remove-possible-negative-shift.patch
queue-6.1/f2fs-remove-unused-gc_failure_pin.patch
queue-6.1/wifi-mac80211-mlme-handle-eht-channel-puncturing.patch
queue-6.1/rdma-rtrs-server-fix-error-handling-in-get_or_create.patch
queue-6.1/mptcp-initialise-rcv_mss-before-calling-tcp_send_active_reset-in-mptcp_do_fastclose.patch
queue-6.1/platform-x86-huawei-wmi-add-keys-for-honor-models.patch
queue-6.1/net-ethtool-ioctl-remove-if-n_stats-checks-from-etht.patch
queue-6.1/power-supply-cw2015-check-devm_delayed_work_autocanc.patch
queue-6.1/cfg80211-support-rnr-for-ema-ap.patch
queue-6.1/virtio-fix-virtqueue_set_affinity-docs.patch
queue-6.1/mm-consider-non-anon-swap-cache-folios-in-folio_expected_ref_count.patch
queue-6.1/fs_context-drop-the-unused-lsm_flags-member.patch
queue-6.1/rdma-irdma-fix-data-race-in-irdma_sc_ccq_arm.patch
queue-6.1/nfs-automounted-filesystems-should-inherit-ro-noexec.patch
queue-6.1/scsi-ufs-core-fix-incorrect-buffer-duplication-in-uf.patch
queue-6.1/alsa-uapi-fix-typo-in-asound.h-comment.patch
queue-6.1/sched-fair-revert-max_newidle_lb_cost-bump.patch
queue-6.1/hfsplus-fix-missing-hfs_bnode_get-in-__hfs_bnode_cre.patch
queue-6.1/block-rnbd-clt-fix-signedness-bug-in-init_dev.patch
queue-6.1/scsi-smartpqi-convert-to-host_tagset.patch
queue-6.1/fs-ntfs3-support-timestamps-prior-to-epoch.patch
queue-6.1/resource-replace-open-coded-resource_intersection.patch
queue-6.1/scsi-smartpqi-remove-contention-for-raid_bypass_cnt.patch
queue-6.1/net-mlx5-fw_tracer-handle-escaped-percent-properly.patch
queue-6.1/xfrm-also-call-xfrm_state_delete_tunnel-at-destroy-t.patch
queue-6.1/can-gs_usb-gs_can_open-fix-error-handling.patch
queue-6.1/spi-xilinx-increase-number-of-retries-before-declari.patch
queue-6.1/usb-raw-gadget-cap-raw_io-transfer-length-to-kmalloc.patch
queue-6.1/scsi-smartpqi-fix-device-resources-accessed-after-de.patch
queue-6.1/hwmon-sy7636a-fix-regulator_enable-resource-leak-on-.patch
queue-6.1/arm64-dts-imx8mm-venice-gw72xx-remove-unused-sdhc1-p.patch
queue-6.1/backlight-led-bl-add-devlink-to-supplier-leds.patch
queue-6.1/ntfs3-fix-uninit-memory-after-failed-mi_read-in-mi_f.patch
queue-6.1/wifi-nl80211-add-a-command-to-enable-disable-hw-time.patch
queue-6.1/wifi-cfg80211-move-puncturing-bitmap-validation-from.patch
queue-6.1/perf-x86-intel-correct-large-pebs-flag-check.patch
queue-6.1/revert-xfrm-destroy-xfrm_state-synchronously-on-net-.patch
queue-6.1/netrom-fix-memory-leak-in-nr_sendmsg.patch
queue-6.1/alsa-firewire-motu-add-bounds-check-in-put_user-loop.patch
queue-6.1/net-mlx5-create-a-new-profile-for-sfs.patch
queue-6.1/firewire-nosy-fix-dma_free_coherent-size.patch
queue-6.1/via_wdt-fix-critical-boot-hang-due-to-unnamed-resour.patch
queue-6.1/crypto-af_alg-zero-initialize-memory-allocated-via-sock_kmalloc.patch
queue-6.1/scsi-qla2xxx-fix-lost-interrupts-with-qlini_mode-dis.patch
queue-6.1/iommu-arm-smmu-qcom-enable-use-of-all-smr-groups-whe.patch
queue-6.1/cpufreq-s5pv210-fix-refcount-leak.patch
queue-6.1/xfrm-delete-x-tunnel-as-we-delete-x.patch
queue-6.1/mfd-da9055-fix-missing-regmap_del_irq_chip-in-error-.patch
queue-6.1/nfs-initialise-verifiers-for-visible-dentries-in-nfs.patch
queue-6.1/alsa-hda-cs35l41-fix-null-pointer-dereference-in-cs35l41_hda_read_acpi.patch
queue-6.1/media-verisilicon-fix-cpu-stalls-on-g2-bus-error.patch
queue-6.1/net-openvswitch-avoid-needlessly-taking-the-rtnl-on-.patch
queue-6.1/net-sched-ets-remove-drr-class-from-the-active-list-.patch
queue-6.1/xhci-dbgtty-fix-device-unregister-fixup.patch
queue-6.1/leds-replace-all-non-returning-strlcpy-with-strscpy.patch
queue-6.1/selftests-net-fix-buffer-overflow-detected-for-tap.c.patch
queue-6.1/coresight-etm4x-add-context-synchronization-before-e.patch
queue-6.1/ipvs-fix-ipv4-null-ptr-deref-in-route-error-path.patch
queue-6.1/iommu-mediatek-improve-safety-for-mediatek-smi-property-in-larb-nodes.patch
queue-6.1/iommu-mediatek-fix-use-after-free-on-probe-deferral.patch
queue-6.1/crypto-asymmetric_keys-prevent-overflow-in-asymmetri.patch
queue-6.1/i40e-fix-scheduling-in-set_rx_mode.patch
queue-6.1/btrfs-fix-memory-leak-of-fs_devices-in-degraded-seed.patch
queue-6.1/mtd-lpddr_cmds-fix-signed-shifts-in-lpddr_cmds.patch
queue-6.1/net-rose-fix-invalid-array-index-in-rose_kill_by_dev.patch
queue-6.1/net-phy-adin1100-fix-software-power-down-ready-condi.patch
queue-6.1/net-stmmac-use-per-queue-64-bit-statistics-where-nec.patch
queue-6.1/net-hns3-using-the-num_tqps-in-the-vf-driver-to-appl.patch
queue-6.1/perf-tools-fix-split-kallsyms-dso-counting.patch
queue-6.1/nfc-pn533-fix-error-code-in-pn533_acr122_poweron_rdr.patch
queue-6.1/platform-x86-asus-wmi-use-brightness_set_blocking-fo.patch
queue-6.1/media-amphion-remove-vpu_vb_is_codecconfig.patch
queue-6.1/usb-dwc2-fix-hang-during-suspend-if-set-as-periphera.patch
queue-6.1/x86-dumpstack-prevent-kasan-false-positive-warnings-.patch
queue-6.1/inet-avoid-ehash-lookup-race-in-inet_ehash_insert.patch
queue-6.1/selftests-bpf-improve-reliability-of-test_perf_branc.patch
queue-6.1/power-supply-wm831x-check-wm831x_set_bits-return-val.patch
queue-6.1/net-bridge-describe-tunnel_hash-member-in-net_bridge.patch
queue-6.1/spi-cadence-quadspi-add-missing-clk_disable_unprepar.patch
queue-6.1/dt-bindings-pci-convert-amlogic-meson-pcie.txt-to-dt.patch
queue-6.1/pci-brcmstb-fix-disabling-l0s-capability.patch
queue-6.1/iommu-qcom-use-the-asid-read-from-device-tree-if-specified.patch
queue-6.1/drm-amdgpu-add-missing-lock-to-amdgpu_ttm_access_memory_sdma.patch
queue-6.1/sched-deadline-only-set-free_cpus-for-online-runqueu.patch
queue-6.1/expand-the-type-of-nfs_fattr-valid.patch
queue-6.1/kvm-nvmx-immediately-refresh-apicv-controls-as-needed-on-nested-vm-exit.patch
queue-6.1/ocfs2-fix-memory-leak-in-ocfs2_merge_rec_left.patch
queue-6.1/alsa-usb-mixer-us16x08-validate-meter-packet-indices.patch
queue-6.1/irqchip-imx-mu-msi-fix-section-mismatch.patch
queue-6.1/resource-reuse-for_each_resource-macro.patch
queue-6.1/selftests-bpf-fix-failure-paths-in-send_signal-test.patch
queue-6.1/kbuild-use-objtree-for-module-signing-key-path.patch
queue-6.1/alsa-wavefront-fix-integer-overflow-in-sample-size-validation.patch
queue-6.1/fuse-fix-readahead-reclaim-deadlock.patch
queue-6.1/btrfs-don-t-rewrite-ret-from-inode_permission.patch
queue-6.1/octeontx2-pf-fix-ubsan-shift-out-of-bounds-error.patch
queue-6.1/i3c-master-inherit-dma-masks-and-parameters-from-par.patch
queue-6.1/pmdomain-use-device_get_match_data.patch
queue-6.1/iavf-fix-off-by-one-issues-in-iavf_config_rss_reg.patch
queue-6.1/rculist-add-hlist_nulls_replace_rcu-and-hlist_nulls_.patch
queue-6.1/usb-dwc2-fix-hang-during-shutdown-if-set-as-peripher.patch
queue-6.1/mptcp-avoid-deadlock-on-fallback-while-reinjecting.patch
queue-6.1/dm-log-writes-add-missing-set_freezable-for-freezabl.patch
queue-6.1/asoc-stm32-sai-fix-clk-prepare-imbalance-on-probe-failure.patch
queue-6.1/x86-boot-fix-page-table-access-in-5-level-to-4-level.patch
queue-6.1/wifi-brcmfmac-add-dmi-nvram-filename-quirk-for-acer-.patch
queue-6.1/usb-xhci-limit-run_graceperiod-for-only-usb-3.0-devi.patch
queue-6.1/iommu-qcom-index-contexts-by-asid-number-to-allow-asid-0.patch
queue-6.1/irqchip-mchp-eic-fix-error-code-in-mchp_eic_domain_a.patch
queue-6.1/irqchip-irq-bcm7038-l1-fix-section-mismatch.patch
queue-6.1/net-hns3-using-the-num_tqps-to-check-whether-tqp_ind.patch
queue-6.1/platform-x86-intel-hid-add-dell-pro-rugged-10-12-tab.patch
queue-6.1/efi-libstub-fix-page-table-access-in-5-level-to-4-le.patch
queue-6.1/iommu-qcom-fix-device-leak-on-of_xlate.patch
queue-6.1/asoc-ak5558-disable-regulator-when-error-happens.patch
queue-6.1/drm-gma500-remove-unused-helper-psb_fbdev_fb_setcolreg.patch
queue-6.1/asoc-ak4458-disable-regulator-when-error-happens.patch
queue-6.1/i40e-validate-ring_len-parameter-against-hardware-sp.patch
queue-6.1/phy-mscc-fix-ptp-for-vsc8574-and-vsc8572.patch
queue-6.1/smack-fix-bug-unprivileged-task-can-create-labels.patch
queue-6.1/ima-handle-error-code-returned-by-ima_filter_rule_ma.patch
queue-6.1/genalloc.h-fix-htmldocs-warning.patch
queue-6.1/spi-tegra210-quad-fix-timeout-handling.patch
queue-6.1/net-stmmac-remove-some-unnecessary-void-pointers.patch
queue-6.1/s390-ap-don-t-leak-debug-feature-files-if-ap-instruc.patch
queue-6.1/netfilter-nft_connlimit-update-the-count-if-add-was-.patch
queue-6.1/acpi-property-use-acpi-functions-in-acpi_graph_get_n.patch
queue-6.1/broadcom-b44-prevent-uninitialized-value-usage.patch
queue-6.1/serial-sprd-return-eprobe_defer-when-uart-clock-is-n.patch
queue-6.1/selftests-bpf-skip-test_perf_branches_hw-on-unsuppor.patch
queue-6.1/sched-isolation-add-cpu_is_isolated-api.patch
queue-6.1/usb-typec-ucsi-handle-incorrect-num_connectors-capab.patch
queue-6.1/drm-amd-display-fix-logical-vs-bitwise-bug-in-get_em.patch
queue-6.1/sunrpc-svcauth_gss-avoid-null-deref-on-zero-length-gss_token-in-gss_read_proxy_verf.patch
queue-6.1/alsa-usb-audio-add-native-dsd-quirks-for-pureaudio-d.patch
queue-6.1/nfsd-nfsv4-file-creation-neglects-setting-acl.patch
queue-6.1/hwmon-tmp401-fix-overflow-caused-by-default-conversi.patch
queue-6.1/net-stmmac-fix-rx-limit-check-in-stmmac_rx_zc.patch
queue-6.1/rdma-core-fix-kasan-slab-use-after-free-read-in-ib_register_device-problem.patch
queue-6.1/gpu-host1x-fix-race-in-syncpt-alloc-free.patch
queue-6.1/net-mlx5-fw_tracer-validate-format-string-parameters.patch
queue-6.1/backlight-led_bl-take-led_access-lock-when-required.patch
queue-6.1/ext4-remove-unused-return-value-of-__mb_check_buddy.patch
queue-6.1/soc-renesas-r9a06g032-sysctrl-handle-h2mode-setting-.patch
queue-6.1/mlxsw-spectrum_router-fix-neighbour-use-after-free.patch
queue-6.1/net-stmmac-power-up-serdes-after-the-phy-link.patch
queue-6.1/tools-nolibc-stdio-let-perror-work-when-nolibc_ignor.patch
queue-6.1/asoc-stm32-sai-fix-of-node-leak-on-probe.patch
queue-6.1/drm-amdgpu-cleanup-scheduler-job-initialization-v2.patch
queue-6.1/jbd2-fix-the-inconsistency-between-checksum-and-data-in-memory-for-journal-sb.patch
queue-6.1/nvme-fc-don-t-hold-rport-lock-when-putting-ctrl.patch
queue-6.1/iommu-mediatek-v1-fix-device-leaks-on-probe.patch
queue-6.1/mptcp-fallback-earlier-on-simult-connection.patch
queue-6.1/efi-cper-adjust-infopfx-size-to-accept-an-extra-spac.patch
queue-6.1/arm-dts-microchip-sama5d2-fix-spi-flexcom-fifo-size-to-32.patch
queue-6.1/coresight-etm4x-correct-polling-idle-bit.patch
queue-6.1/firmware-imx-scu-irq-init-workqueue-before-request-m.patch
queue-6.1/resource-replace-printk-kern_warning-by-pr_warn-prin.patch
queue-6.1/net-hns3-add-vlan-id-validation-before-using.patch
queue-6.1/usb-dwc3-keep-susphy-enabled-during-exit-to-avoid-controller-faults.patch
queue-6.1/mac80211-support-rnr-for-ema-ap.patch
queue-6.1/rdma-core-fix-logic-error-in-ib_get_gids_from_rdma_h.patch
queue-6.1/wifi-ieee80211-correct-fils-status-codes.patch
queue-6.1/loongarch-mask-all-interrupts-during-kexec-kdump.patch
queue-6.1/leds-spi-byte-use-devm_led_classdev_register_ext.patch
queue-6.1/nfsd-blocklayout-fix-minlength-check-in-proc_layoutg.patch
queue-6.1/f2fs-fix-to-avoid-updating-zero-sized-extent-in-extent-cache.patch
queue-6.1/crypto-seqiv-do-not-use-req-iv-after-crypto_aead_enc.patch
queue-6.1/net-stmmac-introduce-wrapper-for-struct-xdp_buff.patch
queue-6.1/usb-dwc2-disable-platform-lowlevel-hw-resources-duri.patch
queue-6.1/acpi-processor_core-fix-map_x2apic_id-for-amd-pstate.patch
queue-6.1/x86-xen-move-xen-upcall-handler.patch
queue-6.1/asoc-fsl_xcvr-add-support-for-i.mx93-platform.patch
queue-6.1/scsi-sim710-fix-resource-leak-by-adding-missing-iopo.patch
queue-6.1/blk-mq-abort-suspend-when-wakeup-events-are-pending.patch
queue-6.1/arm-dts-microchip-sama7g5-fix-uart-fifo-size-to-32.patch
queue-6.1/acpica-avoid-walking-the-namespace-if-start_node-is-.patch
queue-6.1/bpf-arm64-do-not-audit-capability-check-in-do_jit.patch
queue-6.1/exfat-fix-remount-failure-in-different-process-envir.patch
queue-6.1/blk-mq-don-t-schedule-block-kworker-on-isolated-cpus.patch
queue-6.1/hfsplus-verify-inode-mode-when-loading-from-disk.patch
queue-6.1/smb-server-fix-return-value-of-smb2_ioctl.patch
queue-6.1/kvm-x86-mmu-use-emultype-flag-to-track-write-pfs-to-shadow-pages.patch
queue-6.1/irqchip-irq-brcmstb-l2-fix-section-mismatch.patch
queue-6.1/net-openvswitch-fix-middle-attribute-validation-in-p.patch
queue-6.1/pwm-bcm2835-make-sure-the-channel-is-enabled-after-p.patch
queue-6.1/mfd-mt6358-irq-fix-missing-irq_domain_remove-in-erro.patch
queue-6.1/regulator-core-protect-regulator_supply_alias_list-w.patch
queue-6.1/i40e-refactor-argument-of-several-client-notificatio.patch
queue-6.1/pci-dwc-fix-wrong-port_logic_ltssm_state_mask-defini.patch
queue-6.1/spi-cadence-quadspi-fix-clock-disable-on-probe-failu.patch
queue-6.1/powerpc-64s-ptdump-fix-kernel_hash_pagetable-dump-fo.patch
queue-6.1/leds-netxbig-fix-gpio-descriptor-leak-in-error-paths.patch
queue-6.1/wifi-rtl818x-fix-potential-memory-leaks-in-rtl8180_i.patch
queue-6.1/wifi-mac80211-do-not-use-old-mbssid-elements.patch
queue-6.1/rdma-bnxt_re-fix-incorrect-bar-check-in-bnxt_qplib_m.patch
queue-6.1/nbd-defer-config-unlock-in-nbd_genl_connect.patch
queue-6.1/rdma-irdma-avoid-invalid-read-in-irdma_net_event.patch
queue-6.1/mm-balloon_compaction-we-cannot-have-isolated-pages-in-the-balloon-list.patch
queue-6.1/asoc-fsl_xcvr-clear-the-channel-status-control-memor.patch
queue-6.1/f2fs-fix-to-propagate-error-from-f2fs_enable_checkpoint.patch
queue-6.1/iio-adc-ti_am335x_adc-limit-step_avg-to-valid-range-.patch
queue-6.1/drm-vgem-fence-fix-potential-deadlock-on-release.patch
queue-6.1/virtio_vdpa-fix-misleading-return-in-void-function.patch
queue-6.1/perf-record-skip-synthesize-event-when-open-evsel-fa.patch
queue-6.1/f2fs-fix-to-detect-recoverable-inode-during-dryrun-of-find_fsync_dnodes.patch
queue-6.1/net-usb-rtl8150-fix-memory-leak-on-usb_submit_urb-fa.patch
queue-6.1/spi-imx-keep-dma-request-disabled-before-dma-transfe.patch
queue-6.1/net-mlx5-drain-firmware-reset-in-shutdown-callback.patch
queue-6.1/alsa-wavefront-use-guard-for-spin-locks.patch
queue-6.1/wifi-rtl818x-rtl8187-fix-potential-buffer-underflow-.patch
queue-6.1/mt76-mt7615-fix-memory-leak-in-mt7615_mcu_wtbl_sta_a.patch
queue-6.1/firmware-stratix10-svc-fix-make-htmldocs-warning-for.patch
queue-6.1/ti-sysc-allow-omap2-and-omap4-timers-to-be-reserved-.patch
queue-6.1/caif-fix-integer-underflow-in-cffrml_receive.patch
queue-6.1/net-stmmac-xgmac-add-ethtool-per-queue-irq-statistic.patch
queue-6.1/hid-apple-add-sonix-ak870-pro-to-non_apple_keyboards.patch
queue-6.1/sctp-defer-sctp_dbg_objcnt_dec-to-sctp_destroy_sock.patch
queue-6.1/reinstate-resource-avoid-unnecessary-lookups-in-find.patch
queue-6.1/ext4-correct-the-checking-of-quota-files-before-movi.patch
queue-6.1/nfs-fix-inheritance-of-the-block-sizes-when-automoun.patch
queue-6.1/powerpc-pseries-cmm-adjust-balloon_migrate-when-migrating-pages.patch
queue-6.1/usbip-fix-locking-bug-in-rt-enabled-kernels.patch
queue-6.1/scsi-qla2xxx-use-reinit_completion-on-mbx_intr_comp.patch
queue-6.1/md-export-md_is_rdwr-and-is_md_suspended.patch
queue-6.1/spi-cadence-quadspi-add-compatible-for-amd-pensando-.patch
queue-6.1/nbd-defer-config-put-in-recv_work.patch
queue-6.1/block-rnbd-clt-fix-leaked-id-in-init_dev.patch
queue-6.1/uio-uio_fsl_elbc_gpcm-add-null-pointer-check-to-uio_.patch
queue-6.1/ps3disk-use-memcpy_-from-to-_bvec-index.patch
queue-6.1/staging-fbtft-core-fix-potential-memory-leak-in-fbtf.patch
queue-6.1/asoc-bcm-bcm63xx-pcm-whistler-check-return-value-of-.patch
queue-6.1/wifi-mac80211-generate-ema-beacons-in-ap-mode.patch
queue-6.1/lockd-fix-vfs_test_lock-calls.patch
queue-6.1/hwmon-ibmpex-fix-use-after-free-in-high-low-store.patch
queue-6.1/asoc-intel-catpt-fix-error-path-in-hw_params.patch
queue-6.1/drm-mediatek-fix-probe-memory-leak.patch
queue-6.1/spi-cadence-quadspi-add-support-for-starfive-jh7110-.patch
queue-6.1/mtd-rawnand-renesas-handle-devm_pm_runtime_enable-er.patch
queue-6.1/drm-panel-visionox-rm69299-don-t-clear-all-mode-flag.patch
queue-6.1/s390-smp-fix-fallback-cpu-detection.patch
queue-6.1/net-usb-asix-validate-phy-address-before-use.patch
queue-6.1/rdma-irdma-fix-data-race-in-irdma_free_pble.patch
queue-6.1/rdma-rtrs-fix-clt_path-max_pages_per_mr-calculation.patch
queue-6.1/efi-cper-add-a-new-helper-function-to-print-bitmasks.patch
queue-6.1/powerpc-32-fix-unpaired-stwcx.-on-interrupt-exit.patch
queue-6.1/ntfs3-init-run-lock-for-extend-inode.patch
queue-6.1/cfg80211-update-transition-disable-policy-during-por.patch
queue-6.1/ext4-improve-integrity-checking-in-__mb_check_buddy-.patch
queue-6.1/media-mediatek-vcodec-fix-a-reference-leak-in-mtk_vcodec_fw_vpu_init.patch
queue-6.1/nfsd-clear-seclabel-in-the-suppattr_exclcreat-bitmap.patch
queue-6.1/scsi-qla2xxx-fix-initiator-mode-with-qlini_mode-excl.patch
queue-6.1/clk-mvebu-cp110-add-clk_ignore_unused-to-pcie_x10-pc.patch
queue-6.1/scsi-target-do-not-write-nul-characters-into-ascii-c.patch
queue-6.1/nfs-initialise-verifiers-for-visible-dentries-in-rea.patch
queue-6.1/phy-renesas-rcar-gen3-usb2-fix-an-error-handling-pat.patch
queue-6.1/asoc-stm32-sai-use-the-devm_clk_get_optional-helper.patch
queue-6.1/net-mlx5-fw_tracer-add-support-for-unrecognized-stri.patch
queue-6.1/iommu-mtk_iommu_v1-convert-to-platform-remove-callback-returning-void.patch
queue-6.1/f2fs-fix-to-avoid-updating-compression-context-during-writeback.patch
queue-6.1/interconnect-qcom-msm8996-add-missing-link-to-slave_.patch
queue-6.1/x86-ptrace-always-inline-trivial-accessors.patch
queue-6.1/xfrm-flush-all-states-in-xfrm_state_fini.patch
queue-6.1/ntfs3-fix-uninit-buffer-allocated-by-__getname.patch
queue-6.1/net-sched-sch_cake-fix-incorrect-qlen-reduction-in-c.patch
queue-6.1/watchdog-wdat_wdt-fix-acpi-table-leak-in-probe-funct.patch
queue-6.1/ocfs2-relax-bug-to-ocfs2_error-in-__ocfs2_move_exten.patch
queue-6.1/iommu-arm-smmu-drop-if-with-an-always-false-condition.patch
queue-6.1/asoc-stm-stm32_sai_sub-convert-to-platform-remove-callback-returning-void.patch
queue-6.1/netfilter-nf_conncount-fix-leaked-ct-in-error-paths.patch
queue-6.1/smb-fix-invalid-username-check-in-smb3_fs_context_pa.patch
queue-6.1/backlight-lp855x-fix-lp855x.h-kernel-doc-warnings.patch
queue-6.1/wifi-ath11k-fix-peer-he-mcs-assignment.patch
queue-6.1/gfs2-fix-freeze-error-handling.patch
queue-6.1/ipmi-fix-__scan_channels-failing-to-rescan-channels.patch
queue-6.1/net-stmmac-pass-stmmac_priv-in-some-callbacks.patch
queue-6.1/fs-nls-fix-inconsistency-between-utf8_to_utf32-and-u.patch
queue-6.1/bpf-fix-invalid-prog-stats-access-when-update_effect.patch
queue-6.1/net-mlx5-fw-reset-clear-reset-requested-on-drain_fw_.patch
queue-6.1/perf-x86-amd-check-event-before-enable-to-avoid-gpf.patch
queue-6.1/btrfs-don-t-log-conflicting-inode-if-it-s-a-dir-moved-in-the-current-transaction.patch
queue-6.1/net-stmmac-fix-the-crash-issue-for-zero-copy-xdp_tx-.patch
queue-6.1/usb-ohci-nxp-fix-device-leak-on-probe-failure.patch
queue-6.1/clk-renesas-cpg-mssr-add-missing-1ms-delay-into-rese.patch
queue-6.1/media-amphion-add-a-frame-flush-mode-for-decoder.patch
queue-6.1/crypto-hisilicon-qm-restore-original-qos-values.patch
queue-6.1/fs-ntfs3-out1-also-needs-to-put-mi.patch
queue-6.1/net-ethtool-ioctl-split-ethtool_get_phy_stats-into-m.patch
queue-6.1/spi-cadence-quadspi-add-clock-configuration-for-star.patch
queue-6.1/btrfs-scrub-always-update-btrfs_scrub_progress-last_.patch
queue-6.1/objtool-fix-find_-symbol-func-_containing.patch
queue-6.1/hfsplus-fix-volume-corruption-issue-for-generic-073.patch
queue-6.1/reset-fix-bit-macro-reference.patch
queue-6.1/gfs2-fix-use-of-bio_chain.patch
queue-6.1/wifi-mt76-fix-dts-power-limits-on-little-endian-systems.patch
queue-6.1/ipv6-bug-in-pskb_expand_head-as-part-of-calipso_skbu.patch
queue-6.1/ftrace-bpf-fix-ipmodify-direct-in-modify_ftrace_dire.patch
queue-6.1/wifi-mac80211-discard-beacon-frames-to-non-broadcast-address.patch
queue-6.1/bpf-improve-program-stats-run-time-calculation.patch
queue-6.1/i3c-fix-refcount-inconsistency-in-i3c_master_registe.patch
queue-6.1/wifi-cw1200-fix-potential-memory-leak-in-cw1200_bh_r.patch
queue-6.1/hfsplus-fix-volume-corruption-issue-for-generic-070.patch
queue-6.1/platform-x86-acer-wmi-ignore-backlight-event.patch
queue-6.1/ipvlan-ignore-packet_loopback-in-handle_mode_l2.patch
queue-6.1/revert-nfs-ignore-sb_rdonly-when-mounting-nfs.patch
queue-6.1/pinctrl-single-fix-pin_config_bias_disable-handling.patch
queue-6.1/ipv4-fix-reference-count-leak-when-using-error-route.patch
queue-6.1/arm64-dts-ti-k3-j721e-sk-fix-pinmux-for-pin-y1-used-by-power-regulator.patch
queue-6.1/fs-nls-fix-utf16-to-utf8-conversion.patch
queue-6.1/regulator-core-disable-supply-if-enabling-main-regul.patch
queue-6.1/powerpc-addnote-fix-overflow-on-32-bit-builds.patch
queue-6.1/scsi-stex-fix-reboot_notifier-leak-in-probe-error-pa.patch
queue-6.1/usb-ohci-nxp-use-helper-function-devm_clk_get_enabled.patch
queue-6.1/netfilter-nf_conncount-rework-api-to-use-sk_buff-dir.patch
queue-6.1/net-sched-ets-always-remove-class-from-active-list-b.patch
queue-6.1/alsa-firewire-motu-fix-buffer-overflow-in-hwdep-read.patch
queue-6.1/serial-make-uart_remove_one_port-return-void.patch
queue-6.1/dm-raid-fix-possible-null-dereference-with-undefined.patch
queue-6.1/remoteproc-qcom_q6v5_wcss-fix-parsing-of-qcom-halt-r.patch
queue-6.1/blk-mq-skip-cpu-offline-notify-on-unmapped-hctx.patch
queue-6.1/cpuset-treat-cpusets-in-attaching-as-populated.patch
queue-6.1/selftests-ftrace-traceonoff_triggers-strip-off-names.patch
queue-6.1/smc91x-fix-broken-irq-context-in-preempt_rt.patch
queue-6.1/mm-balloon_compaction-convert-balloon_page_delete-to-balloon_page_finalize.patch
queue-6.1/objtool-fix-weak-symbol-detection.patch
queue-6.1/scsi-ufs-core-add-ufshcd_update_evt_hist-for-ufs-suspend-error.patch
queue-6.1/platform-x86-msi-laptop-add-missing-sysfs_remove_gro.patch
queue-6.1/resource-introduce-is_type_match-helper-and-use-it.patch
queue-6.1/rdma-bnxt_re-fix-to-use-correct-page-size-for-pde-ta.patch
queue-6.1/ip6_gre-make-ip6gre_header-robust.patch
queue-6.1/pinctrl-stm32-fix-hwspinlock-resource-leak-in-probe-.patch
queue-6.1/irqchip-qcom-irq-combiner-fix-section-mismatch.patch
queue-6.1/virtio-fix-typo-in-virtio_device_ready-comment.patch
queue-6.1/x86-xen-fix-sparse-warning-in-enlighten_pv.c.patch
queue-6.1/revert-nfs-ignore-sb_rdonly-when-remounting-nfs.patch
queue-6.1/ethtool-avoid-overflowing-userspace-buffer-on-stats-.patch
queue-6.1/bluetooth-btusb-add-new-vid-pid-13d3-3533-for-rtl882.patch
queue-6.1/samples-work-around-glibc-redefining-some-of-our-def.patch
queue-6.1/media-amphion-make-some-vpu_v4l2-functions-static.patch
queue-6.1/lib-vsprintf-check-pointer-before-dereferencing-in-t.patch
queue-6.1/iommu-arm-smmu-convert-to-platform-remove-callback-returning-void.patch
queue-6.1/team-fix-check-for-port-enabled-in-team_queue_overri.patch
queue-6.1/ksmbd-fix-use-after-free-in-ksmbd_tree_connect_put-u.patch
queue-6.1/tty-introduce-and-use-tty_port_tty_vhangup-helper.patch
queue-6.1/usb-usb-storage-no-additional-quirks-need-to-be-adde.patch
queue-6.1/bfs-reconstruct-file-type-when-loading-from-disk.patch
queue-6.1/ext4-fix-string-copying-in-parse_apply_sb_mount_options.patch
queue-6.1/livepatch-match-old_sympos-0-and-1-in-klp_find_func.patch
queue-6.1/alsa-pcmcia-fix-resource-leak-in-snd_pdacf_probe-err.patch
queue-6.1/clk-renesas-r9a06g032-fix-memory-leak-in-error-path.patch
queue-6.1/f2fs-use-global-inline_xattr_slab-instead-of-per-sb-slab-cache.patch
queue-6.1/soc-qcom-smem-fix-hwspinlock-resource-leak-in-probe-.patch
queue-6.1/i3c-allow-of-alias-based-persistent-bus-numbering.patch
queue-6.1/mptcp-pm-ignore-unknown-endpoint-flags.patch
queue-6.1/net-mdio-aspeed-add-dummy-read-to-avoid-read-after-w.patch
queue-6.1/loongarch-add-machine_kexec_mask_interrupts-implementation.patch
queue-6.1/alsa-wavefront-clear-substream-pointers-on-close.patch
queue-6.1/pci-keystone-exit-ks_pcie_probe-for-invalid-mode.patch
queue-6.1/pinctrl-qcom-msm-fix-deadlock-in-pinmux-configuratio.patch
queue-6.1/pinctrl-single-fix-incorrect-type-for-error-return-v.patch
queue-6.1/pmdomain-imx-fix-reference-count-leak-in-imx_gpc_probe.patch
queue-6.1/f2fs-keep-posix_fadv_noreuse-ranges.patch
