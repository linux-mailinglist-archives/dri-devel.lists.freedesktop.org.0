Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1372C6C50
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE806F3E9;
	Fri, 27 Nov 2020 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9726F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j205so8559291lfj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQ7x12uggS1hOxK6f7aoLRuOChXNZlZXJg/tbIyd2NE=;
 b=ctjpvSvXytDB/DKOBAaGeJq6N+6ajZhDwwURDOm1a77ewn2epdHf91lKJmKsmV9Ntc
 Wk7XOINOThuZoiwWZIwCNjvbaF28djxwFm9wYet8glHpvm53BKYrCKMwJYauCUMjmOmq
 NxdjwfIK2Jnz4h/ah7pTKLyOLkSBMEdvoU3ifR3hRUcWGd/975WKCDBtdInczsSnIEg+
 JeWR62v/ubFBf3s/ap4vXK2Ta0ZR6TBHKp7ez3oY7QFQLKm5WH6wK479iEQq3KwVKZU2
 uw7IyT5qTtjFrWVxADiTkvkAYzbAuJ4tla5i6bd5kK5ffGxj2H1VYYZQbAFYeabjtXdB
 jSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MQ7x12uggS1hOxK6f7aoLRuOChXNZlZXJg/tbIyd2NE=;
 b=AtEgQw9SoUmZM5UVvysZ0e17++inCJFrjJXOR6T97gjWTCMsT3ghjz/I/p82xZ4u7k
 pL6Uh9+Tl8Te+whdVouZVqFkoD9/T4G9jIS8P62+nPzXWCTm+M3NqTjT/smebWbuxIAg
 f1y+ISNiyjezhsMc0nPMliVZOXUBuI29CEgmOFupQJit+LM2xv1b4bZNY6wdvjoxXQC7
 WlpcnXe8qBzesh3+bXkxR9Rhc9n+a8mOfwX5aktXd0BPtqntyDM4tH1N1i4odWpjbt0L
 an11CK3moOKSUQY1+S34YH5NaBN34dx6onBl1Q97IpdTxj9ZkQvj5Nn7xYqrEiEdqaSr
 EeFw==
X-Gm-Message-State: AOAM532LhOKDI8rWtm9/MIhaiNlV/SpsZrjVQXVSmcugItlv+egtS8Qu
 JBgR8x/wiTcMMBn0nalYW0Y=
X-Google-Smtp-Source: ABdhPJwsswLBNRVwQvuTIB+FN9iriKOhhkmrAHLnDO+ZnWN0hmlyW5YbmkqfB7BJvDh/ZXx/oMQYeg==
X-Received: by 2002:a05:6512:481:: with SMTP id
 v1mr4168850lfq.132.1606507174690; 
 Fri, 27 Nov 2020 11:59:34 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:34 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 23/28] video: fbdev: omapfb: Fix W=1 warnings in hdmi*_core
Date: Fri, 27 Nov 2020 20:58:20 +0100
Message-Id: <20201127195825.858960-24-sam@ravnborg.org>
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

Fix a few W=1 warnings about unused assignments.
Drop the unused error code.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Qilong Zhang <zhangqilong3@huawei.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c | 4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
index 726c190862d4..e6363a420933 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
@@ -679,7 +679,7 @@ int hdmi4_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 	struct hdmi_audio_format audio_format;
 	struct hdmi_audio_dma audio_dma;
 	struct hdmi_core_audio_config acore;
-	int err, n, cts, channel_count;
+	int n, cts, channel_count;
 	unsigned int fs_nr;
 	bool word_length_16b = false;
 
@@ -741,7 +741,7 @@ int hdmi4_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 		return -EINVAL;
 	}
 
-	err = hdmi_compute_acr(pclk, fs_nr, &n, &cts);
+	hdmi_compute_acr(pclk, fs_nr, &n, &cts);
 
 	/* Audio clock regeneration settings */
 	acore.n = n;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
index eda29d3032e1..cb63bc0e92ca 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
@@ -790,7 +790,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 	struct hdmi_audio_format audio_format;
 	struct hdmi_audio_dma audio_dma;
 	struct hdmi_core_audio_config core_cfg;
-	int err, n, cts, channel_count;
+	int n, cts, channel_count;
 	unsigned int fs_nr;
 	bool word_length_16b = false;
 
@@ -833,7 +833,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 		return -EINVAL;
 	}
 
-	err = hdmi_compute_acr(pclk, fs_nr, &n, &cts);
+	hdmi_compute_acr(pclk, fs_nr, &n, &cts);
 	core_cfg.n = n;
 	core_cfg.cts = cts;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
