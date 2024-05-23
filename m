Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13AC8CDA93
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 21:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF48D10E8DD;
	Thu, 23 May 2024 19:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SdMsogg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C5810E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 19:15:05 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3c9cc681ee0so3392692b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716491704; x=1717096504;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=neX9Rj9kbD2Mta30BndIslB9399YLTZUQPcD/TShwW8=;
 b=SdMsogg+0A1etbRrg7QcOOEHQTJjF12pEHePzteRX82d9l9vIKLrNaB8wG/LYgT7mb
 l9IczzA2hkUSwPblZVHM4OKwN/LS+y0QCMtAyQeXrZqXvjELDF7HMlJac2jVI8P1rVHX
 61pzAyzXxjukzqc7KJd7rBtqbrANVaLSNkUvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716491704; x=1717096504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neX9Rj9kbD2Mta30BndIslB9399YLTZUQPcD/TShwW8=;
 b=MTftdErB7t5+khjxakevrZFvDzeqmRJil0JyoztDTKBKgVGiPYU2bJ46q/HY3TDNFO
 cX5aad3X/oKoAulXP0QEd+Jqp+nikJB6omuYyoAtEgItlI/OGcmSZXIyUhXiXbgNQl92
 pt6aG85phMLBVu1xRCMOvW5MBFKdGL2fhqC8SdbGVVPdETHQDU7iZLI7V6vFy1+CGHk3
 6Sqrt1TUlDtKtanUCyh4Pb0wYjkigjkByJhBE1lbB9p9cLfIaWtVR/q4sxdKrJsj+mfw
 pdsyv320YUUFSgw9ul8h39x2A+V25ADwFYx6RKo61xgzVdONcoNk9Xo87VPNd4GSPvRN
 /oIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq4cH+v9gqOAVA6e97S9XIGVyVNJwzi2vdfkq/REFgJ+kl2mgR3EPugroRly5jn7m1gxUwyWNJooObJIi3HcThAEVIhDLyGhSBXcQh7S9A
X-Gm-Message-State: AOJu0YwDFMBnp8xQ1mMe+GGbO89gIDK8mGCMfCQSTG5AFob3soW8GJdE
 CQfimwaeA+ZY+doBbV+PD7VNVaEUq1eYRG53wGRf+gmAZJqXwEon9xyag+yjgw==
X-Google-Smtp-Source: AGHT+IH/Ysnno2TkFzRL2UNNhoEarRPKJ9VjuR8XSFIlVnpcZKrEaxTEc2+rptviFCowPSempZ9ABw==
X-Received: by 2002:a05:6808:10d4:b0:3c7:366b:980a with SMTP id
 5614622812f47-3d1a54835c7mr396574b6e.5.1716491704120; 
 Thu, 23 May 2024 12:15:04 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 12:15:03 -0700 (PDT)
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
Subject: [PATCH v10 0/8] VMware hypercalls enhancements
Date: Thu, 23 May 2024 12:14:38 -0700
Message-Id: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
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

 arch/x86/include/asm/vmware.h             | 333 +++++++++++++++++++---
 arch/x86/kernel/cpu/vmware.c              | 165 ++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 196 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 ------------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 602 insertions(+), 538 deletions(-)

-- 
2.39.0

