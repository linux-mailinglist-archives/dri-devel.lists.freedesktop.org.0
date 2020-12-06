Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FB2D06BA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9331C6E4D7;
	Sun,  6 Dec 2020 19:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B976E4D4
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:05 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d20so14848775lfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tdC3cUaEksOqJq+sL/p6xZwzgeMpzcgI0nIv+Qg+xyQ=;
 b=LCBIul2FmmPrZESM+8qeYwN4OpnDb/dxDTYb/TiWt4o7mkEP7BJ4PlysJm6Y5kv6cm
 2yPblL1lGNYWg1YGC9G+7m6Co8kBZFPZLz2Uy3dbDRkCPrSEPMecaLr81BdW5cD7mB1P
 va/jfswFmn5bqS10GISBYJlGnsk3XnjICDxGoZsbFcgfL1Sf+6hViT6mpO+37EYQxVor
 9+N0WtMJB9YjvTfQ9Wj1wNO0ok/4BmtLr9CQJ4/FyRaZKlHq9kjVUIQmCNdFBqfGh8l5
 sKeTwGF96uqPdP4j46KjJrJlY4JDDVT1N28YO6RznAQVKa7gkckmUdT1nySCBt2pWgco
 ewew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tdC3cUaEksOqJq+sL/p6xZwzgeMpzcgI0nIv+Qg+xyQ=;
 b=taWw5cYzIAxhiWv9yy2XwJUXtqVveVuKMKc5KjJjuxRFPPYKQdGwoIkafmoZapegqr
 Txcj3d1/kivKBYprWPPlUzydxQIcdikXozN38EJ577BPHxO/xqsvwIv/WaWCJbs9RlOw
 zv3hGn49QSKp8BIZrBkqiurSLYtOSNBG2Y7Zr+xV6OiVktSYHZkZfhh8nj4gBktJFzYT
 eSaEybKj0bzUxrKb/F9CiQ688fvWhawWpKN1I7aVx05VgDl1v4n5MBoq1BU7MeBWSAcY
 KCQSjYGukHQyIzz63yahKXu5uUlNIpCfrODOYsGSIqO+AnsU4Cd1REv9hnOcPm3bHWci
 kMVg==
X-Gm-Message-State: AOAM533Osq3OoDMyoJYZ/uyfpmKh9hctdzxiY7huGogCFXfeAlQg6aDa
 H9P/bYndOI/weeW3wEGpgps=
X-Google-Smtp-Source: ABdhPJzbrijhCUfWaTPNks1kyBh2XAUFgM6PlyUutCGUNASmv4YuSYakKEIu1GH46R6if5yf5aFAbA==
X-Received: by 2002:a05:6512:1112:: with SMTP id
 l18mr7344980lfg.538.1607281383548; 
 Sun, 06 Dec 2020 11:03:03 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:03 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 03/13] video: fbdev: omapfb: Fix set but not used warnings
 in hdmi*_core
Date: Sun,  6 Dec 2020 20:02:37 +0100
Message-Id: <20201206190247.1861316-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206190247.1861316-1-sam@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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
