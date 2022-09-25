Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F37D5E942C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DC810E2AF;
	Sun, 25 Sep 2022 16:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D5910E1C6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 13:32:48 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c198so4287908pfc.13
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=MITYxqe/7uUn9PHMvGQ/DPo3WjbDrnIg6t8qaC/yKL8=;
 b=V8wbrXfOhP6lfTgcKpXgOty4cGuWpkRNA7rZPIoxlasECA7onwuT3RFfaYJLAHNLzf
 3SktSuvEX0iCscU8F5+OYUr+37lnXa++dWGz+ccQdsJbMRgZTca5pFpFaOF8ZL5G+EdF
 CAAVVA/JWyajLHRkc2dTLUPBDUQMHhgcjbEt83FBpHV5i1RiX5GJ8LCIQuT3D2eD/Y3e
 3HXZ/LsZBUfpRdYTBuQ/EG1NzcaSj8R7y+cMotxvxismRD1V5tOEhywXL3Eo5NHsUzi7
 63mKAvf/7s+KOaFitZlMSFhr3X3ww70qiwPcefMrD/d5sxr9C1u+QPeJkjhKdF40Di3k
 gTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MITYxqe/7uUn9PHMvGQ/DPo3WjbDrnIg6t8qaC/yKL8=;
 b=vhuTuV45nw+DSirx6cceN7SDApevZTJZMKgUrhFar1iKGs6e8DwMeS8wAGDtsD+i36
 zP/vebspquS0cfz2b87PYGsOg6pF2scMQccuLn5QsWvpO+soXhIemtGvvHJkTkdlfFnc
 h7HjFBtcEPuRfixHM3Ueh6myD4yUz8PbAvE31ELWIclwMGdXJ4bs0BjsEPwKlA+fbU+S
 yDPELZJnPohz/J9bNwEJBklj+cB58REKbnpltBCQ3qoWvKJzvDsEXD3s4qO+zfr98hmQ
 vnakj4sqwnc/Qj1ZdZDH5y3G2ttS/F9MTMHu8hdFuGGtJNSa02TIQJryl/aTSIzc/FWw
 h7xw==
X-Gm-Message-State: ACrzQf33YpjYwYFlr1AhRiUsAhw8ZVup0GvdIXIZwwX4LrKmCD/LFjG+
 aYfvD8nzk25CVWRXX+wfUpk=
X-Google-Smtp-Source: AMsMyM7Gr+T9TeS/88F2rRTPClyeqgC/pKX1I/B/DpB+I++N4tu2za9pePjvMdwN+DrEycG1zWFTAg==
X-Received: by 2002:a63:e442:0:b0:438:7919:adf with SMTP id
 i2-20020a63e442000000b0043879190adfmr15827886pgk.4.1664112768089; 
 Sun, 25 Sep 2022 06:32:48 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 u5-20020a170902e80500b00178b9c997e5sm8923964plg.138.2022.09.25.06.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 06:32:47 -0700 (PDT)
Date: Sun, 25 Sep 2022 06:32:43 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: steve.glendinning@shawell.net, deller@gmx.de
Subject: [PATCH v3] video: fbdev: smscufx: Fix use-after-free in ufx_ops_open()
Message-ID: <20220925133243.GA383897@ubuntu>
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
 drivers/video/fbdev/smscufx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index d7aa5511c361..e65bdc499c23 100644
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
@@ -1071,9 +1073,13 @@ static int ufx_ops_open(struct fb_info *info, int user)
 	if (user == 0 && !console)
 		return -EBUSY;
 
+	mutex_lock(&disconnect_mutex);
+
 	/* If the USB device is gone, we don't accept new opens */
-	if (dev->virtualized)
+	if (dev->virtualized) {
+		mutex_unlock(&disconnect_mutex);
 		return -ENODEV;
+	}
 
 	dev->fb_count++;
 
@@ -1097,6 +1103,8 @@ static int ufx_ops_open(struct fb_info *info, int user)
 	pr_debug("open /dev/fb%d user=%d fb_info=%p count=%d",
 		info->node, user, info, dev->fb_count);
 
+	mutex_unlock(&disconnect_mutex);
+
 	return 0;
 }
 
@@ -1741,6 +1749,8 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 {
 	struct ufx_data *dev;
 
+	mutex_lock(&disconnect_mutex);
+
 	dev = usb_get_intfdata(interface);
 
 	pr_debug("USB disconnect starting\n");
@@ -1761,6 +1771,8 @@ static void ufx_usb_disconnect(struct usb_interface *interface)
 	kref_put(&dev->kref, ufx_free);
 
 	/* consider ufx_data freed */
+
+	mutex_unlock(&disconnect_mutex);
 }
 
 static struct usb_driver ufx_driver = {
-- 
2.25.1

