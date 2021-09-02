Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235293FE91E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 08:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0256E442;
	Thu,  2 Sep 2021 06:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B016E436
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 06:02:59 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id m17so507661plc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 23:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Re97f8GY8el/iMPEVsgvs7BOVwiJIsCI6/eriuguFs=;
 b=qYM0fQHbJkFQBDJkvzUuDFiPIL9wUxxedWDBsnxtjqQ1jsEMrFcnKPeCW00LVfmuDv
 lpej30BlLxCHsbjmobKInFNUsVZ5oBG7ihweYbzozYQhwdkcYaqSq+05fCQp22eP61hN
 +YhPn6xJ+lzUN/5dHRS9CN7zauoJMAJGZ3PTANaRxmClQgMzc3YgKRzxHA7x27IMzbBP
 AsD3gWqNBPXRixc4QuEXQDomuj1tk4txgCRK7SSKnmEw1/O0EN/+Asx9nzBFcVrJZgNq
 88mP5GH2RWnHm7bxs3H5s12BKPyf+a+XDM6b4730vlA+uo3BWc+agCQxHEejXtGyA+v8
 bzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Re97f8GY8el/iMPEVsgvs7BOVwiJIsCI6/eriuguFs=;
 b=dZufoK6B8mQThAEZaIL90VLqGCTTr8K56Cvo0FTFo52yqB5higBW/rBSwDXu+Wxhha
 5VIA2Qh4/Fn7Fk0RKbRlNknib1BzRGtsRIp6mTmZuA+glO4b+3jHD9uETa5gDwXn+zRc
 hz/7IX9+A2ccHpLh6aVQWfTGvMAFsAj6xjWmifKtxhNoOKBz6XrhhK7l2aIsxEDSMvf4
 KnZoUHHKc+uTsEG752NLIMR4o2U4QKsAIXfsaxL4cyPHt0Vls4JPcqWDpEk48vyS4I5k
 2dT8UH+yfRPt5/SkdyK1zO15/fc+g0RkDUu+QRqSyNpGDmCyhFFReR9oAobyyv/TFJE/
 V4Kg==
X-Gm-Message-State: AOAM533iwbWSFLDhUmXYsI5a8PTQtTvoMNGQyNh9WcPrBWPNsC7885GW
 V+rU8WQWptRTZLVTtzyxu+o=
X-Google-Smtp-Source: ABdhPJwWPxm9CgEPO6s+JVRKWITau8HOy+nSIb3lsNVCGvxW2B4ol2HQM+TcVuR4Z2k+TCFscKBoLw==
X-Received: by 2002:a17:902:e291:b0:138:de28:bee5 with SMTP id
 o17-20020a170902e29100b00138de28bee5mr1522293plc.40.1630562578473; 
 Wed, 01 Sep 2021 23:02:58 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.48])
 by smtp.gmail.com with ESMTPSA id g17sm844047pfi.168.2021.09.01.23.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 23:02:57 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dhaval Giani <dhaval.giani@oracle.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4.19] fbmem: add margin check to fb_check_caps()
Date: Thu,  2 Sep 2021 14:02:08 +0800
Message-Id: <20210902060213.1702544-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Sep 2021 06:08:04 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Upstream commit a49145acfb975d921464b84fe00279f99827d816 ]

A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
or yres setting in struct fb_var_screeninfo will result in a
KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
the margins are being cleared. The margins are cleared in
chunks and if the xres setting or yres setting is a value of
zero upto the chunk size, the failure will occur.

Add a margin check to validate xres and yres settings.

Note that, this patch needs special handling to backport it to linux
kernel 4.19, 4.14, 4.9, 4.4.

Signed-off-by: George Kennedy <george.kennedy@oracle.com>
Reported-by: syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dhaval Giani <dhaval.giani@oracle.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1594149963-13801-1-git-send-email-george.kennedy@oracle.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbmem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 84845275dbef..de04c097d67c 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -991,6 +991,10 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 			goto done;
 		}
 
+		/* bitfill_aligned() assumes that it's at least 8x8 */
+		if (var->xres < 8 || var->yres < 8)
+			return -EINVAL;
+
 		ret = info->fbops->fb_check_var(var, info);
 
 		if (ret)
-- 
2.25.1

