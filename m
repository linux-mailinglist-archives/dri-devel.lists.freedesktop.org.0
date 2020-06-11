Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5941F6393
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1522F89C27;
	Thu, 11 Jun 2020 08:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414F089C27
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:28:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D395AAD0;
 Thu, 11 Jun 2020 08:28:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, noralf@tronnes.org,
 chen@aspeedtech.com
Subject: [PATCH 2/3] drm/ast: Upcast from DRM device to ast structure via
 to_ast_private()
Date: Thu, 11 Jun 2020 10:28:08 +0200
Message-Id: <20200611082809.7838-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611082809.7838-1-tzimmermann@suse.de>
References: <20200611082809.7838-1-tzimmermann@suse.de>
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

All upcasting from struct drm_device to struct ast_private is now
performed via to_ast_private(). Using struct drm_device.dev_private is
deprecated. The ast variable in ast_crtc_helperatomic_check() is unused,
so removed it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 24 +++++++++----------
 drivers/gpu/drm/ast/ast_drv.h   |  5 ++++
 drivers/gpu/drm/ast/ast_main.c  | 10 ++++----
 drivers/gpu/drm/ast/ast_mode.c  | 41 ++++++++++++++++-----------------
 drivers/gpu/drm/ast/ast_post.c  | 16 ++++++-------
 5 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 98cd69269263f..4b85a504825a2 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -10,7 +10,7 @@ MODULE_FIRMWARE("ast_dp501_fw.bin");
 
 static int ast_load_dp501_microcode(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	return request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
 }
