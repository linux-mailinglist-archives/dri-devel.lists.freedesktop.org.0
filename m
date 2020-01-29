Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879214D7A7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBD96F900;
	Thu, 30 Jan 2020 08:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from plasma4.jpberlin.de (plasma4.jpberlin.de [80.241.57.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AC06E420
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 18:36:03 +0000 (UTC)
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id 6B5AABACE6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 19:36:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id cMrrQRDWj2mu for <dri-devel@lists.freedesktop.org>;
 Wed, 29 Jan 2020 19:35:59 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "webmail.opensynergy.com",
 Issuer "GeoTrust EV RSA CA 2018" (not verified))
 (Authenticated sender: opensynergy@jpberlin.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 63C19BABFE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 19:35:59 +0100 (CET)
Received: from os-lin-mgo.open-synergy.com (10.25.255.1) by
 MXS01.open-synergy.com (10.25.10.17) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 29 Jan 2020 19:36:01 +0100
From: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm RESEND 2/2] xf86drm: fix subsystem type lookup for
 virtio mmio-based devices
Date: Wed, 29 Jan 2020 19:35:43 +0100
Message-ID: <20200129183543.30023-2-Mikhail.Golubev@opensynergy.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200129183543.30023-1-Mikhail.Golubev@opensynergy.com>
References: <20200129183543.30023-1-Mikhail.Golubev@opensynergy.com>
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
Cc: Mikhail.Golubev@opensynergy.com, vasyl.vavrychuk@opensynergy.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>

Currently the code assumes that a virtio based device is always located
on the PCI bus.

Modify the parser to make it check the device's parent directory to
determine on which bus it is located.

Output for virtio-pci is the PCI bus.
Output for virtio-mmio is the Platform bus.

Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Signed-off-by: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>
---
 xf86drm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xf86drm.c b/xf86drm.c
index b1479128..1b22efe4 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -3005,10 +3005,20 @@ static int drmParseSubsystemType(int maj, int min)
 {
 #ifdef __linux__
     char path[PATH_MAX + 1] = "";
+    char real_path[PATH_MAX + 1] = "";
+    int subsystem_type;
 
     snprintf(path, PATH_MAX, "/sys/dev/char/%d:%d/device", maj, min);
+    if (!realpath(path, real_path))
+        return -errno;
+    strncpy(path, real_path, PATH_MAX);
 
-    return get_subsystem_type(path);
+    subsystem_type = get_subsystem_type(path);
+    if (subsystem_type == DRM_BUS_VIRTIO) {
+        strncat(path, "/..", PATH_MAX);
+        subsystem_type = get_subsystem_type(path);
+    }
+    return subsystem_type;
 #elif defined(__OpenBSD__) || defined(__DragonFly__)
     return DRM_BUS_PCI;
 #else
@@ -3710,7 +3720,6 @@ process_device(drmDevicePtr *device, const char *d_name,
 
     switch (subsystem_type) {
     case DRM_BUS_PCI:
-    case DRM_BUS_VIRTIO:
         return drmProcessPciDevice(device, node, node_type, maj, min,
                                    fetch_deviceinfo, flags);
     case DRM_BUS_USB:
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
