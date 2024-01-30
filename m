Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8C84279C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C7A10F1D6;
	Tue, 30 Jan 2024 15:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983DE10EF31;
 Tue, 30 Jan 2024 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706627143;
 bh=UMCO5mdqEc4TEDL/YJjDUdv2tVlEkcBjHfEJqU0ujHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RU+RNKTFeddX+DnWfVUpEBLKrYr+TcJP/4PqsPsrWQ/gIKCAnFROU+z1A25inrBdt
 35C/9FckqJdRw+6uiKgwZoDClVcVCJWKRQfGK6aPEp1O9NRDzBFo0V51smms6TUyqe
 fc4ugJ2gFCMe5Vk+N01ag04iFW10XY9T070xtPz77LEfHUDhmDgF0NDMRNyOF0ZAx5
 8K55DbPJ0w9nBYa5pU7zgJibqK3Q4XxSnUB3KbLQLLmLBH2g7yNky7Q/bJoOqjZRJx
 5wkuSH2exSHLUUhp2waIxtcqRkAe04qBMfekmPZ13gxTmHN0q9V8CL39SoybhM2vyZ
 CCV48rKgjx0TQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D360537811CF;
 Tue, 30 Jan 2024 15:05:38 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 9/9] drm/ci: uprev IGT and update testlist
Date: Tue, 30 Jan 2024 20:33:40 +0530
Message-Id: <20240130150340.687871-10-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-rockchip@lists.infradead.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uprev IGT and add amd, v3d, vc4 and vgem specific
tests to testlist. Have testlist.txt per driver
and include a base testlist so that the driver
specific tests will run only on those hardware.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in series to uprev IGT and update testlist.

---
 drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  12 +-
 drivers/gpu/drm/ci/testlist-amdgpu.txt        | 151 ++++++++++++++++++
 drivers/gpu/drm/ci/testlist-msm.txt           |  50 ++++++
 drivers/gpu/drm/ci/testlist-panfrost.txt      |  17 ++
 drivers/gpu/drm/ci/testlist-v3d.txt           |  73 +++++++++
 drivers/gpu/drm/ci/testlist-vc4.txt           |  49 ++++++
 drivers/gpu/drm/ci/testlist.txt               | 100 ++++--------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  24 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   9 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  10 +-
 11 files changed, 427 insertions(+), 70 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
 create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index bc8cb3420476..e2b021616a8e 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
+  IGT_VERSION: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f001e015d135..2fd09b9b7cf6 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -64,10 +64,20 @@ if ! grep -q "core_getversion" /install/testlist.txt; then
 fi
 
 set +e
+if [ "$DRIVER_NAME" = "amdgpu" ]; then
+    TEST_LIST="/install/testlist-amdgpu.txt"
+elif [ "$DRIVER_NAME" = "msm" ]; then
+    TEST_LIST="/install/testlist-msm.txt"
+elif [ "$DRIVER_NAME" = "panfrost" ]; then
+    TEST_LIST="/install/testlist-panfrost.txt"
+else
+    TEST_LIST="/install/testlist.txt"
+fi
+
 igt-runner \
     run \
     --igt-folder /igt/libexec/igt-gpu-tools \
-    --caselist /install/testlist.txt \
+    --caselist $TEST_LIST \
     --output /results \
     $IGT_SKIPS \
     $IGT_FLAKES \
