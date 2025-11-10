Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6A8C458FA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677710E363;
	Mon, 10 Nov 2025 09:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Td0PajrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241C010E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5942ee7bc9dso2595889e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766128; x=1763370928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
 b=Td0PajrRCsPz5+ApaDcpY1T0d0vv1iID3MnLFedErfAEW+8MjjGfB37P1S3RWBc7pQ
 vyJuX0tdyHwyWwwbOf+v7BZH3boCn6Lk2y7a8xzPQPsMAIRB5/I8fJiPf+WSqdVWc3/j
 wlxVPuPs1+gSZJZ/2L9r2ZuuVd1LRBWYSUxka39aWG3BFORELUdhj6lMzZ0EHL7Y2nNj
 toaHEnN8qCcJ3fNw/k/lWJNVPZbB3z0nniGXm6I4MF9lCb5DTdDgJJeJpO5rve10zZkz
 hvw4s9jHEtk5g7QG2TnM5WdDzrTJc0nCfzPSQwRUgJG2EDrEFhZfGk9ROYrCHbrQd/fm
 oKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766128; x=1763370928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
 b=ZjDlPX4FdIz1GqiUfcrsi8tb288uH9T8D8cAA8Kdr2+4dSY6wdr1HNWHY4yJThsyXP
 MxTnTv8+GvzNVdFKVpWpT42VGJAcPqQH9naYUp91fw/zG2j4pvPqVFWksr9Y9vRC3W/v
 42GnNPvWOw0ZIAPQ2zGxXS8idr0S5sl53PCa4pvEIKn4e9yqHef6ymV1PKePtpkaAg4s
 l1tNg4z+lpYwnmJVoOsaltchcNIKxDcEmXuXzjsCczFOo/wXHGRPCpR7B3fvKGKfdOIe
 MmZWH0KpuWt+voCBkLOf4VzeZ1H8UdRL1fdPaBpMD7zcN8cF/a9BtmA22ptkr1QER8p6
 mstg==
X-Gm-Message-State: AOJu0Yz/WGnDZXQVXSvrnG9SYzLGVo5L8ftdN38E8p6Lr8/eEA6HFuRu
 wzb9nEfIkOtKbiklUH8OJaowxjiv2Po/b+2fFWkL2c/fenTnHej8kJ1u
X-Gm-Gg: ASbGncsdUejHRyJkJP72RE0o0Z9TpCK4kJ/A3jy4CnP2B7eIxxYCd58SKa2h1g0/9/E
 e+jchYiGXjZibCUiG4dvcEikUwJrJqn+T58c0VbVme63jWaGFY3DeB2iX3aKK4ZFFq+pRTjCTti
 H/ZNThX4exDZzN9mBr0ry9/U3DhVf7Pe17329FitOpG6wDmOPKa6Q+ihyD9BeSv+pxGzopp1nKk
 f81QxJQNP72iFW1TgJ8iVWIj3xZsr/otWZweljkEjMXdqrMzDawvFPzdsdMDkVE2YM6HhoCtxEa
 6Xunyg1tOHxgR1yIHE2EtVeL/Oo/hY6kdtC5YSwj6M+ZuwD2b6ShF3a0sBKVkZLGiwrwS0Euyxm
 JnqV+1FlPl+bY44ZPR9JDNrREbpeYQwoTBIlNlt5oxznw7nXb8UR/xF0wIhKFAS8QnbSZRfmQDc
 4=
X-Google-Smtp-Source: AGHT+IHDS3A8pXlI+xOx72GoRTOq1E/nxmRQrFx2InRcqIyyMLoPJFpVA039XzbqYUYjEi5dGijE8Q==
X-Received: by 2002:a05:6512:3a8f:b0:594:2f1a:6ff0 with SMTP id
 2adb3069b0e04-5945f1653c4mr2154809e87.9.1762766128299; 
 Mon, 10 Nov 2025 01:15:28 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/7 RESEND] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Date: Mon, 10 Nov 2025 11:14:34 +0200
Message-ID: <20251110091440.5251-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 4a5ca013d0db..adb244460a09 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -274,6 +274,8 @@ properties:
       - rocktech,rk043fn48h
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
+        # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
+      - samsung,ltl106al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-- 
2.48.1

