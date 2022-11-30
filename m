Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3F63E2FE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 22:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1053810E0DD;
	Wed, 30 Nov 2022 21:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD2D10E0DD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=9ue0uGD9yX/1sJHyqmcNOU+aIhb/LFzhG5X5H+uhnGw=; b=eYuFdnVEKQN3qRV/BGXQG0Mxyd
 fFwZQ1O+epwDYpg5jkS8lEjMUV9QQCveIntrqBrGceCtOokWuJOQw2se3juK0d2RzfVaLpfJgu0PD
 7NsUelo2lxiHlGAnjkd3/kEFelkcxhp5ddwK6gP829fPi4D1YqYB6Ev3V6hBjHb4b5ldwXLjzcWpR
 M8wcPUQ+bwxU2jyd/KRF6uC7yaYmuBGnOi6HMeJnKkhe2JcBV75ccO/KiDnymTY/62qqZeGZWLsGB
 G5IIKQxENka/H3M061749bTb0qfMQGufCDpR9NraJM9CGU+5/+zMiTSa3BXAPujRHFFsYmtQY3nks
 TB2gcCQA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p0V3s-00FKDQ-Io; Wed, 30 Nov 2022 21:56:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fbdev: uvesafb: don't build on UML
Date: Wed, 30 Nov 2022 13:55:59 -0800
Message-Id: <20221130215559.28969-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
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
Cc: linux-fbdev@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-um@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Michal Januszewski <spock@gentoo.org>,
 Johannes Berg <johannes@sipsolutions.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 drivers/video/fbdev/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -609,6 +609,7 @@ config FB_TGA
 config FB_UVESA
 	tristate "Userspace VESA VGA graphics support"
 	depends on FB && CONNECTOR
+	depends on !UML
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
