Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50152C7647
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AD56ED06;
	Sat, 28 Nov 2020 22:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB06ECF9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f18so10579757ljg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrtndvvG0M5u09IYAUmRgX+zXZ1Dkud8V3tonnF9qQM=;
 b=roBw2ATop181hwYHcBLwFp1eSYJ/3/IlOEUmM3XZ1UHyuImT3vGnihkTeWdY0tW/BR
 ZZLJkQCFGPYMa/9rFLwT7E9hMJB2ha1AP3M5hse1/JnNbV2HgbEJ/A2asaPZAFhoIYj+
 y/p9IFjpDDgMJy0ocfW+t9R7UN4xlxwToILq5UWaU29JuKYKgOLBBZLA+zzwfqDPSBxX
 TuaSidpPotdrN2+xi0bm6Y7APaz055RaavQDWBWtsDvi9t/4XGiWN5UfYM9alWp5N8kp
 Bx3AqdyWOfABLwLjIdxppZznIYAeDrTpoeCh4aLtegGE9We6EU9Ly/FLg2Mio1QnrhLW
 1vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mrtndvvG0M5u09IYAUmRgX+zXZ1Dkud8V3tonnF9qQM=;
 b=eEv+eoaVVU2sY/XsiEfycDZF5NpPqOXvcq62CaddKTU4U+9PVZLjRRObYHkjqtl3A+
 fOp4wqua9m1ttTGkwR4Osv9Bf63tbwRqHqi+add12jw0iJuV1CurwNiYFYcG6Alv+hE9
 4siEoNwAKRGzE/Db8glABT7k/b6xRFs/3ngPrvcxIOT9Ane2SNUz7WA5iJgfXqQEt/F/
 GHQpb7FO4pvc1Fc9B/GmKiJ3RdtJtItdFI0qAxoocLrDpKkgvMknWN0SQ12emEai/N3M
 4E2/rwq/M0mVjj2FriQXr8GbjhGFJ+FjnddBtIyFEVyiHnpwHnDzbXM+b/YSDFMBudln
 j/tQ==
X-Gm-Message-State: AOAM530SSnZj2TcTZpzdQxvlDPTEbEK0vBojrX9A1jix3Uroypcfo6/a
 z5ioqV/vWVEAx5VAws/2iJg=
X-Google-Smtp-Source: ABdhPJwNL3q+1JGxkJO+BEF4jOeWF1Djf3ezGNvxKzq2WbzTn2QNUr+I3reU8uOJYba+vVxHu5OrzA==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr6335837ljk.150.1606603320153; 
 Sat, 28 Nov 2020 14:42:00 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:59 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 20/28] video: fbdev: nvidia: Fix set but not used warnings
Date: Sat, 28 Nov 2020 23:41:06 +0100
Message-Id: <20201128224114.1033617-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix warnings by deleting unused code. The register reads are
kept as it is unknown if there are any hidden side-effects.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
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
