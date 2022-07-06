Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D27569030
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB29C11BCEE;
	Wed,  6 Jul 2022 17:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA13E112933
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:58:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s1so22450858wra.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:message-id:mime-version;
 bh=LKQeiupsjWXxBDwoTZSPPHdlPTjQPIAaFqaKyAW0P6U=;
 b=AD0lLbpH8JCVYBU8V3rmJht/6J16Po5+P/vNLyVCHtt0EA7frZi8VfFKSmyBXKf0UF
 Fq25TQnM5SB2+zbQWN6y0vPiJFPJM6O0GT6AoAcjzDAPAJbK6dcEoF90dlVg3kCrCCYk
 yWGGQmVHEFjX8mNnIffKqpqRyvvECVP1kZvEqxIoVNLPc0ecAit3djDIupPDkRSFEPlr
 QupFTmdUsp/26Hv2YB0A32L8MC+e+PYmq7DBZaFZ3wAyIc87LuvPMXimrafEvRFelH3K
 4WiR0RjZUX2l1DJed69UhYRXtCC7dqTun6l2iQqSErP6Y/CR7KENojKdPyxDjveccUk0
 K/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
 bh=LKQeiupsjWXxBDwoTZSPPHdlPTjQPIAaFqaKyAW0P6U=;
 b=AcP3aRuSqBeTCjnqM+0b7ICaSOJG/+3y9nbvTVNBly8f6zy0aS8UYlSeoJ9UUmAWW6
 aVfKVUGVFpU8CVd/l/2/kOnFYIarSWUP6SFA9zFbCBIuH5zwI5Ky/vyzLF+VNwo3UfE9
 4hAYLr4mH52lumORKdxYqWRG1Lj+Y2fYijYQ0WWBaNXFBeueFOz6JMJs6vOy9nXww7w2
 LrflWCqpgrMh1Yfu9FCqS0woV8Flggo8fL3J2I24XiCtJaM5uIz65VwL3Ehmr+scolb/
 SMV2k/y1PANnT9BBrDHNvGzBkuOozCsj1V5XpiPlb7tCUEy20Ha/wuucSA3Ewj2xaOnv
 bkgA==
X-Gm-Message-State: AJIora/dxeyNcBMGNjmB28XArqZ1kh/q+dHqBRvdQVp/QGfGOt1iwGlb
 eN6O640JTswykO+o3fBpc9g=
X-Google-Smtp-Source: AGRyM1t7OPKW7PZbAb2gyV/DYZUlzsdR3QqWCthq6pHCgy7hgoIS8GpNVeQjjUpKLMQt6P7ZydXHhg==
X-Received: by 2002:adf:e104:0:b0:21b:9938:b07a with SMTP id
 t4-20020adfe104000000b0021b9938b07amr38373405wrz.682.1657119494202; 
 Wed, 06 Jul 2022 07:58:14 -0700 (PDT)
Received: from fedora ([2a01:e0a:1d2:1f90:be95:f3a2:4d99:a3b3])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a5d59c3000000b00210bac248c8sm18593495wry.11.2022.07.06.07.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:58:13 -0700 (PDT)
Date: Wed, 06 Jul 2022 16:58:08 +0200
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: [PATCH] drm: Fix EDID firmware load on resume
To: matthieu.charette@gmail.com
Message-Id: <WKTLER.NFH5CX2O259Q@gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Wed, 06 Jul 2022 17:03:44 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 matthieu.charette@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loading an EDID using drm.edid_firmware parameter makes resume to fail
after firmware cache is being cleaned. This is because edid_load() use a
temporary device to request the firmware. This cause the EDID firmware
not to be cached from suspend. And, requesting the EDID firmware return
an error during resume.
So the request_firmware() call should use a permanent device for each
connector. Also, we should cache the EDID even if no monitor is
connected, in case it's plugged while suspended.

Signed-off-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 9 ++++
 drivers/gpu/drm/drm_edid_load.c | 81 ++++++++++++++++++++++++++++-----
 include/drm/drm_connector.h | 12 +++++
 include/drm/drm_edid.h | 3 ++
 4 files changed, 94 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c 
b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..e8819ebf1c4b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -31,6 +31,7 @@
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>

+#include <linux/platform_device.h>
 #include <linux/uaccess.h>

 #include "drm_crtc_internal.h"
@@ -289,6 +290,9 @@ int drm_connector_init(struct drm_device *dev,

  drm_connector_get_cmdline_mode(connector);

+ connector->edid_load_pdev = NULL;
+ drm_cache_edid_firmware(connector);
+
  /* We should add connectors at the end to avoid upsetting the 
connector
   * index too much.
   */
@@ -473,6 +477,11 @@ void drm_connector_cleanup(struct drm_connector 
*connector)
   connector->tile_group = NULL;
  }

+ if (connector->edid_load_pdev) {
+ platform_device_unregister(connector->edid_load_pdev);
+ connector->edid_load_pdev = NULL;
+ }
+
  list_for_each_entry_safe(mode, t, &connector->probed_modes, head)
   drm_mode_remove(connector, mode);

