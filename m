Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E11AAECE4
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DB910E8AD;
	Wed,  7 May 2025 20:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mFccSIjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073E410E8A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:39 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-72c173211feso67535a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649358; x=1747254158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mIGvJTufAsSoppe4rs7rmEWLnBgi1PHvYLOO81jKxw=;
 b=mFccSIjDrfK/JA/whuAuXf3qt+JB3ZbXcbu4s6DwRiT7YrXr7z70cnR1QfWa37cfpI
 xZeDjwwWSb2Qx/IN675hk43fya94wTIQuhkAdMtLV0BA/SG6sndufUL5US0e50StiCU6
 tj34X5B8WNu1+D2W8U1i636RR3WhpXOkushrLiWaIJ5OMirXL6T4UY1rcjN6SYpcX/WO
 D4BeTZ4srEslUR2Bvyt3d/t5qp4rocm1mZ1dCiXrCfL5TQoyQaLkJeaJu5wItKlmMq4y
 vDrT5zees6Uflk3FqRMdiAV9sCDl0S8NsGdeM7kBIH9rnfQaI7ezZqXDq3HBmB2Zynon
 kIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649358; x=1747254158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mIGvJTufAsSoppe4rs7rmEWLnBgi1PHvYLOO81jKxw=;
 b=MVMUOJWfb5szSo+k7IEYqxu0qUV6Lzj1N0A12nvA21VfvHE/IUFb5Asb/bRMWUNhG4
 TCkjAH49Gjq6/GklOspQZcCKyzGrEgwrGBfrhbd0gAYPclWd12w6WGiAScZq5hs7iL/c
 Pwe4QF0WPvKKB6+RX6jUSh36qjKquiSLaaSzbZEVx8yDOqIUg1lEBuf+yd4sqHq9nzpy
 eDe7+cLSSo5o3siCIlG1W2bHKj/7U23G3JH6pNVD+2aZyUfuUU8I5wwnUjwxFIYEFntH
 +F/Bxzvo0DRQfHQevP2GsBeuoRy70cPug7t1uiz+BdimiU14Sjf4jciN86rZgM3QUucU
 EQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOK1Y9xfjZ/XRJJqiv/WkciR4JiLBJeWW+ENHL+W6PewwM81HVB++iUfXWmF33AfJwV6Ujt8cuZ0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2tRf5KgPvzVhVXB0zbokXQcJ/vMlj6bxEh4qmhUCXbgWwmJQH
 v0YK2BqTFoG9/+Zk9k4Kup6WoSIbPoRk2NYjz23act2C0+rwF5+L
X-Gm-Gg: ASbGncud7uARQp6QfM4VPM7T9GIuI8nlm9tkZxlUqg7qR4PTWzfaROLRW5rY/PdQvQC
 ADxkqBzAw46ayI5Xm4ioYhCgdcasLVh6akxbOZkmTzK9jtM0pXw6YQ6Dmg+4p6mZ2IYJDmiXlcG
 isMKi9dq9Ndu1eZ8kBzZHc7j0nxxiWS4tgyPLc0nT1GSWVQerMu3Q+2YIlAKeL8724ciqoBIxyX
 r2y+jSGR25G8eMHHZXYebMK8SSmtcpILP/OeStLwo8PO5aKSY7PrRbnLbvSGO1ZtjLuQ/E+trqL
 HVZNbpavNy5V3SZK2Ag8mQlHH7Nv3aOgs/BwJse67UQAibZA8Q8dccXqjjKl
X-Google-Smtp-Source: AGHT+IHcSoKFAVM889xXWDRRESTkmKZwmdTzBlBWvS9Mz85bqYtY6rkC9bb+3ND5pNYa+fTL+SOn3Q==
X-Received: by 2002:a05:6830:d83:b0:72b:8a8b:e032 with SMTP id
 46e09a7af769-73210a6eae5mr3335106a34.2.1746649358256; 
 Wed, 07 May 2025 13:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 14/24] dt-bindings: allwinner: Add TCON_TOP and TCON_LCD
 clock/reset defines
Date: Wed,  7 May 2025 15:19:33 -0500
Message-ID: <20250507201943.330111-15-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
connector. This requires additional clocks for the TCON_TOP and clock
and resets for the TCON_LCD LCD controllers to be defined as per the
T507 datasheet (which shares the same die).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d767835..2a12d047d2e1 100644
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ b/include/dt-bindings/clock/sun8i-tcon-top.h
@@ -7,5 +7,7 @@
 #define CLK_TCON_TOP_TV0	0
 #define CLK_TCON_TOP_TV1	1
 #define CLK_TCON_TOP_DSI	2
+#define CLK_TCON_TOP_LCD0	3
+#define CLK_TCON_TOP_LCD1	4
 
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
-- 
2.43.0

