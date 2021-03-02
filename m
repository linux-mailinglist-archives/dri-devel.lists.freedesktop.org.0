Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512103296C0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 09:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB0A6E90B;
	Tue,  2 Mar 2021 08:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBC06E8BB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 04:22:37 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id b21so13031729pgk.7
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 20:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=elM1zjwBJSQBpl/quKbnHA4lgGWxjH0JrhX/IRautFw=;
 b=S8q0CflZIm2643Put3EV+hTcBCMksy/5FECh9eMjvyTxpSxSO3I6AudhkrPLxaQZ+d
 0NkVPHj1lrpcxhhtnG+mlRAdzVGRLlgoGkCw5axRNij2VFwev2LEc2u89ZITrKrR6sGW
 J+F4KZKuQA012ZdPKaI6YaC9eE2JU9o4JEsRJKrOFiXEtHpa/og80HFKcFAR48jnykmK
 HnkYTXdJFdvSkoogh6saIA+CifU8TnZbn5jPY/kaD4UeYjecReNUvHeGN9AnnGofScRc
 pZ0axVwDG6sSaz3pTuoJl/qrSxUeA9O76+xvvIZbO2TpkCtlbTT18ZPC5hK7tI8+pNRm
 IfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=elM1zjwBJSQBpl/quKbnHA4lgGWxjH0JrhX/IRautFw=;
 b=n2iSSghS7lpebk/VLg/TRRrONyAWp4k0B2RllR6HyORjLGjcK1ozUcbsbt0Gtsfq8J
 zyes4AvRFwrflnedWimthT6GyUDNVV1EsNwhnErXTe5GLXGZnHFv4MjUO1+w13AsRnep
 gC1aS730jeZUV6zuU/Nwct+3503koNnZi740v39iLmssofQNzGL2iaCnEDmUMZ3pDV7H
 jVMQVQdcrhbXzhDnjvSya3Iu+FvSOq9oAmD/iYZStqFtYj3QrGeh0o73Wig9duDLwlIZ
 8be9jlcP6/c6f/xbsGbuPQ2GCTBE0aZc7Q+AllvFA6uel1A5whDcoSgjeDynDZ1lLuAp
 GAQQ==
X-Gm-Message-State: AOAM532fZetF4knWkvb7P5rcwFtmDntBYtnSLEb/0HbPsIXRkKe219qW
 qUgdsDZ10uxFl2pA8hLE7/M=
X-Google-Smtp-Source: ABdhPJwplW9mkO60eotfrXiajqyI4lu6t+Z+tQxmd1o2ufcqNn4sGsxH1iHYBaPGeULR7ybT7H6xog==
X-Received: by 2002:a62:16c9:0:b029:1ed:df04:8fcf with SMTP id
 192-20020a6216c90000b02901eddf048fcfmr18408932pfw.63.1614658956954; 
 Mon, 01 Mar 2021 20:22:36 -0800 (PST)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id b14sm1134534pji.14.2021.03.01.20.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 20:22:36 -0800 (PST)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH] drm: meson_drv add shutdown function
Date: Tue,  2 Mar 2021 12:22:02 +0800
Message-Id: <20210302042202.3728113-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Mar 2021 08:06:57 +0000
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem: random stucks on reboot stage about 1/20 stuck/reboots
// debug kernel log
[    4.496660] reboot: kernel restart prepare CMD:(null)
[    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
[    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
...STUCK...

Solution: add shutdown function to meson_drm driver 
// debug kernel log
[    5.231896] reboot: kernel restart prepare CMD:(null)
[    5.246135] [drm:meson_drv_shutdown]
...
[    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
[    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
[    5.338331] reboot: Restarting system
[    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
bl31 reboot reason: 0xd
bl31 reboot reason: 0x0
system cmd  1.
...REBOOT...

Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
and Odroid boards, WeTek Play2 (GXBB)

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Artem Lapkin <art@khadas.com>

---
 drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 42c5d3246..693bb1293 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
 	return count;
 }
 
+static void meson_drv_shutdown(struct platform_device *pdev)
+{
+	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
+	struct drm_device *drm = priv->drm;
+
+	DRM_DEBUG_DRIVER("\n");
+	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
 
 static struct platform_driver meson_drm_platform_driver = {
 	.probe      = meson_drv_probe,
+	.shutdown   = meson_drv_shutdown,
 	.driver     = {
 		.name	= "meson-drm",
 		.of_match_table = dt_match,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