diff --git a/drivers/gpu/drm/ci/testlist-amdgpu.txt b/drivers/gpu/drm/ci/testlist-amdgpu.txt
new file mode 100644
index 000000000000..4486f86d340b
--- /dev/null
+++ b/drivers/gpu/drm/ci/testlist-amdgpu.txt
@@ -0,0 +1,151 @@
+testlist.txt
+amdgpu/amd_abm@dpms_cycle
+amdgpu/amd_abm@backlight_monotonic_basic
+amdgpu/amd_abm@backlight_monotonic_abm
+amdgpu/amd_abm@abm_enabled
+amdgpu/amd_abm@abm_gradual
+amdgpu/amd_bo@amdgpu_bo_export_import
+amdgpu/amd_bo@amdgpu_bo_metadata
+amdgpu/amd_bo@amdgpu_bo_map_unmap
+amdgpu/amd_bo@amdgpu_memory_alloc
+amdgpu/amd_bo@amdgpu_mem_fail_alloc
+amdgpu/amd_bo@amdgpu_bo_find_by_cpu_mapping
+amdgpu/amd_cp_dma_misc@GTT_to_VRAM-AMDGPU_HW_IP_GFX0
+amdgpu/amd_cp_dma_misc@GTT_to_VRAM-AMDGPU_HW_IP_COMPUTE0
+amdgpu/amd_cp_dma_misc@VRAM_to_GTT-AMDGPU_HW_IP_GFX0
+amdgpu/amd_cp_dma_misc@VRAM_to_GTT-AMDGPU_HW_IP_COMPUTE0
+amdgpu/amd_cp_dma_misc@VRAM_to_VRAM-AMDGPU_HW_IP_GFX0
+amdgpu/amd_cp_dma_misc@VRAM_to_VRAM-AMDGPU_HW_IP_COMPUTE0
+amdgpu/amd_dispatch@amdgpu-dispatch-test-compute-with-IP-COMPUTE
+amdgpu/amd_dispatch@amdgpu-dispatch-test-gfx-with-IP-GFX
+amdgpu/amd_dispatch@amdgpu-dispatch-hang-test-gfx-with-IP-GFX
+amdgpu/amd_dispatch@amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+amdgpu/amd_hotplug@basic
+amdgpu/amd_hotplug@basic-suspend
+amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode
+amdgpu/amd_max_bpc@4k-mode-max-bpc
+amdgpu/amd_module_load@reload
+amdgpu/amd_plane@test-mpo-4k
+amdgpu/amd_plane@mpo-swizzle-toggle
+amdgpu/amd_plane@mpo-swizzle-toggle-multihead
+amdgpu/amd_plane@mpo-pan-rgb
+amdgpu/amd_plane@mpo-pan-rgb-multihead
+amdgpu/amd_plane@mpo-pan-nv12
+amdgpu/amd_plane@mpo-pan-nv12-multihead
+amdgpu/amd_plane@mpo-pan-p010
+amdgpu/amd_plane@mpo-pan-p010-multihead
+amdgpu/amd_plane@mpo-pan-multi-rgb
+amdgpu/amd_plane@mpo-pan-multi-nv12
+amdgpu/amd_plane@mpo-pan-multi-p010
+amdgpu/amd_plane@multi-overlay
+amdgpu/amd_plane@multi-overlay-invalid
+amdgpu/amd_plane@mpo-scale-rgb
+amdgpu/amd_plane@mpo-scale-rgb-multihead
+amdgpu/amd_plane@mpo-scale-nv12
+amdgpu/amd_plane@mpo-scale-nv12-multihead
+amdgpu/amd_plane@mpo-scale-p010
+amdgpu/amd_plane@mpo-scale-p010-multihead
+amdgpu/amd_pstate@amdgpu_pstate
+amdgpu/amd_subvp@dual-4k60
+amdgpu/amd_uvd_enc@uvd_enc_create
+amdgpu/amd_uvd_enc@amdgpu_uvd_enc_session_init
+amdgpu/amd_uvd_enc@amdgpu_uvd_enc_encode
+amdgpu/amd_uvd_enc@uvd_enc_destroy
+amdgpu/amd_vm@vmid-reserve-test
+amdgpu/amd_vm@amdgpu-vm-unaligned-map
+amdgpu/amd_vm@amdgpu-vm-mapping-test
+amdgpu/amd_assr@assr-links
+amdgpu/amd_assr@assr-links-dpms
+amdgpu/amd_assr@assr-links-suspend
+amdgpu/amd_bypass@8bpc-bypass-mode
+amdgpu/amd_cs_nop@cs-nops-with-nop-compute0
+amdgpu/amd_cs_nop@cs-nops-with-nop-gfx0
+amdgpu/amd_cs_nop@cs-nops-with-sync-compute0
+amdgpu/amd_cs_nop@cs-nops-with-sync-gfx0
+amdgpu/amd_cs_nop@cs-nops-with-fork-compute0
+amdgpu/amd_cs_nop@cs-nops-with-fork-gfx0
+amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0
+amdgpu/amd_cs_nop@cs-nops-with-sync-fork-gfx0
+amdgpu/amd_dp_dsc@dsc-enable-basic
+amdgpu/amd_dp_dsc@dsc-slice-dimensions-change
+amdgpu/amd_dp_dsc@dsc-link-settings
+amdgpu/amd_dp_dsc@dsc-bpc
+amdgpu/amd_ilr@ilr-link-training-configs
+amdgpu/amd_ilr@ilr-policy
+amdgpu/amd_link_settings@link-training-configs
+amdgpu/amd_mem_leak@connector-suspend-resume
+amdgpu/amd_mem_leak@connector-hotplug
+amdgpu/amd_odm@odm-combine-2-to-1-4k144
+amdgpu/amd_prime@i915-to-amd
+amdgpu/amd_prime@amd-to-i915
+amdgpu/amd_prime@shrink
+amdgpu/amd_ras@RAS-basic
+amdgpu/amd_ras@RAS-query
+amdgpu/amd_ras@RAS-inject
+amdgpu/amd_ras@RAS-disable
+amdgpu/amd_ras@RAS-enable
+amdgpu/amd_syncobj@amdgpu_syncobj_timeline
+amdgpu/amd_vce_dec@amdgpu_cs_vce_create
+amdgpu/amd_vce_dec@amdgpu_cs_vce_encode
+amdgpu/amd_vce_dec@amdgpu_cs_vce_destroy
+amdgpu/amd_vpe@vpe-fence-test
+amdgpu/amd_vpe@vpe-blit-test
+amdgpu/amd_basic@memory-alloc
+amdgpu/amd_basic@userptr-with-IP-DMA
+amdgpu/amd_basic@cs-gfx-with-IP-GFX
+amdgpu/amd_basic@cs-compute-with-IP-COMPUTE
+amdgpu/amd_basic@cs-multi-fence-with-IP-GFX
+amdgpu/amd_basic@cs-sdma-with-IP-DMA
+amdgpu/amd_basic@semaphore-with-IP-GFX-and-IP-DMA
+amdgpu/amd_basic@eviction-test-with-IP-DMA
+amdgpu/amd_basic@sync-dependency-test-with-IP-GFX
+amdgpu/amd_color@crtc-linear-degamma
+amdgpu/amd_color@crtc-linear-regamma
+amdgpu/amd_color@crtc-lut-accuracy
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-mem-access
+amdgpu/amd_deadlock@amdgpu-deadlock-gfx
+amdgpu/amd_deadlock@amdgpu-deadlock-compute
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma-corrupted-header-test
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma-slow-linear-copy
+amdgpu/amd_freesync_video_mode@freesync-base-to-various
+amdgpu/amd_freesync_video_mode@freesync-lower-to-higher
+amdgpu/amd_freesync_video_mode@freesync-non-preferred-to-freesync
+amdgpu/amd_freesync_video_mode@freesync-custom-mode
+amdgpu/amd_info@query-firmware-version
+amdgpu/amd_info@query-timestamp
+amdgpu/amd_info@query-timestamp-while-idle
+amdgpu/amd_mall@static-screen
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-0
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-1
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-3
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-4
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-5
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
+amdgpu/amd_psr@psr_enable
+amdgpu/amd_psr@psr_enable_null_crtc
+amdgpu/amd_psr@psr_su_mpo
+amdgpu/amd_psr@psr_su_ffu
+amdgpu/amd_psr@psr_su_cursor
+amdgpu/amd_psr@psr_su_cursor_mpo
+amdgpu/amd_psr@psr_su_mpo_scaling_1_5
+amdgpu/amd_psr@psr_su_mpo_scaling_0_75
+amdgpu/amd_security@amdgpu-security-alloc-buf-test
+amdgpu/amd_security@sdma-write-linear-helper-secure
+amdgpu/amd_security@gfx-write-linear-helper-secure
+amdgpu/amd_security@amdgpu-secure-bounce
+amdgpu/amd_uvd_dec@amdgpu_uvd_dec_create
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode
+amdgpu/amd_uvd_dec@amdgpu_uvd_dec_destroy
+amdgpu/amd_vcn@vcn-decoder-create-decode-destroy
+amdgpu/amd_vcn@vcn-encoder-create-encode-destroy
+amdgpu/amd_vrr_range@freesync-parsing
+amdgpu/amd_vrr_range@freesync-parsing-suspend
+amdgpu/amd_vrr_range@freesync-range
+amdgpu/amd_vrr_range@freesync-range-suspend
diff --git a/drivers/gpu/drm/ci/testlist-msm.txt b/drivers/gpu/drm/ci/testlist-msm.txt
new file mode 100644
index 000000000000..b6c4371fe0b4
--- /dev/null
+++ b/drivers/gpu/drm/ci/testlist-msm.txt
@@ -0,0 +1,50 @@
+testlist.txt
+msm_shrink@copy-gpu-sanitycheck-8
+msm_shrink@copy-gpu-sanitycheck-32
+msm_shrink@copy-gpu-8
+msm_shrink@copy-gpu-32
+msm_shrink@copy-gpu-madvise-8
+msm_shrink@copy-gpu-madvise-32
+msm_shrink@copy-gpu-oom-8
+msm_shrink@copy-gpu-oom-32
+msm_shrink@copy-mmap-sanitycheck-8
+msm_shrink@copy-mmap-sanitycheck-32
+msm_shrink@copy-mmap-8
+msm_shrink@copy-mmap-32
+msm_shrink@copy-mmap-madvise-8
+msm_shrink@copy-mmap-madvise-32
+msm_shrink@copy-mmap-oom-8
+msm_shrink@copy-mmap-oom-32
+msm_shrink@copy-mmap-dmabuf-sanitycheck-8
+msm_shrink@copy-mmap-dmabuf-sanitycheck-32
+msm_shrink@copy-mmap-dmabuf-8
+msm_shrink@copy-mmap-dmabuf-32
+msm_shrink@copy-mmap-dmabuf-madvise-8
+msm_shrink@copy-mmap-dmabuf-madvise-32
+msm_shrink@copy-mmap-dmabuf-oom-8
+msm_shrink@copy-mmap-dmabuf-oom-32
+msm_mapping@ring
+msm_mapping@sqefw
+msm_mapping@shadow
+msm_submitoverhead@submitbench-10-bos
+msm_submitoverhead@submitbench-10-bos-no-implicit-sync
+msm_submitoverhead@submitbench-100-bos
+msm_submitoverhead@submitbench-100-bos-no-implicit-sync
+msm_submitoverhead@submitbench-250-bos
+msm_submitoverhead@submitbench-250-bos-no-implicit-sync
+msm_submitoverhead@submitbench-500-bos
+msm_submitoverhead@submitbench-500-bos-no-implicit-sync
+msm_submitoverhead@submitbench-1000-bos
+msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
+msm_recovery@hangcheck
+msm_recovery@gpu-fault
+msm_recovery@gpu-fault-parallel
+msm_recovery@iova-fault
+msm_submit@empty-submit
+msm_submit@invalid-queue-submit
+msm_submit@invalid-flags-submit
+msm_submit@invalid-in-fence-submit
+msm_submit@invalid-duplicate-bo-submit
+msm_submit@invalid-cmd-idx-submit
+msm_submit@invalid-cmd-type-submit
+msm_submit@valid-submit
diff --git a/drivers/gpu/drm/ci/testlist-panfrost.txt b/drivers/gpu/drm/ci/testlist-panfrost.txt
new file mode 100644
index 000000000000..e1002156a508
--- /dev/null
+++ b/drivers/gpu/drm/ci/testlist-panfrost.txt
@@ -0,0 +1,17 @@
+testlist.txt
+panfrost_get_param@base-params
+panfrost_get_param@get-bad-param
+panfrost_get_param@get-bad-padding
+panfrost_gem_new@gem-new-4096
+panfrost_gem_new@gem-new-0
+panfrost_gem_new@gem-new-zeroed
+panfrost_prime@gem-prime-import
+panfrost_submit@pan-submit
+panfrost_submit@pan-submit-error-no-jc
+panfrost_submit@pan-submit-error-bad-in-syncs
+panfrost_submit@pan-submit-error-bad-bo-handles
+panfrost_submit@pan-submit-error-bad-requirements
+panfrost_submit@pan-submit-error-bad-out-sync
+panfrost_submit@pan-reset
+panfrost_submit@pan-submit-and-close
+panfrost_submit@pan-unhandled-pagefault
diff --git a/drivers/gpu/drm/ci/testlist-v3d.txt b/drivers/gpu/drm/ci/testlist-v3d.txt
new file mode 100644
index 000000000000..6ef7957f6344
--- /dev/null
+++ b/drivers/gpu/drm/ci/testlist-v3d.txt
@@ -0,0 +1,73 @@
+testlist.txt
+v3d_create_bo@create-bo-invalid-flags
+v3d_create_bo@create-bo-0
+v3d_create_bo@create-bo-4096
+v3d_create_bo@create-bo-zeroed
+v3d_get_bo_offset@create-get-offsets
+v3d_get_bo_offset@get-bad-handle
+v3d_get_param@base-params
+v3d_get_param@get-bad-param
+v3d_get_param@get-bad-flags
+v3d_job_submission@array-job-submission
+v3d_job_submission@multiple-singlesync-to-multisync
+v3d_job_submission@threaded-job-submission
+v3d_mmap@mmap-bad-flags
+v3d_mmap@mmap-bad-handle
+v3d_mmap@mmap-bo
+v3d_perfmon@create-perfmon-0
+v3d_perfmon@create-perfmon-exceed
+v3d_perfmon@create-perfmon-invalid-counters
+v3d_perfmon@create-single-perfmon
+v3d_perfmon@create-two-perfmon
+v3d_perfmon@get-values-invalid-pad
+v3d_perfmon@get-values-invalid-perfmon
+v3d_perfmon@get-values-invalid-pointer
+v3d_perfmon@get-values-valid-perfmon
+v3d_perfmon@destroy-invalid-perfmon
+v3d_perfmon@destroy-valid-perfmon
+v3d_submit_cl@bad-pad
+v3d_submit_cl@bad-flag
+v3d_submit_cl@bad-extension
+v3d_submit_cl@bad-bo
+v3d_submit_cl@bad-perfmon
+v3d_submit_cl@bad-in-sync
+v3d_submit_cl@bad-multisync-pad
+v3d_submit_cl@bad-multisync-extension
+v3d_submit_cl@bad-multisync-out-sync
+v3d_submit_cl@bad-multisync-in-sync
+v3d_submit_cl@valid-submission
+v3d_submit_cl@single-out-sync
+v3d_submit_cl@single-in-sync
+v3d_submit_cl@simple-flush-cache
+v3d_submit_cl@valid-multisync-submission
+v3d_submit_cl@multisync-out-syncs
+v3d_submit_cl@multi-and-single-sync
+v3d_submit_cl@multiple-job-submission
+v3d_submit_cl@job-perfmon
+v3d_submit_csd@bad-pad
+v3d_submit_csd@bad-flag
+v3d_submit_csd@bad-extension
+v3d_submit_csd@bad-bo
+v3d_submit_csd@bad-perfmon
+v3d_submit_csd@bad-in-sync
+v3d_submit_csd@bad-multisync-pad
+v3d_submit_csd@bad-multisync-extension
+v3d_submit_csd@bad-multisync-out-sync
+v3d_submit_csd@bad-multisync-in-sync
+v3d_submit_csd@valid-submission
+v3d_submit_csd@single-out-sync
+v3d_submit_csd@single-in-sync
+v3d_submit_csd@valid-multisync-submission
+v3d_submit_csd@multisync-out-syncs
+v3d_submit_csd@multi-and-single-sync
+v3d_submit_csd@multiple-job-submission
+v3d_submit_csd@job-perfmon
+v3d_wait_bo@bad-bo
+v3d_wait_bo@bad-pad
+v3d_wait_bo@unused-bo-0ns
+v3d_wait_bo@unused-bo-1ns
+v3d_wait_bo@map-bo-0ns
+v3d_wait_bo@map-bo-1ns
+v3d_wait_bo@used-bo-0ns
+v3d_wait_bo@used-bo-1ns
+v3d_wait_bo@used-bo
diff --git a/drivers/gpu/drm/ci/testlist-vc4.txt b/drivers/gpu/drm/ci/testlist-vc4.txt
new file mode 100644
index 000000000000..5a9ee4751337
--- /dev/null
+++ b/drivers/gpu/drm/ci/testlist-vc4.txt
@@ -0,0 +1,49 @@
+testlist.txt
+vc4_create_bo@create-bo-4096
+vc4_create_bo@create-bo-0
+vc4_create_bo@create-bo-zeroed
+vc4_dmabuf_poll@poll-write-waits-until-write-done
+vc4_dmabuf_poll@poll-read-waits-until-write-done
+vc4_label_bo@set-label
+vc4_label_bo@set-bad-handle
+vc4_label_bo@set-bad-name
+vc4_label_bo@set-kernel-name
+vc4_lookup_fail@bad-color-write
+vc4_mmap@mmap-bad-handle
+vc4_mmap@mmap-bo
+vc4_perfmon@create-perfmon-0
+vc4_perfmon@create-perfmon-exceed
+vc4_perfmon@create-perfmon-invalid-events
+vc4_perfmon@create-single-perfmon
+vc4_perfmon@create-two-perfmon
+vc4_perfmon@get-values-invalid-perfmon
+vc4_perfmon@get-values-invalid-pointer
+vc4_perfmon@get-values-valid-perfmon
+vc4_perfmon@destroy-invalid-perfmon
+vc4_perfmon@destroy-valid-perfmon
+vc4_purgeable_bo@mark-willneed
+vc4_purgeable_bo@mark-purgeable
+vc4_purgeable_bo@mark-purgeable-twice
+vc4_purgeable_bo@mark-unpurgeable-twice
+vc4_purgeable_bo@access-purgeable-bo-mem
+vc4_purgeable_bo@access-purged-bo-mem
+vc4_purgeable_bo@mark-unpurgeable-check-retained
+vc4_purgeable_bo@mark-unpurgeable-purged
+vc4_purgeable_bo@free-purged-bo
+vc4_tiling@get-bad-handle
+vc4_tiling@set-bad-handle
+vc4_tiling@get-bad-flags
+vc4_tiling@set-bad-flags
+vc4_tiling@get-bad-modifier
+vc4_tiling@set-bad-modifier
+vc4_tiling@set-get
+vc4_tiling@get-after-free
+vc4_wait_bo@bad-bo
+vc4_wait_bo@bad-pad
+vc4_wait_bo@unused-bo-0ns
+vc4_wait_bo@unused-bo-1ns
+vc4_wait_bo@used-bo-0ns
+vc4_wait_bo@used-bo-1ns
+vc4_wait_bo@used-bo
+vc4_wait_seqno@bad-seqno-0ns
+vc4_wait_seqno@bad-seqno-1ns
diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
index 772fc025b1f8..705f157bd787 100644
--- a/drivers/gpu/drm/ci/testlist.txt
+++ b/drivers/gpu/drm/ci/testlist.txt
@@ -2910,68 +2910,38 @@ kms_writeback@writeback-invalid-parameters
 kms_writeback@writeback-fb-id
 kms_writeback@writeback-check-output
 prime_mmap_kms@buffer-sharing
