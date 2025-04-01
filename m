Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54AA772DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 04:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4D210E239;
	Tue,  1 Apr 2025 02:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KLut0HYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B2B10E239
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 02:57:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2264aefc45dso127035945ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 19:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743476268; x=1744081068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7K/MRcRKPLOmFhBSAVzlJRL1mdc1WpbjpwfueJr4+Qk=;
 b=KLut0HYZMUbcoVj6e94q94cIF3G/yVYdnXVhqr6hZSnQag02r0IB6IEV49o3iGwX12
 Y+RBvRl+OAXX1z4ggUO9x/rT3dzIxmeH2qjBNuJSDjj6Iry049fKPLGohXD1PfxOa6J6
 ge78JeufBKbEnHNRvbqF7NjeKzK7lYUnk3YgQo3/wsdl5pdEv7m2wQDJWBDI2Gh2cc8d
 nkuDU3f2B2C9Ax4XQI2tgNozOoJKNM4g8b2Y3Y2pFiU2SU+3sc/z04xLdX6a6/+5piqf
 qGdZ+NXTiOou2K1khB75/c8Rq0lYSiLaYHFE3HT7MUlthI4ybPqtTpHGSqkEc9uFdFjd
 CwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743476268; x=1744081068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7K/MRcRKPLOmFhBSAVzlJRL1mdc1WpbjpwfueJr4+Qk=;
 b=ZGIICo1Qw2IAPrsbpHHibiGpswrGFtOk3gp6UJVWqNLL9Nkp3LnVlAZjAj/OyJH2R8
 5czp5CSYa3crqKuy20eKUo+k0Cz1ZyHLs0xxt6OZyJQpjovkZu5V1HW81zlAc7vbP74L
 kR0AlfiR4tO3sIAPBW1z/SEVaqM3UKZEqzxhsXGIiXtmV0db2KpuxBkB48tytxPdf/3x
 l06kb9DkCd1rl+dpE9dXgcX+SaPgPEHmI2FSEBVuiDfO/Ly9PoImMRVyrQ25FSA7nIvG
 kT+WUsOqWpF5Dqz2pOrdQCW1xfdc4BjRflunnFjzaA26TBYh2awV0SISetfp2q+/iTZf
 0ikA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd9GBqJPm9YVP1a/LLzrGYPuJVYbr8qP4sXxsKX0Fo0JGVfrv1iNzlX2QLTyRz9f/SltXMt4iyVUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxts+OWkFn0cSxE1hWJOpeEWGUhQnLEAtVy+45Aqcr3eANLGrWm
 gnso8JEbkSrWuVbqnIPtC+YnqSm7uCNkPuxgKBf2Y54cgx3rGoS7
X-Gm-Gg: ASbGncsJNUuvWsuLA7rCcDF/orzudlKX9XpVE5gsjmZrf02lGy7zxwf6ryxeK2KmyI2
 Pm8/4SQPoQJfT3VOTJOUXCoXTMhuXLwwU+4GM0tDGMlweUdf33DfMRw5ReA6bnCqRAbRudWMQRM
 L0jL/DGOwIaxOsD3tqUEHUbxJ/h1i6wXwMvpWuPwRpilyMbOZxGLKI/r3s+uXCj/gMUu4LE1Sk/
 hwS4yZOeDzTYzs5H7DFzijfluOrrNDW4Zbcm3GpFi83vfhK5c5XSHa3YVuwlRRzoSvOqdgPiG+k
 Vhe9EGiUfLTt+g9RUoyJkF8M86tclRQMn/JIKyeAq+2L6/XoyL3ZyOZp+eW08QZGS/dVizk=
X-Google-Smtp-Source: AGHT+IEjjmQRwbIrRjd0tFrbPz03cyNs3GgrsNuPX67Kbs2Wc+zU6hosOUnYOnmchj6ngZc6iNNlCw==
X-Received: by 2002:a05:6a21:920d:b0:1f5:84c8:5d03 with SMTP id
 adf61e73a8af0-2009f5ba5c5mr20479746637.3.1743476268430; 
 Mon, 31 Mar 2025 19:57:48 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73970deefa8sm7804425b3a.31.2025.03.31.19.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 19:57:47 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 10:57:37 +0800
Message-Id: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
wled_configure() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: Correct commit meessage and confirm this patch has considered
resource cleanup to avoid any subsequent issues, ensuring that errors
are handled properly and no resources are left in an inconsistent
state.
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1

