Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CC2C7648
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B426ED08;
	Sat, 28 Nov 2020 22:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C376ECF9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q13so12058070lfr.10
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/jzMmTNfIIHRAzbdgJUlI30eY/5E6v51csqIZVPdm8=;
 b=H1SQRZSraI92a5O8JSNe2407lQpbO/+p9TDZYNkqAVUoapJk9fO+eGsW9hEC0PhPwQ
 MpND47D0UvArbcEQ6WCBHFbfL+Yj82bjKGsmbi1NL9P+Drah4BbSv2KWIwjIa7VtDKSC
 HLFX0TiM836LhxAnGD8VZIcFRVe37KjZkVD8bly5ogDokaCOe6rZkpYUE9zBOXZwIJeP
 jHP0XeZr/46sh5nl2Uo7tv5amK8nJqhQe+6A7RJqP8KEyG7ZABXvV1PIT0/j9J/XvlFW
 Pgvazywpu8LHLmRdFfaCSXUNq84LG/HMHt9XKr3njllPiDQ6VOrnopdZ3PVQFeD4IFqZ
 mzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i/jzMmTNfIIHRAzbdgJUlI30eY/5E6v51csqIZVPdm8=;
 b=QmDjQIXK9ir0Tiexlngxv2skMLtXOOio2GTlP69h1S1eDn5Xo8PJVYTkL1Zpz3rDyi
 y2IisjLyrtkwfNhQKoCSNytcu17iQq8malOeWQ7625Zy3kT6YkibNQWWcm/Np27nOOdH
 fziTirAznF2tdUtOjj5BOIKGY6C1DDJDQTWYsx8bW0zFTb0yAa1wyiJTJ5O2CnXsxyot
 +aB8Kp3W9W0weFYR01g/A9ierzgvZ7b4ywg8rb1a/7eNz9mA7u5cDs5GsRKcZnu1G7j8
 5pHBRkfcREYBID96ScgTFT4TdoGU5Y6vDaZzCui18bQ1qOdFHAkAYFDVdsPA8X14t83f
 8Dpg==
X-Gm-Message-State: AOAM530lsk/l94+0ybxyQJwO116VjRzbYHMvIGEbNysbr7YLAY8ytJOx
 xBX+bNEXE5oujvh2o+tklAM=
X-Google-Smtp-Source: ABdhPJxtO7VXEd89T+Ciyiy6CaN38D1Nxk/voiHrw2OR7xLLx2fqYvJc1vd+oWe7rP3sXbswetx3Nw==
X-Received: by 2002:a19:fc0d:: with SMTP id a13mr6540657lfi.276.1606603323803; 
 Sat, 28 Nov 2020 14:42:03 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:03 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 22/28] video: fbdev: omapfb: Fix set but not used warnings
 in dsi
Date: Sat, 28 Nov 2020 23:41:08 +0100
Message-Id: <20201128224114.1033617-23-sam@ravnborg.org>
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

Fix several W=1 warnings.
This removes unused code and avoids an assignment by moving
the use inside the conditional block.

The register read FLD_GET(r, 15, 8) could be dropped as it was done a
few lines before too.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Aditya Pakki <pakki001@umn.edu>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 6f9c25fec994..72d45a02c3ac 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -1178,13 +1178,12 @@ static int dsi_regulator_init(struct platform_device *dsidev)
 
 static void _dsi_print_reset_status(struct platform_device *dsidev)
 {
-	u32 l;
 	int b0, b1, b2;
 
 	/* A dummy read using the SCP interface to any DSIPHY register is
 	 * required after DSIPHY reset to complete the reset of the DSI complex
 	 * I/O. */
-	l = dsi_read_reg(dsidev, DSI_DSIPHY_CFG5);
+	dsi_read_reg(dsidev, DSI_DSIPHY_CFG5);
 
 	if (dss_has_feature(FEAT_DSI_REVERSE_TXCLKESC)) {
 		b0 = 28;
@@ -3627,7 +3626,7 @@ static int dsi_proto_config(struct platform_device *dsidev)
 static void dsi_proto_timings(struct platform_device *dsidev)
 {
 	struct dsi_data *dsi = dsi_get_dsidrv_data(dsidev);
-	unsigned tlpx, tclk_zero, tclk_prepare, tclk_trail;
+	unsigned tlpx, tclk_zero, tclk_prepare;
 	unsigned tclk_pre, tclk_post;
 	unsigned ths_prepare, ths_prepare_ths_zero, ths_zero;
 	unsigned ths_trail, ths_exit;
@@ -3646,7 +3645,6 @@ static void dsi_proto_timings(struct platform_device *dsidev)
 
 	r = dsi_read_reg(dsidev, DSI_DSIPHY_CFG1);
 	tlpx = FLD_GET(r, 20, 16) * 2;
-	tclk_trail = FLD_GET(r, 15, 8);
 	tclk_zero = FLD_GET(r, 7, 0);
 
 	r = dsi_read_reg(dsidev, DSI_DSIPHY_CFG2);
@@ -4040,7 +4038,6 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 {
 	struct platform_device *dsidev = dsi_get_dsidev_from_dssdev(dssdev);
 	struct dsi_data *dsi = dsi_get_dsidrv_data(dsidev);
-	u16 dw, dh;
 
 	dsi_perf_mark_setup(dsidev);
 
@@ -4049,11 +4046,8 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 	dsi->framedone_callback = callback;
 	dsi->framedone_data = data;
 
-	dw = dsi->timings.x_res;
-	dh = dsi->timings.y_res;
-
 #ifdef DSI_PERF_MEASURE
-	dsi->update_bytes = dw * dh *
+	dsi->update_bytes = dsi->timings.x_res * dsi->timings.y_res *
 		dsi_get_pixel_size(dsi->pix_fmt) / 8;
 #endif
 	dsi_update_screen_dispc(dsidev);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
