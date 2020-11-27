Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DED2C6C44
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686136F3DA;
	Fri, 27 Nov 2020 19:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1823A6F3CB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:07 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s9so7093177ljo.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXPr2PFUFWtOrSiCc92D4zReH+aBrw7KABxE1MmXvi0=;
 b=MPkJdyjnuRSSFVuV23mC35hdVygag39YRqbpZT90vWELA3QzBsTFq5Yj9kSg+3cQNc
 ehjZjlOlpghvpSYf8mUACbykYk+t4mdLMypoZ3CkNsjJV5/cjbDoKpa/zgbdOZqcICmI
 WeobA167yuRyuQvK0HL0M5KbICRjhmxNrEAj+IDE+gAs8fkt16WXbP8/cB3y6BsxWn2a
 epRXQAtIusQjKM//TwjYCGvNTt1cW/Ar46c8TsUJrGKIRs0W9kLClsN2mpRr8GpoDOvU
 LHeTKRTPtcLetlVpF6WgFtVfLZX4kUksh0X7OdA83X1QAzzuq5DDKqBKdnLKhj/aCyrA
 +FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UXPr2PFUFWtOrSiCc92D4zReH+aBrw7KABxE1MmXvi0=;
 b=SKWxqyScOrFKQmip5y9emYRfTrzXnCSMYDOu0snQndWBoIGFRvbh6bOXGPGwlhJPDG
 2C0NHjw+WE6m6M2et5OBozUFjn9Xdx51j+qFeUuofoOyxB987NWZzLjmvdiiVtB+q+YF
 nWOhnmJd16NwkcaSBiXWO7K5Hrt4iIwf9tI2f1SL5J3dEoQXBNPjyCERWu7o4+kAizHG
 VmAQsEtGA4ojEM89j13uB/j/1kd1fZIugG0R2t5E3PCztGYQZ5+Bvjg/cIM3vmab5Ner
 f+a377rQ73oLoKynU63fkaMIQZ5TUPYPyx0OxxJzfz19DP88BLHTKqFeGGSGSkp5O8E2
 i9jQ==
X-Gm-Message-State: AOAM532zSonzM8efhhiP2NKGk84yGWJmPsBDsrXvmu7Su484Nm7xjCtQ
 bo86LFJVus7Q0CHe5ieXHVc=
X-Google-Smtp-Source: ABdhPJzRp6Ac5f6uTM6zm36JYhmvj2mN3ZcYz0U/kr++s/q2VudV3yV5yPzJI8O3dXqZ1ktxoeYNYg==
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr4537919ljj.32.1606507145500; 
 Fri, 27 Nov 2020 11:59:05 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:05 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 12/28] video: fbdev: tdfx: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:09 +0100
Message-Id: <20201127195825.858960-13-sam@ravnborg.org>
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

Fix W=1 warning about unused assignment.
Fix by dropping the local variable.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/tdfxfb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index f056d80f6359..67e37a62b07c 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -206,9 +206,7 @@ static inline u8 crt_inb(struct tdfx_par *par, u32 idx)
 
 static inline void att_outb(struct tdfx_par *par, u32 idx, u8 val)
 {
-	unsigned char tmp;
-
-	tmp = vga_inb(par, IS1_R);
+	vga_inb(par, IS1_R);
 	vga_outb(par, ATT_IW, idx);
 	vga_outb(par, ATT_IW, val);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
