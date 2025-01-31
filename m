Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E7A23E10
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC2510EAA5;
	Fri, 31 Jan 2025 13:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Fri, 31 Jan 2025 13:00:18 UTC
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDEF10EAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (178.204.90.63) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 31 Jan
 2025 15:45:03 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Roman Smirnov <r.smirnov@omp.ru>, Dave Airlie <airlied@redhat.com>, Keith
 Packard <keithp@keithp.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, syzbot
 <syzbot+6754751ad05524dae739@syzkaller.appspotmail.com>
Subject: [PATCH] drm/drm_lease: add sanity check to
 drm_mode_create_lease_ioctl()
Date: Fri, 31 Jan 2025 15:44:17 +0300
Message-ID: <20250131124421.152497-1-r.smirnov@omp.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.204.90.63]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 01/31/2025 12:24:05
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 190712 [Jan 31 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.7
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 50 0.3.50
 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_one_url, url3}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.204.90.63 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 syzkaller.appspot.com:7.1.1,5.0.1; omp.ru:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.204.90.63
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/31/2025 12:26:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/31/2025 10:24:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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

Syzkaller found a case of dangerous call via drm_ioctl(). If user makes
object_count too large, WARN() is called when allocating memory:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5229 at mm/page_alloc.c:4709 __alloc_pages_noprof+0x3bd/0x710 mm/page_alloc.c:4709
Modules linked in:
CPU: 0 UID: 0 PID: 5229 Comm: syz-executor478 Not tainted 6.12.0-rc4-syzkaller-00047-gc2ee9f594da8 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 ___kmalloc_large_node+0x8b/0x1d0 mm/slub.c:4209
 __kmalloc_large_node_noprof+0x1a/0x80 mm/slub.c:4236
 __do_kmalloc_node mm/slub.c:4252 [inline]
 __kmalloc_noprof+0x2ae/0x400 mm/slub.c:4276
 kmalloc_noprof include/linux/slab.h:882 [inline]
 kmalloc_array_noprof include/linux/slab.h:923 [inline]
 fill_object_idr drivers/gpu/drm/drm_lease.c:389 [inline]
 drm_mode_create_lease_ioctl+0x580/0x1db0 drivers/gpu/drm/drm_lease.c:522
 drm_ioctl_kernel+0x337/0x440 drivers/gpu/drm/drm_ioctl.c:745
 drm_ioctl+0x60e/0xad0 drivers/gpu/drm/drm_ioctl.c:842
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

The number of objects requested for lessee must not exceed the
number of objects already in lessor because if the user requests
more identifiers than lessor has, one of the calls of idr_find()
in drm_lease_create() will return NULL. Then ioctl() will
terminate with an error.

The added check handles this case before calling kcalloc(),
which prevents WARN() from being called.

Reported-by: syzbot <syzbot+6754751ad05524dae739@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
Fixes: 62884cd386b8 ("drm: Add four ioctls for managing drm mode object leases [v7]")
Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
---
 drivers/gpu/drm/drm_lease.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 94375c6a5425..c1bebc70e544 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -336,6 +336,23 @@ static void _drm_lease_revoke(struct drm_master *top)
 	}
 }
 
+static int validate_object_count(struct drm_device *dev,
+				 size_t object_count)
+{
+	size_t available_objects = 0;
+	int object;
+	void *entry;
+
+	mutex_lock(&dev->mode_config.idr_mutex);
+	idr_for_each_entry(&dev->mode_config.object_idr, entry, object)
+		available_objects++;
+	mutex_unlock(&dev->mode_config.idr_mutex);
+
+	if (available_objects < object_count)
+		return -EINVAL;
+	return 0;
+}
+
 void drm_lease_revoke(struct drm_master *top)
 {
 	mutex_lock(&top->dev->mode_config.idr_mutex);
@@ -507,6 +524,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 
 	object_count = cl->object_count;
 
+	ret = validate_object_count(lessor->dev, object_count);
+	if (ret) {
+		drm_dbg_lease(dev, "requested too many objects\n");
+		goto out_lessor;
+	}
+
 	/* Handle leased objects, if any */
 	idr_init(&leases);
 	if (object_count != 0) {
-- 
2.43.0

