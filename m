Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D512C6C4B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B76F3E8;
	Fri, 27 Nov 2020 19:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623F18994A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:28 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f24so7092869ljk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kSOTWA+7s6AOb+69TSTraRrpPzvQt0NSKodoDw/MKE=;
 b=qF9fwez/8eaHyKOX5BvHZDGWBo8OtRqL2a/PzPIQyIbhyLEOO7waJR7Z0THGhHMceD
 RckmI4o1wQh67jeR6LjecdUPPo5kDcu117113Z9ni218DuH6CkR8YoQtniRJbgO7Eu5p
 BD/aCCHWbEkkxq2ZRld7/VYfPoeEA5KAieFBVOWJSyZnwDMV9Qx0kAGGXW2d6ORuxaFV
 ng7b0pFUuDPJyq0J2aGoG4aHLBIk6yh4PL8gax6RSGwlyAYQk1H3+mj3cC77H9I4TI43
 YS5lOmapuee8ceUM8hT+sW2koepygnS6aJwBOs3blDtAmFM0q/Iud2UzmOkzjbOq0TYQ
 1eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9kSOTWA+7s6AOb+69TSTraRrpPzvQt0NSKodoDw/MKE=;
 b=FoET22YJiZsRHddSKymcdLTldT+VIQuPfQWL+wtKKOeVYUhLGYqIwC0K8RvQxAwr8/
 +Ke2eVBli4k3fHDLxxx8gjhjJmdrXvePf1txEJDAAGiSot3nmsev16RMKLJCYbsbhWL7
 tdsJeEyb3qAXg5g0sSdYWKSsfqa33bg+wOHnzlugjyFZweFqztzlW2S8eQv9QwNRJtD9
 gcoS86opgkgITs0xW8DGMX5ZvQWX6MTH5RLN4fH+eaZ5gA5LgfOY7cH8295uGQlfEqkw
 sZWQkiXuSjDjBX50L+9Nf34ZlC5vT2z1nMc7zqNS+h6AcbL1GsYZgMuM+6kaIGD41Bsy
 w1Zg==
X-Gm-Message-State: AOAM5337Op2Zqn8zRUbbuwiPvesyPFnUc3F/hnEf+GebzLgLp7NkQQlJ
 A96TlAc8TRJQgFNRwFxmi6U=
X-Google-Smtp-Source: ABdhPJyiPskz8/EA3qnZwsG8Wc64GE4af1+UWpYPCXIfNajx7wDDAG0cU5XuIvRrf/LNtcypwTCcqQ==
X-Received: by 2002:a2e:7803:: with SMTP id t3mr4447881ljc.176.1606507166788; 
 Fri, 27 Nov 2020 11:59:26 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:26 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 20/28] video: fbdev: nvidia: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:17 +0100
Message-Id: <20201127195825.858960-21-sam@ravnborg.org>
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

Fix warnings by deleting unused code

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/nvidia/nv_setup.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nv_setup.c b/drivers/video/fbdev/nvidia/nv_setup.c
index 2fa68669613a..5404017e6957 100644
--- a/drivers/video/fbdev/nvidia/nv_setup.c
+++ b/drivers/video/fbdev/nvidia/nv_setup.c
@@ -89,9 +89,8 @@ u8 NVReadSeq(struct nvidia_par *par, u8 index)
 }
 void NVWriteAttr(struct nvidia_par *par, u8 index, u8 value)
 {
-	volatile u8 tmp;
 
-	tmp = VGA_RD08(par->PCIO, par->IOBase + 0x0a);
+	VGA_RD08(par->PCIO, par->IOBase + 0x0a);
 	if (par->paletteEnabled)
 		index &= ~0x20;
 	else
@@ -101,9 +100,7 @@ void NVWriteAttr(struct nvidia_par *par, u8 index, u8 value)
 }
 u8 NVReadAttr(struct nvidia_par *par, u8 index)
 {
-	volatile u8 tmp;
-
-	tmp = VGA_RD08(par->PCIO, par->IOBase + 0x0a);
+	VGA_RD08(par->PCIO, par->IOBase + 0x0a);
 	if (par->paletteEnabled)
 		index &= ~0x20;
 	else
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
