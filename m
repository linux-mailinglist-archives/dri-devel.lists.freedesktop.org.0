Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BE1DA079
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 21:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514CF6E0CA;
	Tue, 19 May 2020 19:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665D6E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 19:06:52 +0000 (UTC)
IronPort-SDR: PAAZRm104L+mAZtI7BsTAQry6afA/w+25q8lCeGHWDXVbPYAU3avGuABciBKIBMH81o5QHSOOs
 h1z+acOE3kEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 12:06:52 -0700
IronPort-SDR: FXx8Xq/+yZzl+zsl3W2Xxb5xez/DSJ/i3pNAc/f8lku8nSOk2XElF9WBN/P/WuHhXTYnSuKrko
 aEpQqiIGJ4Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; d="scan'208";a="343235706"
Received: from miryad.jf.intel.com ([10.54.74.46])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2020 12:06:51 -0700
From: Carlos Santa <carlos.santa@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] libdrm: enclose __FreeBSD__ behind a define
Date: Tue, 19 May 2020 12:04:57 -0700
Message-Id: <20200519190458.15260-1-carlos.santa@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Carlos Santa <carlos.santa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not doing the above can cause compilation errors on
platforms that don't define it.

[1/25] Compiling C object 'drm@sha/xf86drm.c.o.
FAILED: drm@sha/xf86drm.c.o
../xf86drm.c: In function 'drmGetMinorNameForFD':
../xf86drm.c:2938:7: error: "__FreeBSD__" is not defined [-Werror=undef]
 #elif __FreeBSD__
       ^
../xf86drm.c: In function 'drmParsePciBusInfo':
../xf86drm.c:3258:7 error: "__FreeBSD__" is not defined [-Werror=undef]
 #elif __FreeBSD__
       ^
../x86drm.c: In function 'drmParsePciDeviceInfo':
../x86drm.c:3427:7 error: "__FreeBSD__" is not defined [-Werror=undef]
 #elif __FreeBSD__

../x86drm.c: In function 'drmGetDeviceNameFromFd2':
../xf86drm.c:4305:7 error: "__FreeBSD__" is not defined [-Werror=undef]
 #elif __FreeBSD__
       ^
cc1: some warnigns being treated as errors
ninja: build stopped: subcommand failed.

Signed-off-by: Carlos Santa <carlos.santa@intel.com>
---
 xf86drm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xf86drm.c b/xf86drm.c
index b49d42f70dbe..3965b4be366d 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -2822,7 +2822,7 @@ static bool drmNodeIsDRM(int maj, int min)
     snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/drm",
              maj, min);
     return stat(path, &sbuf) == 0;
-#elif __FreeBSD__
+#elif defined(__FreeBSD__)
     char name[SPECNAMELEN];
 
     if (!devname_r(makedev(maj, min), S_IFCHR, name, sizeof(name)))
@@ -2935,7 +2935,7 @@ static char *drmGetMinorNameForFD(int fd, int type)
 
     closedir(sysdir);
     return NULL;
-#elif __FreeBSD__
+#elif defined(__FreeBSD__)
     struct stat sbuf;
     char dname[SPECNAMELEN];
     const char *mname;
@@ -3255,7 +3255,7 @@ static int drmParsePciBusInfo(int maj, int min, drmPciBusInfoPtr info)
     info->func = pinfo.func;
 
     return 0;
-#elif __FreeBSD__
+#elif defined(__FreeBSD__)
     return get_sysctl_pci_bus_info(maj, min, info);
 #else
 #warning "Missing implementation of drmParsePciBusInfo"
@@ -3424,7 +3424,7 @@ static int drmParsePciDeviceInfo(int maj, int min,
     device->subdevice_id = pinfo.subdevice_id;
 
     return 0;
-#elif __FreeBSD__
+#elif defined(__FreeBSD__)
     drmPciBusInfo info;
     struct pci_conf_io pc;
     struct pci_match_conf patterns[1];
@@ -4302,7 +4302,7 @@ drm_public char *drmGetDeviceNameFromFd2(int fd)
     free(value);
 
     return strdup(path);
-#elif __FreeBSD__
+#elif defined(__FreeBSD__)
     return drmGetDeviceNameFromFd(fd);
 #else
     struct stat      sbuf;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
