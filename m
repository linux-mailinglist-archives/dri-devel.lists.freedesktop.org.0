Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FC2C764E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD6E6ED0B;
	Sat, 28 Nov 2020 22:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AF86ED00
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f24so10554522ljk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ly/Z1yYuSnGcVTY2GvWV0FTJyRU84GpNxZ//3QWCM8=;
 b=XdE+tpdRtCE6buzA19hei71zINn4l4fFqUFVe6IoD1/xcVmv3ktBz40TsQO/8S+Y5M
 KloOnjhUZh9VgpR+4eQIYrWDVFO8UbYu+nhrLggsPyJjRJXkiGlqREHjn4Xr/My8Gzj3
 yXsc07B+W64ChsaDNIxi0waUEMK9W3NJMvPP8XLizVCXXGYr2wFU5XiKXgKgmn6cJ+yc
 gaeT2zwHv/QLpbRyyUvcOVyeVIQu7fK3B7QU8ZUy8Jxb2l2dhdnCXo5t/wBry3pNXSPO
 YuN7G8+aKJj+KHnzSlscrc1hclR9raQgczphM2tw2h6Xx7tyTgQZajeYvbQ3R6Sf2O0o
 6ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6ly/Z1yYuSnGcVTY2GvWV0FTJyRU84GpNxZ//3QWCM8=;
 b=dJk83bJ2gWWgOGiGbbZusl00e6PIxjSFi2r7j8KHC4EdomIof0isSqmqnD26vPns4C
 hWw5Hy6POdGZuXPmxtviRMc636Y4IW601/jd95TNG9E2SPhljsA3n7Orv180iIpsCrBT
 hbRrBU/ExvJy1e9z6RI6C/JOUG91kshHi2QaCzG4M8TcLFM7Oec1WWTDpmJS+qoP6z0v
 tcppOQkXYW6mx1jEH3PJ8DYOgcObQeUCeo/axWEhVhMCOryGZLPy5q5crU4sfQc18YDB
 pzBdA9BxDpQnIZoJh3gzKLhHTEPny0Qd3kEyV1K6UtHsSV7vjCGIZRMXWtaTn+lYSCIk
 jfEQ==
X-Gm-Message-State: AOAM532OlBqcEpGOGbJc1UW0/6MDPCaiDRgmOZJCAO6VkIZTwUXiFE8w
 6Xq2acEQtLEVfxkWvWS+r9M=
X-Google-Smtp-Source: ABdhPJzxpWU9gC8X+uyFS5KiJHbVQ53c0gnB+Hw2Pp+j5BbMcnz5pe+A0pF19jy6LZS7IWaJHxicpw==
X-Received: by 2002:a2e:9652:: with SMTP id z18mr6752831ljh.106.1606603318096; 
 Sat, 28 Nov 2020 14:41:58 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:57 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 19/28] video: fbdev: sstfb: Updated logging to fix set but
 not used warnings
Date: Sat, 28 Nov 2020 23:41:05 +0100
Message-Id: <20201128224114.1033617-20-sam@ravnborg.org>
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

Fix set but not used warnings by introducing no_printk variants
for the internal logging system for this driver.

Fix a new warning that popped up now that logging was checked for
correct printf format strings.

A more invasive fix had been to replace all the internal logging with
standard logging primitives - thats for another day.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Alex Dewar <alex.dewar90@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: linux-fbdev@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
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
