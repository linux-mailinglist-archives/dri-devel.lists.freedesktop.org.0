Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05D14D7AB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CB86F90E;
	Thu, 30 Jan 2020 08:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from plasma4.jpberlin.de (plasma4.jpberlin.de [80.241.57.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24B56E3E7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 15:48:15 +0000 (UTC)
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id EFAF1AAD56
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 16:38:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id lJRaVVvx3BjQ for <dri-devel@lists.freedesktop.org>;
 Wed, 29 Jan 2020 16:38:23 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "webmail.opensynergy.com",
 Issuer "GeoTrust EV RSA CA 2018" (not verified))
 (Authenticated sender: opensynergy@jpberlin.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id D8E14B786B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 16:38:23 +0100 (CET)
Received: from os-lin-mgo.open-synergy.com (10.25.255.1) by
 MXS01.open-synergy.com (10.25.10.17) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 29 Jan 2020 16:38:25 +0100
From: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 1/2] xf86drm: generalize the device subsystem type
 parsing code
Date: Wed, 29 Jan 2020 16:38:09 +0100
Message-ID: <20200129153810.26876-1-Mikhail.Golubev@opensynergy.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [10.25.255.1]
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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
Cc: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>

Move the code, which used to get the device subsystem type from a device
path in sysfs, to a separate function to be reusable.

Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Signed-off-by: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>
---
 xf86drm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/xf86drm.c b/xf86drm.c
index 7ae41c37..b1479128 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -2964,10 +2964,10 @@ sysfs_uevent_get(const char *path, const char *fmt, ...)
 /* Little white lie to avoid major rework of the existing code */
 #define DRM_BUS_VIRTIO 0x10
 
-static int drmParseSubsystemType(int maj, int min)
-{
 #ifdef __linux__
-    char path[PATH_MAX + 1];
+static int get_subsystem_type(const char *device_path)
+{
+    char path[PATH_MAX + 1] = "";
     char link[PATH_MAX + 1] = "";
     char *name;
     struct {
@@ -2982,8 +2982,8 @@ static int drmParseSubsystemType(int maj, int min)
         { "/virtio", DRM_BUS_VIRTIO },
     };
 
-    snprintf(path, PATH_MAX, "/sys/dev/char/%d:%d/device/subsystem",
-             maj, min);
+    strncpy(path, device_path, PATH_MAX);
+    strncat(path, "/subsystem", PATH_MAX);
 
     if (readlink(path, link, PATH_MAX) < 0)
         return -errno;
@@ -2998,6 +2998,17 @@ static int drmParseSubsystemType(int maj, int min)
     }
 
     return -EINVAL;
+}
+#endif
+
+static int drmParseSubsystemType(int maj, int min)
+{
+#ifdef __linux__
+    char path[PATH_MAX + 1] = "";
+
+    snprintf(path, PATH_MAX, "/sys/dev/char/%d:%d/device", maj, min);
+
+    return get_subsystem_type(path);
 #elif defined(__OpenBSD__) || defined(__DragonFly__)
     return DRM_BUS_PCI;
 #else
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
