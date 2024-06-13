Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B6907C27
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D60710E0F4;
	Thu, 13 Jun 2024 19:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="XGwU6M51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C35410E0F4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:11 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b0745efaeeso7748916d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306230; x=1718911030;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SqRZVCpbYo2jtcU4VLLPgUkKEV8z0zarA1K4gBzGSZs=;
 b=XGwU6M512qyiOwyrxYyQKo90wxB2MCbEqJUFMUHqy7d5pjxiSzxMsYpiy9Zba4ElCL
 BesnmBYUGSu9SvtAeXVTfi0RuPwsiN9x6kCgfLnpwMk6UDibdhE3RC+y0WnNFQqNglNu
 9RdGK9GVeY08UlLmXoSWuG3POF0Brl8oBAL3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306230; x=1718911030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SqRZVCpbYo2jtcU4VLLPgUkKEV8z0zarA1K4gBzGSZs=;
 b=kvivbwBfLxaEFEFn3CnCzPKcrKY87tGBwE/Jm5h/cHQNtfW9zQWplYqzs165z2eXH6
 eE5oeOVsbW18AR83PUG6dq16KUlzvhWBZKQIrI0ecCG4eukY2xLYgtFXox//e+NTdkNI
 fCkrRj4wU5YiOx4N4fCGVzxh7z957L9143/FSSwPVVlyyMixn0lVLYgc6zp3vW1r7epF
 4TWbNir6xPjLevx6ooAAmu6NDRUxxU65Hw71e9e2/fjAA8tM+ODrIhAgahjW/IzIBlzy
 lo6cYLRFEukcqZDhMpkscVuyra/79f7gPsy7QsdxVZ5oVpBdYF8d3cSzalSII6AZ4BEd
 3PdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6KHGboISntkPZdXVjtDlJrGyFCMzmqUgE/1EUO6ONIHJj/E7mt18ilXBiQg9+MPOZvXqCorQV2uF1+7PQwlV+i+PYoC6DeM1u8KOxeAGP
X-Gm-Message-State: AOJu0YwHxC8KW7aIU+Udf1U3zVnMCJ7u5q42fFQDlJNK0OQpk3sNWNqe
 QYNRRWOUu4pVC25V4b6Qvq8Wk8/DNfcZDmTrQ729t/s+W1LciFwQm/eDzgK6cQ==
X-Google-Smtp-Source: AGHT+IFjEHPK4k0l7eyVsilK8yUQTNHgIqYDnv7SJ1An/1VqFCPEcRK7LH9vCsjmYZUTW3mQYOd55w==
X-Received: by 2002:a0c:f882:0:b0:6b0:839e:ba6b with SMTP id
 6a1803df08f44-6b2afd5f040mr5356876d6.43.1718306229909; 
 Thu, 13 Jun 2024 12:17:09 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:09 -0700 (PDT)
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
Subject: [PATCH v11 0/8] VMware hypercalls enhancements
Date: Thu, 13 Jun 2024 12:16:42 -0700
Message-Id: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
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

First patch introduces the vmware_hypercall low and high bandwidth
families of functions, with little enhancements there. And the last
patch adds tdx hypercall support

arm64 implementation of vmware_hypercalls is in drivers/gpu/drm/
vmwgfx/vmwgfx_msg_arm64.h and going to be moved to arch/arm64 with
a separate patchset with the introduction of VMware Linux guest
support for arm64.

No functional changes in drivers/input/mouse/vmmouse.c and
drivers/ptp/ptp_vmw.c

v10->v11 changes:
- Redesign VMware hypercall asm inline. Move slow path to a separate function
  keeping asm inline alternative small a simple. Suggested by Borislav Petkov.
- Use existing _ASM_BP instead of introduction of VMW_BP_REG as was suggested
  by Uros Bizjak.
- Patch 6: add "Fixes" tag as was suggested by Markus Elfring. 

v9->v10 changes:
- Restructure the patchset as was suggested by Borislav Petkov to
  introduce vmware_hypercalls API first, then move callers to use this
  API, and then remove the old mechanism.  
- Reduce alternative portion of VMWARE_HYPERCALL by moving common code
  outside of alternative block. Suggested by Borislav Petkov.
- Use u32 instead of uint32_t in vmware_hypercall API and across vmware.c
  as was suggested by Simon Horman.
- Remove previous Reviewed-by and Acked-by.
- Fix typos in comments and commit descriptions.
- No major changes in patches 2,3,4,8 compare to v9.

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
  x86/vmware: Introduce VMware hypercall API
  ptp/vmware: Use VMware hypercall API
  input/vmmouse: Use VMware hypercall API
  drm/vmwgfx: Use VMware hypercall API
  x86/vmware: Use VMware hypercall API
  x86/vmware: Correct macro names
  x86/vmware: Remove legacy VMWARE_HYPERCALL* macros
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 336 +++++++++++++++++++---
 arch/x86/kernel/cpu/vmware.c              | 212 ++++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 196 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 ------------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 654 insertions(+), 536 deletions(-)

-- 
2.39.4

