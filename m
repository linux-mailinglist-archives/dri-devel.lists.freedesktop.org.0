Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9F87593C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 22:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3CC10E7EC;
	Thu,  7 Mar 2024 21:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="aiLwhAvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530F510E4AB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 21:29:58 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-29b7164eef6so159210a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1709846997; x=1710451797;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+YZLpG094wphSKZXLLG7LA5wMsC4o/YJbeoOf2hZChI=;
 b=aiLwhAvMZ3TsEp8YlokyGf4YJQu0ZIgylts6cSn7txiSafWnvkXLlv3GOD25O9Q9x7
 EhMgUhCAtR6bz3G+B3kPBs+5SmpbLn8sWh/uHu/s43zzew8+IRHP7KlL+yxmhUUgl7ES
 IaoeWVwz/d/DLT8DMCxWsDMa2giXddxghrphU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709846997; x=1710451797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+YZLpG094wphSKZXLLG7LA5wMsC4o/YJbeoOf2hZChI=;
 b=fXBbIGfcIf32Pk7XrmnLxfk/EdFjFcZJw2f1nqFwNQCoV9vnPtv/rUEPKMZyAHRNfy
 CRyLQwgRAQeqTlaRIo8Le/Mbxqt8An8TZPEfK/QOP5k7FFAjfTMTiWXM4apc0+BZ+eni
 N6KH7c9lYegQq9HXnXtqTdXIdcCcbJK5U/4qhu5PXeKZN6Xkyaq7+Xw/ZmVnPkIV7fbc
 A8Xvo0ndK4UvFIfe6OP3mqC00Lgo3FsOfyHFCFUbdkQE75x6POUId9qEKSlTK7c4g7Ka
 PmBYL2Vp2p+xHoJ2RjzTQvLqzgP0a9S1ZLjCb4Kfn55thcLleOauPE0rWJvh5D3e2G+K
 D71A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHAIWNZNJVx69EFJxN6/znK5jy9IhKEvf7wMyYQsPwV057QPIONxMe1OC3qU8b1T+/6WyQEnfKSbl2OEMnX2DYnX5o7+VvqHRFOWj/i4GL
X-Gm-Message-State: AOJu0YzG2B8OAfC6v4Uz7wk5TLN+pB4JtGXqrZbHnUSaxLyeM3Tlxj1o
 5FkFxbhY4jxWc1S/RmjublP4I7xeSlYpm+O4eTtABxqjccgT971OEldJUVlCxA==
X-Google-Smtp-Source: AGHT+IEzz+bckUTxMNcu0RwZK0XnBSiwtoTYqhjpphfi8E+fSD4mV1nsz9A9Yr4VpADTNeEUBC8JoQ==
X-Received: by 2002:a17:90a:a606:b0:29a:a3a6:dde7 with SMTP id
 c6-20020a17090aa60600b0029aa3a6dde7mr17873626pjq.18.1709846997354; 
 Thu, 07 Mar 2024 13:29:57 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([64.186.27.43])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090abd0c00b00299db19a81asm1991021pjr.56.2024.03.07.13.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 13:29:57 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 namit@vmware.com, timothym@vmware.com, akaher@vmware.com,
 jsipek@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: [PATCH v7 0/7] VMware hypercalls enhancements
Date: Thu,  7 Mar 2024 13:29:42 -0800
Message-Id: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
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

Second patch introduces the vmware_hypercall low and high bandwidth
families of functions, with little enhancements there.
Sixth patch adds tdx hypercall support

arm64 implementation of vmware_hypercalls is in drivers/gpu/drm/
vmwgfx/vmwgfx_msg_arm64.h and going to be moved to arch/arm64 with
a separate patchset with the introduction of VMware Linux guest
support for arm64.

No functional changes in drivers/input/mouse/vmmouse.c and
drivers/ptp/ptp_vmw.c

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

Alexey Makhalov (7):
  x86/vmware: Move common macros to vmware.h
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

