Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA993D6DCD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 07:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9384C6EA88;
	Tue, 27 Jul 2021 05:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B916EA88
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=LbsOlfHeqNxTseZbI6JEafTqvq2PmDXu+dYbdpp/3uU=; b=LEYB0v4o2AJFAnH61UR7Bo2Uei
 66oVAJZFUsUisXHx7BswJ31Lu3uD0IRNNyNKbQOwlt4i14TMxD8jwbKmyyeSbcnwLS5y6UKsTVDdq
 0cQ6x9mnYEVCDDK4n9GgkX+sV/5cxzOaSB1IJGKx3MLIXjjBWESW/5CSgGQDFp2Lgn3hSKpYrZjkR
 akuXBztefQZVtAVUFqR7hu5LuQGelkxi3HgoFs8VTdlI2AuHJcSht8EIkaRC23361loIG4efl5tM5
 LX6SToyDSbo9g+7ze1jeNUWpkCkyQFTSXH0uB/ONszAbQsr0q/qZwcO/gIymbFzQMYGJgaMIy8NYR
 YYgi40WQ==;
Received: from [2601:1c0:6280:3f0:76e5:bff:fe2d:dc28]
 (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8FGu-00Eg9T-RM; Tue, 27 Jul 2021 05:05:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] efi: sysfb_efi: fix build when EFI is not set
Date: Mon, 26 Jul 2021 22:04:47 -0700
Message-Id: <20210727050447.7339-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-efi@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When # CONFIG_EFI is not set, there are 2 definitions of
sysfb_apply_efi_quirks(). The stub from sysfb.h should be used
and the __init function from sysfb_efi.c should not be used.

../drivers/firmware/efi/sysfb_efi.c:337:13: error: redefinition of ‘sysfb_apply_efi_quirks’
 __init void sysfb_apply_efi_quirks(struct platform_device *pd)
             ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/firmware/efi/sysfb_efi.c:26:0:
../include/linux/sysfb.h:65:20: note: previous definition of ‘sysfb_apply_efi_quirks’ was here
 static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
                    ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
---
 drivers/firmware/efi/sysfb_efi.c |    2 ++
 1 file changed, 2 insertions(+)

--- linext-20210726.orig/drivers/firmware/efi/sysfb_efi.c
+++ linext-20210726/drivers/firmware/efi/sysfb_efi.c
@@ -332,6 +332,7 @@ static const struct fwnode_operations ef
 	.add_links = efifb_add_links,
 };
 
+#ifdef CONFIG_EFI
 static struct fwnode_handle efifb_fwnode;
 
 __init void sysfb_apply_efi_quirks(struct platform_device *pd)
@@ -354,3 +355,4 @@ __init void sysfb_apply_efi_quirks(struc
 		pd->dev.fwnode = &efifb_fwnode;
 	}
 }
+#endif
