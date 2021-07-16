Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AEB3CC234
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692D86EA46;
	Sat, 17 Jul 2021 09:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jul 2021 16:58:30 UTC
Received: from benjamin.simbahosting.co.uk (benjamin6-0.simbahosting.co.uk
 [IPv6:2a01:7e00:e000:2d9::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E106E9CE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fishzet.co.uk; s=simba; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BoS8Oq60B5ypaDsJXsAn05fRmlOXZ2uOGQzIhcfukQg=; b=Np85dA58HpOIrDoCucxDHGRl3u
 6x+i83v9sPmDiHdSIZ9RocJn9LzdO3smnxCJK/u/fiOnDP/YbSozrKNKUpxXBZK9XjwPWEm6oCt2L
 oLwHLXGREKWxidk7blpYsw3rJE71dT7RFza5FJMhWRXUYF0kpACKphtLcxTSp4MH9CLrbdAb4Pxlb
 gZJEIZb5utRf5ifnxSdYbt0P/b+D1eug7XLLPLlJxCVDQia5WR8KB0yuh3X8MbDEPJPYVlWoNqfCP
 /qklF5BPneJwju54u2Y29Lj54W45OQYPGBCEJyIaLG2UiEp8i4zCH3hYPsabXVn5P69mbPjueHLMN
 GRbroOGg==;
Received: from cfbb000153.r.cam.camfibre.uk ([185.219.109.233]
 helo=stando.fishzet.co.uk)
 by benjamin.simbahosting.co.uk with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cgb23@fishzet.co.uk>) id 1m4Qvl-0000AB-VX
 for dri-devel@lists.freedesktop.org; Fri, 16 Jul 2021 16:43:17 +0000
Received: from cgb23 by stando.fishzet.co.uk with local (Exim 4.94)
 (envelope-from <cgb23@stando.fishzet.co.uk>) id 1m4Qvg-00GbqA-C0
 for dri-devel@lists.freedesktop.org; Fri, 16 Jul 2021 17:43:12 +0100
Date: Fri, 16 Jul 2021 17:43:12 +0100
From: Charles Baylis <cb-kernel@fishzet.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Return -ENOTTY for non-drm ioctls
Message-ID: <YPG3IBlzaMhfPqCr@stando.fishzet.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nUDTuBN4TUfd2w7n"
Content-Disposition: inline
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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


--nUDTuBN4TUfd2w7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi

The attached patch fixes a problem where non-drm ioctls are incorrectly
handled by drm drivers. 

This causes problems when isatty() is called on a file descriptor which
was opened on a drm device node. Glibc implements isatty() by invoking
the TCGETS ioctl on the fd. TCGETS is 0x5401, so this is handled by drm_ioctl
as DRM_IOCTL_GET_UNIQUE, which succeeds, so isatty() returns true.

As a side effect, DRM_IOCTL_GET_UNIQUE also writes to a pointer, in the
argument buffer, so the calling application's memory can be corrupted, causing
a crash later.

Tested on an Ubuntu 20.10 VM under qemu with virgl:
* "if [ -t 0 ]; then echo is a tty; fi < /dev/dri/card0" outputs nothing
* glxgears still works

Thanks
Charles

--nUDTuBN4TUfd2w7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="drm-ioctl-fix.diff"

commit 0072b12086cdf7350df75d36a12d392e3ba92865
Author: Charles Baylis <cb-kernel@fishzet.co.uk>
Date:   Fri Jul 16 11:58:47 2021 +0100

    drm: Return -ENOTTY for non-drm ioctls
    
    Return -ENOTTY from drm_ioctl() when userspace passes in a cmd number
    which doesn't relate to the drm subsystem.
    
    Glibc uses the TCGETS ioctl to implement isatty(), and without this
    change isatty() returns it incorrectly returns true for drm devices.
    
    To test run this command:
       $ if [ -t 0 ]; then echo is a tty; fi < /dev/dri/card0
    which shows "is a tty" without this patch.
    
    This may also modify memory which the userspace application is not
    expecting.
    
    Signed-off-by: Charles Baylis <cb-kernel@fishzet.co.uk>

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 98ae00661656..f454e0424086 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -834,6 +834,9 @@ long drm_ioctl(struct file *filp,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+       if (DRM_IOCTL_TYPE(cmd) != DRM_IOCTL_BASE)
+               return -ENOTTY;
+
 	is_driver_ioctl = nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END;
 
 	if (is_driver_ioctl) {
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 10100a4bbe2a..afb27cb6a7bd 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -68,6 +68,7 @@ typedef int drm_ioctl_compat_t(struct file *filp, unsigned int cmd,
 			       unsigned long arg);
 
 #define DRM_IOCTL_NR(n)                _IOC_NR(n)
+#define DRM_IOCTL_TYPE(n)              _IOC_TYPE(n)
 #define DRM_MAJOR       226
 
 /**

--nUDTuBN4TUfd2w7n--
