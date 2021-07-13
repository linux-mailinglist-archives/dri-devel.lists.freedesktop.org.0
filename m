Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082B03C750D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE99D6E0FB;
	Tue, 13 Jul 2021 16:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBEF89F2D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 12:51:25 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id y17so21497521pgf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=L6Z19cM06hJr3254lNoc8rFS2DcnQVnOHZzVU5oJkdY=;
 b=RycI6eIu6txifUyYNMh21Z91nG+cHEG9+nXcu0OFLcnfvuHYaTD4zWzprYyZhxfLIR
 +pPn37tSl1Wh1qxt0RlAIJW8O3XbkUw6PvWe6s8yaClJ3wj3Ru+5cPiW/pB7oXDLkVe1
 JKg+YvTq9xkOjA3p+6zeapn+LsiAvX3AvKrlTNUWE+xlKntq44HkLyoDkj8+o3RtIAzK
 t0SKHaWLfohe1KlHJYlnVfolun8NDY2Ww5vLZdQHaesIiUUHRm0/6JWeklCnSoqXHyls
 Y0DO52xuEFBmYZ8y7etd3TPL+yf/IcJN8YG690uzO7hO6clDVcNk1zROkgIuQ3/OR1VH
 6lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L6Z19cM06hJr3254lNoc8rFS2DcnQVnOHZzVU5oJkdY=;
 b=bWBCFomiHFQdLBjEHAU3NFD7s/kobjGj8O7jV0R5ztJ9BzGFL+yPGNu0AtlLPKpqJM
 TujBokXrg5im3nXpAqbIob4kiOGsyfoTqKO6VAR2ZQt3GpxdSXPChNbD7sJzp9giaDQF
 Oq0Rw+bED8bGOK+m55qHOHF2n2uPoRUdD0WxHK7EKZVaqsvnhFPzvN4DJ5IhKNDK8MSu
 Gc8ajBL852THcxvqPide9WL0RmIhsmeRKGky3ptU6mnem//0lo+Fqq9kaaUVoDBkPGs4
 GstOr9XevmRkzjnY80WS5CnADchdcnAv+5sNGDY9R9bzHDwJalJPO8EZNW4Dt3i3P15b
 1mpw==
X-Gm-Message-State: AOAM532SF37geMmLZ2KVolK+DUU37QpYW4WjFGhod8PANO2QSMmtivO2
 5Hf23vonr231fJLvoPkZJCZmpMXbpvWz+nc=
X-Google-Smtp-Source: ABdhPJw0Xj+6mEG6jN2omlWduAbKJ0fPWcMbtZ3P8d9+01QQakRw+AxE4WM7ZSN6duYbgegeVJnT1Q==
X-Received: by 2002:a05:6a00:2:b029:32e:3ef0:770a with SMTP id
 h2-20020a056a000002b029032e3ef0770amr1783208pfk.8.1626180684635; 
 Tue, 13 Jul 2021 05:51:24 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id q12sm19617515pfj.220.2021.07.13.05.51.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 05:51:24 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: kyrofb: fix a DoS bug by restricting user input
Date: Tue, 13 Jul 2021 12:51:14 +0000
Message-Id: <1626180674-25195-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 13 Jul 2021 16:39:59 +0000
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
Cc: security@kernel.org, linux-fbdev@vger.kernel.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The user can pass in any value to the driver through the 'ioctl'
interface. The driver dost not check, which may cause DoS bugs.

Fix this by checking if the divisor is 0

The following log reveals it:

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
RIP: 0010:SetOverlayViewPort+0x133/0x5f0 drivers/video/fbdev/kyro/STG4000OverlayDevice.c:476
Call Trace:
 kyro_dev_overlay_viewport_set drivers/video/fbdev/kyro/fbdev.c:378 [inline]
 kyrofb_ioctl+0x2eb/0x330 drivers/video/fbdev/kyro/fbdev.c:603
 do_fb_ioctl+0x1f3/0x700 drivers/video/fbdev/core/fbmem.c:1171
 fb_ioctl+0xeb/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x19b/0x220 fs/ioctl.c:739
 do_syscall_64+0x32/0x80 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/kyro/STG4000OverlayDevice.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
index 9fde0e3b69ec..29d692fe5e75 100644
--- a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
@@ -407,6 +407,9 @@ int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
 		ulVertDecFactor = 1;
 	}
 
+	if ((ulDest + 1) == 0)
+		return -EINVAL;
+
 	ulDacYScale = ((ulSrc - 1) * 2048) / (ulDest + 1);
 
 	tmp = STG_READ_REG(DACOverlayVtDec);	/* Decimation */
@@ -471,6 +474,9 @@ int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
 		 */
 		ulScaleLeft = ulSrcLeft;
 
+		if ((ulRight - ulLeft + 2) == 0)
+			return -EINVAL;
+
 		/* shift fxscale until it is in the range of the scaler */
 		ulhDecim = 0;
 		ulScale = (((ulSrcRight - ulSrcLeft) - 1) << (11 - ulhDecim)) / (ulRight - ulLeft + 2);
-- 
2.17.6

