Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F79622A94B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2406E413;
	Thu, 23 Jul 2020 07:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FCA6E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 18:14:36 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id by13so2341491edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NUkQtv3OJHBzboi9ru1HyxK6os+k6GP868ADn16gFFU=;
 b=Yr0A25+8HZhtQNRtUXpWrihE5hC09s6PB8Ecc61nnw5jJrjAHYEaAZFsC4OeW1QdKk
 uoZp5lL7mWGagAVynN3amwJeNlbHpj4Z/FETX9Iu/837eiy7dcyuCEz4CFZL/rRzqpOe
 uinUfsZ9dlvU0P37gCridlrLSYBV16dzMZ8nX1JVYBxyMrQ2jcqv4ooxYjV7mRzUtBgV
 6dB87LJQjMUwdF88P/oixIA1jQ0NcQa48DuNh86HCl1+4VkhSRYPJTCkrGiCnsNsE6Pb
 ijZ2Jx3aaiRyjI2Ner8PI6Rc8klmEmfDcVeHQDjClW6B6HkBoO/EJmV+MPEyEVUL8ssr
 Lc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NUkQtv3OJHBzboi9ru1HyxK6os+k6GP868ADn16gFFU=;
 b=pUiJs7MWJlt2Xq8FaLLr/VRd/jfxIQEkWoZRS0dMSmgJxzeMA3CgMFMd92XmAG+Bw3
 KFPQ+P2QGwJjPrOtC7a26Z1cJHoTN8OxTR5K1W0rUVJCu+sARdXOPaWt+ziLZvH9zWY9
 9GlOu1Chp4r8aUTaRMOaIHcGnG40wTtp4TPkNNf3lgBpVHw5sQnvkb5vr6azGxnX3lJ+
 5PW5rVUHvs/BeO7k+Lvi02r0Ix61vzKA4KQ1E7fZW/W0Ofod/Q5metbsKFzBbajKlBpf
 zI2aF5R/gbw4i9avaFbwhET8yjHq1Ze7z2urdUVAcLszAf8u3SCFh4vCA+3pdrdO6FAP
 gYRg==
X-Gm-Message-State: AOAM533bAOnyp8lK9FxzU9jLbBkOiSmenCUZqmZICEWh02qAk8uqJJaP
 ifrIK4C6AlLORngblGw+xw==
X-Google-Smtp-Source: ABdhPJxHHQnxfYsacvYxK8fphmFU5Y2/bDjz1g0ykQdB6aaEDAKTVi+GC+doGqCwIerSb2ZyUtCjkQ==
X-Received: by 2002:aa7:d802:: with SMTP id v2mr689281edq.77.1595441675574;
 Wed, 22 Jul 2020 11:14:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 x64sm372954edc.95.2020.07.22.11.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:14:35 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH v2 5/5] drm: rockchip: use overlay windows as such
Date: Wed, 22 Jul 2020 20:13:32 +0200
Message-Id: <20200722181332.26995-6-knaerzche@gmail.com>
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

As stated in the comment for rk3288_vop_win_data windows that are
supposed to be an overlay window are missused as HWC windows due to the
missing implementation of that window type in the VOP driver.

This also applies to VOPs RK3036, RK3126, RK3188 and RK3228, which all
have at least one (1) dedicated HWC window (which are not currently
defined in the driver).
Since all the VOPs mentioned have only one (1) overlay window and all
now support alpha blending , it should also be used as such, as this
offers a much broader usage perspective for them.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

Changes in v2:
- rephrase commit message

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 5a13b4ab77e1..b4a00f13b559 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -131,7 +131,7 @@ static const struct vop_win_data rk3036_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3036_win0_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x00, .phy = &rk3036_win1_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const int rk3036_vop_intrs[] = {
@@ -200,7 +200,7 @@ static const struct vop_win_data rk3126_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3036_win0_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x00, .phy = &rk3126_win1_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const struct vop_data rk3126_vop = {
@@ -542,7 +542,7 @@ static const struct vop_win_data rk3188_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3188_win0_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x00, .phy = &rk3188_win1_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const int rk3188_vop_intrs[] = {
@@ -979,7 +979,7 @@ static const struct vop_win_data rk3228_vop_win_data[] = {
 	{ .base = 0x00, .phy = &rk3288_win01_data,
 	  .type = DRM_PLANE_TYPE_PRIMARY },
 	{ .base = 0x40, .phy = &rk3288_win01_data,
-	  .type = DRM_PLANE_TYPE_CURSOR },
+	  .type = DRM_PLANE_TYPE_OVERLAY },
 };
 
 static const struct vop_data rk3228_vop = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
