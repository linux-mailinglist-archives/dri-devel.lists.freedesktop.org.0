Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D7AAECD5
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7536F10E89E;
	Wed,  7 May 2025 20:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MLImaZ4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541B710E892
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:31 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-72c3b863b8eso141785a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649348; x=1747254148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2wCsPI37yI3kW2PZlC399eWtWxNv3NVwnKhYRGNZB4g=;
 b=MLImaZ4XYJuas+dHphv7KX66dwuaPmu1Mg0akd1rKhei0xR9iQitLF7VF/Dwjn3stw
 v+yoBlN3/qvbXpKNn5FDgS8h7ygTFYsB9kxlPXp4MKBnLyxu92IbiJ3HAli0lGOChSD0
 UwqNGM3hfhyxkPt94Lo7nK6K8AShjfeUpwZ0hRXmCH5qPjltRhefCuzIIEN37pzSp8jG
 a+OBhgtu73/WN6syqwrfDdTvllPdjGpEXAnrxH7r3FXsb5Tj5XxL2IFOY0cPCMpBASJ4
 uJKiQyYL4+CVt9KpDFXwBxzMTNtailWqjHODbR7EkdyihPzMgrfwDEjadnWo0xg8lFn6
 r+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649348; x=1747254148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2wCsPI37yI3kW2PZlC399eWtWxNv3NVwnKhYRGNZB4g=;
 b=MDQTCbrH0+jfOm0Y7jYrVk7OLSdYUAJ/sNOc0Nqp/sgt/gy55HL1x4qYm70NukLvs7
 Qf1AmRCxAr9yNqp+mY1hasrhpBiaeRxyF2WFnLDbJVNS8zZunB0kszs5ksbqxAwoM4oX
 xhYNg3VR9rfSCbjBwULPTs6x23VEReohv0ZEUPMoe+mb1BFnz/QO1hWQ7NRf+N3RkKZ5
 tpbw3VMubKukRPCjD+Qt6MIIjmzrwzCeRluDF62BJ3d2Knyo9hZWZblh5qrE7wQf5F3X
 aQnc/FjhcdvRcwziyUrKJ/bv+O4cpeG7Cx4BgnQLa8Ilj+5pqg9+pyrhAMJ58CcUz7Pk
 5cmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX17UKMifUc0SYheACwMQdxuwvGvC2uggiKlLC1oQRFY44Q24yixKabJQspwTC7hyPk0BIE6DS/uz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6kUV3BUbpBGrBTGvDY2Ts2xOmN7Iy5ZhQWM5Lk79zdYIAkUyx
 qPsApKRewyQlybrFU5Xq87yMHOlTTeuNBsG1o+Z+ZxV3fyGsQYaC
X-Gm-Gg: ASbGncsZL4RZTGD24IZEWOZiSgiNSD6Xmju88JFk3EK4rnIYO7wMAY++rUlQV8hPo2f
 YWXIsNG2HIIXi/MB6OOwturulqTnYlb5iK8nS/xf7v0do2FT6GTRZOHM6WEkVvb92sJv1Vjddiv
 xj/DiQ4eBEcu3W3D3tHkv5wUDlakqYMu6RnUIFJ4/TP5cWLffYsBg8UXmI3byKjLRgLctvADkYh
 +7SuoNffS2OeYe6aiOyvg+RfeIxJm/rWcPRZPB2m5pa4UUBkCkm0hLeE+i/or9uiQcW6QPzA54i
 prHPbGPP9PZ463l3W/vGG5McjBG8PDCeG4eKQAivNV0Opi6hCLUje6ir54V+
X-Google-Smtp-Source: AGHT+IFytOVfXojJmCR6jJHFmx4KGJn78CqT1+wKBNfjDiJd69/px5acPIOn7PhMAV+YoSaRnITWVQ==
X-Received: by 2002:a05:6830:370f:b0:72b:9fb2:2abd with SMTP id
 46e09a7af769-7321c97d487mr523435a34.20.1746649348140; 
 Wed, 07 May 2025 13:22:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:27 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 01/24] dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
Date: Wed,  7 May 2025 15:19:20 -0500
Message-ID: <20250507201943.330111-2-macroalpha82@gmail.com>
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

Add the required LVDS reset binding for the LCD TCON.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index 81b1eba2a7f7..ba626f7015b5 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -69,5 +69,6 @@
 #define RST_BUS_GPADC		60
 #define RST_BUS_TCON_LCD0	61
 #define RST_BUS_TCON_LCD1	62
+#define RST_BUS_LVDS		63
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.43.0

