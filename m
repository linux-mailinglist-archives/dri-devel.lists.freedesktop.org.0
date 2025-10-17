Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626CBBEB367
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 20:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D6510ECBE;
	Fri, 17 Oct 2025 18:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="YEpVRdoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Fri, 17 Oct 2025 18:24:31 UTC
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94B710ECBE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 18:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 228748288041;
 Fri, 17 Oct 2025 13:17:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mSaYZQkuW1Za; Fri, 17 Oct 2025 13:17:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0B2FD828916C;
 Fri, 17 Oct 2025 13:17:57 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0B2FD828916C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1760725077; bh=TJx67ud9DOLcGJpcNiwREKvNyLxjpa6gf/QVt67SlS0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=YEpVRdoQa6rJZCMp4b3Pmuz7solJ6w8yI8NO+jwFR2gOFWOPsgMYzcOJCOm2gucU3
 AaukxG24QsylETNVPuk9cvmW5THEe8jrm2mFCGQXYW6FsUdF9kBVkg1FtwMwGi0uJx
 TJuVqO+oG6ubKxTVpzySg3uZZqsWo+1nPEjIO40E=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wxDQM_w1ivE2; Fri, 17 Oct 2025 13:17:56 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CC8A98288041;
 Fri, 17 Oct 2025 13:17:56 -0500 (CDT)
Date: Fri, 17 Oct 2025 13:17:56 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Dave Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
References: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 1/2] PCI: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
Thread-Index: LUG2F4YDIH+Na1U3fGLanAwWnSRh1m0u5uA+
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

Certain hardware devices, such as the IBM POWER9 CPU, transparently swap PCI
bus MMIO data endianness when running in big endian mode.  This transparent
data swapping presents issues for certain types of BARs, for example little
endian framebuffers, where the device driver needs to be aware the PCI BAR
is now appearing as big endian from the host's perspective.

Introduce CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP and enable on ppc64 systems.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/Kconfig | 1 +
 drivers/pci/Kconfig  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e24f4d88885a..0e75fe570389 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -314,6 +314,7 @@ config PPC
 	select OF_EARLY_FLATTREE
 	select OLD_SIGACTION			if PPC32
 	select OLD_SIGSUSPEND
+	select PCI_ARCH_ENDIAN_AUTOSWAP		if PCI && PPC64
 	select PCI_DOMAINS			if PCI
 	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
 	select PCI_SYSCALL			if PCI
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 7065a8e5f9b1..fccc01110763 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -40,6 +40,10 @@ config PCI_DOMAINS_GENERIC
 config PCI_SYSCALL
 	bool
 
+config PCI_ARCH_ENDIAN_AUTOSWAP
+	bool
+	depends on PCI
+
 source "drivers/pci/pcie/Kconfig"
 
 config PCI_MSI
-- 
2.51.0
