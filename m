Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B072C6C56
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39E96F3F0;
	Fri, 27 Nov 2020 20:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9580E6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:33 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j205so8559131lfj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJy8+vjkzYcV3XZ9Y+7Fhqd4Ih76XwRBzaJbmXxDMAw=;
 b=TCBYH4MoDC4EkijExZlsZmuW7pCHINO8ItDGIOhZpNfusWNsUwsPFSjpOj3DV1FYfq
 U7rEdu3HkuAAtAPqhoC9k9YNFAdbYPSWUHxs8zNG6Wkd4BfEwYRxYzZReMO8HsrT96UA
 TIXsjv6vxzOlkQK8X4r168/DpCnKzqBaLxYag3qdIwFpLzGNDSbDNTaLjNT/RS9MFNzK
 GuxEHrhefBzz4opGqJsXeV1LE28StIAkEBTZLqF1vfe4UXaI2cKfqOE8wPRCw2IqU+Jh
 9sVtCEx725p2FYiEAlCLIfbbYsklFvoCjAbnmD8RbDnN6lKr7NGHecqvHhfsCCr6+2ho
 p2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rJy8+vjkzYcV3XZ9Y+7Fhqd4Ih76XwRBzaJbmXxDMAw=;
 b=A8U3PlXeC//rqXnSLZ4QW4q2Rjqm7WyTJmYuJipsLH8m4IJZBqwhV4NYis+KAlCmlM
 rucx2Ay7nJZzrFml+XU6WE/HV6hy+dpg4atZAhMsQ19Zx6hsICQc+pQj8pRyG+Gk6Rfl
 4mZEqvRGmS7YJdv9hIYDoJIOJFOHL7zrMXprjwmU3+hZZXDr9PC+gXeIiQWcUo3sCGcJ
 J4p8CrXsrQM0hOA//d/vIoh5/Ay8Z1wSHUgjmupZn72r9YSAcBrOQKhmJM+0RjR74FAv
 aqvr0O07VTbsjp6jY75erzipyJQLBfgJJkEMoovvcmYDTBPUN+iGSTp+LDqnOKSk91z7
 yMmg==
X-Gm-Message-State: AOAM531qieCteCw+Q+xjp1+gsIb085KCQU+MpMateAXQQf+9Z/keMPDU
 ieC9NuEKKGcV5oaeUMpUEIM=
X-Google-Smtp-Source: ABdhPJyOgA2kVm8O0iBLEqcMx9FEwMgL+93MG+gzwXYrmJwqzkMgjoJP3OWnlBdNp/YB6uBjS4Hc3g==
X-Received: by 2002:ac2:562a:: with SMTP id b10mr4250758lff.227.1606507172012; 
 Fri, 27 Nov 2020 11:59:32 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:31 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 22/28] video: fbdev: omapfb: Fix W=1 warnings in dsi
Date: Fri, 27 Nov 2020 20:58:19 +0100
Message-Id: <20201127195825.858960-23-sam@ravnborg.org>
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

Fix several W=1 warnings.
This removes a little unused code and avoids an assignment by moving
the use inside the conditional block.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Aditya Pakki <pakki001@umn.edu>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
