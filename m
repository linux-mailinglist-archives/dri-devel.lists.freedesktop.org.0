Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1984CEB1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 17:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104610E3BE;
	Wed,  7 Feb 2024 16:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="RJNTBrNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F62F10E3BE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=BzfR02iaC4unUSCO9abKwcFUwiyIjB6j/U2qifVyUjY=; b=RJNTBrNA0gX9tZMdxmaX0a3ewg
 UQNsN0ZI+eUd/5Zhixy5DWyILdoKHPiVbMB3x40NacxvJaR1cZdLWFefS8x7WGy0Mh8x/GpApawEt
 e9F3587MTXO5WU2Bkeu1QKEgyEzoSUZYzIxXT1YLuYvYbv0qED0ZL10TMfAtJT4SHZF4R65bziM7A
 nmIjfG8Slb/SKaR2kjvBiCKEoa1d2hEiLJUmoV6x7KEeRJowHjmHZe04lucfdnO1VpiZ+fyUGOTGU
 Fpm0TGGdwNq7bL7a6epxfUcxyuSOV0l5akAd3OFxd2AxCG5Ee3TRTNNB+WSiPXPkqSDoWoFJOnoXc
 Q4A3mxrg==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rXkYA-0000000BBCJ-2Wir; Wed, 07 Feb 2024 16:13:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Geoff Levand <geoff@infradead.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drivers/ps3: select VIDEO to provide cmdline functions
Date: Wed,  7 Feb 2024 08:13:22 -0800
Message-ID: <20240207161322.8073-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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

When VIDEO is not set, there is a build error. Fix that by selecting
VIDEO for PS3_PS3AV.

ERROR: modpost: ".video_get_options" [drivers/ps3/ps3av_mod.ko] undefined!

Fixes: dae7fbf43fd0 ("driver/ps3: Include <video/cmdline.h> for mode parsing")
Fixes: a3b6792e990d ("video/cmdline: Introduce CONFIG_VIDEO for video= parameter")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Geoff Levand <geoff@infradead.org>
Acked-by: Geoff Levand <geoff@infradead.org>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: add Geoff's Ack;
    add second Fixes: tag and more Cc:s (Thomas)

 arch/powerpc/platforms/ps3/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -67,6 +67,7 @@ config PS3_VUART
 config PS3_PS3AV
 	depends on PPC_PS3
 	tristate "PS3 AV settings driver" if PS3_ADVANCED
+	select VIDEO
 	select PS3_VUART
 	default y
 	help
