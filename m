Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F26B3D38
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 12:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF8B10E2D5;
	Fri, 10 Mar 2023 11:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46E710E2D5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 11:05:51 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id y10so3362484pfi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678446351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mGDXehSv6v2/D0JVf9XtETXZgmT2wS6LdL23tIL4g10=;
 b=ge7D1BbJ4Alm9bFtz18cnSDZjuLOmJjClVb4OQIEIZvKSELkBpUdP6juxrj5O6os2H
 nAnjjZGuWn4/iw1eb9hBi6I62RapyKOq45rrwmydepWzKiw83ltKiPXl+VRArXzgcl9I
 6HsLXRa+HMrCSFwSI54Uh9O7kuH3nYPC1gJoPrcxZIgQb7f4fkBvNKMbYuBfpOrCeTBi
 MAeQ3eNif4CceQr71Q9JPapootB0ACJ/LeB2rd2IjeRW2Nuc1fB4JrpvinElR+lu2aeX
 WWOFMZvEPF836T0YEcwt7W9wycvOMKgRuDulX5GQbsVzhyj+ANTl6PaSI7l2beWfJIUX
 BnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678446351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mGDXehSv6v2/D0JVf9XtETXZgmT2wS6LdL23tIL4g10=;
 b=LvhirhNB/dlvh6h9WbV3Re0VOcv9f3tmH66/QxQQR639qmksr+BRXODMGWLtuKWnQf
 HgsAork++2Xzu/M/oHz+4OZckpzhkiQ2OgtrLTdZbdSNCh1SG4YXHBL+YF/ha2kYMXfD
 n4VXV5bvhoMGY8NAZObbmn2v06eebswgks1zHbRQDjvRw3F2nRUGTlmCNACuKhLpIQL3
 /ysypjgUxYHJhpEabXYroP9DZXPi1ZSX3x3Efe5dJQ2Fb9c28DI97O07MYoXEF2d3S+A
 zSt3hZMN7AkXw1gAQ36MhuURabC0ce/8LbUovaPg3FqCUr5svnfhKqgmkjiiG1O9W1DS
 +xoA==
X-Gm-Message-State: AO0yUKXvdeONrpshpdvDPhHHo0mwo04sw1SI+VbLgerXn7e0yWXFUc7m
 FRaaZ+jK7VaGdN+dbo/TXY4=
X-Google-Smtp-Source: AK7set80h3e9ZU13GZnCB2/z6kk4c+Jx02r0J4nPo1t+JZz1/n6ZHQufX+AkCBRe8Lk+QproaTFffA==
X-Received: by 2002:aa7:940b:0:b0:5a8:b705:4dd3 with SMTP id
 x11-20020aa7940b000000b005a8b7054dd3mr21395673pfo.13.1678446351208; 
 Fri, 10 Mar 2023 03:05:51 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 h12-20020a62b40c000000b005a8b4dcd213sm1170602pfn.78.2023.03.10.03.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 03:05:50 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/mipi-dsi: Add a mipi_dual_dsi_dcs_write_seq() macro
Date: Fri, 10 Mar 2023 19:05:42 +0800
Message-Id: <20230310110542.6649-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: phone-devel@vger.kernel.org, Jianhua Lu <lujianhua000@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panels with two dsi connected (sync dual dsi mode) need to transmit
dcs command to the two dsi host simultaneously, let's add
mipi_dual_dsi_dcs_write_seq() macro for this kind of panels.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..d0f0f75d4d83 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -336,6 +336,21 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 		}                                                          \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
+ * @dsi: array of 2 DSI peripheral devices
+ * @cmd: Command
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)                   \
+	do {                                                             \
+		if (ARRAY_SIZE(dsi) > 2)                                 \
+			return -EINVAL;                                  \
+		int i;                                                   \
+		for (i = 0; i < ARRAY_SIZE(dsi); i++)                    \
+			mipi_dsi_dcs_write_seq(dsi[i], cmd, seq);        \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.39.2

