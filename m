Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E93027527F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8746E0AA;
	Wed, 23 Sep 2020 07:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93106E441
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 07:00:43 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id u4so614312plr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 00:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oRwmR3EhcJbAFucNH/94gqJmXyc3Ivz1Uey2cJmuPM=;
 b=KnK7Yrl5N78RVstfT4p+cHqser1Rh3nceDzmrZ9asUN8ZJdo0tbpjiCa0qEf5iMDlN
 g1lXCGvY88a8cVIypjS//QW+6FIeK2n1vWRhrhFPnragCHv5lxfx0y76pjYusiVViGPN
 vXq8jofjEMP2H8IcVmi+cjvG5M3HTmwqTOjiMml3dElEIY0uscYjv/xOf4CU81TNau3N
 LsLFtz7eU5n6uYTbOiak194H8+DJEjOFpffvb+JB6oXdqoV+5zDwkofhsyH71yEFeZ3h
 oPnf7Uf0qKUNdfpBXOWEU8M6FjK1Igh+Cqr4bgZaFoItzAd8avdZwmo7OJvDGiTtHujR
 dOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oRwmR3EhcJbAFucNH/94gqJmXyc3Ivz1Uey2cJmuPM=;
 b=ddlpFlS3P1bbIJ05w5pRmA9ske4fCJUtt1wVwhTujTey7SDU2B4Oq+5xPntEP5Fkbl
 NLxUpfmdF8ru+SgByYAH99beBIheNGVO0tSVlnZtGpJ45WmyxVmsd4m4cVJQmA8md6RT
 +vfC17OejOI9e9kDiO4esADGvStykCwBtt7hk9x94cn7M4Xi/Iyn77kTukgTwvUaHVv2
 A7ttq4NjoxJId9kfIjjjshh3fMZ89689tTfFw1ZJmiRb+2e5ZcjjmoVugA5gchk2n8Yj
 UBh8bdeN48wrGnOI6hdx5hHvmg2knNlYTAT7i1Paw4+mmfm0LPuMCWyCvu85ReUCaopp
 R2fQ==
X-Gm-Message-State: AOAM531Uw0RGKOffwOe9LbpPXyy5LfXjVQi18HfNA/O1PbzEljs8vTmX
 SoPGFncAYKIcU50f439cfNT+oA==
X-Google-Smtp-Source: ABdhPJz3kVpgSu//J46x/GTqCeisWVwS2nfBoJ8yAFUJqHmANvefDc9kzIAfNXlfMpEbuZT0p9avNw==
X-Received: by 2002:a17:902:8695:b029:d2:29b:991a with SMTP id
 g21-20020a1709028695b02900d2029b991amr8436516plo.80.1600844443090; 
 Wed, 23 Sep 2020 00:00:43 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id j18sm16090095pgm.30.2020.09.23.00.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 00:00:42 -0700 (PDT)
From: Jian-Hong Pan <jhp@endlessos.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/rockchip: skip probed failed device
Date: Wed, 23 Sep 2020 14:59:00 +0800
Message-Id: <20200923065900.658666-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAPpJ_efHX70Ej0uzRi-iRf7N0n6ZO5sMN-wK_YpszvVD-Un9RQ@mail.gmail.com>
References: <CAPpJ_efHX70Ej0uzRi-iRf7N0n6ZO5sMN-wK_YpszvVD-Un9RQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux@endlessm.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cdn-dp sub driver probes the device failed on PINEBOOK Pro.

kernel: cdn-dp fec00000.dp: [drm:cdn_dp_probe [rockchipdrm]] *ERROR* missing extcon or phy
kernel: cdn-dp: probe of fec00000.dp failed with error -22

Then, the device halts all of the DRM related device jobs. For example,
the operations: vop_component_ops, vop_component_ops and
rockchip_dp_component_ops cannot be bound to corresponding devices. So,
Xorg cannot find the correct DRM device.

This patch skips the probing failed devices to fix this issue.

Link: http://lists.infradead.org/pipermail/linux-rockchip/2020-September/022352.html
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 0f3eb392fe39..de13588602b4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -331,6 +331,12 @@ static struct component_match *rockchip_drm_match_add(struct device *dev)
 
 			if (!d)
 				break;
+			if (!d->driver) {
+				DRM_DEV_ERROR(d,
+					      "%s did not probe successfully",
+					      drv->driver.name);
+				continue;
+			}
 
 			device_link_add(dev, d, DL_FLAG_STATELESS);
 			component_match_add(dev, &match, compare_dev, d);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
