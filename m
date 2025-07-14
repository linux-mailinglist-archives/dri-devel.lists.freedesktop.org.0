Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48018B052FF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF6410E544;
	Tue, 15 Jul 2025 07:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFYkBoca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF9F10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 17:36:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so4069901f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752514588; x=1753119388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMORlJFstCu30eoDehbfDqzhHnI2qIre3FxSZT/6bX8=;
 b=fFYkBocaMi4GhjJ8g1M2K4i2Cfuvt7UMP4pRVTLoaIgfEXSz9qgoQzvvMGAPfxbkQG
 li8j5bsF6GIMUDo6CA/grjWpG+EFseEsSVEX8CjSwVyhC2oCDscboq8gcpixJ20y3KWb
 tEJdCr9ZoKv9+tN4rm0QSCbtjaHK7ZXVyp4Ofp+9FqyX6KPWLgaQM5C29z1y6j9DsxVW
 VMWjkI+F5XaGS5exnXDNq/CrhZ9aOO2fr7uyFij4NkTbiKj+o1YDxk9oY16r8/b4IJi3
 t/6IyaEa0NDuxZth0m55PDKQhJ2WWkeL1gS/7lRUYxGPhPAwWY48s4jwExYb2IxtBdYk
 uxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752514588; x=1753119388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMORlJFstCu30eoDehbfDqzhHnI2qIre3FxSZT/6bX8=;
 b=j7Gx8XjD9l0lVZucy7IVdC69QgSkTTCvDDw1tQPuyHQ9apdzue/kX9GsBkMOJzoqKY
 E4kNHxGwqXh2S9bQNBKnfTFLcNiHXKA274fBxOVPFlVENPgzrlc278Z/50UhPUEPmYaL
 1n0gLCAagBC45oOBhjum3tT0jQhsS69yuW2lUV+hSGhViwoQCNhDDV5ca7Yt5UXw8pdd
 CeXCJbRoH11D7HS7nMGY00iy+aZP56MnXyHfeLb0Ptws4h6QX51qy/E9ILD8j1SjJm7R
 O5YPvICy3R1z2ZgnhfO+7xtg1qRzhKFIPRkJ7lrqVBFpFfa2B0JKm4S+F09FkVkuTsSo
 SnOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+9xq2tPynN9xbwVNZ8T8HP8wGyGdaM7rH6BHtf3DxJxEuh5nxwGYIvbel1w9WtrgdPRvU/w54tp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxipSK9OMXl1dyFO8qfB5gg8PEI6OYlUSiNkzPPWJ8pt3DbddWe
 ybbk8R7hLvNrAexpWUtqSNLN2SJ1MrdKile46vocNVJ1pK/W5qU+SxOV
X-Gm-Gg: ASbGncuSP0+f23/w0A9MDqCl/vrL1cILclpve56YUUd4VKFrKVwY22Tisa+oWJKgKIi
 hz2Zt4m5kznPMM64wXxGosVRGqTcHm4OXkAsR83ozzhjZtR3VaIGKFsNgaEdENcMKue0jQCsPeA
 5kQDZ06fS0u+g+RLmci40D7gnR2kmcm6N6AEfn/RCilwaq47StkG9wQx8BVxIXDpDpXq2Pqxc6x
 XhLQL0KwWcVzgJKDEf4/Q3ank/CSM/9KIknAb4gH7mEt69Qd7BskJ+c+3w5nvPRDCub5HdOvYne
 5+znTPgkwFWa9lkBk3sa63zYlJE/U7pqmN3rqLIMKhgM56LiQm4oE4hrDQdrPrOUwfDTcW57nW+
 zBsGmg4YRJ7nZcT52LyCT5QZ0OxaYg4duqJQ=
X-Google-Smtp-Source: AGHT+IG/PVExtP/WEztpoYPT5TAxxypHZ9Dem6h6Z1iXLOh9gPpqN0Q+vxVVWdYcuYu48wCDZrC55g==
X-Received: by 2002:a5d:64e2:0:b0:3b5:f907:f263 with SMTP id
 ffacd0b85a97d-3b5f907f2admr7131124f8f.31.1752514587610; 
 Mon, 14 Jul 2025 10:36:27 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 10:36:27 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: display: panel: samsung,
 atna30dw01: document ATNA30DW01
Date: Mon, 14 Jul 2025 18:35:38 +0100
Message-ID: <20250714173554.14223-3-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

The Samsung ATNA30DW01 panel is a 13" AMOLED eDP panel. It is similar to
the ATNA33XC20 except that it is smaller and has a higher resolution.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 31f0c0f038e4..e36659340ef3 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -19,6 +19,8 @@ properties:
       - const: samsung,atna33xc20
       - items:
           - enum:
+              # Samsung 13" 3K (2880×1920 pixels) eDP AMOLED panel
+              - samsung,atna30dw01
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
               - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
-- 
2.50.1

