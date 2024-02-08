Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4D84DEBD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354EC10E5FF;
	Thu,  8 Feb 2024 10:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xs8vRBwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D0610E5F3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:53:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso20500891fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 02:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707389610; x=1707994410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jPbaHNpdgRM2voFhkmhteYkFLuMSfGggj9pZ2tYQahA=;
 b=xs8vRBwuc9yXxh+50jE7XLWOnJm1yqp6NRsmPXXu0HvSAIGgqXGKfvIeUxMSePSJeB
 x2L98J1evSoH4rvaGncdZxduCmSBIdbEPwIW7NOI/l7gwCXxr3GE9kOr9jfmCUQYsl1x
 mXtxvtWdAH+n/hd1+55y+oy11+I3mYO9lfZkYJiU4eHFAfLbJMbk/d0OHKECkRtYrE0o
 U1OyU7ffMuaekM8+HY0BabQaiO5WKkK5QmlvDeCJeZD+JqwAd4sO1oJu0xJtVGPOTDbV
 GtfBuv4JE4FX4MD53czXN1t7GTooHwT7Gr3tP2dEClYs0MQIgErdHVnbp4QCnzaYgIuz
 zgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707389610; x=1707994410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jPbaHNpdgRM2voFhkmhteYkFLuMSfGggj9pZ2tYQahA=;
 b=xB1LylJOUrpy4v5Sks4MKz0uou0GQktwX8vlsfh2wFvijK00yuxAtYfV7cXc/LA23x
 fe+mrNCFyTyQOwKn19v7PyaEFVo0VtpBUZLKeSwU76QhbVfC+KdE7vCZv4WYX7fB1JzO
 mcP01qXtFb/mYZSLxnXcil5IWZ1fL+UxBk1SnvLceBkcy8T9G/qtBP2lgTEWGB8EqAhC
 13uAbedJxfMRXnc4/6Pv4iX0wRT5DdaqhLpQz8BjB4FSkuuiC+iR21NtUfcdEXZHZhKD
 uA9C5Cx1X3UlM2j5NgsjYKaWZLpNpNEJWDiDuk5AnQ3gG6otlklI3/yiJWRtRRAMwomv
 wYNA==
X-Gm-Message-State: AOJu0YwJ3Eq+2OpDUk1lrkoeShYcznKYOJks4two0lhZeoqJ9b7v+OV4
 WeJeelO98l2laxFUvGT72xUiu3Vd5Sum+DDQsXXZxLvHBWXFZmDf9HHUJampNlw=
X-Google-Smtp-Source: AGHT+IE6hoYZwYD0dWVmAGmKkSd9PFPDghU6N/6PiAFFxP0tnFnQHDz4xtisHPCpPSjEHYZbbvqINw==
X-Received: by 2002:ac2:5de5:0:b0:511:5036:8e9f with SMTP id
 z5-20020ac25de5000000b0051150368e9fmr5870212lfq.12.1707389610461; 
 Thu, 08 Feb 2024 02:53:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMWuVQrY8stnoRFivkfykW9gfoU0KgAA0ARDUMH41jJObwrwK24UxqnmtnhIh7HuLi36zZF47bUqwTj5/iDe3BgX1D+neH/suGK98ikRsEayZc3frc75Ba8Fxkvlxze2U+vEhHXd0WNHXHobVIL9WGPZ32vWOGgb74yaRruhPZaMWSy0grEws+eImfbxq9E/IMa3BchtzPwYKvf8l3jQV01BoqDCezhbd+Er+vqIHG24dehg7PE3abjSYP8VaJmFPYTI8/Z5BrQzpNQ3Y82uFMdOsTBTIGbKjvn1FwpEiyVWOg1nCTaNswIbhAmOluIBlJQQWrlV0Dq1ssIxvVDMVrqaumY4iiDn2qfZ66Mg0Z05CkG5TRxnQIV09wt/fnmEX2tsDu+/oLfQj66YG6B53ePfamdT9eQ2ykHOnWBFlsxhRcoL4HblQcp5YM7e28N9NoAwISAhmmb3C/TVIvLfKIkTnEAabzfUsgyU5j3t0MPH3NbpJM4MshCNBQsY9uKkBuLUkZV9wV6n3BL5Itk1ZWJpSJH+sqWohItBFunGc=
Received: from krzk-bin.. ([178.197.222.62]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b004100b3c41absm1212129wmb.30.2024.02.08.02.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 02:53:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Bara <benjamin.bara@skidata.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: use capital "OR" for multiple licenses in SPDX
Date: Thu,  8 Feb 2024 11:53:27 +0100
Message-Id: <20240208105327.129159-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/visionox,r66451.yaml      | 2 +-
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml          | 2 +-
 include/dt-bindings/power/amlogic,c3-pwrc.h                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
index 6ba323683921..187840bb76c7 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/display/panel/visionox,r66451.yaml#
diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index 47add0d85fb8..28096619a882 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
diff --git a/include/dt-bindings/power/amlogic,c3-pwrc.h b/include/dt-bindings/power/amlogic,c3-pwrc.h
index 1d98a25b08a4..61759df4b2e7 100644
--- a/include/dt-bindings/power/amlogic,c3-pwrc.h
+++ b/include/dt-bindings/power/amlogic,c3-pwrc.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
 /*
  * Copyright (c) 2023 Amlogic, Inc.
  * Author: hongyu chen1 <hongyu.chen1@amlogic.com>
-- 
2.34.1

