Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C45363E1C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 11:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834F689AFF;
	Mon, 19 Apr 2021 09:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D689AFF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 09:01:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k26so16710140wrc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPqPD/BdKbOmQoY/69ahqiLeLy4W5bUr61Qz2mAbQO8=;
 b=ZDkUmAfiNr7vTw1GLZge+A/3lbdsF/wNvgIGrY/66IjAeb7JkxqkJ0G/3heyKx1bpy
 ay9fjir4M6WU7e+kYVMvUrsqazj1q+JJWXuwS7rAWPWy/6fiD2YD6c9S5M6mBDH+QAPM
 5CXAQlIZx9XlaC2nvi9RbwwSyXIyUUKyvOOMiwChIzAAmagIFrLtJTjalX0x+tmZEGXW
 1sn5VFCVXt5RVUfiUM+8virAYqShpxLwyVnqBlqIWHV0i2dp14zdWT53ZatA1FpK3zOg
 Y6Bt18WS4izwrTSxGNzo8Ijpk9pSeVB98ss4KuzYKF3AnhDVBij0OAR2VXMa6HwLR84p
 pW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPqPD/BdKbOmQoY/69ahqiLeLy4W5bUr61Qz2mAbQO8=;
 b=Mmrm23wK++oPxXrhJrAGNkjJSE1aJkhFI0s70EDycfT0wq/n4vuAUnDHa11qQHVNKu
 YzBPk8Y+i8EO6XqsQrdYkxl5Y/JqZiXKYd0FXQui4FcnQHvKichTVkn7pR4mlcxz1uRP
 atl7yJVDealkwQ0uixCBg6dG0s+KOL/Au1dmZ1I0L7iIYYPPkTIWq+ET/O1dfHCCB1ci
 O97jpO3x39UCK9hf0aMiYg6NLjkc4xTDAemX256NoAXoiYTm46o0bcXPq6nzg2rTTrJc
 dGM39MuyunXSlto5QnrAQp0AXexh0B3OumFTHJgUAFWt6PQgyrVJdL/Q8tZgRfTfU363
 jkzQ==
X-Gm-Message-State: AOAM533N5hnQu49qQv7MICSIK9gvLRhdOUXf9UA8BwhtSe6Zk/ptfuP3
 8Md0D2baWFLuDykdL3FrOJPNsA==
X-Google-Smtp-Source: ABdhPJys4VsgOUWkYQqpx+Qn/FCs2zadombmpxdeBA++SkKxsdC+yJFpD3mOYG/M8XmtvFWemf0B5w==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr13582443wrd.14.1618822898682; 
 Mon, 19 Apr 2021 02:01:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:4e60:4ba6:c549:25f6])
 by smtp.gmail.com with ESMTPSA id m14sm21477080wrh.28.2021.04.19.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:01:38 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 cw00.choi@samsung.com, m.purski@samsung.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] drm/bridge/sii8620: fix dependency on extcon
Date: Mon, 19 Apr 2021 11:01:24 +0200
Message-Id: <20210419090124.153560-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.31.0.30.g398dba342d.dirty
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_SIL_SII8620 kconfig has a weak `imply` dependency
on EXTCON, which causes issues when sii8620 is built
as a builtin and EXTCON is built as a module.

The symptoms are 'undefined reference' errors caused
by the symbols in EXTCON not being available
to the sii8620 driver.

Fixes: 688838442147 ("drm/bridge/sii8620: use micro-USB cable detection logic to detect MHL")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
---

LKP reported issue:
https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/


Changes since v1:
 - Fix typo on comment

Changes since v2:
 - Randy: Changed from `depends` to `select` 


 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 22a467abd3e9..70402da5cc70 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -169,7 +169,7 @@ config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	imply EXTCON
+	select EXTCON
 	depends on RC_CORE || !RC_CORE
 	help
 	  Silicon Image SII8620 HDMI/MHL bridge chip driver.
-- 
2.31.0.30.g398dba342d.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
