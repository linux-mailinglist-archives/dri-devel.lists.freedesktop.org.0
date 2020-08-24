Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6B25130E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCEC6E882;
	Tue, 25 Aug 2020 07:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACD96E402
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 17:44:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a15so9658638wrh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXooCNGdhbuCs38z5vOfPrPzquVwWGwJseeAUQIr3dI=;
 b=iTQCp4W4bnKDurMqnF9xz+FFQWCsZ7QeRAPt3KjIVEHR2InNqejYz6MyUzv93PW4aS
 WyZwtA/F3UKwIaVU/KvdA3Nv9lp5LXXtirqDZpOniKaWsLeVW77XiGZEoE5d/0bYZkRC
 FOyQX6o8HfXmo5r3GRobQe/q8ZGeNfZh6/gRc9gpX7z3daiXERyOK8VQm1Rz7csQFtpB
 zZcUQK+RQI/FNAq+EELAMH9/0FmdCQpckS1vilSX1afoClvoQj7SFBCGvhJ/YykaKG/0
 COheMc2pNwqdgg95ISwKlP8oF6sZLtIavbPS1iWIOlTS1Yqr3zijv+Cl1Tfv1BIRbm4n
 r/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TXooCNGdhbuCs38z5vOfPrPzquVwWGwJseeAUQIr3dI=;
 b=GoFyTO8nXCZ6YtaJ8gv29CXyyOpqXX61zDdv18RY7xPD4Dmp1zR4jm2/clMsK5rQxq
 yaU7y1JPGODf+KraRW72+wFztHRPgO8IlxMlgMuBOLj1IL2TrKsO+F5IuRo7AoalqXSo
 iXc4nPTh8IhTutzWRTbLzygtJNVpNxhmqoxGj7YECo4KO6kfmxRybV466twsnmvohVnl
 pF76FUnwf60sExPHZJ+W/Cfb2ZN/MDyH50Ioy5B6UVToTey0b94QtmUd4eMqGRwXSWaE
 nqNWg6UiK2YUb5m5aFrhI9TsH67c8DEArOIeVN+DM7aly3Gj9+Sr80ChWweuh8ReJCGk
 JVRw==
X-Gm-Message-State: AOAM531XDqBWp7ksd34lFD/l2S1WE1x9tx3MW0fj8IU/1KXDA5JxkIkU
 uQRaoh2uOmopCEPiF8oQg0o=
X-Google-Smtp-Source: ABdhPJw7TMgowMg/jub8r23jyDF6m4NIDyBitGVovsMaVGfdJyBBpTjsvU/TA22pDCl+TmPubgjUgQ==
X-Received: by 2002:adf:f086:: with SMTP id n6mr3470862wro.208.1598291054224; 
 Mon, 24 Aug 2020 10:44:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id a7sm446977wmj.24.2020.08.24.10.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 10:44:13 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alex Dewar <alex.dewar90@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: replace spurious snprintf() with sprintf()
Date: Mon, 24 Aug 2020 18:44:03 +0100
Message-Id: <20200824174407.429817-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

par->vgapass is a u8, so if we are assuming that buf is at least
PAGE_SIZE then the extra checking is pointless.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/video/fbdev/sstfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index afe6d1b7c3a0..c05cdabeb11c 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -733,7 +733,7 @@ static ssize_t show_vgapass(struct device *device, struct device_attribute *attr
 {
 	struct fb_info *info = dev_get_drvdata(device);
 	struct sstfb_par *par = info->par;
-	return snprintf(buf, PAGE_SIZE, "%d\n", par->vgapass);
+	return sprintf(buf, "%d\n", par->vgapass);
 }
 
 static struct device_attribute device_attrs[] = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
