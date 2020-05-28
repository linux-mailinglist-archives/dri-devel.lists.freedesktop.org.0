Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989451E6113
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72B6E0CF;
	Thu, 28 May 2020 12:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3CD6E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:39:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so27785855wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cONCLAlkOSZf0HXSgg1Qq68WWJSuHm3YLdZXeGkO+qE=;
 b=PQ5pb69SOfTOFPZ6e58H12zLWCii9WEVCfLrAAmRki5zo9J8DJxI9xJ9mT2TtwO5LH
 6W4XPtnaPBki00EOt+PYZoAqNXeyY1vHEwCTKclG/Y69ZT+Shcm99VrQMBv4wf9Mc2pR
 TjYTXDi4ukVhoD7lfA/XLWTrMRRwPXY+43PBEBtMibb2+QkkUtIxXJgSXrFRx4KwpTiB
 dDMkIpUV2kgk5wOpU1YPUsrMRmaB5U1lSp6U/NG974UsyCtQyTgNDYvvDjcEiXqQsz4G
 DTR2PR5RXj4Do0s3ocGt98awY0kKEOH+/aBQ/QBCJ89pj+OUIcTClrPs3XkXjLwmtNaZ
 mM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cONCLAlkOSZf0HXSgg1Qq68WWJSuHm3YLdZXeGkO+qE=;
 b=RhcSGGyigmznF+ACDiu3pmuxUbEK5Cg8vM98nrUu48HEwbE9ke7kKGSCOMuLKKWPZ1
 hxMFk2Rld4EmwblTI7z2UW2UyVxrV+pCTarAH9wIUEpM8KgVpeO1IFlb1kWwJSsXt8n5
 GtAk5RrD82UDkOW/KmpVdpD85NhjgvyIgVVJRaoxZdjwAfS+/727dzlNu6lZ71rsQy/j
 BkoTfZoCpKtlG1L73LYcoc08+5tV8yeyA4DcFUTdSwgPP5d6qemUKG2nPukVlZNvgkbx
 2t9qR4itwPrL4oH9Ag3X43vJ/JiOPZBBGeZNtxXLrloRpAlNalbO7qDTYXkM0glIzu8D
 Fgig==
X-Gm-Message-State: AOAM532lplrL7LD3EcxqE8mNOGQ7Yb3Dw9d1yR2cl/f6e070kP+YC/5A
 h89F4NUTc+AZyoDL0zSzrP0XwIEU
X-Google-Smtp-Source: ABdhPJywMH33z2GqZBPzjHDRr4fxdppnkqtC7n+0YPONntwtJXYChaLqefoYbDuTqSh6Z+VMl+cjGA==
X-Received: by 2002:adf:a350:: with SMTP id d16mr3473266wrb.237.1590669544961; 
 Thu, 28 May 2020 05:39:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id n23sm4286955wmc.0.2020.05.28.05.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:39:03 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] WIP: expose boot_vga via drmDevice
Date: Thu, 28 May 2020 13:35:58 +0100
Message-Id: <20200528123558.3171101-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Chih-Wei Huang <cwhuang@linux.org.tw>, Mauro Rossi <issor.oruam@gmail.com>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- ifdef check around the sysfs handling - only Linux has comprehensive
sysfs
- compile and run-time test

Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
Cc: Mauro Rossi <issor.oruam@gmail.com>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Chih-Wei, Mauro

