Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3405E658184
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AD910E1BA;
	Wed, 28 Dec 2022 16:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB910E1BA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 16:28:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45C99B816F4;
 Wed, 28 Dec 2022 16:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6705FC433EF;
 Wed, 28 Dec 2022 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672244908;
 bh=BLOZxcjnEXYR6XvwzCsyfFc30JnGmIUnqT9FcOApdUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m4UhiSuqZsyC3QCpMi57FYqQ9DsKaqI4FEJfzqfYVdIVaiIzGJ/v/t/7etd227iso
 UtSxOU006pnmgNt0xTG8GUE2apCRAEVQui4Zt7C4f6vnp37L/Rfh8hhi2tWaM15q8i
 epiC/H1hLSj1biLdQN7QvCzbvJQCsAKeN+1wDAnA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 0760/1146] fbdev: uvesafb: dont build on UML
Date: Wed, 28 Dec 2022 15:38:19 +0100
Message-Id: <20221228144350.786064866@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228144330.180012208@linuxfoundation.org>
References: <20221228144330.180012208@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-um@lists.infradead.org,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Michal Januszewski <spock@gentoo.org>, Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 35b4f4d4a725cf8f8c10649163cd12aed509b953 ]

The uvesafb fbdev driver uses memory management information that is not
available on ARCH=um, so don't allow this driver to be built on UML.

Prevents these build errors:

../drivers/video/fbdev/uvesafb.c: In function ‘uvesafb_vbe_init’:
../drivers/video/fbdev/uvesafb.c:807:21: error: ‘__supported_pte_mask’ undeclared (first use in this function)
  807 |                 if (__supported_pte_mask & _PAGE_NX) {
../drivers/video/fbdev/uvesafb.c:807:44: error: ‘_PAGE_NX’ undeclared (first use in this function)
  807 |                 if (__supported_pte_mask & _PAGE_NX) {

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-um@lists.infradead.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Michal Januszewski <spock@gentoo.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 9497fe929162..974e862cd20d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -601,6 +601,7 @@ config FB_TGA
 config FB_UVESA
 	tristate "Userspace VESA VGA graphics support"
 	depends on FB && CONNECTOR
+	depends on !UML
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.35.1



