Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59F81FA9E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 20:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009310E008;
	Thu, 28 Dec 2023 19:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D442E10E008
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 19:24:36 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2041bb80cb3so4666725fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703791475; x=1704396275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4eXRhqd1yBwc+Z6yATNh3shIkHH9Y9LTIopAG5eguMQ=;
 b=SvIO9xGg6uG8MNuWQcIEsnGlEisvXKJENJ6qPyuP6V7sJ+wN4WlV2r88n5oJ9dtNuM
 A5ro06Sm4glSc/vZNKPEL6ykHq3LVhBOGa6AnLrqJcRDpXFThrpJfDH0RH4tlQCqI9Nk
 ZRvJ+ohfCEja3lrUQLQrsSGqIaUvBWgIw5Vy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703791475; x=1704396275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4eXRhqd1yBwc+Z6yATNh3shIkHH9Y9LTIopAG5eguMQ=;
 b=JHnREV02f2OpxKk+8TfVHAUFS5JzSeBqMtCDMQNHX73Gi1tVTPGXMmSZL3YQqZDBp/
 Yvqusa6eYuoJ+i3u6UqRhFpTpaVt4DOlLGI0t5WM6+SUdFK+207Jdg4KxUj4AbcHC7hg
 Lb3iRelpipJ6Li95jyMcmsTE0tWowKJy2eRE3gqWOWJPAP8x3u8O4qVF7xjCqRjSvW56
 JfBSX9s/xljVI9S2R8ffA/Gs6+3XNWAEtIoliYmr85ihPuIBQGdzGP+Haim6gzMVaBGT
 Wk6wIJHAWgcuubvxHl/3z8Yaa1o7rRjMCMbITF4eV0la8u7trekjeXNoRBqLxBRumcXg
 WDxQ==
X-Gm-Message-State: AOJu0YzS1IJOkzNep5HHlUHQiwnC41Kxc+0Mkw8TQ9lRF9Q1ucI7MP1W
 DIX4kRB9hgVhtWwsq2kYsiNXGh1L+Ngf
X-Google-Smtp-Source: AGHT+IGbLBUPIfQHiKai+8RHWPNYuqXRw43QCHnGQB70v03pdYwtq9pCK3CZzd+u6yZat7Ii/tgXpQ==
X-Received: by 2002:a05:6870:1490:b0:1fb:75b:131e with SMTP id
 k16-20020a056870149000b001fb075b131emr13111421oab.112.1703791475661; 
 Thu, 28 Dec 2023 11:24:35 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 k16-20020aa79990000000b006d9aa04574csm9522987pfh.52.2023.12.28.11.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 11:24:35 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v4 0/6] VMware hypercalls enhancements
Date: Thu, 28 Dec 2023 11:24:15 -0800
Message-Id: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
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
 kirill.shutemov@linux.intel.com, airlied@gmail.com, zackr@vmware.com
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

Alexey Makhalov (6):
  x86/vmware: Move common macros to vmware.h
  x86/vmware: Introduce VMware hypercall API
  ptp/vmware: Use VMware hypercall API
  input/vmmouse: Use VMware hypercall API
  drm/vmwgfx: Use VMware hypercall API
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 364 ++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c              | 116 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 ++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 -----------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 598 insertions(+), 525 deletions(-)

-- 
2.39.0

