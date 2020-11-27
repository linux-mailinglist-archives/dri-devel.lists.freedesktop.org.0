Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AD2C6C4C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5301B6F3B5;
	Fri, 27 Nov 2020 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1C16F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d20so8516027lfe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJCCs701PuH94ttSnntK7aHGLX4n+uQaWh7rvZc4+5Q=;
 b=XL9dM0QX7eZv3hWcOJkyWShIDYFHGB5p6irIlZjigyIw419igo35AjyGfLQqAEOLxD
 Y29Vq3/y99v858NZeFa5Bf/kzx/WzccNpEAfg87SsnOxwFbV/Rl8WsDSnRBlsupsdtrT
 Rqv6Mm7W9Y+fCHyVe0jEsEng0Eqs2rjSVvcLP3XqYlgCv8MWe9pmIJAV+RkFW2Zklfxl
 qjUV3x9lu4KLkcw6yVeKhtJz0T3+DYFnUYK7do+Ral39li6kU5xeeQiVX5fGj5SpHOj9
 DwwyX3xP41+mI96xwf3oG9xNwyrFYEW1ZrpBx1rlS9Nghj4S2HUEffR6yhTwBZxewAlW
 JLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HJCCs701PuH94ttSnntK7aHGLX4n+uQaWh7rvZc4+5Q=;
 b=XoGN0SH2VTbZvctC7yC8ZN4/uu+UDfEERsdyYLUqBYZSNLP/RE18AyaurQj7UF+ieS
 R+yrm9twq1vVQFARAmDidfXb7XFW18OCM1nKQ3IpTCneQLBDhjLxm76WB1X5SeRonMC1
 CO8XlbsMeR1mrPH7GMgVzoicJGP35tOZ0tJkk5Vn9x3A4OlPz5nl1l0JMc4XcrgxN5QS
 TMikIE1qF1ErWXetFKK+4A1rqiwcVZYNBREGmMQzi2ApAoFlyzNlYGAbHVCzIdln/qbc
 YaOyhPmHLknVbKQygt+swOM3nZuXuIlz0TySSct0LVeXDvGIPTIRFTQ8uZmxsXx1MjkS
 t6mw==
X-Gm-Message-State: AOAM530oHv7kTvhxJHLQ9TMDNGmErr3HH+hqNwJtxy3lUiaJkjxL8d/J
 B/DKJhbDpR1iS0ptItpu3Hg=
X-Google-Smtp-Source: ABdhPJwcJUOl3IK06p2KacexTdtmQMu4TmgBVRIEsQFXz2LTtqcUCQU49x1lagy1jQZE0TiE5VjMuA==
X-Received: by 2002:a19:f809:: with SMTP id a9mr4026574lff.314.1606507164062; 
 Fri, 27 Nov 2020 11:59:24 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:23 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 19/28] video: fbdev: sstfb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:16 +0100
Message-Id: <20201127195825.858960-20-sam@ravnborg.org>
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

Fix W=1 warnings by introducing no_printk variants for the
internal logging system for this driver.

Fix a new warning that popped up now that logging was checked for
correct printf format strings.

A more invasive fix had been to replace all the internal logging with
standard logging primitives - thats for another day.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Alex Dewar <alex.dewar90@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/sstfb.c | 2 +-
 include/video/sstfb.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index c05cdabeb11c..27d4b0ace2d6 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1390,7 +1390,7 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	        fix->smem_start, info->screen_base,
 	        fix->smem_len >> 20);
 
-	f_ddprintk("regbase_virt: %#lx\n", par->mmio_vbase);
+	f_ddprintk("regbase_virt: %p\n", par->mmio_vbase);
 	f_ddprintk("membase_phys: %#lx\n", fix->smem_start);
 	f_ddprintk("fbbase_virt: %p\n", info->screen_base);
 
diff --git a/include/video/sstfb.h b/include/video/sstfb.h
index 28384f354773..d4a5e41d1173 100644
--- a/include/video/sstfb.h
+++ b/include/video/sstfb.h
@@ -23,7 +23,7 @@
 #  define SST_DEBUG_FUNC 1
 #  define SST_DEBUG_VAR  1
 #else
-#  define dprintk(X...)
+#  define dprintk(X...)		no_printk(X)
 #  define SST_DEBUG_REG  0
 #  define SST_DEBUG_FUNC 0
 #  define SST_DEBUG_VAR  0
@@ -48,7 +48,7 @@
 #if (SST_DEBUG_FUNC > 1)
 #  define f_ddprintk(X...)	dprintk(" " X)
 #else
-#  define f_ddprintk(X...)
+#  define f_ddprintk(X...)	no_printk(X)
 #endif
 #if (SST_DEBUG_FUNC > 2)
 #  define f_dddprintk(X...)	dprintk(" " X)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
