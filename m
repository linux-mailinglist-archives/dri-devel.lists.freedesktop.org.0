Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025ABC8D4FD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159B710E79A;
	Thu, 27 Nov 2025 08:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Cnzpc/mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A1310E01F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 02:20:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4779a637712so1744335e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 18:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764210029; x=1764814829; darn=lists.freedesktop.org; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
 b=Cnzpc/mvyl6fV6EhIA7A8psUv5mxN4sV+QyV1GoVZLDiM0MbmyCIdzVdchs2KI8hjX
 F2oqvOh4drdxPPfnONwLlNWeycUpJvIrmC70MqAKOd8594ZYJP7QSj80wQC1Ar+QJX1n
 /MwlBoSuGz9zWwPLrUD0JaZBNZaQXuRdtxh4gKPKhrBqQtXTmVS2o/8DmUeSwdZ1uVkI
 QbXHSouUwu1jatZdQllTtxuJwoRfT5Prg9Rn6giDrlSomSow8iX/JZKQXrfuzzoRpfU7
 ymPdB7zJ6S1Zy4SOkNhpPDKCErSBHjEwYw8rJIVOhP6/maHU65q1c9YJTST049j3Bs8X
 gMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764210029; x=1764814829;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
 b=tsk0S0O/DZpKMw32t+YQWuIRjagqk5cGpJC/CBxSwvaxu725OzIGz7MhFqaQlY9tup
 UPHG1rF1XkfKBIZJQWL6hLpqPJK201WRUB2QRNZx94N0J5suAB4Q8cRVaGjtp3q1FU9T
 9BtJE2RssItB/bRtlwf+OjreOR75AG7gIkO/Hwg3IOtT3w9e7J9ZrLpsWvb0IMpQaLQK
 jOMABb6YKEk6MqjsYnW98ZH0FRo8s/H2/VG6vhXysSUsLqpELJA1NzgK/5ucOhtlWUYf
 Bwlb/67rV55ElUJpcrNIHjF111I5Fs7Ctv/iNVLmW048Kb+1+Fqq3H6ME58zQYQ/b+ZS
 n7+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/PWc6lFORwovdYpXTRwZrv7ABNX6dRQv9TH4rQ9OvjVosUJg9BpEV1LAYpRVwYb/ioxHpyb4YC1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZpN9elN7KULNaW/F4uqlOxY2FLqloTX0S+gRCDOrM3bMZp6UV
 KCZFs8h+qaJHG15QNahiewqpJ6Y0fGeT3sU0GrJvpy39aZsddaBAx06ZFWzVTmSFt+s=
X-Gm-Gg: ASbGncsqsGcDe3f8h9kQ5fKAs6NNBnY4TVGmR6S4IfMjoeAtNQ/fYHFiwOvT2k9jUV5
 5OC2DG271BIdfcY9XQA2g88K0+On9V3kEBei7Ax+7J+Dlf1RVYQbv8rh1tqwn/txfyAJ8z82yv6
 v1v//+WhFgYUYNBkjCWAb+if2vIkVCQx5aDRAGSvNHQYZ5L0tLpQWbB6Miidg41BqqWmn2qwE5U
 iI+yOziCDJRm1DTuJNZ9FZfMBw5/y678QQc6EqHWOM1dkm7S3ATHpR3Fv7/96ACypLGVTJfSyiG
 CGo+1hu1LEc9PWFNb1RP/9tnw91WucypcHBgQspqNa5wEhe8SLf61TGZwUNZbuRenR4nHJ7K+IS
 yXqwwRBoZw6CnGjq98HvRrJ9pUSiNtel7zBAXkqZf/NJAr8BF9K1hCQymzxxAc2ekcqAw5sr8V5
 Tc132JIzT5Klzm84Tdbiyhb1baqmWJmz0R
X-Google-Smtp-Source: AGHT+IGspC1YV2yyiMXXnAe8/Td7EsFQhaqJU5qYzu5f0NQl+Us+ioM0vDMgGxEbw6PNx9+MNqPMRQ==
X-Received: by 2002:a05:600c:474b:b0:477:9dc1:b706 with SMTP id
 5b1f17b1804b1-477c01b494fmr204934695e9.19.1764210029052; 
 Wed, 26 Nov 2025 18:20:29 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b20b5d6sm67743a91.6.2025.11.26.18.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 18:20:28 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 10:20:20 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI systems
Message-ID: <aSe1ZBXa3JBidhem@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Thu, 27 Nov 2025 08:19:07 +0000
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

Hi Thomas,

I am attempting to test this patch series but encountered merge conflicts when applying it to various trees.
Could you please clarify the specific base commit (or branch/tag) this series was generated against?

When testing on the next branch on commits 7a2ff00 and e41ef37, I hit a conflict on PATCH v3 4/9:
patching file drivers/pci/vgaarb.c
Hunk #2 FAILED at 557.
1 out of 2 hunks FAILED -- rejects in file drivers/pci/vgaarb.c

