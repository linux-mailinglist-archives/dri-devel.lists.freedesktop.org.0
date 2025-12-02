Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DDC9C80E
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75488E26;
	Tue,  2 Dec 2025 17:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OVHkKzQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC43882B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764698373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qCRC5oPbO+K3sZBd+lZF16jQIWHCuxoxWcQWwJA6EXc=;
 b=OVHkKzQ66KjetR/7RZFfyyX8umzfYklYwniovr16PFG3MwXjWuFcemfe3ErO9Hrjd9sMpf
 mK7loXqy96hvkb/k9VIqJYiG1FHmIvR0Kfza7uVrPDMMP2qIBfBvFxCdwUhfBeo9L8dfTo
 3ll/GHc+5rQiMPMOzCA+EYkJzo/J3IA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-EBcPpCktMe-y6l_F7M4-qQ-1; Tue,
 02 Dec 2025 12:59:30 -0500
X-MC-Unique: EBcPpCktMe-y6l_F7M4-qQ-1
X-Mimecast-MFC-AGG-ID: EBcPpCktMe-y6l_F7M4-qQ_1764698368
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F0B43180047F; Tue,  2 Dec 2025 17:59:27 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 54B8918004D8; Tue,  2 Dec 2025 17:59:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH v2] drm/nouveau/gsp: Allocate fwsec-sb at boot
Date: Tue,  2 Dec 2025 12:59:12 -0500
Message-ID: <20251202175918.63533-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

At the moment - the memory allocation for fwsec-sb is created as-needed and
is released after being used. Typically this is at some point well after
driver load, which can cause runtime suspend/resume to initially work on
driver load but then later fail on a machine that has been running for long
enough with sufficiently high enough memory pressure:

  kworker/7:1: page allocation failure: order:5, mode:0xcc0(GFP_KERNEL),
  nodemask=(null),cpuset=/,mems_allowed=0
  CPU: 7 UID: 0 PID: 875159 Comm: kworker/7:1 Not tainted
  6.17.8-300.fc43.x86_64 #1 PREEMPT(lazy)
  Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/2024
  Workqueue: pm pm_runtime_work
  Call Trace:
   <TASK>
   dump_stack_lvl+0x5d/0x80
   warn_alloc+0x163/0x190
   ? __alloc_pages_direct_compact+0x1b3/0x220
   __alloc_pages_slowpath.constprop.0+0x57a/0xb10
   __alloc_frozen_pages_noprof+0x334/0x350
   __alloc_pages_noprof+0xe/0x20
   __dma_direct_alloc_pages.isra.0+0x1eb/0x330
   dma_direct_alloc_pages+0x3c/0x190
   dma_alloc_pages+0x29/0x130
   nvkm_firmware_ctor+0x1ae/0x280 [nouveau]
   nvkm_falcon_fw_ctor+0x3e/0x60 [nouveau]
   nvkm_gsp_fwsec+0x10e/0x2c0 [nouveau]
   ? sysvec_apic_timer_interrupt+0xe/0x90
   nvkm_gsp_fwsec_sb+0x27/0x70 [nouveau]
   tu102_gsp_fini+0x65/0x110 [nouveau]
   ? ktime_get+0x3c/0xf0
   nvkm_subdev_fini+0x67/0xc0 [nouveau]
   nvkm_device_fini+0x94/0x140 [nouveau]
   nvkm_udevice_fini+0x50/0x70 [nouveau]
   nvkm_object_fini+0xb1/0x140 [nouveau]
   nvkm_object_fini+0x70/0x140 [nouveau]
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   nouveau_do_suspend+0xe4/0x170 [nouveau]
   nouveau_pmops_runtime_suspend+0x3e/0xb0 [nouveau]
   pci_pm_runtime_suspend+0x67/0x1a0
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   __rpm_callback+0x45/0x1f0
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   rpm_callback+0x6d/0x80
   rpm_suspend+0xe5/0x5e0
   ? finish_task_switch.isra.0+0x99/0x2c0
   pm_runtime_work+0x98/0xb0
   process_one_work+0x18f/0x350
   worker_thread+0x25a/0x3a0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xf9/0x240
   ? __pfx_kthread+0x10/0x10
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0xf1/0x110
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>

