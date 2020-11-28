Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5472C7649
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A493B6ECFB;
	Sat, 28 Nov 2020 22:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EE16ECF9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s9so10558098ljo.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tdC3cUaEksOqJq+sL/p6xZwzgeMpzcgI0nIv+Qg+xyQ=;
 b=db0u5+lExLWY4Gcbn8xuBCD7WyKO6XHbkpd5i1lVs5fIGDjOE7f0rpUc+FMjmqXEvY
 oTKMaJ76x5pp5L0cRp9DinMl03rqVZzTwy/wQbxQOulOdsU/OT+hugE3Ay3GARU2/Ey7
 bpcTSl+DWpzTJsPEGmFjcNTGfmSL+C25VfjOi7TwjbUq9J/ZRdPLce5mJKrs4Br5TBjS
 Ro/DeNhpUC5x+Dne7yQG4Y2CnnEzBp0ACn3lptugY42ovFlK8e/qXx/Hcoxd+7qgOdbj
 21uQOll3f6Qwj6mOAm2uyQGZEWKBc9QGcaKz6PzMRPeBvFLaBaL4Wpnsi46LTikdD1rm
 94JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tdC3cUaEksOqJq+sL/p6xZwzgeMpzcgI0nIv+Qg+xyQ=;
 b=uXsqtGMyfE2BLp/dPdcdfVEb5/ykD2WE4xSg5o4xFOVHXW+TGEUDlCB2fIxzJHGg08
 OVWPI6bK9t/DlhvOEV5vjxAcmw12Wt6YaFM1ENWMS7hobuQX0BUEjyTH66FQw9Vu82J0
 o+4a2sp2xIClp3bObrxIqzDXuLODcIqWGDU4XvjWfOtgjQ74f0ytVSpG0IkJlQc7Igdf
 yP6RO4jkbnpZmzg17DdSorJN/stD4nlab1u/aiYezUZqPTs7LeUvPe1b+gcOP20tpFvk
 IHyHPRWbXzfoOsOHSFoeRedH1KUABwM5bOiFDlcJMpFZnNZ+sQhNpZ5FBG0cerNWCNmo
 Ukow==
X-Gm-Message-State: AOAM533DJzIbrgU4/CvCVTD2DVGhbkBTPJ3tPeYPB6ITFFn8agY4Nam4
 BXWHW3ObeT9z6CXrJCEN7Zc=
X-Google-Smtp-Source: ABdhPJx/J0hfsr/rR0D6AcWR9QDUgP6LXUVbit09Oa3JEO3/0y2BPi8pZg+WoICFuvvaeWhd3bZjMA==
X-Received: by 2002:a2e:6f04:: with SMTP id k4mr6716005ljc.220.1606603325686; 
 Sat, 28 Nov 2020 14:42:05 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:05 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 23/28] video: fbdev: omapfb: Fix set but not used warnings
 in hdmi*_core
Date: Sat, 28 Nov 2020 23:41:09 +0100
Message-Id: <20201128224114.1033617-24-sam@ravnborg.org>
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

Fix a few W=1 warnings about unused assignments.
Drop the unused error code.

v2:
  - Subject updated (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Qilong Zhang <zhangqilong3@huawei.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
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
