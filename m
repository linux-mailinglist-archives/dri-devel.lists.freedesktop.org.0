Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CC23D77C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8721C6E876;
	Thu,  6 Aug 2020 07:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F9F6E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 18:09:13 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id c10so3487253pjn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x87wiamKK8IpHrYWyQZkX28BwuSCR2wXWSfYCvqc6Rg=;
 b=iVu5YmbCMVDewJqlVtDIukhKIgmctZpLwDYBjjmVLQM1euBz+LL3Of/pjceORkGcXF
 c7dONE40HnV+TknJtM2Tzk97+fvTlV+/t1CGUh342m0OcQFJXj3WM0uTeln70cX61qu9
 USzcgm0fYccuXZypXeKskZxK8qIzOXDewtV0+HZtVr3fQWdBDKc4iYFVrAF7P6egb0GR
 bqo4koVQOC1SSbnWDyviBLLNqEch7ix/IqZEB/fP5QPUzcpfpk2X+iBqi75Td6Hc40kk
 hvRUQjHkYKlCXxoAF9Gy8JOpbx55jwzwCN39OL8vMFLiD6eYyLIlyo3Fz/LV9LgkvtuB
 66zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x87wiamKK8IpHrYWyQZkX28BwuSCR2wXWSfYCvqc6Rg=;
 b=TeXdIlN/nU3K71LUjkC6SurNM8+KSGF7hJnaU25202KiI8br9LQLa2XNCL3PkogdXk
 jwxK6I1ep+judUuhjDSroXSEgnS/NMUyL8Y2ulhsW6R3vkc4XK8JdC5DbO3+SPxRsyCf
 6rWxgI/qEwdYBuHylHLz2PBZV9VFuPlWLCtyPLid35SFcG/V+a7Q1oc4EnjSHuqHach+
 dZOs1krAs2I/CBpMVMg8oMeGhqfgsMgMNbywmRd3UGnE+xuJ+ho+1RIkf6nPtfiCQXYI
 8GFTJyWFJBvrQxM/ycvu7480t1LwgvqPzdfXVpnXgM3NoFcS+D9TbMaxe1r9O9lQVr3g
 v1bg==
X-Gm-Message-State: AOAM531vr+cTlfH3QCj/0abFBj9tbB7xPqDQRZSlRLDfb+badW/ldxlL
 9z5EQ1mxaJL3VrU5UzElekk=
X-Google-Smtp-Source: ABdhPJwUy/xTCTo4J11cPRCLtgYVRxefF50v0a+BLy6A+JQtiPi2J2b5Wfa40r5V275kuWu/lnDLsg==
X-Received: by 2002:a17:90b:4a0a:: with SMTP id
 kk10mr4515843pjb.30.1596650952734; 
 Wed, 05 Aug 2020 11:09:12 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:09:12 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v1 00/12] video: fbdev: use generic power management
Date: Wed,  5 Aug 2020 23:37:10 +0530
Message-Id: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
