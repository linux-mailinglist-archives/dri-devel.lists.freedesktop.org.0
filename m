Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D2823305E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 12:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9B6E8CD;
	Thu, 30 Jul 2020 10:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD73A6E8CA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:28:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A25B4B024;
 Thu, 30 Jul 2020 10:29:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, lyude@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
Subject: [PATCH v2 8/8] drm/mgag200: Add support for G200 desktop cards
Date: Thu, 30 Jul 2020 12:28:44 +0200
Message-Id: <20200730102844.10995-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730102844.10995-1-tzimmermann@suse.de>
References: <20200730102844.10995-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for G200 desktop cards. We can reuse the whole
memory and modesetting code. A few PCI and DAC register values have to
be updated accordingly.

The most significant change is in the PLL setup. The driver parses the
device's BIOS to retrieve clock limits and reference clocks. With no BIOS
found, safe defaults are being used.

v2:
	* copy BIOS ROM to system memory and access with regular
	  load/store; resolves potential HW limitations
	* fix some stray whitespaces

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Co-developed-by: Egbert Eich <eich@suse.com>
Signed-off-by: Egbert Eich <eich@suse.com>
Co-developed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 MAINTAINERS                            |   2 +-
 drivers/gpu/drm/mgag200/Kconfig        |  12 +--
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 137 ++++++++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  10 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c |  80 +++++++++++++++
 5 files changed, 232 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ba2ef353408..04e7e80a5f57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5406,7 +5406,7 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/mga/
 F:	include/uapi/drm/mga_drm.h
 
-DRM DRIVER FOR MGA G200 SERVER GRAPHICS CHIPS
+DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
 M:	Dave Airlie <airlied@redhat.com>
 S:	Odd Fixes
 F:	drivers/gpu/drm/mgag200/
diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index 93be766715c9..eec59658a938 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -1,13 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_MGAG200
-	tristate "Kernel modesetting driver for MGA G200 server engines"
+	tristate "Matrox G200"
 	depends on DRM && PCI && MMU
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
-	 This is a KMS driver for the MGA G200 server chips, it
-	 does not support the original MGA G200 or any of the desktop
-	 chips. It requires 0.3.0 of the modesetting userspace driver,
-	 and a version of mga driver that will fail on KMS enabled
-	 devices.
-
+	 This is a KMS driver for Matrox G200 chips. It supports the original
+	 MGA G200 desktop chips and the server variants. It requires 0.3.0
+	 of the modesetting userspace driver, and a version of mga driver
+	 that will fail on KMS enabled devices.
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index f7652e16365c..5c854bc7dc86 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -64,6 +64,14 @@ static int mgag200_regs_init(struct mga_device *mdev)
 	u8 crtcext3;
 
 	switch (mdev->type) {
+	case G200_PCI:
+	case G200_AGP:
+		if (mgag200_has_sgram(mdev))
+			option = 0x4049cd21;
+		else
+			option = 0x40499121;
+		option2 = 0x00008000;
+		break;
 	case G200_SE_A:
 	case G200_SE_B:
 		if (mgag200_has_sgram(mdev))
@@ -115,6 +123,129 @@ static int mgag200_regs_init(struct mga_device *mdev)
 	return 0;
 }
 
