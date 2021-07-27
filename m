Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A53D7208
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150A16E439;
	Tue, 27 Jul 2021 09:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31726E439
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627378284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P4kqHtesmMxT6t4DNtHwJ5aBPP2dWdjSVvEEwfsLZAk=;
 b=MevH9pUy5yuHzqSTo/D3X1Z7TnHV8RF89HSe52oXxbNMsH7XnGCSZNAiTYCM/wJzb+kjG3
 0z5tkyWttXBKvRClHSuM+3HA/rEMb9vqc1qJ1L9FlcbDuRsvJcgJjt5RGPBFofH9/oBp9m
 vm05qKKJlkPzT01fRAsaasXluWdsWcM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-d1Ql5iazO_WEtJSlzfB5cw-1; Tue, 27 Jul 2021 05:31:23 -0400
X-MC-Unique: d1Ql5iazO_WEtJSlzfB5cw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so5813098wrl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4kqHtesmMxT6t4DNtHwJ5aBPP2dWdjSVvEEwfsLZAk=;
 b=gXSkU/om1uO1UmZ1dK1W+HNiHFDFijap7087lR9VuEXSQ5HxAFGBwIDqhb51fvf/p/
 rsD9f6xETGJbhU3kcDP0aN4jNmwj1NW8v2HaaykZegXf302sjlF1m3G9wv+xNiNWHBJA
 JLdJfhLDJPHbaaI6gzeiwaDooIxHdOVrNexcz3528fEF33BNrcw3Zb7CVmNoc0yqWfow
 K5rW7BdgPfL3wsLfSY5JsKW1BRqvDF7PcIbk/tsWckvTJ0X3pG4qtLIZZquPrbMVkhRi
 1xYzNKkkzt2r3rRK3/xiTaZL9yLSOZO8xzsCCY0zYVJNos68folxLF9flO2K7ZDtMcTA
 /66A==
X-Gm-Message-State: AOAM532Zh5uYEB1WARKvCONGiMf9DbSxb20meTkvcboUdMTUu18NMBax
 xc3SMvLpuWt52m2HCpu1WR4PHm3TOGxdu1Y1qxCfUugplFvFHFrPd9Gx9ZXY9L40Dml/s1tSfOg
 qJ99yHP8ai6itIjNxr6Ip51qi1YP+
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr3130323wmk.124.1627378281847; 
 Tue, 27 Jul 2021 02:31:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtSTRdORJi+3HQuQAfNqDh30m4N7FIkb5NYH9m4pyGW2FleIaHfUZvmh/dqu5ySf57m+HabA==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr3130294wmk.124.1627378281543; 
 Tue, 27 Jul 2021 02:31:21 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id p18sm2035812wmg.46.2021.07.27.02.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:31:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
Date: Tue, 27 Jul 2021 11:30:15 +0200
Message-Id: <20210727093015.1225107-1-javierm@redhat.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
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
enabled. And also, because the SYSFB code is only used for EFI on these
architectures. For !EFI the "simple-framebuffer" device is registered by
OF when parsing the Device Tree Blob (if a DT node for this was defined).

Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Add a Fixes tag to the changelog.

 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index af6719cc576b..897f5f25c64e 100644
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

