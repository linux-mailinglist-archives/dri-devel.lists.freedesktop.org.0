Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33F6580ED
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86B10E1B8;
	Wed, 28 Dec 2022 16:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3843A10E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 16:22:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 182BAB816F4;
 Wed, 28 Dec 2022 16:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A570C433D2;
 Wed, 28 Dec 2022 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672244568;
 bh=l6SZ1o3XablMRreE/05h9qlGf3szz8R5it9zAPOMn0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wXAUdFOM2Nh6pIocMHZ1Ur7MzWMg28W9WuIAgeToNieGRT65sReAmjT273Mg0vjT+
 lTjjwiZZNPD2Bw626gAqETbtodeo5stHCce+YZsJhxi60fMD29d5NNqv9z783nydpf
 gti/00Md91d/uRGOipe47sFN2jD+0u16b5bgHRos=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.0 0734/1073] fbdev: geode: dont build on UML
Date: Wed, 28 Dec 2022 15:38:42 +0100
Message-Id: <20221228144347.960024744@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228144328.162723588@linuxfoundation.org>
References: <20221228144328.162723588@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Andres Salomon <dilinger@queued.net>,
 linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-um@lists.infradead.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Johannes Berg <johannes@sipsolutions.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 71c53e19226b0166ba387d3c590d0509f541a0a1 ]

The geode fbdev driver uses struct cpuinfo fields that are not present
on ARCH=um, so don't allow this driver to be built on UML.

Prevents these build errors:

In file included from ../arch/x86/include/asm/olpc.h:7:0,
                 from ../drivers/mfd/cs5535-mfd.c:17:
../arch/x86/include/asm/geode.h: In function ‘is_geode_gx’:
../arch/x86/include/asm/geode.h:16:24: error: ‘struct cpuinfo_um’ has no member named ‘x86_vendor’
  return ((boot_cpu_data.x86_vendor == X86_VENDOR_NSC) &&
../arch/x86/include/asm/geode.h:16:39: error: ‘X86_VENDOR_NSC’ undeclared (first use in this function); did you mean ‘X86_VENDOR_ANY’?
  return ((boot_cpu_data.x86_vendor == X86_VENDOR_NSC) &&
../arch/x86/include/asm/geode.h:17:17: error: ‘struct cpuinfo_um’ has no member named ‘x86’
   (boot_cpu_data.x86 == 5) &&
../arch/x86/include/asm/geode.h:18:17: error: ‘struct cpuinfo_um’ has no member named ‘x86_model’
   (boot_cpu_data.x86_model == 5));
../arch/x86/include/asm/geode.h: In function ‘is_geode_lx’:
../arch/x86/include/asm/geode.h:23:24: error: ‘struct cpuinfo_um’ has no member named ‘x86_vendor’
  return ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
../arch/x86/include/asm/geode.h:23:39: error: ‘X86_VENDOR_AMD’ undeclared (first use in this function); did you mean ‘X86_VENDOR_ANY’?
  return ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
../arch/x86/include/asm/geode.h:24:17: error: ‘struct cpuinfo_um’ has no member named ‘x86’
   (boot_cpu_data.x86 == 5) &&
../arch/x86/include/asm/geode.h:25:17: error: ‘struct cpuinfo_um’ has no member named ‘x86_model’
   (boot_cpu_data.x86_model == 10));

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-um@lists.infradead.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/geode/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/geode/Kconfig b/drivers/video/fbdev/geode/Kconfig
index ac9c860592aa..85bc14b6faf6 100644
--- a/drivers/video/fbdev/geode/Kconfig
+++ b/drivers/video/fbdev/geode/Kconfig
@@ -5,6 +5,7 @@
 config FB_GEODE
 	bool "AMD Geode family framebuffer support"
 	depends on FB && PCI && (X86_32 || (X86 && COMPILE_TEST))
+	depends on !UML
 	help
 	  Say 'Y' here to allow you to select framebuffer drivers for
 	  the AMD Geode family of processors.
-- 
2.35.1



