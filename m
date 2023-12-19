Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08D81929B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 22:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2065D10E205;
	Tue, 19 Dec 2023 21:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C630410E262
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 21:58:03 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d04c097e34so1050295ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 13:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703023083; x=1703627883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oDzQhgIqDjX+fytpqITZ57HizgWrk/Gmzq6GoIsVzBc=;
 b=Qu89R3g5DsikywmsJh319/RFc5tfdyWqE0OIZFpAXbNEe9XDdMaIHu/IgaOJDwBQC0
 6zYxB15UXyCr0xZModREuNNJ7klzjVDB6YvWiIMr/0ThMwGEp1EtCIopYlE8/mJvg3wC
 QRQwlXToxAaO+/XjMtjQhBmRLduo2HqH6bjrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703023083; x=1703627883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oDzQhgIqDjX+fytpqITZ57HizgWrk/Gmzq6GoIsVzBc=;
 b=LgxNUySC7fU9N6uD+bV6LqMV+mkfZN5bAztXRMg2RNlyMxZg0dv8klC0/6r+Yrw7Ws
 JoIsi+OIWz71Ce6MpRSzVqqcQTAbRSSEUy06RDZcGpUM44bFJz/yiaAlrmPF1XLmG/hD
 MBQ9/rreNDPJWVsQB+q5J2rdWfFZVgW7ELXto1S3XE3CdNIgiRGtijWv7Yp0GdlobQxP
 cZ0ePbh9DC1PLVkanpOkWy43iNlNkNka25QWAdVDuugGRdjZNH1Z/OqEolHPkasO41NR
 ZuIPM9JH7z2pDyzLVy4BU5KWC5nSu9FPXh6cZPtLvVDZ59LRp/FzHLhvt9h/Vh2H2CGK
 AL7g==
X-Gm-Message-State: AOJu0YxV0VY0zj4oQLE0gGtbOdVTyprKgsNcI2QaaKCA17hJOz21fUkQ
 128q232c1lgsZP3T5oWeknUeUqVDoKS6
X-Google-Smtp-Source: AGHT+IFpkieRnYX2krB3iy+D6iZ6NtVOA9WZs25SYlO/ihVa0FtxrjypCE07V0g+ajh6EVSVdLwAvQ==
X-Received: by 2002:a17:903:1107:b0:1d3:bceb:ba62 with SMTP id
 n7-20020a170903110700b001d3bcebba62mr2007657plh.45.1703023083132; 
 Tue, 19 Dec 2023 13:58:03 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170902e8c100b001d3aa7604c5sm5356476plg.0.2023.12.19.13.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 13:58:02 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v3 0/6] VMware hypercalls enhancements
Date: Tue, 19 Dec 2023 13:57:45 -0800
Message-Id: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
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
  x86/vmware: Introduce vmware_hypercall API
  ptp/vmware: Use vmware_hypercall API
  input/vmmouse: Use vmware_hypercall API
  drm/vmwgfx: Use vmware_hypercall API
  x86/vmware: Add TDX hypercall support

 arch/x86/include/asm/vmware.h             | 338 ++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c              | 116 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       | 173 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 197 +++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 185 ------------
 drivers/input/mouse/vmmouse.c             |  76 ++---
 drivers/ptp/ptp_vmw.c                     |  12 +-
 7 files changed, 577 insertions(+), 520 deletions(-)

-- 
2.39.0