The reason this happens is because the fwsec-sb firmware image only
supports being booted from a contiguous coherent sysmem allocation. If a
system runs into enough memory fragmentation from memory pressure, such as
what can happen on systems with low amounts of memory, this can lead to a
situation where it later becomes impossible to find space for a large
enough contiguous allocation to hold fwsec-sb. This causes us to fail to
boot the firmware image, causing the GPU to fail booting and causing the
driver to fail.

Since this firmware can't use non-contiguous allocations, the best solution
to avoid this issue is to simply allocate the memory for fwsec-sb during
initial driver-load, and reuse the memory allocation when fwsec-sb needs to
be used. We then release the memory allocations on driver unload.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 594766ca3e53 ("drm/nouveau/gsp: move booter handling to GPU-specific code")
Cc: <stable@vger.kernel.org> # v6.16+

---
V2:
* I realized we don't need to keep fwsec-frts allocated since we only use
  it at the start, just fwsec-sb.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 61 +++++++++++++------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  3 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 10 ++-
 4 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 226c7ec56b8ed..b8b97e10ae83e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -73,6 +73,10 @@ struct nvkm_gsp {
 
 		const struct firmware *bl;
 		const struct firmware *rm;
+
+		struct {
+			struct nvkm_falcon_fw sb;
+		} falcon;
 	} fws;
 
 	struct nvkm_firmware fw;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 5b721bd9d7994..5037602466604 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -259,18 +259,16 @@ nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
 }
 
 static int
-nvkm_gsp_fwsec(struct nvkm_gsp *gsp, const char *name, u32 init_cmd)
+nvkm_gsp_fwsec_init(struct nvkm_gsp *gsp, struct nvkm_falcon_fw *fw, const char *name, u32 init_cmd)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvkm_device *device = subdev->device;
 	struct nvkm_bios *bios = device->bios;
 	const union nvfw_falcon_ucode_desc *desc;
 	struct nvbios_pmuE flcn_ucode;
-	u8 idx, ver, hdr;
 	u32 data;
 	u16 size, vers;
-	struct nvkm_falcon_fw fw = {};
-	u32 mbox0 = 0;
+	u8 idx, ver, hdr;
 	int ret;
 
 	/* Lookup in VBIOS. */
@@ -291,8 +289,8 @@ nvkm_gsp_fwsec(struct nvkm_gsp *gsp, const char *name, u32 init_cmd)
 	vers = (desc->v2.Hdr & 0x0000ff00) >> 8;
 
 	switch (vers) {
-	case 2: ret = nvkm_gsp_fwsec_v2(gsp, name, &desc->v2, size, init_cmd, &fw); break;
-	case 3: ret = nvkm_gsp_fwsec_v3(gsp, name, &desc->v3, size, init_cmd, &fw); break;
+	case 2: ret = nvkm_gsp_fwsec_v2(gsp, name, &desc->v2, size, init_cmd, fw); break;
+	case 3: ret = nvkm_gsp_fwsec_v3(gsp, name, &desc->v3, size, init_cmd, fw); break;
 	default:
 		nvkm_error(subdev, "%s(v%d): version unknown\n", name, vers);
 		return -EINVAL;
@@ -303,15 +301,19 @@ nvkm_gsp_fwsec(struct nvkm_gsp *gsp, const char *name, u32 init_cmd)
 		return ret;
 	}
 
