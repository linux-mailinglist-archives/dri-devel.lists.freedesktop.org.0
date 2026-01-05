Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EECF286A
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 09:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823510E332;
	Mon,  5 Jan 2026 08:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XWePOv72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2FA10E332
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 08:51:38 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7b852bb31d9so15931101b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767603098; x=1768207898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSJakbOsK6HuPfvndjr4pklixI6V6EaaZEWI2YnlWqA=;
 b=XWePOv72LeWC38wfS3ksCEuRGHNeuTNASMvewW5DVX6UdoObo70pUkIq16gbTPDlCU
 9B+kNOGFyVdjZ7D3crMM3YwPP1BOiAjioFQwfarq717Fd5Sg/haVqZf8/0Uxl/x2K9Yf
 S71F9AlA95WPpGdvHo4DR0G7dpmswGDSE5W1VaEWDNTiOvBfjM2SBc/wVrRB4hyle3yp
 FTL6NiJjmGUQBdC3KXW38gv4prjQsbiMwTBPhvRzmFhrQb2vduWII/vi9YVOkha9HLm8
 qYcDNmzIq41YPPbByvBfsyXU5/X8ltOxQpnhNjYEk6gg8B66remeyfE6zbqwrQA68lC1
 MV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767603098; x=1768207898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jSJakbOsK6HuPfvndjr4pklixI6V6EaaZEWI2YnlWqA=;
 b=MnRzvWI63Lmzmv7zr+CHHxz3mgaCP1vgiN3PAi6MI230Knv8X6zyOZJAlK32MYtetB
 eZiqApWoLDlVs91p5f62HYvpQ6WqIoQyjb8Y+8yBY1DU8wt+gyH7WChmK6dVVRdFFC0w
 GF6KsXb1PTHxfq5nruvoSrtyOCfXqDLxZaf2W5QYaWSnsBSYvH4Sas1+cUn0BC7W4kzA
 nrtDuF1FDe2B/s4cjZSr8Ogv4zY1JVaSjJ5b0a/54uf0x84+xBgdkFuhhPnBdTxQVkY+
 9T6+T4yufWm+WMwpWNYM8/5keO+oFPomV9ZyJ76ms1jHk27NmMjrwUSeOgcmoPBmsE94
 mIaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAsOAaM/s+RL2z/s3/2AFBee0GSz41iw9q4XwWtn9b7dRc4bebg3q4BNyPlzKXClFOJo69Q6fcteY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwHYVxVp6Y9Vpn9ACYLQ6AzoNUBarblOeIrjm8CmysikolK+m5
 0OgobpgftA8f0iVPZZtG8/7Y5SXqmjpk3bp+h9CKodz2Pk6Q3Op6WEz3
X-Gm-Gg: AY/fxX6eWBTvki1wu/p4gXxcjSVPZ7RBmtFj6sYQIf6LYJt60J1SndKSHtIxIyS1YLY
 NazWbrPIhvecfyhLyugQjmr8LpCtw16ClRdOz6gUPU9p3rNfj+XzkhEuAlPBowLylTl6ae09rB0
 uJxHKwNAjM0f0zzOPLDpRn1m3dH8jgDwcy3Pr0CUB0EXWRGk8tPg3Jej2xE/v+pTUZTvOxN0MpM
 K85RJO4QzDX+LPoyw7HjPXhnsNEJp0jd5wnFGGsLP2HS6OL52Cck6VWH0ktckVWMSm/vkKxFyyt
 +WPqa6opt0UtIItHKqx+4P3fM+5ud58AjSrb8+f9/PX+hMV4igb2z1o6uI6GldMUsbpdSZzm2wr
 um6xdDatpWJlDjWR18fpe42U9luF1U0KXznuFKIHimLQAUpx6TIslh6oQWxMxylxXtMiGVBRv0u
 OajcNOZNPPL4/54wRvcRJD5Mx8ObI29jjrUyq/
X-Google-Smtp-Source: AGHT+IGdSTNTsFlnHGoKbBjCGcgH0vsgwPkGV6SlKLkkpRQlPt3vpratMO2N1qpXOb9AsWAQeM28kw==
X-Received: by 2002:a05:6a20:3d06:b0:350:7238:7e2b with SMTP id
 adf61e73a8af0-376a81dc150mr42017932637.16.1767603097900; 
 Mon, 05 Jan 2026 00:51:37 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f476fab12sm5631951a91.5.2026.01.05.00.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 00:51:37 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow multiple
 GPIOs
Date: Mon,  5 Jan 2026 14:21:19 +0530
Message-Id: <20260105085120.230862-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105085120.230862-1-tessolveupstream@gmail.com>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
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

Update the gpio-backlight binding to support configurations that require
more than one GPIO for enabling/disabling the backlight.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..1483ce4a3480 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -17,7 +17,8 @@ properties:
 
   gpios:
     description: The gpio that is used for enabling/disabling the backlight.
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   default-on:
     description: enable the backlight at boot.
@@ -38,4 +39,13 @@ examples:
         default-on;
     };
 
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+      compatible = "gpio-backlight";
+      gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>,
+              <&gpio3 5 GPIO_ACTIVE_HIGH>;
+      default-on;
+    };
+
 ...
-- 
2.34.1