diff --git a/drivers/gpu/drm/drm_edid_load.c 
b/drivers/gpu/drm/drm_edid_load.c
index 37d8ba3ddb46..5a82be9917ec 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -167,6 +167,19 @@ static int edid_size(const u8 *edid, int data_size)
  return (edid[0x7e] + 1) * EDID_LENGTH;
 }

+static struct platform_device *edid_pdev(const char *connector_name)
+{
+ struct platform_device *pdev = 
platform_device_register_simple(connector_name, -1, NULL, 0);
+
+ if (IS_ERR(pdev)) {
+ DRM_ERROR("Failed to register EDID firmware platform device "
+ "for connector \"%s\"\n", connector_name);
+ return ERR_CAST(pdev);
+ }
+
+ return pdev;
+}
+
 static void *edid_load(struct drm_connector *connector, const char 
*name,
    const char *connector_name)
 {
@@ -182,18 +195,17 @@ static void *edid_load(struct drm_connector 
*connector, const char *name,
   fwdata = generic_edid[builtin];
   fwsize = sizeof(generic_edid[builtin]);
  } else {
- struct platform_device *pdev;
+ struct platform_device *pdev = connector->edid_load_pdev;
   int err;

- pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
- if (IS_ERR(pdev)) {
- DRM_ERROR("Failed to register EDID firmware platform device "
- "for connector \"%s\"\n", connector_name);
- return ERR_CAST(pdev);
+ if (WARN_ON(!pdev)) {
+ pdev = edid_pdev(connector_name);
+ if (IS_ERR(pdev))
+ return ERR_CAST(pdev);
+ connector->edid_load_pdev = pdev;
   }

   err = request_firmware(&fw, name, &pdev->dev);
- platform_device_unregister(pdev);
   if (err) {
    DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
       name, err);
@@ -263,11 +275,9 @@ static void *edid_load(struct drm_connector 
*connector, const char *name,
  return edid;
 }

-struct edid *drm_load_edid_firmware(struct drm_connector *connector)
+static char *edid_name(const char *connector_name)
 {
- const char *connector_name = connector->name;
  char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
- struct edid *edid;

  if (edid_firmware[0] == '\0')
   return ERR_PTR(-ENOENT);
@@ -310,8 +320,57 @@ struct edid *drm_load_edid_firmware(struct 
drm_connector *connector)
  if (*last == '\n')
   *last = '\0';

- edid = edid_load(connector, edidname, connector_name);
+ edidname = kstrdup(edidname, GFP_KERNEL);
+ if (!edidname) {
+ kfree(fwstr);
+ return ERR_PTR(-ENOMEM);
+ }
+
  kfree(fwstr);
+ return edidname;
+}
+
+void drm_cache_edid_firmware(struct drm_connector *connector)
+{
+ const char *connector_name = connector->name;
+ const char *edidname = edid_name(connector_name);
+ struct platform_device *pdev;
+ int err;
+
+ if (IS_ERR(edidname))
+ return;
+
+ if (match_string(generic_edid_name, GENERIC_EDIDS, edidname) >= 0) {
+ kfree(edidname);
+ return;
+ }
+
+ pdev = edid_pdev(connector_name);
+ if (IS_ERR(pdev)) {
+ kfree(edidname);
+ return;
+ }
+ connector->edid_load_pdev = pdev;
+
+ err = firmware_request_cache(&pdev->dev, edidname);
+ if (err)
+ DRM_ERROR("Requesting EDID firmware cache \"%s\" failed (err=%d)\n",
+ edidname, err);
+
+ kfree(edidname);
+}
+
+struct edid *drm_load_edid_firmware(struct drm_connector *connector)
+{
+ const char *connector_name = connector->name;
+ const char *edidname = edid_name(connector_name);
+ struct edid *edid;
+
+ if (IS_ERR(edidname))
+ return ERR_CAST(edidname);
+
+ edid = edid_load(connector, edidname, connector_name);
+ kfree(edidname);

  return edid;
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..47c84741517e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1573,6 +1573,18 @@ struct drm_connector {
   */
  struct i2c_adapter *ddc;

+ /**
+ * @edid_load_pdev: Platform device for loading EDID via firmware.
+ *
+ * The platform device is registered in drm_connector_init() in case a
+ * custom EDID firmware is used with `edid_firmware` parameter. 
Otherwise,
+ * it is set to NULL.
+ *
+ * Platform device is unregistered in drm_connector_cleanup() if it
+ * is not NULL.
+ */
+ struct platform_device *edid_load_pdev;
+
  /**
   * @null_edid_counter: track sinks that give us all zeros for the 
EDID.
   * Needed to workaround some HW bugs where we get all 0s
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b2756753370b..b54cea3f1107 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -378,10 +378,13 @@ int drm_av_sync_delay(struct drm_connector 
*connector,
         const struct drm_display_mode *mode);

 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
+void drm_cache_edid_firmware(struct drm_connector *connector);
 struct edid *drm_load_edid_firmware(struct drm_connector *connector);
 int __drm_set_edid_firmware_path(const char *path);
 int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
 #else
+static inline void
+drm_cache_edid_firmware(struct drm_connector *connector);
 static inline struct edid *
 drm_load_edid_firmware(struct drm_connector *connector)
 {
-- 
2.36.1



