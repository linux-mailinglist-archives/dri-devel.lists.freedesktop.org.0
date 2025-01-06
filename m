Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBAA02B3F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 16:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2310E6B9;
	Mon,  6 Jan 2025 15:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="rKWzZ9y6";
	dkim=permerror (0-bit key) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="BH8lzgUp";
	dkim=pass (2048-bit key; unprotected) header.d=nerdbynature.de header.i=@nerdbynature.de header.b="Xq8eSv9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jan 2025 15:41:41 UTC
Received: from trent.utfs.org (trent.utfs.org [94.185.90.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520D110E6B9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple;
 d=nerdbynature.de; i=@nerdbynature.de; q=dns/txt; s=key1;
 t=1736177525; h=date : from : to : cc : subject : message-id :
 mime-version : content-type : from;
 bh=hSp2/2KeglgI/flnnugGWXi9UTshJjqb2tbMgN4C2dg=;
 b=rKWzZ9y6e/Pg4WzzucR5lNeFttIVqzpHikza93nJ2AdKeMU5ZjRIXFDdFmInQ2ez2wzF8
 TqKdCfo7qcLUOe9Cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=nerdbynature.de;
 s=dkim; t=1736177525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=16laj4Me5+o+WZh3Y/wpz56jOsbL2TRJ0UzNl1rcvH8=;
 b=BH8lzgUphqVJtozumNlml2ElcZhCdswiXxdOwvu+xmOTnYvV3Dxaf14D7kfX8QpaQmUPYq
 zONGEI6spkLfNwBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nerdbynature.de;
 i=@nerdbynature.de; q=dns/txt; s=key0; t=1736177525; h=date : from :
 to : cc : subject : message-id : mime-version : content-type : from;
 bh=hSp2/2KeglgI/flnnugGWXi9UTshJjqb2tbMgN4C2dg=;
 b=Xq8eSv9GMD/L9KqO0xNfJtR8i9Sw5PO2yy97SLMTCPrgZEz/nT9GfOKCbfE4Tccxg7tRf
 l8i36BdKtURf6O4QCqbZULasnDx32NHxmPq9s7KtM6mvRoqgV6jkLz1LoWjWkNBa5uTKhZp
 R3JSjLML2pa67KydVnR6WBVlVcxh1ozCTk5ZClLOrnFwdStymPqv3c/F+Tasc7T5tSUdXRr
 mTyOmLGgEa45R7HuMDNQTx4HmdabPlVGObY9bFkPJ7h/RheunfuJ41b1ApkX6oxTjsbHl6F
 AWfv5jbxispGZsC0J0ixAhoxpAsPG7QVpIJTQyRo1I7hyzGZIF5FpHu4tQKQ==
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id 9748C5F883;
 Mon,  6 Jan 2025 16:32:05 +0100 (CET)
Date: Mon, 6 Jan 2025 16:32:05 +0100 (CET)
From: Christian Kujau <lists@nerdbynature.de>
To: Hans de Goede <hdegoede@redhat.com>
cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org
Subject: [PATCH v2] vbox: Enable VBOXGUEST and VBOXSF_FS on ARM64
Message-ID: <7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de>
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
---
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
