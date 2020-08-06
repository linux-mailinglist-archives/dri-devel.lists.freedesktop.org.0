Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478423D781
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473876E87B;
	Thu,  6 Aug 2020 07:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240656E196
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 07:28:42 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id t6so6031195pjr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=FlHv4vQ3VE/olmEyXl/0XGGhlOpr/3Wij7v72m3kCKiJ8HQN64oV/l2YU6MpViKD/c
 VzriSXtzL1h10FtNlHeGdJFQdfemeX+u/yNotMOdpLtO+npHb1nsBD6M579Bd0RM7Akz
 TbvVB8Ex6/YW7ZRmE/1vGxX7gl19yorBetIWPr5QIEY6AZB/kCh6NJFzppkjQnakoH6Q
 RPTFCddX7l/tegFjdysNNCgDMYpgyQAyPKU5OFSIfzTzcDS6l3AHJoOrIerAQaIiUZHx
 1QcqOue1z1k9sId/jFdRzdAEvJvU2sm8hJOYSNZ3y07QmZuV69+W9IRprFpWLBJmypFW
 vKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=pL6GmqhvdgtnSdgjE3OM36IW38ZRKF7fgMcocl8L4VBhak7i+/YvEe9b0Nm286a2nz
 r+nMzSZIT8T6qxzZNeuvzYOlyEf/OcQTyUkBFbztACYuBDNeYdpxQTGWPy0XYXHJi9Qo
 Xv5F5IWCcLsu4FK/j781W8aQDDt6nRniRTzVb/XJjFTnimArrdBHShGP7COCIKQ/raww
 HuC48al0RtKeDrouvVaYYtgKkVDp8SsRigZEao+8fM3hiYsGrdPfTq3WUN3L9Yl3aQbN
 lx1tb/TU+eN1wHLoMae/T2lmCg6Dr5XNzjpxYe9saTb9mcdy/mNt6AJe46SLWFD9ktJ0
 MtnQ==
X-Gm-Message-State: AOAM532idCh+HQ0XTJlp0T2TOf1U8RetRcCabDTdo0u582qy6+I/nqdy
 2CLmFzjMBvVxmdrGrZL5m9RhZsM0QN9WmA==
X-Google-Smtp-Source: ABdhPJy7rdcwXEx1kuFL2y1hDY5pQJYgbk0CrGVGdH58fTlyJBq3RxNFJpj108XYiC7FRL9fXS9JyQ==
X-Received: by 2002:a17:90b:368c:: with SMTP id
 mj12mr6307408pjb.152.1596698921683; 
 Thu, 06 Aug 2020 00:28:41 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e125sm6654646pfh.69.2020.08.06.00.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 00:28:41 -0700 (PDT)
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
Date: Thu,  6 Aug 2020 12:56:56 +0530
Message-Id: <20200806072658.592444-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
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
