Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C80327089
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 06:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A8F6E12C;
	Sun, 28 Feb 2021 05:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8F56E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 05:30:47 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id v64so9769319qtd.5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 21:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUOjIahCE3m3vqcOaZ6XgdoLkVb449SXw7uK1/M5V3g=;
 b=MuwZKT9UvXBdOYHaV4/EciRChdOhh5hxcyYDVfc+5GNOHOaRuNESeLbLfHECxdv4Kn
 CX6aylPzdYia0JEGyukL5sa6k87d2Zk6WCSjDOmjVlix1xLVb0FkeRL1mDhlgtS0jQXw
 qmx/msyYGtB9DR4De6Crf/SCcOF7ZE0gAfcH59pHmY96UjWZHnxCaotxuc+IuHhmOIy3
 jykXM29/CQVg40QGZzAoGonZnHYWZUigAMm8/qYIYgnXjTf/E+YAAFYiqwa2ta5M8ZrF
 rBRYJ5TF+l0GSdD0XRfHF/GAFKi36EqmqneeFBg1SOJ2miWGfqtsWQ6wfYrkbG/NHa0F
 lhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUOjIahCE3m3vqcOaZ6XgdoLkVb449SXw7uK1/M5V3g=;
 b=oDtRk6vMW8Z9S8fugWK9oBfTJbmeNNo/qs3cfbPSNr1iUjIKsABEz0t+IJcewPSfT/
 1wn7yEmAuxqUeZF4YZCNN6xUrEhJV0a10yE+JGbz+ozbqHXq+SxF4TvM6CWXyh+CXf8L
 Oz3T5oV9cvl6FpWCGjStKYlOXbIbU1Pwsw7IZMoVSyJLOccVDTfBPw6Kr9LNWgNOQRR0
 suIa8oEGmv78UB29nhY6dAaS2aN/EBpQyuc6KyBUcwvlmWjyLzJdpOyv/4AkF96MyIHa
 iTf8yoc2ThUUvsOKD4ZRTyFYxGM0RRp3mymq4O6AoyMKYCM2UBP86FnhgwqwZ1pSKgs+
 oW2g==
X-Gm-Message-State: AOAM532Jm2L9hahXAv6hnPnlZ1SFERSDbA93IAxGQfydPTTHHSmIp4W5
 eR1AiOwydKS8nst+QzNH8f0=
X-Google-Smtp-Source: ABdhPJzJqiTDSuCeDvpyz+fZRp4K1vOddRwuBKzeTGhVSvawFga+ywpgxU+0Q1bAlmV0s9/x8bfqyQ==
X-Received: by 2002:ac8:4d07:: with SMTP id w7mr8625447qtv.70.1614490246356;
 Sat, 27 Feb 2021 21:30:46 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:94d2:9984:c3fe:c09a])
 by smtp.googlemail.com with ESMTPSA id i13sm8755906qtv.95.2021.02.27.21.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 21:30:46 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Thomas Winischhofer <thomas@winischhofer.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: sis: catch out of bounds in SiS_DoCalcDelay
Date: Sun, 28 Feb 2021 00:30:40 -0500
Message-Id: <20210228053040.231920-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: ztong0001@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idx1 is read from hardware and the range is [0, 30],
the size of ThLowA and ThLowB is 24, so there could possibly an out of
bounds access. This patch catches the OOB access and print a warning.

