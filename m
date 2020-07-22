Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE122A939
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E21892A5;
	Thu, 23 Jul 2020 07:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4489F3B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 18:14:01 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id f12so3233650eja.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+2yRql0PqZgjMLyfhyquRo9Q78YxnYMENZUh8aYO2bY=;
 b=MQ+lxwAOW3hhiw4GW1RPkyHjPo9/BRI+QBF7guB/qd5C5OnecF8OtmuxofFp16OQKy
 EMC7+3g2nf08aEbMghDQXRUvp0fzhowa/jIcH4uXJQcWIR+vhpTF7YBAWLdEqVTyRrxi
 nEhOKHX26y8VBaerO9+Gur87dZwtsRan/KUnWmIdLqMKDQ8IHg7GVLNx/MuIh/DBx4/i
 n+32kVouDv63jjHxIpv23Kk7as0nYKbP2vG5AJd9sjHS5i9a/4J9Xakc4RoidDus1kVc
 rMZAfP4oHMJ77Om9k45dDrjCZ9zAK2l+LCGC+Y+8IaIgcJpY13tGbBxu+8Xa1N+OB/Px
 rgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+2yRql0PqZgjMLyfhyquRo9Q78YxnYMENZUh8aYO2bY=;
 b=b6Xf57vbqqdsWTWXUBDxyTRG5FOL09vC7vZLuMn9YLAduhEHtW0pqPKPeFpnDuoLpF
 2Gk33/Bvk2Gp6srGJw7nXqVvPYyJycPH+Kd9g2DE5H0slynVcL01aLvhNb/r4DnySrgn
 mghX/TWGdAfDKOnrbfThjdLJ2ybbubY7joSUq/MDF30H/3rzgiKF86Ieg/zaQwIHNrP/
 DOeHJTS2enIHDVSywJ/ONuxYLVAXPChUCGRPzrXhgOjw8r4JTvnY3CBL0lMf5CLL1uUH
 2CE4OFFL1rs9+D5iocEbvnsZlzHfFTrCgTEPw5dCozbTyvwltj40Op0RD30DrM8z0dT/
 K3nQ==
X-Gm-Message-State: AOAM530lZm16hv/wFb+9VEf8OZEOTE1Ap88fWrj91i/Mfo6rAG8NeRZL
 8WWq3oTudVmZ1w83Y7JQgkeSkHd4/w==
X-Google-Smtp-Source: ABdhPJydtGJH1Wsx4NdMMVNpjKYL+ExfG/m+mBecCKK9gKXGYtqpdmrFWa/WLjRkpoXM2dmiBGmovw==
X-Received: by 2002:a17:906:456:: with SMTP id
 e22mr811200eja.178.1595441639663; 
 Wed, 22 Jul 2020 11:13:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 x64sm372954edc.95.2020.07.22.11.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:13:59 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH v2 1/5] drm: rockchip: add scaling for RK3036 win1
Date: Wed, 22 Jul 2020 20:13:28 +0200
Message-Id: <20200722181332.26995-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722181332.26995-1-knaerzche@gmail.com>
References: <20200722181332.26995-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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

Add the registers needed to make scaling work on RK3036's win1.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

Changes in v2:
- rephrase commit message

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
