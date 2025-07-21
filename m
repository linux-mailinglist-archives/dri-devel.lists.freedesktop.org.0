Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D98B0BF42
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA2E10E49A;
	Mon, 21 Jul 2025 08:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f+Ju0U23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA65A10E248
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:01:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-23602481460so36543725ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 20:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753066872; x=1753671672; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PeYY2jKAyAy50EIOGhDJneDUVR7+rcSPzU7tXyVM4cI=;
 b=f+Ju0U23L/E3oDeULR0+NBZiY4XicqRpaKrqJ+XtVf9hwmYNC/TGCmgTWmBLTO/l83
 AjIVCSW8eSvBoEcpRhEoIRVifHUB+EyM9xCHAvApjMSCIadxIe5y2ysuhW5RcYa03oq+
 FHrvf+3cVEg9NQ3DhL+DVjgQJEg631uMSmyNShWOJyQQTr4ifMDjTf+xGxcisPv63AEj
 ZFvUJNcBhd4eOBKoTJTbVp/0moWDobeoztk5i6ladvEEQYkrD6P4ReacA9xTHUvIILSc
 J/xZ39lcsOBFRKign55UOxSXPt0OYFHBu1ROHhcIXAEB7j6SUqh1qyPBdSFX64N1rjUm
 dqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753066872; x=1753671672;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PeYY2jKAyAy50EIOGhDJneDUVR7+rcSPzU7tXyVM4cI=;
 b=Tr4oq238vJv/4Qm9e8iay/JRU+5TrgSQP6c9FbYAU4cDhe3/gwyZ03LkYZdC4zfk45
 wcbm/qj+Rr97o8sXaGX5cNrhA8cSv1P0Oc/q8noblD0Lm6aXmwZb9DGpwHVlN2sZhy76
 McG7JlWI2FRvguYFn8s4xo2jd6z5yWrcDZyGCqXBQ6cEw+TJzLG2Ww0gA9aUqGNCImdY
 X/v+NcnT1QVjs8KDaH3StlVlwH1tcjv9V/XM9k9xuLSi5Dp1el+y73SYtkLHT05ffItd
 BejbnsXKE591EoRJ8u9hFqn2zjBA+bFAVIlTkHG9oTDCFu2BMHJ/fPHaVnPYgMmOzgN3
 M7pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXuXlngrNYjGJUw5lbBzW0miskMiINDiLML6LHCSw8HQLc/4wpiAdp+B0O/daqxWYJ+nJ9EhnWo2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9yJEobzqin7bnFGAChvPy2gVQyEtrFjDLHR4Lh5Oj7BCpAEyw
 NotflQn+Yd14GQDpYLad3vFWvCptLQYsuxVKvvinhk9vJw3Q8acQC9BL
X-Gm-Gg: ASbGncvUMw5gFvGGvzM9DqYJVqiGTywLJ9VOs41j2lnC7XCBqB6vJUKO6CKQp7YYk5e
 NSYmYeysfvYYuL1sPEyw2cTVJAMdy80UY6PiVFqMXkF/2t8+NZbIvoYean77pKEF78dh+y0XN1E
 E+Q+Y1CUMrymA4iLcVhBgz/GtVK/zWioZbGZM+Y/Vuhri7lJldmYn+zQe3r7RJPbq9zxrcbExKz
 6Si03sJb2sdSd/T/u2tr5Tvm7zkAc3eo5/7rrwPqjkcGLW/Tdv2UGJqOkzBIuE6goEONAHzQZHG
 KfXNci2PPeN0uHmE2nwC/gd/94AH32DcCsUHPRBjbZhPoRV1hJ/J9RiusZ9oWUvkEw9w+zV8eXT
 dbf/oGvbBm4RLhyvqufyTsfmiY+uMmAvm1Bo6WRGkWUugr/6Slh2jZ4FBoFB9Tw==
X-Google-Smtp-Source: AGHT+IFd6in4Ljjr4Chv125IaWFenxnJyaEsPxcFgwcJQgdFu7icJMd47ni+dvmqnKYlNt3vXQqzgw==
X-Received: by 2002:a17:903:3c6c:b0:235:f51f:c9e4 with SMTP id
 d9443c01a7336-23e24f49430mr293789555ad.12.1753066872409; 
 Sun, 20 Jul 2025 20:01:12 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfdbdsm48264795ad.150.2025.07.20.20.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 20:01:11 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 21 Jul 2025 11:00:47 +0800
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-drm-v3-1-e16c3cee7263@gmail.com>
References: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
In-Reply-To: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753066865; l=1022;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=WtdyCfravtJ3C6cr9BsCQHMVzBkPbc+FvVAx7TfBckQ=;
 b=/KVfGhmhXsKbQxHILrMxwgmQADvojx+3YAMd0riKUvyPHZE/bfZSJ2QwZGppIJccY7aADaUfQ
 6YHGSYJjDJ3CEOCPT5d+EDyrnImZxf8ZjU8yz9/VwxQUf1/LHkFCu6f
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 21 Jul 2025 08:45:46 +0000
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

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..9207c25a3490a3aa5cc9d513290e7890799f92cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1

