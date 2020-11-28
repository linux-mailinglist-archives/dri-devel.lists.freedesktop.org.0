Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6182C7640
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E90B6ECF9;
	Sat, 28 Nov 2020 22:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6176ECEB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:46 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z1so10597935ljn.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=if4pzrzCg3q6ofCtFvf6yx5yT56Fowc0s0Pn6h0Zotc=;
 b=n+8fbCu6wuPRFXEnwNsFn69z5xcEOmjQjYUGqkvFjrF9Oz2C7XLsj5B831CoAIPv7Y
 a40kM24PL2nZRS0LvIpGjGHGBeIh8iv2Mv2+Gqxa14fcXzINfbbCuECej+XJPknAZZQs
 /8Z8ZT6RbCfihIhMpVsrjqAoKDaDfVDuNfTDB+CrIHaReoZMc3aoZdpmWWkH/KqGuUD1
 L/x3DSWTEwgGLKR/oPR4rafJLUtHa/s6n5JDX3eN6Sy92VZtGrwt56i4LuJPklmR21RB
 JZmbXKkYy90cUr9l/P5trM9dzq6I559NeXapOEPQs6RL/SSqRIDLq34Cl5QCvYaI6CM7
 mZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=if4pzrzCg3q6ofCtFvf6yx5yT56Fowc0s0Pn6h0Zotc=;
 b=WPXBpWG45ExGDjnLJqg8QnqvP+CZOl94TNrlXlzpaCZMcnU2Z5DsiNicgMt26iC/Az
 pQW9pBPMzJ9wOw+40O5jy9AGnaAdMe2TIP7J6tgh0JiI4qtQ1lrn7JyccaUka8AXWhcp
 O2WiUaJ624Um0wJ2fMU2DLKfhREjM0geC2324iBF4Z5J6XgIO9SA+gBPNgwHTXJQ2mZN
 6hzTY5EW0a08KFcBagBkEVidjvAxVslV2X3fnlBOkiPPCbbFFq4qswMut+kPpMuIsyoz
 dlJUepeCTVyWT3dcmFlAjm+2iM1tlBGJHoWiAI35ypQ2/43Pq1DeT+xSvsg6UQpqiP+k
 NEhQ==
X-Gm-Message-State: AOAM533LA/pxlnPwAn+4rTgOfA+MOlfaUSE7+V/HoPYoGLYhDS6lgVu8
 Zo7BzAMHMg5AcgSxrCIOouuQdMA/njMuOQ==
X-Google-Smtp-Source: ABdhPJxjEjieR1eWGnWmOrKK7EqGckvOLz6a81CIg52CDCjBQ0NqMQcG6SpsgadZ2EWXdh3aRqGGYQ==
X-Received: by 2002:a2e:9694:: with SMTP id q20mr6409864lji.279.1606603305138; 
 Sat, 28 Nov 2020 14:41:45 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:44 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 12/28] video: fbdev: tdfx: Fix set but not used warning in
 att_outb()
Date: Sat, 28 Nov 2020 23:40:58 +0100
Message-Id: <20201128224114.1033617-13-sam@ravnborg.org>
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

The tmp variable were assigned but the result was never used,
so delete the tmp variable.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>
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
