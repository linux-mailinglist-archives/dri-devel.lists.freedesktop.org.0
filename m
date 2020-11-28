Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418042C764D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E35C6ECEA;
	Sat, 28 Nov 2020 22:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDF6ECF9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u19so12752449lfr.7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5MJlaKcTS845wbNZGaIoS2kPxxU74n2R9tKR7IOQIuA=;
 b=tvzCFnaKarri4MrMt/OOBX4UYabnmocLUjuejQpGNQHUbU1DV6B8ZgY3G77V3kezjS
 TjZKXyvlQ9iCHDG6ntv/X/orBmg0DjjdkGE6hTXPdAuSBP2EYE1V8VsonslrBQw9+mGb
 FD854fbfMhhp0lNLk880C3CTN4ruQLvxeqY3O4+fCM8IRdEhz5qLr15AO69rFVOYqyzZ
 svz4z+Qz8nd4wmxP3lb28IIk1+Bl24bS8CGDh5JSpkdhBS0ouH65+e0hekQ5q/QfxGFC
 DNnmoyu4ginXvCr6uQdvL6yx9/fXSAVcuv+WiZz0VrA8PRDNzTrGcFt5rkgJYY29QCr7
 8upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5MJlaKcTS845wbNZGaIoS2kPxxU74n2R9tKR7IOQIuA=;
 b=BvwfPmm6xiR9k8jbJsxiim0UabLxKwMcNBImw0x7PaO4vBJ6VHlTxQPqrLSoPbO3Cg
 02y2Pp8IV7Ou2u1jCnf58tjD/vkQlWSMpj4F7aZslvLVWloeBZ5qN4Yn3Rt75ujNQeHi
 WHHHf8LXNMq2J3Q+4+VLgm2OQzg/ekmJiuhnXsmE1pL2jJ5q37L3rQi98fWx+1OuYMWU
 DO902k1ZcbFOQBCy8kWXk/yxFh6hJJL4FrYvZOXhZJ6yLh71hkWJxZN0uplsgfDEBZf3
 BKtfV+PfMzL3qXfGZQSVKMXU9wbUsyQZmpyEN/oLCs62y0ZvYPyh5dzHOqp5opEVCECO
 KqEA==
X-Gm-Message-State: AOAM530QKP8iCCiIFaKwoUYY9Uv6pg5u30blrnDIL4bzNwphQlRSLEfn
 xQEGRirV1EXM5QWbnQU6gKU=
X-Google-Smtp-Source: ABdhPJxedjLhnAr5B6nJvt/A/46S2ueviNNylSrgyAirvdAVc5ST23a882taVbnarg8qv8rIuZvs4g==
X-Received: by 2002:ac2:446f:: with SMTP id y15mr6344891lfl.415.1606603321907; 
 Sat, 28 Nov 2020 14:42:01 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:01 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 21/28] video: fbdev: tmiofb: Fix set but not used warnings
Date: Sat, 28 Nov 2020 23:41:07 +0100
Message-Id: <20201128224114.1033617-22-sam@ravnborg.org>
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

Fix W=1 warnings by avoiding local variables and use direct references.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/tmiofb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/tmiofb.c b/drivers/video/fbdev/tmiofb.c
index 50111966c981..b70faa3850f2 100644
--- a/drivers/video/fbdev/tmiofb.c
+++ b/drivers/video/fbdev/tmiofb.c
@@ -802,10 +802,8 @@ static int tmiofb_remove(struct platform_device *dev)
 	const struct mfd_cell *cell = mfd_get_cell(dev);
 	struct fb_info *info = platform_get_drvdata(dev);
 	int irq = platform_get_irq(dev, 0);
-	struct tmiofb_par *par;
 
 	if (info) {
-		par = info->par;
 		unregister_framebuffer(info);
 
 		tmiofb_hw_stop(dev);
@@ -816,8 +814,8 @@ static int tmiofb_remove(struct platform_device *dev)
 		free_irq(irq, info);
 
 		iounmap(info->screen_base);
-		iounmap(par->lcr);
-		iounmap(par->ccr);
+		iounmap(((struct tmiofb_par *)info->par)->lcr);
+		iounmap(((struct tmiofb_par *)info->par)->ccr);
 
 		framebuffer_release(info);
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
