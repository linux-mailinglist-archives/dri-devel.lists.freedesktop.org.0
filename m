Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356042C6C4F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB52F6F3E7;
	Fri, 27 Nov 2020 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892816F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t22so7143948ljk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgiE3cPN0UhMAdrlJWfRmuc0aOS7JyS2T35N0ifDz8w=;
 b=R58XIdGE58Q9Aqsn5XSsimwgH605ifHUH233P5OBuNNPP/RYguS8aO5o3GlEgZt581
 spr/LRdVgVkbi1AhiYsfC98VaQ3JqvMaoBzBhZ4flEJST452YUwa9iU93QtLCCrczo3e
 5cj9BzzHIAPRW5R/tWshMPWP5b4aWah2WsZPbTharCUvcAoIo77TXv4iEblCxXgm+QNh
 m/vcUOofhBOYXTHjdheU9gMIhM37Sd67xTqxYEjjpfdxZvhz69VQQ4G9dwRMBBYSkS+g
 uIAzMJJ1kqWn6ChaKymZa7rRNHDvTBbTPWH88HuvvjZOqQku8AY2DvaN6D25/XODOKZR
 8SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dgiE3cPN0UhMAdrlJWfRmuc0aOS7JyS2T35N0ifDz8w=;
 b=WPcljMN3lSFbQjfCYjBLbZNX9FFv5/ZScdIIo2n1DOwl/KlewbK4XNqksvdXqegvRF
 NxPIJRh7NpiZOCdrfDraL2vtUxcVqjTbUnMmdIpkwyoFiHFI5OPNZYvEtmcYaZn4FKDd
 rtk6DPVsvgK1mlhqZH7wbve4MYMXgAuMTce/UiC5I+Mrz1wmm4w3CzzHYOo4etVeAzpD
 EZeqzUsCAavTg+x0DkoiBXkmmIiQK6hNDRlGClAPsnsh4e0rJqUAlNZOc+YGdGJMLomi
 lk34hidgJjHCd2tzej6mPFNzuOFr6fOH4APIvJ0u3xHCJDrmJqb+gx4XPtHbIkFfvaXE
 wNzw==
X-Gm-Message-State: AOAM530lpjFSR5DNtdajsUmCs2RYLj8DFJ5Y34TbGRXMr23OU05BQ9h8
 KCxauawPwow3ckOaED3+lW6758RNLpcrYfEG
X-Google-Smtp-Source: ABdhPJx/A+ivNr8kMaMUsxMdcnxwLhpbFPdQSjML9Bzel1DEIBHBsJjnBMP5knP9/Ca+mACkvp9t9w==
X-Received: by 2002:a2e:95c7:: with SMTP id y7mr1233763ljh.115.1606507150978; 
 Fri, 27 Nov 2020 11:59:10 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 14/28] video: fbdev: pm2fb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:11 +0100
Message-Id: <20201127195825.858960-15-sam@ravnborg.org>
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

Fixed a few kernel-doc issues to fix the warnings.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/pm2fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 27893fa139b0..c68725eebee3 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1508,8 +1508,8 @@ static const struct fb_ops pm2fb_ops = {
  *
  * Initialise and allocate resource for PCI device.
  *
- * @param	pdev	PCI device.
- * @param	id	PCI device ID.
+ * @pdev:	PCI device.
+ * @id:		PCI device ID.
  */
 static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
@@ -1715,7 +1715,7 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  *
  * Release all device resources.
  *
- * @param	pdev	PCI device to clean up.
+ * @pdev:	PCI device to clean up.
  */
 static void pm2fb_remove(struct pci_dev *pdev)
 {
@@ -1756,7 +1756,7 @@ MODULE_DEVICE_TABLE(pci, pm2fb_id_table);
 
 
 #ifndef MODULE
-/**
+/*
  * Parse user specified options.
  *
  * This is, comma-separated options following `video=pm2fb:'.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
