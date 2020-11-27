Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE42C6C3B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622906F3BE;
	Fri, 27 Nov 2020 19:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6B06F3BE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:43 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so7153686ljk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVfT86QX+ZDTrJRF8dQQHF/3gUwiFpKsxjnoB2Y1zu0=;
 b=pNd5jXk94PdmMLkBuGrzXr5VZIBW1q4/xg/xvm8uzlWcYxvNlIoog29ix8O5eeFt69
 tDiNvMPfY65I0w27OPdUQpExtBaF1oC03M6/njKb87rLyTOAqe9X3s8YvSpmrZK7GSTy
 pN4AHHdFO0/+yVCNc/xawLRkTrtjdIfnFkQKwAta5zkNKDrkhdcd4UgR+yOOKyZ5rRQA
 zNaj3P+Aa3W4vi6QSkptOCD7yJDl/nzgZnCOd3103/rTMcaYvblNF42qdxGTSZIWGwTl
 KO5iUJB3JAh/gbw1Hco1syS42CJWlYzO4rvzedDiIdjlxoHecchXXRIF+i1fVfLvQTXk
 lrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EVfT86QX+ZDTrJRF8dQQHF/3gUwiFpKsxjnoB2Y1zu0=;
 b=IzGqCH4dbE/WWp/3om2jd5NschJPtcZYitNoZWABp/ix/RWzvCHwqNz21c5DRkVSy0
 TTpJe+/OuWkzyHxy3b3QndRv/bXhjG91YYLz/wNVn3px+CXcMQKJxlovmXvxKqyHTgsw
 /Btwzeu6Aicyn254lo8sno76PtNqMvM6DpeAClSRX6wrnwaA9l5C4igyqgarWHEUAKJu
 icInGGvzxfBksDYTSe/tx3X1hnJLPwZbMlcCGwOUwHhc0Mgsah883OWElpEbzxPzRq3d
 3Y4XprwIIz4F/O/QMVxsooZMA6rCex8YfNf7AYsQy0AqbNJuaCBS5HnVErV9Sk3H3nzM
 bPSA==
X-Gm-Message-State: AOAM533+hbF2+WrNOaDsUJkZccI4qoPAfeoq4Qb8zoy1UHj2vNqw1EIw
 GPbiO4iILqfFFdLil48JVjsi94UQNEUfn8P9
X-Google-Smtp-Source: ABdhPJzXp9uTUQQnInL9K0DV22npUNTpOloTCcvJ9aj3htoMz9+JJ2m34eR+Chve2GRiCw8Q4sNScw==
X-Received: by 2002:a2e:b529:: with SMTP id z9mr4499212ljm.307.1606507121906; 
 Fri, 27 Nov 2020 11:58:41 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:41 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 03/28] video: fbdev: core: Fix W=1 warnings in fbmon +
 fb_notify
Date: Fri, 27 Nov 2020 20:58:00 +0100
Message-Id: <20201127195825.858960-4-sam@ravnborg.org>
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

Fix W=1 warnings by updating kernel-doc to follow the correct syntax.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
---
 drivers/video/fbdev/core/fb_notify.c | 3 ++-
 drivers/video/fbdev/core/fbmon.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
index 74c2da528884..d85717b6e14a 100644
--- a/drivers/video/fbdev/core/fb_notify.c
+++ b/drivers/video/fbdev/core/fb_notify.c
@@ -38,7 +38,8 @@ EXPORT_SYMBOL(fb_unregister_client);
 
 /**
  * fb_notifier_call_chain - notify clients of fb_events
- *
+ * @val: value passed to callback
+ * @v: pointer passed to callback
  */
 int fb_notifier_call_chain(unsigned long val, void *v)
 {
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 1bf82dbc9e3c..b0e690f41025 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *block,
  * fb_create_modedb - create video mode database
  * @edid: EDID data
  * @dbsize: database size
+ * @specs: monitor specifications, may be NULL
  *
  * RETURNS: struct fb_videomode, @dbsize contains length of database
  *
@@ -1100,7 +1101,6 @@ static u32 fb_get_hblank_by_hfreq(u32 hfreq, u32 xres)
  *                                    2 * M
  *        M = 300;
  *        C = 30;
-
  */
 static u32 fb_get_hblank_by_dclk(u32 dclk, u32 xres)
 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
