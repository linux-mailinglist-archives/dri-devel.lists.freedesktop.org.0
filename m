Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797F124AFFF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E4C6E909;
	Thu, 20 Aug 2020 07:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC736E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:58:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k13so11253160plk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=teSA+VF9m0g0fiG8uR8fbDhA8YjsqGp+oSZrp5d7n9U=;
 b=Ddg2juEOoCmHUuQArhnsFSay6iY0S9DecklI+21FdyRNq5jSHiDoGK2hZWZBN6dXxf
 uSJdgdBW2SbPPdcGEqOMILtPKUxDod5d+CniKZp2b9MMNxkLNIZ9CK9XHrf9XlMwFH9O
 BeXKAXjBjqp0U9QnBE5dElE/lfDh3muuiVY6RpzO/DhO6iUxwXPd5OAYGwEccOmKeUok
 AvH+PzbcQtdlJZ5v7PYUomw2GhVLghruNZsxqBFTdfvF4HpNxBpH79FXQtn/7ZQ+Sj7r
 hymuwHpjetoojCk3aJJ83r3Okn2hZlhsU7kOFsAeMPrODkHd/n01iMWK8C4/fxGbXpjO
 +Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=teSA+VF9m0g0fiG8uR8fbDhA8YjsqGp+oSZrp5d7n9U=;
 b=em16+3nCSaiHKwbaX8OkfBI/R2hBNwscvX5V5nnhJ+94OVmJppPUv8JRxol3E/GEST
 DJ/EfpJcBg1+9BShpBUKtIw/hcTTE6nAxO585U+2uwy/zWclLYv9gLFup+HP4M8iaXh6
 ps3fZRt2pzJQ9Prq1DP+zTJtF12wshETUKt43FRhkf8ngYZwUfFpwly2P2OcZXVvrnu7
 77RJXpXTgpmPz6t+IB2iaW3n3RzNIkIRepnbyEea57fPvQOHKm0uDCe/Tki5wSm9KhXo
 1U8suMmtY8rRszzdMj/sIy+M73fcNgHNSBxypwbB2LyPLRvLRTyxWWnTX5ngkcxwrUh2
 NJAA==
X-Gm-Message-State: AOAM533KOu3wMd+xG7+jHB75Yli5uxZGPxt8SlBRkdPeA2KIy31Trlqk
 zXHCJqos4Yl1lIYzJUyDAwU=
X-Google-Smtp-Source: ABdhPJwNFdqnCDQRO/tySZxGOWZIe3t9mcFk7yheydz6bXCndpt/TagKm0lrSk7e+WHEmyBWkUYYHQ==
X-Received: by 2002:a17:90b:4c0c:: with SMTP id
 na12mr4980552pjb.24.1597863538514; 
 Wed, 19 Aug 2020 11:58:58 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:58:58 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v3 00/12] video: fbdev: use generic power management
Date: Thu, 20 Aug 2020 00:26:42 +0530
Message-Id: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