@@ -93,7 +93,7 @@ static bool wait_fw_ready(struct ast_private *ast)
 
 static bool ast_write_cmd(struct drm_device *dev, u8 data)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	int retry = 0;
 	if (wait_nack(ast)) {
 		send_nack(ast);
@@ -115,7 +115,7 @@ static bool ast_write_cmd(struct drm_device *dev, u8 data)
 
 static bool ast_write_data(struct drm_device *dev, u8 data)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	if (wait_nack(ast)) {
 		send_nack(ast);
@@ -133,7 +133,7 @@ static bool ast_write_data(struct drm_device *dev, u8 data)
 #if 0
 static bool ast_read_data(struct drm_device *dev, u8 *data)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 tmp;
 
 	*data = 0;
@@ -172,7 +172,7 @@ static u32 get_fw_base(struct ast_private *ast)
 
 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u32 i, data;
 	u32 boot_address;
 
@@ -188,7 +188,7 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
 
 static bool ast_launch_m68k(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u32 i, data, len = 0;
 	u32 boot_address;
 	u8 *fw_addr = NULL;
@@ -255,7 +255,7 @@ static bool ast_launch_m68k(struct drm_device *dev)
 
 u8 ast_get_dp501_max_clk(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u32 boot_address, offset, data;
 	u8 linkcap[4], linkrate, linklanes, maxclk = 0xff;
 
@@ -283,7 +283,7 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
 
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u32 i, boot_address, offset, data;
 
 	boot_address = get_fw_base(ast);
@@ -312,7 +312,7 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 
 static bool ast_init_dvo(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 jreg;
 	u32 data;
 	ast_write32(ast, 0xf004, 0x1e6e0000);
@@ -385,7 +385,7 @@ static bool ast_init_dvo(struct drm_device *dev)
 
 static void ast_init_analog(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u32 data;
 
 	/*
@@ -412,7 +412,7 @@ static void ast_init_analog(struct drm_device *dev)
 
 void ast_init_3rdtx(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 jreg;
 
 	if (ast->chip == AST2300 || ast->chip == AST2400) {
@@ -438,7 +438,7 @@ void ast_init_3rdtx(struct drm_device *dev)
 
 void ast_release_firmware(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	release_firmware(ast->dp501_fw);
 	ast->dp501_fw = NULL;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 09f2659e29118..c44c1376c6977 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -136,6 +136,11 @@ struct ast_private {
 	const struct firmware *dp501_fw;	/* dp501 fw */
 };
 
+static inline struct ast_private *to_ast_private(struct drm_device *dev)
+{
+	return dev->dev_private;
+}
+
 int ast_driver_load(struct drm_device *dev, unsigned long flags);
 void ast_driver_unload(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f48a9f62368c0..a2ef3d9077671 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -67,7 +67,7 @@ uint8_t ast_get_index_reg_mask(struct ast_private *ast,
 static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 {
 	struct device_node *np = dev->pdev->dev.of_node;
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	uint32_t data, jregd0, jregd1;
 
 	/* Defaults */
@@ -117,7 +117,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 
 static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	uint32_t jreg, scu_rev;
 
 	/*
@@ -262,7 +262,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 static int ast_get_dram_info(struct drm_device *dev)
 {
 	struct device_node *np = dev->pdev->dev.of_node;
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
 	uint32_t denum, num, div, ref_pll, dsel;
 
@@ -388,7 +388,7 @@ static const struct drm_mode_config_funcs ast_mode_funcs = {
 
 static u32 ast_get_vram_info(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 jreg;
 	u32 vram_size;
 	ast_open_key(ast);
@@ -509,7 +509,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 
 void ast_driver_unload(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	/* enable standard VGA decode */
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index be0e2250708fa..10211751182da 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -565,7 +565,7 @@ static void
 ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct ast_private *ast = plane->dev->dev_private;
+	struct ast_private *ast = to_ast_private(plane->dev);
 	struct drm_plane_state *state = plane->state;
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
@@ -585,7 +585,7 @@ static void
 ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 					struct drm_plane_state *old_state)
 {
-	struct ast_private *ast = plane->dev->dev_private;
+	struct ast_private *ast = to_ast_private(plane->dev);
 
 	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x20);
 }
@@ -633,7 +633,7 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 	    WARN_ON_ONCE(fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL; /* BUG: didn't test in atomic_check() */
 
-	ast = crtc->dev->dev_private;
+	ast = to_ast_private(crtc->dev);
 
 	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 	src = drm_gem_vram_vmap(gbo);
@@ -705,7 +705,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *state = plane->state;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
-	struct ast_private *ast = plane->dev->dev_private;
+	struct ast_private *ast = to_ast_private(plane->dev);
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
 	struct drm_gem_vram_object *gbo;
 	s64 off;
@@ -738,7 +738,7 @@ static void
 ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct ast_private *ast = plane->dev->dev_private;
+	struct ast_private *ast = to_ast_private(plane->dev);
 
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
 }
@@ -766,7 +766,7 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 
 static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
+	struct ast_private *ast = to_ast_private(crtc->dev);
 
 	/* TODO: Maybe control display signal generation with
 	 *       Sync Enable (bit CR17.7).
@@ -789,7 +789,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					struct drm_crtc_state *state)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	bool succ;
@@ -815,7 +814,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc,
 					 struct drm_crtc_state *old_crtc_state)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
+	struct ast_private *ast = to_ast_private(crtc->dev);
 
 	ast_open_key(ast);
 }
@@ -824,7 +823,7 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 					 struct drm_crtc_state *old_crtc_state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	struct ast_vbios_mode_info *vbios_mode_info;
@@ -937,7 +936,7 @@ static const struct drm_crtc_funcs ast_crtc_funcs = {
 
 static int ast_crtc_init(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	struct ast_crtc *crtc;
 	int ret;
 
@@ -966,7 +965,7 @@ static int ast_crtc_init(struct drm_device *dev)
 
 static int ast_encoder_init(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	struct drm_encoder *encoder = &ast->encoder;
 	int ret;
 
@@ -986,7 +985,7 @@ static int ast_encoder_init(struct drm_device *dev)
 static int ast_get_modes(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
-	struct ast_private *ast = connector->dev->dev_private;
+	struct ast_private *ast = to_ast_private(connector->dev);
 	struct edid *edid;
 	int ret;
 	bool flags = false;
@@ -1017,7 +1016,7 @@ static int ast_get_modes(struct drm_connector *connector)
 static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 			  struct drm_display_mode *mode)
 {
-	struct ast_private *ast = connector->dev->dev_private;
+	struct ast_private *ast = to_ast_private(connector->dev);
 	int flags = MODE_NOMODE;
 	uint32_t jtemp;
 
@@ -1128,7 +1127,7 @@ static int ast_connector_init(struct drm_device *dev)
 /* allocate cursor cache and pin at start of VRAM */
 static int ast_cursor_init(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
 	int ret;
@@ -1166,7 +1165,7 @@ static int ast_cursor_init(struct drm_device *dev)
 
 static void ast_cursor_fini(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	size_t i;
 	struct drm_gem_vram_object *gbo;
 
@@ -1179,7 +1178,7 @@ static void ast_cursor_fini(struct drm_device *dev)
 
 int ast_mode_init(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	int ret;
 
 	memset(&ast->primary_plane, 0, sizeof(ast->primary_plane));
@@ -1223,7 +1222,7 @@ void ast_mode_fini(struct drm_device *dev)
 static int get_clock(void *i2c_priv)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = i2c->dev->dev_private;
+	struct ast_private *ast = to_ast_private(i2c->dev);
 	uint32_t val, val2, count, pass;
 
 	count = 0;
@@ -1245,7 +1244,7 @@ static int get_clock(void *i2c_priv)
 static int get_data(void *i2c_priv)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = i2c->dev->dev_private;
+	struct ast_private *ast = to_ast_private(i2c->dev);
 	uint32_t val, val2, count, pass;
 
 	count = 0;
@@ -1267,7 +1266,7 @@ static int get_data(void *i2c_priv)
 static void set_clock(void *i2c_priv, int clock)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = i2c->dev->dev_private;
+	struct ast_private *ast = to_ast_private(i2c->dev);
 	int i;
 	u8 ujcrb7, jtemp;
 
@@ -1283,7 +1282,7 @@ static void set_clock(void *i2c_priv, int clock)
 static void set_data(void *i2c_priv, int data)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = i2c->dev->dev_private;
+	struct ast_private *ast = to_ast_private(i2c->dev);
 	int i;
 	u8 ujcrb7, jtemp;
 
@@ -1431,7 +1430,7 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 			   int x, int y)
 {
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
-	struct ast_private *ast = crtc->dev->dev_private;
+	struct ast_private *ast = to_ast_private(crtc->dev);
 	struct drm_gem_vram_object *gbo;
 	int x_offset, y_offset;
 	u8 *dst, *sig;
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index af0c8ebb009a1..226e1290227ad 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -39,7 +39,7 @@ static void ast_post_chip_2500(struct drm_device *dev);
 
 void ast_enable_vga(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	ast_io_write8(ast, AST_IO_VGA_ENABLE_PORT, 0x01);
 	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
@@ -47,7 +47,7 @@ void ast_enable_vga(struct drm_device *dev)
 
 void ast_enable_mmio(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
 }
@@ -55,7 +55,7 @@ void ast_enable_mmio(struct drm_device *dev)
 
 bool ast_is_vga_enabled(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 ch;
 
 	ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
@@ -70,7 +70,7 @@ static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
 static void
 ast_set_def_ext_reg(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 i, index, reg;
 	const u8 *ext_reg_info;
 
@@ -272,7 +272,7 @@ static void cbrdlli_ast2150(struct ast_private *ast, int busw)
 
 static void ast_init_dram_reg(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u8 j;
 	u32 data, temp, i;
 	const struct ast_dramstruct *dram_reg_info;
@@ -366,7 +366,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
 void ast_post_gpu(struct drm_device *dev)
 {
 	u32 reg;
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 
 	pci_read_config_dword(ast->dev->pdev, 0x04, &reg);
 	reg |= 0x3;
@@ -1596,7 +1596,7 @@ static void ddr2_init(struct ast_private *ast, struct ast2300_dram_param *param)
 
 static void ast_post_chip_2300(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	struct ast2300_dram_param param;
 	u32 temp;
 	u8 reg;
@@ -2028,7 +2028,7 @@ static bool ast_dram_init_2500(struct ast_private *ast)
 
 void ast_post_chip_2500(struct drm_device *dev)
 {
-	struct ast_private *ast = dev->dev_private;
+	struct ast_private *ast = to_ast_private(dev);
 	u32 temp;
 	u8 reg;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
