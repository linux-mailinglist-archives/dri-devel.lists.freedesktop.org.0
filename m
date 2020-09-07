Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0025F3D4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34906E130;
	Mon,  7 Sep 2020 07:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7F089B06
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 07:04:27 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id b16so6261123pjp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=M5a+MLnV7m4BYslTgTXLbVYvDCJ2QB7MC9Se+kNZ7FNpVHy7lHDPtsKHEFFti0QN9k
 PWOhVugkp82UCARsJ6e5aHJE/eeezbYXjCv3lokjUauh6ayjQo7iY7mOl+D6HJIyj9GM
 xCvcxP81rQzAbPFVvVpFfBkw9QB1MZ8sWTKw2oksX253tgDfHVpIZzGAC6CqhYL91IqE
 ErH43LJwV53Kwfp/kElozpKW0tdOH+QtM+XUGtVBYpvRupAR6s993NNAZB+LZtxvzZUL
 UJdOzeDkCzG/eZNgTwGcuLSvg8aIZA61IfPdA6xL1DknoDpu8fy0JYIfVPpXMUYwinuu
 xqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=Dd4xFY2+Mcg6k2YTK3mvFx1gsdzac1yePHI+4s8fMuJuFU+2NtP/jaduwthTK1sEBI
 u3mKXZZ4cfEnhb2CR+kQmHfiaHMmELU0F88a6J4Mj0BH5e9v3TnVdcx1Xky+4GOu8Lw/
 KeGmsg3ul/POTqlB5qtXxtH7B0r5OtynsX1YVpUO2i6gyddj0TCmjzXsvKwSBTJKslTq
 U8yqfR/D4yG03c70KKNbpWYHDUuZ4KDt1ACETJtpu3s+SOB+ie+jwTvpjYMEGysvyvR3
 8RCWmxc3/rtcDfE55zibWQTuPqKNXFG3oLROhmMIJftdgGG7xbswERqo6w8+YJitcLLr
 +hiw==
X-Gm-Message-State: AOAM5301O0mUo0Vdcq4My3RVEDe/hlvMVqNc5zRj+ltIkgqTOO1uGi0I
 Ty7iCAvGbFIiOhYIxHhq2HY=
X-Google-Smtp-Source: ABdhPJxzXrszn/nMlQPgA3dIh74jqZ12lEEdIGvXDzYX2rnrX6ut7BBU2gmf7rUzqk3t1RGZMtWKzw==
X-Received: by 2002:a17:90a:bc08:: with SMTP id
 w8mr19016149pjr.168.1599462267567; 
 Mon, 07 Sep 2020 00:04:27 -0700 (PDT)
Received: from varodek.localdomain ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id 204sm6804733pfc.200.2020.09.07.00.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:04:27 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Subject: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade and
 fix-ups.
Date: Mon,  7 Sep 2020 12:32:19 +0530
Message-Id: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linux Kernel Mentee: Remove Legacy Power Management. 

The original goal of the patch series is to upgrade the power management
framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
redundant. This was introduced in the commit
42ddb453a0cd ("radeon: Conditionally compile PM code").

------------

Before 42ddb453a0cd:
$ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"

Based on output in terminal:

547:#ifdef CONFIG_PM
       |-- 959:#ifdef CONFIG_PPC_PMAC
       |-- 972:#endif
       |-- 1291:#ifdef CONFIG_PPC_OF
       |-- 1301:#endif /* CONFIG_PPC_OF */
       |-- 1943:#ifdef CONFIG_PPC_OF
                   |-- 2206:#if 0 /* Not ready yet */
                   |-- 2508:#endif /* 0 */
       |-- 2510:#endif /* CONFIG_PPC_OF */
       |-- 2648:#ifdef CONFIG_PPC_PMAC
       |-- 2654:#endif /* CONFIG_PPC_PMAC */
       |-- 2768:#ifdef CONFIG_PPC_PMAC
       |-- 2774:#endif /* CONFIG_PPC_PMAC */
       |-- 2791:#ifdef CONFIG_PPC_OF__disabled
       |-- 2801:#endif /* CONFIG_PPC_OF */
2803:#endif /* CONFIG_PM */

------------

After 42ddb453a0cd:
$ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"

Based on output in terminal:

547:#ifdef CONFIG_PM
       |-- 959:#ifdef CONFIG_PPC_PMAC
       |-- 972:#endif
       |-- 1291:#ifdef CONFIG_PPC_OF
       |-- 1301:#endif /* CONFIG_PPC_OF */
       |-- 1430:#if defined(CONFIG_PM)
                   |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
                   |-- 1944:#endif
                   |-- 1946:#ifdef CONFIG_PPC_OF
                               |-- 1947:#ifdef CONFIG_PPC_PMAC
                               |-- 2208:#endif
                   |-- 2209:#endif
                   |-- 2211:#if 0 /* Not ready yet */
                   |-- 2513:#endif /* 0 */
       |-- 2515:#endif /* CONFIG_PPC_OF */
       |-- 2653:#ifdef CONFIG_PPC_PMAC
       |-- 2659:#endif /* CONFIG_PPC_PMAC */
       |-- 2773:#ifdef CONFIG_PPC_PMAC
       |-- 2779:#endif /* CONFIG_PPC_PMAC */
       |-- 2796:#ifdef CONFIG_PPC_OF__disabled
       |-- 2806:#endif /* CONFIG_PPC_OF */
2808:#endif /* CONFIG_PM */

------------

This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)

The patch-series fixes it along with PM upgrade.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (2):
  video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
  fbdev: radeonfb:use generic power management

 drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
 drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
 drivers/video/fbdev/aty/radeonfb.h    |  3 +--
 3 files changed, 35 insertions(+), 16 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