+static void mgag200_g200_interpret_bios(struct mga_device *mdev,
+					const unsigned char *bios,
+					size_t size)
+{
+	static const char matrox[] = {'M', 'A', 'T', 'R', 'O', 'X'};
+	static const unsigned int expected_length[6] = {
+		0, 64, 64, 64, 128, 128
+	};
+	struct drm_device *dev = &mdev->base;
+	const unsigned char *pins;
+	unsigned int pins_len, version;
+	int offset;
+	int tmp;
+
+	/* Test for MATROX string. */
+	if (size < 45 + sizeof(matrox))
+		return;
+	if (memcmp(&bios[45], matrox, sizeof(matrox)) != 0)
+		return;
+
+	/* Get the PInS offset. */
+	if (size < MGA_BIOS_OFFSET + 2)
+		return;
+	offset = (bios[MGA_BIOS_OFFSET + 1] << 8) | bios[MGA_BIOS_OFFSET];
+
+	/* Get PInS data structure. */
+
+	if (size < offset + 6)
+		return;
+	pins = bios + offset;
+	if (pins[0] == 0x2e && pins[1] == 0x41) {
+		version = pins[5];
+		pins_len = pins[2];
+	} else {
+		version = 1;
+		pins_len = pins[0] + (pins[1] << 8);
+	}
+
+	if (version < 1 || version > 5) {
+		drm_warn(dev, "Unknown BIOS PInS version: %d\n", version);
+		return;
+	}
+	if (pins_len != expected_length[version]) {
+		drm_warn(dev, "Unexpected BIOS PInS size: %d expeced: %d\n",
+			 pins_len, expected_length[version]);
+		return;
+	}
+	if (size < offset + pins_len)
+		return;
+
+	drm_dbg_kms(dev, "MATROX BIOS PInS version %d size: %d found\n",
+		    version, pins_len);
+
+	/* Extract the clock values */
+
+	switch (version) {
+	case 1:
+		tmp = pins[24] + (pins[25] << 8);
+		if (tmp)
+			mdev->model.g200.pclk_max = tmp * 10;
+		break;
+	case 2:
+		if (pins[41] != 0xff)
+			mdev->model.g200.pclk_max = (pins[41] + 100) * 1000;
+		break;
+	case 3:
+		if (pins[36] != 0xff)
+			mdev->model.g200.pclk_max = (pins[36] + 100) * 1000;
+		if (pins[52] & 0x20)
+			mdev->model.g200.ref_clk = 14318;
+		break;
+	case 4:
+		if (pins[39] != 0xff)
+			mdev->model.g200.pclk_max = pins[39] * 4 * 1000;
+		if (pins[92] & 0x01)
+			mdev->model.g200.ref_clk = 14318;
+		break;
+	case 5:
+		tmp = pins[4] ? 8000 : 6000;
+		if (pins[123] != 0xff)
+			mdev->model.g200.pclk_min = pins[123] * tmp;
+		if (pins[38] != 0xff)
+			mdev->model.g200.pclk_max = pins[38] * tmp;
+		if (pins[110] & 0x01)
+			mdev->model.g200.ref_clk = 14318;
+		break;
+	default:
+		break;
+	}
+}
+
+static void mgag200_g200_init_refclk(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	unsigned char __iomem *rom;
+	unsigned char *bios;
+	size_t size;
+
+	mdev->model.g200.pclk_min = 50000;
+	mdev->model.g200.pclk_max = 230000;
+	mdev->model.g200.ref_clk = 27050;
+
+	rom = pci_map_rom(dev->pdev, &size);
+	if (!rom)
+		return;
+
+	bios = vmalloc(size);
+	if (!bios)
+		goto out;
+	memcpy_fromio(bios, rom, size);
+
+	if (size != 0 && bios[0] == 0x55 && bios[1] == 0xaa)
+		mgag200_g200_interpret_bios(mdev, bios, size);
+
+	drm_dbg_kms(dev, "pclk_min: %ld pclk_max: %ld ref_clk: %ld\n",
+		    mdev->model.g200.pclk_min, mdev->model.g200.pclk_max,
+		    mdev->model.g200.ref_clk);
+
+	vfree(bios);
+out:
+	pci_unmap_rom(dev->pdev, rom);
+}
+
 static void mgag200_g200se_init_unique_id(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
@@ -138,7 +269,9 @@ static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 	if (ret)
 		return ret;
 
-	if (IS_G200_SE(mdev))
+	if (mdev->type == G200_PCI || mdev->type == G200_AGP)
+		mgag200_g200_init_refclk(mdev);
+	else if (IS_G200_SE(mdev))
 		mgag200_g200se_init_unique_id(mdev);
 
 	ret = mgag200_mm_init(mdev);
@@ -182,6 +315,8 @@ mgag200_device_create(struct pci_dev *pdev, unsigned long flags)
  */
 
 static const struct pci_device_id mgag200_pciidlist[] = {
+	{ PCI_VENDOR_ID_MATROX, 0x520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_PCI },
+	{ PCI_VENDOR_ID_MATROX, 0x521, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_AGP },
 	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
 		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
 	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE_B },
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 048efe635aff..749a075fe9e4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -38,6 +38,8 @@
 #define RREG32(reg) ioread32(((void __iomem *)mdev->rmmio) + (reg))
 #define WREG32(reg, v) iowrite32(v, ((void __iomem *)mdev->rmmio) + (reg))
 
+#define MGA_BIOS_OFFSET		0x7ffc
+
 #define ATTR_INDEX 0x1fc0
 #define ATTR_DATA 0x1fc1
 
@@ -129,6 +131,8 @@ struct mga_mc {
 };
 
 enum mga_type {
+	G200_PCI,
+	G200_AGP,
 	G200_SE_A,
 	G200_SE_B,
 	G200_WB,
@@ -167,12 +171,18 @@ struct mga_device {
 	int fb_mtrr;
 
 	union {
+		struct {
+			long ref_clk;
+			long pclk_min;
+			long pclk_max;
+		} g200;
 		struct {
 			/* SE model number stored in reg 0x1e24 */
 			u32 unique_rev_id;
 		} g200se;
 	} model;
 
+
 	struct mga_connector connector;
 	struct drm_simple_display_pipe display_pipe;
 };
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 752409c7f326..38672f9e5c4f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -108,6 +108,77 @@ static inline void mga_wait_busy(struct mga_device *mdev)
 	} while ((status & 0x01) && time_before(jiffies, timeout));
 }
 
