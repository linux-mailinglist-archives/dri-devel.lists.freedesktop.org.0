Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173EB53A401
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6CA10E79E;
	Wed,  1 Jun 2022 11:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3710E7A7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F9B321B10;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MI984iLzJWlQS12H7OVxN9yCjdkrjjOSR7YCg4ROoA=;
 b=BFJ3PdleknM0M/SRGgLBnldQfW8JJIuYjNLFbxcw0TyGU/0w0Qn5J7RhqMdEW7GpSb4cMb
 K8W3cet247AxLa+OtziJ0/9gp+khtdWSzV7jdb7c5osTyI21SIDgGxJzdbl98zeXpQYEI+
 jy6t08NAHBNjFbKhgbkNIDN2Kvcw0eo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MI984iLzJWlQS12H7OVxN9yCjdkrjjOSR7YCg4ROoA=;
 b=g4T6mxxrwYE5isPuqwADGR7EGklPz5ka00ml6HUuVoCKHH8WNb6IMsA3Hz/Fw5uji8MrSM
 Y6upW1Y07oQi/0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 611E21330F;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kDfRFqVMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 10/10] drm/mgag200: Store positions of I2C data and clock bits
 in device info
Date: Wed,  1 Jun 2022 13:25:22 +0200
Message-Id: <20220601112522.5774-11-tzimmermann@suse.de>
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

The bits for accessing I2C data and clock channels varies among
models. Store them in the device-info structure for consumption
by the DDC code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 12 +++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 12 +++++-----
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c     | 27 +++--------------------
 10 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 1ceb19a987e2..301c4ab46539 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -203,6 +203,11 @@ struct mgag200_device_info {
 	/* HW has external source (e.g., BMC) to synchronize with */
 	bool has_vidrst:1;
 
+	struct {
+		unsigned data_bit:3;
+		unsigned clock_bit:3;
+	} i2c;
+
 	/*
 	 * HW does not handle 'startadd' register correctly. Always set
 	 * it's value to 0.
@@ -211,12 +216,17 @@ struct mgag200_device_info {
 };
 
 #define MGAG200_DEVICE_INFO_INIT(_max_hdisplay, _max_vdisplay, _max_mem_bandwidth, \
-				 _has_vidrst, _bug_no_startadd) \
+				 _has_vidrst, _i2c_data_bit, _i2c_clock_bit, \
+				 _bug_no_startadd) \
 	{ \
 		.max_hdisplay = (_max_hdisplay), \
 		.max_vdisplay = (_max_vdisplay), \
 		.max_mem_bandwidth = (_max_mem_bandwidth), \
 		.has_vidrst = (_has_vidrst), \
+		.i2c = { \
+			.data_bit = (_i2c_data_bit), \
+			.clock_bit = (_i2c_clock_bit), \
+		}, \
 		.bug_no_startadd = (_bug_no_startadd), \
 	}
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 58ae5d067263..616e11391e02 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -34,7 +34,7 @@ static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
  */
 
 static const struct mgag200_device_info mgag200_g200_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 3, false);
 
 static void mgag200_g200_interpret_bios(struct mgag200_g200_device *g200,
 					const unsigned char *bios, size_t size)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index ee38d918c727..1b9a22728744 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 37500, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 37500, false, 1, 0, false);
 
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 4b69206296ee..438cda1b14c9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh3_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
 
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 7e44fcc7bb59..0790d4e6463d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200er_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, 1, 0, false);
 
 struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 87a9497ab805..5353422d0eef 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ev_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 32700, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 32700, false, 0, 1, false);
 
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 61f944319bc9..3bfc1324cf78 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ew3_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
 
 static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 0ccec9358529..0a3e66695e22 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -33,22 +33,22 @@ static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
  */
 
 static const struct mgag200_device_info mgag200_g200se_a_01_device_info =
-	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, true);
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, 0, 1, true);
 
 static const struct mgag200_device_info mgag200_g200se_a_02_device_info =
-	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, true);
+	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, 0, 1, true);
 
 static const struct mgag200_device_info mgag200_g200se_a_03_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, 0, 1, false);
 
 static const struct mgag200_device_info mgag200_g200se_b_01_device_info =
-	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, false);
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false, 0, 1, false);
 
 static const struct mgag200_device_info mgag200_g200se_b_02_device_info =
-	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, false);
+	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false, 0, 1, false);
 
 static const struct mgag200_device_info mgag200_g200se_b_03_device_info =
-	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false, 0, 1, false);
 
 static int mgag200_g200se_init_unique_rev_id(struct mgag200_g200se_device *g200se)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 97002c08da41..c8450ac8eaec 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200wb_device_info =
-	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, false);
+	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
 
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index f57b33917152..0c48bdf3e7f8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -96,36 +96,15 @@ static void mgag200_i2c_release(void *res)
 int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 {
 	struct drm_device *dev = &mdev->base;
+	const struct mgag200_device_info *info = mdev->info;
 	int ret;
-	int data, clock;
 
 	WREG_DAC(MGA1064_GEN_IO_CTL2, 1);
 	WREG_DAC(MGA1064_GEN_IO_DATA, 0xff);
 	WREG_DAC(MGA1064_GEN_IO_CTL, 0);
 
-	switch (mdev->type) {
-	case G200_SE_A:
-	case G200_SE_B:
-	case G200_EV:
-	case G200_WB:
-	case G200_EW3:
-		data = 1;
-		clock = 2;
-		break;
-	case G200_EH:
-	case G200_EH3:
-	case G200_ER:
-		data = 2;
-		clock = 1;
-		break;
-	default:
-		data = 2;
-		clock = 8;
-		break;
-	}
-
-	i2c->data = data;
-	i2c->clock = clock;
+	i2c->data = BIT(info->i2c.data_bit);
+	i2c->clock = BIT(info->i2c.clock_bit);
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
-- 
2.36.1

