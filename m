Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D708A3D1D19
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 06:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA086EE68;
	Thu, 22 Jul 2021 04:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD2D6EE68
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 04:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626928926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Np6AqHl19Qnq+fc5f537Pv3JR0dA3FodDzznrUqUHhY=;
 b=AETymSwU/A9Wosm23AShYUoKIRKtQFiE+yze67kslCX3ofFtvaqeZc+fi7u8D4iFcuIRDZ
 6H+AwKZgEnSftZzMeyNkQkpALvBgESmwWqwCq6R3mz2yJKCJZvOzSWurooFGnu0mJsGayT
 /Q62aYtXA7CYOA//i9CtvByhbiQb4bI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-PLlt1aWpNYGOgXsxfzAlhQ-1; Thu, 22 Jul 2021 00:42:05 -0400
X-MC-Unique: PLlt1aWpNYGOgXsxfzAlhQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so1932506wrc.14
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 21:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Np6AqHl19Qnq+fc5f537Pv3JR0dA3FodDzznrUqUHhY=;
 b=sk7obuHBt5l/aCS7YG1migXkl5dzLNC+GPw7jyOOXakSahuixABAE6H0VRhietF8nu
 LSR4uo2UiCM+FD2oAEJk2GLw7S5RmCNTg35gW6xHPxgktx/GNqKZ6GtCNrpp9bggY6Ox
 tZsx0VTbrPxFIAMN6gdF2Nl6Fb/NohNWTMmR69CJk269UK7L5Gh8TJSrkXGZUGp4SHzV
 FeESLhjpZMjgV3+yrkYOCtQ443Ys1n/n2Ah8xSjknIT505AEnBdOhpVdd6Bj9Ycqt4dO
 AECJZPkdASAJHL1Vbt7Cz+UljchJ/l9XpyuX6Jp0B/OUosk6pv00OHeoynbPmRGi+pOO
 YCQg==
X-Gm-Message-State: AOAM531mXk1qrLliJ7uO3GEDx0iUDX8/inGGEQvsy8/6j52EYcMzZGQU
 XLINtQR8cYR1QIDllfpoJEjh8OdzJS+79mNB4pbr10dnD0gwQdTpOQF7QNOGc1SmwGdO4CuoZPP
 88IUcZ6s4ncx8P8R5aIBAAmbetEKH
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr40451636wml.74.1626928924069; 
 Wed, 21 Jul 2021 21:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUBIHXzIjYaGO626+bK+iEh/ZLJSTjEs8WPcf4a0Ua/24DBKA4+HNNFqg4Xi4bHPzxIz4asg==
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr40451618wml.74.1626928923871; 
 Wed, 21 Jul 2021 21:42:03 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id e6sm33694588wrg.18.2021.07.21.21.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 21:42:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/firmware: fix sysfb depends to prevent build failures
Date: Thu, 22 Jul 2021 06:41:55 +0200
Message-Id: <20210722044155.864600-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Borislav Petkov <bp@suse.de>, He Ying <heying24@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Generic System Framebuffers support is built when the COMPILE_TEST
option is enabled. But this wrongly assumes that all the architectures
declare a struct screen_info.

This is true for most architectures, but at least the following do not:
arc, m68k, microblaze, openrisc, parisc and s390.

By attempting to make this compile testeable on all architectures, it
leads to linking errors as reported by the kernel test robot for parisc:

  All errors (new ones prefixed by >>):

     hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
     (.init.text+0x24): undefined reference to `screen_info'
  >> hppa-linux-ld: (.init.text+0x28): undefined reference to `screen_info'

To prevent these errors only allow sysfb to be built on systems that are
going to need it, which are x86 BIOS and EFI.

The EFI Kconfig symbol is used instead of (ARM || ARM64 || RISC) because
some of these architectures only declare a struct screen_info if EFI is
enabled. And also, because the sysfb code is only used for EFI on these
architectures. For !EFI the "simple-framebuffer" device is registered by
OF when parsing the Device Tree Blob (if a DT node for this is defined).

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index af6719cc576..897f5f25c64 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -254,7 +254,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 config SYSFB
 	bool
 	default y
-	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
+	depends on X86 || EFI
 
 config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
-- 
2.31.1