+/*
+ * PLL setup
+ */
+
+static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
+{
+	struct drm_device *dev = &mdev->base;
+	const int post_div_max = 7;
+	const int in_div_min = 1;
+	const int in_div_max = 6;
+	const int feed_div_min = 7;
+	const int feed_div_max = 127;
+	u8 testm, testn;
+	u8 n = 0, m = 0, p, s;
+	long f_vco;
+	long computed;
+	long delta, tmp_delta;
+	long ref_clk = mdev->model.g200.ref_clk;
+	long p_clk_min = mdev->model.g200.pclk_min;
+	long p_clk_max =  mdev->model.g200.pclk_max;
+
+	if (clock > p_clk_max) {
+		drm_err(dev, "Pixel Clock %ld too high\n", clock);
+		return 1;
+	}
+
+	if (clock < p_clk_min >> 3)
+		clock = p_clk_min >> 3;
+
+	f_vco = clock;
+	for (p = 0;
+	     p <= post_div_max && f_vco < p_clk_min;
+	     p = (p << 1) + 1, f_vco <<= 1)
+		;
+
+	delta = clock;
+
+	for (testm = in_div_min; testm <= in_div_max; testm++) {
+		for (testn = feed_div_min; testn <= feed_div_max; testn++) {
+			computed = ref_clk * (testn + 1) / (testm + 1);
+			if (computed < f_vco)
+				tmp_delta = f_vco - computed;
+			else
+				tmp_delta = computed - f_vco;
+			if (tmp_delta < delta) {
+				delta = tmp_delta;
+				m = testm;
+				n = testn;
+			}
+		}
+	}
+	f_vco = ref_clk * (n + 1) / (m + 1);
+	if (f_vco < 100000)
+		s = 0;
+	else if (f_vco < 140000)
+		s = 1;
+	else if (f_vco < 180000)
+		s = 2;
+	else
+		s = 3;
+
+	drm_dbg_kms(dev, "clock: %ld vco: %ld m: %d n: %d p: %d s: %d\n",
+		    clock, f_vco, m, n, p, s);
+
+	WREG_DAC(MGA1064_PIX_PLLC_M, m);
+	WREG_DAC(MGA1064_PIX_PLLC_N, n);
+	WREG_DAC(MGA1064_PIX_PLLC_P, (p | (s << 3)));
+
+	return 0;
+}
+
 #define P_ARRAY_SIZE 9
 
 static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
@@ -717,6 +788,9 @@ static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 	u8 misc;
 
 	switch(mdev->type) {
+	case G200_PCI:
+	case G200_AGP:
+		return mgag200_g200_set_plls(mdev, clock);
 	case G200_SE_A:
 	case G200_SE_B:
 		return mga_g200se_set_plls(mdev, clock);
@@ -894,6 +968,12 @@ static void mgag200_set_dac_regs(struct mga_device *mdev)
 	};
 
 	switch (mdev->type) {
+	case G200_PCI:
+	case G200_AGP:
+		dacvalue[MGA1064_SYS_PLL_M] = 0x04;
+		dacvalue[MGA1064_SYS_PLL_N] = 0x2D;
+		dacvalue[MGA1064_SYS_PLL_P] = 0x19;
+		break;
 	case G200_SE_A:
 	case G200_SE_B:
 		dacvalue[MGA1064_VREF_CTL] = 0x03;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
