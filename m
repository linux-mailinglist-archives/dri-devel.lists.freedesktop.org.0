Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E9A04390
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEA410EB2B;
	Tue,  7 Jan 2025 15:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="8w6jIKEs";
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="48F1Iu8B";
	dkim=pass (2048-bit key; unprotected) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="ndj+F4+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B4510E71C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple;
 d=nerdbynature.de; i=@nerdbynature.de; q=dns/txt; s=key1;
 t=1736262094; h=date : from : to : cc : subject : message-id :
 mime-version : content-type : from;
 bh=Qx9w4rABUFJDcA75vJXfrE39IA/yqdDpo/xWmKUr97I=;
 b=8w6jIKEsKvy5EtTzqK3fyVcrE57Y02ZXG7cZ50njj08HhitY+ZRpEeHSjtrl/qbALyiVp
 8uVnDAHezgriWnaBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=nerdbynature.de;
 s=dkim; t=1736262094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=fCw32xNVr3N9HVSIM9el/uDAsXmKS1rjSDRGk3J8Y2Q=;
 b=48F1Iu8B2oWI046voQr2FCNDPoffbVZt7qLWglG5vDeh04DhyWMtSQVsqASGvBDKNrumcD
 qr1zyJdCZXwXSuAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nerdbynature.de;
 i=@nerdbynature.de; q=dns/txt; s=key0; t=1736262094; h=date : from :
 to : cc : subject : message-id : mime-version : content-type : from;
 bh=Qx9w4rABUFJDcA75vJXfrE39IA/yqdDpo/xWmKUr97I=;
 b=ndj+F4+Esn2TXv/xoR76Qi0/Ju3jxFAshtBMUmsK02mLztcuASOd7clC+ftr3W8n6ZiUj
 V2YOp9yMeq5QloVrxLLGf0+oxhyekOQ9saJ9bnpl92LXMPkgsA/7iULVB48BLEpY+ttogcC
 6CmO5aA/uCZwKgJKzOLjeitSkGOqL8aUsoKSULvBJdhoFFNdtmXmvgkgCJXHroa2/YnelnU
 0T1eeK4VP/vwrweO5FdCWW9BnQpAICosPj4D7ZrEdsqfmJYpZJBT1alrP+GMtJEiAOyKjl7
 QOsF3Oju6Lcg99FWQZc+rphQ/dKUnQf/EplF0PMMDF0f/0hrzN4F+kg411/Q==
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id 0E8EC5F8B2;
 Tue,  7 Jan 2025 16:01:34 +0100 (CET)
Date: Tue, 7 Jan 2025 16:01:34 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Hans de Goede <hdegoede@redhat.com>
cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org
Subject: [PATCH v3] vbox: Enable VBOXGUEST and VBOXSF_FS on ARM64
Message-ID: <1c6f68d1-a51a-1c38-2eca-89fa63dc30c6@nerdbynature.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Now that VirtualBox is able to run as a host on arm64 (e.g. the Apple M3 
processors) we can enable VBOXSF_FS (and in turn VBOXGUEST) for this 
architecture. Tested with various runs of bonnie++ and dbench on an Apple 
MacBook Pro with the latest Virtualbox 7.1.4 r165100 installed.

Signed-off-by: Christian Kujau <lists@nerdbynature.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

---
v3: version history added, along with Hans' Reviewed-by

v2: vboxvideo change removed, see:
    https://lore.kernel.org/lkml/7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de/

v1: initial version, see:
    https://lore.kernel.org/lkml/a969298e-0986-470c-9711-703af784d672@redhat.com/

 drivers/virt/vboxguest/Kconfig | 2 +-
 fs/vboxsf/Kconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
BOFH excuse #76:

Unoptimized hard drive