[    4.771691] ==================================================================
[    4.771693] BUG: KASAN: global-out-of-bounds in SiS_DoCalcDelay+0xa9/0x160 [sisfb]
[    4.771718] Read of size 1 at addr ffffffffc0048b1f by task modprobe/96
[    4.771722] CPU: 0 PID: 96 Comm: modprobe Not tainted 5.11.0-rc7 #92
[    4.771727] Call Trace:
[    4.771729]  dump_stack+0x7d/0xa3
[    4.771733]  print_address_description.constprop.0+0x1a/0x140
[    4.771738]  ? SiS_DoCalcDelay+0xa9/0x160 [sisfb]
[    4.771760]  ? SiS_DoCalcDelay+0xa9/0x160 [sisfb]
[    4.771782]  kasan_report.cold+0x7f/0x10e
[    4.771786]  ? SiS_DoCalcDelay+0xa9/0x160 [sisfb]
[    4.771808]  SiS_DoCalcDelay+0xa9/0x160 [sisfb]
[    4.771830]  ? SiS_GetFIFOThresholdIndex300+0xb0/0xb0 [sisfb]
[    4.771853]  ? sisfb_probe.cold+0x3a0f/0x4f7d [sisfb]
[    4.771876]  ? SiS_GetRefCRTVCLK+0x6c/0x80 [sisfb]
[    4.771900]  ? SiS_GetVCLK2Ptr+0x28b/0x800 [sisfb]
[    4.771923]  SiSSetMode+0x26de/0x4770 [sisfb]
[    4.771946]  ? SiS_LoadDAC+0x3e0/0x3e0 [sisfb]
[    4.771968]  ? ___slab_alloc+0x412/0x5d0
[    4.771971]  ? set_inverse_trans_unicode.isra.0+0x147/0x170
[    4.771975]  ? sisfb_syncaccel+0x12f/0x140 [sisfb]
[    4.771998]  sisfb_set_mode.isra.0+0x264/0x12b0 [sisfb]
[    4.772020]  ? kasan_module_alloc+0x5f/0xc0
[    4.772023]  sisfb_set_par+0x3b3/0x930 [sisfb]
[    4.772046]  fbcon_init+0x447/0x980
[    4.772049]  ? sisfb_probe+0x1490/0x1490 [sisfb]
[    4.772071]  visual_init+0x182/0x240
[    4.772074]  do_bind_con_driver+0x2db/0x460
[    4.772078]  do_take_over_console+0x205/0x280
[    4.772082]  do_fbcon_takeover+0x80/0x100
[    4.772085]  register_framebuffer+0x301/0x4c0
[    4.772088]  ? do_remove_conflicting_framebuffers+0xf0/0xf0
[    4.772092]  ? fb_copy_cmap+0x10b/0x160
[    4.772096]  sisfb_probe.cold+0x2fca/0x4f7d [sisfb]
[    4.772120]  ? rpm_resume+0x1cd/0xac0
[    4.772124]  ? sisfb_check_var+0x990/0x990 [sisfb]
[    4.772146]  ? pm_runtime_get_if_active+0x190/0x190
[    4.772150]  ? _raw_spin_lock_irqsave+0x7b/0xd0
[    4.772154]  ? _raw_spin_lock_irqsave+0x7b/0xd0
[    4.772157]  ? __mutex_lock_slowpath+0x10/0x10
[    4.772161]  ? sisfb_check_var+0x990/0x990 [sisfb]
[    4.772183]  local_pci_probe+0x6f/0xb0
[    4.772349] The buggy address belongs to the variable:
[    4.772350]  ThLowA.47581+0x1f/0xffffffffffff9500 [sisfb]
[    4.772373]
[    4.772373] Memory state around the buggy address:
[    4.772375]  ffffffffc0048a00: 00 00 00 00 f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9
[    4.772377]  ffffffffc0048a80: 00 00 05 f9 f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9
[    4.772379] >ffffffffc0048b00: 00 00 00 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
[    4.772380]                             ^
[    4.772382]  ffffffffc0048b80: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 07 f9 f9
[    4.772384]  ffffffffc0048c00: f9 f9 f9 f9 00 00 00 f9 f9 f9 f9 f9 00 f9 f9 f9
[    4.772385] ==================================================================

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/video/fbdev/sis/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/video/fbdev/sis/init.c b/drivers/video/fbdev/sis/init.c
index b568c646a76c..fb9815e7af4b 100644
--- a/drivers/video/fbdev/sis/init.c
+++ b/drivers/video/fbdev/sis/init.c
@@ -2249,6 +2249,10 @@ SiS_GetFIFOThresholdA300(unsigned short idx1, unsigned short idx2)
 		34, 3,37, 5,47, 7, 67,11
    };
 
+   if (idx1>22) {
+     printk(KERN_WARNING "idx1 out of bounds: %d\n", idx1);
+     idx1 = 22;
+   }
    return (unsigned short)((ThLowA[idx1 + 1] * idx2) + ThLowA[idx1]);
 }
 
@@ -2261,6 +2265,10 @@ SiS_GetFIFOThresholdB300(unsigned short idx1, unsigned short idx2)
 		42, 4,45, 6,55, 8, 75,12
    };
 
+   if (idx1>22) {
+     printk(KERN_WARNING "idx1 out of bounds: %d\n", idx1);
+     idx1 = 22;
+   }
    return (unsigned short)((ThLowB[idx1 + 1] * idx2) + ThLowB[idx1]);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
