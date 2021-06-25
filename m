Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B23B4418
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 15:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6CD6EDB7;
	Fri, 25 Jun 2021 13:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEE96EDB7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624626601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vvZL1fz2dwOb7Upqb55JPmmwYtiHqp1yiqdJ6Cauu30=;
 b=EMaJEE6wB18iKZ0uv1cItRWrPD44MjroslgN9lwXBrD+qHCTNuiSYPSL0wvsPYGPakxk3J
 n9VN+Dld2lMUykDKRcTnC30NP4mUWXCCSWpsykpfp8ufu1m8xoB1x778DaItfMtZEycRmB
 YRVAQftuA+eo+qdvFPTbmjS5FJ84WdQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-9PAxrfHHPtq1O8XLqaAtmg-1; Fri, 25 Jun 2021 09:10:00 -0400
X-MC-Unique: 9PAxrfHHPtq1O8XLqaAtmg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p22-20020a7bcc960000b02901de8f2ae18aso2690497wma.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 06:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vvZL1fz2dwOb7Upqb55JPmmwYtiHqp1yiqdJ6Cauu30=;
 b=byoO6rskQ6bMlBDVRZx+08oYpsnoB/dUDugzS5zmTyZWtKd3m58f8lSUaVjTRBnfJr
 CDDuFF6YT6jTgtP1/4Fvh6EqoxUJPPRi7p+Hmit6p8q9ZIo7SQ0YfGAwDYkhJzESwukJ
 67Bid0Y1g8lZWwVe4pTo3vVVroUYIWsCpN2U+vzX48OekxnwmDpBUV3KQxUyLWcC5Crb
 Nc01t3vOps9FTfEx5MFfozM/NeQbGNgznxyrIeqF7mL7EqXhNcwqU+9l4OD+7rqxxPio
 CmQAyp5UpcqHOimioGLLiPGzrY7s4nYWOUVTGqllAuP/KwEYLya59pyIv02xGXhMkep6
 Q2jQ==
X-Gm-Message-State: AOAM530MoC7O2rniEvKM3ucFPo0kc7cRuHJBGOhtsOq2bNPlBPTP/Y4P
 dBfEC4n3/h3RLDt8fiYYPudhTwdImyjss6sd7sWyPPNm/BzODwWbzLesv4K2pZ+SJPeckbIHnv8
 aI+i/0r53cS4MBw6yJeWQNSlvhpoU
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr10869830wrt.95.1624626599107; 
 Fri, 25 Jun 2021 06:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxac5aAuPdj78okqR8e93aZVHiRH/QUWQDePxg/s70gh/LhsMF19zX80NB6m3SpVsyLwyMfkA==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr10869804wrt.95.1624626598911; 
 Fri, 25 Jun 2021 06:09:58 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id x7sm5995864wre.8.2021.06.25.06.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 06:09:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] allow simple{fb,
 drm} drivers to be used on non-x86 EFI platforms
Date: Fri, 25 Jun 2021 15:09:45 +0200
Message-Id: <20210625130947.1803678-1-javierm@redhat.com>
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
Cc: linux-efi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
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
maintainers but the patches have already been acked by the x86 folks. Ard
Biesheuvel said that these could be merged through the EFI tree if needed.

Best regards,
Javier

Changes in v3:
- Add Borislav and Greg Acked-by tags.
- Also update the SYSFB_SIMPLEFB symbol name in drivers/gpu/drm/tiny/Kconfig.
- We have a a max 100 char limit now, use it to avoid multi-line statements.
- Figure out the platform device name before allocating the platform device.

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
 .../firmware/efi}/sysfb_efi.c                 | 78 +++++++++++++++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c | 37 +++++---
 .../firmware}/sysfb_simplefb.c                | 33 ++++---
 drivers/gpu/drm/tiny/Kconfig                  |  4 +-
 .../x86/include/asm => include/linux}/sysfb.h | 32 +++----
 14 files changed, 180 insertions(+), 174 deletions(-)
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (75%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (81%)
 rename {arch/x86/include/asm => include/linux}/sysfb.h (70%)

-- 
2.31.1

