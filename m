Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53425178BC4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEEE6EACB;
	Wed,  4 Mar 2020 07:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B716EAAA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 05:34:52 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y1so496724plp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 21:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Wx1dpYuJUZQ968LyzlAz8kJnaaQj07UX3PLKHlV1LaI=;
 b=kFKr9KhPn3K9CZa8R3L77/BxUdS107vl21eRaPc29XpDYCjbEdhHxPhDMfVrXBQ29i
 yfUomrpcr0QKwayMX/SwNXzlDUzZnfdoDGW1BXgFbDi7mwuPhb5a02Mjr88gx3/FaibY
 mlBp1Ggm1o4x5+6oy/W9SZD5ukcLKzeTBSTk9jQdgAxRSus4dciaFkPRYyo56PC9C660
 qLc5CKuVg/VJtf/1iqmtoYBoA5JzyHgX7DnefvteDZScW+zmFDJZ2CaArAQRBgppTMTB
 rhpWbzocxhEp7Qgr9Zig++zso8b2kZz65AYAa5XO8rRPV9TzzzmebYleuJoldQS2mzMa
 MF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Wx1dpYuJUZQ968LyzlAz8kJnaaQj07UX3PLKHlV1LaI=;
 b=gXTDHWoWssWEY1GxOoqFqAJyIJLAlzSmBoBsgV22MTEW4pZB1idHJ+WygXOGNzwhCI
 TsksC8VF0Erf9SkhnyqtITiWcY2ePVf4yOINuGjaITdqufTr/Qbj0+htFnt5oV71qo2+
 IH96Fxci7gG+iIlFduu+ZJD+xxJW2G5EVptcQnG7FXHn4SCr5S7urmkwOoSm4LmVhuEm
 k2Te74RtfdVLCI6WHmqm8Vv1Tmn+sNQRP/eQPeEo94zutoQquc/aqeOZFUQtno3o9j2r
 14pDcd1BA/FSgvJdZRGlzuUDVzPwayxvUHXdAeTo9KCwcKtHNGLDuqn3Yu1iGapc3Bj+
 VlEg==
X-Gm-Message-State: ANhLgQ2kWgcuW70FVx5CW9ik9d3RnLVEG96RTaNVNgEz8Ia6SSGGC4aA
 qmrfI93OIfSHW8sCWTh9l2k=
X-Google-Smtp-Source: ADFU+vuTr5ChVBFGh9+VtXFo6hMIx5fXSq55X7KB2z9of5LqWuK9vT3xb1gdWe6sQXUk7+ds7fnAlQ==
X-Received: by 2002:a17:90a:c218:: with SMTP id
 e24mr1369787pjt.64.1583300092357; 
 Tue, 03 Mar 2020 21:34:52 -0800 (PST)
Received: from localhost ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id r9sm14792585pfq.72.2020.03.03.21.34.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Mar 2020 21:34:51 -0800 (PST)
From: Leon He <hexiaolong2008@gmail.com>
X-Google-Original-From: Leon He <leon.he@unisoc.com>
To: shuah@kernel.org,
	sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: heaps: bugfix for selftest failure
Date: Wed,  4 Mar 2020 13:34:36 +0800
Message-Id: <1583300076-28392-1-git-send-email-leon.he@unisoc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Leon He <leon.he@unisoc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the 'name' array in check_vgem() was not initialized to null, the
value of name[4] may be random. Which will cause strcmp(name, "vgem")
failed.

Signed-off-by: Leon He <leon.he@unisoc.com>
---
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index cd5e1f6..21f3d19 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -22,7 +22,7 @@
 static int check_vgem(int fd)
 {
 	drm_version_t version = { 0 };
-	char name[5];
+	char name[5] = { 0 };
 	int ret;
 
 	version.name_len = 4;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
