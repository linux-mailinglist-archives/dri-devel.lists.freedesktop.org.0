Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807B2416B8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DC06E4CA;
	Tue, 11 Aug 2020 06:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8318E89951
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:59:18 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p37so1283582pgl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x87wiamKK8IpHrYWyQZkX28BwuSCR2wXWSfYCvqc6Rg=;
 b=ZZsnFz6L+wbM1Zgg5QA7lgADPT6oEH8/ADKOklgw32TAKsJT37pzlRTS8P3PEYEU21
 0a5tolSF9/i6pWJzA1Ezl7Lmuroho8D9xIgHerRNXT5z2bFEzWjqeFDUNBNJ5j0CozVE
 WVZCtUqwr5eChlEX3rtzkrtXYQRS+F/KAJJOwggs2PcBOip781/p8XMRT8WEr+s1rII0
 nAmGLbJwKfTsy/ySJlzup63SsbjrJ727FRySv3UAg5IWXReYUSy76ylEygkQ1VnZMFE+
 cIxdPQafbXsER2xhNcurt51yWutvFr8nD+sGheu+NIer6bZs1UbfeEq8GTYPsucTFlNl
 cjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x87wiamKK8IpHrYWyQZkX28BwuSCR2wXWSfYCvqc6Rg=;
 b=h9gFCcK+lZ5jK8CxuagNoEAHF+3idyjHd1Z/FAp0UGZSKA4WHV5CmHc+bZJAaYgFGO
 PymJ2uce8DgfV7eJTO4Sa6N0bo70ZaFKXJyxnfya6O7YtCt/eSbpxjG32cjAEu9/0/jp
 gO8JzStfxCUJAYVaPNNxNf31e6obtJcgMk/m7qDkRpwCgjlojQE3611k3O5lhz6d/mvz
 h4xxpHUWbv8hhgVDpBIao05CLd5XHmoRtpWkCeeymvWtHHrzSMZQKCFjjx5h5G9s286d
 1IIs9gdjLIHQnZN9iUvml9MIPcMaTlzWeGRb0DrR+0mqpaUdmtY5HQBmeO/At9sYPnnv
 bZHg==
X-Gm-Message-State: AOAM531glf/kr+kYeVrYJrfaEkso6LwDWpUbh0946k1RNyQp4Pl7/rNe
 pYFot81be6bNCiUTyzqgRUYgZz2ELt60eQ==
X-Google-Smtp-Source: ABdhPJyPqIiE4/6f56BZE0TAQHYbCJrcQ8/BTUQoQnH8DzVTNJrbgDzgOiV0zuWvmdXily+zD39Uqw==
X-Received: by 2002:a62:cfc1:: with SMTP id b184mr2255523pfg.262.1597085957970; 
 Mon, 10 Aug 2020 11:59:17 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:17 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2 00/12] video: fbdev: use generic power management
Date: Tue, 11 Aug 2020 00:27:11 +0530
Message-Id: <20200810185723.15540-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810165458.GA292825@ravnborg.org>
References: <20200810165458.GA292825@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to upgrade power management in video fbdev
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (12):
  fbdev: gxfb: use generic power management
  fbdev: lxfb: use generic power management
  fbdev: via-core: use generic power management
  fbdev: aty: use generic power management
  fbdev: aty128fb: use generic power management
  fbdev: nvidia: use generic power management
  fbdev: savagefb: use generic power management
  fbdev: cyber2000fb: use generic power management
  fbdev: i740fb: use generic power management
  fbdev: vt8623fb: use generic power management
  fbdev: s3fb: use generic power management
  fbdev: arkfb: use generic power management

 drivers/video/fbdev/arkfb.c                  | 41 ++++++-------
 drivers/video/fbdev/aty/aty128fb.c           | 51 ++++++++++------
 drivers/video/fbdev/aty/atyfb_base.c         | 50 ++++++++++-----
 drivers/video/fbdev/cyber2000fb.c            | 13 ++--
 drivers/video/fbdev/geode/gxfb.h             |  5 --
 drivers/video/fbdev/geode/gxfb_core.c        | 36 ++++++-----
 drivers/video/fbdev/geode/lxfb.h             |  5 --
 drivers/video/fbdev/geode/lxfb_core.c        | 37 +++++------
 drivers/video/fbdev/geode/lxfb_ops.c         |  4 --
 drivers/video/fbdev/geode/suspend_gx.c       |  4 --
 drivers/video/fbdev/i740fb.c                 | 40 +++++-------
 drivers/video/fbdev/nvidia/nvidia.c          | 64 +++++++++++---------
 drivers/video/fbdev/s3fb.c                   | 39 +++++-------
 drivers/video/fbdev/savage/savagefb_driver.c | 52 ++++++++++------
 drivers/video/fbdev/via/via-core.c           | 39 +++++-------
 drivers/video/fbdev/vt8623fb.c               | 41 ++++++-------
 include/linux/via-core.h                     |  2 -
 17 files changed, 267 insertions(+), 256 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
