Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE7657CA3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 16:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030FA10E3B3;
	Wed, 28 Dec 2022 15:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11210E3B3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 15:34:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D65BB81647;
 Wed, 28 Dec 2022 15:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB39C433F0;
 Wed, 28 Dec 2022 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672241666;
 bh=SW5xKFSPrwYLrKP1omDMY+E/09Pr8z9WKCx+2TLz0uQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OBzdoWBmldAdErd0Fy0EavevjKR3oYDk9Osfrsx+2mqMqvwNMyPVQTyPILdscoUzh
 OYEbocwSzNlpCyNZblqST4NWX1X+VuRT5n5McCyU+p6BeHQAksn5tiT2ww/d5oJ1tp
 mQpBoS+HA/frZUH7ZCG0/VtQh1QM9VoyjkL66nkI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.15 509/731] fbdev: uvesafb: dont build on UML
Date: Wed, 28 Dec 2022 15:40:16 +0100
Message-Id: <20221228144311.300749846@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228144256.536395940@linuxfoundation.org>
References: <20221228144256.536395940@linuxfoundation.org>
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
index 5050a9f8e879..26531aa19428 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -606,6 +606,7 @@ config FB_TGA
 config FB_UVESA
 	tristate "Userspace VESA VGA graphics support"
 	depends on FB && CONNECTOR
+	depends on !UML
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.35.1



