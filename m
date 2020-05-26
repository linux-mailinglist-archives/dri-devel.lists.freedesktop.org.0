Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0501E3A14
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984166E296;
	Wed, 27 May 2020 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECDD89BFE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 20:58:26 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c21so13165832lfb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
 b=sYqdL00wxBsKV/tWk4c/6PSxudVVmlGYO0JOmSXa3vGMFJbEfYsZkZ2WKjLTUH3NIe
 GAJj1QX36IrwRg6focC8XHG6l+oVVpXsQkejxtsnxe64lRSIYubjo7ZCRJoYh8iKDEWN
 SznVDhs2V4NCL9rtvxIKN2dy+06oSC4/Vk52LKYk5KLLkyCQVM+zr3CKrBZgJNDub0G8
 nRen1btPHNviYUBqKzOeWSAQ38QWr+MOcaVvV2zM8N49pBQ/6WVvGOCAbCZYsRsBnkdf
 o2jISFaIs1Z1jGm3PkL5sruecUWjw/wZM8eO1lOkbftNZxuu5Sczjr+cXCXWR/t/hV9z
 waVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
 b=EY7VyrSKw+DouG70jyvsyrWXMYl2K5B5+174SW1coqNqZvrHyuMXyOoeBISjWDikrm
 4ovez5Og4+n+Pr73TOEfbCb7rbCIf+YI+1saCkxLXhzkdWys/yI9IkAcRmoj5FgCpuLG
 095ayh6Ugh/XvYBt711Ox2VaGZ/kSyvYVwyAHw1Ps6p5zVtmtLIZsuREn8Ly1glLqLRj
 IQgPWb/WslLWlfclwyVl47goEvt+KZOFM03oWbEZxcha3IW429ZlzJpoFuf6hBO2c5gk
 YOaeRdsdJqf8IUEl73sfafW0TKSmFiO+zp/hvOk32sNyOJU9jxYlG8eYequ7cghYUQvx
 coag==
X-Gm-Message-State: AOAM5326Sw4zhikzPzgCK+Pm8gea6PylUhtqyr/xSqviePnepsyWEqkc
 PVR4DNAFZEyR+85f7i3kS9g=
X-Google-Smtp-Source: ABdhPJz2zthhB+lGno5dNWs8TPvEIizQS0U7tTQWF0e28Oqqtl5d4pIalYrtVRccmB5y8rQ0SirXwA==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr1391175lfm.128.1590526704190; 
 Tue, 26 May 2020 13:58:24 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id y130sm241192lfc.22.2020.05.26.13.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 13:58:23 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1] drm/tegra: gr2d: Add tiled PATBASE address register
Date: Tue, 26 May 2020 23:57:53 +0300
Message-Id: <20200526205753.14423-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two PATBASE address registers, one for linear layout and other
for tiled. The driver's address registers list misses the tiled PATBASE
register.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 1 +
 drivers/gpu/drm/tegra/gr2d.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 48363f744bb9..1a0d3ba6e525 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -177,6 +177,7 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_DSTC_BASE_ADDR,
 	GR2D_SRCA_BASE_ADDR,
 	GR2D_SRCB_BASE_ADDR,
+	GR2D_PATBASE_ADDR,
 	GR2D_SRC_BASE_ADDR_SB,
 	GR2D_DSTA_BASE_ADDR_SB,
 	GR2D_DSTB_BASE_ADDR_SB,
diff --git a/drivers/gpu/drm/tegra/gr2d.h b/drivers/gpu/drm/tegra/gr2d.h
index 2398486f0699..9b7d66e15b9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.h
+++ b/drivers/gpu/drm/tegra/gr2d.h
@@ -14,6 +14,7 @@
 #define GR2D_DSTC_BASE_ADDR		0x2d
 #define GR2D_SRCA_BASE_ADDR		0x31
 #define GR2D_SRCB_BASE_ADDR		0x32
+#define GR2D_PATBASE_ADDR		0x47
 #define GR2D_SRC_BASE_ADDR_SB		0x48
 #define GR2D_DSTA_BASE_ADDR_SB		0x49
 #define GR2D_DSTB_BASE_ADDR_SB		0x4a
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
