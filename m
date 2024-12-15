Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339089F2663
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631EE10E13F;
	Sun, 15 Dec 2024 22:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="4dJZX444";
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="W+E0TvQx";
	dkim=pass (2048-bit key; unprotected) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="dVexOPZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at gabe;
 Sun, 15 Dec 2024 20:01:11 UTC
Received: from trent.utfs.org (trent.utfs.org [IPv6:2a03:3680:0:3::67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381D10E0ED
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple;
 d=nerdbynature.de; i=@nerdbynature.de; q=dns/txt; s=key1;
 t=1734292347; h=date : from : to : cc : subject : message-id :
 mime-version : content-type : from;
 bh=tiwqBk4ozPoEvxpdMpJIp6y1F9A6UZ2uc+0qtRTtF88=;
 b=4dJZX444ql9cJuzIo+PJfmuspAoEtPHngY7tfYOtPJDzRYAAmEQtetMe995eliaglj5HO
 /dQ26L2vm25dwgYBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=nerdbynature.de;
 s=dkim; t=1734292347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=tBGUwwzsmgjikUY6vrtplG7aYnbzaEqx36oiv3+g0PY=;
 b=W+E0TvQx4vC+Yafu1Z5q/YLOaEWj1kawV54ZDvWlP75Ywi2++YiRN2Hjt4NFOtiud4HwIX
 xdB8nr8pzDQDqOBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nerdbynature.de;
 i=@nerdbynature.de; q=dns/txt; s=key0; t=1734292347; h=date : from :
 to : cc : subject : message-id : mime-version : content-type : from;
 bh=tiwqBk4ozPoEvxpdMpJIp6y1F9A6UZ2uc+0qtRTtF88=;
 b=dVexOPZrTnPxhpZf7u25tty0xy+Mp4IQ6l3Wo16qiXhBG4NcHz4YrVMQn/zOEQLjN1ALJ
 BTPMFQiJAbSfQA1N3Xt+Jf4F881bNUlPo/Lham2dPAaVMTeD5A+Q10J7wdGALlcsdtaTmZD
 lgP7EQLVhdKN+2FaYP7mWhF0eAA18Z8yhaKSS3F9bcsrC8z2kZOqC99a+LYQ+REuZk+yL7f
 KpGgzQBE+6GW0GCOtJclaxRriNNeYCo1FjnZ4J/o5bTRdtH5s7sF1dtm4bksqiNV595bzWE
 ZfAo9ZOgbnTWEEQpsfWVjdryd+ywLWaRW+kVgANDRNYoVPU9jvSrZVYlcfrQ==
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id F18755F9E2;
 Sun, 15 Dec 2024 20:52:26 +0100 (CET)
Date: Sun, 15 Dec 2024 20:52:26 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Hans de Goede <hdegoede@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org
Subject: [PATCH] vbox: arm64 support for vboxguest
Message-ID: <5020bcc7-eea4-b0f5-30c1-1da12efdca8f@nerdbynature.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Mailman-Approved-At: Sun, 15 Dec 2024 22:00:11 +0000
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

My last email[0] still had "RFC" in the subject line, but no comments were 
received. So, in an attempt of stupi^W boldness, this is the same patch 
again, with RFC removed and ready for mainline, maybe?

Hello,

now that VirtualBox able to run as a host on arm64 (e.g. the Apple M3 
processors) I was wondering if there are any plans to port the vboxguest 
driver to that platform? I added ARM64 to the Kconfig files (see below) on 
vboxguest and vboxsf, and also for vboxvideo, and it compiled just like 
that and at least vboxsf appears to work just fine.

I don't know how to test vboxvideo yet (the module loads just fine), but 
if we at least enable to option in the Kconfig file at least people would 
be able to test it :-)

Thanks,
Christian.

[0] https://lore.kernel.org/lkml/f088e1da-8fae-2acb-6f7a-e414708d8e67@nerdbynature.de/

Signed-off-by: Christian Kujau <lists@nerdbynature.de>

    vbox: Enable VBOXGUEST on ARM64

diff --git a/drivers/gpu/drm/vboxvideo/Kconfig b/drivers/gpu/drm/vboxvideo/Kconfig
index 180e30b82ab9..dfe92bf23bde 100644
--- a/drivers/gpu/drm/vboxvideo/Kconfig
+++ b/drivers/gpu/drm/vboxvideo/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_VBOXVIDEO
 	tristate "Virtual Box Graphics Card"
-	depends on DRM && X86 && PCI
+	depends on DRM && (ARM64 || X86) && PCI
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
diff --git a/drivers/virt/vboxguest/Kconfig b/drivers/virt/vboxguest/Kconfig
index cc329887bfae..11b153e7454e 100644
--- a/drivers/virt/vboxguest/Kconfig
+++ b/drivers/virt/vboxguest/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VBOXGUEST
 	tristate "Virtual Box Guest integration support"
-	depends on X86 && PCI && INPUT
+	depends on (ARM64 || X86) && PCI && INPUT
 	help
 	  This is a driver for the Virtual Box Guest PCI device used in
 	  Virtual Box virtual machines. Enabling this driver will add
diff --git a/fs/vboxsf/Kconfig b/fs/vboxsf/Kconfig
index b84586ae08b3..d4694026db8b 100644
--- a/fs/vboxsf/Kconfig
+++ b/fs/vboxsf/Kconfig
@@ -1,6 +1,6 @@
 config VBOXSF_FS
 	tristate "VirtualBox guest shared folder (vboxsf) support"
-	depends on X86 && VBOXGUEST
+	depends on (ARM64 || X86) && VBOXGUEST
 	select NLS
 	help
 	  VirtualBox hosts can share folders with guests, this driver

-- 
BOFH excuse #326:

We need a licensed electrician to replace the light bulbs in the computer room.
