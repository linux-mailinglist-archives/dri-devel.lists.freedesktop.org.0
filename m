Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E52C6C52
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5D96F3DC;
	Fri, 27 Nov 2020 20:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767CC6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:41 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s27so8562144lfp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dUZy5AyOXYDj2k6s63lZ9ADEngOOXb1VvoVlRiIbSA=;
 b=MjuKWshbXzpQxhEMy1+a7PgY3BUmh4NKhTLvba9JMkrPSZAUulqFr2FQHBqGVk9Cgc
 Jsue6qrqGil2Huy/DKFQ8LjxZ/TGXPJUG/4d172uj1o/ffbZjypW7fMNlskOPL8R82Qb
 4jSwKbPC+Ec+57sXNmOzpM1PUlydBVZuRD2+aeSJT8yGM1xbZQ/PZwva2SUtdLdjdhqq
 stBM+vQgRx44O7SxwewScrN8T4iqOymIm8aKr+9g8wAI9X93wrxdlNkK5QN/VMok5pB6
 kUOcpS5nDqX8JlWdiAQ+VTORorBfMhjM91S/c2qf2uIrjnfgrJogZfUWj6mtVz6X12Vb
 2DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0dUZy5AyOXYDj2k6s63lZ9ADEngOOXb1VvoVlRiIbSA=;
 b=mogyLoafJSR9zZGFQymIAUu2RWmzwEDb2KxcK1dXvwxNdahKmitZi99mDykIhYl0Mn
 BOh5CHR5LSP0AvZU4BYuV1wEuGlUWVqtnhg1GTZUA50LSNHosz0ryT1kh5RDIzV7I14K
 JZRCsf3TnQzAmwZ7coMsLPNNM+Po8utTLTCABwFwZyp3KSpHfFH14t/UDUZptMZV8Cc4
 Kfj98hOXlWwopC2GhKOsY4VtpWcMmd2Uq1l1wDIPg468I+uR0+W3LlnTSgJ8FlKviHQH
 qbZ3zyeHhBKQBHNLWfy+JSxXxaeYbBMSiCvkY0e7g5q7PVjq3WuTgTUyXdXlvzv7HJzH
 sWVw==
X-Gm-Message-State: AOAM531oWDjfdu537nmyHD8Mkr8ah7Kspa99Cq7W00bbmfFzaUYW/k7V
 sHmZ9NcRvOLQQMGTODRP7Sk=
X-Google-Smtp-Source: ABdhPJy2ZKM89RK3vlOw0vIIpP/pIYwaQgPn9/q3zJF7dVDoEGUxmqssdj4WEHCuxoR1HWo+YV/lHQ==
X-Received: by 2002:ac2:550d:: with SMTP id j13mr4446626lfk.301.1606507179931; 
 Fri, 27 Nov 2020 11:59:39 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:39 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 25/28] video: fbdev: uvesafb: Fix W=1 warning
Date: Fri, 27 Nov 2020 20:58:22 +0100
Message-Id: <20201127195825.858960-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 warning by deleting unused local variable.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Januszewski <spock@gentoo.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/uvesafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index def14ac0ebe1..8ee0fc9c63cf 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -554,12 +554,12 @@ static int uvesafb_vbe_getmodes(struct uvesafb_ktask *task,
 static int uvesafb_vbe_getpmi(struct uvesafb_ktask *task,
 			      struct uvesafb_par *par)
 {
-	int i, err;
+	int i;
 
 	uvesafb_reset(task);
 	task->t.regs.eax = 0x4f0a;
 	task->t.regs.ebx = 0x0;
-	err = uvesafb_exec(task);
+	uvesafb_exec(task);
 
 	if ((task->t.regs.eax & 0xffff) != 0x4f || task->t.regs.es < 0xc000) {
 		par->pmi_setpal = par->ypan = 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
