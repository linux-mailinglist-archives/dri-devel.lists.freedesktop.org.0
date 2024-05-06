Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85048BD6FF
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 23:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF0510E97B;
	Mon,  6 May 2024 21:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="OwFauiWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D6310E97B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 21:53:35 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ec4b2400b6so19753865ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715032414; x=1715637214;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYUTFxlPB4t5BYAahm504Iew6H7+QkCuTotTXWPeyzI=;
 b=OwFauiWJiBZ42NfHeQb2WSCPQGpKXcPU2TEkhuA8Nr0dscjwuC5/4XzNu+vXO7900b
 zwvnyGzfHT3sdQQhN29LINKfVQPzkJ3wxeceJ7dObSOelKF5Vaq3CE9pH1O054YXEFvN
 K1cpWKa1hgYpgUY5qD9atljQWuLNxQlpfPLro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715032414; x=1715637214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYUTFxlPB4t5BYAahm504Iew6H7+QkCuTotTXWPeyzI=;
 b=QiCgCcFV/5e2MxmhJo9zDZcUkngEiOu1A/X8yFo6IWHLFM9pQR/BzkPodbl8/+A9jM
 0lsH1blq7Wv8ri0mK7MkB6l+BKPKpB+oESbq+Las/ecNQrjzMxUANZaaa5oFahmoVyYb
 44LwrkuwaekPJcVF6jlSOukOYlME8MqTm01iUMggOjU68ZuG5oPpe3Fj7LjBgLl7qJnH
 wPDxsWUgbrj7TvQJivzTsvAhAs3wWUeyUFvL7H9Wl+iut08KHAxZ8ryyq/xMb4L77243
 XBbp9McFXOz4rdVuLdWC3Ru7sUZTIgcn9sQG8CUCZxwym5W+TVqcHb4uzZn+5Niw51N0
 +Y2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkAb2At8CozLeopOWG8PQZZOh8K/df+nC7DXA745hOYq8lwDVxay47A05qtmAoiEED81MoqsSVLjVKEj2nEL5JaGIZ21wp1EIzGuDe8w3P
X-Gm-Message-State: AOJu0YxpTvnAv+WQBkwVsUxAwszREi8SJ195rQzm3eaAHUK6BmEq1MmY
 QfEp10RI3rpk6B3UlyK18PsIjjxB7p5T5Ug2OxjkCpZOA/4kKkNDGQUVWLeUhA==
X-Google-Smtp-Source: AGHT+IHL5cRDZJngyMmvBrgy59n1mJBgkULgJqoOpSace5UDEB2m1G8X4xIxLf9cVYD04RkFRqN71A==
X-Received: by 2002:a17:902:6bcc:b0:1e4:200e:9c2b with SMTP id
 m12-20020a1709026bcc00b001e4200e9c2bmr10847177plt.21.1715032414110; 
 Mon, 06 May 2024 14:53:34 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 14:53:33 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH v9 0/8] VMware hypercalls enhancements
Date: Mon,  6 May 2024 14:52:57 -0700
Message-Id: <20240506215305.30756-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
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

VMware hypercalls invocations were all spread out across the kernel
implementing same ABI as in-place asm-inline. With encrypted memory
and confidential computing it became harder to maintain every changes
in these hypercall implementations.

Intention of this patchset is to introduce arch independent VMware
hypercall API layer other subsystems such as device drivers can call
to, while hiding architecture specific implementation behind.

Second patch introduces the vmware_hypercall low and high bandwidth
families of functions, with little enhancements there.
Sixth patch adds tdx hypercall support

arm64 implementation of vmware_hypercalls is in drivers/gpu/drm/
vmwgfx/vmwgfx_msg_arm64.h and going to be moved to arch/arm64 with
a separate patchset with the introduction of VMware Linux guest
support for arm64.

No functional changes in drivers/input/mouse/vmmouse.c and
drivers/ptp/ptp_vmw.c

v8->v9 change:
First patch "x86/vmware: Move common macros to vmware.h" was split on 2 pieces:
  "x86/vmware: Move common macros to vmware.h" - just code movement, and
  "x86/vmware: Correct macro names" - macro renaming.

v7->v8 no functional changes. Updated authors and reviewers emails to
@broadcom.com

v6->v7 changes (only in patch 7):
- Addressed comments from H. Peter Anvin:
  1. Removed vmware_tdx_hypercall_args(), moved args handling inside
     vmware_tdx_hypercall().
  2. Added pr_warn_once() for !hypervisor_is_type(X86_HYPER_VMWARE) case.
- Added ack by Dave Hansen.

v5->v6 change:
- Added ack by Kirill A. Shutemov in patch 7. 

v4->v5 changes:
  [patch 2]:
- Fixed the problem reported by Simon Horman where build fails after
  patch 2 application. Do not undefine VMWARE_HYPERCALL for now, and
  update vmwgfx, vmmouse and ptp_vmw code for new VMWARE_HYPERCALL macro.
- Introduce new patch 6 to undefine VMWARE_HYPERCALL, which is safe to do
  after patches 3 to 5.
- [patch 7 (former patch 6)]: Add missing r15 (CPL) initialization.

v3->v4 changes: (no functional changes in patches 1-5)
  [patch 2]:
- Added the comment with VMware hypercall ABI description.
  [patch 6]:
- vmware_tdx_hypercall_args remove in6/out6 arguments as excessive.
- vmware_tdx_hypercall return ULONG_MAX on error to mimic bad hypercall
  command error from the hypervisor.
- Replaced pr_warn by pr_warn_once as pointed by Kirill Shutemov.
- Fixed the warning reported by Intel's kernel test robot.
- Added the comment describing VMware TDX hypercall ABI.

v2->v3 changes: (no functional changes in patches 1-5)
- Improved commit message in patches 1, 2 and 5 as was suggested by
  Borislav Petkov.
- To address Dave Hansen's concern, patch 6 was reorganized to avoid
  exporting bare __tdx_hypercall and to make exported vmware_tdx_hypercall
  VMWare guest specific.

v1->v2 changes (no functional changes):
- Improved commit message in patches 2 and 5.
- Added Reviewed-by for all patches.
- Added Ack from Dmitry Torokhov in patch 4. No fixes regarding reported
  by Simon Horman gcc error in this patch.

Alexey Makhalov (8):
  x86/vmware: Move common macros to vmware.h
  x86/vmware: Correct macro names
  x86/vmware: Introduce VMware hypercall API
  ptp/vmware: Use VMware hypercall API
  input/vmmouse: Use VMware hypercall API
  drm/vmwgfx: Use VMware hypercall API
  x86/vmware: Undefine VMWARE_HYPERCALL
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 331 +++++++++++++++++++---
 arch/x86/kernel/cpu/vmware.c              | 144 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 ------------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 593 insertions(+), 525 deletions(-)

-- 
2.39.0

