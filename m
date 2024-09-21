Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E186497DC21
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 10:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2959C10E1C3;
	Sat, 21 Sep 2024 08:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TTPrqwjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4547B10E15F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 08:17:39 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-535be093a43so3573833e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726906657; x=1727511457; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wmjLhN45ALPPiR+iRXWQ3K4t8AHpJus0NbAIqkjIKHc=;
 b=TTPrqwjojreSxotP7PjlLhdGAb4wWGuKCrg/XVgrRc67TlzymP4LwPXd1J7v9ZTN+B
 2a6CthtpmYysKrGNzfKcH4hRfgr4UYm6bNScdryRMMxOpSg7OH5y8VEptlvAE+9g62bD
 b4SOFxfS8PRWyva5ZU5FqBYeT+fg7dpo9V1oasmzd0hq8B8vD3iY9NMj86vZIjSFrhex
 k4pFolxWrY4xdUb706q0EhA67260XShXW2NiPtLDJFjeDFYXC/Bp/q+yh4t5ST9gto75
 cBeygErouWlHwmguywWdOy/YI9UBco+Yy4MSTz0Zdkov+/4QrsOvXpMiSEmkLMkENBt1
 GJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726906657; x=1727511457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmjLhN45ALPPiR+iRXWQ3K4t8AHpJus0NbAIqkjIKHc=;
 b=ZhrAjuhU4az1bvuQ//VJPzT/o8yYi2v7iemLVK0zbHReQIcNSe2zNTt2q4SucDVxqY
 E7syIcbJfe2DqgG7FLWQNtTKgsMgg2MmhmyxwOrptGZ2fK+vl9C9jssNXcDB0bKdbEXN
 Ya62oYzBL4s05kWpM+ILE6+s54bIuQkS79H6EoM69RkHb/QJcvoTDNltDn2f0FtfD2WA
 EAJKXYKt1JhBtY04p78BPyA8OXtXvFCM/lfrUWq773KB6y67BdYQKTMrI+TsYhoyTXEa
 DPp/A9VOwNLhBsTTS64fVU9LSBLEXQu5mozBKIkhWYJQ9Z+VsmEHpifYLh+NkhRUYEaE
 SfJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZs39hfrq6JjSoQeZjJGMRtV6wM1zZNCUGEJlM+DREz4ySQOtH8jjYORwLCT3GZthzRdavDdRGXXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYou0omfLowdXZgbkhbCEx9EhboDRcPJI2HouqOQ8QssLX32x8
 eP2uKtZafWdW2brGwKIk0eLUG4Nz62nWh1YF1S144MO6355MB+kG6+CuGVL0Zy0=
X-Google-Smtp-Source: AGHT+IGxbdLlaIHZI3XMOG8yIZU4pHHubytur/pR5AgxpylOBi198gvBqPuSta56H37+ZeQhmJjWRQ==
X-Received: by 2002:a05:6512:12c4:b0:535:6cef:ffb8 with SMTP id
 2adb3069b0e04-536ac338a9amr3458360e87.54.1726906657229; 
 Sat, 21 Sep 2024 01:17:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 01:17:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:29 +0300
Subject: [PATCH 1/4] drm/msm: move MDSS registers to separate header file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-1-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xLM1ISnVwa/GRZKkuzfezgSM5E3kbR2k0DPUIeRVKCA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q7RvmrvSzz6qY77lq3Y239d6FM0cAjy46E/LzRb+T8l
 7k7xzuyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATWfKD/X/tKw3dxFsN4Ym3
 YpXVTZRYN9jL5NXWnOlYHOdqu9t9jWvgkaZ1dg9d/m195H6t7pqhXHZW3vPbCv1xiybfcZVc++V
 Dpt+F+mzlxzUmP1ofvWll2bBo4S+FXC9uy0ym9lCl9w8LbgucNHoix1W5a5bYwzKbPX9L3Jju2H
 VOve4vPsk2Y7K33OLwstK9t2LUFy5huLT0oIqVwgV7nT+v7z49EbNsq2WfFa/VM9tb7TvDfvJ7L
 1N3WOb5/1ebqSTvlijxz65FZ2y09hxzSJ88tYmxLs6zoXjeeTGFJYWhLsvepWpK/85wCVr12z3W
 jc9xzuuo6wzS9luXBKZYamvWSKsfZvv+tPuFQRuf9rY8AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In preparation of adding more registers, move MDSS-related headers to
the separate top-level file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                   |  1 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml | 16 ----------------
 drivers/gpu/drm/msm/registers/display/mdss.xml | 23 +++++++++++++++++++++++
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 13110fcc46a8..db2174e2efa8 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -210,6 +210,7 @@ DISPLAY_HEADERS = \
 	generated/mdp4.xml.h \
 	generated/mdp5.xml.h \
 	generated/mdp_common.xml.h \
+	generated/mdss.xml.h \
 	generated/sfpb.xml.h
 
 $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
diff --git a/drivers/gpu/drm/msm/registers/display/mdp5.xml b/drivers/gpu/drm/msm/registers/display/mdp5.xml
index 92f3263af170..8c9c4af350aa 100644
--- a/drivers/gpu/drm/msm/registers/display/mdp5.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdp5.xml
@@ -9,22 +9,6 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 <domain name="VBIF" width="32">
 </domain>
 
-<domain name="MDSS" width="32">
-	<reg32 offset="0x00000" name="HW_VERSION">
-		<bitfield name="STEP" low="0" high="15" type="uint"/>
-		<bitfield name="MINOR" low="16" high="27" type="uint"/>
-		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
-	</reg32>
-
-	<reg32 offset="0x00010" name="HW_INTR_STATUS">
-		<bitfield name="INTR_MDP"  pos="0"  type="boolean"/>
-		<bitfield name="INTR_DSI0" pos="4"  type="boolean"/>
-		<bitfield name="INTR_DSI1" pos="5"  type="boolean"/>
-		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
-		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
-	</reg32>
-</domain>
-
 <domain name="MDP5" width="32">
 
 	<enum name="mdp5_intf_type">
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
new file mode 100644
index 000000000000..9354cfffb730
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -0,0 +1,23 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="MDSS" width="32">
+	<reg32 offset="0x00000" name="HW_VERSION">
+		<bitfield name="STEP" low="0" high="15" type="uint"/>
+		<bitfield name="MINOR" low="16" high="27" type="uint"/>
+		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00010" name="HW_INTR_STATUS">
+		<bitfield name="INTR_MDP"  pos="0"  type="boolean"/>
+		<bitfield name="INTR_DSI0" pos="4"  type="boolean"/>
+		<bitfield name="INTR_DSI1" pos="5"  type="boolean"/>
+		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
+		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
+	</reg32>
+</domain>
+
+</database>

-- 
2.39.5

