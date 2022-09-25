Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF465E9433
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A1910E2DC;
	Sun, 25 Sep 2022 16:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D3610E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 11:03:34 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id w10so3880542pll.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=Ls6aVjfcXQNzmpeS0xOoYytDm9Ima+W7z27eTSuTApU=;
 b=Wjw6pk3mMb9V7l0QbS0E+YoDXm4GpZ1GLcA4ivuqoN7QJZE2BuRQPKl3MB55gXJ2jC
 cNssoJiuVKgdDZWtksmBgy/eoBdjpoDVeu7DFHlxwi2pHRYy9QliGKRiVPrJaRptrEb6
 ZJ8pV81rDKgElcuLiZRDbH4J6Nv7s3KhUUqX9V8z7QGYWFnYLmce0oWI491n1VJYnK12
 i8YFLJUii5kBsU4YLOZMMQff7vDGsDPc/2lQ3d23WHL3luOT19Ezprq39QFrzek2Nl26
 hVXRQX5j3lmmh9FSu4hW0zoVmbb3YSVh6D+8zmeuRrByJ2FP5B1Ne/mtT6zqbBUP7Wp6
 QboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ls6aVjfcXQNzmpeS0xOoYytDm9Ima+W7z27eTSuTApU=;
 b=DM9LqNdR6rC9JhjfLp7COH7enUVQBRzDS3x7uDYFzpx76+T30H2QxznQHODr7vtHbZ
 k3Rf558embBPpVdM4iRYVtqHzd+0xvgyxL4ixWVNnFFqs7qN/QWGoPl9ZX6mzMCuJQlw
 jLYOHoesJSPe9CPyMdPIIdzYIURDdICdnFyqaqpjhTFpPRRb8BZUME9e8u6UUwaQfcNp
 aDg6xgLVud0+g8Bqw+k/u/LTCJE+KLYMnJZau1CY6SXCyyDlrcydqBfT9ST3qdVIebmY
 D4XZMyq70sTyVnQEI0rmHE6YEVkd56ESM9zxomVzls3XkByXCs+hiaKxBAQHNgm5Wg55
 y4dQ==
X-Gm-Message-State: ACrzQf1j7zDFw0DjUm29k7n5XYddh+sc4g0RGGDe775mLIsXLXoUOHQV
 ztL+D9W7yTzJCMzC8ovt7XY=
X-Google-Smtp-Source: AMsMyM6+CfH5vVnrK+yBlBy2CjEDN9Ikqfzbll4GuGFza7uHaTzyc8dLvQ5gSigKYAH7Dr2Y0br6DQ==
X-Received: by 2002:a17:902:d508:b0:178:b7b1:beb3 with SMTP id
 b8-20020a170902d50800b00178b7b1beb3mr17352469plg.102.1664103814274; 
 Sun, 25 Sep 2022 04:03:34 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 x20-20020a17090300d400b0017693722e7dsm9089667plc.6.2022.09.25.04.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:03:33 -0700 (PDT)
Date: Sun, 25 Sep 2022 04:03:29 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: steve.glendinning@shawell.net, deller@gmx.de
Subject: [PATCH] video: fbdev: smscufx: Fix use-after-free in ufx_ops_open()
Message-ID: <20220925110329.GA380036@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 25 Sep 2022 16:02:49 +0000
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imv4bel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A race condition may occur if the user physically removes the
USB device while calling open() for this device node.

This is a race condition between the ufx_ops_open() function and
the ufx_usb_disconnect() function, which may eventually result in UAF.

So, add a mutex to the ufx_ops_open() and ufx_usb_disconnect() functions
to avoid race contidion of krefs.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/video/fbdev/smscufx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index d7aa5511c361..a4378a7241f7 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -137,6 +137,8 @@ static int ufx_submit_urb(struct ufx_data *dev, struct urb * urb, size_t len);
 static int ufx_alloc_urb_list(struct ufx_data *dev, int count, size_t size);
 static void ufx_free_urb_list(struct ufx_data *dev);
 