Here is a quick WIP which should get you going. I have _not_ tested it
so it might need some polish - please submit once you're happy with it.
---
 xf86drm.c | 53 ++++++++++++++++++++++++++++++++++++++++++-----------
 xf86drm.h |  2 ++
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/xf86drm.c b/xf86drm.c
index b49d42f7..13162b81 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -3948,8 +3948,9 @@ process_device(drmDevicePtr *device, const char *d_name,
 {
     struct stat sbuf;
     char node[PATH_MAX + 1];
-    int node_type, subsystem_type;
+    int node_type, subsystem_type, ret;
     unsigned int maj, min;
+    FILE *fp;
 
     node_type = drmGetNodeType(d_name);
     if (node_type < 0)
@@ -3972,20 +3973,49 @@ process_device(drmDevicePtr *device, const char *d_name,
     switch (subsystem_type) {
     case DRM_BUS_PCI:
     case DRM_BUS_VIRTIO:
-        return drmProcessPciDevice(device, node, node_type, maj, min,
-                                   fetch_deviceinfo, flags);
+        ret = drmProcessPciDevice(device, node, node_type, maj, min,
+                                  fetch_deviceinfo, flags);
     case DRM_BUS_USB:
-        return drmProcessUsbDevice(device, node, node_type, maj, min,
-                                   fetch_deviceinfo, flags);
+        ret = drmProcessUsbDevice(device, node, node_type, maj, min,
+                                  fetch_deviceinfo, flags);
     case DRM_BUS_PLATFORM:
-        return drmProcessPlatformDevice(device, node, node_type, maj, min,
-                                        fetch_deviceinfo, flags);
+        ret = drmProcessPlatformDevice(device, node, node_type, maj, min,
+                                       fetch_deviceinfo, flags);
     case DRM_BUS_HOST1X:
-        return drmProcessHost1xDevice(device, node, node_type, maj, min,
-                                      fetch_deviceinfo, flags);
+        ret = drmProcessHost1xDevice(device, node, node_type, maj, min,
+                                     fetch_deviceinfo, flags);
     default:
         return -1;
-   }
+    }
+    if (!(flags & DRM_DEVICE_GET_BOOT_VGA))
+        return ret;
+
+    snprintf(node, sizeof(node), "/sys/dev/char/%d:%d/device/boot_vga",
+             maj, min);
+
+    fp = fopen(path, "r");
+    if (!fp) {
+#ifdef BOOT_VGA_FATAL
+        free(*device);
+        *device = NULL;
+        return -errno;
+#else
+        return 0;
+#endif
+    }
+
+    ret = fscanf(fp, "%d", &(device->boot_vga));
+    fclose(fp);
+    if (ret != 1) {
+#ifdef BOOT_VGA_FATAL
+        free(*device);
+        *device = NULL;
+        return -errno;
+#else
+        return 0;
+#endif
+    }
+    return 0;
 }
 
 /* Consider devices located on the same bus as duplicate and fold the respective
@@ -4014,7 +4044,8 @@ static void drmFoldDuplicatedDevices(drmDevicePtr local_devices[], int count)
 static int
 drm_device_validate_flags(uint32_t flags)
 {
-        return (flags & ~DRM_DEVICE_GET_PCI_REVISION);
+    return (flags & ~(DRM_DEVICE_GET_PCI_REVISION |
+                      DRM_DEVICE_GET_BOOT_VGA));
 }
 
 static bool
diff --git a/xf86drm.h b/xf86drm.h
index 7b85079a..da6f7e26 100644
--- a/xf86drm.h
+++ b/xf86drm.h
@@ -885,6 +885,7 @@ typedef struct _drmDevice {
         drmPlatformDeviceInfoPtr platform;
         drmHost1xDeviceInfoPtr host1x;
     } deviceinfo;
+    int boot_vga;
 } drmDevice, *drmDevicePtr;
 
 extern int drmGetDevice(int fd, drmDevicePtr *device);
@@ -894,6 +895,7 @@ extern int drmGetDevices(drmDevicePtr devices[], int max_devices);
 extern void drmFreeDevices(drmDevicePtr devices[], int count);
 
 #define DRM_DEVICE_GET_PCI_REVISION (1 << 0)
+#define DRM_DEVICE_GET_BOOT_VGA (1 << 1)
 extern int drmGetDevice2(int fd, uint32_t flags, drmDevicePtr *device);
 extern int drmGetDevices2(uint32_t flags, drmDevicePtr devices[], int max_devices);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