-msm_shrink@copy-gpu-sanitycheck-8
-msm_shrink@copy-gpu-sanitycheck-32
-msm_shrink@copy-gpu-8
-msm_shrink@copy-gpu-32
-msm_shrink@copy-gpu-madvise-8
-msm_shrink@copy-gpu-madvise-32
-msm_shrink@copy-gpu-oom-8
-msm_shrink@copy-gpu-oom-32
-msm_shrink@copy-mmap-sanitycheck-8
-msm_shrink@copy-mmap-sanitycheck-32
-msm_shrink@copy-mmap-8
-msm_shrink@copy-mmap-32
-msm_shrink@copy-mmap-madvise-8
-msm_shrink@copy-mmap-madvise-32
-msm_shrink@copy-mmap-oom-8
-msm_shrink@copy-mmap-oom-32
-msm_shrink@copy-mmap-dmabuf-sanitycheck-8
-msm_shrink@copy-mmap-dmabuf-sanitycheck-32
-msm_shrink@copy-mmap-dmabuf-8
-msm_shrink@copy-mmap-dmabuf-32
-msm_shrink@copy-mmap-dmabuf-madvise-8
-msm_shrink@copy-mmap-dmabuf-madvise-32
-msm_shrink@copy-mmap-dmabuf-oom-8
-msm_shrink@copy-mmap-dmabuf-oom-32
-msm_mapping@ring
-msm_mapping@sqefw
-msm_mapping@shadow
-msm_submitoverhead@submitbench-10-bos
-msm_submitoverhead@submitbench-10-bos-no-implicit-sync
-msm_submitoverhead@submitbench-100-bos
-msm_submitoverhead@submitbench-100-bos-no-implicit-sync
-msm_submitoverhead@submitbench-250-bos
-msm_submitoverhead@submitbench-250-bos-no-implicit-sync
-msm_submitoverhead@submitbench-500-bos
-msm_submitoverhead@submitbench-500-bos-no-implicit-sync
-msm_submitoverhead@submitbench-1000-bos
-msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
-msm_recovery@hangcheck
-msm_recovery@gpu-fault
-msm_recovery@gpu-fault-parallel
-msm_recovery@iova-fault
-msm_submit@empty-submit
-msm_submit@invalid-queue-submit
-msm_submit@invalid-flags-submit
-msm_submit@invalid-in-fence-submit
-msm_submit@invalid-duplicate-bo-submit
-msm_submit@invalid-cmd-idx-submit
-msm_submit@invalid-cmd-type-submit
-msm_submit@valid-submit
-panfrost_get_param@base-params
-panfrost_get_param@get-bad-param
-panfrost_get_param@get-bad-padding
-panfrost_gem_new@gem-new-4096
-panfrost_gem_new@gem-new-0
-panfrost_gem_new@gem-new-zeroed
-panfrost_prime@gem-prime-import
-panfrost_submit@pan-submit
-panfrost_submit@pan-submit-error-no-jc
-panfrost_submit@pan-submit-error-bad-in-syncs
-panfrost_submit@pan-submit-error-bad-bo-handles
-panfrost_submit@pan-submit-error-bad-requirements
-panfrost_submit@pan-submit-error-bad-out-sync
-panfrost_submit@pan-reset
-panfrost_submit@pan-submit-and-close
-panfrost_submit@pan-unhandled-pagefault
+prime_vgem@basic-read
+prime_vgem@basic-write
+prime_vgem@basic-gtt
+prime_vgem@basic-blt
+prime_vgem@shrink
+prime_vgem@coherency-gtt
+prime_vgem@coherency-blt
+prime_vgem@sync
+prime_vgem@busy
+prime_vgem@wait
+prime_vgem@basic-fence-read
+prime_vgem@basic-fence-mmap
+prime_vgem@basic-fence-blt
+prime_vgem@basic-fence-flip
+prime_vgem@fence-read-hang
+prime_vgem@fence-write-hang
+prime_vgem@fence-flip-hang
+prime_vgem@fence-wait
+vgem_basic@unload
+vgem_basic@setversion
+vgem_basic@second-client
+vgem_basic@create
+vgem_basic@mmap
+vgem_basic@bad-flag
+vgem_basic@bad-pad
+vgem_basic@bad-handle
+vgem_basic@bad-fence
+vgem_basic@busy-fence
+vgem_basic@dmabuf-export
+vgem_basic@dmabuf-mmap
+vgem_basic@dmabuf-fence
+vgem_basic@dmabuf-fence-before
+vgem_basic@sysfs
+vgem_basic@debugfs
+vgem_slow@nohang
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index ea87dc46bc2b..e47baa920c22 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,3 +1,20 @@
+amdgpu/amd_assr@assr-links,Fail
+amdgpu/amd_assr@assr-links-dpms,Fail
+amdgpu/amd_ilr@ilr-policy,Fail
+amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs,Fail
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo,Fail
+amdgpu/amd_plane@mpo-pan-nv12,Fail
+amdgpu/amd_plane@mpo-pan-p010,Fail
+amdgpu/amd_plane@mpo-pan-rgb,Crash
+amdgpu/amd_plane@mpo-scale-nv12,Fail
+amdgpu/amd_plane@mpo-scale-p010,Fail
+amdgpu/amd_plane@mpo-scale-rgb,Crash
+amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_destroy,Fail
+amdgpu/amd_vce_dec@amdgpu_cs_vce_encode,Fail
+amdgpu/amd_vrr_range@freesync-parsing,Timeout
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
@@ -14,7 +31,13 @@ kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
 kms_color@degamma,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
 kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_cursor_crc@pipe-A-cursor-size-change,Fail
 kms_cursor_crc@pipe-B-cursor-size-change,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
@@ -23,5 +46,4 @@ kms_hdr@bpc-switch,Fail
 kms_hdr@bpc-switch-dpms,Fail
 kms_plane@pixel-format,Fail
 kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
-kms_rmfb@close-fd,Fail
 kms_rotation_crc@primary-rotation-180,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index 6faf75e667d3..4736ba33ba5d 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1 +1,8 @@
-kms_async_flips@async-flip-with-page-flip-events
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/903b01f7-3f0d-18b7-a4b7-301c118c9321@collabora.com/T/#u
+# IGT Version: 1.28-gb0cc8160e
+# Linux Version: 6.7.0-rc3
+
+# Reported by deqp-runner
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index e2c538a0f954..872647298741 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -1,2 +1,10 @@
 # Suspend to RAM seems to be broken on this machine
-.*suspend.*
\ No newline at end of file
+.*suspend.*
+
+# GPU reset seen and it hangs the machine
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+
+# Skip this test as core_getrevision fails with
+# Module amdgpu already inserted
+amdgpu/amd_module_load@reload
-- 
2.40.1

