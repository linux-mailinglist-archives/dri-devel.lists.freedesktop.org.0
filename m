Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 915FF22587A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1F389F8B;
	Mon, 20 Jul 2020 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1786E13A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 20:03:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f2so14271181wrp.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e9LVKzcKKE6KucRCr2Robwz6yGdDbDVXBxug85I0dco=;
 b=JuQsA+QXDag3MJEgFG3rsFkOpM4Bhb/3DNCULylpWsANJwn4NA6dd3s147xo7s3ey4
 CFhsKGGd5G2FRuoiud12C7dQrOZ72rJ6oovlAyT9etUiHZ0OWXOmaueNe9+4npveWsrT
 moweQEz4L/kRQlpYWt6FNBL5LkEeEs6AbuiyGpUYVnm6+MsVxv60FIrQjZ2YhdEpi/eQ
 OUrBITlGULUJPme1h5xXXxpilsCgsnJGyaw0zwjmGMT2Bfdrsrk/zGuVNLXGuh+4kl3H
 El3o8cv9EgC9eaE//1JJDwfdQt66/Q0L7cJRi5d3RvMIKlV1Qds+r253cIdnHBLLZUQP
 dkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e9LVKzcKKE6KucRCr2Robwz6yGdDbDVXBxug85I0dco=;
 b=SJ5YKVd3zTqT/yX3W9nkRXXPDiY94McZWHSlQGmqMwksZjCA95UOFu2GuSv46FTzM9
 wAB/M0WCWC10caFIsYzGgFHvd+fLjCClmoC/y1Az6pYJ20aW6yC1KT2/OsIV53fOYCq4
 58tPRKpMSPhwITxsVi+C59D7Cw5QqMYMNxpO2utqcdGmnCN+BIb4zV3Eid2Jg1h8iKGO
 tyLvRBHxYZQa1fX1qGRE9PXLQm8Zwkg/du8Q58xcuiYJDiJqBLOvUt0LKOShOa6xiGzw
 xEiVto8rcPcXhHwL1dxuZOZcaP/mN23ZjnyJMqNRrthwFmsaGqe70EvC2xdMICRRqBHc
 EJSw==
X-Gm-Message-State: AOAM531jkhWrwPaLZLvZL823PZE8moDd1NknhOF5umYj3BzM/hDHQfXQ
 +EqL6UrjJ34qKZhMCnEB0A==
X-Google-Smtp-Source: ABdhPJy3upfHRf43wWELUIEzg31WQ4xhbjXcEWGM7mHkoHhDeFXRX0C4Y41yOPT/ghAcnDRL/vL+UQ==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr16157748wrn.185.1595102625416; 
 Sat, 18 Jul 2020 13:03:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 l15sm21073826wro.33.2020.07.18.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 13:03:44 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH 1/5] drm: rockchip: add scaling for RK3036 win1
Date: Sat, 18 Jul 2020 22:03:19 +0200
Message-Id: <20200718200323.3559-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718200323.3559-1-knaerzche@gmail.com>
References: <20200718200323.3559-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds register definitions needed to make scaling work on
RK3036's win1.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 80053d91a301..b046910129fb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -77,15 +77,20 @@ static const uint64_t format_modifiers_win_lite[] = {
 	DRM_FORMAT_MOD_INVALID,
 };
 
-static const struct vop_scl_regs rk3036_win_scl = {
+static const struct vop_scl_regs rk3036_win0_scl = {
 	.scale_yrgb_x = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 0x0),
 	.scale_yrgb_y = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 16),
 	.scale_cbcr_x = VOP_REG(RK3036_WIN0_SCL_FACTOR_CBR, 0xffff, 0x0),
 	.scale_cbcr_y = VOP_REG(RK3036_WIN0_SCL_FACTOR_CBR, 0xffff, 16),
 };
 
+static const struct vop_scl_regs rk3036_win1_scl = {
+	.scale_yrgb_x = VOP_REG(RK3036_WIN1_SCL_FACTOR_YRGB, 0xffff, 0x0),
+	.scale_yrgb_y = VOP_REG(RK3036_WIN1_SCL_FACTOR_YRGB, 0xffff, 16),
+};
+
 static const struct vop_win_phy rk3036_win0_data = {
-	.scl = &rk3036_win_scl,
+	.scl = &rk3036_win0_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
 	.format_modifiers = format_modifiers_win_full,
@@ -102,6 +107,7 @@ static const struct vop_win_phy rk3036_win0_data = {
 };
 
 static const struct vop_win_phy rk3036_win1_data = {
+	.scl = &rk3036_win1_scl,
 	.data_formats = formats_win_lite,
 	.nformats = ARRAY_SIZE(formats_win_lite),
 	.format_modifiers = format_modifiers_win_lite,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
