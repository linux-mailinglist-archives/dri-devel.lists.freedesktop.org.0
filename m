Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3595E2D3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 11:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CD110E008;
	Sun, 25 Aug 2024 09:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TWDmUOm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F07D10E008
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 09:00:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-371a939dab9so478902f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724576456; x=1725181256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3n4NDcotA3y63waYC9ChSZVHTLNYfnqOEMaVdu0sMbA=;
 b=TWDmUOm4PCP+eN2UXpRhHND/lJn7KQsIqjp32cc2mjahJ+/DMqAY03iectpKVzXU9E
 LCOsdL5IOaLap09W+kwXY95+7/xTE0Fg88GrZaib3u3AZzwvbaVmKMGBUPcBYjpfueiz
 9Qej2iVbFy24AcCJ42UyDbMZBxojFYUzhscS11Jwwl06MhfyNQswzKkBf5cssQAWBqWT
 I0YW4UASIYIYjkdUrY5qtpjjwsKsLjB+Y8qr6J6a8ZsP01QGt3g6cDGdbbgyZi2v3ntU
 k7Efh4h3x1nCUVvWC8op+PP3+1LR59mWlAn/YvKuMHZqRBTaOMoFE/MGEXMY3GnrrgOW
 jpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724576456; x=1725181256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3n4NDcotA3y63waYC9ChSZVHTLNYfnqOEMaVdu0sMbA=;
 b=cAfIomdIZmYvYm2mT3eKe6NNVrLCxoqUtad/8BVVaujOV6vcEJR8PUdUUSgkfZuhHh
 x2ibwAXFLjojqR4lgvXbqEKhP2G4tiu+mzFdM2C8pL4Jb1laoXG3m4VuQg/uYB+C9/uB
 rq0pTcM13+GLxB38tQS7yYvaHjIa97JcZa952tjxUxH2O8Tk4lkbP9Y/dbHu6CCvGSv6
 fA5aNZfXBksqxRjlvPcCxUAQdAhR/l3OU6Q7c21qtSiTmQJNA1fhrYoec0yu5hm4OL7h
 Kb/yg8cEq1hRshsVKnjf+AQJmet86hBqfZeJhohemfy1ojskP4ZN9h+lpmSm3Y539/oj
 YNXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjTOWjpNUuhjLMfjtiMg1bsLcPtpWichMnoXrIF0c7v/7WBeyHL/YZwi+xU0CoKZuJW/RM30a26ig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZmm6e90Bxzb9dckzrrwIxwljj0jpaIS1uS57oKvlirn5QhPXo
 15dLawWM97tueQ/I0ttKV96lO4T6AAdY48EUpWdIEYkox2j64F6yneBminT6/h8=
X-Google-Smtp-Source: AGHT+IFM5MEyUzYaYhlWSvMHBGsJqUVqINFe9O3P8umMlD6v8D2dpc5UOtJx+T8nsUJsdyoIoUZK5w==
X-Received: by 2002:a05:6000:154f:b0:368:4c5:12ec with SMTP id
 ffacd0b85a97d-3731191d5c5mr2656753f8f.8.1724576456307; 
 Sun, 25 Aug 2024 02:00:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37308160586sm8237298f8f.58.2024.08.25.02.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2024 02:00:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: MAINTAINERS: drop stale exynos file pattern
Date: Sun, 25 Aug 2024 11:00:52 +0200
Message-ID: <20240825090052.22135-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

With last TXT binding converted to DT schema, all Samsung Exynos display
bindings are in "samsung" directory, already present in maintainers
entry.  Drop old "exynos" directory to fix get_maintainers.pl self-test
warning:

  ./MAINTAINERS:7539: warning: no file matches	F:	Documentation/devicetree/bindings/display/exynos/

Fixes: ad6d17e10306 ("dt-bindings: display: samsung,exynos5-dp: convert to DT Schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 028186bb4e8d..c75918994a53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7536,7 +7536,6 @@ M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
-F:	Documentation/devicetree/bindings/display/exynos/
 F:	Documentation/devicetree/bindings/display/samsung/
 F:	drivers/gpu/drm/exynos/
 F:	include/uapi/drm/exynos_drm.h
-- 
2.43.0

