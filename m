Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B83C66975
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 00:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B353710E1DC;
	Mon, 17 Nov 2025 23:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="URzK9UyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8826A10E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763423543;
 bh=+lxsf3OSskd50eKCDyensIyhpCWxmlJP/CpAxjesv3E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=URzK9UyGZF6AiiIFblckM4+u31ZC9WG4xQg1l0Bh6kHlLBlS6vUAkXUzk4pCVTuVh
 WtMyWgujwPNcdNLvA3dkTHXtKcBW/IStI95wrI6fsVyerV+BnwFFbRv2qHteTYnaTT
 TDE7Bup+KICyEbdRWF9CLMPcwRzA4mfdEAYKRs7MtpARX3W6aDqnqGyeUI9J78nG+j
 swxw6CnAQQcRD99NsIO1aUCd2jAe8+j1XMzZZZ4WiT9QtTkBJf0vdwajPe7iErfuJJ
 epSrZSJHROAzVIokz8AHI9nGMHRDolTv2bV6OUb/jyq4SJsERWpifrlHDx8GN6Mu/Y
 /czw+VQF78qEw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EBAC17E110D;
 Tue, 18 Nov 2025 00:52:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Nov 2025 01:51:59 +0200
Subject: [PATCH v3 1/4] uapi: Provide DIV_ROUND_CLOSEST()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-rk3588-bgcolor-v3-1-a2cc909428ea@collabora.com>
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
In-Reply-To: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently DIV_ROUND_CLOSEST() is only available for the kernel via
include/linux/math.h.

Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
a common definition in uapi.

Additionally, ensure it allows building ISO C applications by switching
from the 'typeof' GNU extension to the ISO-friendly __typeof__.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/math.h       | 18 +-----------------
 include/uapi/linux/const.h | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/math.h b/include/linux/math.h
index 0198c92cbe3e..24bb868f971c 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -89,23 +89,7 @@
 }							\
 )
 
-/*
- * Divide positive or negative dividend by positive or negative divisor
- * and round to closest integer. Result is undefined for negative
- * divisors if the dividend variable type is unsigned and for negative
- * dividends if the divisor variable type is unsigned.
- */
-#define DIV_ROUND_CLOSEST(x, divisor)(			\
-{							\
-	typeof(x) __x = x;				\
-	typeof(divisor) __d = divisor;			\
-	(((typeof(x))-1) > 0 ||				\
-	 ((typeof(divisor))-1) > 0 ||			\
-	 (((__x) > 0) == ((__d) > 0))) ?		\
-		(((__x) + ((__d) / 2)) / (__d)) :	\
-		(((__x) - ((__d) / 2)) / (__d));	\
-}							\
-)
+#define DIV_ROUND_CLOSEST __KERNEL_DIV_ROUND_CLOSEST
 /*
  * Same as above but for u64 dividends. divisor must be a 32-bit
  * number.
diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
index b8f629ef135f..471877322f47 100644
--- a/include/uapi/linux/const.h
+++ b/include/uapi/linux/const.h
@@ -50,4 +50,21 @@
 
 #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 
+/*
+ * Divide positive or negative dividend by positive or negative divisor
+ * and round to closest integer. Result is undefined for negative
+ * divisors if the dividend variable type is unsigned and for negative
+ * dividends if the divisor variable type is unsigned.
+ */
+#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
+{							\
+	__typeof__(x) __x = x;				\
+	__typeof__(divisor) __d = divisor;		\
+	(((__typeof__(x))-1) > 0 ||			\
+	 ((__typeof__(divisor))-1) > 0 ||		\
+	 (((__x) > 0) == ((__d) > 0))) ?		\
+		(((__x) + ((__d) / 2)) / (__d)) :	\
+		(((__x) - ((__d) / 2)) / (__d));	\
+}							\
+)
 #endif /* _UAPI_LINUX_CONST_H */

-- 
2.51.2