+static DEFINE_MUTEX(disconnect_mutex);
+
 /* reads a control register */
 static int ufx_reg_read(struct ufx_data *dev, u32 index, u32 *data)
 {
@@ -1065,6 +1067,8 @@ static int ufx_ops_open(struct fb_info *info, int user)
 {
 	struct ufx_data *dev = info->par;
 
+	mutex_lock(&disconnect_mutex);
+
 	/* fbcon aggressively connects to first framebuffer it finds,
 	 * preventing other clients (X) from working properly. Usually
 	 * not what the user wants. Fail by default with option to enable. */
@@ -1097,6 +1101,8 @@ static int ufx_ops_open(struct fb_info *info, int user)
 	pr_debug("open /dev/fb%d user=%d fb_info=%p count=%d",
 		info->node, user, info, dev->fb_count);
 
+	mutex_unlock(&disconnect_mutex);
+
 	return 0;
 }
 
@@ -1741,6 +1747,8 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 {
 	struct ufx_data *dev;
 
+	mutex_lock(&disconnect_mutex);
+
 	dev = usb_get_intfdata(interface);
 
 	pr_debug("USB disconnect starting\n");
@@ -1761,6 +1769,8 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 	kref_put(&dev->kref, ufx_free);
 
 	/* consider ufx_data freed */
+
+	mutex_unlock(&disconnect_mutex);
 }
 
 static struct usb_driver ufx_driver = {
-- 
2.25.1


Dear all,


I found a race-condition-to-UAF vulnerability in "drivers/video/fbdev/smscufx.c".


# Introduction

This vulnerability is a race condition between the ufx_ops_open() and ufx_usb_disconnect() functions.

Because this driver uses kref to manage the "dev" structure, it looks like a race condition will not occur, 
but in reality, a race condition occurs because there is no lock between the above two functions:
```
                cpu0                                                cpu1
       1. open()
          ufx_ops_open()
          if (dev->virtualized)
                                                             2. ufx_usb_disconnect()
                                                                dev->virtualized = true;
                                                                atomic_set()
                                                                usb_set_intfdata()

                                                             3. if (dev->fb_count == 0)
                                                                schedule_delayed_work(&dev->free_framebuffer_work, 0)
                                                                kref_put()   <- kref count : 1
                                                                kref_put()   <- kref count : 0
                                                                ufx_free()
                                                                kfree(dev);

       4. dev->fb_count++;   <- UAF start
          kref_get()   <- refcount_t: addition on 0; use-after-free.
```
The detailed exploit flow is as follows:

1. open() the device node.
dev->virtualized set to "true" only in ufx_usb_disconnect(),
It passes "if (dev->virtualized)" because it hasn't been set yet.

2. ufx_usb_disconnect() is called by physically removing the usb device.
"dev->virtualized = true;" is executed. 
But checking this flag doesn't make any sense because step 1 has already passed.
1 ~ 2 are the first race conditions.

3. After "if (dev->fb_count == 0)" is passed, call kref_put() twice with delayed queue. 
Eventually "kfree(dev);" is executed.

4. "dev->fb_count++" is called. 
However, at this point "dev" is kfree()d, so it becomes a UAF.
3 ~ 4 are the second race conditions.
After this, many UAF scenarios can be configured.


However, if you actually check the code, the workload of 1 ~ 4 of open() is much shorter 
than the workload of 2 ~ 3 of disconnect().
As a result, it is almost impossible to trigger this race condition with a brute force.

Here, an attacker can successfully achieve a race condition using the technique introduced in this paper:
https://www.usenix.org/system/files/sec21-lee-yoochan.pdf

To briefly summarize the paper, 
the processing time between 1 and 4 of open() can be extended longer by using Reschedule IPI.
In other words, it can dramatically increase the success probability of the above race condition scenario.


# for debugging

To debug this race condition, it is convenient to modify the code as follows:
```
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index d7aa5511c361..bbb42e9e768d 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -137,6 +137,10 @@ static int ufx_submit_urb(struct ufx_data *dev, struct urb * urb, size_t len);
 static int ufx_alloc_urb_list(struct ufx_data *dev, int count, size_t size);
 static void ufx_free_urb_list(struct ufx_data *dev);

+DECLARE_WAIT_QUEUE_HEAD(race_condition_debugq);
+static int race_check = 0;
+static struct ufx_data *open_dev;
+
 /* reads a control register */
 static int ufx_reg_read(struct ufx_data *dev, u32 index, u32 *data)
 {
@@ -1075,6 +1079,9 @@ static int ufx_ops_open(struct fb_info *info, int user)
        if (dev->virtualized)
                return -ENODEV;

+       open_dev = dev;
+       wait_event(race_condition_debugq, (race_check == 1));
+
        dev->fb_count++;

        kref_get(&dev->kref);
@@ -1760,6 +1767,12 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
        /* release reference taken by kref_init in probe() */
        kref_put(&dev->kref, ufx_free);

+       if (open_dev == dev) {
+                usleep_range(1000000, 1000001);
+                race_check = 1;
+                wake_up(&race_condition_debugq);
+        }
+
        /* consider ufx_data freed */
 }
```


test code:
```
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <pthread.h>
#include <errno.h>
#include <sched.h>
#include <malloc.h>
#include <poll.h>
#include <pty.h>
#include <sys/syscall.h>
#include <sys/ioctl.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <sys/ipc.h>
#include <linux/userfaultfd.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/un.h>
#include <linux/netlink.h>
#include <stddef.h>
#include <sys/param.h>
#include <sys/resource.h>
#include <linux/bpf.h>
#include <linux/ioctl.h>
#include <linux/types.h>


#define die() do { \
    fprintf(stderr, "died in %s: %u\n", __func__, __LINE__); \
    exit(EXIT_FAILURE); \
} while (0)


void *fb_open(void) {
	int fd;

	fd = open("/dev/fb1", O_RDONLY);
	if (fd > 0) {
		printf("[step 1] fb1 open() : %d  pid : %ld\n", fd, syscall(SYS_gettid));
	} else {
		perror("/dev/fb1 open() failed");
		die();
	}

	sleep(10);
}

void *usb_disconnect_for_debug(void) {
	int ret;
	char input[2];

	sleep(3);

	printf("Disconnect now (After disconnecting, type enter)\n");
	read(0, input, 1);
	printf("[step 2] disconnect fbdev usb\n");

	sleep(5);
}

int main() {
	int p1, p2;
	int status1, status2;
	pthread_t hdr1, hdr2;
	int ret;

	p1 = pthread_create(&hdr1, NULL, fb_open, (void *)NULL);
	if (p1 != 0) {
		perror("pthread_create 1");
		die();
	}

	p2 = pthread_create(&hdr2, NULL, usb_disconnect_for_debug, (void *)NULL);
	if (p2 != 0) {
		perror("pthread_create 2");
		die();
	}

	pthread_join(hdr1, (void **)&status1);
	pthread_join(hdr2, (void **)&status2);

	return 0;
}
```


KASAN log:
```
[  138.037981] BUG: KASAN: use-after-free in ufx_ops_open+0x3e2/0x4d0 [smscufx]
[  138.038010] Read of size 4 at addr ffff88812d6a305c by task smscufx/2763

[  138.038035] CPU: 12 PID: 2763 Comm: smscufx Tainted: G        W          6.0.0-rc6+ #1
[  138.038053] Hardware name: Gigabyte Technology Co., Ltd. B460MDS3H/B460M DS3H, BIOS F3 05/27/2020
[  138.038064] Call Trace:
[  138.038073]  <TASK>
[  138.038085]  dump_stack_lvl+0x49/0x63
[  138.038108]  print_report.cold+0x5e/0x5d9
[  138.038123]  ? __kasan_check_write+0x14/0x20
[  138.038146]  ? ufx_ops_open+0x3e2/0x4d0 [smscufx]
[  138.038165]  kasan_report+0xa0/0x120
[  138.038184]  ? ufx_ops_open+0x3e2/0x4d0 [smscufx]
[  138.038203]  __asan_report_load4_noabort+0x14/0x20
[  138.038221]  ufx_ops_open+0x3e2/0x4d0 [smscufx]
[  138.038238]  ? mutex_unlock+0x81/0xd0
[  138.038258]  ? ufx_ops_ioctl+0x3c0/0x3c0 [smscufx]
[  138.038277]  ? destroy_sched_domains_rcu+0x70/0x70
[  138.038300]  ? try_module_get.part.0+0xb8/0x1a0
[  138.038317]  fb_open+0x187/0x3b0
[  138.038335]  chrdev_open+0x230/0x6d0
[  138.038353]  ? cdev_device_add+0x1f0/0x1f0
[  138.038368]  ? fsnotify_perm.part.0+0x1d9/0x4e0
[  138.038390]  do_dentry_open+0x404/0xf80
[  138.038408]  ? inode_permission+0x125/0x560
[  138.038422]  ? cdev_device_add+0x1f0/0x1f0
[  138.038440]  vfs_open+0x9f/0xd0
[  138.038457]  path_openat+0xd58/0x3f60
[  138.038474]  ? kasan_save_stack+0x3a/0x50
[  138.038489]  ? kasan_save_stack+0x26/0x50
[  138.038503]  ? __kasan_slab_alloc+0x94/0xd0
[  138.038519]  ? getname_flags.part.0+0x52/0x490
[  138.038534]  ? getname+0x7a/0xb0
[  138.038550]  ? path_lookupat+0x660/0x660
[  138.038565]  ? get_partial_node.part.0+0xd2/0x330
[  138.038586]  do_filp_open+0x1b1/0x3e0
[  138.038600]  ? ___slab_alloc+0x52c/0xa50
[  138.038615]  ? may_open_dev+0xd0/0xd0
[  138.038635]  ? _raw_spin_lock_bh+0xe0/0xe0
[  138.038648]  ? __check_object_size+0x174/0x650
[  138.038671]  do_sys_openat2+0x132/0x450
[  138.038688]  ? _raw_spin_unlock_irq+0x1f/0x3b
[  138.038702]  ? build_open_flags+0x450/0x450
[  138.038719]  ? __ia32_sys_ssetmask+0x1d0/0x1d0
[  138.038735]  ? __kasan_check_write+0x14/0x20
[  138.038756]  __x64_sys_openat+0x128/0x210
[  138.038774]  ? __ia32_compat_sys_open+0x1b0/0x1b0
[  138.038792]  ? fpregs_assert_state_consistent+0x52/0xc0
[  138.038813]  ? exit_to_user_mode_prepare+0x49/0x1a0
[  138.038834]  do_syscall_64+0x59/0x90
[  138.038849]  ? fpregs_assert_state_consistent+0x52/0xc0
[  138.038866]  ? exit_to_user_mode_prepare+0x49/0x1a0
[  138.038885]  ? syscall_exit_to_user_mode+0x26/0x50
[  138.038902]  ? do_syscall_64+0x69/0x90
[  138.038915]  ? switch_fpu_return+0xe/0x20
[  138.038932]  ? exit_to_user_mode_prepare+0x16a/0x1a0
[  138.038951]  ? syscall_exit_to_user_mode+0x26/0x50
[  138.038967]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  138.038981] RIP: 0033:0x4534a4
[  138.038998] Code: 24 20 eb 8f 66 90 44 89 54 24 0c e8 d6 ab 02 00 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 18 ac 02 00 8b 44
[  138.039014] RSP: 002b:00007f3618d20140 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
[  138.039034] RAX: ffffffffffffffda RBX: 00007f3618d20640 RCX: 00000000004534a4
[  138.039048] RDX: 0000000000000000 RSI: 00000000004b1008 RDI: 00000000ffffff9c
[  138.039060] RBP: 00000000004b1008 R08: 0000000000000000 R09: 00007ffdf3d4a94f
[  138.039071] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
[  138.039082] R13: 0000000000000000 R14: 000000000041b260 R15: 00007f3618520000
[  138.039099]  </TASK>
```


Best Regards,
Hyunwoo Kim.