-	/* Boot. */
-	ret = nvkm_falcon_fw_boot(&fw, subdev, true, &mbox0, NULL, 0, 0);
-	nvkm_falcon_fw_dtor(&fw);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
+static int
+nvkm_gsp_fwsec_boot(struct nvkm_gsp *gsp, struct nvkm_falcon_fw *fw)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	u32 mbox0 = 0;
+
+	/* Boot */
+	return nvkm_falcon_fw_boot(fw, subdev, true, &mbox0, NULL, 0, 0);
+}
+
 int
 nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
 {
@@ -320,7 +322,7 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
 	int ret;
 	u32 err;
 
-	ret = nvkm_gsp_fwsec(gsp, "fwsec-sb", NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
+	ret = nvkm_gsp_fwsec_boot(gsp, &gsp->fws.falcon.sb);
 	if (ret)
 		return ret;
 
@@ -334,27 +336,48 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
 	return 0;
 }
 
+int
+nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+{
+	return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
+				   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
+}
+
+void
+nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
+{
+	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
+}
+
 int
 nvkm_gsp_fwsec_frts(struct nvkm_gsp *gsp)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvkm_device *device = subdev->device;
+	struct nvkm_falcon_fw fw = {};
 	int ret;
 	u32 err, wpr2_lo, wpr2_hi;
 
-	ret = nvkm_gsp_fwsec(gsp, "fwsec-frts", NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS);
+	ret = nvkm_gsp_fwsec_init(gsp, &fw, "fwsec-frts", NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS);
 	if (ret)
 		return ret;
 
+	ret = nvkm_gsp_fwsec_boot(gsp, &fw);
+	if (ret)
+		goto fwsec_dtor;
+
 	/* Verify. */
 	err = nvkm_rd32(device, 0x001400 + (0xe * 4)) >> 16;
 	if (err) {
 		nvkm_error(subdev, "fwsec-frts: 0x%04x\n", err);
-		return -EIO;
+		ret = -EIO;
+	} else {
+		wpr2_lo = nvkm_rd32(device, 0x1fa824);
+		wpr2_hi = nvkm_rd32(device, 0x1fa828);
+		nvkm_debug(subdev, "fwsec-frts: WPR2 @ %08x - %08x\n", wpr2_lo, wpr2_hi);
 	}
 
-	wpr2_lo = nvkm_rd32(device, 0x1fa824);
-	wpr2_hi = nvkm_rd32(device, 0x1fa828);
-	nvkm_debug(subdev, "fwsec-frts: WPR2 @ %08x - %08x\n", wpr2_lo, wpr2_hi);
-	return 0;
+fwsec_dtor:
+	nvkm_falcon_fw_dtor(&fw);
+	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index c3494b7ac572b..86bdd203bc107 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -6,7 +6,10 @@
 enum nvkm_acr_lsf_id;
 
 int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
+
+int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
 int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
+void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
 
 struct nvkm_gsp_fwif {
 	int version;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 32e6a065d6d7a..2a7e80c6d70f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1817,12 +1817,16 @@ r535_gsp_rm_boot_ctor(struct nvkm_gsp *gsp)
 	RM_RISCV_UCODE_DESC *desc;
 	int ret;
 
+	ret = nvkm_gsp_fwsec_sb_ctor(gsp);
+	if (ret)
+		return ret;
+
 	hdr = nvfw_bin_hdr(&gsp->subdev, fw->data);
 	desc = (void *)fw->data + hdr->header_offset;
 
 	ret = nvkm_gsp_mem_ctor(gsp, hdr->data_size, &gsp->boot.fw);
 	if (ret)
-		return ret;
+		goto dtor_fwsec;
 
 	memcpy(gsp->boot.fw.data, fw->data + hdr->data_offset, hdr->data_size);
 
@@ -1831,6 +1835,9 @@ r535_gsp_rm_boot_ctor(struct nvkm_gsp *gsp)
 	gsp->boot.manifest_offset = desc->manifestOffset;
 	gsp->boot.app_version = desc->appVersion;
 	return 0;
+dtor_fwsec:
+	nvkm_gsp_fwsec_sb_dtor(gsp);
+	return ret;
 }
 
 static const struct nvkm_firmware_func
@@ -2101,6 +2108,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	mutex_destroy(&gsp->cmdq.mutex);
 
 	nvkm_gsp_dtor_fws(gsp);
+	nvkm_gsp_fwsec_sb_dtor(gsp);
 
 	nvkm_gsp_mem_dtor(&gsp->rmargs);
 	nvkm_gsp_mem_dtor(&gsp->wpr_meta);

base-commit: 62433efe0b06042d8016ba0713d801165a939229
-- 
2.52.0

