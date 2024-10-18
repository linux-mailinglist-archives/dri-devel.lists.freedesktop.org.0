Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D749A4207
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2455610E94D;
	Fri, 18 Oct 2024 15:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zf0eO50I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B8E10E94A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:13:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91D2D5C5B41;
 Fri, 18 Oct 2024 15:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C33C4CEC3;
 Fri, 18 Oct 2024 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729264383;
 bh=4/LoPNWFMLOtRjQ2F1SWn+Sgmq2mlkEMHTBeAJ0+Sts=;
 h=From:To:Cc:Subject:Date:From;
 b=Zf0eO50IFcBdjC4gKtwzS+B/O423DZOxwfR0DF10Yo3ApzX7RN+qHkv7TV0yPW6UU
 ewdR2DNjZWB+2ohT6qNOeXTkPsCBEYQ7XGd4dl5sk6tlRb5O+rfqPGZIZRqqk274gH
 5ASnOXh1mTXoXKhMOzn9NBwK7pdNawa5OihBgornEmtLRXxnVjoH4ODymBWjwZt3v8
 ZpBzxjpQI2nnxW9Gdllumxi16BE1BVUbJyvM7APCxPlD9a65vIirTwJNOmhvEyPtf7
 nzlj5kke0T+exfPGWNCIGyDefFQvmG+tzrm8oqsFfaWQfoLG9/j1zGUclLcP9zEEeR
 6Fmscvoo/0hIw==
From: Arnd Bergmann <arnd@kernel.org>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev/wm8505fb: select CONFIG_FB_IOMEM_FOPS
Date: Fri, 18 Oct 2024 15:12:49 +0000
Message-Id: <20241018151258.3574617-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The fb_io_mmap() function is used in the file operations but
not enabled in all configurations unless FB_IOMEM_FOPS gets
selected:

ld.lld-20: error: undefined symbol: fb_io_mmap
>>> referenced by wm8505fb.c
>>>               drivers/video/fbdev/wm8505fb.o:(wm8505fb_ops) in archive vmlinux.a

Fixes: 11754a504608 ("fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 9957dde4a3f6..961d7f5bbbc2 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1388,6 +1388,7 @@ config FB_VT8500
 config FB_WM8505
 	bool "Wondermedia WM8xxx-series frame buffer support"
 	depends on (FB = y) && HAS_IOMEM && (ARCH_VT8500 || COMPILE_TEST)
+	select FB_IOMEM_FOPS
 	select FB_SYS_FILLRECT if (!FB_WMT_GE_ROPS)
 	select FB_SYS_COPYAREA if (!FB_WMT_GE_ROPS)
 	select FB_SYS_IMAGEBLIT
-- 
2.39.5

