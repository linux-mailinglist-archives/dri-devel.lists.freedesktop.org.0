Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24C5E9432
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E6D10E2CF;
	Sun, 25 Sep 2022 16:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556D110E24C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 12:32:58 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so4374658pjh.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=Ev6umPhiA6NmBXFRrFI9vr8H9kP3j819zzUBWeoQWdg=;
 b=GRg+M82sBascvInGxWw868fDwSGdjUH5tHr8xcMnDgZZ1nFvq5+GXl4ZSpCl+17kgq
 WN23TIRrLJ2PTx8t3dp+ZN7n71orvAwB53qssDM8rl0g6eRBTT2GOsXEcoj9/NAuWvwn
 foiQ5wK+yH1r6MBglPgesTtm1lv5s7GJQNMzMeOhWbKrd1cQieSuIWGwj5Yg89hrBh7S
 YR21RkXm0vif30a4bIKtbt+SntIvWmbX+Hu1buGAKrFw1gbhLYWpg4TkDSj1ODbOUgPw
 g6rQxjClq8Xttx4rnEMIwPECSfG53PDi7avOjA00rV5VfFNtlcuMB4lllAK0qLhDyka5
 nW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ev6umPhiA6NmBXFRrFI9vr8H9kP3j819zzUBWeoQWdg=;
 b=gJkVIIGZuLLeYKUFTvFIUZTtxq3v6U+BpFRezdqjkkP2R4TWIjX+LZdTL97uIr0jCW
 ysKIFibE7Yx5q7mImkov9caKDOYN8m3NOji2qvyBugcOFbuuaDKg0VS8MWrn/RT8+/Oy
 tY3J3c+NVQkpo3C8dA6ptg1SUtcKwBQg9Ypgg8UC47N9Fmf/Lccepq8juhds0D2glKm1
 M8XSTyRmmLFuEI82IE2WlWkpAJKh5XXefwzbW+ZQIjJeOHUlf5bQLPmu25ajALz4Kq2s
 Vfc4IvyIg1cEYyzW596B7mZ0goKaPQP0m9DsLKN+hlEPq5gMRZ9RF3L4wDftgAsKDT+c
 GxeQ==
X-Gm-Message-State: ACrzQf3hn9/goQUQxjuyPzTbm5MQWHL+6637BIo01uh0kpmgF2pfsIYZ
 F6zr7Rq4GiVdq0ThRRODAzo=
X-Google-Smtp-Source: AMsMyM7kuAH4EsSDnbgjWgPyoKhmSB1Jsg3E2/qUHl4Gouwc2vOuq7AzNW43eVWqb+1UrBw6zLZq0A==
X-Received: by 2002:a17:90b:180e:b0:202:a0c3:6da with SMTP id
 lw14-20020a17090b180e00b00202a0c306damr19077966pjb.94.1664109177900; 
 Sun, 25 Sep 2022 05:32:57 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001782751833bsm9213935plg.223.2022.09.25.05.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 05:32:57 -0700 (PDT)
Date: Sun, 25 Sep 2022 05:32:53 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: steve.glendinning@shawell.net, deller@gmx.de
Subject: [PATCH v2] video: fbdev: smscufx: Fix use-after-free in ufx_ops_open()
Message-ID: <20220925123253.GA381917@ubuntu>
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
 drivers/video/fbdev/smscufx.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index d7aa5511c361..02a22e31e9c0 100644
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
@@ -1065,15 +1067,21 @@ static int ufx_ops_open(struct fb_info *info, int user)
 {
 	struct ufx_data *dev = info->par;
 
+	mutex_lock(&disconnect_mutex);
+
 	/* fbcon aggressively connects to first framebuffer it finds,
 	 * preventing other clients (X) from working properly. Usually
 	 * not what the user wants. Fail by default with option to enable. */
-	if (user == 0 && !console)
+	if (user == 0 && !console) {
+		mutex_unlock(&disconnect_mutex);
 		return -EBUSY;
+	}
 
 	/* If the USB device is gone, we don't accept new opens */
-	if (dev->virtualized)
+	if (dev->virtualized) {
+		mutex_unlock(&disconnect_mutex);
 		return -ENODEV;
+	}
 
 	dev->fb_count++;
 
@@ -1097,6 +1105,8 @@ static int ufx_ops_open(struct fb_info *info, int user)
 	pr_debug("open /dev/fb%d user=%d fb_info=%p count=%d",
 		info->node, user, info, dev->fb_count);
 
+	mutex_unlock(&disconnect_mutex);
+
 	return 0;
 }
 
@@ -1741,6 +1751,8 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 {
 	struct ufx_data *dev;
 
+	mutex_lock(&disconnect_mutex);
+
 	dev = usb_get_intfdata(interface);
 
 	pr_debug("USB disconnect starting\n");
@@ -1761,6 +1773,8 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 	kref_put(&dev->kref, ufx_free);
 
 	/* consider ufx_data freed */
+
+	mutex_unlock(&disconnect_mutex);
 }
 
 static struct usb_driver ufx_driver = {
-- 
2.25.1

