Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4942C6C57
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE7D6F3ED;
	Fri, 27 Nov 2020 20:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01756F3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i17so7139254ljd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVb7kx4jWo/2x//FtaTHCinUwYboF6da4/HiQYT27Ks=;
 b=DhdxkWmu2HCF3oKhPnt7WYf+9MAgkg+Km+yd6SRatM/3r3is1dT+DaXrkQ8rSgFavv
 DX0i0f31hM7FQ2N0ALQPr0hFERsaJ+qPKdtrsAi5GOfnpzfWwJ8iDj6pJDCQ/kAyP7y7
 00kUBE1g2M3nNXwSq1iIx1JI1Pd8r1NO5SVAh/w4G89+4CCAIjgo1CD22Zc0uRf4ZZEo
 ITozi7jwnM0WKuQxKdMhk1YVPMW+yDWru7kH8vDhTbLFcDGYbi4+0+oTiqj5DNjt2cVw
 IclvTUdidm7N/DOPgjPidmbwVGZtVtweZWVsgcli+KBB8il6oVWpueUCX1m8goMAocr6
 mXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jVb7kx4jWo/2x//FtaTHCinUwYboF6da4/HiQYT27Ks=;
 b=sh4q+uP2+P5cSoiDfRMkGi/Q8gtnXmWbFXkdVuKuvG8EXMsQ+NLyZdEUxchdhk3S2c
 FllCficko5kgZnGb66x7TNBlHWB85ujG0zcJMmf98y8frJgbYiRJCs8dcEvYcIxk1DAj
 8RKO4yQJJggoL+tgoLe/lrZNIdpNG2907HiFD+kvDIn/eFgau44SR7AedpxfjaUNjme9
 mc1V+7vg2/2BiRHhkltZoUo/mv333tauRQUYvgJ51EoEs2nbqu6UD5Q7HQxo/LUI03al
 hGDZRWvLSGYLpGlBgC02NV14CJgE11LE9VzRqll7MDBWvTzeS1GCYPyCF5lU1HldYLG9
 UT6Q==
X-Gm-Message-State: AOAM530+/8E8hpFPaid2E3Tt/HysmjBkCvgjabHqk0YTpysiBMlQAMWA
 JMi0n3DM8i22y5d2skOxfWQ=
X-Google-Smtp-Source: ABdhPJyvGuhMzkR8UpVgq1X9d5l4d3Sk5qK0Lj6aoZPnFFRd6TL29IQGgk3UvpTPgVbijIdATGYAmg==
X-Received: by 2002:a2e:9a95:: with SMTP id p21mr4547132lji.245.1606507169401; 
 Fri, 27 Nov 2020 11:59:29 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:28 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 21/28] video: fbdev: tmiofb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:18 +0100
Message-Id: <20201127195825.858960-22-sam@ravnborg.org>
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

Fix W=1 warnings by avoiding local variables and use direct references.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
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
