Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01913975EF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 16:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3196E11F;
	Tue,  1 Jun 2021 14:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7C56E11F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622559567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vBakIu1dQtk22INC/4X9gLrUw+kGXTDgbjVD36Rzgzs=;
 b=CS5fvpD3UJ7Rcr1R9OEmTFawx93/7jz++3X0Mky6FyFwzxgpTFcpo0catcBHPGtjQoT9X2
 FHioTQe/Rsig26e4qsufAUAzVesF6bio8TYxhXedSw/l5oFSuWjB3VR/nZQws4gRjPZfHo
 mMfn2YWiX5n6vkzkFdNrII/JnbgNdIE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-2QlIuUR0Pb67gVdl4Zgqcg-1; Tue, 01 Jun 2021 10:59:25 -0400
X-MC-Unique: 2QlIuUR0Pb67gVdl4Zgqcg-1
Received: by mail-wr1-f72.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so2790034wrm.17
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 07:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBakIu1dQtk22INC/4X9gLrUw+kGXTDgbjVD36Rzgzs=;
 b=TOHefb8nAQU7kT0etVy8dk5GLCERcXuJ794BvJxRja22quYte6FAZGFPOrnLg5U9vs
 7rKhbdIhNX/J+lilrU4lvzdByNYvK3nndmveiTiyoBlOkRawgIlh+tk4EVi6Voi1vUof
 kFHqg9NPfu+/mP4tuKvyy/9He9zxVoi0BK7AU7kiWlmyj1b92wJ3N+SfmaP0i+8xLhmK
 EvALqsRWuOOlUJ6uXAO6PYxfHFNrdJ59lCzv8pGXLUCMPGpnRyn3PRuzoI8oQhzQhVbC
 rGKA530C+wCWGFwotjJaDSXTXUB7KiaPV9fVctf5waNyEIOmCX629Mg1HPOL85jZW8H7
 7eKQ==
X-Gm-Message-State: AOAM531TM9UtnSlFGEiww4sBM3+huoF5kopTbxOmUUd/SA6VFIMcf+Tp
 r4LUE9vlB+EQJz3YoUgSIuGISwi/3Ada3W1mLocAmL16FkNIfduUdsrium6u08RiA3RjrGuIkdp
 TeCKFgYuj3ZnAYBokgNTOiabn4SmT
X-Received: by 2002:a1c:282:: with SMTP id 124mr350836wmc.82.1622559564314;
 Tue, 01 Jun 2021 07:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9XbrF5UjA3Lkw2unmQqkjrGQdtKb1lFgUux9RmxthjhbwQ8B+MLPzmwDX65DDh6SYfSo0EA==
X-Received: by 2002:a1c:282:: with SMTP id 124mr350790wmc.82.1622559564069;
 Tue, 01 Jun 2021 07:59:24 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id h6sm3533153wrt.6.2021.06.01.07.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:59:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] allow simple{fb,
 drm} drivers to be used on non-x86 EFI platforms
Date: Tue,  1 Jun 2021 16:59:10 +0200
Message-Id: <20210601145912.774054-1-javierm@redhat.com>
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Joerg Roedel <jroedel@suse.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Chester Lin <clin@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simplefb and simpledrm drivers match against a "simple-framebuffer"
device, but for aarch64 this is only registered when using Device Trees
and there's a node with a "simple-framebuffer" compatible string.

There is no code to register a "simple-framebuffer" platform device when
using EFI instead. In fact, the only platform device that's registered in
this case is an "efi-framebuffer", which means that the efifb driver is
the only driver supported to have an early console with EFI on aarch64.

The x86 architecture platform has a Generic System Framebuffers (sysfb)
support, that register a system frambuffer platform device. It either
registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
VGA/EFI FB devices for the vgafb/efifb drivers.

The sysfb is generic enough to be reused by other architectures and can be
moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
logic used by non-x86 architectures to be folded into sysfb as well.

Patch #1 in this series do the former while patch #2 do the latter. It has
been tested on x86_64 and aarch64 machines using the efifb, simplefb and
simpledrm drivers. But more testing will be highly appreciated, to make
sure that no regressions are being introduced by these changes.

The series touches different subystems and will need coordination between
maintainers. Ard Biesheuvel said that can be merged through the EFI tree.

Best regards,
Javier

Changes in v2:
- Use default y and depends on X86 instead doing a select in arch/x86/Kconfig.
- Also enable the SYSFB Kconfig option when COMPILE_TEST.
- Improve commit message to explain why is useful for other arches to use this.
- Use "depends on" for the supported architectures instead of selecting it.
- Improve commit message to explain the benefits of reusing sysfb for !X86.

Javier Martinez Canillas (2):
  drivers/firmware: move x86 Generic System Framebuffers support
  drivers/firmware: consolidate EFI framebuffer setup for all arches

 arch/arm/include/asm/efi.h                    |  5 +-
 arch/arm64/include/asm/efi.h                  |  5 +-
 arch/riscv/include/asm/efi.h                  |  5 +-
 arch/x86/Kconfig                              | 26 ------
 arch/x86/kernel/Makefile                      |  3 -
 drivers/firmware/Kconfig                      | 32 +++++++
 drivers/firmware/Makefile                     |  2 +
 drivers/firmware/efi/Makefile                 |  2 +
 drivers/firmware/efi/efi-init.c               | 90 -------------------
 .../firmware/efi}/sysfb_efi.c                 | 79 +++++++++++++++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c | 42 +++++----
 .../firmware}/sysfb_simplefb.c                | 31 ++++---
 .../x86/include/asm => include/linux}/sysfb.h | 34 +++----
 13 files changed, 180 insertions(+), 176 deletions(-)
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (70%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (82%)
 rename {arch/x86/include/asm => include/linux}/sysfb.h (68%)

-- 
2.31.1

