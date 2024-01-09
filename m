Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6598828220
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9781110E3A5;
	Tue,  9 Jan 2024 08:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451B310E3A5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:41:01 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5cdfbd4e8caso2002698a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704789661; x=1705394461;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9wYpp3OYvmWsAtzJnbqql3qjVLEUjHL49vz1VsGi0Ho=;
 b=CcURnpkulb7+06JxQbDzZ2BxdX6bTOPQ55nJBERrN0bcfrYStAm8I+C01Ks5ElG9GX
 atthgvFZPnLE2uAXXeiS6VTYniXaFL4pTLlW7E7T8GdxPjxukj+lZ/McVaIujNUmMh36
 jOmZU/nMvmQ7JHIlqZfjoT8ZS2dXmgGv9p73w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789661; x=1705394461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wYpp3OYvmWsAtzJnbqql3qjVLEUjHL49vz1VsGi0Ho=;
 b=IPKrMEXoGHJQ9PMZnV/JIgqxNj2zZg8J0HV7r7un8mT4/2NamTf+VDBEhbdVBfNx9C
 TlfvxexLuny+FqISuTRbg70IS6C5GlOgpXJBGfA4eBSNfi5VoFiL2si0MAS2slE3bc9v
 1fmeesb0ay+yuBaA4dOnjRODgtz+FF+aEWsXpAd9UOnmGJ7708/fY3yemCJ121gmoZKb
 GiAvLaUy5sUKb+GDE90aZEk6N0l+Vv2XJHvOxjd//+CLdZNAih7oX4a0Orm7NCdPDdxP
 fWRkQ6aN+BT8lUTSEmQyF40T6Faw3OAlYodUUCSJw1OQjhDQ0ZLvd0AmAsNytYJ96Sy6
 ULtg==
X-Gm-Message-State: AOJu0Yx4H5WKl+0BDNnKirLy4j7Id+uLCnkXWPHwYhtKxpUzrs5CIWLM
 cNlKtmJUuig/lVA35UCKPYwWVcu/aXBY
X-Google-Smtp-Source: AGHT+IGDNGili/eLI8MrSuIhgm8F/yz/d9X4r6v9ZFf88z3SxEXpihXxyC9q87KVaZRg+wy02GCoCA==
X-Received: by 2002:a05:6a20:1446:b0:199:c5b5:8f18 with SMTP id
 a6-20020a056a20144600b00199c5b58f18mr2129019pzi.14.1704789660801; 
 Tue, 09 Jan 2024 00:41:00 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 sf15-20020a17090b51cf00b0028d435cc2cbsm4772293pjb.15.2024.01.09.00.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:41:00 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v6 0/7] VMware hypercalls enhancements
Date: Tue,  9 Jan 2024 00:40:45 -0800
Message-Id: <20240109084052.58661-1-amakhalov@vmware.com>
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 kirill.shutemov@linux.intel.com, zackr@vmware.com
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

 arch/x86/include/asm/vmware.h             | 364 ++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c              | 117 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 ++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 -----------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 599 insertions(+), 525 deletions(-)

-- 
2.39.0

