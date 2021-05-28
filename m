Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8238C394B87
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B306E161;
	Sat, 29 May 2021 10:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27FF6F5BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id z12so5365153ejw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbLfIFthjQtZlat7RQdN/8yMEDgpJIwnw/QpuFVzqeI=;
 b=E7bhan7NhUuVUJZuxUfPhvZxTg20U/P/6O1vrBdsdaL6+UjcvkjtNpH5Ouw2M61oq/
 uCrsNHccZda3hmuSWGImGDMoetf+MXqY8I7qHmeKSj0rYmhYsTX3c0SADTxs+N5T253j
 FeLN0rT50121dOaZqRKF7xH9TqN1G5ZokSmm7BB/7YYikDeB5HGptZuz/0nNlnVmA1wU
 OP4tqM+ieLqZvPVvHxr4b86HX0ZcMfGIX45K7zABxJBSpu0oy+01sPe9n69J+P5V9Mpd
 DeHfmIKnF7jV64fWLBRNrembZ4KsUZ72hg5W95Ifa6iiwEX10YlSJdz9fwjhnvl2Pk3w
 iT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UbLfIFthjQtZlat7RQdN/8yMEDgpJIwnw/QpuFVzqeI=;
 b=GxlxEVbe9PfEebYQrQfhnLqlKlVB5DOQrzTMojenuTAQQUEXaf5MYJi6oGDV41Eb9B
 N0C6vC4/wgUNzRQNIA/H54ACDEpVkP+HgyaZtO6mXO8Wkq+MCHR+JgcQErgSQ3u+nhjS
 MpuQhjo9kuoEuugS8tdNLIQCi3sgrgAutSgiaWmq4hyhCXVdPgU9OKUyOi0VwS7fjfI7
 ToJodv60/wKlnYRs0K8y3Ml4qH50nti3hJ/zhM8OhrR2WwLbeZazVkbYZ8ElhQyE8Vfz
 dD9TV2ICL/0sg/JHtHHKklz7L1FbgqJplE1Y5qqOvW5KQd31k66p96PAIWb1opfFNQmG
 N7lw==
X-Gm-Message-State: AOAM533KAeSXL4fuq8UKmswQTHhiuwQ/GdChwLOacWu0v9vwgra4sSMu
 coEyMwL+sERyarqqwEwDXg==
X-Google-Smtp-Source: ABdhPJzwwAQrY+FztbwSr53CEKhDkKAur6hWhbtxnRbmwG3xEJRjfGri3LkImQAzeg5HEwQJjikb5A==
X-Received: by 2002:a17:906:7a13:: with SMTP id
 d19mr6110323ejo.69.1622207174527; 
 Fri, 28 May 2021 06:06:14 -0700 (PDT)
Received: from localhost.localdomain (ip4d17b4b8.dynamic.kabel-deutschland.de.
 [77.23.180.184])
 by smtp.googlemail.com with ESMTPSA id u21sm2322778ejg.50.2021.05.28.06.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:06:14 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/5] drm: rockchip: add scaling for RK3036 win1
Date: Fri, 28 May 2021 15:05:50 +0200
Message-Id: <20210528130554.72191-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528130554.72191-1-knaerzche@gmail.com>
References: <20210528130554.72191-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
2.27.0

