Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B0D2C6C55
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409C6F3E4;
	Fri, 27 Nov 2020 20:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC516F3EA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o24so7124390ljj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hn1HA37yirdAV/UjfmF48pGZwDbporw/jjkHdVOHiV8=;
 b=Kc+1a4MS9x48X+CFz9W2lhSniC6B+kSQ7Y2VOn2DxjY9IskQPu0QtRF7074l+zzQ0o
 FC6vBfaX/wqSVzFgf0m9/2XUepVxAUvFjD0zVIQuEDxi41hoqGTYDvMy7P3LNpY1GTwu
 CW+zKFMNLRM4b1ebwIqOWq2jmpIJCJATB+kidIJ8ahXHatH3z/isgMdvMK7c7cAngZpe
 b70bVLyrD0tt7U1tn5CmZH1qM7pVe+YmCpbZCJmwZl2QJCsqLUtrgCV3wSjTiB3g/jCe
 kt4Lk5IoxUtOHxdVWc0fI6S507woMnhnVElZmBvTcZKJiyE0zyca9xXxU/UHNh2/UP8S
 KXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hn1HA37yirdAV/UjfmF48pGZwDbporw/jjkHdVOHiV8=;
 b=YU+ungFWVQX9cXXNgPRQq/uK7S8kjPj2QW3C6HKm7nCPA6DahKn+YbMQxDNMU4mfOd
 CicQXQ+bpu6UODwRbY2ba/8srSfDV2VCjHEk+DlRytYXJP4/6VF9lc63mlqXloEAAEKc
 tpMipOdPCEJXK8r5guAJ/EaIuMpub+oFm83/OnpXhD7EpxYm9YsnRiwraAVFWYz70vBl
 3bjx7sp193+3MBY226wVO88FwjRmFYOL7YGDI2dH3z46IKC1s5fW+T1TwZDR2CN6fpjc
 jr7TZgbZFGj9ma/UgmadB5EefOf/+Q56QL8A0Ow1xDkWD4O0RTOJVkwtWqeK8S1nCuhE
 Kkiw==
X-Gm-Message-State: AOAM5324XjvgLFO6lpZwyEEgSSIm7d3b9H+IOdr1Kh5k3ehqze2bvRBN
 413Ak0WqLl7Wo48m2+Jxqmo=
X-Google-Smtp-Source: ABdhPJyzKPfjBJ5WwV+z5m3Tu11O89a2OWEhNjm0qFsqqtcN5Z3T2NeQjCb+HQfsRR8Vvz2tIYOo+Q==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr4294964ljl.63.1606507187607;
 Fri, 27 Nov 2020 11:59:47 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:47 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 28/28] video: fbdev: s1d13xxxfb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:25 +0100
Message-Id: <20201127195825.858960-29-sam@ravnborg.org>
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

Fix following W=1 warnings:
- Fix unused variables for variables used only for logging.
  Fixed by introducing no_printk() to trick compiler to think variables
  are used
- Fix kernel-doc warning by deleting an empty comment line

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 drivers/video/fbdev/s1d13xxxfb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 4541afcf9386..d1b5f965bc96 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -45,7 +45,7 @@
 #if 0
 #define dbg(fmt, args...) do { printk(KERN_INFO fmt, ## args); } while(0)
 #else
-#define dbg(fmt, args...) do { } while (0)
+#define dbg(fmt, args...) do { no_printk(KERN_INFO fmt, ## args); } while (0)
 #endif
 
 /*
@@ -512,7 +512,6 @@ s1d13xxxfb_bitblt_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 }
 
 /**
- *
  *	s1d13xxxfb_bitblt_solidfill - accelerated solidfill function
  *	@info : framebuffer structure
  *	@rect : fb_fillrect structure
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
