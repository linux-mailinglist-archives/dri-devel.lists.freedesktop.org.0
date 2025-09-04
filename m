Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CAB4782E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130BA10E430;
	Sat,  6 Sep 2025 22:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jjTwt4pI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0C510E096
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:22:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-55f7a34fb35so423147e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 17:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756945355; x=1757550155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBiYrOPvN4WtYOzD+XOZybGex05ltnyRorDWZhkE7SE=;
 b=jjTwt4pILwIFBNWEwwK83mhnioKxyGGWhl8hH8dHkHK0IXPs3nBQgC4BVG8cGAcTF/
 9apdbMxBTON2ZjnlYDvPR7p6gZ5eL3e/kWITL9Q4NZ8Uq0jhGWfeyADW/pDZ6cuFhtxy
 5F/ct1vszW1ZKimNY3P3VPUjmGwwYUx3LFnRMA2r4aTDO/Dhnd2uiE4iGMRZXPJHYiFB
 MUkAjlUWg8Csff+yS5Hq4mgC+/PKf4pUbuxql5jc7VNay0lXYbQq+Sco7iarJLjPunz1
 RVPj3fmnjmvpJYAMLOqAcqmpuvhSQqE5pJbjzxveA9Y8Y+ffJg1sda7oZms6+p7+vBkF
 31Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756945355; x=1757550155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBiYrOPvN4WtYOzD+XOZybGex05ltnyRorDWZhkE7SE=;
 b=JGBB/wDbFv5dDkowsmalrRAh0WQMojfOkyc/WLNo9lR4PzyZajOdS3uFdiZ9p6dtcd
 jlcK85Tn045O7ZLPcM3ZPAc1uyx4SXtpbrk/Hzshwl2tcfFqIkioXohKDyicVv0Jsy0x
 ncpo8f125qmlNa8ixSgUABIc8vOGShrwTNHEn0+CvxNybcGxWcbtsc8M9c8jtvpbhkJ4
 U2Foy4h5go/4NJjO4sWw20OcRuY3dEfSc09BYigwLe0wV4EZAv9VF3FjjOgzWdJ8t1Ni
 1owHgH5nh99XioZtmwLa66MsOApVI8Tni17RdjxmpVuZaWMxFAtfwGQ84WZkwJ4Meam0
 1NUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN0Ec6PQqNXCgySqPLALxZ+0xVQtpOP9crw3Fw4HSpHYdLHBSUjNG0P3cBswd1Muu2VtkUk9E9keQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtORYTfjqkYUENYthIDhl5I9gzFquZsTuobUhHw8O8eQtyQu/a
 /ZjHQg2ITmFcdw8D4orFmj2IRqPJpBuRe3WDnmjZy6jcVNANALKCMDUS
X-Gm-Gg: ASbGncux17xftKhGdOW1HTemLfAfIT7dEdWl6qoljbPDOZpU7magWm10legxY4Oj0HX
 vqfM4PU4vYn+0jfqyaRAhwRtIBnL5ZaohippTwfC7IKVW21OUomMruZrzogCf8eiHw6NQkSTLfD
 hHa7YSXokEiP+FnjYXs7e7a1Pm9ejKF3isczEFZJzx08v7XWssoS/kYqXlW50zADOzFvTZq+YZI
 fJO58zFEZ3EhrLztxl34UBP+1SHUiijeXSByGsI9RKUY4DDyBIFzg5yuZROkYJWAMbGmZ2jCxB+
 JkimwmZJAm8HLXt8p8/VFV5PROQcrLz8yysAt0Lo6q3nhFwQtlSvSz4UVX/O/Gg0X7hqDlpTY5A
 q5XV/Bdq6sfKV4Kp7qlhYTLok0QFKy4xOmzs9IqaAAHw=
X-Google-Smtp-Source: AGHT+IE+PeRboNKszfEwJx2PTkwP/Zj2Dlb409sTUk17eJ8SHjk+PSW8lBvdHfx4jDZY8tXEZr7agQ==
X-Received: by 2002:a05:6512:6512:b0:55f:391b:54df with SMTP id
 2adb3069b0e04-55f70955022mr4200036e87.47.1756945355383; 
 Wed, 03 Sep 2025 17:22:35 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab8e95bsm821613e87.34.2025.09.03.17.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 17:22:34 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH 1/2] dt-bindings: display: panel: Add compatible for STARRY
 xr109ai2t
Date: Thu,  4 Sep 2025 03:22:31 +0300
Message-Id: <20250904002232.322218-2-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904002232.322218-1-vovchkir@gmail.com>
References: <20250904002232.322218-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

The STARRY XR109AI2T is a 10.95" 1200x2000 (WUXGA+) TFT LCD panel with
himax-hx83102 controller. Hence, we add a new compatible with panel
specific config.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index e4c1aa5deab9..37f4187698e5 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -28,6 +28,8 @@ properties:
           - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
+          # STARRY XR109IA2T 10.95" 1200x2000 (WUXGA+) TFT LCD panel
+          - starry,himax83102-xr109
       - const: himax,hx83102
 
   reg:
-- 
2.34.1