When testing against 3a86608 (Linux 6.18-rc1), the following conflicts occurred:
patching file drivers/gpu/drm/sysfb/efidrm.c
Hunk #1 FAILED at 24.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/efidrm.c
patching file drivers/gpu/drm/sysfb/vesadrm.c
Hunk #1 FAILED at 25.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/vesadrm.c

Please let me know the correct base, and I will retest.

Thanks,
Richard Lyu

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> Replacing both with sysfb_primary_display has been motivate by the EFI
> stub. EFI wants to transfer EDID via config table in a single entry.
> Using struct sysfb_display_info this will become easily possible. Hence
> accept some churn in architecture code for the long-term improvements.
> 
> Patches 1 and 2 reduce the exposure of screen_info in EFI-related code.
> 
> Patch 3 adds struct sysfb_display_info.
> 
> Patch 4 replaces scren_info with sysfb_primary_display. This results in
> several changes throught the kernel, but is really just a refactoring.
> 
> Patch 5 updates sysfb to transfer sysfb_primary_display to the related
> drivers.
> 
> Patch 6 moves edid_info into sysfb_primary_display. This resolves some
> drivers' reference to the global edid_info, but also makes the EDID data
> available on non-x86 architectures.
> 
> Patches 7 and 8 add support for EDID transfers on non-x86 EFI systems.
> 
> Patch 9 cleans up the config-table allocation to be easier to understand.
> 
> v3:
> - replace SCREEN_INFO table entry (Ard)
> - merge libstub patch into kernel patch
> v2:
> - combine v1 of the series at [1] plus changes from [2] and [3].
> 
> [1] https://lore.kernel.org/dri-devel/20251121135624.494768-1-tzimmermann@suse.de/
> [2] https://lore.kernel.org/dri-devel/20251015160816.525825-1-tzimmermann@suse.de/
> [3] https://lore.kernel.org/linux-efi/20251119123011.1187249-5-ardb+git@google.com/
> 
> Thomas Zimmermann (9):
>   efi: earlycon: Reduce number of references to global screen_info
>   efi: sysfb_efi: Reduce number of references to global screen_info
>   sysfb: Add struct sysfb_display_info
>   sysfb: Replace screen_info with sysfb_primary_display
>   sysfb: Pass sysfb_primary_display to devices
>   sysfb: Move edid_info into sysfb_primary_display
>   efi: Refactor init_primary_display() helpers
>   efi: Support EDID information
>   efi: libstub: Simplify interfaces for primary_display
> 
>  arch/arm64/kernel/image-vars.h                |  2 +-
>  arch/loongarch/kernel/efi.c                   | 38 ++++-----
>  arch/loongarch/kernel/image-vars.h            |  2 +-
>  arch/riscv/kernel/image-vars.h                |  2 +-
>  arch/x86/kernel/kexec-bzimage64.c             |  4 +-
>  arch/x86/kernel/setup.c                       | 16 ++--
>  arch/x86/video/video-common.c                 |  4 +-
>  drivers/firmware/efi/earlycon.c               | 42 +++++-----
>  drivers/firmware/efi/efi-init.c               | 46 ++++++-----
>  drivers/firmware/efi/efi.c                    |  4 +-
>  drivers/firmware/efi/libstub/Makefile         |  2 +-
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 36 +++++++--
>  drivers/firmware/efi/libstub/efi-stub.c       | 49 +++++++----
>  drivers/firmware/efi/libstub/efistub.h        |  7 +-
>  .../firmware/efi/libstub/primary_display.c    | 41 ++++++++++
>  drivers/firmware/efi/libstub/screen_info.c    | 53 ------------
>  drivers/firmware/efi/libstub/zboot.c          |  6 +-
>  drivers/firmware/efi/sysfb_efi.c              | 81 ++++++++++---------
>  drivers/firmware/sysfb.c                      | 13 +--
>  drivers/firmware/sysfb_simplefb.c             |  2 +-
>  drivers/gpu/drm/sysfb/efidrm.c                | 14 ++--
>  drivers/gpu/drm/sysfb/vesadrm.c               | 14 ++--
>  drivers/hv/vmbus_drv.c                        |  6 +-
>  drivers/pci/vgaarb.c                          |  4 +-
>  drivers/video/Kconfig                         |  8 +-
>  drivers/video/fbdev/core/fbmon.c              |  8 +-
>  drivers/video/fbdev/efifb.c                   | 10 ++-
>  drivers/video/fbdev/vesafb.c                  | 10 ++-
>  drivers/video/fbdev/vga16fb.c                 |  8 +-
>  drivers/video/screen_info_pci.c               |  5 +-
>  include/linux/efi.h                           |  9 ++-
>  include/linux/screen_info.h                   |  2 -
>  include/linux/sysfb.h                         | 23 ++++--
>  include/video/edid.h                          |  4 -
>  34 files changed, 321 insertions(+), 254 deletions(-)
>  create mode 100644 drivers/firmware/efi/libstub/primary_display.c
>  delete mode 100644 drivers/firmware/efi/libstub/screen_info.c
> 
> 
> base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> -- 
> 2.51.1
> 
