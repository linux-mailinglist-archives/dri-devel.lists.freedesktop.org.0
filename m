Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0870953A3FF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243CE10E894;
	Wed,  1 Jun 2022 11:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA1010E737
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5DFAB1F948;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b56qCfJYKWqerObcmxeAeQ9oOKCu2yGnL+WiwwdsJvE=;
 b=STe9VW4edJ4S/O8WLqh0nbuV1ONHCODE7erPkTxK+jQTiEb9unAwZT1YwJKb3Bo7g2Z81U
 05/rkJl3oR24orqTSVWNR8Vq/8eR5fLmzm0q6/xMh6Aif5L5dyD7tXCvByYx2Az/cnFC/4
 uyQeKnZS1SgcDP9Jbi6yZLS/cZ5pttg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b56qCfJYKWqerObcmxeAeQ9oOKCu2yGnL+WiwwdsJvE=;
 b=fbnpB8JVK3EUv2hDIDijkjYu1T6gJjcnCGRweJtR/iFAcroc88DAR9SqxHYapEnlIn88+s
 1l4vuW6JLMMMaFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BA0013B2D;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iOOzDaVMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 09/10] drm/mgag200: Store vidrst flag in device info
Date: Wed,  1 Jun 2022 13:25:21 +0200
Message-Id: <20220601112522.5774-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601112522.5774-1-tzimmermann@suse.de>
References: <20220601112522.5774-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set new vidrst flag in device info for models that synchronize with
external sources (i.e., BMCs). In modesetting, set the corresponding
bits from the device-info flag.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  6 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 12 ++++++------
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  7 ++++---
 drivers/gpu/drm/mgag200/mgag200_reg.h     |  2 ++
 11 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index f0fb13238f4f..1ceb19a987e2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -200,6 +200,9 @@ struct mgag200_device_info {
 	 */
 	unsigned long max_mem_bandwidth;
 
+	/* HW has external source (e.g., BMC) to synchronize with */
+	bool has_vidrst:1;
+
 	/*
 	 * HW does not handle 'startadd' register correctly. Always set
 	 * it's value to 0.
@@ -208,11 +211,12 @@ struct mgag200_device_info {
 };
 
 #define MGAG200_DEVICE_INFO_INIT(_max_hdisplay, _max_vdisplay, _max_mem_bandwidth, \
-				 _bug_no_startadd) \
+				 _has_vidrst, _bug_no_startadd) \
 	{ \
 		.max_hdisplay = (_max_hdisplay), \
 		.max_vdisplay = (_max_vdisplay), \
 		.max_mem_bandwidth = (_max_mem_bandwidth), \
+		.has_vidrst = (_has_vidrst), \
 		.bug_no_startadd = (_bug_no_startadd), \
 	}
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 4ec1b18ab170..58ae5d067263 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -34,7 +34,7 @@ static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
  */
 
 static const struct mgag200_device_info mgag200_g200_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, false);
 
 static void mgag200_g200_interpret_bios(struct mgag200_g200_device *g200,
 					const unsigned char *bios, size_t size)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index a35ba2fdfc0e..ee38d918c727 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 37500, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 37500, false, false);
 
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 649559be1482..4b69206296ee 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh3_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, false);
 
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index e661fad2f8b2..7e44fcc7bb59 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200er_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, false);
 
 struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 07a3862d69de..87a9497ab805 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ev_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 32700, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 32700, false, false);
 
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 7f3987435085..61f944319bc9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ew3_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, false);
 
 static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 78120470b7be..0ccec9358529 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -33,22 +33,22 @@ static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
  */
 
 static const struct mgag200_device_info mgag200_g200se_a_01_device_info =
-	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, true);
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, true);
 
 static const struct mgag200_device_info mgag200_g200se_a_02_device_info =
-	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, true);
+	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, true);
 
 static const struct mgag200_device_info mgag200_g200se_a_03_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, false);
 
 static const struct mgag200_device_info mgag200_g200se_b_01_device_info =
-	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false);
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, false);
 
 static const struct mgag200_device_info mgag200_g200se_b_02_device_info =
-	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false);
+	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, false);
 
 static const struct mgag200_device_info mgag200_g200se_b_03_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, false);
 
 static int mgag200_g200se_init_unique_rev_id(struct mgag200_g200se_device *g200se)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 0943ad2a9999..97002c08da41 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200wb_device_info =
-	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, false);
+	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, false);
 
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index aa85558faa1b..e339f50d6bc8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -377,6 +377,7 @@ static void mgag200_init_regs(struct mga_device *mdev)
 static void mgag200_set_mode_regs(struct mga_device *mdev,
 				  const struct drm_display_mode *mode)
 {
+	const struct mgag200_device_info *info = mdev->info;
 	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
 	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
 	u8 misc, crtcext1, crtcext2, crtcext5;
@@ -411,9 +412,9 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
 		   ((hdisplay & 0x100) >> 7) |
 		   ((hsyncstart & 0x100) >> 6) |
 		    (htotal & 0x40);
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		crtcext1 |= BIT(7) | /* vrsten */
-			    BIT(3); /* hrsten */
+	if (info->has_vidrst)
+		crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
+			    MGAREG_CRTCEXT1_HRSTEN;
 
 	crtcext2 = ((vtotal & 0xc00) >> 10) |
 		   ((vdisplay & 0x400) >> 8) |
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index 60e705283fe8..99a9ab7d9119 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -252,8 +252,10 @@
 
 #define MGAREG_CRTCEXT0_OFFSET_MASK	GENMASK(5, 4)
 
+#define MGAREG_CRTCEXT1_VRSTEN		BIT(7)
 #define MGAREG_CRTCEXT1_VSYNCOFF	BIT(5)
 #define MGAREG_CRTCEXT1_HSYNCOFF	BIT(4)
+#define MGAREG_CRTCEXT1_HRSTEN		BIT(3)
 
 #define MGAREG_CRTCEXT3_MGAMODE		BIT(7)
 
-- 
2.36.1

